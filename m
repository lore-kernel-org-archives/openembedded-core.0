Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.64754.1629341543777485852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 19:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=DgqBc5Ek;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id cu12so1295582qvb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 19:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xjbaq5yNkKG3Ng0fOZ3JosJr1abXYtLldpK04o5JnMA=;
        b=DgqBc5EkuPFKhKOGmLMNQakOsKPc3ERpMBDkG0pvACbt+lzu6Sknpj/QKtoB+IdddH
         q4Xd2QzX9AYVW3NUqavdWfOgdRwAQpOf0rC3soY0jTNEBBLZt9yFXj5m/68t+PZgFoSW
         BF33ESJJkco48mUBIJlcQK9ZBM3RXAC4pW/RnfxQorjVnhkYyXreCLdf3PelnIzYo+u7
         Rcund7YsRQNBlb7qbSKu+ayLFdbY+O7bND86qm6qXRsdrYxuFc2491SsaoGv1v3wulUa
         SDa/hB88vcfhtsRPT921rtz5hFziWTkJMGwIirdjhgDN36lvIV1vO0+CkVxc6QRc1i7q
         xZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xjbaq5yNkKG3Ng0fOZ3JosJr1abXYtLldpK04o5JnMA=;
        b=kOEsgFT0mcIqlylzFb5WgY6odwjUpJFYSDVCzCOB8ta5IBS+TPAWtk0KcnacuKkU0b
         PHweJ98dc1pjspnGUB53s/BEhqW1cI/1JJh/bUDe4OKMgEXFiaY152+tUKjQaGkTVLvV
         JJzHqNE37c+ISEZotnV0mejsoV2EdrYDHAjd88wm0MrQ6vjEqwanjK72VvREQ00yxsSI
         FJXUXfOThdsAQhdao9jz+rAr0xIEn3OfE9URDcToKmUjoKqpVdYFcc/4KT7/8vOj/0nX
         AjViIwTgMteiFJ+X840defbgiszZ4aDMercKOMYlvRa1ots3ApDmt2NjDh948oIbBAAO
         eVbg==
X-Gm-Message-State: AOAM533Jct+0mTC6OWONDJ3eJ8mfGKro+3pji1K4eBV12uoaEIAL86WH
	A97y/d0MwMEqBAg/t9KHLwTv1PFmoo+AvA==
X-Google-Smtp-Source: ABdhPJyWcUbGZSjH9TxFkSF+9Cmzr0RzWzd4SQ9UAcx6Pmx1MWZKa7X+iYqdaOcjRhzzU8bNXIruYg==
X-Received: by 2002:a05:6214:324:: with SMTP id j4mr12420405qvu.22.1629341542627;
        Wed, 18 Aug 2021 19:52:22 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:112:190f:5b05:3b91])
        by smtp.gmail.com with ESMTPSA id f124sm983619qkj.85.2021.08.18.19.52.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:52:22 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] tune-cortexr*: add support for all Arm Cortex-R processors
Date: Wed, 18 Aug 2021 22:52:21 -0400
Message-Id: <20210819025221.1600-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210819025221.1600-1-jdmason@kudzu.us>
References: <20210819025221.1600-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tune entries for all Arm Cortex-R processors currently supported in
GCC.  Also, add the simd feature, which can be used in ARMv7a and
ARMv8a, but currently isn't.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/include/arm/arch-armv7a.inc |  1 +
 meta/conf/machine/include/arm/arch-armv7r.inc | 22 +++++++++++
 meta/conf/machine/include/arm/arch-armv8r.inc | 38 +++++++++++++++++++
 .../include/arm/armv7r/tune-cortexr4.inc      | 14 +++++++
 .../include/arm/armv7r/tune-cortexr4f.inc     | 14 +++++++
 .../include/arm/armv7r/tune-cortexr5.inc      | 14 +++++++
 .../include/arm/armv7r/tune-cortexr7.inc      | 14 +++++++
 .../include/arm/armv7r/tune-cortexr8.inc      | 14 +++++++
 .../include/arm/armv8r/tune-cortexr52.inc     | 14 +++++++
 .../machine/include/arm/feature-arm-idiv.inc  |  2 +
 .../machine/include/arm/feature-arm-simd.inc  |  5 +++
 11 files changed, 152 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv7r.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8r.inc
 create mode 100644 meta/conf/machine/include/arm/armv7r/tune-cortexr4.inc
 create mode 100644 meta/conf/machine/include/arm/armv7r/tune-cortexr4f.inc
 create mode 100644 meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc
 create mode 100644 meta/conf/machine/include/arm/armv7r/tune-cortexr7.inc
 create mode 100644 meta/conf/machine/include/arm/armv7r/tune-cortexr8.inc
 create mode 100644 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
 create mode 100644 meta/conf/machine/include/arm/feature-arm-idiv.inc
 create mode 100644 meta/conf/machine/include/arm/feature-arm-simd.inc

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 0a805b3be26a..74fc8d11ab83 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -8,6 +8,7 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:',
 
 require conf/machine/include/arm/arch-armv6.inc
 require conf/machine/include/arm/feature-arm-neon.inc
