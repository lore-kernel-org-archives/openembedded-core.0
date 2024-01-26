Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB75C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 23:31:58 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4763.1706311909222806046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 15:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T7Z8zJcp;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d50d0c98c3so19254425ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 15:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706311908; x=1706916708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KcHhKcEy2f0dRnxkK56Kssos5O2b0ECrlslLGUsljU=;
        b=T7Z8zJcpaHTkfoLl8M1MYoxMTM5Pik2z/UudTapWYDyd3VYv7C5XVtieXKySRNL/Sh
         6fE5MgOflqvGck07S54R40FHHsB8KKEBSaiTujRX3zW3bYeQapbeX+HROcJbKyB13ZcG
         UnNyWI64rkRlDJyAawR7tQ31o52GmLBgWdpojA2msMXyJLINAVS0tXMV5uokKRihstb2
         W0EOpOc8z9utwfBH3QZOY9pPuZDzyuvAbXC02y1w+CKWKCPmD0dCVxB9XDwyEzIpnR76
         RIQobaicQosf+TtjPOdF9QetMr106ecgTPa2Lo0vPWeGM7NEaQ19jUga0s7m6YUv9gyX
         WHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706311908; x=1706916708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KcHhKcEy2f0dRnxkK56Kssos5O2b0ECrlslLGUsljU=;
        b=dx9I1LvP0hAvZUnPjDce+iV0AQCgdFdjcOiaxNTNGGtyau6l4xX+vZN07Yc+4E5bDW
         vwsv47ZDUHLn5aqdkFbrbQeZ9uOiT5s9r2h8D/fAaw4cNxRjxTUSXVm0pa3CEH533hFb
         Hib/4BFvnMttwJzGoxpMwOZR0192c6HROni4INakxNnBlzbggmA1pACAR0cnZe2vRXKy
         R23SkT08MlexchSQ4tvO5f7bYSsC7wpfB05JOFoLZMCsnzVeVTzwe+1DkufrnLTkD6TR
         WK3iDbHEKUGBIh+lcCGK/PiVIU4DoKVSXyscmbM7OUWi08t+ZxbAXAMG8/7MP+IWq02t
         EI1g==
X-Gm-Message-State: AOJu0YwCroXhjkdFdw7yigA/YALuVGSkCSRvvU88CaQNHsIbFU1JG7jp
	VXNkIprKpIHqs8t6G5kVgxv8EjQXk3q2rl2OgHxuVBno6EdA7qXxURXRK+kBRAE=
X-Google-Smtp-Source: AGHT+IFe8KvlSybHkOmlwIVtMropavJ3Is1pl6BhJXxhWgwRBT6tcxriQiUXldwTQAxw6z1dmk0zzA==
X-Received: by 2002:a17:902:ceca:b0:1d3:edd9:1f13 with SMTP id d10-20020a170902ceca00b001d3edd91f13mr838080plg.67.1706311907696;
        Fri, 26 Jan 2024 15:31:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::edce])
        by smtp.gmail.com with ESMTPSA id r11-20020a170903410b00b001d74b1ef56fsm1438391pld.271.2024.01.26.15.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:31:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Jon Mason <jdmason@kudzu.us>
Subject: [PATCH] armv8/armv9: Avoid using -march when -mcpu is chosen
Date: Fri, 26 Jan 2024 15:31:41 -0800
Message-ID: <20240126233141.1589013-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 23:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194408

Current include logic goes into generic arm v8/v9 architecture tunes and
adds corresponding -march option after synthesizing it from various tune
fragments, this is fine for a machine which is using armv8/armv9 based
tunes but cortex tunes are intentionally using -mcpu option based on
selected tune value. So when cortex based default tune is selected for a
machine, it will add both -mcpu and -march to the compiler commandline
which can result in invalid combinations for this pair in gcc's own
logic. This can then result in compiler warnings/errors reporting this

e.g.

aarch64-yoe-linux-gcc  -mcpu=cortex-a72.cortex-a53 -march=armv8-a+crc+crypto -mbranch-protection=standard
...
cc1: error: switch '-mcpu=cortex-a72.cortex-a53' conflicts with '-march=armv8-a+crc+crypto' switch and resulted in options '+crc+crypto' being added [-Werror]

This is seen in lot of configure test results in glibc 2.39 and the
warning is promoted to errors by gcc in some of these checks especially
with gcc-14, the logs also show it as warning in other places in
configure checks.

