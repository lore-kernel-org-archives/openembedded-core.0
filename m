Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.6609.1589432611113001482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 22:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rW0D50xl;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id t7so730228plr.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 22:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tzu4WwEcqhXukuB0mEr3kCeNoDoZ+igUrBVFDY4A4Wc=;
        b=rW0D50xlhHRIgKV+wQ/JYzUb0kZWQ1W88eoToEqNaUD9FWgmnLZVNF1jHIMcdgIyew
         o8rWcjdr3WQ71oVzz6qaENyg99Edl+UddF40mkSIcvajv66K8IqETzT0ki5OxWA4ofdR
         zXnOQ34uKuDFmSwCg9aT0NBUli7cR84oAacwfdzvdyqbo/u8u6wSWX78yZNKT31iTRAu
         KFKpCMTggs23+djcgwn1OYwmUtZpN6Z5tfn1CthsaA9cF8G3eOLMP9dhPjX7R1vhg2cU
         qstZu/3q+AFcdvRtYwGPWyJUR2p4z8aADvp/1dilV/VlekBbEKEuD5lghti9AQ15iF64
         aLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tzu4WwEcqhXukuB0mEr3kCeNoDoZ+igUrBVFDY4A4Wc=;
        b=c7OBE2WlM87lCkQRVUtkaEpX/s9K/f9bR6XZpKXTrsupvXG4u4NynJL9XTXORTFxZG
         2fGqG7L+dW0umXRCqIyQCyrFu7NL3y8pbFKI7uHXAP/nIcowm3Ayn2pbW51QOvX8XRFW
         pYAl+aSs/NkoBUdYwNoPLpp54I4hCUgICCJyZ06kqqSTcKGHpdAllZnUbSNvmVOICSl0
         Sr+KADquXTfZ4jqoZ4M52dzKJ2P+QSiI3pqYWHCGalkR2ya2BFuRSW3nk2ets6F//fbC
         Imy45DbbZXxu9Fn8irxAmqrQQWoga+VrqWk65wZQgQfzD4duNNVj40tezIfC7FvjWQzJ
         AaCA==
X-Gm-Message-State: AOAM532zMV3rgr0ChxT9c+FFNbvYaRR2p87kcwutWYf3rVopE2baQfR5
	KcIuNyDu7BtOffKYlFqzniiSKKHgouM=
X-Google-Smtp-Source: ABdhPJxtOElIvoNoEFwqscgrejLAdkRzG9I2nRhGIeprJpTqdB5ewIYO+L3uqsDUzHLXsjTGXeIDJA==
X-Received: by 2002:a17:902:8a81:: with SMTP id p1mr2477221plo.104.1589432609969;
        Wed, 13 May 2020 22:03:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id z7sm1067649pff.47.2020.05.13.22.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 22:03:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/6] aarch64: Adjust big.LITTLE tune files to use -mcpu
Date: Wed, 13 May 2020 22:03:20 -0700
Message-Id: <20200514050321.1292228-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514050321.1292228-1-raj.khem@gmail.com>
References: <20200514050321.1292228-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mcpu is more appropriate on aarch64 and generates more optimized code
forr a given SOC, unlike -march/-mtune combination as decribed here [1]

[1] https://community.arm.com/developer/tools-software/tools/b/tools-software-ides-blog/posts/compiler-flags-across-architectures-march-mtune-and-mcpu

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/machine/include/tune-cortexa57-cortexa53.inc |  9 +++------
 .../conf/machine/include/tune-cortexa72-cortexa53.inc | 11 ++++-------
 .../conf/machine/include/tune-cortexa73-cortexa53.inc | 11 ++++-------
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
index d05e93f51e..ba4b073852 100644
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -1,18 +1,15 @@
 DEFAULTTUNE ?= "cortexa57-cortexa53"
-require conf/machine/include/arm/arch-armv8a.inc
 
 TUNEVALID[cortexa57-cortexa53] = "Enable big.LITTLE Cortex-A57.Cortex-A53 specific processor optimizations"
 TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
-
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", " -march=armv8-a", "" ,d)}"
-
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=cortex-a57.cortex-a53", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "" ,d)}"
 
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mtune=cortex-a57.cortex-a53", "", d)}"
+require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
 AVAILTUNES += "cortexa57-cortexa53"
 ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
-TUNE_FEATURES_tune-cortexa57-cortexa53 = "${TUNE_FEATURES_tune-aarch64} cortexa57-cortexa53"
+TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 cortexa57-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa57-cortexa53"
 BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
index f208b98e3e..5c54aa33ea 100644
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -1,21 +1,18 @@
 DEFAULTTUNE ?= "cortexa72-cortexa53"
 
-require conf/machine/include/arm/arch-armv8a.inc
-
 TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
-
 TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
-
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=cortex-a72.cortex-a53", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
 
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mtune=cortex-a72.cortex-a53", "", d)}"
+require conf/machine/include/arm/arch-armv8a.inc
 
 # cortexa72.cortexa53 implies crc support
 AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
 ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
 ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53"
-TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72-cortexa53"
-TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "aarch64 crc crypto cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
 BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
index 8df418227f..431d244fe2 100644
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -1,21 +1,18 @@
 DEFAULTTUNE ?= "cortexa73-cortexa53"
 
-require conf/machine/include/arm/arch-armv8a.inc
-
 TUNEVALID[cortexa73-cortexa53] = "Enable big.LITTLE Cortex-A73.Cortex-A53 specific processor optimizations"
-
 TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
-
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=cortex-a73.cortex-a53", "", d)}"
 
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mtune=cortex-a73.cortex-a53", "", d)}"
+require conf/machine/include/arm/arch-armv8a.inc
 
 # cortexa73.cortexa53 implies crc support
 AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
 ARMPKGARCH_tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
 ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53"
-TUNE_FEATURES_tune-cortexa73-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa73-cortexa53"
-TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa73-cortexa53"
+TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-cortexa53"
+TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "aarch64 crc crypto cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
 BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
-- 
2.26.2

