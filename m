Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C403C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:20:07 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.12906.1647969606194685175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=quazNh8Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id t7so14976154qta.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yUq2e0SZCNdhURYt3Dc6km3UOocq8E51SdTtDIRZy4U=;
        b=quazNh8ZEiHPpqGOyJ4V95aVboz6TasBMPPWQ5E5J8Yx1uo10IWEa5Pyq62PJ5t85a
         Mo7BiYfx50XrpLzhxla67yyPzwWdieQ/qVXKE3XA6sW6I1m39BlwoWjwXBr6aZqcSUKW
         PySbWIjLGOJifU+nNyGdRqRfr/72jUvg0YCeE8XyJxg2j8UFEn9jZOWTtmEnWfspRqq5
         tNT6X0El9wqPacOGPBFj5AOCW2c1fQLPMyClD9LnFUlEJJ6v+KTVXvKMKRgV9pFC5h6z
         ilO82mAZ/Wi6k2xI4xBgZN1l97ZyPnlfuDaja461/kc7IW3xC6jUryep57YqCcRFQdMy
         DAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yUq2e0SZCNdhURYt3Dc6km3UOocq8E51SdTtDIRZy4U=;
        b=twgqV2n03iSLjCajHyaOFBHovXtAvyQ2QoX1oZnhKuiKuxoX672350zPWnAT2529WK
         3zr3pHdRkcEsb/4ZF6mmK/4hJnfUWP8JBnyrCq6VIgnGh/gv8O5VOQ54IQpiqftxUh1O
         GA/aqyo71BZmBVD7JUfew6KYABzaECaOnxtNpmAOdIDhIO0s2MQ32TsiS0GZCLtbEcYP
         UU/s0Y/uRPTqdNy4wD6v5stqvPECQPaacTr7CYAYnNoO6NoxCp2F8UOjoqZIANk1ACb9
         BPpvXswBPmVULZuJMndwydKgH1SBlI8zCwY/gu5IfATQjr6B40q0oMwtQCANK724M8Xx
         RkOQ==
X-Gm-Message-State: AOAM531dGZiAP1fxeIOOp8zl2QGQ1y493QwKZ7djP5unIbOmvYhmeoFk
	wOMEKW82p0zXnNNWDgExW/2+VWxEclg00g==
X-Google-Smtp-Source: 
 ABdhPJyoqbe/Hpcu/Mt5R3bpz2vYuahMPl70JTrmSu/4UrdgfiUl8GWW+4ff/h803uuAU0BOUeYSJg==
X-Received: by 2002:ac8:5a55:0:b0:2e1:ce7f:2702 with SMTP id
 o21-20020ac85a55000000b002e1ce7f2702mr21370293qta.37.1647969605188;
        Tue, 22 Mar 2022 10:20:05 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm14019648qtx.16.2022.03.22.10.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:20:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] linux-yocto/5.15: split vtpm for more granular
 inclusion
Date: Tue, 22 Mar 2022 13:19:52 -0400
Message-Id: 
 <c0d895808db1b5e3ef66a8c39306cd7f574e0d0a.1647969481.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1647969481.git.bruce.ashfield@gmail.com>
References: <cover.1647969481.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:20:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163560

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    382f528ebc8 features/tpm: split into tpm-1.2, tpm-2.0, tpm-2.0-crb and vtpm feature

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index b47ba4c2b9..8df4898617 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "5486de5bb7320876bbfe6f92245f6819afed182c"
-SRCREV_meta ?= "ea948a0983d7b7820814e5bce4eda3079201bd95"
+SRCREV_meta ?= "50d5442eb4726b54950f32359f36e5aa8b5661af"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index eaa496dbf7..f9af47f861 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "25cfdd5cd20eb874209ee632b8b4ed567686523b"
 SRCREV_machine ?= "e54b9d06bee4c182cb376d570017c7b425369f3a"
-SRCREV_meta ?= "ea948a0983d7b7820814e5bce4eda3079201bd95"
+SRCREV_meta ?= "50d5442eb4726b54950f32359f36e5aa8b5661af"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 43faa35dc1..c7dcb3a9b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
 SRCREV_machine:qemux86-64 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
 SRCREV_machine:qemumips64 ?= "7b53697cddec0526e8c10f25e1a6c2bea7d240d2"
 SRCREV_machine ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
-SRCREV_meta ?= "ea948a0983d7b7820814e5bce4eda3079201bd95"
+SRCREV_meta ?= "50d5442eb4726b54950f32359f36e5aa8b5661af"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


