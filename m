Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CF7C67871
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:24 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.59789.1673224752473637853
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pqNXirbA;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id d13so5201421qvj.8
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ73m6AI5Lb7SX/dgl11fW8d6SSFdlhrVG99Mleoog8=;
        b=pqNXirbAVt0/czmzUoDI4Gkcjb976LliP4ZWiusT1JW+oLqmQ8pjTLpjtIHQngNzWO
         Kv+xoYw5zR6JU+EI9ZM3ONRwBOsomNJBsIqwLiWryltmFSOM+GBBuW7zSupMnuTDmrdT
         7fiA98jswRtXS44AJEYXYGE2KKQC6ppRJTZpflJoDwN06eT8awZRAzzSZdsJs2/TP635
         VnYOg6TeJHBtjgZKea+1WNdIMiQ0jBZLfy2LvLwtR9ETChPbOzdlc1SHu1ZJf8kgDms2
         2tB7n+JFpFI3WsVQFGQzE87dI8by28AEtCpyFPc0gQBLkQuUP6vqc+b/GY3kUWQejh9f
         GWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ73m6AI5Lb7SX/dgl11fW8d6SSFdlhrVG99Mleoog8=;
        b=h2Z6gFKgtTsW/hkQX1Nbw9n4o/KyCGbuK84rF+xIOku/rgTwyoCcvlPV2+maUM0wIo
         N9HmuUCCX/HLtbTUJTMmcAuFxYUH3bsQez358KpHUK4RZhaTZgTEJb6xv4xyb9Mw6z61
         QyD7sAXow1sWTuutS0G2lb5jSiP06/EdrRl2hqRLc3RJv86yUW5DEJbuaRvbBVVtmq3C
         yzcBabjtU5aSOzCDngwhYh1kkhEwvK0f9Zg/OeeK9GJxa/fwcQ1bKPSXxjPXKqkgQGCL
         Nol/nh1W754xTp1reHFIu6Fj1TYFk62lEle4dPU4LLmHtZWiLo+IslU6dLw4vR4deuqS
         Bgyw==
X-Gm-Message-State: AFqh2kqitFz/sNXAQDkKwcEtGlFj4FKzPLkC5imFCoIMpn+tBDvOwomx
	gI8GMiKK1ge1CkzYVoUGuJTEqooc5FDi3g==
X-Google-Smtp-Source: AMrXdXt5w/slE7FlpWQ9CKDYzxYpxv4lPcvDTcn3+N6hkT0AkUXgrdYjMQY1BRxQZTddQJTUX+F96w==
X-Received: by 2002:a0c:d605:0:b0:532:1caa:3402 with SMTP id c5-20020a0cd605000000b005321caa3402mr13426103qvj.12.1673224755622;
        Sun, 08 Jan 2023 16:39:15 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/14] linux-yocto/5.15: powerpc: Fix reschedule bug in KUAP-unlocked user copy
Date: Sun,  8 Jan 2023 19:38:58 -0500
Message-Id: <ecbdde939afd2a09fa4250fc50ea3019af1a9700.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175652

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index dd9f940c7c..122fc0feac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6a972b54f014ca67588d73f32058c42af0bd856e"
-SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
+SRCREV_machine ?= "e53e73b907707b92b3433de7c9c776aa504b2d0b"
+SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 8aa2ee14f2..f060e22e84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6e85c80a960287ec238f53c91eeade3456044fa3"
-SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
+SRCREV_machine ?= "ae2415ee19511e205a983bc8024700c1f794076a"
+SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index f28dae716b..bb48e158ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "24c30a8e9f8385f6d74785aa345f5731321b6c41"
-SRCREV_machine:qemuarm64 ?= "c3caed57192735dc74adff939ea35af248a11177"
-SRCREV_machine:qemumips ?= "3bed92886dc9177ce0076dada5056cbe83ec11f0"
-SRCREV_machine:qemuppc ?= "45cbeb05d362ee51b7836a7faa07958670110c38"
-SRCREV_machine:qemuriscv64 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemuriscv32 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemux86 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemux86-64 ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_machine:qemumips64 ?= "2642cdd862a63f5a8c2774f372f3d3424991b1b9"
-SRCREV_machine ?= "da5513f301871b972d5bc6fab284d3cb277e0a28"
-SRCREV_meta ?= "72756ee16d7230f04fb6bbf0bb115e32a9d73d8d"
+SRCREV_machine:qemuarm ?= "8c0f02ba7db6a463ca3aef969441906706edb350"
+SRCREV_machine:qemuarm64 ?= "42a14881ba8145b2d1bdfc019c603abe79aeafd4"
+SRCREV_machine:qemumips ?= "1ea321a5c9c66edba818ddffcef2aa9910de552e"
+SRCREV_machine:qemuppc ?= "14da484e7f2fc95e10abb4db96bc5fd6b444cb60"
+SRCREV_machine:qemuriscv64 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemuriscv32 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemux86 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemux86-64 ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_machine:qemumips64 ?= "8db5fd5c032f44486ef52f34724d0452aa3a6fea"
+SRCREV_machine ?= "f100c753aa1f9638bfd476da0498b09fdee569d6"
+SRCREV_meta ?= "e77e5259a3d11efe417b164a0f3341c07ba2bc46"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


