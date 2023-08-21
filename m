Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D788CEE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 06:30:57 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.5301.1692599454413192349
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 23:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=c4uEdJAJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68a2bf8d404so835618b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 23:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692599453; x=1693204253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TekzWu9wTinpbsDqb2LOnUrn1WVMSCUodr/7NqzjwgI=;
        b=c4uEdJAJ/6LrZQ434E64ymyoO2Vv8S507HEmX0E1k5GpoiiQNttFq840cdevjWzB3t
         Nw/Wk8mwTT93r/AXZbAk02rVn3Rfe0KWyuPWFxx/zLhyNDwJl69P8obAIz8SHCUsNf64
         XTj2J+ZEroQWI6iY8KgR2JEJWZwVGdobpyUHi1AljbfjDgwzmqdzCeoQB2iF5MX66XJ3
         SQZW6mfH58R5ll/470j7PDkfrbO4HCSzUXB7R9z8ARqu7LV0EaduZIccscDbJ9teA47d
         X+FK70s4EzlYruwvPMTdfZ8rW2AtBnG0Xel/Cw0843qupj/5uonDjs5nGpFQUakSLeuL
         ZMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692599453; x=1693204253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TekzWu9wTinpbsDqb2LOnUrn1WVMSCUodr/7NqzjwgI=;
        b=apaZI/kRWtYCbDWe40TwnJZloTx59CXwO7VT0LyK8TwBf/25k0cZWrHWtMOFVZf/gu
         oMa8xOkxKNLj3/3c3lDGo71qj6wUbIVTb7rYzyjJ90WoDv2iZzzHIPV8J6qGDst5V0Hh
         5llCO4tT6qyeFBcc7m1vbozAMxtviu4e313f7fV/hcj5nfIGRA7E6pDIKDf8wxiP0Qo/
         J8GCGnWQMIwEsVPdiyYQxcBD1hNf2Hs4LcfeBN4JauUz3LTppscdcmRkiB7uUxwndPNZ
         IVwVeLfYPpWoypFwDY+gmCL7T0ncIhw20/W3kzLmpyVS1j/C/EfbZjYQHmq7UoGJibJj
         rgbA==
X-Gm-Message-State: AOJu0YwlGvyC+vlhJWueuw6rCGYiIRKMA2HrdejgVCqkqZ4A7vruYKsc
	TX6Ie2OuceT3Wv09fFRBEQr822i3dyFXAA==
X-Google-Smtp-Source: AGHT+IEajeKMdNXBvG1sxCIL9GfonfOS2Sx4AIcRNa8pcRtYEnUG1zKCXTiZmmctqxHXnnVIW1bI8Q==
X-Received: by 2002:a05:6a20:1390:b0:149:26d1:f24c with SMTP id hn16-20020a056a20139000b0014926d1f24cmr790060pzc.29.1692599453228;
        Sun, 20 Aug 2023 23:30:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::e31a])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902bc4700b001beef2c9bffsm6148546plz.85.2023.08.20.23.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 23:30:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 2/2] arch-armv8,arch-armv9: Add sve based tune options
Date: Sun, 20 Aug 2023 23:30:49 -0700
Message-ID: <20230821063049.3296008-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821063049.3296008-1-raj.khem@gmail.com>
References: <20230821063049.3296008-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 06:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186421

(From OE-Core rev: 3109a48740546f6defc652fa1a6736dc484e6021)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
v2: Limit to armv8.4a and newer based on
    https://marcin.juszkiewicz.com.pl/download/tables/arm-socs.html

 meta/conf/machine/include/arm/arch-armv8-4a.inc | 7 ++++++-
 meta/conf/machine/include/arm/arch-armv8-5a.inc | 7 ++++++-
 meta/conf/machine/include/arm/arch-armv9a.inc   | 7 ++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

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


