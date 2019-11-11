Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2827E995
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 07:43:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xAB7h6FG003104
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Nov 2019 23:43:06 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 10 Nov 2019 23:43:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 11 Nov 2019 15:43:04 +0800
Message-ID: <1573458184-19483-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573457996-19353-1-git-send-email-hongxu.jia@windriver.com>
References: <1573457996-19353-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4] gnupg-native: fix GPG homedir path length limit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Nov 2019 07:43:06 -0000
Content-Type: text/plain

The gpg uses unix socket to communicate with its agent, before doing that,
it checks whether the extra socketdir prefix (/tmp/gnupg,/run/,/var/run/gnupg,
/var/run) has proper permissions. If all these checking failed, it will
choose gpg homedir as prefix to create socketdir.

While using gpg in Yocto build, we usually set gpg homedir under build dir,
if homedir is too long (>100chars), gpg will fail due to unix socket path
length limit [1][2][3]

Yocto build usually does not have access permission on /run, /var/run, but it
may have permission on /tmp, so allows to build GnuPG with an extra socketdir
under /tmp/gnupg.

But Yocto build creates gpg socketdir through pseudo which makes the real uid
differs between different build (even different recipes in one build), so apply
fix to not require gpg socketdir to be owned by the user. Then multiple recipes
or builds could use the same socketdir prefix /tmp/gnupg.

Conversely, if /tmp/gnupg does not exist, or Yocto builds do not have permission
on /tmp, gpg uses homedir as usual. In other words, in order to fix GPG homedir
path length limit, the gpg user in Yocto build should not only apply this commit,
but also create the socket in the /tmp/gnupg directory: Make sure that
/tmp/gnupg/user/$(id -u) [4]

[1] https://dev.gnupg.org/rG17efcd2a2acdc3b7f00711272aa51e5be2476921
[2] https://lists.gnupg.org/pipermail/gnupg-users/2017-January/057444.html
[3] https://unix.stackexchange.com/questions/367008/why-is-socket-path-length-limited-to-a-hundred-chars
[4] https://lists.gnupg.org/pipermail/gnupg-users/2017-January/057451.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...uild-GnuPG-with-an-extra-socketdir-below-.patch | 51 ++++++++++++++++
 ...t-check-socketdir-to-be-owned-by-the-user.patch | 71 ++++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.2.17.bb         |  5 ++
 3 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/0001-allows-to-build-GnuPG-with-an-extra-socketdir-below-.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/0002-do-not-check-socketdir-to-be-owned-by-the-user.patch

