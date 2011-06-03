Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QST1Z-0006Tj-Cf for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 13:58:45 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QSSyU-0003ah-SO
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 13:55:34 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 03 Jun 2011 12:55:33 +0100
Message-ID: <1307102133.2529.260.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Fri, 03 Jun 2011 11:58:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is no good reason for uclibc to be machine specific.  Remove local
assignment to PACKAGE_ARCH so that it gets the default target
architecture and bump PR for that change.

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/003064.html

Also replace a chunk of anonymous python with a COMPATIBLE_HOST
declaration.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 .../uclibc/uclibc-git/epoll-asm-fix.patch          |   20 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc.inc                |   12 +-----------
 meta/recipes-core/uclibc/uclibc_git.bb             |    5 ++---
 3 files changed, 23 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch b/meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch
new file mode 100644
index 0000000..6129081
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch
@@ -0,0 +1,20 @@
+diff --git a/libc/sysdeps/linux/common/epoll.c b/libc/sysdeps/linux/common/epoll.c
+index 85b0cfd..c034b2c 100644
+--- a/libc/sysdeps/linux/common/epoll.c
++++ b/libc/sysdeps/linux/common/epoll.c
+@@ -67,12 +67,13 @@ extern __typeof(epoll_pwait) __libc_epoll_pwait;
+ int __libc_epoll_pwait(int epfd, struct epoll_event *events, int maxevents,
+ 						int timeout, const sigset_t *set)
+ {
++	int nsig = _NSIG / 8;
+ 	if (SINGLE_THREAD_P)
+-		return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, _NSIG / 8);
++		return INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, nsig);
+ # ifdef __UCLIBC_HAS_THREADS_NATIVE__
+ 	else {
+ 		int oldtype = LIBC_CANCEL_ASYNC ();
+-		int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, _NSIG / 8);
++		int result = INLINE_SYSCALL(epoll_pwait, 6, epfd, events, maxevents, timeout, set, nsig);
+ 		LIBC_CANCEL_RESET (oldtype);
+ 		return result;
+ 	}
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index c1bc422..a2c6ee5 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -36,21 +36,11 @@ cp ${SYSROOT_DESTDIR}${libdir}/libc.so ${WORKDIR}/site_config_libc; \
 sed -i -e 's# ${base_libdir}# ${SYSROOT_DESTDIR}${base_libdir}#g' -e 's# ${libdir}# ${SYSROOT_DESTDIR}${libdir}#g' ${WORKDIR}/site_config_libc/libc.so; \
 "
 
-#
 # For now, we will skip building of a gcc package if it is a uclibc one
 # and our build is not a uclibc one, and we skip a glibc one if our build
 # is a uclibc build.
-#
-# See the note in gcc/gcc_3.4.0.oe
-#
+COMPATIBLE_HOST = ".*-uclibc.*"
 
-python __anonymous () {
-    import bb, re
-    uc_os = (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, 1)) != None)
-    if not uc_os:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   bb.data.getVar('TARGET_OS', d, 1))
-}
 PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            virtual/${TARGET_PREFIX}gcc-intermediate \
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index eded2fb..33c6ec8 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -2,11 +2,9 @@ SRCREV="71d63ed75648da9b0b71afabb9c60aaad792c55c"
 
 require uclibc.inc
 PV = "0.9.31+0.9.32rc3"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
-#recent versions uclibc require real kernel headers
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
@@ -29,5 +27,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://remove_attribute_optimize_Os.patch \
 	file://append_UCLIBC_EXTRA_CFLAGS.patch \
 	file://compile-arm-fork-with-O2.patch \
+	file://epoll-asm-fix.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.2.5