mcpu option will compute relevant march implicitly as it specifies a cpu
implementation and this will be the right value to use, therefore do not
specify -march when -mcpu is already describing the cpu.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
Cc: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc      | 3 ++-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc      | 3 ++-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc      | 3 ++-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc    | 3 ++-
 .../machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc  | 3 ++-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc      | 3 ++-
 .../machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc  | 3 ++-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc      | 3 ++-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc    | 3 ++-
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc      | 3 ++-
 meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc     | 3 ++-
 meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc      | 3 ++-
 meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc       | 3 ++-
 meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc       | 3 ++-
 meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc      | 3 ++-
 meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc        | 3 ++-
 meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc        | 3 ++-
 meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc        | 3 ++-
 meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc        | 3 ++-
 .../machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc    | 3 ++-
 meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc        | 3 ++-
 .../machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc    | 3 ++-
 meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc        | 3 ++-
 .../machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc    | 3 ++-
 .../machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc    | 3 ++-
 meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc        | 3 ++-
 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc        | 3 ++-
 meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc       | 3 ++-
 28 files changed, 56 insertions(+), 28 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc b/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
index 493ad67b21d..0a115be8a47 100644
--- a/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
+++ b/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
@@ -10,5 +10,6 @@ require conf/machine/include/arm/arch-armv8-1m-main.inc
 
 AVAILTUNES                            += "cortexm55"
 ARMPKGARCH:tune-cortexm55              = "cortexm55"
-TUNE_FEATURES:tune-cortexm55           = "${TUNE_FEATURES:tune-armv8-1m-main} cortexm55"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexm55           = "cortexm55"
 PACKAGE_EXTRA_ARCHS:tune-cortexm55     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main} cortexm55"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
index d130b4b90ad..5e63b45ae0e 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
@@ -8,6 +8,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES += "cortexa55"
 ARMPKGARCH:tune-cortexa55             = "cortexa55"
-TUNE_FEATURES:tune-cortexa55          = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa55"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa55          = "aarch64 crypto cortexa55"
 PACKAGE_EXTRA_ARCHS:tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa55"
 BASE_LIB:tune-cortexa55               = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
index c7e86887b56..ba96d0452e2 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
@@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES                                         += "cortexa65"
 ARMPKGARCH:tune-cortexa65                           = "cortexa65"
-TUNE_FEATURES:tune-cortexa65                        = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa65"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa65                        = "aarch64 crypto cortexa65"
 PACKAGE_EXTRA_ARCHS:tune-cortexa65                  = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa65"
 BASE_LIB:tune-cortexa65                             = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
index dad6d1b174f..cc921474417 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
@@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES                                         += "cortexa65ae"
 ARMPKGARCH:tune-cortexa65ae                         = "cortexa65ae"
-TUNE_FEATURES:tune-cortexa65ae                      = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa65ae"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa65ae                      = "aarch64 crypto cortexa65ae"
 PACKAGE_EXTRA_ARCHS:tune-cortexa65ae                = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa65ae"
 BASE_LIB:tune-cortexa65ae                           = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
index 3a47e8278d2..e18b2cb6e0a 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
@@ -12,7 +12,8 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 AVAILTUNES                                         += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
 ARMPKGARCH:tune-cortexa75-cortexa55                 = "cortexa75-cortexa55"
 ARMPKGARCH:tune-cortexa75-cortexa55-crypto          = "cortexa75-cortexa55-crypto"
-TUNE_FEATURES:tune-cortexa75-cortexa55              = "${TUNE_FEATURES:tune-armv8-2a} cortexa75-cortexa55"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa75-cortexa55              = "aarch64 cortexa75-cortexa55"
 TUNE_FEATURES:tune-cortexa75-cortexa55-crypto       = "${TUNE_FEATURES:tune-cortexa75-cortexa55} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa75-cortexa55        = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a} cortexa75-cortexa55"
 PACKAGE_EXTRA_ARCHS:tune-cortexa75-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
index 2d9a1159f1a..453be2e6fda 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
@@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES                                         += "cortexa75"
 ARMPKGARCH:tune-cortexa75                           = "cortexa75"
