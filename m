Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A4E4B73D0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:09:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89OUb014558
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:09:25 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 01:09:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2015 01:09:20 -0700
Message-ID: <2da409ec2d65cb16d448df779a289440c118f77d.1429517334.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429517334.git.liezhi.yang@windriver.com>
References: <cover.1429517334.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] cryptodev: 1.6 -> 1.7
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:23 -0000
Content-Type: text/plain

* Remove 0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
  since it was a backported patch.

* Updated 0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...yptodev-linux_1.6.bb => cryptodev-linux_1.7.bb} |    4 +-
 ...todev-module_1.6.bb => cryptodev-module_1.7.bb} |    1 -
 ...yptodev-tests_1.6.bb => cryptodev-tests_1.7.bb} |    0
 .../{cryptodev_1.6.inc => cryptodev_1.7.inc}       |    4 +-
 ...pile-and-install-rules-for-cryptodev-test.patch |   23 +++---
 ...-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch |   86 --------------------
 6 files changed, 13 insertions(+), 105 deletions(-)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.6.bb => cryptodev-linux_1.7.bb} (92%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.6.bb => cryptodev-module_1.7.bb} (85%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.6.bb => cryptodev-tests_1.7.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev_1.6.inc => cryptodev_1.7.inc} (66%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.7.bb
similarity index 92%
rename from meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.7.bb
index 43f58f3..a33841d 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.7.bb
@@ -2,9 +2,7 @@ require cryptodev_${PV}.inc
 
 SUMMARY = "A /dev/crypto device driver header file"
 
-do_compile() {
-	:
-}
+do_compile[noexec] = "1"
 
 # Just install cryptodev.h which is the only header file needed to be exported
 do_install() {
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.7.bb
similarity index 85%
rename from meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-module_1.7.bb
index e6b1025..5cd52eb 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.7.bb
@@ -9,7 +9,6 @@ DEPENDS += "cryptodev-linux"
 
 SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
-file://0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch \
 file://0001-ioctl.c-Fix-build-on-3.19.patch \
 "
 
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc b/meta/recipes-kernel/cryptodev/cryptodev_1.7.inc
similarity index 66%
rename from meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
rename to meta/recipes-kernel/cryptodev/cryptodev_1.7.inc
index 6a93a35..cca6925 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev_1.7.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "eade38998313c25fd7934719cdf8a2ea"
-SRC_URI[sha256sum] = "75f1425c8ea1f8cae523905a5a046a35092327a6152800b0b86efc4e56fb3e2f"
+SRC_URI[md5sum] = "0b63b3481cf2c90386b35f057481d36b"
+SRC_URI[sha256sum] = "41880533b53de4d7b3f054e230f576988dafb8eed7bef5ebcf6422bb2e3a3b25"
 
 S = "${WORKDIR}/cryptodev-linux-${PV}"
 
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch b/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
index cb871f6..3f0298b 100644
--- a/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
+++ b/meta/recipes-kernel/cryptodev/files/0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch
@@ -15,12 +15,12 @@ Upstream-Status: Pending
  2 files changed, 14 insertions(+), 0 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 2be8825..4cbb865 100644
+index 31c4b3f..2ecf2a9 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -17,6 +17,9 @@ install:
- 	@echo "Installing cryptodev.h in /usr/include/crypto ..."
- 	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
+@@ -34,6 +34,9 @@ modules_install:
+ 	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
+ 	@install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h
  
 +install_tests:
 +	make -C tests install DESTDIR=$(PREFIX)
@@ -28,18 +28,18 @@ index 2be8825..4cbb865 100644
  clean:
  	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
  	rm -f $(hostprogs) *~
-@@ -25,6 +28,9 @@ clean:
+@@ -42,6 +45,9 @@ clean:
  check:
- 	KERNEL_DIR=$(KERNEL_DIR) make -C tests check
+ 	CFLAGS=$(CRYPTODEV_CFLAGS) KERNEL_DIR=$(KERNEL_DIR) make -C tests check
  
 +testprogs:
 +	KERNEL_DIR=$(KERNEL_DIR) make -C tests testprogs
 +
- FILEBASE = cryptodev-linux-$(VERSION)
- TMPDIR ?= /tmp
- OUTPUT = $(FILEBASE).tar.gz
+ CPOPTS =
+ ifneq (${SHOW_TYPES},)
+ CPOPTS += --show-types
 diff --git a/tests/Makefile b/tests/Makefile
-index 87ca3c7..0488cf6 100644
+index c9f04e8..cd202af 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
 @@ -19,6 +19,12 @@ example-async-hmac-objs := async_hmac.o
@@ -64,6 +64,3 @@ index 87ca3c7..0488cf6 100644
  clean:
  	rm -f *.o *~ $(hostprogs)
  
--- 
-1.7.5.4
-
diff --git a/meta/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch b/meta/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
deleted file mode 100644
index c5c7ec7..0000000
--- a/meta/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 57b5544de80db85c8955499831fdaa30829db77a Mon Sep 17 00:00:00 2001
-From: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
-Date: Thu, 23 Jan 2014 03:40:00 +0100
-Subject: [PATCH] In the 3.13-rc1 Linux kernel, the INIT_COMPLETION macro has
- been replaced with an inline function, reinit_completion [1][2]. We are
- currently using the 3.13-rc3 Linux kernel, which leads to the following
- error:
-
-cryptlib.c:279:2: error: implicit declaration of function 'INIT_COMPLETION' [-Werror=implicit-function-declaration]
-  INIT_COMPLETION(cdata->async.result->completion);
-
-[1] https://github.com/torvalds/linux/commit/c32f74ab2872994bc8336ed367313da3139350ca
-[2] https://github.com/torvalds/linux/commit/62026aedaacedbe1ffe94a3599ad4acd8ecdf587
-
-Signed-off-by: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
-Reviewed-by: Cristian Stoica <cristian.stoica@freescale.com>
-Tested-by: Cristian Stoica <cristian.stoica@freescale.com>
-Signed-off-by: Horia Geanta <horia.geanta@freescale.com>
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-
-Upstream-Status: Backport
----
- cryptlib.c      | 8 ++++----
- cryptodev_int.h | 6 ++++++
- 2 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/cryptlib.c b/cryptlib.c
-index 54d5d41..a923c14 100644
---- a/cryptlib.c
-+++ b/cryptlib.c
-@@ -217,7 +217,7 @@ ssize_t cryptodev_cipher_encrypt(struct cipher_data *cdata,
- {
- 	int ret;
- 
--	INIT_COMPLETION(cdata->async.result->completion);
-+	reinit_completion(&cdata->async.result->completion);
- 
- 	if (cdata->aead == 0) {
- 		ablkcipher_request_set_crypt(cdata->async.request,
-@@ -240,7 +240,7 @@ ssize_t cryptodev_cipher_decrypt(struct cipher_data *cdata,
- {
- 	int ret;
- 
--	INIT_COMPLETION(cdata->async.result->completion);
-+	reinit_completion(&cdata->async.result->completion);
- 	if (cdata->aead == 0) {
- 		ablkcipher_request_set_crypt(cdata->async.request,
- 			(struct scatterlist *)src, dst,
-@@ -351,7 +351,7 @@ ssize_t cryptodev_hash_update(struct hash_data *hdata,
- {
- 	int ret;
- 
--	INIT_COMPLETION(hdata->async.result->completion);
-+	reinit_completion(&hdata->async.result->completion);
- 	ahash_request_set_crypt(hdata->async.request, sg, NULL, len);
- 
- 	ret = crypto_ahash_update(hdata->async.request);
-@@ -363,7 +363,7 @@ int cryptodev_hash_final(struct hash_data *hdata, void* output)
- {
- 	int ret;
- 
--	INIT_COMPLETION(hdata->async.result->completion);
-+	reinit_completion(&hdata->async.result->completion);
- 	ahash_request_set_crypt(hdata->async.request, NULL, output, 0);
- 
- 	ret = crypto_ahash_final(hdata->async.request);
-diff --git a/cryptodev_int.h b/cryptodev_int.h
-index 12dd5b1..188063d 100644
---- a/cryptodev_int.h
-+++ b/cryptodev_int.h
-@@ -2,6 +2,12 @@
- #ifndef CRYPTODEV_INT_H
- # define CRYPTODEV_INT_H
- 
-+#include <linux/version.h>
-+
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))
-+#  define reinit_completion(x) INIT_COMPLETION(*(x))
-+#endif
-+
- #include <linux/init.h>
- #include <linux/sched.h>
- #include <linux/fs.h>
--- 
-1.9.1
-
-- 
1.7.9.5


