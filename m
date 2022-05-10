Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393F4C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:05 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.10766.1652193543807457421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uIO+DgCO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id c9so16224675plh.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Lg9SFgWsqXRZ/B4ZGUgspGRq/36hWNxyC0/6vABW/xc=;
        b=uIO+DgCOL9cp8eaJ5Iwon7qdBBjawLj4cknP8rHMFVWh2IUo4MjKz/4Yj4hwhOU09p
         WV7kru2Hp2hoRyP4r+tVsm69diQ9eMzm/RrP7hV129zcaGGPy7ciWrQ1LnEY0PM0lUKz
         D37FWZMrm0wmlg+ev5MMN4Ubw+30BfhFrUWC+Zkffdo8XktWu7Wa8nHDU6t4EuF45gg9
         /JQvrP3LDfVRNqUWlcUC0O0cThDbcM5FzBjZ9xaXLLPdDGz6wEC0xC7qwEs0QuARaV9f
         vemIcyJFrjLmTUgkfGqHUFMD1LUzudd5Gw3Yd7VQGswEpxFlmSIH5Glt6koa7RXtBMjt
         uChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lg9SFgWsqXRZ/B4ZGUgspGRq/36hWNxyC0/6vABW/xc=;
        b=dw0o+XKFlP3zIp3FKjpDL7bYl61cjPPszhH5kC/lbEtn8h5+s/SoV3UyBde0O+LBpI
         Q4No+i1+Sar32toIQWc0lMmIZtu/cC0oGlyt0BcidzCwKxY+nXZWn9GuxQ5R8eHh+lXP
         iU8ZVA3KDtNElGMul7LgyrKvk5yDc1W1cqO2wgwudX8j1xANWwZED3YuITL12rozP7M9
         ddrAhMvb2S2gy508ZSUygWfadw9/+4WHRS++JsrFrZjVmYW3turTv88i66ly+P1TDB+3
         kUOaODGvnzyJP6WD9h/yCLZ+cStLqw4ZiY7ADTOMTiqvgJRwvsaZJN9GNZq40mYgsImo
         C2Zw==
X-Gm-Message-State: AOAM5305cs0UeQ7LQbPm5vMonWZ5+D9YAwHa2xsGg3BsJJALW5kxS29d
	nQOJbFb0Z3io71lLxL0PeKrBGAvdMhTjPkfn
X-Google-Smtp-Source: 
 ABdhPJzPPkpxtOMV1PQjVkTWmmlXpuSmvPLDEWi2ZJYVSmW656u5s38uHeTJQx5nszks4Q4V6i513Q==
X-Received: by 2002:a17:90a:8c04:b0:1de:5177:37e5 with SMTP id
 a4-20020a17090a8c0400b001de517737e5mr348142pjo.26.1652193542329;
        Tue, 10 May 2022 07:39:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/40] linux-yocto/5.15: arm: poky-tiny cleanup
 and fixes
Date: Tue, 10 May 2022 04:36:53 -1000
Message-Id: 
 <74f2af2010e133e0cc1f8767bd3bcabbfca7c784.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165431

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3e966df4f2d3236a259e6057f2deb22823fca173)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


