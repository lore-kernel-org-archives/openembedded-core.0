Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573CEC47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:32 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.44773.1669904606733054898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Q8a8nY/Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id b11so2013122pjp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdi1U2uD7t92YyWRT7HQkh9JVLHUuSJRRSgowUikEs0=;
        b=Q8a8nY/Z16CgLeCw1wBR1WskvZCCTeFdtE8PNF55E51/W0+AwqiBhv36ov0DmZnUIk
         Os63iMC4JE+FrLaupWoezVqqpSO/QAzu0tf8gRtB1NWbwn+DK9sSV1qeJP4A3sUSxUEk
         oLfEEqZrnSieEGWpX2o5tpf6ZP15wV+ChosDcfuNJYRl/nJKBTXJlzC07sE1IXt2CjQz
         t/So7PZLaZtBu0Zy/STzNbG7U1wp/KVasxt1pdlI5GA8OEid+pzyISneFrHwcorjYzty
         G4iouB/2qWC7olDtzSpwO8qcpK9FzU5DBrlWI8aeQZcxxoDOPzuSvhegLe5/5W1n/KgY
         4+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdi1U2uD7t92YyWRT7HQkh9JVLHUuSJRRSgowUikEs0=;
        b=hOf5BvDBcQGWDyC0yWQ3g1JBAPqxPdLjQjsPR9nZkgo1V5O3XzPWW+X1fn8ehZDNUf
         Vp6FMcFa3+8h3TvDsO0+6+Nwsj88WUazSiZ1VMgK591xUKyii2NISq0CgDweSZcSitAf
         om9JFOSfZcLT3Lk1/qg7gA2WiKMdDA2DSK9sEC9MI2lCBypJ8ajsABVe4JhTKD2xSg7P
         b/Bk6ZQRBedHSzPoynXyhEVSJ/Zz+M1A+gDdjMFIDc6jlricA5BIQRu82Gjwh3heUdSU
         rVGkZznWFesK+qerX+stesZQ1TGRbAjMHue78FEAlVZt6Yb3ChQ5xjk0gc7D5wx8KwCN
         bsjA==
X-Gm-Message-State: ANoB5pmE6MvHXVMFFuixHLM7nrwE9oOz5Czh0Q5v7FKa0aNEEHXNlJTW
	8KcysvmBGIyLXw8XDKUur81csP3wLdxhAZVRvEg=
X-Google-Smtp-Source: AA0mqf5w+1gXUcucZdfNhUmbrZZrf5CcPBtYFx2lSiAT3a3BZV7dekwVKHsJr58Db80swxKtDgjC/w==
X-Received: by 2002:a17:902:7c08:b0:189:af2b:ebb1 with SMTP id x8-20020a1709027c0800b00189af2bebb1mr5832960pll.35.1669904605771;
        Thu, 01 Dec 2022 06:23:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/22] linux-yocto/5.19: cfg: intel and vesa updates
Date: Thu,  1 Dec 2022 04:22:41 -1000
Message-Id: <e0b898e0e058f584c39f24a0ecb342624f55a51d.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174074

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    399055aee2f vesafb.cfg: rename FB_BOOT_VESA_SUPPORT -> BOOT_VESA_SUPPORT
    fe0fe0945fb media-radio.cfg: switch RADIO_ADAPTERS from y to m
    9724cfa270c bsp/common-pc-64 : add igc driver
    39431755e59 bsp/intel-common: add igc driver for meta-intel bsp machines

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 47b3c8b07322c69b6070fee4803d3beee66f9a67)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index f55be51b64..f78ade3e10 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "59a2ffca6673305b3b9e3186294feb5437698d18"
-SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
+SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 41e37dbab1..f34ec707ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
+SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 76d9d4b4ad..0447d500d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
 SRCREV_machine:qemux86-64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
 SRCREV_machine:qemumips64 ?= "4e9603752156d3a0b9fe53309f4bc78d3f4f7df5"
 SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
+SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


