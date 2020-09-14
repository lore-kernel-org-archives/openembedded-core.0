Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.62839.1600096453413344032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=In9N7xun;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id o16so390047qkj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nC6elHBx+PMViGq87UBqCAgYnvWiV9z1si3Q5g5G8RU=;
        b=In9N7xunDfnhboRqeoMCF1x6ehTDkcrqIWmYfy1pDYM0UDcuIARy8NgnYxPjC+JyfE
         G3K3TOCNmPmad6UZLMYkAheMsF3KPYRGOtIrHA7wkzwYKDU5PTGX5CTMJMfGpYjxvcaw
         L94bIQZE3UPoCc0s1BQCXFACJHJ0Xj83Yf+zphVHJidwK4MLhNlqFRnGE9HG/IT48GjG
         XO/kVV8eLJDp3pM2kJ44IaC3AoTrWc5kp349oeHNdKBUBYgiUFG82A32+0af9jEMtkr6
         yYoHm2+BJPl7uJfD0AvztgFvmWb9Pa+1StzpFElyXHfDnRFByAEPDJVtm40JByLJ2fTb
         nPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nC6elHBx+PMViGq87UBqCAgYnvWiV9z1si3Q5g5G8RU=;
        b=bkM7crIJONJN1K/5sUKnEgoksz3XfFOdjXrd+Rz8JW6joqj2XgDf3zPRshgmPUrxeB
         uuaqVi3Ue5P84meg59P2hSFDN6rs1xdjy/qMVVSdy9qnAD/K0fWHOK4O0rA956q15E2r
         6ifpQu9e9WuJmkU8KvBykwSLOM8YcWEm9hkL7StQuf6DEPhaS7gN1EklgTujCFx10A8P
         /XMphvBYonmAhsSQfl+Uz4SjnblmAG9h0euRrbmgdkX/Ugvu3dx/8lU09WUD5VXO4bS0
         F6ZQgw7W721LgaPv+J0TrCM4MlYacyk8hLf+XZuReUQSbL9OL07Fan6l18gqZ0OO6TLv
         TWYw==
X-Gm-Message-State: AOAM530Txx2BFiAoHy2kggj+U+xreMuclMuFlsyORigzGS5dRZGKbxmf
	A+TYjVlTO4KI/l6lqQSxiInB/j4YZ5mx7cvi
X-Google-Smtp-Source: ABdhPJyWhO68XP7Im7UJ2/4DUX7BHRKZJVbmznq/Id2sxgbmGefMfLP4VxmDAgfbWbotUWYEPenXEg==
X-Received: by 2002:a05:620a:1227:: with SMTP id v7mr13540245qkj.265.1600096451634;
        Mon, 14 Sep 2020 08:14:11 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id t11sm9373480qkm.55.2020.09.14.08.14.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:14:11 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] arch-armv8a.inc: Add existing tunings
Date: Mon, 14 Sep 2020 11:13:56 -0400
Message-Id: <20200914151359.11240-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200914151359.11240-1-jon.mason@arm.com>
References: <20200914151359.11240-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Migrate the existing tune settings to arch-armv8a.inc.  This will allow
for a single file to include all of the tunings of a family of
processors.  This will reduce the proliferation of unique files per
processor currently occurring in conf/machine/include/

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/arch-armv8a.inc | 157 +++++++++++++++++-
 meta/conf/machine/include/tune-cortexa32.inc  |  18 --
 meta/conf/machine/include/tune-cortexa35.inc  |  17 --
 meta/conf/machine/include/tune-cortexa53.inc  |  18 --
 .../include/tune-cortexa57-cortexa53.inc      |  15 --
 meta/conf/machine/include/tune-cortexa57.inc  |  17 --
 .../include/tune-cortexa72-cortexa53.inc      |  20 ---
 meta/conf/machine/include/tune-cortexa72.inc  |  13 --
 .../include/tune-cortexa73-cortexa53.inc      |  20 ---
 meta/conf/machine/include/tune-thunderx.inc   |  19 ---
 10 files changed, 155 insertions(+), 159 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-cortexa32.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa35.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa53.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa57-cortexa53.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa57.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa72.inc
 delete mode 100644 meta/conf/machine/include/tune-cortexa73-cortexa53.inc
 delete mode 100644 meta/conf/machine/include/tune-thunderx.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index f810a1e8fc98..eaf601216a3d 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -1,4 +1,155 @@
