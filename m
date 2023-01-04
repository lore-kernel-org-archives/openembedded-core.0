Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C45C4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:18:42 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.10594.1672834713703742996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 04:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HM2j4S8S;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: toertel@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id z16so16264928wrw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 04:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL0hH40U7zyQ9k6eTEteJxmFnvLHVjjGvlBjnXjxjQE=;
        b=HM2j4S8SMXK4qv6jI5qcHTUSC6sb+AXRLlRvkmV3qNnXBIiHlsknqxPV+vfW6ASWdR
         wAVoo2auWIHZU9OFdnhPlOiSf3t0t+v4yEgr75XalBLYPbgM+9ft95klJmk4JBqLpPyh
         /DtaQAAG1H+euI0TD3McQy2zi5ZZHTDIRpu4LBZfqJIFou/3FMFTJ3aqc7UPn//L4BDT
         zTTj+Bj5fbYQQoBR+KKvdw+f31qzeoXNFprQI7GI4e2rNvVSKCnr+epQnkT8a2bVP8/N
         p9y+t97Yv005wewLAi0HeG3c2Q+AK2TFCIf4O7j+ra07FTjLvOT4q/4JK0AddwxXx/un
         w5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL0hH40U7zyQ9k6eTEteJxmFnvLHVjjGvlBjnXjxjQE=;
        b=XGwUX+rhNLra2RCeI9tepBe7E0BFsZCw2PNsOeJVkkzv7FL9izWl3xOnc3dBB9uyZ8
         y22A3i20i+zuyhFmGzgbF8YUWWgN+24DejZUA6KtLV5MPt63v0OjO3PeoQdJr/e91kJL
         ELBh1Rgv7BUSkai+/7xex6ILvLcpaiNHImEpUEFFgJ/27y6KI/09TpEosg55hN/hBToa
         oqXAKXwFnbaO7ymHLfoMdFvA/8f7PdXxhbIfXFb+1+ygUmzHsSnRHbXI7U50K1MEoy45
         KTvNJHUXfwKzXgRUO4QQJ71rwz9Hi67Qu4KfVxpp8wGWmhgdb667PzzxdxzMcB9tLR7J
         ApqQ==
X-Gm-Message-State: AFqh2koz/3pmyVr1djZ0108FzCeg11wElzViAsDzkRxCoF0rawx3A8pm
	aEeDlaHhnNBaajB6t33pHFZv70svw6o=
X-Google-Smtp-Source: AMrXdXsQXnmLply2PPsfe03S6Htfv5+XBdcAAgOv7PKtD4V4m+eg9056AASDet/EI27govMdMWJL5w==
X-Received: by 2002:a5d:444d:0:b0:242:48f8:3f56 with SMTP id x13-20020a5d444d000000b0024248f83f56mr28572751wrr.39.1672834711849;
        Wed, 04 Jan 2023 04:18:31 -0800 (PST)
Received: from ThinkCentre.fritz.box (p200300cfaf4b81003e9287465d6a8a6d.dip0.t-ipconnect.de. [2003:cf:af4b:8100:3e92:8746:5d6a:8a6d])
        by smtp.gmail.com with ESMTPSA id d11-20020adffd8b000000b00236545edc91sm33564176wrr.76.2023.01.04.04.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 04:18:31 -0800 (PST)
From: toertel@gmail.com
To: openembedded-core@lists.openembedded.org,
	michael.opdenacker@bootlin.com,
	richard.purdie@linuxfoundation.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [PATCH 1/2] conf/machine: Match QEMU x86 sound kernel module
Date: Wed,  4 Jan 2023 13:18:07 +0100
Message-Id: <20230104121808.1065203-2-toertel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104121808.1065203-1-toertel@gmail.com>
References: <20230104121808.1065203-1-toertel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175470

From: Mark Jonas <toertel@gmail.com>

In "conf/machine: fix QEMU x86 sound options" b802a5dd the sound devices
emulated by QEMU were changed from AC97 (intel8x0) and ES1370
(Soundblaster) to just AC97. Yet, the sound kernel modules added to the
file system still matched ES1370.

This patch adds the matching snd-intel8x0 kernel module for the
emulated AC97 sound card. It removes the unused ES1370 kernel modules.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta/conf/machine/qemux86-64.conf | 3 ++-
 meta/conf/machine/qemux86.conf    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 8640867911..e249397d06 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -36,7 +36,8 @@ MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+# matches QEMU -device AC97
+MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-intel8x0"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 1e072e1ae2..d61c7816dd 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -33,7 +33,8 @@ MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+# matches QEMU -device AC97
+MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-intel8x0"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.34.1


