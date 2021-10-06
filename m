Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD08C4332F
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 11:33:13 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.10578.1633519988247172982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=enO+prx7;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id b16so2157982qtt.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=slfJZFCIvXFtEKnU3oGf1JjQnLd7jfXtThlEYtylW2w=;
        b=enO+prx7loFPPLYPawM07lNnlf6fmnMH1kkCQJRo/RY6mSB/j63D81QuK06P+IZKBM
         3UX4ydYp59dn+Q2lu7nW+BJdEQNvFMAb2okuDi0LtaBhXt6Z7cxI/X6WqIT2jY0Wi6h9
         I/Ei7TviusyJIt/I9xb/9DfT34oQeufCCdRkyRmgXLfm3l+8tqEIkevkVZHaBv7jqvNa
         hw8052OMLIvOfS9dI/HFvx0aaTA/eRPyW3xcKIDzd1Nj384dmqG6CnRs7KNhVWZj6had
         tCWbj6ewFqHsq6xJJ3T/l3kKHp1J3PfIgbBr3L+8j+TLi33E66u+9IwA76vAmIovWftZ
         73Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=slfJZFCIvXFtEKnU3oGf1JjQnLd7jfXtThlEYtylW2w=;
        b=fPhOotGnlYyRLTjtCWa9RNLH2+RRhzNZUyExqgRhIoPFYRZLAWM63+e1MaPU22QF3h
         PJjHS65oM5ga2tVF5VQ6pIRjIjtdEpZfnvti9bOpIMKJIEJDtCeDjDN0Hx9NXfZF/vkQ
         ExSwMn2+TdpYLb8UIaaTKw86dIAsfnQ4soYVeyCSPymG8Nm3R5uGNEsosyrRmm2ktgC9
         0zE2tk0/nkZ/oCffKtDOmlBTzwYAw63FdyKR0NRjaknbi9514RPYk0m/0iPLZiNjOYkf
         jReY6PbbeLXtoKCRq0G1MlvjxKEeA3r8Mq8xdqITJF+qbd8gaI8g/x+gPFEooQu8aCGm
         1r/w==
X-Gm-Message-State: AOAM533dq02E4OxDIEJsHPlbXZbSiO84SKHNEZz6DNQvnK/d8lAXQtKU
	LZXZd39BT4WeNBYvwCQ2LnE=
X-Google-Smtp-Source: 
 ABdhPJzXUSAJ8Wm97n3G+mQ6NZEkb4BhvAryL7Ze61pi0hyDy32QKHpVup/riviQJz/6d/hsd+mJAw==
X-Received: by 2002:ac8:4d48:: with SMTP id x8mr25789290qtv.415.1633519987152;
        Wed, 06 Oct 2021 04:33:07 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 u10sm12632931qkp.58.2021.10.06.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 04:33:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.14: revert: scripts/gcc-plugins: consistently
 use HOSTCC
Date: Wed,  6 Oct 2021 07:33:05 -0400
Message-Id: <20211006113305.13215-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 11:33:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156693

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The previously picked up gcc-plugins script wasn't correct and has
been retracted upstream. We do the same in our 5.14 kernel:

    c4def465fc44 Revert "scripts/gcc-plugins: consistently use HOSTCC"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This follows my previous patches to add the 5.14 -stable updates to
linux-yocto.

Cheers,

Bruce

 .../linux/linux-yocto-rt_5.14.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.14.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 3088254265..0baffe6f2f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "37f05fcf24a295b1e786e20b16304e5a2592ec99"
+SRCREV_machine ?= "ca5b19aa3996eb1907f546fce7a7fa55053fbead"
 SRCREV_meta ?= "884dfea956ec6b166d1f99a295c47338573a974c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index e262722c5b..5ca45ad894 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "c78d0c7211350419b9262cb2c8b905dcb896c881"
-SRCREV_machine ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
+SRCREV_machine:qemuarm ?= "66b3eb63900447948655628e141b54ce0dc3a009"
+SRCREV_machine ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
 SRCREV_meta ?= "884dfea956ec6b166d1f99a295c47338573a974c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index 866c2b6d61..f1d353072c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "df81c53a3a7120e2be6600b5f6e14af4cbb99979"
-SRCREV_machine:qemuarm64 ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
-SRCREV_machine:qemumips ?= "d656d555d9237f41b1d8ccdbc994b41c6b4ae3b4"
-SRCREV_machine:qemuppc ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
-SRCREV_machine:qemuriscv64 ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
-SRCREV_machine:qemuriscv32 ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
-SRCREV_machine:qemux86 ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
-SRCREV_machine:qemux86-64 ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
-SRCREV_machine:qemumips64 ?= "56c290d3292823510eded4e3064b11fb1ea3e0ac"
-SRCREV_machine ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
+SRCREV_machine:qemuarm ?= "c3a887f62f231d6b31f0209712014f9cbc7fd77e"
+SRCREV_machine:qemuarm64 ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
+SRCREV_machine:qemumips ?= "77174bdf6581bdb93f0f458601364800670f8531"
+SRCREV_machine:qemuppc ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
+SRCREV_machine:qemuriscv64 ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
+SRCREV_machine:qemuriscv32 ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
+SRCREV_machine:qemux86 ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
+SRCREV_machine:qemux86-64 ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
+SRCREV_machine:qemumips64 ?= "e86c3a6ad2fde78ad03e0b899286bf603756207d"
+SRCREV_machine ?= "c4def465fc44a7f5311d9b942d6cdd33cb4804ca"
 SRCREV_meta ?= "884dfea956ec6b166d1f99a295c47338573a974c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


