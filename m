Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0ZuY-0001fg-9g
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:44:46 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEm6GR003009 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:07 GMT
X-Quarantine-ID: <B4M5Wl4I6+Zc>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id B4M5Wl4I6+Zc
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:06 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEm4Fn002998
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:05 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0Ysc-0004GG-8l
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 13:38:42 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:38:14 +0000
Message-Id: <2cc80c00f5f43463d926170dfbc7cd1ec8089ff8.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/16] readline: Add a patch to remove the redundant rpath linker option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 14:44:59 -0000

This resolves the QA warnings:

WARNING: QA Issue: readline: /work/x86_64-poky-linux/readline-6.2-r0/packages-split/readline/usr/lib/libhistory.so.6.2 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: /work/x86_64-poky-linux/readline-6.2-r0/packages-split/readline/usr/lib/libreadline.so.6.2 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: /work/x86_64-poky-linux/readline-6.2-r0/packages-split/readline/usr/lib/libreadline.so.6 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: readline: /work/x86_64-poky-linux/readline-6.2-r0/packages-split/readline/usr/lib/libhistory.so.6 contains probably-redundant RPATH /usr/lib

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/readline/files/norpath.patch |   21 +++++++++++++++++++++
 meta/recipes-core/readline/readline.inc        |    1 +
 meta/recipes-core/readline/readline_6.2.bb     |    2 +-
 3 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/readline/files/norpath.patch

diff --git a/meta/recipes-core/readline/files/norpath.patch b/meta/recipes-core/readline/files/norpath.patch
new file mode 100644
index 0000000..5d71582
--- /dev/null
+++ b/meta/recipes-core/readline/files/norpath.patch
@@ -0,0 +1,21 @@
+This support script ends up hardcoding unnecessary rpaths into the libraries. We
+will search $libdir automatically so this is just wastes space. There may be some
+cases this is necessary but our use cases aren't one of them.
+
+Upstream-Status: Inappropriate
+
+RP 2012/2/23
+
+Index: readline-6.2/support/shobj-conf
+===================================================================
+--- readline-6.2.orig/support/shobj-conf	2012-02-23 11:06:37.193179379 +0000
++++ readline-6.2/support/shobj-conf	2012-02-23 11:06:50.049178918 +0000
+@@ -114,7 +114,7 @@
+ 	SHOBJ_LD='${CC}'
+ 	SHOBJ_LDFLAGS='-shared -Wl,-soname,$@'
+ 
+-	SHLIB_XLDFLAGS='-Wl,-rpath,$(libdir) -Wl,-soname,`basename $@ $(SHLIB_MINOR)`'
++	SHLIB_XLDFLAGS='-Wl,-soname,`basename $@ $(SHLIB_MINOR)`'
+ 	SHLIB_LIBVERSION='$(SHLIB_LIBSUFF).$(SHLIB_MAJOR)$(SHLIB_MINOR)'
+ 	;;
+ 
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 743d8b3..2e9c6b1 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -12,6 +12,7 @@ DEPENDS += "ncurses"
 
 SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz \
            file://configure-fix.patch \
+           file://norpath.patch \
            file://acinclude.m4"
 
 S = "${WORKDIR}/${BPN}-${PV}"
diff --git a/meta/recipes-core/readline/readline_6.2.bb b/meta/recipes-core/readline/readline_6.2.bb
index 5e32bb5..e6f330d 100644
--- a/meta/recipes-core/readline/readline_6.2.bb
+++ b/meta/recipes-core/readline/readline_6.2.bb
@@ -1,6 +1,6 @@
 require readline.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "67948acb2ca081f23359d0256e9a271c"
 SRC_URI[sha256sum] = "79a696070a058c233c72dd6ac697021cc64abd5ed51e59db867d66d196a89381"
-- 
1.7.5.4



