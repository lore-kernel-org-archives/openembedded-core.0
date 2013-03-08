Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UDlTl-0002bJ-9A
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 01:48:20 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 01:31:24 +0100
Message-Id: <1362702684-23585-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] strace: fix kernel release string parsing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 00:48:22 -0000

* Strace just aborts with two-digit kernel versions (e.g. 3.0-foo).
  Backport a patch from strace Git.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../0032-Fix-kernel-release-string-parsing.patch   |   38 ++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.7.bb         |    3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/strace/strace-4.7/0032-Fix-kernel-release-string-parsing.patch

diff --git a/meta/recipes-devtools/strace/strace-4.7/0032-Fix-kernel-release-string-parsing.patch b/meta/recipes-devtools/strace/strace-4.7/0032-Fix-kernel-release-string-parsing.patch
new file mode 100644
index 0000000..cef4222
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace-4.7/0032-Fix-kernel-release-string-parsing.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Backport
+
+From 0dbc80de895c25769791b7726022a274695eec31 Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Mon, 14 May 2012 23:42:10 +0000
+Subject: [PATCH] Fix kernel release string parsing
+
+* strace.c (get_os_release): Handle "X.Y-something" utsname.release
+strings properly.
+
+Reported-by: Bryce Gibson <bryce@gibson-consulting.com.au>
+---
+ strace.c |    8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/strace.c b/strace.c
+index 857136d..65dee7d 100644
+--- a/strace.c
++++ b/strace.c
+@@ -1432,8 +1432,14 @@ get_os_release(void)
+ 			break;
+ 		while (*p >= '0' && *p <= '9')
+ 			p++;
+-		if (*p != '.')
++		if (*p != '.') {
++			if (rel >= KERNEL_VERSION(0,1,0)) {
++				/* "X.Y-something" means "X.Y.0" */
++				rel <<= 8;
++				break;
++			}
+ 			error_msg_and_die("Bad OS release string: '%s'", u.release);
++		}
+ 		p++;
+ 	}
+ 	return rel;
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/strace/strace_4.7.bb b/meta/recipes-devtools/strace/strace_4.7.bb
index 2d56e9a..e360e63 100644
--- a/meta/recipes-devtools/strace/strace_4.7.bb
+++ b/meta/recipes-devtools/strace/strace_4.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=124500c21e856f0912df29295ba104c7"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch \
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0029-Filter-out-redundant-32-ioctl-entries.patch \
            file://0030-Move-asm-generic-ioctl-definitions-to-linux-ioctlent.patch \
            file://0031-Add-support-for-tracing-32-bit-ARM-EABI-binaries-on-.patch \
+           file://0032-Fix-kernel-release-string-parsing.patch \
           "
 
 SRC_URI[md5sum] = "6054c3880a00c6703f83b57f15e04642"
-- 
1.7.10.4