diff --git a/meta/recipes-support/gnupg/gnupg/0001-allows-to-build-GnuPG-with-an-extra-socketdir-below-.patch b/meta/recipes-support/gnupg/gnupg/0001-allows-to-build-GnuPG-with-an-extra-socketdir-below-.patch
new file mode 100644
index 0000000..e255279
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0001-allows-to-build-GnuPG-with-an-extra-socketdir-below-.patch
@@ -0,0 +1,51 @@
+From 26358e491084f4a546ae1fcb71f0405a7b5cf575 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 9 Nov 2019 00:51:25 -0500
+Subject: [PATCH 1/2] allows to build GnuPG with an extra socketdir below
+ /tmp/gnupg
+
+Since upstream applied commit [17efcd2 build: New configure option
+--enable-run-gnupg-user-socket] [1], it allows to build GnuPG with an
+extra socketdir below /run.
+
+For Yocto build which does not have access permission on /run, it could
+not create the extra socketdir in /run/gnupg and uses homedir to replace.
+
+If homedir is too long(>100chars), gpg connect agent will fail [2][3]
+...
+|gpg: can't connect to the agent: File name too long
+...
+
+Yocto builds may have permission on /tmp on many hosts, so allows to build
+GnuPG with an extra socketdir below /tmp/gnupg.
+
+Conversely, if Yocto builds do not have permission on /tmp, it still uses homedir
+as usual;
+
+[1] https://dev.gnupg.org/rG17efcd2a2acdc3b7f00711272aa51e5be2476921
+[2] https://lists.gnupg.org/pipermail/gnupg-users/2017-January/057444.html
+[3] https://unix.stackexchange.com/questions/367008/why-is-socket-path-length-limited-to-a-hundred-chars
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ common/homedir.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common/homedir.c b/common/homedir.c
+index e9e75d0..9dd5f6c 100644
+--- a/common/homedir.c
++++ b/common/homedir.c
+@@ -574,7 +574,7 @@ _gnupg_socketdir_internal (int skip_checks, unsigned *r_info)
+ 
+   static const char * const bases[] = {
+ #ifdef USE_RUN_GNUPG_USER_SOCKET
+-    "/run/gnupg",
++    "/tmp/gnupg",
+ #endif
+     "/run",
+ #ifdef USE_RUN_GNUPG_USER_SOCKET
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/gnupg/gnupg/0002-do-not-check-socketdir-to-be-owned-by-the-user.patch b/meta/recipes-support/gnupg/gnupg/0002-do-not-check-socketdir-to-be-owned-by-the-user.patch
new file mode 100644
index 0000000..14ddedd
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0002-do-not-check-socketdir-to-be-owned-by-the-user.patch
@@ -0,0 +1,71 @@
+From 78bf195f85b42cc46ce875c1ae63090ac28cca75 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 9 Nov 2019 16:35:16 +0800
+Subject: [PATCH 2/2] do not check socketdir to be owned by the user
+
+The gpg uses unix socket to communicate with its agent, before doing that,
+it checks whether the extra socketdir prefix (/tmp/gnupg,/run/,/var/run/gnupg,
+/var/run) has proper permissions. If all these checking failed, it will
+choose gpg homedir to create socketdir prefix
+
+While using gpg in Yocto build, we usually set gpg homedir under build dir,
+if homedir is too long (>100chars), gpg will fail due to unix socket path
+length limit [1]
+
+To improve user experience which do not limit gpg homedir with a short path,
+Yocto build could use /tmp/gnupg as gpg socketdir prefix. But Yocto build
+creates gpg socketdir through pseudo which makes the real uid differs between
+different build (even different recipes in one build), so apply fix to not
+require gpg socketdir to be owned by the user. Then multiple recipes or builds
+could use the same socketdir prefix /tmp/gnupg.
+
+[1] https://unix.stackexchange.com/questions/367008/why-is-socket-path-length-limited-to-a-hundred-chars
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ common/homedir.c | 11 +----------
+ 1 file changed, 1 insertion(+), 10 deletions(-)
+
+diff --git a/common/homedir.c b/common/homedir.c
+index 9dd5f6c..d94e044 100644
+--- a/common/homedir.c
++++ b/common/homedir.c
+@@ -614,13 +614,6 @@ _gnupg_socketdir_internal (int skip_checks, unsigned *r_info)
+       goto leave;
+     }
+ 
+-  if (sb.st_uid != getuid ())
+-    {
+-      *r_info |= 4; /* Not owned by the user.  */
+-      if (!skip_checks)
+-        goto leave;
+-    }
+-
+   if (strlen (prefix) + 7 >= sizeof prefix)
+     {
+       *r_info |= 1; /* Ooops: Buffer too short to append "/gnupg".  */
+@@ -649,10 +642,9 @@ _gnupg_socketdir_internal (int skip_checks, unsigned *r_info)
+           goto leave;
+         }
+     }
+-  /* Check that it is a directory, owned by the user, and only the
++  /* Check that it is a directory, and only the
+    * user has permissions to use it.  */
+   if (!S_ISDIR(sb.st_mode)
+-      || sb.st_uid != getuid ()
+       || (sb.st_mode & (S_IRWXG|S_IRWXO)))
+     {
+       *r_info |= 4; /* Bad permissions or not a directory. */
+@@ -719,7 +711,6 @@ _gnupg_socketdir_internal (int skip_checks, unsigned *r_info)
+             }
+         }
+       else if (!S_ISDIR(sb.st_mode)
+-               || sb.st_uid != getuid ()
+                || (sb.st_mode & (S_IRWXG|S_IRWXO)))
+         {
+           *r_info |= 8; /* Bad permissions or subdir is not a directory.  */
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.17.bb b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
index bb8885f..79db8f0 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
@@ -17,6 +17,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            "
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
+                                file://0001-allows-to-build-GnuPG-with-an-extra-socketdir-below-.patch \
+                                file://0002-do-not-check-socketdir-to-be-owned-by-the-user.patch \
                                 file://relocate.patch"
 
 SRC_URI[md5sum] = "1ba2d9b70c377f8e967742064c27a19c"
@@ -29,6 +31,9 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-readline=${STAGING_LIBDIR}/.. \
 		--enable-gpg-is-gpg2 \
                "
+EXTRA_OECONF_append_class-native = " \
+       --enable-run-gnupg-user-socket \
+"
 
 # A minimal package containing just enough to run gpg+gpgagent (E.g. use gpgme in opkg)
 PACKAGES =+ "${PN}-gpg"
-- 
2.7.4


