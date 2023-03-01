Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2682C7EE2F
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 15:13:59 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.24963.1677683632401657388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 07:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n2pXrYi1;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id c19so14489669qtn.13
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 07:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJIaDryY4bKgOE07jIa0wbvSv23oa5H3qpO+uhe+Mak=;
        b=n2pXrYi1OpBurlVqniefpTPc3VPz2zKWNa33MukQCwdn9wrjQKBq9WaS08HhbG4sUe
         M0yjAjg6ZNSR11VLGxrIoLDCtd6zdOkrSLS2CUAdl5hS20W9PQp4NMLWwXLtfjqtFFIS
         l0foqD12VrGhDpEKsC4cR0RFLBubgwVEJ5Q1Nuf9sUrX6YxmZgkBuEwiM7RXvQXTrQWA
         uFRBBbiZHMChIzmsccPFCwPhqA0RTsvbVC78YBc6RZ2bRwHycCxY1qbGN750khfwG+80
         1DamgUm4q+ZOb91MdO75eagckliI1RPvpz8txBv0gFi77AyZa6pxceJpJDDFXNWDgFw3
         zRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJIaDryY4bKgOE07jIa0wbvSv23oa5H3qpO+uhe+Mak=;
        b=kOXg/93RTTuxl3cf1E7SpkBcZ9SugY89HIZzhoF+V/UqErQBfib1x6Iz2l91+I7tL0
         /VOE3elXUGIS7ZtWuAXl/+/1iK9vfZePxGkLoerhvygayEpidGKQA2P/fndugTBUhwSR
         UVb0GccGmqAUOMXLFCDk8gGlD7iwazYpjctTvjLL+Y/GVVa6icMCRewXIwS0Iey8FQwB
         C4MNWJ3iLFETLil/dOJx9rBhB7Qul76MrCmA5URSkoKjNcBA0lsvbkqZIIA7aCPur/TR
         +YMPQkRBW5PnZt/fQ8RWDt01Rcdo40+BUlT8LCMq6qsLf6W8+Si7wOKRuMu6ja21R3Bj
         KxrA==
X-Gm-Message-State: AO0yUKWGCtIOFzse+stMMY3L7fMYLVdOU3gIn4F9XG1ndY+tGWY3u3CQ
	vrPdodBDnzYkzzW4nTu/3ys2h4M4DmMQPg==
X-Google-Smtp-Source: AK7set++rQ7bc+/ZyuydJJUsiepdcsIXyUVP2ufTubyBmbQOLoBCKgQBIbN8A6C3xPTkp7RkdhAsDQ==
X-Received: by 2002:a05:622a:170b:b0:3bf:cd81:3a31 with SMTP id h11-20020a05622a170b00b003bfcd813a31mr11969823qtk.65.1677683631314;
        Wed, 01 Mar 2023 07:13:51 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x2-20020ac86b42000000b003b635a5d56csm8472323qts.30.2023.03.01.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:13:50 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto-rt/6.1: fix compilation issue with per cpu stats
Date: Wed,  1 Mar 2023 10:13:39 -0500
Message-Id: <eb23baac6e18283eb0ad69716cc2727c53c5a3df.1677683523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677683523.git.bruce.ashfield@gmail.com>
References: <cover.1677683523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 15:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177936

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.1:

    3b4c5ff8e4f1 net: fix net/netfilter/ipvs/ip_vs_ctl.c with u64 and u64_stats_t

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 28b7159359..7a7537505e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "94f73e8d6872df48a7c4ee6caa1701ae2a535dfe"
-SRCREV_meta ?= "d7393c5752865634e307673043da55e353139333"
+SRCREV_machine ?= "8183fc0efdb87bd314afda93a7c02ff85dc5833d"
+SRCREV_meta ?= "a833bd2ced5dcd01c043348ec47218a545d00c5f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 65866dd1db..393952a980 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_meta ?= "d7393c5752865634e307673043da55e353139333"
+SRCREV_meta ?= "a833bd2ced5dcd01c043348ec47218a545d00c5f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 66d397837f..8c99b98933 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -25,7 +25,7 @@ SRCREV_machine:qemux86 ?= "1caf99d56881e1510afca553cd4a057f80479973"
 SRCREV_machine:qemux86-64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
 SRCREV_machine:qemumips64 ?= "2949d76c3f79f3c7f700a6366d828f006d7dd5a8"
 SRCREV_machine ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_meta ?= "d7393c5752865634e307673043da55e353139333"
+SRCREV_meta ?= "a833bd2ced5dcd01c043348ec47218a545d00c5f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


