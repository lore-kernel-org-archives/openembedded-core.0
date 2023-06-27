Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8ABEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:24:27 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.14715.1687875862406820488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 07:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qjlbGH8d;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-635eb5b0320so10088506d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687875861; x=1690467861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DLx9vUi8epAXfsJXGfyBxCYZ0sSq29sgNDe3TuCECQ=;
        b=qjlbGH8doCZfMBBd4TDWg1eDqgnq2s74JoX/xnnByk7eBzO93mmppFx4QBfb6IkImB
         iKwmVefg/iNoDLZqI1XqA7JqhRTM6PI0aRyyy/oFg5SI552jYAnJF5jlgugdhxM+Cd1T
         QJN8kRv//kq7Gjz+Nndkwucvxg2ukzdQKcjTGYfEACM6sRJ1KIgT9qHHXzpCSEt+j9yo
         TIPvzLCa0nYOAWnLH1A9OAq0x2vw26JidYpnNCTPDC5QzNRhPjdtoWaq31FpAZZUKo/f
         UT9PSGaWq2/x8lUDJR3ACF+dv3Wj+988pQDwGMs0kjH544dOqEGKGZc/2hl11/yAloL4
         m4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687875861; x=1690467861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DLx9vUi8epAXfsJXGfyBxCYZ0sSq29sgNDe3TuCECQ=;
        b=GJ/lRLKnluWN9jSDFkYgeHviCV97vEvaQBb3V00WVBttQ6Kl8jZiNC5DlOuFM8yCji
         CSzAV2Vyqq2jaFvu/X+QZs8DYafgaNiZC/PFah+Bx2tFG9XI5/nwCxfuEUArGSZPiZGL
         tYd9JUJYgFDbU7zsyw5p0QgYQB3Qx8Y/Uu6qxENrQ3d9S46kpGn8nOddEmoCZLiv39WE
         Bg2k3iw8sI9viwgROYMO43JN1RiMvOhsLtpPVELVuyfwUc74HZzj2dmQrrZ6fpl3bRRT
         Lt1Xo460N0kO7rLftznFFZ1Fobkqo6SoyhbrX3a0V2XsoY387kSjkvs0/1krHPRnmiaj
         DWnw==
X-Gm-Message-State: AC+VfDzIVhWQp7kRij/hEKXiN/fwqGHfO8ZEKBXxkLX7NNKeAWi/qyjP
	p+7FUX3iTRdU4VT/KoWk2rdu5x1Y0D3rpb5T
X-Google-Smtp-Source: ACHHUZ5XiTsUMPjHR37oc80ykngy5c6iUiuE/piCmBWlh2Yz/MX6rt9Joh16PkjjkAq0wsNcjPK6bw==
X-Received: by 2002:a05:6214:2404:b0:635:33b0:f424 with SMTP id fv4-20020a056214240400b0063533b0f424mr15181921qvb.40.1687875861273;
        Tue, 27 Jun 2023 07:24:21 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id h20-20020a0cedb4000000b0063016dcff99sm4581860qvr.135.2023.06.27.07.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 07:24:20 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] linux-yocto-rt/54: fix 5.4-rt build breakage
Date: Tue, 27 Jun 2023 10:24:19 -0400
Message-Id: <20230627142419.279859-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 14:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183488

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit:

    commit 8d8179549a233e7517523ac12887016451da2e20
    Author: Bruce Ashfield <bruce.ashfield@gmail.com>
    Date:   Tue Jun 27 10:13:01 2023 -0400

        rt: fix 5.4-stable introduced compile errors

        The 5.4 stable series brough back two elements removed
        by the -rt patch:

         - tick_period
         - deferred/safe printk

        We fix the build by dropping the use of the period and
        deferred printk

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a98a64110a..541d169379 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8472ed342e0ac3f529c10b474b12ef0e05995778"
-SRCREV_meta ?= "5c912968f2cb938ad084d457dae99bf8eb16032d"
+SRCREV_machine ?= "8d8179549a233e7517523ac12887016451da2e20"
+SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 46a8856963..171ff8493c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "ca5368c73bab4eb276a8e721df28c02ceb8f3eeb"
 SRCREV_machine ?= "abb579170926348d1518bc1a2de8cb1cdf403808"
-SRCREV_meta ?= "5c912968f2cb938ad084d457dae99bf8eb16032d"
+SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index fae2de5c72..527728d9d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
 SRCREV_machine_qemux86-64 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
 SRCREV_machine_qemumips64 ?= "66cac7d41a43594760f6ac48e848d73315cc5dd3"
 SRCREV_machine ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
-SRCREV_meta ?= "5c912968f2cb938ad084d457dae99bf8eb16032d"
+SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.34.1


