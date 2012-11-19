Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TaWfk-0004Hd-2B
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 20:06:20 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 9FD45D20DC;
	Mon, 19 Nov 2012 19:52:26 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 19:52:09 +0100
Message-Id: <1353351129-7108-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] strace: backport AArch64 support
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
X-List-Received-Date: Mon, 19 Nov 2012 19:06:20 -0000

This changeset updates existing OE patches to commits from upstream git
tree and adds everything needed to get AArch64 support working.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 ...lding-when-glibc-has-a-stub-process_vm_r.patch} | 28 ++++++++++++----------
 ...2.patch => 0014-x32-update-syscall-table.patch} | 21 +++++++++-------
 meta/recipes-devtools/strace/strace_4.7.bb         | 15 +++++++++---
 3 files changed, 39 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/strace/strace-4.7/{strace-eglibc-2.16.patch => 0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch} (75%)
 rename meta/recipes-devtools/strace/strace-4.7/{strace-x32.patch => 0014-x32-update-syscall-table.patch} (87%)

diff --git a/meta/recipes-devtools/strace/strace-4.7/strace-eglibc-2.16.patch b/meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch
similarity index 75%
rename from meta/recipes-devtools/strace/strace-4.7/strace-eglibc-2.16.patch
rename to meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch
index 67cf4e8..19bed45 100644
--- a/meta/recipes-devtools/strace/strace-4.7/strace-eglibc-2.16.patch
+++ b/meta/recipes-devtools/strace/strace-4.7/0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch
@@ -1,11 +1,10 @@
-Upstream-Status: Backport
+Upstream-status: Backport
 
-https://bugs.gentoo.org/414637
-
-From 302e8ec6cd62912a3cd6494ce6702f4ad8dae0e2 Mon Sep 17 00:00:00 2001
+From 24ee60b836ad33bb4ac694ca99d6c94a8cc5ff92 Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@gentoo.org>
-Date: Fri, 4 May 2012 19:30:59 -0400
-Subject: [PATCH] util: fix building when glibc has a stub process_vm_readv
+Date: Fri, 4 May 2012 19:37:29 -0400
+Subject: [PATCH 03/31] util: fix building when glibc has a stub
+ process_vm_readv
 
 If you have a newer glibc which provides process_vm_readv, but it is built
 against older kernel headers which lack __NR_process_vm_readv, the library
@@ -25,14 +24,14 @@ callers all hit the right place.
 
 Signed-off-by: Mike Frysinger <vapier@gentoo.org>
 ---
- util.c |    4 +++-
+ util.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-Index: strace-4.7/util.c
-===================================================================
---- strace-4.7.orig/util.c	2012-04-28 05:58:35.000000000 -0700
-+++ strace-4.7/util.c	2012-07-11 11:07:47.869825001 -0700
-@@ -735,7 +735,8 @@
+diff --git a/util.c b/util.c
+index d347bd8..f27acdf 100644
+--- a/util.c
++++ b/util.c
+@@ -735,7 +735,8 @@ static bool process_vm_readv_not_supported = 0;
  
  #if defined(__NR_process_vm_readv)
  static bool process_vm_readv_not_supported = 0;
@@ -42,7 +41,7 @@ Index: strace-4.7/util.c
  		 const struct iovec *lvec,
  		 unsigned long liovcnt,
  		 const struct iovec *rvec,
