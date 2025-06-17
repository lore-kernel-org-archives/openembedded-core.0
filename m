Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53A0C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 08:10:59 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.13301.1750147855276325504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 01:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 17 Jun
 2025 16:10:52 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Jun 2025 16:10:52 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 3/3] oe-selftest: fitimage: Add test for signing U-Boot FIT image without SPL
Date: Tue, 17 Jun 2025 16:10:52 +0800
Message-ID: <20250617081052.3087995-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617081052.3087995-1-jamin_lin@aspeedtech.com>
References: <20250617081052.3087995-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218861

This adds a new selftest case `test_sign_uboot_fit_image_without_spl` to ve=
rify
that the build can correctly generate and sign a U-Boot FIT image in a scen=
ario
where no SPL is used.

Background:
- Some boards build only the U-Boot proper FIT image and do not require an =
SPL.
- The signing flow must handle this case gracefully: generate the ITS, sign
  the FIT image, and skip signing/injecting a key into the SPL DTB.

What this test does:
1) Enables `UBOOT_FITIMAGE_ENABLE` and `SPL_SIGN_ENABLE` but explicitly set=
s
   `SPL_DTB_BINARY` to an empty string to indicate that no SPL is present.
2) Verifies that the U-Boot ITS and FIT image are built successfully.
3) Confirms that the generated ITS file includes signature metadata as requ=
ested.
4) Dumps the FIT image to ensure that the signature nodes exist.
5) Confirms that the log for `do_uboot_assemble_fitimage` shows the expecte=
d
   mkimage/mkimage_sign invocation.

This ensures that signing works correctly even when only the U-Boot proper =
is built,
which matches real-world configurations that do not require an SPL.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selft=
est/cases/fitimage.py
index ca4724d1ae..3c40857747 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1692,3 +1692,40 @@ FIT_SIGN_INDIVIDUAL =3D "1"
=20
         # Just check the DTB of u-boot since there is no u-boot FIT image
         self._check_kernel_dtb(bb_vars)
+
+
+    def test_sign_uboot_fit_image_without_spl(self):
+        """
+        Summary:     Check if U-Boot FIT image and Image Tree Source (its)=
 are
+                     created and signed correctly for the scenario where o=
nly
+                     the U-Boot proper fitImage is being created and signe=
d
+                     (no SPL included).
+        Expected:    1) U-Boot its and FIT image are built successfully
+                     2) Scanning the its file indicates signing is enabled
+                        as requested by SPL_SIGN_ENABLE (using keys genera=
ted
+                        via UBOOT_FIT_GENERATE_KEYS)
+                     3) Dumping the FIT image indicates signature values
+                        are present
+                     4) Examination of the do_uboot_assemble_fitimage
+                     runfile/logfile indicate that UBOOT_MKIMAGE and
+                     UBOOT_MKIMAGE_SIGN are working as expected.
+        Product:     oe-core
+        Author:      Jamin Lin <jamin_lin@aspeedtech.com>
+        """
+        config =3D """
+# There's no U-boot defconfig with CONFIG_FIT_SIGNATURE yet, so we need at
+# least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
+MACHINE =3D "qemuarm"
+UBOOT_MACHINE =3D "am57xx_evm_defconfig"
+# Enable creation and signing of the U-Boot fitImage (no SPL)
+UBOOT_FITIMAGE_ENABLE =3D "1"
+SPL_DTB_BINARY =3D ""
+SPL_SIGN_ENABLE =3D "1"
+SPL_SIGN_KEYNAME =3D "spl-oe-selftest"
+SPL_SIGN_KEYDIR =3D "${TOPDIR}/signing-keys"
+UBOOT_FIT_GENERATE_KEYS =3D "1"
+"""
+        self.write_config(config)
+        bb_vars =3D self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
--=20
2.43.0


