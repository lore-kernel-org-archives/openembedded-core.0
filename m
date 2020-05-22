Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.5543.1590111055285875731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 18:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oeHmBUds;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id m7so3759539plt.5
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 18:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VYhfT1/ooxll0nq8buf9KucOfB63zalkMzcnfmEDggg=;
        b=oeHmBUdsMdWUMPjIzASD33OOnbEaI9ZwhX2SWKmsHnIlvjf/q/7r+WDW1nWvgOo8Xq
         Nw2QiZNeWV35ROxEITN3m6EdjfY/Z6eBcMi2GynlhLsv1YsdPYseRPvWECIy0d9dWtjn
         mpdpL1KTSZzy9HPyOXL1+NaqJGuxFr6BRrAuteeU6u8uaS+M0ej3kGBog2nvUV7fpkga
         L1/IDJNMOv6cFMMUwFIqOd2AalNROda3XYRetjtj8VgFB5Je7fsPtm0F+gGmrBFpZHif
         HsrIruf500dFF71Q43vzzxntlFk7o/NQUo4S7PSrc7gaHs4rSf6pND3qUp1YgUOzB9Qs
         1ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VYhfT1/ooxll0nq8buf9KucOfB63zalkMzcnfmEDggg=;
        b=umbPBTIiok+CxtIwLyVcHJwzfSq4bc1doo2Oaixi7MxWM2syHemFVZZWeUvJO6t+YN
         iwvatqZIpqmFq/wdsZo5BftKEj90xYrP+3VkCt3F5NfaxhQOC5y/4lJJ6YuqdM9RReyb
         kCZgnHOwsa9NMSf4+NkCBfAPLE5wJZsGbjXaXp55uSsEpRs2gvkbUEz3mH/S8oh6DF4V
         IiqTZPzcRkDxvuuDAFhAgO+U1SLM6+jrZryzaXtGHrLjuE6n7Dq2S18psoASYw61O9oq
         /sQ5LVjpYgwUvANdFb0/dOamNH0myh1TTsxrR90Vd1aEhsRjr89WqJueYrR1ajonItUG
         4RMQ==
X-Gm-Message-State: AOAM531vvrcgBKJMw/aqbUu6l28D6O0YUrl29zdhxFUcFZS1kUHLf4Vf
	Gjl+gbAS5TCxKvBd8KGJNlgu6yi16FY=
X-Google-Smtp-Source: ABdhPJyZNCdwZGP4B5gusmQ2unhyscZRno/pAME1syGf23ms7pNQb6MTETfDJZZ6dHMRdptba0EAzA==
X-Received: by 2002:a17:90b:315:: with SMTP id ay21mr1439213pjb.134.1590111054158;
        Thu, 21 May 2020 18:30:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id r69sm5587567pfc.209.2020.05.21.18.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 18:30:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] armv8/tunes: Set TUNE_PKGARCH_64 based on ARMPKGARCH
Date: Thu, 21 May 2020 18:30:50 -0700
Message-Id: <20200522013050.1320143-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The setting is to modify TUNE_PKGARCH which is filled with
TUNE_PKGARCH_64 or TUNE_PKGARCH_32 in arm-arch64.inc
This lets higher up tune files for arm64 SOCs override them if needed,
this can help building multiple armv8 machines with different tunes in
same workspace.

No need to set TUNE_PKGARCH in tune files as it is synthesized from ARMPKGARCH

Add ARMPKGARCH for aarch64 tunes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc           | 4 +++-
 meta/conf/machine/include/tune-cortexa53.inc           | 3 ---
 meta/conf/machine/include/tune-cortexa55.inc           | 1 -
 meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 1 -
 meta/conf/machine/include/tune-cortexa57.inc           | 2 --
 meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 2 --
 meta/conf/machine/include/tune-cortexa72.inc           | 1 -
 meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 2 --
 8 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 53f4566815..6d5b22fff0 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -12,6 +12,8 @@ ARMPKGARCH_tune-aarch64 ?= "aarch64"
 ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"
 TUNE_FEATURES_tune-aarch64 = "aarch64"
 TUNE_FEATURES_tune-aarch64_be = "${TUNE_FEATURES_tune-aarch64} bigendian"
+TUNE_PKGARCH_64_tune-aarch64 = "aarch64"
+TUNE_PKGARCH_64_tune-aarch64_be = "aarch64_be"
 BASE_LIB_tune-aarch64 = "lib64"
 BASE_LIB_tune-aarch64_be = "lib64"
 
@@ -20,7 +22,7 @@ PACKAGE_EXTRA_ARCHS_tune-aarch64_be = "aarch64_be"
 
 ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '_be', '', d)}"
 TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
-TUNE_PKGARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
+TUNE_PKGARCH_64 = "${ARMPKGARCH}${ARMPKGSFX_ENDIAN_64}"
 ABIEXTENSION_64 = ""
 TARGET_FPU_64 = ""
 
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
index b7327d00c4..4af6e0f628 100644
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -14,8 +14,5 @@ TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
 
-TUNE_PKGARCH_tune-cortexa53 = "cortexa53"
-TUNE_PKGARCH_tune-cortexa53-crypto = "cortexa53-crypto"
-
 BASE_LIB_tune-cortexa53               = "lib64"
 BASE_LIB_tune-cortexa53-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
index 274944819e..89032b59ec 100644
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ b/meta/conf/machine/include/tune-cortexa55.inc
@@ -9,6 +9,5 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa55"
 ARMPKGARCH_tune-cortexa55             = "cortexa55"
 TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc crypto"
-TUNE_PKGARCH_tune-cortexa55           = "cortexa55"
 PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55"
 BASE_LIB_tune-cortexa55               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
index b95d63e86b..ba4b073852 100644
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -11,6 +11,5 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa57-cortexa53"
 ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
 TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 cortexa57-cortexa53"
-TUNE_PKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa57-cortexa53"
 BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
index e8ddeb5786..645a5a7ef6 100644
--- a/meta/conf/machine/include/tune-cortexa57.inc
+++ b/meta/conf/machine/include/tune-cortexa57.inc
@@ -13,7 +13,5 @@ TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
 TUNE_FEATURES_tune-cortexa57-crypto   = "aarch64 cortexa57 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
-TUNE_PKGARCH_tune-cortexa57 = "cortexa57"
-TUNE_PKGARCH_tune-cortexa57-crypto = "cortexa57-crypto"
 BASE_LIB_tune-cortexa57               = "lib64"
 BASE_LIB_tune-cortexa57-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
index fd1ffeb177..5c54aa33ea 100644
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -15,8 +15,6 @@ TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-co
 TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "aarch64 crc crypto cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
-TUNE_PKGARCH_tune-cortexa72-cortexa53                = "cortexa72-cortexa53"
-TUNE_PKGARCH_tune-cortexa72-cortexa53-crypto         = "cortexa72-cortexa53-crypto"
 BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
 BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
 
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 23640d5c1f..00f7745a22 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -10,5 +10,4 @@ AVAILTUNES += "cortexa72"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
 TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
-TUNE_PKGARCH_tune-cortexa72           = "cortexa72"
 BASE_LIB_tune-cortexa72               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
index ab87c88747..431d244fe2 100644
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -15,8 +15,6 @@ TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-co
 TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "aarch64 crc crypto cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
-TUNE_PKGARCH_tune-cortexa73-cortexa53                = "cortexa73-cortexa53"
-TUNE_PKGARCH_tune-cortexa73-cortexa53-crypto         = "cortexa73-cortexa53-crypto"
 BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
 BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
 
-- 
2.26.2

