Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8D09F7319F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739823"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:38 +0200
Message-Id: <829c351f83e3afe818c20903d786c45164b90184.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/17] cryptodev: update to 1.8
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:20 -0000

Drop 0001-ioctl.c-Fix-build-on-3.19.patch and
0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch, the code
has been fixed upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...yptodev-linux_1.7.bb => cryptodev-linux_1.8.bb} |  2 +-
 ...todev-module_1.7.bb => cryptodev-module_1.8.bb} |  3 +--
 ...yptodev-tests_1.7.bb => cryptodev-tests_1.8.bb} |  3 +--
 .../cryptodev/{cryptodev_1.7.inc => cryptodev.inc} |  4 +--
 .../files/0001-ioctl.c-Fix-build-on-3.19.patch     | 29 ----------------------
 ...ests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch | 29 ----------------------
 6 files changed, 5 insertions(+), 65 deletions(-)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.7.bb => cryptodev-linux_1.8.bb} (91%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.7.bb => cryptodev-module_1.8.bb} (83%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.7.bb => cryptodev-tests_1.8.bb} (79%)
 rename meta/recipes-kernel/cryptodev/{cryptodev_1.7.inc => cryptodev.inc} (66%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-on-3.19.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.7.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.8.bb
similarity index 91%
rename from meta/recipes-kernel/cryptodev/cryptodev-linux_1.7.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.8.bb
index a33841d..c55577c 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.7.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.8.bb
@@ -1,4 +1,4 @@
-require cryptodev_${PV}.inc
+require cryptodev.inc
 
 SUMMARY = "A /dev/crypto device driver header file"
 
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.7.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.8.bb
similarity index 83%
rename from meta/recipes-kernel/cryptodev/cryptodev-module_1.7.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-module_1.8.bb
index 5cd52eb..552eb6a 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.7.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.8.bb
@@ -1,4 +1,4 @@
-require cryptodev_${PV}.inc
+require cryptodev.inc
 
 SUMMARY = "A /dev/crypto device driver kernel module"
 
@@ -9,7 +9,6 @@ DEPENDS += "cryptodev-linux"
 
 SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
-file://0001-ioctl.c-Fix-build-on-3.19.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.8.bb
similarity index 79%
rename from meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-tests_1.8.bb
index f1ca36e..c400524 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.8.bb
@@ -1,4 +1,4 @@
-require cryptodev_${PV}.inc
+require cryptodev.inc
 
 SUMMARY = "A test suite for /dev/crypto device driver"
 
@@ -6,7 +6,6 @@ DEPENDS += "openssl"
 
 SRC_URI += " \
 file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
-file://0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.7.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
similarity index 66%
rename from meta/recipes-kernel/cryptodev/cryptodev_1.7.inc
rename to meta/recipes-kernel/cryptodev/cryptodev.inc
index cca6925..ade7ef9 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev_1.7.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0b63b3481cf2c90386b35f057481d36b"
-SRC_URI[sha256sum] = "41880533b53de4d7b3f054e230f576988dafb8eed7bef5ebcf6422bb2e3a3b25"
+SRC_URI[md5sum] = "02644cc4cd02301e0b503a332eb2f0b5"
+SRC_URI[sha256sum] = "67fabde9fb67b286a96c4f45b594b0eccd0f761b495705c18f2ae9461b831376"
 
 S = "${WORKDIR}/cryptodev-linux-${PV}"
 
diff --git a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-on-3.19.patch b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-on-3.19.patch
deleted file mode 100644
index 74c8972..0000000
--- a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-on-3.19.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7d71124991030f99965e6e6aaed421115f185adb Mon Sep 17 00:00:00 2001
-From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-Date: Mon, 9 Feb 2015 13:51:56 +0100
-Subject: [PATCH] ioctl.c: Fix build on 3.19
-
-get_unused_fd() MACRO has been removed on kernel 3.19. Replace by the
-actual output of the macro.
-
-Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
----
- ioctl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ioctl.c b/ioctl.c
-index f26cf93..cf8cc17 100644
---- a/ioctl.c
-+++ b/ioctl.c
-@@ -529,7 +529,7 @@ static int
- clonefd(struct file *filp)
- {
- 	int ret;
--	ret = get_unused_fd();
-+	ret = get_unused_fd_flags(0);
- 	if (ret >= 0) {
- 			get_file(filp);
- 			fd_install(ret, filp);
--- 
-2.1.4
-
diff --git a/meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch b/meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
deleted file mode 100644
index f5ab8b4..0000000
--- a/meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 47ff1eb9bb4f872c1d731b93d334ee5865bf3439 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 6 Apr 2014 22:16:30 -0400
-Subject: [PATCH] Fix tests Makefile usage of LDLIBS vs. LDFLAGS
-
-Libraries must come after objects, as link order matters, especially
-when using linker flags like -Wl,--as-needed.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-
-Upstream-Status: Pending
----
- tests/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/Makefile b/tests/Makefile
-index cd202af..67c3c83 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -39,5 +39,5 @@ testprogs: $(hostprogs)
- clean:
- 	rm -f *.o *~ $(hostprogs)
- 
--${comp_progs}: LDFLAGS += -lssl -lcrypto
-+${comp_progs}: LDLIBS += -lssl -lcrypto
- ${comp_progs}: %: %.o openssl_wrapper.o
--- 
-1.9.1
-
-- 
2.6.2