+require conf/machine/include/arm/feature-arm-simd.inc
 
 # Little Endian base configs
 AVAILTUNES += "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 armv7a-vfpv3 armv7at-vfpv3 armv7a-vfpv4d16 armv7at-vfpv4d16 armv7a-neon armv7at-neon armv7a-neon-vfpv4 armv7at-neon-vfpv4"
diff --git a/meta/conf/machine/include/arm/arch-armv7r.inc b/meta/conf/machine/include/arm/arch-armv7r.inc
new file mode 100644
index 000000000000..fac26cf4ad3f
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv7r.inc
@@ -0,0 +1,22 @@
+#
+# Defaults for ARMv7-r
+#
+DEFAULTTUNE ?= "armv7r"
+
+TUNEVALID[armv7r] = "Enable instructions for ARMv7-r"
+TUNE_CCARGS_MARCH = "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', ' -march=armv7-r', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 'armv7r:', '', d)}"
+
+TUNECONFLICTS[armv7r] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv6.inc
+require conf/machine/include/arm/feature-arm-idiv.inc
+require conf/machine/include/arm/feature-arm-neon.inc
+
+AVAILTUNES                            += "armv7r armv7r-vfpv3d16"
+ARMPKGARCH:tune-armv7r                 = "armv7r"
+ARMPKGARCH:tune-armv7r-vfpv3d16        = "armv7r"
+TUNE_FEATURES:tune-armv7r              = "armv7r"
+TUNE_FEATURES:tune-armv7r-vfpv3d16     = "${TUNE_FEATURES:tune-armv7r} vfpv3d16"
+PACKAGE_EXTRA_ARCHS:tune-armv7r        = "armv7r"
+PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16  = "${PACKAGE_EXTRA_ARCHS:tune-armv7r} tune-armv7r-fpv3d16"
diff --git a/meta/conf/machine/include/arm/arch-armv8r.inc b/meta/conf/machine/include/arm/arch-armv8r.inc
new file mode 100644
index 000000000000..be4ef3e629df
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8r.inc
@@ -0,0 +1,38 @@
+#
+# Defaults for ARMv8-r
+#
+DEFAULTTUNE ?= "armv8r"
+
+TUNEVALID[armv8r] = "Enable instructions for ARMv8-r"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8r', ' -march=armv8-r', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8r', 'armv8r:', '', d)}"
+
+require conf/machine/include/arm/arch-arm64.inc
+require conf/machine/include/arm/feature-arm-simd.inc
+require conf/machine/include/arm/feature-arm-crc.inc
+require conf/machine/include/arm/feature-arm-crypto.inc
+
+# All ARMv8 has floating point hardware built in.  Null it here to avoid any confusion for 32bit.
+TARGET_FPU_32 = ""
+
+AVAILTUNES += "armv8r armv8r-crc armv8r-crypto armv8r-simd armv8r-crc-crypto armv8r-crc-simd armv8r-crc-crypto-simd"
+ARMPKGARCH:tune-armv8r                          = "armv8r"
+ARMPKGARCH:tune-armv8r-crc                      = "armv8r"
+ARMPKGARCH:tune-armv8r-crypto                   = "armv8r"
+ARMPKGARCH:tune-armv8r-simd                     = "armv8r"
+ARMPKGARCH:tune-armv8r-crc-crypto               = "armv8r"
+ARMPKGARCH:tune-armv8r-crc-simd                 = "armv8r"
+ARMPKGARCH:tune-armv8r-crc-crypto-simd          = "armv8r"
+TUNE_FEATURES:tune-armv8r                       = "armv8r"
+TUNE_FEATURES:tune-armv8r-crc                   = "${TUNE_FEATURES:tune-armv8r} crc"
+TUNE_FEATURES:tune-armv8r-crypto                = "${TUNE_FEATURES:tune-armv8r} crypto"
+TUNE_FEATURES:tune-armv8r-simd                  = "${TUNE_FEATURES:tune-armv8r} simd"
+TUNE_FEATURES:tune-armv8r-crc-crypto            = "${TUNE_FEATURES:tune-armv8r-crc} crypto"
+TUNE_FEATURES:tune-armv8r-crc-simd              = "${TUNE_FEATURES:tune-armv8r-crc} simd"
+TUNE_FEATURES:tune-armv8r-crc-crypto-simd       = "${TUNE_FEATURES:tune-armv8r-crc-crypto} simd"
+PACKAGE_EXTRA_ARCHS:tune-armv8r                 = "armv8r"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-crc             = "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crc"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-simd            = "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-simd"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd        = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc} armv8r-simd armv8r-crc-simd"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-crypto-simd = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd} armv8r-crc-crypto-simd"
diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr4.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr4.inc
new file mode 100644
index 000000000000..0eed72963024
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr4.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R4
+#
+DEFAULTTUNE ?= "cortexr4"
+
+TUNEVALID[cortexr4] = "Enable Cortex-R4 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4', ' -mcpu=cortex-r4', '', d)}"
+
+require conf/machine/include/arm/arch-armv7r.inc
+
+AVAILTUNES                            += "cortexr4"
+ARMPKGARCH:tune-cortexr4               = "cortexr4"
+TUNE_FEATURES:tune-cortexr4            = "${TUNE_FEATURES:tune-armv7r} cortexr4"
+PACKAGE_EXTRA_ARCHS:tune-cortexr4      = "${PACKAGE_EXTRA_ARCHS:tune-armv7r} cortexr4"
diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr4f.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr4f.inc
new file mode 100644
index 000000000000..0712b3ab1b06
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr4f.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R4F
+#
+DEFAULTTUNE ?= "cortexr4f"
+
+TUNEVALID[cortexr4f] = "Enable Cortex-R4F specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4f', ' -mcpu=cortex-r4f', '', d)}"
+
+require conf/machine/include/arm/arch-armv7r.inc
+
+AVAILTUNES                            += "cortexr4f"
+ARMPKGARCH:tune-cortexr4f              = "cortexr4f"
+TUNE_FEATURES:tune-cortexr4f           = "${TUNE_FEATURES:tune-armv7r-vfpv3d16} cortexr4f"
+PACKAGE_EXTRA_ARCHS:tune-cortexr4f     = "${PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16} cortexr4f-vfpv3d16"
diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc
new file mode 100644
index 000000000000..ecaaa0d846a4
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R5
+#
+DEFAULTTUNE ?= "cortexr5"
+
+TUNEVALID[cortexr5] = "Enable Cortex-R5 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr5', ' -mcpu=cortex-r5', '', d)}"
+
+require conf/machine/include/arm/arch-armv7r.inc
+
+AVAILTUNES                            += "cortexr5"
+ARMPKGARCH:tune-cortexr5               = "cortexr5"
+TUNE_FEATURES:tune-cortexr5            = "${TUNE_FEATURES:tune-armv7r-vfpv3d16} cortexr5 idiv"
+PACKAGE_EXTRA_ARCHS:tune-cortexr5      = "${PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16} cortexr5-vfpv3d16"
diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr7.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr7.inc
new file mode 100644
index 000000000000..bfae1f00751e
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr7.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R7
+#
+DEFAULTTUNE ?= "cortexr7"
+
+TUNEVALID[cortexr7] = "Enable Cortex-R7 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr7', ' -mcpu=cortex-r7', '', d)}"
+
+require conf/machine/include/arm/arch-armv7r.inc
+
+AVAILTUNES                            += "cortexr7"
+ARMPKGARCH:tune-cortexr7               = "cortexr7"
+TUNE_FEATURES:tune-cortexr7            = "${TUNE_FEATURES:tune-armv7r-vfpv3d16} cortexr7 idiv"
+PACKAGE_EXTRA_ARCHS:tune-cortexr7      = "${PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16} cortexr7-vfpv3d16"
diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr8.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr8.inc
new file mode 100644
index 000000000000..7fb824f6e91e
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr8.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R8
+#
+DEFAULTTUNE ?= "cortexr8"
+
+TUNEVALID[cortexr8] = "Enable Cortex-R8 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr8', ' -mcpu=cortex-r8', '', d)}"
+
+require conf/machine/include/arm/arch-armv7r.inc
+
+AVAILTUNES                            += "cortexr8"
+ARMPKGARCH:tune-cortexr8               = "cortexr8"
+TUNE_FEATURES:tune-cortexr8            = "${TUNE_FEATURES:tune-armv7r-vfpv3d16} cortexr8 idiv"
+PACKAGE_EXTRA_ARCHS:tune-cortexr8      = "${PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16} cortexr8-vfpv3d16"
diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
new file mode 100644
index 000000000000..3a97cf8ee829
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R52
+#
+DEFAULTTUNE ?= "cortexr52"
+
+TUNEVALID[cortexr52] = "Enable Cortex-R52 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr52', ' -mcpu=cortex-r52', '', d)}"
+
+require conf/machine/include/arm/arch-armv8r.inc
+
+AVAILTUNES                             += "cortexr52"
+ARMPKGARCH:tune-cortexr52               = "cortexr52"
+TUNE_FEATURES:tune-cortexr52            = "${TUNE_FEATURES:tune-armv8r-crc-simd} cortexr52"
+PACKAGE_EXTRA_ARCHS:tune-cortexr52      = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd} cortexr52"
diff --git a/meta/conf/machine/include/arm/feature-arm-idiv.inc b/meta/conf/machine/include/arm/feature-arm-idiv.inc
new file mode 100644
index 000000000000..0ea42b1b39db
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-idiv.inc
@@ -0,0 +1,2 @@
+TUNEVALID[idiv] = "ARM-state integer division instructions"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'idiv', '+idiv', '', d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-simd.inc b/meta/conf/machine/include/arm/feature-arm-simd.inc
new file mode 100644
index 000000000000..1afaf8d90138
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-simd.inc
@@ -0,0 +1,5 @@
+# Advanced SIMD and floating-point instructions for armv7-a, armv7ve,
+# armv8-a, armv8.1-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, and armv8-r
+
+TUNEVALID[simd] = "Enable instructions for Advanced SIMD and floating-point units"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
-- 
2.20.1

