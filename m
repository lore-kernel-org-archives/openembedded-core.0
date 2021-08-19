Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.64508.1629341543013802565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 19:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=X8+Ks4GE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id l24so3402574qtj.4
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 19:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0O+EdG7lWnJVG+11H2UoN1OY+xa7a/u4ernN6vGYZdI=;
        b=X8+Ks4GEvh+4jGS+DuNzTCZ2rDLvx8sDb/Qo6Fbm+gk2rlJSQszSZB4RGYDdAxxaE/
         IVGYF6uhMRFnetllptXUH9Nt66B2eC5m9Bu4thh6qcrsAPahS4hVOtwxeuJzACBr3jaU
         7zcMEe0uxUiyuJ9w4KI3RJK1Ai4VtE8zB4viYbx6yb32yJj42Uw5GSp+saX1P2eC2mte
         9PkDIq9YiJEalle3ou/hfd3a0KHl/AVSrHd/CJbLDHPbgaTAq+z5oVK3Z55XcZIJTHa4
         L3Xgw0G2gFhYz3jY10UUIgB0YCKg6FBN95iLtXcG20rxTlq3vCcsBjYd6RXBpZhrvWJe
         rW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0O+EdG7lWnJVG+11H2UoN1OY+xa7a/u4ernN6vGYZdI=;
        b=KTKaSj6n0jtwIrk+uRDt/KTPCOcrdtookc4MpbavOcFXkKDyAupV9jRNSZliPDSM3E
         uFxAqXTM12GVnk4Cgri3er7mepe2vq+WONVIRzW0S6k1w9O7Tb8jCtseutRjXn03kbHl
         2N8POVLAV/4zl9yk5VUYn1m2/HrMt5OI/nheQks+QrTyUeFe1owchhCPAyloJiX6xtbH
         7WUZdqYut6RCd1F+x9Jrv2dfZFTba1mBRWW65J7LyAGOFuCaDoPOhWF2+6LjDuBdbMnK
         VwReuSWIff03mk1mthjy5Y/jacr0OAV9btxNnB9EKZF1N7p/44BuYTrR/LJTKKyiUwWU
         Tu+A==
X-Gm-Message-State: AOAM533wmenl1ZcLUaSkbCTrA1BrUuYhVr8Wj1TZzWNhX0xp5FJ8zkb6
	Ax2/d3p1NzRLV4wR3535CSfXzEhJYXTNkw==
X-Google-Smtp-Source: ABdhPJy455SAk2Vewt7fxay29mHxaK9QW5Lok5c7TV/iXOrYe4Gxa95ZuURQWVdd7TU5DXcdfiel/Q==
X-Received: by 2002:a05:622a:1704:: with SMTP id h4mr10645827qtk.9.1629341541854;
        Wed, 18 Aug 2021 19:52:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:112:190f:5b05:3b91])
        by smtp.gmail.com with ESMTPSA id b65sm955871qkc.15.2021.08.18.19.52.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:52:21 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] arch-arm*: add better support for gcc march extensions
Date: Wed, 18 Aug 2021 22:52:20 -0400
Message-Id: <20210819025221.1600-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC has the ability to pass extensions to the march parameter, which
expand the funcationality of the march.  For example
"-march=armv7ve+simd" adds SIMD to ARMv7.  Currently, there is no way to
expand the march setting without modifying each instance, as you can't
guarantee the ordering when using the existing TUNE_CCARGS.  By
introducing two new variables, TUNE_CCARGS_MARCH and
TUNE_CCARGS_MARCH_OPT, we can enforce that these two go together.

Also, expand existing and create new feature files that use these
variables to expand the functionality.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/include/arm/arch-arm.inc         |  4 ++++
 meta/conf/machine/include/arm/arch-armv4.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv6m.inc      |  2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |  2 +-
 meta/conf/machine/include/arm/arch-armv7em.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv7m.inc      |  2 +-
 meta/conf/machine/include/arm/arch-armv7ve.inc     |  2 +-
 .../machine/include/arm/arch-armv8-1m-main.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv8-2a.inc    |  2 +-
 meta/conf/machine/include/arm/arch-armv8a.inc      |  8 +++-----
 meta/conf/machine/include/arm/arch-armv8m-base.inc |  2 +-
 meta/conf/machine/include/arm/arch-armv8m-main.inc | 14 +++-----------
 meta/conf/machine/include/arm/feature-arm-crc.inc  |  4 ++++
 .../machine/include/arm/feature-arm-crypto.inc     |  5 +++++
 meta/conf/machine/include/arm/feature-arm-dsp.inc  |  2 ++
 meta/conf/machine/include/arm/feature-arm-neon.inc |  5 +++++
 18 files changed, 37 insertions(+), 27 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/feature-arm-crc.inc
 create mode 100644 meta/conf/machine/include/arm/feature-arm-crypto.inc
 create mode 100644 meta/conf/machine/include/arm/feature-arm-dsp.inc

diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index 869089051cb1..f1e92e19c615 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -14,3 +14,7 @@ TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}
 ABIEXTENSION = "eabi"
 
 TARGET_FPU = "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
+
+# Some -march settings need a +X option passed in.  Since we cannot guarantee that any specified TUNE_CCARGS option is set in any order, we must hard code the order here to allow for it.
+TUNE_CCARGS_MARCH_OPTS ??= ""
+TUNE_CCARGS .= "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS}"
diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index 4f4a63b28746..be5761fb20b6 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv4"
 
 TUNEVALID[arm] = "Enable ARM instruction set"
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4${ARMPKGSFX_THUMB}', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4${ARMPKGSFX_THUMB}', '', d)}"
 # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
 # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does 
 # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 5f46992098e3..6bb465e7b627 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv5"
 
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNECONFLICTS[armv5] = "armv4"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '', d)}"
 
 require conf/machine/include/arm/arch-armv4.inc
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 9d2e112b7154..ef8d288ea736 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv6hf"
 
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6', 'armv6:', '', d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
diff --git a/meta/conf/machine/include/arm/arch-armv6m.inc b/meta/conf/machine/include/arm/arch-armv6m.inc
index e7ca665a029f..d6d6c7ed2dec 100644
--- a/meta/conf/machine/include/arm/arch-armv6m.inc
+++ b/meta/conf/machine/include/arm/arch-armv6m.inc
@@ -7,7 +7,7 @@ TUNECONFLICTS[armv6m] = "armv4 armv5 armv6 armv7a"
 
 # Use armv6s-m instead of armv6-m to avoid gcc bug "SVC is not permitted on this architecture".
 # SVC is a valid instruction.
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', ' -march=armv6s-m', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', ' -march=armv6s-m', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', 'armv6m:', '', d)}"
 
 require conf/machine/include/arm/arch-armv5.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 0f83cee37c49..0a805b3be26a 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -3,7 +3,7 @@ ARM_INSTRUCTION_SET ?= "thumb"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:', '', d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7em.inc b/meta/conf/machine/include/arm/arch-armv7em.inc
index adcab272edab..f7608ea2ee40 100644
--- a/meta/conf/machine/include/arm/arch-armv7em.inc
+++ b/meta/conf/machine/include/arm/arch-armv7em.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "armv7em"
 
 TUNEVALID[armv7em] = "Enable instructions for ARMv7e-m"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7em', ' -march=armv7e-m', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7em', ' -march=armv7e-m', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7em', 'armv7em:', '', d)}"
 
 TUNECONFLICTS[armv7em] = "armv4 armv5 armv6 armv7a"
diff --git a/meta/conf/machine/include/arm/arch-armv7m.inc b/meta/conf/machine/include/arm/arch-armv7m.inc
index a36c265bc123..2b69a3dfd142 100644
--- a/meta/conf/machine/include/arm/arch-armv7m.inc
+++ b/meta/conf/machine/include/arm/arch-armv7m.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "armv7m"
 
 TUNEVALID[armv7m] = "Enable instructions for ARMv7-m"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', ' -march=armv7-m', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', ' -march=armv7-m', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 'armv7m:', '', d)}"
 
 TUNECONFLICTS[armv7m] = "armv4 armv5 armv6 armv7a"
diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index b40c2ca8adb1..8102ae608594 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv7vethf"
 
 TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
 TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '', d)}"
 
 require conf/machine/include/arm/arch-armv7a.inc
diff --git a/meta/conf/machine/include/arm/arch-armv8-1m-main.inc b/meta/conf/machine/include/arm/arch-armv8-1m-main.inc
index 9171b31c9001..5b1bcb8f4662 100644
--- a/meta/conf/machine/include/arm/arch-armv8-1m-main.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-1m-main.inc
@@ -5,7 +5,7 @@
 DEFAULTTUNE ?= "armv8-1m-main"
 
 TUNEVALID[armv8-1m-main] = "Enable instructions for ARMv8.1-m.main"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1m-main', ' -march=armv8.1-m.main', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1m-main', ' -march=armv8.1-m.main', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1m-main', 'armv8-1m-main:', '', d)}"
 
 TUNECONFLICTS[armv8-1m-main] = "armv4 armv5 armv6 armv7a"
diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
index c84b1ecf2460..30f2870811ed 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -1,7 +1,7 @@
 DEFAULTTUNE ?= "armv8-2a"
 
 TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
 # TUNE crypto will be handled by arch-armv8a.inc below
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a:', '', d)}"
 
diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index 819dffbeba6d..97c944dfa5b1 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -1,14 +1,12 @@
 DEFAULTTUNE ?= "armv8a-crc"
 
 TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
-TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
-TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '', d)}"
 
 require conf/machine/include/arm/arch-arm64.inc
