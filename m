Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0CFC433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:25:32 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.1643.1646443531123537175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ojwqGNMb;
 spf=pass (domain: gmail.com, ip: 209.85.217.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id e26so10928462vso.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qRoC8rJO52JClGx7pk0Q4SS3dxoHbsd5hOBJWjnFVNk=;
        b=ojwqGNMbsTVjx+TdGRHXcRyYPHl78xc9kQ7L5F2uB/hHVNM2DBuY3K3hLqfme1mQcd
         Fl1gJjr0Ci2XWU1g0wkN9Vftt1T6IXlobZdujHA6ivvIHp3lIihRgFQ+3nH0EkowZwdL
         ygLjT+7lwVBC7HVByN/FMY36lFjkFvZQEpMnPwA/fF1Y3izyuaf5js83y80Rqn/EyyQh
         Xb3WLICfti2MQQCKzntEG860JFcus/iEfJgmYH4Hoh+rQ12LOmhRO1wOrvcuOxrLIo7M
         ae701F8E/udgxNJ08JEUXxxKRB5TzkkoG2zzGPtRVz/wTRyoUshv275Sn0xdVqMI+DDD
         jnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qRoC8rJO52JClGx7pk0Q4SS3dxoHbsd5hOBJWjnFVNk=;
        b=undVMc1jpR37pl9S4cfHszxUhYXc4SpEGElzHRwt4ofvAHSSWdECSuoz2g/WIAthuH
         ICs6vuhol07/T+n14T6lGz7a3/TdI2zIgRt/CK6H1Enp5EWg1WI0CHOWsBHHShQOayCE
         d1Lm4zgDZZ0f5MJwdYg5r5Np1x5abasAB9yZ8qCM0pA94rFbBzqrUF3BSEu043ZpFfg0
         +tYvDkBopSQNZ88GLy79xQz4xe/Z8k9Sn12TWxqHqJbHhcyZ9NQNmF6Tu8exNLglMagd
         gvfZCY3wdB1pR0k8uaMz/gFhS/VVPWPAwePFXBNMk7IP+mQ1aeMzCizs3ISZVMsqW8RY
         h3Tw==
X-Gm-Message-State: AOAM530P1PzIESqi+592cyQ0DiM8E12zoE/Ocxe4iapNLfW8JYX1b17B
	3187UIkKsQcL4p5+CPYFiId/sUIuhVPk5g==
X-Google-Smtp-Source: 
 ABdhPJxMe1DTdx+ehg9INjcjY/thGYKT6UechfETgCHg0wNCqC2O9ydVxDr8G5pZAxIdBUm06cja3A==
X-Received: by 2002:a05:6102:6d4:b0:320:7cd0:a5e3 with SMTP id
 m20-20020a05610206d400b003207cd0a5e3mr538543vsg.84.1646443530256;
        Fri, 04 Mar 2022 17:25:30 -0800 (PST)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q9-20020ab02649000000b0034a4433fe82sm1053934uao.36.2022.03.04.17.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:25:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/5.15: riscv32: drop MAXPHYSMEM_1GB
Date: Fri,  4 Mar 2022 20:25:17 -0500
Message-Id: 
 <2af959844fa51f52fb4d8a57b7ca7504b57b2461.1646443420.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1646443420.git.bruce.ashfield@gmail.com>
References: <cover.1646443420.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 01:25:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162774

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    ea948a0983d riscv32: drop MAXPHYSMEM_128GB

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 153e48b578..ebd811c7bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "d6781443bac8b711a2c55898223dab38f2ed5896"
-SRCREV_meta ?= "3249e3a8f9c0de4105f5cd410880d5efdeeaf75d"
+SRCREV_meta ?= "ea948a0983d7b7820814e5bce4eda3079201bd95"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index d4ec34beff..244b907cd8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "000e76cff61c46e4a89c253d499bb92433807196"
 SRCREV_machine ?= "ba4a30c056f9fbb4286f9a79cd574025bae86c8f"
-SRCREV_meta ?= "3249e3a8f9c0de4105f5cd410880d5efdeeaf75d"
+SRCREV_meta ?= "ea948a0983d7b7820814e5bce4eda3079201bd95"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 481cfe9ab5..b9715e71ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
 SRCREV_machine:qemux86-64 ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
 SRCREV_machine:qemumips64 ?= "98e983921ddecb99fe11439c033273b90cc5d413"
 SRCREV_machine ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
-SRCREV_meta ?= "3249e3a8f9c0de4105f5cd410880d5efdeeaf75d"
+SRCREV_meta ?= "ea948a0983d7b7820814e5bce4eda3079201bd95"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


