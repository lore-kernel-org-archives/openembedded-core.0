Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083A0C52D77
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:30 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.82155.1674238285685718262
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SXq+StwW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id s67so4743998pgs.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzS3yrXOwr4cMV1MDXfBAUi4Wt6olfFIkaTGggxFWRg=;
        b=SXq+StwWcWYGbowtmha6YUczXAKVwKwJ5BbAgc0X0KJKngvVR2QIb6T/0Ea6+FFQ+Y
         VM3VpV6lZG8QNYlJzdDIlOR/cYVHpo61XkSvleJLM3UIw4OVZBL6Bz8l4dhPzsiElebG
         VJN4N39F+bN/BvQPPNrwQzg7UbpSh1S12czrdoZNSA0W1HOh7egkP1tuQ7wn55TUFVBu
         Mw1QhlD/atru6ZA3tt2NDuxYxidAdlCCAR3ZlKNP+9j1xc4q54gCQWqwU4Z2lZ0O4Hdq
         YLo53IzJe1WzTzoIo5adqcUOLD2KgMiDmyDJbeR4A3EM85Nwv2+M/VGUAPi1ChQm6Sdr
         v7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzS3yrXOwr4cMV1MDXfBAUi4Wt6olfFIkaTGggxFWRg=;
        b=dgllO9EewfbdeCDO9oED7RT+bmuN16rIo23135Wv0T/o543khf6lo3uNL+z2L2ZEhu
         h5FYx9ZUaT4xQoJcQvs/cnvmykACZ7tCU9OCHiwY0oBGx2YHoI69J+jJieSEhpO607XQ
         ao3EU9Zeuj+b/zeXjcjDyC7hldsmai3a3IPVSIJr3+UQB0XFehFl52rZRRXcNRU61RZY
         lT4A7sDFSURugzc3cOWpJ71kFKbg0Dnp2RUpaEsChifaR5EumWpTXJp1+pPgSPx4RJLm
         Ec+ipMUOCLB5Elfc6qrQd0QfR/TcH4Dc+Z5GhKoSS51dDTZARog53e0YoQeTT6t92JT0
         guRg==
X-Gm-Message-State: AFqh2koYppEaEWnKE7vpKuj1iXknbkO3cKJEhAAoWPTr19kduE+7nu3B
	ht2OCjMj8LGFCNZLmZk3li805hdQIFtPn5Ya2A8=
X-Google-Smtp-Source: AMrXdXuRT+nGxrVQyZJfEYqN2aMqxW1wVE5i7bq3ILsfWXakcgPy/3LTYhnk2b/HJRFaqWt8dRWk+A==
X-Received: by 2002:a62:1c45:0:b0:58d:9850:d556 with SMTP id c66-20020a621c45000000b0058d9850d556mr15947282pfc.18.1674238284703;
        Fri, 20 Jan 2023 10:11:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/41] linux-yocto/5.19: fix perf build with clang
Date: Fri, 20 Jan 2023 08:10:28 -1000
Message-Id: <5cd80b0fb27560a516b3634e9a98f366883c8047.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176217

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.19:

    3326dff489c8 tools: Remove some options from CLANG_CROSS_FLAGS
    5b92f7def854 libbpf: Fix build warning on ref_ctr_off
    b7cd8e00afcd perf python: Account for multiple words in CC

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b734bd73763548e3991803c03b8bcc3b4bea6432)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.19.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index de087eabd4..8fb4a6b665 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7883e2f6464fb14e4652769c0294b2eef8075f5f"
-SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
+SRCREV_machine ?= "8385624e99ac8f15de12a2253e8537dd25fbb082"
+SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 20ee864401..92214b4d90 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
-SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
+SRCREV_machine ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 8d891fe01c..2462f5cac3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "dee954e39057710f00e5b3ea23514d01f3a4d940"
-SRCREV_machine:qemuarm64 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
-SRCREV_machine:qemumips ?= "fe2b95c83e022371019027da3dd068ab33576d3f"
-SRCREV_machine:qemuppc ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
-SRCREV_machine:qemuriscv64 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
-SRCREV_machine:qemuriscv32 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
-SRCREV_machine:qemux86 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
-SRCREV_machine:qemux86-64 ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
-SRCREV_machine:qemumips64 ?= "a5f29b9c64f2b3b47f74fee38f298d8a6b17a8b3"
-SRCREV_machine ?= "aaf4490d1807c49e3e0ceab1372533937ef2c82b"
-SRCREV_meta ?= "0cba9aa40445bf59bfa651e1bd43a31c2ca7d524"
+SRCREV_machine:qemuarm ?= "6a3ad6f786482c60fa0619935fe48dbb44673084"
+SRCREV_machine:qemuarm64 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_machine:qemumips ?= "6722056dc4ccc7ccb7ca6a9d3dd840031c83d66d"
+SRCREV_machine:qemuppc ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_machine:qemuriscv64 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_machine:qemuriscv32 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_machine:qemux86 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_machine:qemux86-64 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_machine:qemumips64 ?= "d5bdf10616a90465afaef449feeaf31a51748220"
+SRCREV_machine ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


