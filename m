Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id BAA236FFE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 00:08:18 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id ur14so31645433pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 16:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Fmx28qRHQBxrz4MimIPx1yeryk6zfKhgqHf5EvUncTg=;
	b=E6EH11Qa+fpeHP+Frs86/H4dqXFaH+iZNvU4SOQCVqDLkZVjyjhRdXzx5DgtD72czK
	Q/QG59OvyMVsSwJUnbNvl6BOQykefrFhG1RIZ8nFIkY42Yi/a/pY8MhUmqDQOfqcAIaz
	55EcSFvv2wB7IP+3H6LDOCLvtHl9IPKojKx8C4W2leaiKFDF6SDmVHxTv0CTLk0Lyl4P
	xWcZtCnksZHXOkbsdTV4oqvfSLTfDB0sQo/5mOsVApmRMJgkwd97di1mP9viEQ1ElCXs
	xeHTOIXLs1XGzbeRhMGupJFP4msnkoDM2gPPYk3USduJ8RX9uk+s/3BHSHlxGqpYVGp+
	FMEg==
X-Received: by 10.66.139.72 with SMTP id qw8mr67768687pab.130.1450310899602;
	Wed, 16 Dec 2015 16:08:19 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	cn1sm6549686pad.11.2015.12.16.16.08.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Dec 2015 16:08:18 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 16:08:13 -0800
Message-Id: <1450310893-27099-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] pixman: check neon support via TUNE_FEATURES, not the _armv7a over-ride
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
X-List-Received-Date: Thu, 17 Dec 2015 00:08:21 -0000

Neon support is optional in armv7a so the _armv7a over-ride is not
the best way to determine whether or not the target supports neon.

Since pixman will always use neon in preference to 'simd' (ie VFPv2)
if it can, it's safe to disable the simd routines if the target is
known to support neon.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb b/meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb
index e13b9ad..16e68fc 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb
@@ -19,13 +19,12 @@ PE = "1"
 
 IWMMXT = "--disable-arm-iwmmxt"
 LOONGSON_MMI = "--disable-loongson-mmi"
-NEON = " --disable-arm-neon "
-NEON_class-nativesdk = " --disable-arm-neon "
-NEON_armv7a = " "
-NEON_armv7a-vfp-neon = " "
+# If target supports neon then disable the 'simd' (ie VFPv2) fallback, otherwise disable neon.
+NEON = "${@bb.utils.contains("TUNE_FEATURES", "neon", "--disable-arm-simd", "--disable-arm-neon" ,d)}"
 
 EXTRA_OECONF = "--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
 EXTRA_OECONF_class-native = "--disable-gtk"
+EXTRA_OECONF_class-nativesdk = "--disable-gtk"
 
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
-- 
1.9.1


