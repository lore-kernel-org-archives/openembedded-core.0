Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1A84076E4B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 15:11:16 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so170099174wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=69KeL7+xWu7cmRoDPWSTWba3ao1iBQx3/hfyqGKU4Io=;
	b=cfmmMHdZ6lXkyghrBLhpj2ba2JxIXa/1vHvGkizDbFQt+kXUsF8rIdkLQj4lIAL6sD
	v9ffqcQ0KwyZLKfM4Yl/dte4e5AaC+PgH2fMElW+2Kdg+xj2koNeXu296ZiJnPou1Z/c
	wjAE/9dq6Rkz3A7Eaf0gZ/821CYHyXkcY1jP27SdsDFpNkEMEqlX4SqnEb/exz4+i3MQ
	/aOoU7Cz05i//5Fd1vxpkbuF4AYYB41Z6xfrMOrkKre4tRLZp2GCVR5KdnXtcyoUdESt
	hMXNR91N7QfTczpzhai/PHb1ZB06LsiXgWvwCVQKXsm1wjmuovOwCGDSTI+dKLa82qn8
	OzEg==
X-Received: by 10.180.219.106 with SMTP id pn10mr19541395wic.56.1444144276214; 
	Tue, 06 Oct 2015 08:11:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	mx19sm20250107wic.0.2015.10.06.08.11.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 08:11:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Oct 2015 17:11:15 +0200
