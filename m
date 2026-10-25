Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27810.1792952682142521287
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=ZY2UTj5E;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20261025182440f1005c9ed0000207fd-ou7m02@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261025182440f1005c9ed0000207fd
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:24:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ly2SURVytWuK60uzPUwYFo01OaG0D485Ax+p97WBf5w=;
 b=ZY2UTj5EYfzLgAJy4pvmr28w2mShTElE2VEpekqwOGBM9B8KvBdezcv5PU8L3jc7mz5pcJ
 SaENCYnmN95JdoebQ6SL2qQxkCTwxJNjxGWVkQIQDVE15H7Pbbb1+qADFUO3tV2hUKL4NRre
 hcqZ8AdKdGdZj/A5m1t/FLHcaxxbQGhEkL0vp29YLJFDL5rFYUXSlz0zy5Zd5dky8/JgaITV
 3q2i1Qy8SPPd+r93gXWBsuatifdx1LJrgUYSsMM/CcAxOwEuE+n/6Z7C/OBz51jL5y9+2gmt
 T7awGnRT+H41OxhgNjiuS6d+rLk91HQrhTmDkMok4UOUrNv2Fq+tZAWA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 6/6] oe-selftest: fitimage: test SPL FIT individual image signing
Date: Sun, 25 Oct 2026 19:23:59 +0100
Message-ID: <20261025182436.788918-7-adrian.freihofer@siemens.com>
In-Reply-To: <20261025182436.788918-1-adrian.freihofer@siemens.com>
References: <20261025182436.788918-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248621
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Since uboot-sign signs the SPL FIT configuration by default, the SPL
signing tests using the default settings cover configuration signing.

Invert the test for the non-default case accordingly: replace
test_sign_standalone_uboot_fit_image_conf by
test_sign_standalone_uboot_fit_image_individual which verifies the
legacy signing of the individual images (SPL_SIGN_CONF = "0" and
SPL_SIGN_INDIVIDUAL = "1").

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 29 ++++++++++++------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 6fe41b769f..81d2be5013 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -2087,19 +2087,18 @@ UBOOT_FIT_HASH_ALG = "sha256"
         self._test_fitimage(bb_vars)
 
 
-    def test_sign_standalone_uboot_fit_image_conf(self):
+    def test_sign_standalone_uboot_fit_image_individual(self):
         """
         Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
-                     created and signed correctly when the FIT configuration
-                     is signed (SPL_SIGN_CONF = "1") instead of the individual
-                     images (SPL_SIGN_INDIVIDUAL = "0").
+                     created and signed correctly when the individual images
+                     are signed (SPL_SIGN_INDIVIDUAL = "1") instead of the FIT
+                     configuration (SPL_SIGN_CONF = "0").
         Expected:    1) U-Boot its and FIT image are built successfully
-                     2) The its file has a hash node in each image node, no
-                        image signature nodes, and a signature node in the
-                        configuration which covers the loadables and the fdt
-                     3) Dumping the FIT image shows hashes for the images and
-                        a signature for the configuration only
-                     4) The public key in the SPL DTB is required for "conf"
+                     2) The its file has a signature node in each image node,
+                        no image hash nodes and no configuration signature node
+                     3) Dumping the FIT image shows signatures for the images
+                        and no signature for the configuration
+                     4) The public key in the SPL DTB is required for "image"
                      5) SPL_MKIMAGE_SIGN_ARGS is passed to mkimage
         Product:     oe-core
         """
@@ -2107,18 +2106,18 @@ UBOOT_FIT_HASH_ALG = "sha256"
         config = """
 # There's no U-boot defconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-# Enable creation and signing of the U-Boot fitImage configuration
+# Enable creation and signing of the individual U-Boot fitImage images
 UBOOT_FITIMAGE_ENABLE = "1"
 SPL_SIGN_ENABLE = "1"
-SPL_SIGN_CONF = "1"
-SPL_SIGN_INDIVIDUAL = "0"
-SPL_SIGN_KEYNAME = "spl-conf-oe-selftest"
+SPL_SIGN_CONF = "0"
+SPL_SIGN_INDIVIDUAL = "1"
+SPL_SIGN_KEYNAME = "spl-individual-oe-selftest"
 SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_ENTRYPOINT  = "0x80000000"
 UBOOT_LOADADDRESS = "0x80000000"
 UBOOT_DTB_LOADADDRESS = "0x82000000"
 SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
-SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot conf comment'"
+SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot individual comment'"
 UBOOT_EXTLINUX = "0"
 UBOOT_FIT_GENERATE_KEYS = "1"
 UBOOT_FIT_HASH_ALG = "sha256"
-- 
2.56.0

