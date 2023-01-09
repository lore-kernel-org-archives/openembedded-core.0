Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ECAC678D6
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:15 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.59784.1673224748848104508
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dEIearL2;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id j9so5267950qvt.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dfOz6G6hXv/QOEnhEtAj5Pu3GimTtzRsJPFieHmMcM=;
        b=dEIearL2vBNdXftxjsOi9b0LiO8nCVi9hfNZbACC68h0bJxrCQto1vJZpyXUFCcCxK
         Ak0vp30ugiM0l1lqPjn1xb1deDnRR9jUemDmV2tdb5xtMbl5eEDi99bxMEBT/XZfcf1E
         t+eVmePuAGrWImNuz5AvX0ZhSVB/dPaPKhKkB474+JlfUrBTNYv8OJK7kNNz2v52PA3U
         /qnrQJIs23oDc5VZN0gVnXrFqdzpgp57NIvb0zGWX/5B6NC0evNwl1hhJu/O7RW8zJC+
         BsaycDa1AKSOzpTL12efGaDm4s581s+CKAM8ZZxDhjVmpDZx14vXMVJSKG4BwTTknctT
         c3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dfOz6G6hXv/QOEnhEtAj5Pu3GimTtzRsJPFieHmMcM=;
        b=5//dnT84Oe5VNIFNonpEUQ71hwh+UauCt4rP5n18n4Tlq6N7YtP5BhoI27PuSOp1rL
         2Sok6MZwNxP2aAht9ZRUg2QrDhpaXT8HLwcJDwAAIr2Oevn1iEOqGAOgA7o3gC2PTYrD
         vHjqNdF4B3zrJBi4MGTvjvun1K2jnXWGYbSwNXV4n7X7Dq+1D+DHoBOvd7wt8dYbbtxD
         k6Vks9F+MG1Qjbow8oROjQ/qwjdPMZr9HvJjpJv0CikIvULeI/4QqKwbvvKqitIHV/m5
         YKDOtUeocNRL+Ci2jmYS9NTHOtfBZ1IXv6fNHb+oXefTqw2p167Y74P6u+VgILgx9mcw
         fPuQ==
X-Gm-Message-State: AFqh2kogEuEprfUbHXuUBh2T8r8z/r/Sz+zzj2FrXp/44cWj+kKs/Zem
	aj62nfL8b65V7L7kORehKfo=
X-Google-Smtp-Source: AMrXdXsLJY5RjlSgguhzV+XBiXmSbaxU4xZbfdr36xZH/3v5ONaLfxcUD5bseyDZLd2qUn6lMeDNTA==
X-Received: by 2002:a05:6214:127:b0:4e1:bb55:1d7f with SMTP id w7-20020a056214012700b004e1bb551d7fmr86481945qvs.1.1673224747776;
        Sun, 08 Jan 2023 16:39:07 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:07 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/14] linux-yocto/5.19: fix perf build with clang
Date: Sun,  8 Jan 2023 19:38:50 -0500
Message-Id: <e288fabacc03ae5117c2f8f7a5e05c188d763e5e.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175644

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
2.34.1


