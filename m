Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E385C4332F
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:25:26 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web12.1639.1646443525993804685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jn5jegAE;
 spf=pass (domain: gmail.com, ip: 209.85.221.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id az23so303771vkb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oBgopRUjwrmiXXIOeGUU17uf/wXBcjTJHZv+7adLDd4=;
        b=jn5jegAELwA/aH+g6zDp7aCPzYIbmnW5llK8twcEb3RcMwJxadITXWqU0dHewQyj1Z
         wlsgcNsT3ValzfIfADVtlGksb72jj1kWK9UjAgXXV3RuiePPJpSr3eLpJGMAlfqRwQug
         wdlFMhOFQrr2v/lScLpsz/MudNrmlGu5wbpc0AA+YhRtVrNrbzcs7X4G/9Rsws1JmDqJ
         HyoF1wMl4Ph2Lrg6SKU+2f3Xf4/ZADcAioDScPHLjCeEIMrQ39lABz+Q6GAEXs+4mifq
         cS5grg+CtBwliCdDRh7NeBKFOI/A3SDf6vdLv56OxgorqiA/7dP/DqOpBwaBRqVQTCA+
         VYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oBgopRUjwrmiXXIOeGUU17uf/wXBcjTJHZv+7adLDd4=;
        b=3lx2Y/KDoSb8c1XL6xHqvZG1LUxpwje2dQf+hDHlghPvk5Q5rOw8oucGtMODuqYn4/
         Jhd896BK7IjX/7c02GghVO3MErck9WT60BvBNVQIxygvUngXO3OBn1liOR46biOFG6Sf
         uAxApDjyoSNMXvGajPfWTOgIencSjlic8g6oMXtLw5OvYVdpX2vB9YgrcPJObqmI3cBM
         KYtEQnI4kmU07EYelBMu7VMcZZWJnWSCWV9lO8muQXcG6eywKtZ8y2PG+t+taghCswR/
         ZlXqIA9d7PhRChO/YuzuEc1nIwrkBP7BgBTv5wcp/C+ky3BK2v69aFNq3U+tFCsQGB3L
         woXQ==
X-Gm-Message-State: AOAM531RSk/W4FEsaiQgFtVgUb/uAMKHklvu/Qerv42pN7VGzM8FzQUg
	8O2XJkHxgy0mR9obiDm/86ZW0fYwozXr3A==
X-Google-Smtp-Source: 
 ABdhPJzUU9WNWnBferAhQh7cQRDRRwiKCvG06eAZDAeLeDiVZ8Ba1Z3YdUHCE90DnzLbTHZD4uPHdg==
X-Received: by 2002:a1f:5ec8:0:b0:336:effd:f1d1 with SMTP id
 s191-20020a1f5ec8000000b00336effdf1d1mr537882vkb.40.1646443525100;
        Fri, 04 Mar 2022 17:25:25 -0800 (PST)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q9-20020ab02649000000b0034a4433fe82sm1053934uao.36.2022.03.04.17.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:25:24 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] linux-yocto/5.10: Fix ramoops/ftrace
Date: Fri,  4 Mar 2022 20:25:13 -0500
Message-Id: 
 <b289238a0a5ad5482ef60e6174c6d9dba68b7a48.1646443420.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1646443420.git.bruce.ashfield@gmail.com>
References: <cover.1646443420.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 01:25:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162770

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    253c752ed120 pstore/ftrace: Add and use ftrace_test_recursion_trylock_safe
    356e8a12bd66 pstore/ftrace: Add recursion protection to the ftrace callback
    334706a1e873 ftrace: Add ftrace_test_recursion_trylock() helper function
    78c260d7f60b ftrace: Move the recursion testing into global headers

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ec4dea033c..d9e91856ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5c627c3d0740ef68beef456aaf7ef104315a8f7f"
-SRCREV_meta ?= "ff60a2ddb31e54be0f8ac63a28247e58f9c8cd23"
+SRCREV_machine ?= "b8dfdbe4d5a7b790bd2ecdb2889846e036469d25"
+SRCREV_meta ?= "f323785b54712f92ad8cae06e2711a01d66d4fdf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 3414c55740..dbc0a6e90d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "ce4e423e88244adab0deef2f9d021b2bf6d492ba"
-SRCREV_machine ?= "cc09c000260f49e35e85a96853dd01404e6aa80a"
-SRCREV_meta ?= "ff60a2ddb31e54be0f8ac63a28247e58f9c8cd23"
+SRCREV_machine:qemuarm ?= "e6fb3720c9823cc706e8c6441cfd382b52bf7ae5"
+SRCREV_machine ?= "57631093be11dd9606bbe8916b9f35bc9b6fe130"
+SRCREV_meta ?= "f323785b54712f92ad8cae06e2711a01d66d4fdf"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 0437274009..bbca0ffed5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "54d10cbfb44b9449f3962d962c6ec0d2e31017e8"
-SRCREV_machine:qemuarm64 ?= "1048394a0538b9b282c1f36f4de7e4ab814c90bf"
-SRCREV_machine:qemumips ?= "0214a416a56f01fed65e4b7818470139dc2b1286"
-SRCREV_machine:qemuppc ?= "b678c6d8d47e6e67aefa985fea85fe3026f2c809"
-SRCREV_machine:qemuriscv64 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
-SRCREV_machine:qemuriscv32 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
-SRCREV_machine:qemux86 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
-SRCREV_machine:qemux86-64 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
-SRCREV_machine:qemumips64 ?= "8d571427e05d1a8c7f7b0d32f291941429865ada"
-SRCREV_machine ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
-SRCREV_meta ?= "ff60a2ddb31e54be0f8ac63a28247e58f9c8cd23"
+SRCREV_machine:qemuarm ?= "778c2d4c9a4798b90ed3b5609ccbc2fa8b785778"
+SRCREV_machine:qemuarm64 ?= "6c6e9a984aa0a6bb2a11528c27023c588064422d"
+SRCREV_machine:qemumips ?= "3bcde31e0d5e48a2fd21f7d6300a7b5d625e5760"
+SRCREV_machine:qemuppc ?= "20fb5e330325ade20c8c3c2de7a64d9994298af6"
+SRCREV_machine:qemuriscv64 ?= "253c752ed120276124a8463d996b30af0db6f547"
+SRCREV_machine:qemuriscv32 ?= "253c752ed120276124a8463d996b30af0db6f547"
+SRCREV_machine:qemux86 ?= "253c752ed120276124a8463d996b30af0db6f547"
+SRCREV_machine:qemux86-64 ?= "253c752ed120276124a8463d996b30af0db6f547"
+SRCREV_machine:qemumips64 ?= "89e951f3655bd59f7564bd09c106186833702f12"
+SRCREV_machine ?= "253c752ed120276124a8463d996b30af0db6f547"
+SRCREV_meta ?= "f323785b54712f92ad8cae06e2711a01d66d4fdf"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.19.1


