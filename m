Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27593.1792952682142798443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=POyG9uq6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20261025182439570d229b370002075b-ijgtw0@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261025182439570d229b370002075b
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:24:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=rEnecPHorCjefT8uKHO5eI1ojqJyQrJqRcdb843U9RU=;
 b=POyG9uq6oNK7B8yJZ71WAIdOmTHMS5Hs09x0jYoRFLQOg+PtNz/FRASnThwj24yrb2Io57
 kWgY3gAbLEpKgbwvtDaZRZ9rD3tROtfF9eibKWiguef64Nr99ZHe5BxsOrCTxXXfKoW0mbkG
 iFvIuniZ8iIBZ3xVi7/WkH15WN5Bvxh5Via7nCv87E89w7mUPsknUNUUYY2Ylf2FUIlLT28N
 Gah8tTxd3nt0sfITvfJXkB9FGutGBYX6Mxz2W/OegA+/21pCf4UJD7TTvGq3TH1FjaOpoJ1S
 Z5rdhFj9yBdrtOScVzwbDJjCUi9P3g7hbN2iUBmgh6ckurOJtAL57Q0w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 4/6] oe-selftest: fitimage: test SPL FIT configuration signing
Date: Sun, 25 Oct 2026 19:23:57 +0100
Message-ID: <20261025182436.788918-5-adrian.freihofer@siemens.com>
In-Reply-To: <20261025182436.788918-1-adrian.freihofer@siemens.com>
References: <20261025182436.788918-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248625
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The existing SPL signing tests use the default settings of
uboot-sign.bbclass which sign the individual images.

Add test_sign_standalone_uboot_fit_image_conf which covers the
non-default case: SPL_SIGN_CONF = "1" and SPL_SIGN_INDIVIDUAL = "0".
It verifies that the configuration is signed instead of the individual
images and that the public key in the SPL DTB is required for "conf".

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index c5c446dabf..6fe41b769f 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -2087,6 +2087,49 @@ UBOOT_FIT_HASH_ALG = "sha256"
         self._test_fitimage(bb_vars)
 
 
+    def test_sign_standalone_uboot_fit_image_conf(self):
+        """
+        Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
+                     created and signed correctly when the FIT configuration
+                     is signed (SPL_SIGN_CONF = "1") instead of the individual
+                     images (SPL_SIGN_INDIVIDUAL = "0").
+        Expected:    1) U-Boot its and FIT image are built successfully
+                     2) The its file has a hash node in each image node, no
+                        image signature nodes, and a signature node in the
+                        configuration which covers the loadables and the fdt
+                     3) Dumping the FIT image shows hashes for the images and
+                        a signature for the configuration only
+                     4) The public key in the SPL DTB is required for "conf"
+                     5) SPL_MKIMAGE_SIGN_ARGS is passed to mkimage
+        Product:     oe-core
+        """
+        machine = self._get_machine_or_skip()
+        config = """
+# There's no U-boot defconfig with CONFIG_FIT_SIGNATURE yet, so we need at
+# least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
+# Enable creation and signing of the U-Boot fitImage configuration
+UBOOT_FITIMAGE_ENABLE = "1"
+SPL_SIGN_ENABLE = "1"
+SPL_SIGN_CONF = "1"
+SPL_SIGN_INDIVIDUAL = "0"
+SPL_SIGN_KEYNAME = "spl-conf-oe-selftest"
+SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
+UBOOT_ENTRYPOINT  = "0x80000000"
+UBOOT_LOADADDRESS = "0x80000000"
+UBOOT_DTB_LOADADDRESS = "0x82000000"
+SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot conf comment'"
+UBOOT_EXTLINUX = "0"
+UBOOT_FIT_GENERATE_KEYS = "1"
+UBOOT_FIT_HASH_ALG = "sha256"
+"""
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "SPL_BINARY", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
+        config = self._require_machine_capability(config, machine, '_cap_spl_dtb')
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
+
     def test_sign_cascaded_uboot_fit_image(self):
         """
         Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
-- 
2.56.0