-TUNE_FEATURES:tune-cortexa75                        = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa75"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa75                        = "aarch64 crypto cortexa75"
 PACKAGE_EXTRA_ARCHS:tune-cortexa75                  = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa75"
 BASE_LIB:tune-cortexa75                             = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
index f4c99ad6bbc..7daf9d91a8f 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
@@ -12,7 +12,8 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 AVAILTUNES                                         += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
 ARMPKGARCH:tune-cortexa76-cortexa55                 = "cortexa76-cortexa55"
 ARMPKGARCH:tune-cortexa76-cortexa55-crypto          = "cortexa76-cortexa55-crypto"
-TUNE_FEATURES:tune-cortexa76-cortexa55              = "${TUNE_FEATURES:tune-armv8-2a} cortexa76-cortexa55"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa76-cortexa55              = "aarch64 cortexa76-cortexa55"
 TUNE_FEATURES:tune-cortexa76-cortexa55-crypto       = "${TUNE_FEATURES:tune-cortexa76-cortexa55} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa76-cortexa55        = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a} cortexa76-cortexa55"
 PACKAGE_EXTRA_ARCHS:tune-cortexa76-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
index 0dfdb8c5e48..14ed81214de 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
@@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES                                         += "cortexa76"
 ARMPKGARCH:tune-cortexa76                           = "cortexa76"
-TUNE_FEATURES:tune-cortexa76                        = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa76"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa76                        = "aarch64 crypto cortexa76"
 PACKAGE_EXTRA_ARCHS:tune-cortexa76                  = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa76"
 BASE_LIB:tune-cortexa76                             = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
index b2863dca682..191863bac86 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
@@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES                                         += "cortexa76ae"
 ARMPKGARCH:tune-cortexa76ae                         = "cortexa76ae"
-TUNE_FEATURES:tune-cortexa76ae                      = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa76ae"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa76ae                      = "aarch64 crypto cortexa76ae"
 PACKAGE_EXTRA_ARCHS:tune-cortexa76ae                = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa76ae"
 BASE_LIB:tune-cortexa76ae                           = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
index 654b1f6323d..1522fd6abd9 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
@@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES                                         += "cortexa77"
 ARMPKGARCH:tune-cortexa77                           = "cortexa77"
-TUNE_FEATURES:tune-cortexa77                        = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa77"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa77                        = "aarch64 crypto cortexa77"
 PACKAGE_EXTRA_ARCHS:tune-cortexa77                  = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa77"
 BASE_LIB:tune-cortexa77                             = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc b/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
index 15ed595bdea..e906cf965cb 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
@@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES                                         += "neoversee1"
 ARMPKGARCH:tune-neoversee1                          = "neoversee1"
-TUNE_FEATURES:tune-neoversee1                       = "${TUNE_FEATURES:tune-armv8-2a-crypto} neoversee1"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-neoversee1                       = "aarch64 crypto neoversee1"
 PACKAGE_EXTRA_ARCHS:tune-neoversee1                 = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} neoversee1"
 BASE_LIB:tune-neoversee1                            = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
index 2cac70ea525..e9d7a59c511 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
@@ -8,6 +8,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES += "octeontx2"
 ARMPKGARCH:tune-octeontx2             = "octeontx2"
-TUNE_FEATURES:tune-octeontx2          = "${TUNE_FEATURES:tune-armv8-2a-crypto} octeontx2"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-octeontx2          = "aarch64 crypto octeontx2"
 PACKAGE_EXTRA_ARCHS:tune-octeontx2    = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} octeontx2"
 BASE_LIB:tune-octeontx2               = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
index 25780bc0802..e83e0ba68a7 100644
--- a/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
+++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
@@ -10,5 +10,6 @@ require conf/machine/include/arm/arch-armv8m-base.inc
 
 AVAILTUNES                          += "cortexm23"
 ARMPKGARCH:tune-cortexm23            = "cortexm23"
-TUNE_FEATURES:tune-cortexm23         = "${TUNE_FEATURES:tune-armv8m-base} cortexm23"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexm23         = "cortexm23"
 PACKAGE_EXTRA_ARCHS:tune-cortexm23   = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-base} cortexm23"
diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
index 04d1fe2bde8..606900d7a21 100644
--- a/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
+++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
@@ -13,5 +13,6 @@ require conf/machine/include/arm/arch-armv8m-main.inc
 # be fixed in GCC
 AVAILTUNES                          += "cortexm33"
 ARMPKGARCH:tune-cortexm33            = "cortexm33"
