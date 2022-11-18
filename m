Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA40C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:22 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.7261.1668810557735994291
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F0/OJm76;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id p18so4465054qkg.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvjO/KF1zCYhp68ymK2vfXBPaw8Se9fDFf16PxtdmZw=;
        b=F0/OJm764ighiSezjeTNP5zpaGxy+EgsMPmdnS0WHoeQRWaEsPCbr21wvGpxMETVtU
         UBjcXDSLKFw1jFM085cODhs59Ovbi6RvEr3HhHl2lVtQESODH+3tr6O2/5RjNepVOMwy
         OA7/CVXsSqsu1Ys+C0RF+INQ25xkp+LCawZfRSNdWNtSzJVGpZe0EvT2r8x4t7EM6PJG
         mHG7a7UfXa5EXA7IA0KkKaLJq+StN+abstusV9846OIVuOlKpcgU3c76DFBZ7A1172jD
         Vnh0j39gCvFfJhSbtaeo5im8rhOQzLab5tVuf2TH6xftpYlq8jmDC2FYO+2K9gqwE1Jc
         sCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvjO/KF1zCYhp68ymK2vfXBPaw8Se9fDFf16PxtdmZw=;
        b=ix9k4QaIJNvWSumbgu1fS0hvrlj7tXCOdi5mVY1RcyZaiLvk9dem4vXKHYu5LIqjaH
         BNr1j3SFlGGCEDHUpQvBUAUBhO3O3fKRFIUfOG90oi2urxEPKAiPxy/txfJHl0PS1tnj
         e75nvy/dQYY6KfNFxBwFKEOd2tabbJZiWIq7qLdMm0qg/iCdQQmP2X9wkAcLHYHKBnnq
         VL+sj5LJjFSkqKPYBbPP7fSse7rRv6TkC6CVgYPALV/wtR/E4VqAKHSrENQWqdPOeIlo
         TNQTYFN406hcVDsTe1XpV+bsLpPDkDRkNVK3NMpCwOEzSKyPki2TCCGEoct/9tW1st9D
         stzg==
X-Gm-Message-State: ANoB5pnkZzVEZ057N7gHeqtr9qRR/fe+oCWWt8KDv/DZGfM/b9sggZQo
	rrwdqUoeUcxNoqmWy4GLHoI1V7ykZbfL0A==
X-Google-Smtp-Source: AA0mqf5GfLXdJiFhCFtbyHXGDrWknawa+YbdbEX768Padr0DFu0O/Ri0Yyjp31TmH6JYtlargWCymg==
X-Received: by 2002:a05:620a:a93:b0:6f9:de1b:8814 with SMTP id v19-20020a05620a0a9300b006f9de1b8814mr7876475qkg.18.1668810556735;
        Fri, 18 Nov 2022 14:29:16 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/15] linux-yocto/5.15: fix CONFIG_CRYPTO_CCM mismatch warnings
Date: Fri, 18 Nov 2022 17:28:58 -0500
Message-Id: <597dda8ee04f8ab7e2773fc6b4ab80dc2d126ded.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173508

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    f475b1a9ded qat: fix CONFIG_CRYPTO_CCM mismatch warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f80cabe55d..fc1ccd9b39 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "a0d36398b257c555381e735cd721cd8479d6762d"
-SRCREV_meta ?= "5ca1021282e796e2427f8c7769af524c433fb39d"
+SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c09f51ce61..087c30b5a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "1c3448ff6cc6d24d16c6ef6065cb642245cac627"
-SRCREV_meta ?= "5ca1021282e796e2427f8c7769af524c433fb39d"
+SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 710accc9e2..d5f21daf35 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
 SRCREV_machine:qemux86-64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
 SRCREV_machine:qemumips64 ?= "ae8ab2e3acaf9e14cd75a6c96f1ba43c66a1babd"
 SRCREV_machine ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_meta ?= "5ca1021282e796e2427f8c7769af524c433fb39d"
+SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


