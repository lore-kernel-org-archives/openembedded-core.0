Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D789C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.11520.1634657685093006514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lm1FoZPz;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so3396514wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eytyhjDVkLfl1FXPd2iiZ6CXnjw8g3MS0sLbqGmacfo=;
        b=Lm1FoZPz3MoM6nQiaVSCFH0jfsn96bJkJWhUlZLBkZXoP/ziYDM4cwXGtYfpUHpmHG
         XtcDdvLCHDalRwGpC1ycMnu0FOgpFHLKuXaUqkZ2PLvlaHPxMLGL7sStyM9qTKAWwoiv
         Z7KKVAwG3TFWs/2BFSk0v9Ymk70hAiThuEcYjR/0B4YvOpq5LAO9haluK8vLuTqmuUAv
         eGCqvudNADf4lPn9aSwYW3pcZPB24YHTHpE0KLtqkQZWamh3LX0fXRRZ52ZsOjL/HBHi
         gZZHP85mYVIb5XIGyr6tvOAQWcLNhEAVS9Pz5HGpigoxh1BxJGdksyd0bFoDNRNmxI3l
         tFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eytyhjDVkLfl1FXPd2iiZ6CXnjw8g3MS0sLbqGmacfo=;
        b=V10v2lFmUH3XoR9gOoElfnXoE0JOCMINHegI+HIr5HMPNUkYm9e006difJbTEXHcCO
         XcbiwHvAc4pWXmZHZg18/169RUO3WJMxkouniDnn1jUw8d2317wpHp646rvGjtVFcVRh
         RLOPQnwA4Ej+eHopAfRNrSBhEe82JawqcT/llGBIVkphhrdMNmOjg8PyJ24sNEu3z3Pp
         gYNHIGwWAyZpTqJVDpcWiOVQdDRqom6sXx7PIj2i8NBJAAFhqs163FOLvTyG3pqbFDca
         XtCZdKGwBsjt644inCDKAOa+H0Ne7RzgTNdkU/dSQItuoKPI0dOHJBfwK0ahkHlKNQVL
         Ua6w==
X-Gm-Message-State: AOAM530Zll3W2vrYHS4JPizzww/d5a0c2GlYY5VWmBV5zcgPwJjS054c
	H3lL9Qp5Fj8fQOK8X+52fJlDZn6qf3M=
X-Google-Smtp-Source: 
 ABdhPJwtwPSGuXVUsab0Yr80sCCLI+FF3oMnVVNMf5HULAdZSY4ysWfrhzkVvWSfM2T4V54yCcI45w==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr44539359wru.65.1634657683764;
        Tue, 19 Oct 2021 08:34:43 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/65] btrfs-tools: upgrade 5.13.1 -> 5.14.2
Date: Tue, 19 Oct 2021 17:33:42 +0200
Message-Id: <20211019153419.3319802-28-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157147

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{btrfs-tools_5.13.1.bb => btrfs-tools_5.14.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.13.1.bb => btrfs-tools_5.14.2.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.14.2.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.14.2.bb
index 5288978943..3270527b57 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.14.2.bb
@@ -14,13 +14,12 @@ LIC_FILES_CHKSUM = " \
 "
 SECTION = "base"
 DEPENDS = "lzo util-linux zlib"
-DEPENDS:append:class-target = " udev"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
            "
-SRCREV = "e4ac7d4f67b330a3b27a4a50f73e94b1e072ae56"
+SRCREV = "35f17bc49cdf760d8f3710fe2c301b933d991fd6"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
@@ -35,6 +34,7 @@ PACKAGECONFIG[convert] = "--enable-convert --with-convert=ext2,--disable-convert
 PACKAGECONFIG[zoned] = "--enable-zoned,--disable-zoned"
 PACKAGECONFIG[python] = "--enable-python,--disable-python,python3-setuptools-native"
 PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
+PACKAGECONFIG[udev] = "--enable-libudev,--disable-libudev,udev"
 
 # Pick only one crypto provider
 PACKAGECONFIG[crypto-builtin] = "--with-crypto=builtin"
-- 
2.20.1