-TUNE_FEATURES:tune-cortexm33         = "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm33"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexm33         = "vfpv5spd16 dsp cortexm33"
 PACKAGE_EXTRA_ARCHS:tune-cortexm33   = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16"
diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
index 60e978facdc..4394adab0b1 100644
--- a/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
+++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
@@ -13,5 +13,6 @@ require conf/machine/include/arm/arch-armv8m-main.inc
 # be fixed in GCC
 AVAILTUNES                          += "cortexm35p"
 ARMPKGARCH:tune-cortexm35p           = "cortexm35p"
-TUNE_FEATURES:tune-cortexm35p        = "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm35p"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexm35p        = "vfpv5spd16 dsp cortexm35p"
 PACKAGE_EXTRA_ARCHS:tune-cortexm35p  = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
index c7b01a29065..25bdf12b185 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
@@ -9,7 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH:tune-cortexa32             = "cortexa32"
 ARMPKGARCH:tune-cortexa32-crypto      = "cortexa32"
-TUNE_FEATURES:tune-cortexa32          = "armv8a cortexa32 crc callconvention-hard neon"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa32          = "aarch64 cortexa32 crc callconvention-hard neon"
 TUNE_FEATURES:tune-cortexa32-crypto   = "${TUNE_FEATURES:tune-cortexa32} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa32 cortexa32hf-neon"
 PACKAGE_EXTRA_ARCHS:tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa32 cortexa32hf-neon cortexa32hf-neon-crypto"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
index 55dd845b005..c195d733784 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
@@ -12,7 +12,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES                                += "cortexa34 cortexa34-crypto"
 ARMPKGARCH:tune-cortexa34                  = "cortexa34"
 ARMPKGARCH:tune-cortexa34-crypto           = "cortexa34"
-TUNE_FEATURES:tune-cortexa34               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa34"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa34               = "aarch64 crc cortexa34"
 TUNE_FEATURES:tune-cortexa34-crypto        = "${TUNE_FEATURES:tune-cortexa34} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa34         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa34"
 PACKAGE_EXTRA_ARCHS:tune-cortexa34-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa34 cortexa34-crypto"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
index 33afb193863..d811c84455c 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
@@ -9,7 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa35 cortexa35-crypto"
 ARMPKGARCH:tune-cortexa35             = "cortexa35"
 ARMPKGARCH:tune-cortexa35-crypto      = "cortexa35"
-TUNE_FEATURES:tune-cortexa35          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa35"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa35          = "aarch64 crc cortexa35"
 TUNE_FEATURES:tune-cortexa35-crypto   = "${TUNE_FEATURES:tune-cortexa35} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa35"
 PACKAGE_EXTRA_ARCHS:tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
index a534ad358d8..a88575eb156 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
@@ -9,7 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa53 cortexa53-crypto"
 ARMPKGARCH:tune-cortexa53             = "cortexa53"
 ARMPKGARCH:tune-cortexa53-crypto      = "cortexa53-crypto"
-TUNE_FEATURES:tune-cortexa53          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa53"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa53          = "aarch64 crc cortexa53"
 TUNE_FEATURES:tune-cortexa53-crypto   = "${TUNE_FEATURES:tune-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa53"
 PACKAGE_EXTRA_ARCHS:tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
index 7de671a2e5d..052d1173c9b 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
@@ -9,6 +9,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 # Little Endian base configs
 AVAILTUNES += "cortexa57-cortexa53"
 ARMPKGARCH:tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
-TUNE_FEATURES:tune-cortexa57-cortexa53 = "${TUNE_FEATURES:tune-armv8a-crc} cortexa57-cortexa53"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa57-cortexa53 = "aarch64 crc cortexa57-cortexa53"
 PACKAGE_EXTRA_ARCHS:tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa57-cortexa53"
 BASE_LIB:tune-cortexa57-cortexa53 = "lib64"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
index 37650d8798c..b0de20f8369 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
@@ -9,7 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa57 cortexa57-crypto"
 ARMPKGARCH:tune-cortexa57             = "cortexa57"
 ARMPKGARCH:tune-cortexa57-crypto      = "cortexa57-crypto"
