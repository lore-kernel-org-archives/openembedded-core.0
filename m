Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246F4C6FA82
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:19:02 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.20062.1664133540702332341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yVidnj3G;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id l10so4431577plb.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=JYaRdXz2YlkJCr6cBS+QFamc8JR00D5a8Y0dshEjE+s=;
        b=yVidnj3GiGnsfttrbCi9JJoNKLfBu9hR2ouAUNGfLq1Asfp6WC1M32FxVpb13PXqiT
         mvVC5MqFOkdUQgyFsSM8Uulb2nHJNwiO40d2TkDumvlQa9vXEDElZZB03iemPUaG6iNj
         fm5HV/nnpUSYrqZujAMDHxS3T9Cjec9QVRpezxikb8tbkNzl1YXMv9swnZ+IRm7DqgAk
         oiolcjXuUXmz65uKZ71Oi/20AQZzDlNTqKpU7Q53BS3eyyZJK8dVsdlczbIx8HOrXMdD
         pHTVgV5wYVea/JDghbvlDq93V4nzt1sRZed+PwWfaG+7LT8pit0n4A0NDobDiaYFzBWC
         8hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JYaRdXz2YlkJCr6cBS+QFamc8JR00D5a8Y0dshEjE+s=;
        b=Zzwb0hvhNcNGTShmQW1L5k/YrqP98h6F5E5NNVxO0i6TBgoZEV9lOseraqesRTomBn
         0jTRMFYzI4/AxFuOn4yx02+NADv5gBSCBG706BvSwO/5nnB2/4q8jyN382cw5KQ1lCvW
         +iZYbBJLQ2x0U7TaP87nDgipykLbXevY+tjhIGMDAivs5l8zGWNuV08turrihx8OZ3eD
         Rwo+QllLn5cmRjAD6wFOjDLK5cbKmVIFQVq4GuCYoaxeGJsRk8Ja8gDdqABdErm39CGw
         en+hps3paYtioi5QgbBw97h4cMSvr/tHSd8Pamz7OzADsxK9t4PvKdP/TTnP3AjC2X3a
         Tk9w==
X-Gm-Message-State: ACrzQf3SeJOMu1fF2b3xU6Q+QZi+cLNyk7BTVESF5LtCEq+/FM5R/SWl
	9K90rQgiNN3GSz5w37lSbozNu+VKu21AmYBm
X-Google-Smtp-Source: 
 AMsMyM4uPooeV0dZUxKmkSUKaKMjUNvGeSQ0xNgfeQEEkfKtMptOAp9i8wdduXmf0UbJxbFlGcaSZA==
X-Received: by 2002:a17:90b:1e45:b0:202:fbc9:3df1 with SMTP id
 pi5-20020a17090b1e4500b00202fbc93df1mr33714135pjb.72.1664133539719;
        Sun, 25 Sep 2022 12:18:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/33] tune-neoversen2: support tune-neoversen2
 base on armv9a
Date: Sun, 25 Sep 2022 09:17:42 -1000
Message-Id: 
 <278c50d18ac6b92d43778f9b797ab5999ae869ad.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:19:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171045

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

We supported neoversen2 base on armv8.5a in the past, add tune include
for armv9a and support neoversen2 base on armv9a.

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/arm/arch-armv9a.inc | 28 +++++++++++++++++++
 .../include/arm/armv9a/tune-neoversen2.inc    | 10 +++----
 2 files changed, 32 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv9a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv9a.inc b/meta/conf/machine/include/arm/arch-armv9a.inc
new file mode 100644
index 0000000000..c38d6cfdf6
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv9a.inc
@@ -0,0 +1,28 @@
+DEFAULTTUNE ?= "armv9a-crc"
+
+TUNEVALID[armv9a] = "Enable instructions for ARMv9-a"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv9a', ' -march=armv9-a', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv9a', 'armv9a:', '', d)}"
+
+require conf/machine/include/arm/arch-arm64.inc
+require conf/machine/include/arm/feature-arm-crc.inc
+require conf/machine/include/arm/feature-arm-crypto.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv9a armv9a-crc armv9a-crc-crypto armv9a-crypto"
+ARMPKGARCH:tune-armv9a                    ?= "armv9a"
+ARMPKGARCH:tune-armv9a-crc                ?= "armv9a"
+ARMPKGARCH:tune-armv9a-crypto             ?= "armv9a"
+ARMPKGARCH:tune-armv9a-crc-crypto         ?= "armv9a"
+TUNE_FEATURES:tune-armv9a                  = "aarch64 armv9a"
+TUNE_FEATURES:tune-armv9a-crc              = "${TUNE_FEATURES:tune-armv9a} crc"
+TUNE_FEATURES:tune-armv9a-crypto           = "${TUNE_FEATURES:tune-armv9a} crypto"
+TUNE_FEATURES:tune-armv9a-crc-crypto       = "${TUNE_FEATURES:tune-armv9a-crc} crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv9a            = "aarch64 armv9a"
+PACKAGE_EXTRA_ARCHS:tune-armv9a-crc        = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} armv9a-crc"
+PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} armv9a-crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv9a-crc-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv9a-crc} armv9a-crypto armv9a-crc-crypto"
+BASE_LIB:tune-armv9a                       = "lib64"
+BASE_LIB:tune-armv9a-crc                   = "lib64"
+BASE_LIB:tune-armv9a-crypto                = "lib64"
+BASE_LIB:tune-armv9a-crc-crypto            = "lib64"
diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
index 36355f7bed..d26ab25e48 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
@@ -6,17 +6,15 @@ DEFAULTTUNE ?= "neoversen2"
 TUNEVALID[neoversen2] = "Enable Neoverse-N2 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen2', ' -mcpu=neoverse-n2', '', d)}"
 
-# Even though the Neoverse N2 core implemnts the Arm v9.0-A architecture,
-# but the support of it in GCC is based on the Arm v8.5-A architecture.
-require conf/machine/include/arm/arch-armv8-5a.inc
+require conf/machine/include/arm/arch-armv9a.inc
 
 # Little Endian base configs
 AVAILTUNES                                         += "neoversen2 neoversen2-crypto"
 ARMPKGARCH:tune-neoversen2                          = "neoversen2"
 ARMPKGARCH:tune-neoversen2-crypto                   = "neoversen2-crypto"
-TUNE_FEATURES:tune-neoversen2                       = "${TUNE_FEATURES:tune-armv8-5a} neoversen2"
+TUNE_FEATURES:tune-neoversen2                       = "${TUNE_FEATURES:tune-armv9a} neoversen2"
 TUNE_FEATURES:tune-neoversen2-crypto                = "${TUNE_FEATURES:tune-neoversen2} crypto"
-PACKAGE_EXTRA_ARCHS:tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a} neoversen2"
-PACKAGE_EXTRA_ARCHS:tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a-crypto} neoversen2 neoversen2-crypto"
+PACKAGE_EXTRA_ARCHS:tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} neoversen2"
+PACKAGE_EXTRA_ARCHS:tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto} neoversen2 neoversen2-crypto"
 BASE_LIB:tune-neoversen2                            = "lib64"
 BASE_LIB:tune-neoversen2-crypto                     = "lib64"
-- 
2.25.1