+require conf/machine/include/arm/feature-arm-crc.inc
+require conf/machine/include/arm/feature-arm-crypto.inc
 
 # Little Endian base configs
 AVAILTUNES += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
diff --git a/meta/conf/machine/include/arm/arch-armv8m-base.inc b/meta/conf/machine/include/arm/arch-armv8m-base.inc
index d9a341c66e13..ffee8cea8007 100644
--- a/meta/conf/machine/include/arm/arch-armv8m-base.inc
+++ b/meta/conf/machine/include/arm/arch-armv8m-base.inc
@@ -4,7 +4,7 @@
 DEFAULTTUNE ?= "armv8m-base"
 
 TUNEVALID[armv8m-base] = "Enable instructions for ARMv8-m.base"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-base', ' -march=armv8-m.base', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-base', ' -march=armv8-m.base', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-base', 'armv8m-base:', '', d)}"
 
 TUNECONFLICTS[armv8m-base] = "armv4 armv5 armv6 armv7a"
diff --git a/meta/conf/machine/include/arm/arch-armv8m-main.inc b/meta/conf/machine/include/arm/arch-armv8m-main.inc
index 4dbe401c1929..01bef3542894 100644
--- a/meta/conf/machine/include/arm/arch-armv8m-main.inc
+++ b/meta/conf/machine/include/arm/arch-armv8m-main.inc
@@ -4,23 +4,15 @@
 DEFAULTTUNE ?= "armv8m-main"
 
 require conf/machine/include/arm/arch-armv8m-base.inc
+require conf/machine/include/arm/feature-arm-dsp.inc
+require conf/machine/include/arm/feature-arm-neon.inc
 
 TUNEVALID[armv8m-main] = "Enable instructions for ARMv8-m.main"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', ' -march=armv8-m.main${MARCH_DSP}${MARCH_FPU}', '', d)}"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', ' -march=armv8-m.main', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', 'armv8m-main:', '', d)}"
 
 TUNECONFLICTS[armv8m-main] = "armv4 armv5 armv6 armv7a"
 
-# FIXME - below taken from meta/conf/machine/include/arm/arch-armv5-dsp.inc and should be put into something more generic
-TUNEVALID[dsp] = "ARM DSP functionality"
-ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], 'e', '', d)}"
-MARCH_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], '+dsp', '+nodsp', d)}"
-
-# FIXME - Below belongs in meta/conf/machine/include/arm/feature-arm-neon.inc
-TUNEVALID[vfpv5spd16] = "Enable Vector Floating Point Version 5, Single Precision. with 16 registers (fpv5-sp-d16) unit."
-TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv5spd16', 'fpv5-sp-d16', '', d)}"
-MARCH_FPU = "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv5spd16' ], '+fp', '+nofp', d)}"
-
 AVAILTUNES                                      += "armv8m-main armv8m-maine armv8m-main-vfpv5spd16 armv8m-maine-vfpv5spd16"
 ARMPKGARCH:tune-armv8m-main                      = "armv8m-main"
 ARMPKGARCH:tune-armv8m-maine                     = "armv8m-main"
diff --git a/meta/conf/machine/include/arm/feature-arm-crc.inc b/meta/conf/machine/include/arm/feature-arm-crc.inc
new file mode 100644
index 000000000000..8a69d2e2faab
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-crc.inc
@@ -0,0 +1,4 @@
+# Cyclic Redundancy Check (CRC) instructions for armv8-a and armv8-r
+
+TUNEVALID[crc] = "Enable instructions for ARMv8 Cyclic Redundancy Check (CRC)"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-crypto.inc b/meta/conf/machine/include/arm/feature-arm-crypto.inc
new file mode 100644
index 000000000000..aade6ce08d5e
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-crypto.inc
@@ -0,0 +1,5 @@
+# Cryptographic instructions for:
+# armv8-a, armv8.1-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, and armv8-r
+
+TUNEVALID[crypto] = "Enable cryptographic instructions for ARMv8"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-dsp.inc b/meta/conf/machine/include/arm/feature-arm-dsp.inc
new file mode 100644
index 000000000000..ec5007a8ca75
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-dsp.inc
@@ -0,0 +1,2 @@
+# Note: TUNEVALID set in conf/machine/include/arm/arch-armv5-dsp.inc
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], '+dsp', '', d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
index eaddd054cec6..174b9b9f2a13 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -19,3 +19,8 @@ TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv4', 'neon' ],
 
 TUNEVALID[vfpv4d16] = "Enable Vector Floating Point Version 4 with 16 registers (vfpv4-d16) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4d16', ' vfpv4-d16', '', d)}"
+
+TUNEVALID[vfpv5spd16] = "Enable Vector Floating Point Version 5, Single Precision. with 16 registers (fpv5-sp-d16) unit."
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv5spd16', 'fpv5-sp-d16', '', d)}"
+
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv3d16', 'vfpv5spd16' ], '+fp', '', d)}"
-- 
2.20.1

