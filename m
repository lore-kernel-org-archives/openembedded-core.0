Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F24C433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:25 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.10801.1652193556682969304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XEtm8XBY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so2314091pjh.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kaTH+3gJb+SoStmewUvSkC7/cLHDHNRRnONJkTkeFbk=;
        b=XEtm8XBYWg4dpxp2blFf7qvYQ1Uny2+LC4jWA0Umb8QRfgHsZpio2y3YPI9/U9DysO
         XVQb9/aqh/WOpNfw26ExkCcv3/kO9+nwKFsVylAotcYoVH1ivFgeuOubj60QFUMKHTAB
         ev6GNPp5Gm7c3/KL/zZG9oOMC3Zr2ScZsEMWOuDLoWjSxQCieQIxGtbZx0O28aCfdL2P
         dY1noLtO51jIC2o03VWtpxY7XrZkQfvbjPuxKaPMmV7G9tdD7u3jAo7O19whl0kb1DYb
         7VRHw/t4OkBX9Ng5WVtayAySGcbxF0ABRnTiCNsRTkMtRwkq6QrXd7APdyGGpINVHJdv
         0B2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kaTH+3gJb+SoStmewUvSkC7/cLHDHNRRnONJkTkeFbk=;
        b=Rf7ySIAQuOaTAek5Rt3kBEwsDt17tPa24YR597KmnjnnwwsrJ0zfnaOpBQl5bB6IOl
         fjZ3EfkwJNxkIua/cCqOz9rtNvAorwlnNjQc8nzwjYxfzLnm0Q/CvUtZ//QTJFradjSu
         MIRgFeLQVLXMimcJGwUbQ/ggcTbV5c6pARowP32FD7anB7hgdvpbXdkrh4e7fqpwWimg
         MqClwIl6J62mYi5asaZmvUKJSiSvKD+ZQhOw6FMRyxdNriIQnpsF7OcQXZuP3/8+VvdL
         YSFmCAP7/Dsz8qlXkH/uK4WmcZoM3hStoFF3fQnmYHZ/k6JwCKFKjWORCSmjYwfM5VKg
         24IQ==
X-Gm-Message-State: AOAM531w1NPHTIjqQsTdI7DYFU/8nex8GVwZqp7JNdJTsT+uuHOOrj7K
	Q3hWD5wuIoO3qbEoQEuXvzRnswp7y0d1fxpl
X-Google-Smtp-Source: 
 ABdhPJyirI8wThp7wvek2L5B/0QdLmYO/7qBOyEj4JF5TAXRSNXp1x1wP0HPqK2jjIiIn6UvjTYoyg==
X-Received: by 2002:a17:902:e841:b0:15e:b10a:9f40 with SMTP id
 t1-20020a170902e84100b0015eb10a9f40mr20775039plg.128.1652193555235;
        Tue, 10 May 2022 07:39:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/40] linux-yocto/5.15: kasan: fix BUG: sleeping
 function called from invalid context
Date: Tue, 10 May 2022 04:36:56 -1000
Message-Id: 
 <65126f10d8483f7e8a41c66a2377687601c27e13.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165434

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a9075595074609c80af3530d4660b88ce0f76744)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

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
index 14279920ba..27373660c7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ea49628781d5a5e42616c73f0dbf2d02d533f29b"
+SRCREV_machine ?= "41f36834f2236bd22ab8c33ad1908da029bef79d"
 SRCREV_meta ?= "645b337371e7e080e71f7d7f2435326242451a95"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0ca177cc8b..62b16e4f9e 100644
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
2.25.1


