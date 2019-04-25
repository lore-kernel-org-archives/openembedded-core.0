Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30AE27D440
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 05:40:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3P5eZM8006399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Apr 2019 22:40:36 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 24 Apr 2019 22:40:35 -0700
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 25 Apr 2019 01:40:31 -0400
Message-ID: <20190425054031.9543-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] cryptodev: fix module loading error
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
X-List-Received-Date: Thu, 25 Apr 2019 05:40:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch from upstream to fix module cryptodev loading error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  4 +-
 ...x-module-loading-with-Linux-v5.0-rc5.patch | 59 +++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 252d39d23a..9d8ba44058 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -3,7 +3,9 @@ HOMEPAGE = "http://cryptodev-linux.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux"
+SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
+           file://0001-Fix-module-loading-with-Linux-v5.0-rc5.patch \
+           "
 SRCREV = "fd8b15ef1c8398a69a37932ee48c74ab40329a29"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
new file mode 100644
index 0000000000..34ec87272f
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
@@ -0,0 +1,59 @@
+Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/commit/f971e0c]
+
+Backport patch from upstream to fix module cryptodev loading error.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From f971e0cd4a0ebe59fb2e8e17240399bf6901b09b Mon Sep 17 00:00:00 2001
+From: "Derald D. Woods" <woods.technical@gmail.com>
+Date: Sun, 10 Feb 2019 13:22:19 -0600
+Subject: [PATCH] Fix module loading with Linux v5.0-rc5
+
+This commit fixes this module load error:
+[...]
+[   29.112091] cryptodev: loading out-of-tree module taints kernel.
+[   29.128906] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
+[   29.188842] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
+modprobe: can't load module cryptodev (extra/cryptodev.ko): unknown symbol in module, or unknown parameter
+[...]
+
+Upstream Linux support for unused GIVCIPHER, and others, was dropped here:
+
+c79b411eaa72 (crypto: skcipher - remove remnants of internal IV generators)
+
+Signed-off-by: Derald D. Woods <woods.technical@gmail.com>
+---
+ cryptlib.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/cryptlib.c b/cryptlib.c
+index 6e66698..4a87037 100644
+--- a/cryptlib.c
++++ b/cryptlib.c
+@@ -38,7 +38,9 @@
+ #include "cryptodev_int.h"
+ #include "cipherapi.h"
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 0, 0))
+ extern const struct crypto_type crypto_givcipher_type;
++#endif
+ 
+ static void cryptodev_complete(struct crypto_async_request *req, int err)
+ {
+@@ -157,8 +159,11 @@ int cryptodev_cipher_init(struct cipher_data *out, const char *alg_name,
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0))
+ 		tfm = crypto_skcipher_tfm(out->async.s);
+-		if ((tfm->__crt_alg->cra_type == &crypto_ablkcipher_type) ||
+-		    (tfm->__crt_alg->cra_type == &crypto_givcipher_type)) {
++		if ((tfm->__crt_alg->cra_type == &crypto_ablkcipher_type)
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 0, 0))
++		    || (tfm->__crt_alg->cra_type == &crypto_givcipher_type)
++#endif
++							) {
+ 			struct ablkcipher_alg *alg;
+ 
+ 			alg = &tfm->__crt_alg->cra_ablkcipher;
+-- 
+2.20.0
+
-- 
2.20.0


