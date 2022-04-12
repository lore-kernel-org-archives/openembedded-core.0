Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FB8C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:13 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web12.2090.1649799974713972455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UV4eDbKY;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id i26so8642105uap.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RO2WjUhRHMRLVF8G02gjOkAR4p+MYmzgLEs+C0n2bXU=;
        b=UV4eDbKYcRJEd9w/nWAwU6A2DcahZk8YC4jnbq0vi6zvBJAPckTzUYWXhAT3szSBcF
         HJDum39S6WgGF1vm/MDN7Nry0LtcsOsKPvwPHx3u2tikJGDyf0XWEa30B8Whe2/jJTk2
         9gTSZXpmaZeqANzd/MktZz15sKy2izaKZG9rUrbru+FBuTmMcrTBcRvbXiR285yZ1q47
         SdXjav7Bq+5qDxsD5wLN2O3Yum3n0Qr5fXE5l6mPe4PlZtC/I1zVvSAJurU4YI4vluJW
         4FabZFSwVfft3l0jlSv0hrp2yMDLxvusPk7NYKUBbn8xNB6R5ufBEBLHGUgyCzdDdyIU
         kgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RO2WjUhRHMRLVF8G02gjOkAR4p+MYmzgLEs+C0n2bXU=;
        b=1nnxlI70ZCQtV7itt2hdqBSh5g068jx/1lNE2cRWkND4ib4KpV4B/qEKGFk1ClxxKB
         JmXjRrHdgSXGih3g8xtXSE1n1mu4+ASNGKAgiMNe/2op49mJ81Ak4uazwD0ngowRPUEb
         79MKEu0JHHzP4zKkYDZ97w8sWoL+lCkPLfSKqoWDhBuzJBQkzDM/APmxfc+AsRzA9UHi
         F001aF9blQMENbkEe8aOILYlQiuSG0S6EuEiKv7w6YDvdosGWLT9Zzqm4CLjUrmo3jeJ
         V3TJs6sEgZMjbME5jMq06xYI1eb3xWjZL37CqArpAwsG1OKoe20tHfXd32MnihU3J1TT
         OmTQ==
X-Gm-Message-State: AOAM531JHIZ67EotAy4Y3O3q2sybgLZbvim9dYBOgcY7tSBwLZY0cBjp
	0a2lhwKAsoQObAg+nsuHN5uNYwkEoFJ36w==
X-Google-Smtp-Source: 
 ABdhPJy2EuhZxHNvXZK7azXffbFYco4iVpTEiTUYKGGiBfPXGR/fqxtpifKpFlc8ELkBwVBQtWC5JQ==
X-Received: by 2002:ab0:63d5:0:b0:35d:35a2:b3bb with SMTP id
 i21-20020ab063d5000000b0035d35a2b3bbmr2056111uap.26.1649799973609;
        Tue, 12 Apr 2022 14:46:13 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a9f3ece000000b0035d20c94b68sm1527638uaj.29.2022.04.12.14.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:46:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto/5.15: kasan: fix BUG: sleeping function
 called from invalid context
Date: Tue, 12 Apr 2022 17:46:01 -0400
Message-Id: 
 <6f123bf6f546b8975cdf59dcbbf51f5d54ef4d24.1649799823.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1649799823.git.bruce.ashfield@gmail.com>
References: <cover.1649799823.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164289

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h

Link: https://lkml.kernel.org/r/20210913112609.2651084-1-elver@google.com
Link: https://lkml.kernel.org/r/20210913112609.2651084-2-elver@google.com

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index dc9b5dd266..bba1200fe7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "21c75f01103d61c2382d334b3ffbfe99dda7e262"
+SRCREV_machine ?= "85ebb3e98ee184fad92eedd79f006df9809f01ff"
 SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 441a2e6334..66857e662b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "c817d3d0f654665fe3d5e56b62ea48d567bf3ab7"
-SRCREV_machine ?= "ea49628781d5a5e42616c73f0dbf2d02d533f29b"
+SRCREV_machine:qemuarm ?= "f9d5b63eeb0c699998551847edc5f1866efc650a"
+SRCREV_machine ?= "41f36834f2236bd22ab8c33ad1908da029bef79d"
 SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 6322e999e5..26a3059189 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "43ff86b464fcc7b5050a727052321c11aeae68ab"
-SRCREV_machine:qemuarm64 ?= "2f91a381a2c207975c082737b94f18e908e94243"
-SRCREV_machine:qemumips ?= "f2bb2fd873acd46e19acaafcd64b0f3e81afb979"
-SRCREV_machine:qemuppc ?= "2d8f15356671a566aac072dadbb9757046fc8acc"
-SRCREV_machine:qemuriscv64 ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
-SRCREV_machine:qemuriscv32 ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
-SRCREV_machine:qemux86 ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
-SRCREV_machine:qemux86-64 ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
-SRCREV_machine:qemumips64 ?= "6aa2697e458c5a67404566ddbb3027a48593a7bc"
-SRCREV_machine ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
+SRCREV_machine:qemuarm ?= "8f765250a60ba7a94935709d4d0f0edffd366990"
+SRCREV_machine:qemuarm64 ?= "35a6bda405ab207447b0e088b71fd8a9dab566e4"
+SRCREV_machine:qemumips ?= "d413054d21fe14e8111ee2396e07b4c15e0a2e77"
+SRCREV_machine:qemuppc ?= "33bdc98e5f267d7715cc1eb6d9c461616c05555b"
+SRCREV_machine:qemuriscv64 ?= "7ba4cb36fd4f3da81698b3e519e763aaa142659f"
+SRCREV_machine:qemuriscv32 ?= "7ba4cb36fd4f3da81698b3e519e763aaa142659f"
+SRCREV_machine:qemux86 ?= "7ba4cb36fd4f3da81698b3e519e763aaa142659f"
+SRCREV_machine:qemux86-64 ?= "7ba4cb36fd4f3da81698b3e519e763aaa142659f"
+SRCREV_machine:qemumips64 ?= "19d4c0deafc3b5359ab9af9d092a36feee0d891b"
+SRCREV_machine ?= "7ba4cb36fd4f3da81698b3e519e763aaa142659f"
 SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


