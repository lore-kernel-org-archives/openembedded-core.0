Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.8725.1599691569183398284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=RATr4xKN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id g3so3332705qtq.10
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cw1J+jhfLGKijFlFn2x2IvTbJLCixK1pqvf7yvz65GQ=;
        b=RATr4xKN04gwQX0/YdIku5Ckjqr7yFVd16X1X1IqbBVDroiZcBqaB2dkjTyYJijz8D
         RvnsBTQmVhdHqxThyrNJ2nDir1VGmcPvuD27TFYLmxio9hil0p5ZX3oWdjqKtnKkdQfJ
         7CDvjhJhUDuolnXxeXFDQ9RMCNm9GDw/7fgoRlc5FLg7pjBqwb7wefR+sFihswBmZXDb
         kvl4iv+4jpRXAzLmV3NIzNMziz30LXa6CKpJiDLPeWIIW1DrekOUeES5EQ3t05UWZIyB
         KbyfMLSVDXIHQQKn5YnTK6PUxNTzotKX1ffJYBEN2Juoxp2DFhoMs6yAPrte4RsGVrQ6
         QoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cw1J+jhfLGKijFlFn2x2IvTbJLCixK1pqvf7yvz65GQ=;
        b=Y5EyASV+3ktkwXi0Q4RyS7xNx0cF4/vPJPGut70MxmBJ/Xu9/Mc0wd6Ec2+H5GNMlF
         El12sXU4Db9DvSEp2Bzx20FwvNOp31eaL9+RjkGnsiYVjQHfckB8yK3FrYlN/qJYTAib
         4uLgIzZCBUeYzxQbAwUWLu8M4s+pZkFZWyDPSj9B/9gIQByKcZtHxKVH++Zefdi0m8x6
         6PvLx+e74SvzwSrJvlWOQEIXnDr7PrCkw3zfGGtaPiCwYvtCIdX6iDcd6nTZOjMlSy9t
         GadITZoKF80K3xnxM3GJepz+DE8Q4noeLATndxZgkJVEmAqBpVqGiIVmda1DSxxAoGIU
         CcCw==
X-Gm-Message-State: AOAM532BT+ngFtipUVjoP9MYeYy4Gk98Rp6fx5XBbTHNGiIqm24bdBTK
	hRcpkpHSi4auhbfJl01Xpm78d7F5QgOfNTFE
X-Google-Smtp-Source: ABdhPJwl6TR7h6hdkatFDXSo0Cz3kLE07U1wAkrN74HhhqIDKFaObK3fALfWz/Vq2qjuxHbFST6Tpg==
X-Received: by 2002:ac8:44a7:: with SMTP id a7mr5576640qto.173.1599691567721;
        Wed, 09 Sep 2020 15:46:07 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 203sm4198744qke.59.2020.09.09.15.46.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:46:07 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][RFC 3/6] arch-armv8a.inc: Add existing tunings
Date: Wed,  9 Sep 2020 18:45:32 -0400
Message-Id: <20200909224535.27164-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909224535.27164-1-jon.mason@arm.com>
References: <20200909224535.27164-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Migrate the exting tune settings to arch-armv8a.inc.  This will allow
for a single file to include all of the tunings of a family of
processors.  This will reduce the proliferation of unique files per
processor currently occuring in conf/machine/include/

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/arch-armv8a.inc | 142 +++++++++++++++++-
 meta/conf/machine/include/tune-cortexa32.inc  |  19 ---
 meta/conf/machine/include/tune-cortexa35.inc  |  15 --
 meta/conf/machine/include/tune-cortexa53.inc  |  16 --
 .../include/tune-cortexa57-cortexa53.inc      |  14 --
 meta/conf/machine/include/tune-cortexa57.inc  |  15 --
 .../include/tune-cortexa72-cortexa53.inc      |  18 ---
 meta/conf/machine/include/tune-cortexa72.inc  |  12 --
 .../include/tune-cortexa73-cortexa53.inc      |  18 ---
 meta/conf/machine/include/tune-thunderx.inc   |  19 ---
 10 files changed, 140 insertions(+), 148 deletions(-)
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
index 5584005f7009..0d01a8f49f88 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -1,4 +1,140 @@
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
+
+#
+# Defaults for ARMv8-a
+#
+DEFAULTTUNE                               ?= "armv8a-crc"
 
 TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
@@ -8,10 +144,12 @@ TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
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
index 78dab8bed6e1..000000000000
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ /dev/null
@@ -1,19 +0,0 @@
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
-# Cortex-A32 is 32bit only
-BASE_LIB_tune-cortexa32               = "lib"
-BASE_LIB_tune-cortexa32-crypto        = "lib"
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
deleted file mode 100644
index 80825972b612..000000000000
--- a/meta/conf/machine/include/tune-cortexa35.inc
+++ /dev/null
@@ -1,15 +0,0 @@
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
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
deleted file mode 100644
index 385c2d225777..000000000000
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ /dev/null
@@ -1,16 +0,0 @@
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
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
deleted file mode 100644
index 02691d0deee2..000000000000
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ /dev/null
@@ -1,14 +0,0 @@
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
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
deleted file mode 100644
index 868939ca10c7..000000000000
--- a/meta/conf/machine/include/tune-cortexa57.inc
+++ /dev/null
@@ -1,15 +0,0 @@
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
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
deleted file mode 100644
index 34aaa6cc72a7..000000000000
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ /dev/null
@@ -1,18 +0,0 @@
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
-
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
deleted file mode 100644
index f0f76cad14db..000000000000
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ /dev/null
@@ -1,12 +0,0 @@
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
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
deleted file mode 100644
index 6da93ffac0b7..000000000000
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ /dev/null
@@ -1,18 +0,0 @@
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