-DEFAULTTUNE ?= "armv8a-crc"
+#
+# Tune Settings for Cortex-A32 (32bit only)
+#
+TUNEVALID[cortexa32] = "Enable Cortex-A32 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa32 cortexa32-crypto"
+ARMPKGARCH_tune-cortexa32                  = "cortexa32"
+ARMPKGARCH_tune-cortexa32-crypto           = "cortexa32"
+TUNE_FEATURES_tune-cortexa32               = "armv8a cortexa32 crc"
+TUNE_FEATURES_tune-cortexa32-crypto        = "${TUNE_FEATURES_tune-cortexa32} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa32         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
+PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
+BASE_LIB_tune-cortexa32                    = "lib"
+BASE_LIB_tune-cortexa32-crypto             = "lib"
+
+#
+# Tune Settings for Cortex-A35
+#
+TUNEVALID[cortexa35] = "Enable Cortex-A35 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa35 cortexa35-crypto"
+ARMPKGARCH_tune-cortexa35                  = "cortexa35"
+ARMPKGARCH_tune-cortexa35-crypto           = "cortexa35"
+TUNE_FEATURES_tune-cortexa35               = "aarch64 cortexa35 crc"
+TUNE_FEATURES_tune-cortexa35-crypto        = "${TUNE_FEATURES_tune-cortexa35} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
+BASE_LIB_tune-cortexa35                    = "lib64"
+BASE_LIB_tune-cortexa35-crypto             = "lib64"
+
+#
+# Tune Settings for Cortex-A53
+#
+TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa53 cortexa53-crypto"
+ARMPKGARCH_tune-cortexa53                  = "cortexa53"
+ARMPKGARCH_tune-cortexa53-crypto           = "cortexa53-crypto"
+TUNE_FEATURES_tune-cortexa53               = "aarch64 cortexa53 crc"
+TUNE_FEATURES_tune-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa53} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
+BASE_LIB_tune-cortexa53                    = "lib64"
+BASE_LIB_tune-cortexa53-crypto             = "lib64"
+
+#
+# Tune Settings for Cortex-A57
+#
+TUNEVALID[cortexa57] = "Enable Cortex-A57 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa57', ' -mcpu=cortex-a57', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa57 cortexa57-crypto"
+ARMPKGARCH_tune-cortexa57                  = "cortexa57"
+ARMPKGARCH_tune-cortexa57-crypto           = "cortexa57-crypto"
+TUNE_FEATURES_tune-cortexa57               = "aarch64 cortexa57 crc"
+TUNE_FEATURES_tune-cortexa57-crypto        = "${TUNE_FEATURES_tune-cortexa57} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
+BASE_LIB_tune-cortexa57                    = "lib64"
+BASE_LIB_tune-cortexa57-crypto             = "lib64"
+
+#
+# Tune Settings for Cortex-A72
+#
+TUNEVALID[cortexa72] = "Enable Cortex-A72 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa72"
+ARMPKGARCH_tune-cortexa72                  = "cortexa72"
+TUNE_FEATURES_tune-cortexa72               = "aarch64 cortexa72 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
+BASE_LIB_tune-cortexa72                    = "lib64"
+BASE_LIB_tune-cortexa72-crypto             = "lib64"
+
+#
+# Tune Settings for ThunderX
+#
+TUNEVALID[thunderx] = "Enable instructions for Cavium ThunderX"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx', '',d)}"
+
+AVAILTUNES                                += "thunderx thunderx_be"
+ARMPKGARCH_tune-thunderx                  ?= "thunderx"
+ARMPKGARCH_tune-thunderx_be               ?= "thunderx_be"
+TUNE_FEATURES_tune-thunderx                = "${TUNE_FEATURES_tune-aarch64} thunderx"
+TUNE_FEATURES_tune-thunderx_be             = "${TUNE_FEATURES_tune-thunderx} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-thunderx          = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} thunderx"
+PACKAGE_EXTRA_ARCHS_tune-thunderx_be       = "aarch64_be thunderx_be"
+BASE_LIB_tune-thunderx                     = "lib64"
+BASE_LIB_tune-thunderx_be                  = "lib64"
+
+#
+# Tune Settings for big.LITTLE Cortex-A57 - Cortex-A53
+#
+TUNEVALID[cortexa57-cortexa53] = "Enable big.LITTLE Cortex-A57.Cortex-A53 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=cortex-a57.cortex-a53", "", d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "" ,d)}"
+
+# Little Endian base configs
+AVAILTUNES                                += "cortexa57-cortexa53"
+ARMPKGARCH_tune-cortexa57-cortexa53        = "cortexa57-cortexa53"
+TUNE_FEATURES_tune-cortexa57-cortexa53     = "aarch64 crc cortexa57-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57-cortexa53"
+BASE_LIB_tune-cortexa57-cortexa53          = "lib64"
+
+#
+# Tune Settings for big.LITTLE Cortex-A72 - Cortex-A53
+#
+TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=cortex-a72.cortex-a53", "", d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
+
+# cortexa72.cortexa53 implies crc support
+AVAILTUNES                                += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
+ARMPKGARCH_tune-cortexa72-cortexa53        = "cortexa72-cortexa53"
+ARMPKGARCH_tune-cortexa72-cortexa53-crypto = "cortexa72-cortexa53-crypto"
+TUNE_FEATURES_tune-cortexa72-cortexa53     = "aarch64 crc cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53-crypto = "${TUNE_FEATURES_tune-cortexa72-cortexa53} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
+BASE_LIB_tune-cortexa72-cortexa53          = "lib64"
+BASE_LIB_tune-cortexa72-cortexa53-crypto   = "lib64"
+
+#
+# Tune Settings for big.LITTLE Cortex-A73 - Cortex-A53
+#
+TUNEVALID[cortexa73-cortexa53] = "Enable big.LITTLE Cortex-A73.Cortex-A53 specific processor optimizations"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=cortex-a73.cortex-a53", "", d)}"
+
+# cortexa73.cortexa53 implies crc support
+AVAILTUNES                                += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
+ARMPKGARCH_tune-cortexa73-cortexa53        = "cortexa73-cortexa53"
+ARMPKGARCH_tune-cortexa73-cortexa53-crypto = "cortexa73-cortexa53-crypto"
+TUNE_FEATURES_tune-cortexa73-cortexa53     = "aarch64 crc cortexa73-cortexa53"
+TUNE_FEATURES_tune-cortexa73-cortexa53-crypto = "${TUNE_FEATURES_tune-cortexa73-cortexa53} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa73-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
+BASE_LIB_tune-cortexa73-cortexa53          = "lib64"
+BASE_LIB_tune-cortexa73-cortexa53-crypto   = "lib64"
+
+#
+# Defaults for ARMv8-a
+#
+DEFAULTTUNE                               ?= "armv8a-crc"
 
 TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
