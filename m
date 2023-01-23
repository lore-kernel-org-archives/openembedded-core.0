Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00CBC54EB4
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:16 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.33733.1674440529681495283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QdwgE28h;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id f3so7961577pgc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USZ6IYZS32liPCUA5psD4jj04KrCS88Uc5wrU3deh+k=;
        b=QdwgE28hyfj+1dStxpC7o+IEeFzGxJiwHrGa3/RqW3CefgE5UOyXL9nTqGWw5mOOqb
         VN1DQGf+5MMaOiQ9B4Ee+nCb/opr26pe1tcergGWEwHbMaDgMxYHfy6pMfy85dydYXbp
         87W0LcjRe92OKcsAcKVfHValqwHHjkNQFTt107B3MPTb0KjtEbS1WmgZ+0isJ9nANkDG
         xT85+z2r4jSLhrwdYCe2jcXt9DYtty7wLaeszAYOebMt2UTTIz+No4VcSVdYseVq4ax5
         Of29Q0vXMy4XYtTXxI6R6XJYM0oUsHV/pynlZFzYg8xUU14FceY/WPyeNf6tCplA32hi
         HFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USZ6IYZS32liPCUA5psD4jj04KrCS88Uc5wrU3deh+k=;
        b=lYY/8ei+dTRHaQRTieAAqfk+GCxKGyeYVerFJauGwShqQKvdBQWsK+mbZLbNMC3scH
         4/lzXClj9+0/J5MfN30oiL/8U8HkLtQtuC1VbiBx1vejNyzejQuQnUqDTigz7mQEvKRg
         vlHGevDNDXOXsMtvUM1dUHt8hho0ddIlqYGHybAS2C2cmHFsuq5GOyci1cYPE3H8/NEJ
         3yvL0Ga6YkgvoCP0vA3INqTTN2Gy2q0Hk4gI/BKcIDdymooZ3q6lDZPdxU+SYlWyDCIO
         kqFxGdycSjK2ORx3Sj4RKUQlcix7mPm4AZ1exg0u1jLg3EhMNrHtzMLm4Ox1am9ehgbe
         i71w==
X-Gm-Message-State: AFqh2kp4lwM2stZUb4UvlRUzGJpUma1ERuqkWkWD6I4WZd9L2K9dy6fH
	4Yr+Vq0UHG9oH1WwftmNZB0Jvsc3SrHs0z4RdIw=
X-Google-Smtp-Source: AMrXdXtPxIWdWEk1FaLRHRLKmqU2Qij1tDaa9ulD4JXVxzCd9GLgFFIkWxcS213GyJ5IJM9FTdQaeQ==
X-Received: by 2002:aa7:94ac:0:b0:58d:e33b:d562 with SMTP id a12-20020aa794ac000000b0058de33bd562mr17594781pfl.11.1674440528667;
        Sun, 22 Jan 2023 18:22:08 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/32] linux-yocto/5.15: ltp and squashfs fixes
Date: Sun, 22 Jan 2023 16:21:07 -1000
Message-Id: <6dd61c0dc143e53acddd3a181298b18bb8bc789a.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176277

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 474ddb758dd1b327540e48ccfe1500fb4231f30b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index fc1ccd9b39..bd57d7c47e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a0d36398b257c555381e735cd721cd8479d6762d"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine ?= "9860fe27332e09dd4f0f3b303e40377de083be9a"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 087c30b5a5..8b83b5a8de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1c3448ff6cc6d24d16c6ef6065cb642245cac627"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine ?= "86627fc3da74aefec1338724a597356e6b8ad88b"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index d5f21daf35..0b373c40fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d3aa5916b2b02966ef37bfe3fc527c99754571ec"
-SRCREV_machine:qemuarm64 ?= "a1d364fbe3d8a916426a107f07b89fd0338923c7"
-SRCREV_machine:qemumips ?= "904de7b55a7e8edf4cd894fb0558efee799a314a"
-SRCREV_machine:qemuppc ?= "35d547b91124bef128a13402190ca05f54a2392e"
-SRCREV_machine:qemuriscv64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemuriscv32 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemux86 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemux86-64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemumips64 ?= "ae8ab2e3acaf9e14cd75a6c96f1ba43c66a1babd"
-SRCREV_machine ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine:qemuarm ?= "4915b05912ee7d15224eb9064ca63678f0bc6815"
+SRCREV_machine:qemuarm64 ?= "660bf605998f60fd77f24d3316b95b14ef2fa035"
+SRCREV_machine:qemumips ?= "38bf282c052b70c1c6dd79dc6ae49da1ec1c7de8"
+SRCREV_machine:qemuppc ?= "ac4a5d99364cede21dc1838213f7fb29e1735969"
+SRCREV_machine:qemuriscv64 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemuriscv32 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemux86 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemux86-64 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemumips64 ?= "2923c39cc815e2109c9bfc0985adcd8d342fc415"
+SRCREV_machine ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "509a32764e1a5692935c4f26ed96fbe94c480186"
+SRCREV_machine:class-devupstream ?= "71e496bd338221709b180b60ba419fa542c2b320"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-- 
2.25.1


