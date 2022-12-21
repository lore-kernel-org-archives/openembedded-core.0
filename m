Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38064C4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:53:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.17929.1671627193831878430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:53:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pDfpQ4VX;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so1363242wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz5soOyitzRGpcfby0vWFDxQPip+7qK8tU8MjYrkAQ4=;
        b=pDfpQ4VXbEnUgx001VK/hAm32WgRmsMAsM+ik/eBOiDVph8IaDOFJ4waHfcIFWGtL/
         ZF3vdbZxHo2aZmt9/qIrN/mlJ3o2yM2PB5lQNJ79XACiOCXtk9KCQQQQdpdIt/UbRWKY
         Y05aotdRgA7FcBB0mzafmKfQOsedCGdCnK+Cf0PqJSF3I4o/9y9tAQpXQRq+ksVYjjWs
         O/O/KHVq+IAdVL83q94tgoMAV2vPto4ZfwpnErLFdkKQ8A92NWayjjiT3dFA0dpKnYcw
         jChSUShMGEVQ3pC8dwAm0FJg17EGAvPPLo6J/hRufJxUI0qo6diX891/cwIAALkTXYWP
         gZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz5soOyitzRGpcfby0vWFDxQPip+7qK8tU8MjYrkAQ4=;
        b=ti4+K0yeWLaRTnroxzZBnJiqkbwODMEZZQyaJN+uEQe/pyCaoJ+HRw1c9A820QaweL
         nbPHuODSqh73JvEtg7ofhbqRbA+1gdtYEPK7kyGOt+MGaeiewlKA/pY4ktyHyYe5f9Zj
         YvqsFsX7vqzPcWmLAmVFAUPiBrgxSj4agW2HMkMUe9+KRSrvJzHwnHfsiXJN7vP2OsIV
         xLOGTXceYZLhA4qj87PA3Vb6nMOQJlpS8H/qb9QThm1mfWBOr8P5UK3FVZGEpPxTjqXc
         gce+5eOV5HBXE4qqykq6HH5dThv5Sn2Z/6RFppKYZdNP79ysJwSNGVBm2iwhV9ZNJOIZ
         1xDA==
X-Gm-Message-State: AFqh2kpoSM70v4Eu+hpDa04owIhm5P8mOM2vxJbo0A0+HpOsSfalFbjw
	5J3e0vg3I1j+bdp6m8EI+EQxqAPhyDY=
X-Google-Smtp-Source: AMrXdXujbVzP9NtLQs19h7EqPhXfTtieV2NfAIZghYn1CKH0wrouwIukM1eLgF577YfOO3/HFUAQVA==
X-Received: by 2002:a05:600c:1e16:b0:3d1:d1a9:efde with SMTP id ay22-20020a05600c1e1600b003d1d1a9efdemr4347559wmb.12.1671627204783;
        Wed, 21 Dec 2022 04:53:24 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003b47ff307e1sm2124097wmi.31.2022.12.21.04.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:53:24 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 09/10] packagegroup-core-sdk: Add SDK toolchain language selection support
Date: Wed, 21 Dec 2022 12:53:04 +0000
Message-Id: <20221221125306.13779-10-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221125306.13779-1-alex.kiernan@gmail.com>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 12:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174915

Use SDK_TOOLCHAIN_LANGS to allow different language support to be
selected within SDKs. Initially supported options are rust and go.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 .../packagegroups/packagegroup-core-sdk.bb             | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index d70aff22c725..0e480e6ac756 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -11,6 +11,11 @@ inherit packagegroup
 
 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
 
+SDK_TOOLCHAIN_LANGS ??= ""
+SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
+# libstd-rs doesn't build for mips n32 with compiler constraint errors
+SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
+
 RDEPENDS:packagegroup-core-sdk = "\
     packagegroup-core-buildessential \
     coreutils \
@@ -23,7 +28,10 @@ RDEPENDS:packagegroup-core-sdk = "\
     less \
     ldd \
     file \
-    tcl"
+    tcl \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-sdk-target', '', d)} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-sdk-target', '', d)} \
+"
 
 SANITIZERS = "libasan-dev libubsan-dev"
 SANITIZERS:arc = ""
-- 
2.39.0


