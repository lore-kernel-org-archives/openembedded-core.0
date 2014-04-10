Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id B100265D65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 17:55:32 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3T00A78TSL2100@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 10 Apr 2014 12:55:33 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6127D20396; Thu,
	10 Apr 2014 13:55:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2014 13:55:27 -0400
Message-id: <1397152528-16715-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.1
In-reply-to: <1397152528-16715-1-git-send-email-denis@denix.org>
References: <1397152528-16715-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2 3/4] cryptodev-module: recipe for out-of-tree cryptodev device driver
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
X-List-Received-Date: Thu, 10 Apr 2014 17:55:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Depends on cryptodev-linux for providing a header file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - add patch to fix INIT_COMPLETION rename in 3.13+ kernels

 .../cryptodev/cryptodev-module_1.6.bb              | 18 +++++
 ...talling-header-file-provided-by-another-p.patch | 28 +++++++
 ...-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch | 86 ++++++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
 create mode 100644 meta/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
new file mode 100644
index 0000000..df50e5a
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
@@ -0,0 +1,18 @@
+require cryptodev_${PV}.inc
+
+SUMMARY = "A /dev/crypto device driver kernel module"
+
+inherit module
+
+# Header file provided by a separate package
+DEPENDS += "cryptodev-linux"
+
+SRC_URI += " \
+file://0001-Disable-installing-header-file-provided-by-another-p.patch \
+file://0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch \
+"
+
+EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
+
+RCONFLICTS_${PN} = "ocf-linux"
+RREPLACES_${PN} = "ocf-linux"
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
new file mode 100644
index 0000000..a580fc6
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
@@ -0,0 +1,28 @@
+From 8a884f55bd1527baa82fab68c186ba546273860c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 6 Apr 2014 19:51:39 -0400
+Subject: [PATCH] Disable installing header file provided by another package
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+
+Upstream-Status: Inappropriate [ OE specific ]
+---
+ Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d66ef26..8e97c6a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -23,8 +23,6 @@ install: modules_install
+ 
+ modules_install:
+ 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules_install
+-	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
+-	@install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h
+ 
+ clean:
+ 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch b/meta/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
new file mode 100644
index 0000000..c5c7ec7
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
@@ -0,0 +1,86 @@
+From 57b5544de80db85c8955499831fdaa30829db77a Mon Sep 17 00:00:00 2001
+From: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
+Date: Thu, 23 Jan 2014 03:40:00 +0100
+Subject: [PATCH] In the 3.13-rc1 Linux kernel, the INIT_COMPLETION macro has
+ been replaced with an inline function, reinit_completion [1][2]. We are
+ currently using the 3.13-rc3 Linux kernel, which leads to the following
+ error:
+
+cryptlib.c:279:2: error: implicit declaration of function 'INIT_COMPLETION' [-Werror=implicit-function-declaration]
+  INIT_COMPLETION(cdata->async.result->completion);
+
+[1] https://github.com/torvalds/linux/commit/c32f74ab2872994bc8336ed367313da3139350ca
+[2] https://github.com/torvalds/linux/commit/62026aedaacedbe1ffe94a3599ad4acd8ecdf587
+
+Signed-off-by: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
+Reviewed-by: Cristian Stoica <cristian.stoica@freescale.com>
+Tested-by: Cristian Stoica <cristian.stoica@freescale.com>
+Signed-off-by: Horia Geanta <horia.geanta@freescale.com>
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+
+Upstream-Status: Backport
+---
+ cryptlib.c      | 8 ++++----
+ cryptodev_int.h | 6 ++++++
+ 2 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/cryptlib.c b/cryptlib.c
+index 54d5d41..a923c14 100644
+--- a/cryptlib.c
++++ b/cryptlib.c
+@@ -217,7 +217,7 @@ ssize_t cryptodev_cipher_encrypt(struct cipher_data *cdata,
+ {
+ 	int ret;
+ 
+-	INIT_COMPLETION(cdata->async.result->completion);
++	reinit_completion(&cdata->async.result->completion);
+ 
+ 	if (cdata->aead == 0) {
+ 		ablkcipher_request_set_crypt(cdata->async.request,
+@@ -240,7 +240,7 @@ ssize_t cryptodev_cipher_decrypt(struct cipher_data *cdata,
+ {
+ 	int ret;
+ 
+-	INIT_COMPLETION(cdata->async.result->completion);
++	reinit_completion(&cdata->async.result->completion);
+ 	if (cdata->aead == 0) {
+ 		ablkcipher_request_set_crypt(cdata->async.request,
+ 			(struct scatterlist *)src, dst,
+@@ -351,7 +351,7 @@ ssize_t cryptodev_hash_update(struct hash_data *hdata,
+ {
+ 	int ret;
+ 
+-	INIT_COMPLETION(hdata->async.result->completion);
++	reinit_completion(&hdata->async.result->completion);
+ 	ahash_request_set_crypt(hdata->async.request, sg, NULL, len);
+ 
+ 	ret = crypto_ahash_update(hdata->async.request);
+@@ -363,7 +363,7 @@ int cryptodev_hash_final(struct hash_data *hdata, void* output)
+ {
+ 	int ret;
+ 
+-	INIT_COMPLETION(hdata->async.result->completion);
++	reinit_completion(&hdata->async.result->completion);
+ 	ahash_request_set_crypt(hdata->async.request, NULL, output, 0);
+ 
+ 	ret = crypto_ahash_final(hdata->async.request);
+diff --git a/cryptodev_int.h b/cryptodev_int.h
+index 12dd5b1..188063d 100644
+--- a/cryptodev_int.h
++++ b/cryptodev_int.h
+@@ -2,6 +2,12 @@
+ #ifndef CRYPTODEV_INT_H
+ # define CRYPTODEV_INT_H
+ 
++#include <linux/version.h>
++
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))
++#  define reinit_completion(x) INIT_COMPLETION(*(x))
++#endif
++
+ #include <linux/init.h>
+ #include <linux/sched.h>
+ #include <linux/fs.h>
+-- 
+1.9.1
+
-- 
1.9.1


