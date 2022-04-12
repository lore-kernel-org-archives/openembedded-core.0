Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7048C43217
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:13 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web12.2084.1649799967825773100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CVl2d/x1;
 spf=pass (domain: gmail.com, ip: 209.85.217.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id e11so17518285vso.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HBZj2PRmIUH1stxupnJRMiOeP1Rxm/2istuuUxXdJ+U=;
        b=CVl2d/x1I07BZE54YPwz2fxvqC6IAKSdfjDe2SVuVXiphLRfz1ZCjiB1RZkShNOtOM
         ixJrDM83U2wug7JMmXqkF01ajwuIxXMkCYEgMhhVc3VQJjEDa2L44FEGWFIxPoSOL4qA
         AqVI7314TzxROxzGXaNwXIU14jAgLPULrCAhyIRfD2rmnDeIm+S7TJX7F23LGtAovic6
         c0t9qkEsRFG71J2xRUDbd8M5NJBH+/yydBDvxUQrJdNHOk8SoxKc9+W4dJFg0/44cZRb
         mhwXUylyESZuQ5TZ5ULfy0P2sMIH6x8D7+BxzwTr/deWotNGWuecv76XmiXRc7xZlSD3
         yw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HBZj2PRmIUH1stxupnJRMiOeP1Rxm/2istuuUxXdJ+U=;
        b=gDXJw2pPzfm2rdPiSs5/2uRT5Kyz/SAkHN4BX9vy2+gZOnRd9scZJ16elHRVMFvF0/
         WlXWaz3vmmR2biMvUG6OzkOMZ4NVkS49szEJLj+CZJQXg7fcPlZtuultkSq5IM2/GxnT
         /xtvmJ533iPuX4Un0DbDczBcq2giokqtG0ZfxosbRGrtEiXt6LWZBsYhoKfUCJChrImQ
         2oIzmmmpAHwVIC4FpNr5CZjCE3JsAXp2KMGSGPqxqsVmwB425U9pJbAmVoBNOc2+7Gsp
         B9YaC8tm2IWdnadK8SpAyiZaNZY90wFVvJeRFRImhF4h1u87iZKvfAhWAbWFBUROB4+s
         ZiAA==
X-Gm-Message-State: AOAM532RJGenVT5srzvUFYpQ8+g3U72TvgO5VZ3UBw/79Ekoz9vFYM+j
	4InOrwLAvvZ9XB6L9Lhbw2g=
X-Google-Smtp-Source: 
 ABdhPJwpE5O/Pxwsz4ixXl1H6w3ka2daMe+c7w4+ti01QCAG/2zaHTqGP1tj/yn2WopMjtMJC9UMqw==
X-Received: by 2002:a05:6102:e8a:b0:325:7b06:c348 with SMTP id
 l10-20020a0561020e8a00b003257b06c348mr12212833vst.52.1649799966817;
        Tue, 12 Apr 2022 14:46:06 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a9f3ece000000b0035d20c94b68sm1527638uaj.29.2022.04.12.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:46:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/5.15: arm: poky-tiny cleanup and fixes
Date: Tue, 12 Apr 2022 17:45:56 -0400
Message-Id: 
 <53a5d3cad467a936728cd84170371faf0f15ab00.1649799823.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1649799823.git.bruce.ashfield@gmail.com>
References: <cover.1649799823.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164284

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    20dcef87913 versatile: restore explicit CONFIG_ARM
    8e63ec2fc66 qemuarm64: cleanup for tiny enablement
    fa720c009a8 arm-versatile-926ejs: reorg for tiny and preempt-rt
    7febff689a8 qemuarma15: fix tiny and preempt-rt
    7720c50d622 tiny: make more generic
    f052e84eafa pci: remove CONFIG_PCI_MMCONFIG
    917043019b4 virtio: Add prereqs for tiny
    da919d67b1a common-pc: add CONFIG_ISA_DMA_API for tiny
    1a3a497c472 x2apic: enable iommu for tiny
    63e25b57177 features/security: Move x86_64 configs to separate file

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 87ccfc1f45..b7949e3b85 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "29d051cc421a76432897019edc33edae35b16e39"
-SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
+SRCREV_meta ?= "20dcef879138eeb57347b35d2250a432ee23d927"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index d8ce5dc518..29140aedf5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "cc9e92e826af229b841fcaf8c645e638a86eba43"
 SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
-SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
+SRCREV_meta ?= "20dcef879138eeb57347b35d2250a432ee23d927"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 54157fd245..a76bb581e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
 SRCREV_machine:qemux86-64 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
 SRCREV_machine:qemumips64 ?= "a4805fe749c9c56d18a60b5378674760ef0e85ed"
 SRCREV_machine ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
-SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
+SRCREV_meta ?= "20dcef879138eeb57347b35d2250a432ee23d927"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