@@ -8,10 +159,12 @@ TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"
 
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+
 require conf/machine/include/arm/arch-arm64.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
+AVAILTUNES                                += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
 ARMPKGARCH_tune-armv8a                    ?= "armv8a"
 ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
 ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
deleted file mode 100644
index 0ffb3e068855..000000000000
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DEFAULTTUNE ?= "cortexa32"
-
-
-TUNEVALID[cortexa32] = "Enable Cortex-A32 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa32 cortexa32-crypto"
-ARMPKGARCH_tune-cortexa32             = "cortexa32"
-ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
-TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
-TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
-PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
-BASE_LIB_tune-cortexa32               = "lib"
-BASE_LIB_tune-cortexa32-crypto        = "lib"
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
deleted file mode 100644
index 61696da540cc..000000000000
--- a/meta/conf/machine/include/tune-cortexa35.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DEFAULTTUNE ?= "cortexa35"
-
-TUNEVALID[cortexa35] = "Enable Cortex-A35 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa35 cortexa35-crypto"
-ARMPKGARCH_tune-cortexa35             = "cortexa35"
-ARMPKGARCH_tune-cortexa35-crypto      = "cortexa35"
-TUNE_FEATURES_tune-cortexa35          = "aarch64 cortexa35 crc"
-TUNE_FEATURES_tune-cortexa35-crypto   = "${TUNE_FEATURES_tune-cortexa35} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
-PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
-BASE_LIB_tune-cortexa35               = "lib64"
-BASE_LIB_tune-cortexa35-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
deleted file mode 100644
index 79ce7c4b1c21..000000000000
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DEFAULTTUNE ?= "cortexa53"
-
-TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa53 cortexa53-crypto"
-ARMPKGARCH_tune-cortexa53             = "cortexa53"
-ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53-crypto"
-TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 crc"
-TUNE_FEATURES_tune-cortexa53-crypto   = "${TUNE_FEATURES_tune-cortexa53} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
-PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
-
-BASE_LIB_tune-cortexa53               = "lib64"
-BASE_LIB_tune-cortexa53-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
deleted file mode 100644
index 5880bf203231..000000000000
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DEFAULTTUNE ?= "cortexa57-cortexa53"
-
-TUNEVALID[cortexa57-cortexa53] = "Enable big.LITTLE Cortex-A57.Cortex-A53 specific processor optimizations"
-TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=cortex-a57.cortex-a53", "", d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "" ,d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa57-cortexa53"
-ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
-TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 crc cortexa57-cortexa53"
-PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57-cortexa53"
-BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
deleted file mode 100644
index 3206ce75a6b6..000000000000
--- a/meta/conf/machine/include/tune-cortexa57.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DEFAULTTUNE ?= "cortexa57"
-
-TUNEVALID[cortexa57] = "Enable Cortex-A57 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa57', ' -mcpu=cortex-a57', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa57 cortexa57-crypto"
-ARMPKGARCH_tune-cortexa57             = "cortexa57"
-ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57-crypto"
-TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
-TUNE_FEATURES_tune-cortexa57-crypto   = "${TUNE_FEATURES_tune-cortexa57} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
-PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
-BASE_LIB_tune-cortexa57               = "lib64"
-BASE_LIB_tune-cortexa57-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
deleted file mode 100644
index feb1df5c178d..000000000000
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DEFAULTTUNE ?= "cortexa72-cortexa53"
-
-TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
-TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=cortex-a72.cortex-a53", "", d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# cortexa72.cortexa53 implies crc support
-AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
-ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
-ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53-crypto"
-TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-cortexa53"
-TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa72-cortexa53} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
-BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
-BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
-
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
deleted file mode 100644
index 00f7745a22fd..000000000000
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DEFAULTTUNE ?= "cortexa72"
-
-TUNEVALID[cortexa72] = "Enable Cortex-A72 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa72"
-ARMPKGARCH_tune-cortexa72             = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
-BASE_LIB_tune-cortexa72               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
deleted file mode 100644
index 1c221999f408..000000000000
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DEFAULTTUNE ?= "cortexa73-cortexa53"
-
-TUNEVALID[cortexa73-cortexa53] = "Enable big.LITTLE Cortex-A73.Cortex-A53 specific processor optimizations"
-TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "" ,d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=cortex-a73.cortex-a53", "", d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# cortexa73.cortexa53 implies crc support
-AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
-ARMPKGARCH_tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
-ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53-crypto"
-TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-cortexa53"
-TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa73-cortexa53} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
-PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
-BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
-BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
-
diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
deleted file mode 100644
index aa4d0501d400..000000000000
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DEFAULTTUNE ?= "thunderx"
-AVAILTUNES += "thunderx thunderx_be"
-
-TUNEVALID[thunderx] = "Enable instructions for Cavium ThunderX"
-
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx', '',d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-ARMPKGARCH_tune-thunderx ?= "thunderx"
-ARMPKGARCH_tune-thunderx_be ?= "thunderx_be"
-
-TUNE_FEATURES_tune-thunderx = "${TUNE_FEATURES_tune-aarch64} thunderx"
-TUNE_FEATURES_tune-thunderx_be = "${TUNE_FEATURES_tune-thunderx} bigendian"
-BASE_LIB_tune-thunderx = "lib64"
-BASE_LIB_tune-thunderx_be = "lib64"
-
-PACKAGE_EXTRA_ARCHS_tune-thunderx = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} thunderx"
-PACKAGE_EXTRA_ARCHS_tune-thunderx_be = "aarch64_be thunderx_be"
-- 
2.20.1