-@@ -744,6 +745,7 @@
+@@ -744,6 +745,7 @@ static ssize_t process_vm_readv(pid_t pid,
  {
  	return syscall(__NR_process_vm_readv, (long)pid, lvec, liovcnt, rvec, riovcnt, flags);
  }
@@ -50,3 +49,6 @@ Index: strace-4.7/util.c
  #else
  static bool process_vm_readv_not_supported = 1;
  # define process_vm_readv(...) (errno = ENOSYS, -1)
+-- 
+1.8.0
+
diff --git a/meta/recipes-devtools/strace/strace-4.7/strace-x32.patch b/meta/recipes-devtools/strace/strace-4.7/0014-x32-update-syscall-table.patch
similarity index 87%
rename from meta/recipes-devtools/strace/strace-4.7/strace-x32.patch
rename to meta/recipes-devtools/strace/strace-4.7/0014-x32-update-syscall-table.patch
index 3dc69b2..bac9f1a 100644
--- a/meta/recipes-devtools/strace/strace-4.7/strace-x32.patch
+++ b/meta/recipes-devtools/strace/strace-4.7/0014-x32-update-syscall-table.patch
@@ -1,9 +1,9 @@
-Upstream-Status: Pending
+Upstream-status: Backport
 
-m 364ed4f14c5edb5ddbc79c72d22498219033b29d Mon Sep 17 00:00:00 2001
+From d7df59197d406b14af21cbc734d286c27108e2db Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@gentoo.org>
-Date: Mon, 4 Jun 2012 13:19:42 -0400
-Subject: [PATCH] x32: update syscall table
+Date: Mon, 4 Jun 2012 14:01:59 -0400
+Subject: [PATCH 14/31] x32: update syscall table
 
 This syncs with the syscall table as it is in linux 3.4.
 
@@ -15,13 +15,13 @@ This syncs with the syscall table as it is in linux 3.4.
 
 Signed-off-by: Mike Frysinger <vapier@gentoo.org>
 ---
- linux/x32/syscallent.h |   24 ++++++++++++------------
+ linux/x32/syscallent.h | 24 ++++++++++++------------
  1 file changed, 12 insertions(+), 12 deletions(-)
 
-Index: strace-4.7/linux/x32/syscallent.h
-===================================================================
---- strace-4.7.orig/linux/x32/syscallent.h	2012-04-16 04:00:01.000000000 -0700
-+++ strace-4.7/linux/x32/syscallent.h	2012-07-11 11:08:00.285824906 -0700
+diff --git a/linux/x32/syscallent.h b/linux/x32/syscallent.h
+index fcb6a23..ee4c4ce 100644
+--- a/linux/x32/syscallent.h
++++ b/linux/x32/syscallent.h
 @@ -57,7 +57,7 @@
  	{ 5,	TP,	sys_clone,		"clone"		},  /* 56 */
  	{ 0,	TP,	sys_fork,		"fork"		},  /* 57 */
@@ -86,3 +86,6 @@ Index: strace-4.7/linux/x32/syscallent.h
 -	{ 6,	0,	sys_process_vm_writev,	"process_vm_writev"}, /* 540 */
 +	{ 6,	0,	sys_process_vm_readv,	"process_vm_readv" }, /* 539 */
 +	{ 6,	0,	sys_process_vm_writev,	"process_vm_writev" }, /* 540 */
+-- 
+1.8.0
+
diff --git a/meta/recipes-devtools/strace/strace_4.7.bb b/meta/recipes-devtools/strace/strace_4.7.bb
index e1a5e82..2d56e9a 100644
--- a/meta/recipes-devtools/strace/strace_4.7.bb
+++ b/meta/recipes-devtools/strace/strace_4.7.bb
@@ -3,11 +3,20 @@ HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=124500c21e856f0912df29295ba104c7"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
-           file://strace-eglibc-2.16.patch \
-           file://strace-x32.patch \
+           file://0003-util-fix-building-when-glibc-has-a-stub-process_vm_r.patch \
+           file://0014-x32-update-syscall-table.patch \
+           file://0018-x32-update-g-s-etsockopt-syscall-numbers.patch \
+           file://0024-x32-add-64bit-annotation-too.patch \
+           file://0025-Add-e-trace-memory-option.patch \
+           file://0026-linux-add-new-errno-values-for-EPROBE_DEFER-and-EOPE.patch \
+           file://0027-Add-AArch64-support-to-strace.patch \
+           file://0028-Enhance-quotactl-decoding.patch \
+           file://0029-Filter-out-redundant-32-ioctl-entries.patch \
+           file://0030-Move-asm-generic-ioctl-definitions-to-linux-ioctlent.patch \
+           file://0031-Add-support-for-tracing-32-bit-ARM-EABI-binaries-on-.patch \
           "
 
 SRC_URI[md5sum] = "6054c3880a00c6703f83b57f15e04642"
-- 
1.8.0



