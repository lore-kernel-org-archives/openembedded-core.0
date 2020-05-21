Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.9678.1590077757439722814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 09:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eSLZwGsC;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id r10so3384513pgv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yMJq8OeDxbqj43CQFNEoLnnBu23IZBpS/VdnSczWaJA=;
        b=eSLZwGsCj3lZ7sySb+nOU8reWe8FENlnCD8gzOP2qQ5uvHu178nvUorlD3mGSxFdt9
         ulBHW88feytSfNSsaV373NQb4RZZQmVmpDubp3VLejltE9He+zslOlUt5prupWZbQUCN
         CErGpWQDa85PtkKOMorIPTUQmIa+KVzga48nVSmvF1NyQuPkvWeRZwUeBNrmTCETSlRi
         O6vE7acZICpjF5VJ0uGh4oJVSXTIjYwJ+PH7RC0WioP5ln2mFlqjr8VMU+4Uz/rtr4/b
         CJoqnsR5aE4FK0QLJytxpcSf85Q0+3UV1EA4489w0c6f56Ywons1no7ZLoniRCV7yVQM
         D/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yMJq8OeDxbqj43CQFNEoLnnBu23IZBpS/VdnSczWaJA=;
        b=LbShbYR3k1fngXMyL9thDvoGWKIoOGivFmzy7FGGvoDnyi/Qdfazu34gTx6epfhH3v
         MC0mXdbH7QSf7LXSbKLt5dq4hn3nKJPInDeQd7IE6AKKlxv9PZWWU8zryyxXqiyTZGHw
         zXMXyYFtb8EHRO1CLk2ax6Ei3R2HlHQ6eP3Vddw6VjTpQ7jwAxQMw8IXVUBC/vxsOY+7
         kBvxHSFoRpla0tQTQDJh/eNPouNsK0yZgq5hZQXQqdpuqoadieHmdNuPkE0gavF53WuC
         Wiu+T0BvNgxAiUpJTo+wCUOQPTTwR6alV9WhoAjIqaDqq/tjhk6Ll2jHT19wTYwslBbh
         AMXQ==
X-Gm-Message-State: AOAM5303FGBrBtJyB+/FM+aB3Tw/Gi7CpIqCJ536TWtttTNknrclop9P
	yt7Mj12VzoJ7i5lpo4+jib0+6XXh2k4=
X-Google-Smtp-Source: ABdhPJxOmr764uqDatJZYzYWb9tj4fGZJybRf+Pp8LUtdFKp131C+yhcp3Ns0q5QT6mT51B318Aypg==
X-Received: by 2002:a63:f851:: with SMTP id v17mr9282427pgj.16.1590077756551;
        Thu, 21 May 2020 09:15:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id r24sm3636427pgm.25.2020.05.21.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:15:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][ 07/10] aarch64: Adjust big.LITTLE tune files to use -mcpu
Date: Thu, 21 May 2020 09:15:40 -0700
Message-Id: <20200521161543.3273063-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521161543.3273063-1-raj.khem@gmail.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mcpu is more appropriate on aarch64 and generates more optimized code
forr a given SOC, unlike -march/-mtune combination as decribed here [1]

[1] https://community.arm.com/developer/tools-software/tools/b/tools-software-ides-blog/posts/compiler-flags-across-architectures-march-mtune-and-mcpu

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