-TUNE_FEATURES:tune-cortexa57          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa57"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa57          = "aarch64 crc cortexa57"
 TUNE_FEATURES:tune-cortexa57-crypto   = "${TUNE_FEATURES:tune-cortexa57} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa57"
 PACKAGE_EXTRA_ARCHS:tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
index a77ef59d62d..ff188aec5fd 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
@@ -10,7 +10,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
 ARMPKGARCH:tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
 ARMPKGARCH:tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53-crypto"
-TUNE_FEATURES:tune-cortexa72-cortexa53               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72-cortexa53"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-cortexa53"
 TUNE_FEATURES:tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES:tune-cortexa72-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc}        cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS:tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index b0a017e444b..cbb6418c069 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
@@ -9,7 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa72 cortexa72-crypto"
 ARMPKGARCH:tune-cortexa72             = "cortexa72"
 ARMPKGARCH:tune-cortexa72-crypto      = "cortexa72"
-TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa72          = "aarch64 crc cortexa72"
 TUNE_FEATURES:tune-cortexa72-crypto   = "${TUNE_FEATURES:tune-cortexa72} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
 PACKAGE_EXTRA_ARCHS:tune-cortexa72-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crypto"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
index 869670bf0cf..4f4f25f5119 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
@@ -13,7 +13,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES                                          += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
 ARMPKGARCH:tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
 ARMPKGARCH:tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
-TUNE_FEATURES:tune-cortexa73-cortexa35               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa73-cortexa35"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa73-cortexa35               = "aarch64 crc cortexa73-cortexa35"
 TUNE_FEATURES:tune-cortexa73-cortexa35-crypto        = "${TUNE_FEATURES:tune-cortexa73-cortexa35} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa73-cortexa35"
 PACKAGE_EXTRA_ARCHS:tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
index 9cebffd54dd..1d152ed83bf 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
@@ -10,7 +10,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
 ARMPKGARCH:tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
 ARMPKGARCH:tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53-crypto"
-TUNE_FEATURES:tune-cortexa73-cortexa53               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa73-cortexa53"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-cortexa53"
 TUNE_FEATURES:tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES:tune-cortexa73-cortexa53} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc}        cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS:tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
index 13876e72459..b3b06a4f09f 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
@@ -12,7 +12,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES                                += "cortexa73 cortexa73-crypto"
 ARMPKGARCH:tune-cortexa73                  = "cortexa73"
 ARMPKGARCH:tune-cortexa73-crypto           = "cortexa73"
-TUNE_FEATURES:tune-cortexa73               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa73"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexa73               = "aarch64 crc cortexa73"
 TUNE_FEATURES:tune-cortexa73-crypto        = "${TUNE_FEATURES:tune-cortexa73} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa73         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa73"
 PACKAGE_EXTRA_ARCHS:tune-cortexa73-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa73 cortexa73-crypto"
diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
index 3a97cf8ee82..02507d9b78a 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -10,5 +10,6 @@ require conf/machine/include/arm/arch-armv8r.inc
 
 AVAILTUNES                             += "cortexr52"
 ARMPKGARCH:tune-cortexr52               = "cortexr52"
-TUNE_FEATURES:tune-cortexr52            = "${TUNE_FEATURES:tune-armv8r-crc-simd} cortexr52"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-cortexr52            = "aarch64 crc simd cortexr52"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52      = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd} cortexr52"
diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
index d26ab25e48f..ad60a3c9f39 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
@@ -12,7 +12,8 @@ require conf/machine/include/arm/arch-armv9a.inc
 AVAILTUNES                                         += "neoversen2 neoversen2-crypto"
 ARMPKGARCH:tune-neoversen2                          = "neoversen2"
 ARMPKGARCH:tune-neoversen2-crypto                   = "neoversen2-crypto"
-TUNE_FEATURES:tune-neoversen2                       = "${TUNE_FEATURES:tune-armv9a} neoversen2"
+# We do not want -march since -mcpu is added above to cover for it
+TUNE_FEATURES:tune-neoversen2                       = "aarch64 neoversen2"
 TUNE_FEATURES:tune-neoversen2-crypto                = "${TUNE_FEATURES:tune-neoversen2} crypto"
 PACKAGE_EXTRA_ARCHS:tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} neoversen2"
 PACKAGE_EXTRA_ARCHS:tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto} neoversen2 neoversen2-crypto"
-- 
2.43.0


