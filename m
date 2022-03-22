Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCA7C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:20:06 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.12950.1647969605234908290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nUTUVFXG;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id t7so14976115qta.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=669INQytJ4JLK6/VR6VCdVz8Fpe+tf2oPm0LyYh43PY=;
        b=nUTUVFXGtj9uWRoCiF5uLeqUdupIlWwD7tFepfBwCl4fFYCgHfnyPa/bzAYcI9ruy5
         cpfoOrF+E2b83XAbkr7wNJHtVm7nFU4F/vETeGOV7B/WYQ8ecVAOKOg37C7vrzTaaPCF
         SaHxEXPdkWX9YkqsSdxRvjOAbAlq2CMUZhBlcXY40msKaP9883/Sy17y6iqbnzjo+XrI
         1b1zfmmDBBxApC+J+lap1Ooqs4oYCCdUtFJqXRUYNQVsWjWEwQJDmDWJy/5G6R6RziNK
         3VjhcTwjoX1d0in/8b4B4xEuhnUeZt42YjkXAa9UWjcEZ586vMvCYz0kCsX0yk4gScIf
         p+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=669INQytJ4JLK6/VR6VCdVz8Fpe+tf2oPm0LyYh43PY=;
        b=z2sjA3z4/YJGLJ1934fNVCClVejpdfCgY0SUdjN9J20woD7n3nA4wK2b+5kyyAh4eY
         fQ7yH3cClSp9dw9vFRzCjjA7nIyfb2rROwl58Tp+/6ewCtUssO++LVDci+sgLeJ23HsP
         mSS1jHda25isGw0uO5G4xwQgsPsk5sew9odczh93ss4wK6ZGUXhscWoqMRy/iuiwUg9J
         1QFqz+/sMOg+95hZFpONlSXdvQ0etJNDK8gQWkDpn8waXbTUf5v0fC7VCimd166XzKOZ
         g6zfBO/3/E8D0mmSMF5E7T6znpvm95O9nbGkdRHnJ+p6d5AKs0Ei5tyIObfxN0O9XR95
         qDnQ==
X-Gm-Message-State: AOAM532xg7ycoRNki9MAj5ixeThDRM8ZTdozi63MTS1QX8i6rlYNjQ36
	EGiDMRT99i+DKBegBZBYpTzFuHXeyHeTPA==
X-Google-Smtp-Source: 
 ABdhPJzoJLm/xzBIrCdj9KQWBLYVBXBWK4uN+ITFawwZsqOYFNbQhoMjICjE0vqIj733nRBXYQ8mJw==
X-Received: by 2002:a05:622a:116:b0:2e1:efb7:4a3d with SMTP id
 u22-20020a05622a011600b002e1efb74a3dmr19702656qtw.298.1647969604229;
        Tue, 22 Mar 2022 10:20:04 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm14019648qtx.16.2022.03.22.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:20:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] linux-yocto/5.10: split vtpm for more granular
 inclusion
Date: Tue, 22 Mar 2022 13:19:51 -0400
Message-Id: 
 <955ae91bbe427aa8c1101af75a4e74fd4e6c5415.1647969481.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1647969481.git.bruce.ashfield@gmail.com>
References: <cover.1647969481.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:20:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163559

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    6ca1d510a03 features/tpm: split into tpm-1.2, tpm-2.0, tpm-2.0-crb and vtpm feature

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 36eb86f8c1..5852730422 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e0d87d9831a6e0df20a370adc9aba0d032d91661"
-SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
+SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2c46c665a0..48e5a4f871 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "38f8b1b5b87959e6cb9367151e233d27befe015d"
 SRCREV_machine ?= "cc70f051e56005acda2e6ea994cadfb2538e66f6"
-SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
+SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 3d3ee6d623..0a80790636 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_machine:qemux86-64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_machine:qemumips64 ?= "a1b43f69bce61143dd4d6d637f619eadd3fabb6e"
 SRCREV_machine ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
+SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.19.1


