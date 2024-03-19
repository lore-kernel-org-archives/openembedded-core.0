Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5FDCD11DC
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 23:01:48 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.30637.1710889306910836249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 16:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FlQYdwIF;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-789f5ce0b5bso216847285a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710889306; x=1711494106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kafR904n/RgfbY7tp0xhqB018ATR6YmkJzJYdd/yrI=;
        b=FlQYdwIFrfzstXqT1+9dcPkKl6o1sRp0lxrvPCcLa20aPQWaRog99gG0zL+JhwM24b
         q90JevFhWrwVF+2XUtTYJJ8WT5jvruBHMWqvmr2SG/MvWpGhkm/cyobpW0t7sm9FMvgJ
         AzqtslRAh/jXmKpPB29TjWxW7ClANnoEVfQBv0sne0IbyLEC53lh6xnTtXattnob4p/1
         BEmm8oiCZeMX93wMtuWXUrKVmRGVTm6HP3vVncQFrAU0NNX7RcvRBh8AR0c1DNnZ4Uz6
         2dlTqIuV8Zd5qVKk+jMBDXrrLtC/+7dJOp9rpUxlP4o+RJPUEUQ5lfH0TKerF3HWRoVG
         +Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710889306; x=1711494106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kafR904n/RgfbY7tp0xhqB018ATR6YmkJzJYdd/yrI=;
        b=Qj3G+ynIaDFPHkUxIx2k5DwnGOOm9YNmCSDKjWHJ5mEm+fJaxYVwgOwk9ohi17R7WH
         ZoADtS22KxNiRY/pjo72P3Q7b17UJ+folelR+GxabOlm6IiuXOB21yc1Z5ZH3BO36H0S
         zEU7vcP7Gfp8rBeJiefn8HF2SXBFDwOuH7WTrBP3GGEiAfe7vCVKUYZPzEbJV/4TCaWF
         7KTiQqFfnxYZbwu8e5P3jROKVbP+KmxYBi1OjSelq32Z47sLBBVs++R+/vC5sgNMsNIy
         MLZP/fC+uQpUimt67pDZvTjyAs6l/YavO06uRU4qWlrpyPPWhSyUbrA7fN1+wAY68d2z
         bvwQ==
X-Gm-Message-State: AOJu0YyBqTyd4vzm/Thcya0IhO/o8SrMotuzYsl1ys83Isa2YBYfyA10
	2Z/Gs07JTsv6M/UamRYZ0LEkP4i7eeJW/vJGMMY0LB1wnuYat/7Az4ZBWJoj
X-Google-Smtp-Source: AGHT+IH6YSXbgLwqyKAteYLvF2ZrxuXSDFUmYrjJAqpdy0bmDA+LOzzRe7IzAwEFNYbXnaYzLWo6Gg==
X-Received: by 2002:a0c:f64f:0:b0:696:2b08:e5a1 with SMTP id s15-20020a0cf64f000000b006962b08e5a1mr5329233qvm.3.1710889305927;
        Tue, 19 Mar 2024 16:01:45 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc28-20020a056214411c00b00690bfb6aac7sm7047065qvb.51.2024.03.19.16.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 16:01:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto/6.6: drm/tilcdc: Set preferred depth
Date: Tue, 19 Mar 2024 19:01:30 -0400
Message-Id: <bf11206a3a8abce0dfcda8da71fe571c6fe3bcaf.1710888915.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710888915.git.bruce.ashfield@gmail.com>
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 23:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197342

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Kevin Hao
    Email: haokexin@gmail.com
    Subject: drm/tilcdc: Set preferred depth
    Date: Tue, 19 Mar 2024 08:35:29 +0800

    The commit c91acda3a380 ("drm/gem: Check for valid formats") adds a
    check for valid pixel formats on drm_gem_fb_create(), but this breaks
    the X server on the beaglebone black board.

    We have set 'DefaultDepth' to 16 in our xorg.conf. In the X modesetting
    driver, the drmmode_get_default_bpp() is used to guess the default
    depth/bpp. First it tries to get them via DRM_CAP_DUMB_PREFERRED_DEPTH
    ioctl, and if it fail, then try to create a FB with 'depth = 24' and
    'bpp = 32' to check whether this depth/dpp is a valid combo. Before the
    kernel commit c91acda3a380, the FB always can be created successfully.
    This will avoid the bpp to be set to 24 forcibly. But after kernel
    commit c91acda3a380, the FB will not be created successfully due to the
    check of the valid pixel format. Then the bpp is set to 24, but the
    'depth = 16' and 'bpp = 24' combo is not a valid pixel format.

    Fix this issue by explicitly setting the preferred_depth in this driver.
    With this change, the modesetting driver would choose the correct
    depth/bpp combo based on our setting in xorg.conf.

    Fixes: c91acda3a380 ("drm/gem: Check for valid formats")
    Cc: stable@vger.kernel.org
    Signed-off-by: Kevin Hao <haokexin@gmail.com>
    Link: https://lore.kernel.org/r/20240317033918.535716-1-haokexin@gmail.com/
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 1298369d40..f22ee2bf21 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "689f65582b3d9a948903cde4e9c29e5fafd1bced"
+SRCREV_machine ?= "4b52adc4ca90b93e65eded97537f844bb3f86621"
 SRCREV_meta ?= "cc42f74d7d099826d46d3b310fda9c0c7bbb1477"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 82486defd7..4a129d157d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_machine ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
 SRCREV_meta ?= "cc42f74d7d099826d46d3b310fda9c0c7bbb1477"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 3409ce0c8a..e1e97ff702 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "09a926ab47d8072b7dc303cc8b99774abd792867"
-SRCREV_machine:qemuarm64 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
-SRCREV_machine:qemuloongarch64 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
-SRCREV_machine:qemumips ?= "b7fc266342fa1f6a304c54af0c8bc42b926bf1d8"
-SRCREV_machine:qemuppc ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
-SRCREV_machine:qemuriscv64 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
-SRCREV_machine:qemuriscv32 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
-SRCREV_machine:qemux86 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
-SRCREV_machine:qemux86-64 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
-SRCREV_machine:qemumips64 ?= "fe3df2eeb1cca6792c09e6a6530671533ce584e5"
-SRCREV_machine ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_machine:qemuarm ?= "f2dec0d9cb5fec1bd3f6def918c679d7f7a940b3"
+SRCREV_machine:qemuarm64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
+SRCREV_machine:qemuloongarch64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
+SRCREV_machine:qemumips ?= "805c2ac2a30fe9e61d9d58d19654fe29d43df922"
+SRCREV_machine:qemuppc ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
+SRCREV_machine:qemuriscv64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
+SRCREV_machine:qemuriscv32 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
+SRCREV_machine:qemux86 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
+SRCREV_machine:qemux86-64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
+SRCREV_machine:qemumips64 ?= "96d26749df27806f3f4b3e75993407846194b83f"
+SRCREV_machine ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
 SRCREV_meta ?= "cc42f74d7d099826d46d3b310fda9c0c7bbb1477"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


