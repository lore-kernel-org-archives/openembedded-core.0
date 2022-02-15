Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B32C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 14:57:20 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.10419.1644937039484343588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 06:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XoTvzMR5;
 spf=pass (domain: gmail.com, ip: 209.85.217.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id e13so1547290vsh.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2nh6xun7/iP858a6Lo38YrKLuVqfnczI9QJpaW+AM4c=;
        b=XoTvzMR5eGaBwySQp7jYPI+BtBTSkXoYXgjXp3A3+W5ek0eLGVxI7coSfEhXZwTnxC
         alDUKcV1qcx70s7l7u4o8oXtBJ8SIo+VShmSRScoLr8yeEJF9zdu+wJEr7L2nlpXQ3QL
         rqNkpwk4/iKCNO5xQEbiqwXWmJux7x3rXQAcgN1QssZsDSvKZGns/Pdz4z0te0dSrXc4
         W5jGmefltJTRez8LTRVIOvgJkmB7Ur5S4svpcYAAt+Nt471mDNoEb1+qQFZPB8LrMsPF
         5KVYap9Vx5HjmUxzW4B6Mf25Hsv6I2vZIx+RSdbT5OhO6hMVMeaHLS6GPm1wpC+JX80B
         Fl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2nh6xun7/iP858a6Lo38YrKLuVqfnczI9QJpaW+AM4c=;
        b=GEP0GUdHbMy59mkA1yAakqffr+AwaPTdVzI73FAwLpjPhkxGdpgyTMH2dGhjiHKAcz
         CcIj5hH6ef07kWtJWY47CEzHqWlLk9hhtoNr7pL/pET4qGlno8/Sjf7QrG7DO0PZMtjE
         RGWKLQGHlfBrGESNF3RL6BksAfpjsLNsHeaVQqm6wYYzTVvykPJJrxwx63jc019edYfK
         9pq54E9551c7KfRlb6hpqf+4scw2UzNoI5smsaxbfzRI1dbzqEH89k72Ln9DNpQuMbHv
         jHwBLNmt95BJPCgZd0FznKS17p46a+k5/TLs9g3u8zy4HoNfWwpLChwdNWRCvIJpqI43
         94Zg==
X-Gm-Message-State: AOAM530xtxpwHDE5VKz2BiYSSEIBqhgClEdYytbZdgU4KClnJDxdsyuG
	xvTt+VPLQq7kzuxGBPQeSng=
X-Google-Smtp-Source: 
 ABdhPJxMfaBPEWbEPjBv73ROInmGxpGMhC6hZ474uCEJ7+Qw0SaRTRp8QuThYz+us8K6ASfgJamBWA==
X-Received: by 2002:a67:e255:: with SMTP id w21mr1505885vse.44.1644937038419;
        Tue, 15 Feb 2022 06:57:18 -0800 (PST)
Received: from localhost.localdomain ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 e17sm6012167vsl.21.2022.02.15.06.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:57:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/5.10: fix dssall build error with binutils
 2.3.8
Date: Tue, 15 Feb 2022 09:57:15 -0500
Message-Id: <20220215145716.291405-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 14:57:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161751

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    c0b313d988a1 powerpc/mm: Switch obsolete dssall to .long

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 4315ef6fa3..8a8a7eabe9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c8061a9f265a0d314e5b780a651662f462e4b287"
-SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
+SRCREV_machine ?= "e5b266bc6b15dc8852649b7d2a31395195dc7b3a"
+SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index c968d404d0..bf7662eed3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "5e7b4957ac1a94fdaaa719f6b62b80856e8a55e6"
-SRCREV_machine ?= "24a50caea8c65c2af4987c60067dc55ef737ebca"
-SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
+SRCREV_machine:qemuarm ?= "9a8497a8761a22b3086cab63d18698024a69a410"
+SRCREV_machine ?= "317635e1feaecfd8aa29bc94d8d03ba873190414"
+SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index ae607d721b..ecb2d03949 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7f5de9bc153963749c9a566828b59d4e63796432"
-SRCREV_machine:qemuarm64 ?= "c5bed4d604e64e8ce795a28576e341a2e790b4de"
-SRCREV_machine:qemumips ?= "0361229f491eec312e503cf7e58931571e53503f"
-SRCREV_machine:qemuppc ?= "2d7e10b0e0bab9b364e7612caf81b318f1d28b27"
-SRCREV_machine:qemuriscv64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine:qemuriscv32 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine:qemux86 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine:qemux86-64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_machine:qemumips64 ?= "931424f9c84cc440e8f154465062e71e2bdc2f03"
-SRCREV_machine ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
-SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
+SRCREV_machine:qemuarm ?= "5c9de82973348b40bfdcecc0623f488d9443038e"
+SRCREV_machine:qemuarm64 ?= "8c841836837414c6d07fa08ef8482162760fc27a"
+SRCREV_machine:qemumips ?= "d8287fdfbe460acdd62cf57e351411c992101514"
+SRCREV_machine:qemuppc ?= "f436ec6dd3942a87331abf39805e791460e499ef"
+SRCREV_machine:qemuriscv64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine:qemuriscv32 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine:qemux86 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine:qemux86-64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_machine:qemumips64 ?= "ae7887fe8d4da06d2d0d0a5071d09155899de26c"
+SRCREV_machine ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
+SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.25.1