Message-Id: <1444144275-7883-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444144275-7883-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444138615-5618-1-git-send-email-Martin.Jansa@gmail.com>
	<1444144275-7883-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC][WIP[[PATCH 2/2] arch-armv7ve: add tune include for armv7ve and use it from cortexa7 and cortexa15
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
X-List-Received-Date: Tue, 06 Oct 2015 15:11:17 -0000

* be aware that this -march value is available only in gcc-4.9 and
  newer:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7ve.inc     | 123 +++++++++++++++++++++
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 meta/conf/machine/include/tune-cortexa15.inc       |  52 ++++-----
 meta/conf/machine/include/tune-cortexa7.inc        |  52 ++++-----
 4 files changed, 176 insertions(+), 52 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv7ve.inc

diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
new file mode 100644
index 0000000..9add3eb
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -0,0 +1,123 @@
+DEFAULTTUNE ?= "armv7ve"
+
+TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
+TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7-a"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7ve", " -march=armv7ve", "", d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv7ve", "armv7ve:", "" ,d)}"
+
+require conf/machine/include/arm/arch-armv6.inc
+require conf/machine/include/arm/feature-arm-neon.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv7ve armv7vet armv7ve-vfpv3d16 armv7vet-vfpv3d16 armv7ve-vfpv3 armv7vet-vfpv3 armv7ve-neon armv7vet-neon"
+ARMPKGARCH_tune-armv7ve ?= "armv7ve"
+ARMPKGARCH_tune-armv7vet ?= "armv7ve"
+ARMPKGARCH_tune-armv7ve-vfpv3d16 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vet-vfpv3d16 ?= "armv7ve"
+ARMPKGARCH_tune-armv7ve-vfpv3 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vet-vfpv3 ?= "armv7ve"
+ARMPKGARCH_tune-armv7ve-neon?= "armv7ve"
+ARMPKGARCH_tune-armv7vet-neon ?= "armv7ve"
+TUNE_FEATURES_tune-armv7ve ?= "arm armv7ve vfp"
+TUNE_FEATURES_tune-armv7vet ?= "${TUNE_FEATURES_tune-armv7ve} thumb"
+TUNE_FEATURES_tune-armv7ve-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7ve} vfpv3d16"
+TUNE_FEATURES_tune-armv7vet-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7vet} vfpv3d16"
+TUNE_FEATURES_tune-armv7ve-vfpv3 ?= "${TUNE_FEATURES_tune-armv7ve-vfpv3d16} vfpv3"
+TUNE_FEATURES_tune-armv7vet-vfpv3 ?= "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} vfpv3"
+TUNE_FEATURES_tune-armv7ve-neon ?= "${TUNE_FEATURES_tune-armv7ve} neon"
+TUNE_FEATURES_tune-armv7vet-neon ?= "${TUNE_FEATURES_tune-armv7vet} neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7ve armv7ve-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} armv7ve-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16} armv7ve-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} armv7ve-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7ve armv7ve-vfp armv7vet2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-vfp-vfpv3d16 armv7vet2-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16} armv7ve-vfp-vfpv3d16-vfpv3 armv7vet2-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-vfp-neon armv7vet2-vfp-neon"
+
+# HF Tunes
+AVAILTUNES += "armv7vehf armv7vethf armv7vehf-vfpv3d16 armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3 armv7vehf-neon armv7vethf-neon armv7vehf-neon-vfpv4 armv7vethf-neon-vfpv4"
+ARMPKGARCH_tune-armv7vehf ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehf-vfpv3d16 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf-vfpv3d16 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehf-vfpv3 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf-vfpv3 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehf-neon?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf-neon ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehf-neon-vfpv4 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf-neon-vfpv4 ?= "armv7ve"
+TUNE_FEATURES_tune-armv7vehf ?= "${TUNE_FEATURES_tune-armv7ve} callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf ?= "${TUNE_FEATURES_tune-armv7vet} callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7ve-vfpv3d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-vfpv3 ?= "${TUNE_FEATURES_tune-armv7ve-vfpv3} callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-vfpv3 ?= "${TUNE_FEATURES_tune-armv7vet-vfpv3} callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-neon ?= "${TUNE_FEATURES_tune-armv7ve-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-neon ?= "${TUNE_FEATURES_tune-armv7vet-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7vehf-neon} vfpv4"
+TUNE_FEATURES_tune-armv7vethf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7vethf-neon} vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7vehf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7vehf-vfp armv7vet2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} armv7vehf-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-vfp-vfpv3d16 armv7vet2hf-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16} armv7vehf-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16} armv7vehf-vfp-vfpv3d16-vfpv3 armv7vet2hf-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} armv7vehf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-vfp-neon armv7vet2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} armv7vehf-vfp-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} armv7vehf-vfp-neon-vfpv4 armv7vet2hf-vfp-neon-vfpv4"
+
+# Big Endian
+AVAILTUNES += "armv7veb armv7vetb armv7veb-vfpv3d16 armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb-vfpv3 armv7veb-neon armv7vetb-neon"
+ARMPKGARCH_tune-armv7veb ?= "armv7ve"
+ARMPKGARCH_tune-armv7vetb ?= "armv7ve"
+ARMPKGARCH_tune-armv7veb-vfpv3d16 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vetb-vfpv3d16 ?= "armv7ve"
+ARMPKGARCH_tune-armv7veb-vfpv3 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vetb-vfpv3 ?= "armv7ve"
+ARMPKGARCH_tune-armv7veb-neon?= "armv7ve"
+ARMPKGARCH_tune-armv7vetb-neon ?= "armv7ve"
+TUNE_FEATURES_tune-armv7veb ?= "${TUNE_FEATURES_tune-armv7ve} bigendian"
+TUNE_FEATURES_tune-armv7vetb ?= "${TUNE_FEATURES_tune-armv7vet} bigendian"
+TUNE_FEATURES_tune-armv7veb-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7ve-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7vetb-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7veb-vfpv3 ?= "${TUNE_FEATURES_tune-armv7ve-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7vetb-vfpv3 ?= "${TUNE_FEATURES_tune-armv7vet-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7veb-neon ?= "${TUNE_FEATURES_tune-armv7ve-neon} bigendian"
+TUNE_FEATURES_tune-armv7vetb-neon ?= "${TUNE_FEATURES_tune-armv7vet-neon} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb = "${PACKAGE_EXTRA_ARCHS_tune-armv6b} armv7veb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7veb-vfp armv7vet2b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb} armv7veb-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb} armv7veb-vfp-vfpv3d16 armv7vet2b-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16} armv7veb-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16} armv7veb-vfp-vfpv3d16-vfpv3 armv7vet2b-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb} armv7veb-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-vfp-neon armv7vet2b-vfp-neon"
+
+# Big Endian + VFP
+AVAILTUNES += "armv7vehfb armv7vethfb armv7vehfb-vfpv3d16 armv7vethfb-vfpv3d16 armv7vehfb-vfpv3 armv7vethfb-vfpv3 armv7vehfb-neon armv7vethfb-neon"
+ARMPKGARCH_tune-armv7vehfb ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethfb ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehfb-vfpv3d16 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethfb-vfpv3d16 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehfb-vfpv3 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethfb-vfpv3 ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehfb-neon?= "armv7ve"
+ARMPKGARCH_tune-armv7vethfb-neon ?= "armv7ve"
+TUNE_FEATURES_tune-armv7vehfb ?= "${TUNE_FEATURES_tune-armv7vehf} bigendian"
+TUNE_FEATURES_tune-armv7vethfb ?= "${TUNE_FEATURES_tune-armv7vethf} bigendian"
+TUNE_FEATURES_tune-armv7vehfb-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7vehf-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7vethfb-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7vethf-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7vehfb-vfpv3 ?= "${TUNE_FEATURES_tune-armv7vehf-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7vethfb-vfpv3 ?= "${TUNE_FEATURES_tune-armv7vethf-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7vehfb-neon ?= "${TUNE_FEATURES_tune-armv7vehf-neon} bigendian"
+TUNE_FEATURES_tune-armv7vethfb-neon ?= "${TUNE_FEATURES_tune-armv7vethf-neon} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7vehfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7vehfb-vfp armv7vet2hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb} armv7vehfb-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-vfp-vfpv3d16 armv7vet2hfb-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16} armv7vehfb-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16} armv7vehfb-vfp-vfpv3d16-vfpv3 armv7vet2hfb-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb} armv7vehfb-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-vfp-neon armv7vet2hfb-vfp-neon"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 5632171..54c0cee 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -12,6 +12,7 @@ ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '', d
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 't2', '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 't2', '', d)}"
 
 # If the device supports ARM, then respect ARM_THUMB_OPT (which can be "arm" or "thumb")
 # If the defice doesn't support ARM, then always set "thumb" even when
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 92cc1df..42461cf 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -1,6 +1,6 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7ve-neon"
 
-require conf/machine/include/arm/arch-armv7a.inc
+require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", " -mcpu=cortex-a15", "", d)}"
@@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa15-neon = "cortexa15"
 ARMPKGARCH_tune-cortexa15t-neon = "cortexa15"
 ARMPKGARCH_tune-cortexa15-neon-vfpv4 = "cortexa15"
 ARMPKGARCH_tune-cortexa15t-neon-vfpv4 = "cortexa15"
-TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7a} cortexa15"
-TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7at} cortexa15"
-TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} cortexa15"
-TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa15-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4} cortexa15-vfp cortexa15-vfp-neon cortexa15-vfp-vfpv4-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon cortexa15-vfp-vfpv4-neon cortexa15t2-vfp-vfpv4-neon"
+TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7ve} cortexa15"
+TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7vet} cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7ve-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15t-neon = "${TUNE_FEATURES_tune-armv7vet-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa15"
+TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa15-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa15-vfp cortexa15t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa15-vfp cortexa15-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa15-vfp cortexa15-vfp-neon cortexa15-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon cortexa15-vfp-vfpv4-neon cortexa15t2-vfp-vfpv4-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon cortexa15hf-neon-vfpv4 cortexa15thf-neon-vfpv4"
@@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa15hf-neon = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf-neon = "cortexa15"
 ARMPKGARCH_tune-cortexa15hf-neon-vfpv4 = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 = "cortexa15"
-TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
-TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
-TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} cortexa15"
-TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa15hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15hf-vfp-vfpv4-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon cortexa15hf-vfp-vfpv4-neon cortexa15t2hf-vfp-vfpv4-neon"
+TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7vehf} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7vethf} cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7vehf-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7vethf-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa15hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa15hf-vfp cortexa15t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15hf-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon cortexa15hf-vfp-vfpv4-neon cortexa15t2hf-vfp-vfpv4-neon"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index c2f7a4f..c405875 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -1,6 +1,6 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7ve-neon"
 
-require conf/machine/include/arm/arch-armv7a.inc
+require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", " -mcpu=cortex-a7", "", d)}"
@@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa7-neon = "cortexa7"
 ARMPKGARCH_tune-cortexa7t-neon = "cortexa7"
 ARMPKGARCH_tune-cortexa7-neon-vfpv4 = "cortexa7"
 ARMPKGARCH_tune-cortexa7t-neon-vfpv4 = "cortexa7"
-TUNE_FEATURES_tune-cortexa7 = "${TUNE_FEATURES_tune-armv7a} cortexa7"
-TUNE_FEATURES_tune-cortexa7t = "${TUNE_FEATURES_tune-armv7at} cortexa7"
-TUNE_FEATURES_tune-cortexa7-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} cortexa7"
-TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa7-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa7-vfp cortexa7-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4} cortexa7-vfp cortexa7-vfp-neon cortexa7-vfp-vfpv4-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon cortexa7-vfp-vfpv4-neon cortexa7t2-vfp-vfpv4-neon"
+TUNE_FEATURES_tune-cortexa7 = "${TUNE_FEATURES_tune-armv7ve} cortexa7"
+TUNE_FEATURES_tune-cortexa7t = "${TUNE_FEATURES_tune-armv7vet} cortexa7"
+TUNE_FEATURES_tune-cortexa7-neon = "${TUNE_FEATURES_tune-armv7ve-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7t-neon = "${TUNE_FEATURES_tune-armv7vet-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa7"
+TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa7"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa7-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa7-vfp cortexa7t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa7-vfp cortexa7-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa7-vfp cortexa7-vfp-neon cortexa7-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon cortexa7-vfp-vfpv4-neon cortexa7t2-vfp-vfpv4-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
@@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa7hf-neon = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf-neon = "cortexa7"
 ARMPKGARCH_tune-cortexa7hf-neon-vfpv4 = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
-TUNE_FEATURES_tune-cortexa7hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa7"
-TUNE_FEATURES_tune-cortexa7thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa7hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7hf-vfp-vfpv4-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon cortexa7hf-vfp-vfpv4-neon cortexa7t2hf-vfp-vfpv4-neon"
+TUNE_FEATURES_tune-cortexa7hf ?= "${TUNE_FEATURES_tune-armv7vehf} cortexa7"
+TUNE_FEATURES_tune-cortexa7thf ?= "${TUNE_FEATURES_tune-armv7vethf} cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon ?= "${TUNE_FEATURES_tune-armv7vehf-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7thf-neon ?= "${TUNE_FEATURES_tune-armv7vethf-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4} cortexa7"
+TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa7"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa7hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa7hf-vfp cortexa7t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7hf-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon cortexa7hf-vfp-vfpv4-neon cortexa7t2hf-vfp-vfpv4-neon"
-- 
2.6.0


