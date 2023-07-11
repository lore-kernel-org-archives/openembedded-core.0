Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD648EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 20:10:48 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.6306.1689106247391651354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 13:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FMyJDFAO;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b9c368f4b5so77735ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689106246; x=1691698246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETtWcuoyW2u21Cb7v/ngy7oLpAHuDT51wPlTq/tssfY=;
        b=FMyJDFAOAIybjr/aJZYziPQWucNAKeQm6nrrkuaJIFh8b5qq9/NB4xk2MY9n9C2oqn
         KG6lBrErCvJOj/2ObpcPesIhgACXGdXxKRav9e59AMkIdZHzqVW8mvhgOZpJ+JhRYLCp
         yycGV+xTms9QZjPMcEwK8mqMRGl5lGZX3z4gbLqCgwzj5UEuoS8ssquota24ZqxZYMUv
         wxVOC2cD8X5Bh7anDuTY9/bzRn9z88SeV47py0WVeHq63jRzJTaYzLNBmqklidrQ/lBH
         XRLVNGr8LN9J80LeigsUbBjhU/YVua2c+BWjIXIeuR7Td6mFBNRIljP7rdmye8IwrvZP
         XDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689106246; x=1691698246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETtWcuoyW2u21Cb7v/ngy7oLpAHuDT51wPlTq/tssfY=;
        b=T5UzuSVR7A7fnm2Qz0co/1unXVl/GQFQaXYSDojjOZamDO0YeY+wuuB62Rh9mpC2l3
         2OAtLjasP6pwN/diX5xPWC9dPRvJXpLnWBgwfhu9P8LOEUAYsoWlbuO/h4WSD0DjBD2g
         JN9n1nt/Nx6hEHc5ukkM73DA4HdDksBwQoiWUVLxdliX3fGmrzxBKap0H+Cc0mosfndx
         tsJlnPVbQQ76jbUySZdSJN+C/hUcv0OHWL2fwALgqJXR4yrrYi61bMDQCBPU/80GXZYB
         l1b3juyCCFrUQRbvrdomOHINpg5B8ng1/QZaZXqV9WvWNurxa6ExobM/ZkKb28vArfk1
         Gaqw==
X-Gm-Message-State: ABy/qLarf/Jm/bcV7Re0rmTQ+Tw3oG69WiqP31RKgolZ157IzJJG51gL
	cC31OLw/IhtR+DsbDEMSaUwVnrHyF0U=
X-Google-Smtp-Source: APBJJlFPg6D6MlbYzZ7GNCBznwRi+lLcTtR5ZOSAaug2f7O0+HFq5SxpGsOg4/Jq4BE/hF5752hlhg==
X-Received: by 2002:a17:902:f682:b0:1b8:c8bc:c81b with SMTP id l2-20020a170902f68200b001b8c8bcc81bmr21607738plg.21.1689106246403;
        Tue, 11 Jul 2023 13:10:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::b82d])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902789100b001b9da7b6bc3sm2318795pll.184.2023.07.11.13.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 13:10:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] arch-armv8,arch-armv9: Add sve based tune options
Date: Tue, 11 Jul 2023 13:10:42 -0700
Message-ID: <20230711201042.38285-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711201042.38285-1-raj.khem@gmail.com>
References: <20230711201042.38285-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 20:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184154

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv8-2a.inc | 7 ++++++-
 meta/conf/machine/include/arm/arch-armv8-4a.inc | 7 ++++++-
 meta/conf/machine/include/arm/arch-armv8-5a.inc | 7 ++++++-
 meta/conf/machine/include/arm/arch-armv9a.inc   | 7 ++++++-
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
index 95368b0af79..6f31e26e34f 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -6,14 +6,19 @@ TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a:', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/arm/feature-arm-sve.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv8-2a armv8-2a-crypto"
+AVAILTUNES += "armv8-2a armv8-2a-crypto armv8-2a-crypto-sve"
 ARMPKGARCH:tune-armv8-2a                    ?= "armv8-2a"
 ARMPKGARCH:tune-armv8-2a-crypto             ?= "armv8-2a"
+ARMPKGARCH:tune-armv8-2a-crypto-sve         ?= "armv8-2a"
 TUNE_FEATURES:tune-armv8-2a                  = "aarch64 armv8-2a"
 TUNE_FEATURES:tune-armv8-2a-crypto           = "${TUNE_FEATURES:tune-armv8-2a} crypto"
+TUNE_FEATURES:tune-armv8-2a-crypto-sve       = "${TUNE_FEATURES:tune-armv8-2a-crypto} sve"
 PACKAGE_EXTRA_ARCHS:tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-2a"
 PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a} armv8-2a-crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto-sve = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} armv8-2a-crypto-sve"
 BASE_LIB:tune-armv8-2a                       = "lib64"
 BASE_LIB:tune-armv8-2a-crypto                = "lib64"
+BASE_LIB:tune-armv8-2a-crypto-sve            = "lib64"
diff --git a/meta/conf/machine/include/arm/arch-armv8-4a.inc b/meta/conf/machine/include/arm/arch-armv8-4a.inc
index 29feddb64c5..b61d50daa5e 100644
--- a/meta/conf/machine/include/arm/arch-armv8-4a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-4a.inc
@@ -6,14 +6,19 @@ TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-4a', ' -march
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-4a', 'armv8-4a:', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/arm/feature-arm-sve.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv8-4a armv8-4a-crypto"
+AVAILTUNES += "armv8-4a armv8-4a-crypto armv8-4a-crypto-sve"
 ARMPKGARCH:tune-armv8-4a                    ?= "armv8-4a"
 ARMPKGARCH:tune-armv8-4a-crypto             ?= "armv8-4a"
