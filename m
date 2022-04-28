Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB88AC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:07 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web12.10752.1651153686217722681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ajSbvn/Q;
 spf=pass (domain: gmail.com, ip: 209.85.219.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id jt15so3202346qvb.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ayT5haAwx2xg3TV7HddjzdvoDQ5sWXcQNTa2reKZxqI=;
        b=ajSbvn/QswKTdS9mW/YGAqWKSp5yem+dOo16pSgwYxV4NkNbVRudUXoXUlVclRKr7E
         bOkWEcoB/pHcxlOwK4i9dROJhIy2FueokAa5HbuR7HGizE9OskVhT5pOkCZAFanSMtt+
         WTQEl/m+o9eHq5j+Ur0QV/EHkSClOdDk64CB+KIk9MbZnxR3lRPILDF1RpkrjTlcwufg
         Vfl+PVewXaD6/6hilrVcXNYD2QJ1oPP5WXJCRIrzcU/qNXL/asReUseN2dIjCHXPh4zx
         67Tl8kifCwstKJqpR7OznW93/9ybWF+i9bW7ocoCf2cV1JgIpBiTSZaMsnZ9WrTb0DCr
         gfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ayT5haAwx2xg3TV7HddjzdvoDQ5sWXcQNTa2reKZxqI=;
        b=odsVYZ7JdbQv2+0pk5lFxG9SHTFv0Ki5fa3cFc3UwOZ7s4P9dLSwzxM2Vi9YcekmkU
         MZz9qJK5F5AL4qVjOw0tPZa+jDCxT/RXNQBX3b1D3ktMUvYkDQbqmgwoq+1AYQkS3gYN
         9YQQR3qZu+AcRgm92+Hy/RvwmQtVGn3OXOdBl/pFfv+rs11XDGYZgRbDAYQLJD1fGpdw
         X7UOz9QDTzI/g8thCwnLlGE+X4D89LlFjyGNiolk6HpS22s3KFarG5bcGLacSydqeHQH
         GpUEHMRU8VffJe45WaNxw6UdzI8+W5HEwuo7H3UvIV3pHwoT9B88If17JgzvDAwXdGcT
         GDLg==
X-Gm-Message-State: AOAM5327ancqHxM582ewokbHeLXKrN5+7Aq/3K4ajCSZnBTXiHQohefm
	kFtCQuZG88wkN/M+jFttMGM=
X-Google-Smtp-Source: 
 ABdhPJyuVHuIsoU2Bq2xAFlKxVTv/ENeWLa8ud9nrcdbskLVrDp+0KRN54WZR8bXXb1DXC7KP0IOfQ==
X-Received: by 2002:a05:6214:f6a:b0:456:3742:c909 with SMTP id
 iy10-20020a0562140f6a00b004563742c909mr15140053qvb.49.1651153685182;
        Thu, 28 Apr 2022 06:48:05 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 01/15] linux-yocto/5.15: arm: poky-tiny cleanup and fixes
Date: Thu, 28 Apr 2022 09:47:47 -0400
Message-Id: 
 <fd419e09687e43015628b8544c6d9a12fa94c621.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164949

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
index 43a5ad728a..129b70cb24 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
-SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
+SRCREV_meta ?= "20dcef879138eeb57347b35d2250a432ee23d927"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 5cfa0c37d7..cfdce6ea97 100644
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


