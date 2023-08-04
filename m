Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D25BC04FE0
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 17:03:08 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2476.1691168580684665025
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 10:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hemKq0gq;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bb2468257fso16150495ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 10:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691168580; x=1691773380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oqldj/nH31UiHAgKl4oC0xUNwSfn6+a6B4AFiMvwuY4=;
        b=hemKq0gq3TP6KN94FvECjOJbkSedviwoRPCTxHL0tmG45Z0nv938pvq9XD/WMpexIu
         +JAjafsTuX4O06WHyv/QoAhXB3Y/Tg7HyqUvk+mTQsHbviFl6UvOrTrL9vokSWZKZkl1
         atJDDjG2TEW4D1AC0mH0gSEn42DoF/9PMr8ATDalNQMzdUs0HDXPyMdRnAaA6ypCO8/X
         xEHZBa3f/N00vr2I0DcnzXbYzZh+p+vNiafqkLfNhsMzK9D/Fh705k2MJHXuw6enpqZg
         UhECbEBPtOc3le5SNSibF+ekpWSYr+JxS/7B6M35sVNC3Kq+N/m8OtVAKZrCCEThLs4C
         Rvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691168580; x=1691773380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oqldj/nH31UiHAgKl4oC0xUNwSfn6+a6B4AFiMvwuY4=;
        b=jXN8UtnNguzVYbi4ez3ukFM1ix+Ikg+HEfyZ4AtYNYhdA3rpUj+NGC8poX1NBhtPo0
         7AzyI9Q3Y3jiz2iosIhZrkzdpN4L8IWdBdh7lXAdx3qWjcb+8MjHV59omfM+LjZ1KSaf
         kL/VzzGclACtiq1NlzF/7tmO7mc2IfpoeCRpmUTcuMQV0eGZrsxg+EdMm9MPISJ3ePts
         5h9T9KJ1YvKmKvDITKPmT81FoJhunWVjXyFc75vLD+jTDYdlBpWGBuADLndMEMbZVn0V
         8bgjZ+sz4fyWx9sPbTBLQgx/SaV2SV191ddF7idLrLQhNvemjxM3dLOLFxNGcz2gZ8+p
         LZpA==
X-Gm-Message-State: AOJu0Yxw0hszeDhYnWcD3r8a/ZgPl/g7qdsz31F4z9b4qWE7fTnnafHx
	1E03NBnuWoExBQav5UCrgGcLony68VGRnQ==
X-Google-Smtp-Source: AGHT+IFzJS1FHPmipN1uO9ZWqc2QJfoi6htw/vYdQ7pZDZkxXgF3WFA+mim0CRmrLaShQU5KYFuoHA==
X-Received: by 2002:a17:902:da82:b0:1bb:f653:9f9e with SMTP id j2-20020a170902da8200b001bbf6539f9emr2180176plx.25.1691168579449;
        Fri, 04 Aug 2023 10:02:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id v11-20020a170902d68b00b001b50cbc0b4fsm1997876ply.111.2023.08.04.10.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 10:02:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/6] arch-armv8,arch-armv9: Add sve based tune options
Date: Fri,  4 Aug 2023 10:02:51 -0700
Message-ID: <20230804170255.2784609-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804170255.2784609-1-raj.khem@gmail.com>
References: <20230804170255.2784609-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 17:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185533

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

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