+ARMPKGARCH:tune-armv8-4a-crypto-sve         ?= "armv8-4a"
 TUNE_FEATURES:tune-armv8-4a                  = "aarch64 armv8-4a"
 TUNE_FEATURES:tune-armv8-4a-crypto           = "${TUNE_FEATURES:tune-armv8-4a} crypto"
+TUNE_FEATURES:tune-armv8-4a-crypto-sve       = "${TUNE_FEATURES:tune-armv8-4a-crypto} sve"
 PACKAGE_EXTRA_ARCHS:tune-armv8-4a            = "${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-4a"
 PACKAGE_EXTRA_ARCHS:tune-armv8-4a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-4a} armv8-4a-crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv8-4a-crypto-sve = "${PACKAGE_EXTRA_ARCHS:tune-armv8-4a-crypto} armv8-4a-crypto-sve"
 BASE_LIB:tune-armv8-4a                       = "lib64"
 BASE_LIB:tune-armv8-4a-crypto                = "lib64"
+BASE_LIB:tune-armv8-4a-crypto-sve            = "lib64"
diff --git a/meta/conf/machine/include/arm/arch-armv8-5a.inc b/meta/conf/machine/include/arm/arch-armv8-5a.inc
index a1bcb7fb9a1..176bc9033c9 100644
--- a/meta/conf/machine/include/arm/arch-armv8-5a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-5a.inc
@@ -6,14 +6,19 @@ TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-5a', ' -march
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-5a', 'armv8-5a:', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/arm/feature-arm-sve.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv8-5a armv8-5a-crypto"
+AVAILTUNES += "armv8-5a armv8-5a-crypto armv8-5a-crypto-sve"
 ARMPKGARCH:tune-armv8-5a                    ?= "armv8-5a"
 ARMPKGARCH:tune-armv8-5a-crypto             ?= "armv8-5a"
+ARMPKGARCH:tune-armv8-5a-crypto-sve         ?= "armv8-5a"
 TUNE_FEATURES:tune-armv8-5a                  = "aarch64 armv8-5a"
 TUNE_FEATURES:tune-armv8-5a-crypto           = "${TUNE_FEATURES:tune-armv8-5a} crypto"
+TUNE_FEATURES:tune-armv8-5a-crypto-sve       = "${TUNE_FEATURES:tune-armv8-5a-crypto} sve"
 PACKAGE_EXTRA_ARCHS:tune-armv8-5a            = "${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-5a"
 PACKAGE_EXTRA_ARCHS:tune-armv8-5a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a} armv8-5a-crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv8-5a-crypto-sve = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a-crypto} armv8-5a-crypto-sve"
 BASE_LIB:tune-armv8-5a                       = "lib64"
 BASE_LIB:tune-armv8-5a-crypto                = "lib64"
+BASE_LIB:tune-armv8-5a-crypto-sve            = "lib64"
diff --git a/meta/conf/machine/include/arm/arch-armv9a.inc b/meta/conf/machine/include/arm/arch-armv9a.inc
index c38d6cfdf60..6945dea333b 100644
--- a/meta/conf/machine/include/arm/arch-armv9a.inc
+++ b/meta/conf/machine/include/arm/arch-armv9a.inc
@@ -7,22 +7,27 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv9a', 'armv9a:',
 require conf/machine/include/arm/arch-arm64.inc
 require conf/machine/include/arm/feature-arm-crc.inc
 require conf/machine/include/arm/feature-arm-crypto.inc
+require conf/machine/include/arm/feature-arm-sve.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv9a armv9a-crc armv9a-crc-crypto armv9a-crypto"
+AVAILTUNES += "armv9a armv9a-crc armv9a-crc-crypto armv9a-crc-crypto-sve armv9a-crypto"
 ARMPKGARCH:tune-armv9a                    ?= "armv9a"
 ARMPKGARCH:tune-armv9a-crc                ?= "armv9a"
 ARMPKGARCH:tune-armv9a-crypto             ?= "armv9a"
 ARMPKGARCH:tune-armv9a-crc-crypto         ?= "armv9a"
+ARMPKGARCH:tune-armv9a-crc-crypto-sve     ?= "armv9a"
 TUNE_FEATURES:tune-armv9a                  = "aarch64 armv9a"
 TUNE_FEATURES:tune-armv9a-crc              = "${TUNE_FEATURES:tune-armv9a} crc"
 TUNE_FEATURES:tune-armv9a-crypto           = "${TUNE_FEATURES:tune-armv9a} crypto"
 TUNE_FEATURES:tune-armv9a-crc-crypto       = "${TUNE_FEATURES:tune-armv9a-crc} crypto"
+TUNE_FEATURES:tune-armv9a-crc-crypto-sve   = "${TUNE_FEATURES:tune-armv9a-crc-crypto} sve"
 PACKAGE_EXTRA_ARCHS:tune-armv9a            = "aarch64 armv9a"
 PACKAGE_EXTRA_ARCHS:tune-armv9a-crc        = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} armv9a-crc"
 PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} armv9a-crypto"
 PACKAGE_EXTRA_ARCHS:tune-armv9a-crc-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv9a-crc} armv9a-crypto armv9a-crc-crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv9a-crc-crypto-sve = "${PACKAGE_EXTRA_ARCHS:tune-armv9a-crc-crypto} armv9a-crc-crypto-sve"
 BASE_LIB:tune-armv9a                       = "lib64"
 BASE_LIB:tune-armv9a-crc                   = "lib64"
 BASE_LIB:tune-armv9a-crypto                = "lib64"
 BASE_LIB:tune-armv9a-crc-crypto            = "lib64"
+BASE_LIB:tune-armv9a-crc-crypto-sve        = "lib64"
-- 
2.41.0


