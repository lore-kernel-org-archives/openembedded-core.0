Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4164BC46467
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:42:25 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.57988.1671561737046681794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MtEj8+t/;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id jr11so11761374qtb.7
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oU5wLW9VPcfvdm58nedSrof0VAbzQ36owBXIHRT7pQ=;
        b=MtEj8+t/q7xfphvGKgbF7TvxTGdlA9EVgbESz9m3BbwlEJ0XBDU9AAJN8U7SMof70t
         zCnYfoRed/wg9x0uFkpdAQ8vy+eb0QskqHlZgu6ly2x4AK3KmGp1ZnoYwDDrIYUVKsqE
         VKZHlbB5GkTdPRpAccKKtHAQdU4xVyevAKMoasusbJWv1FON3LRU3/VXHjoHVmtN0Mzo
         djHc/eTVhVfzs9Uhtgq4ryINcMtzzmoh1b9F8VadnFVbBwfpI0rdha9s/FEevGe7GMEA
         O4G0zoqJ6wCCg4xxd2hOqoFNzCLYr3dwdSDDDai+7hvwn6c9vG/8CmqKK3wba46MdUxq
         bOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oU5wLW9VPcfvdm58nedSrof0VAbzQ36owBXIHRT7pQ=;
        b=MSITCHsskPmbUzoSvJXx/3byxrpZZjmqyxdIe16aln5J3t5gCAf02ejdahbl9qXBPO
         hGdUHcEtJ3gDfG4LjgRlpJMh0t7oh2qal5o34lqxVKeoPcWT2q5KFOVBrnL1W1mEtZ6t
         eHVoLnYoht53Wxc0LDID9XrE1ByVz9amh8snsLfQR6kTK5Dr1+mmgbsKYr/94+SfcGw7
         cDs8aJWTGUAK2a7fjFKhcUREN0wsjRdnTAK5VFakobGFP8xGr7KQFcgZgqJxhAI89TmN
         uI7OTxMm+kL5UUOHX5gcUJndFWkuWWVPhGXCEgLGhP55sNET1HXeyHzpHZMwGchdpxoV
         2sag==
X-Gm-Message-State: AFqh2krLaQU0Ru48/2Uv6dsjma1lm+F+3jZ2l0IveO322c1ykvKIPvNj
	R5bd6epn4RAF4RFEOIYJHnc=
X-Google-Smtp-Source: AMrXdXs20PEvTBGpHACvtaYX8NgtzcB6pIELVCn6dCje8NN3tDlaMgk/Kw7iQ6pCdja2ZfNy5T8uXg==
X-Received: by 2002:a05:622a:1896:b0:3aa:82c0:1ca3 with SMTP id v22-20020a05622a189600b003aa82c01ca3mr6708152qtc.23.1671561735971;
        Tue, 20 Dec 2022 10:42:15 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006fc94f65417sm9229265qkg.40.2022.12.20.10.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:42:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/5.19: fix perf build with clang
Date: Tue, 20 Dec 2022 13:42:04 -0500
Message-Id: <3f3eaedbf112a261454700635ddc388b62fc53b9.1671560769.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1671560768.git.bruce.ashfield@gmail.com>
References: <cover.1671560768.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174876

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.19:

    3326dff489c8 tools: Remove some options from CLANG_CROSS_FLAGS
    5b92f7def854 libbpf: Fix build warning on ref_ctr_off
    b7cd8e00afcd perf python: Account for multiple words in CC

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
2.37.3


