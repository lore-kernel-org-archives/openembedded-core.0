Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB89BC43219
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:17 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.10684.1651153692942568067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FmYtcBtr;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id s4so3629922qkh.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J+j0AgQmVTTXhzcUmGWabc7U+K5cB7YCOqXodxlcd1o=;
        b=FmYtcBtr2Vqk/ikGdLKPv+7uSXjC1hE7NbF4elCT7Rq4Cgc6IMv2mizbsulLcQejKk
         5nLeYYeOi5lzIchYlbCHVHlVC2ksnGKv/9hyf05ddlV2fjVg5ywYvfCmPb+w/K7bOYoc
         Rt+EfXSZ1rRM3W59AFdwVkNaSl4GXGTNxgwhVc0ZNR0JbTdZRaQsoDs5AduvDegMeZFs
         B2H7w1DdrVdCChWH6DHrhP+4/nA6iQ7fI7bcNRnG58J/+buOh8NfZiMQwJEx63ojZaHg
         xwNiVXNTGq49MrMynED4gJ8vyegYx+0P6nRHeXcZCeNYP2xCBTeADyDyJq49mo37fIhN
         SNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J+j0AgQmVTTXhzcUmGWabc7U+K5cB7YCOqXodxlcd1o=;
        b=SdNHrxMrBKaFjgtnPDKlk9uPAyy3XbXMFApx9LGnaLHXou4g6hl1Tm91+ozI+4OHhX
         PXEUQKQ+eYcGiaWXI5UtUIz8eWv82VP0+JSJ8GAN+d/SDBiu+yUurggv8nHXl2BCaOdE
         Lqy37EODk2mRh6IMsY+lvxXVIHd/of6OnXuW7JhaXDalJ+oC35qgGtvjvS/MDzMiHb6c
         Mx12FYKbltyOK+UUGPsvVEBb9Dy35vf9RJq6wzWzosFloDs5SWX/fqgvO0eHPHZyrGkS
         KoJ6meB4cGfOAln6xZ4wLGRYhtOVHqeL+z0jHpfFHjL4RZQLZyEevcfCx3ZahJmKPnKi
         gfbQ==
X-Gm-Message-State: AOAM531QeaHY2Zo65MI8jPsc0AeCYarkMmUta2FLipnzUJ0epRmaDDlk
	7nhBiOgZrrFs/cRkCkZwH8o=
X-Google-Smtp-Source: 
 ABdhPJwBvocdzYHgZ9UP/T3dLmu5otBEr6tiGJFJJUIGGTABxDUKseJcgUpUYGqY1HbMDFBj86ZwDw==
X-Received: by 2002:a37:ef0f:0:b0:69f:9630:1915 with SMTP id
 j15-20020a37ef0f000000b0069f96301915mr4173175qkk.159.1651153691965;
        Thu, 28 Apr 2022 06:48:11 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 06/15] linux-yocto/5.15: kasan: fix BUG: sleeping function
 called from invalid context
Date: Thu, 28 Apr 2022 09:47:52 -0400
Message-Id: 
 <4c3161de10c91458f44b89786975220c3b04a203.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164954

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
2.19.1


