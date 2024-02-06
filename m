Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F342BC4829F
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 20:53:45 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.4386.1707252820137693191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 12:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I81Y2+oG;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-783def87c8cso352735885a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707252819; x=1707857619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Giu77TqO0i55ZWKeN2MnIBnF2SlUV4aInqs+FLbcWok=;
        b=I81Y2+oG9ZbaoEKSa1mhQafMQS00Br9I1LClj7WHKwjjnTRx30/lLr1krJYoWgARvG
         +ebj32k5V03ITe67hO+/YrDsx/BbpLl1/jtK1FswmCKn9OJnUNV32WqF+WM9E+iMQ0h+
         /FzObcWWzv6FrfTuonotV5rrGlAKOWqYT4CCdgPny73JLFFsFGWtl12CWN/b84vuZoEa
         G+JtAfK8344EB8gN+wYwCNuLEMKGJ322Z5NaBT79vaynwyTqpJgmLXu222pQAkNaGaqJ
         IJEd5Z6CZXK9xfZ3I3VKm7jGAprN7K6ZmciBi5ulGBwm2Zt/WPfT8bejY6+wO2tipBXL
         A3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707252819; x=1707857619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Giu77TqO0i55ZWKeN2MnIBnF2SlUV4aInqs+FLbcWok=;
        b=YqHCtuwLMDkC3E6kfezqLqoPkUKlxnBuw5HnUIVkl8u9QW5jVprUfiHUxKHLNiFU6f
         RTpd8Z7qlXrTgZcrkcmLN0nrY8BmIpjQXRfu7ASQcaKNlO6CJftKnPMjb08dB5MAmVsc
         oaHxICv+Mj5YFyx3jOx+Jvt6tTbROP4JfKlrmbfPjZdQsGNjZzT47ZrsXu/REtYMmLKe
         0/4Ki9/btiTfENTKP3mq67bHuwOtilj3Tno+dYSNe+JnovVOqymiau+qQyvGETakEkJi
         Ha4fg2BdFlSfY2R5kQx0euaWBDRAI43mVfEKh0SQn5KnreWb4V4SI2ljQenVFZQ1RLOb
         LcXA==
X-Gm-Message-State: AOJu0Yx8OsYNqsrkehbsS4maGbhtRxzVjKyKxSYxcX9uoV0GEGM6P+it
	0UElrIPJCXWojTF5QFXKSfPO5nopidezCzbAzCDvgCMnZCSbMOl389abGbUdQJlDmA==
X-Google-Smtp-Source: AGHT+IFDGGF72U0u+VA6/q5kAzCMCP68WcsR1SsNgkjRUO8CMutUbQ+AGO/OXMd216R7hf86FsRmmQ==
X-Received: by 2002:ae9:e314:0:b0:785:9715:100a with SMTP id v20-20020ae9e314000000b007859715100amr1343474qkf.39.1707252819066;
        Tue, 06 Feb 2024 12:53:39 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a0e0d00b00783de6b5ccfsm1253506qkm.88.2024.02.06.12.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:53:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/6.6: beaglebone: drop nonassignable kernel options
Date: Tue,  6 Feb 2024 15:53:29 -0500
Message-Id: <a9a2e468952009629ca70d9a93d1e6c703d660d4.1707252636.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1707252636.git.bruce.ashfield@gmail.com>
References: <cover.1707252636.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 20:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195028

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Kevin Hao
    Email: kexin.hao@windriver.com
    Subject: beaglebone: Drop the nonassignable kernel options
    Date: Sat, 20 Jan 2024 20:19:20 +0800

    These kernel options aren't assignable. In the previous version of the
    kernel, these options were selected by DRM_FBDEV_EMULATION. But due to
    the commit 43049f17b526 ("drm/i915: Implement dedicated fbdev I/O
    helpers") in the new version of kernel, they are no longer enabled
    by DRM_FBDEV_EMULATION. Then the kernel config check emits unmatch
    warning for them. Drop all of them to fix these warnings.

    Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 25ff894ef2..22a93880fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "59ee8cb752a7e280cfe2d480964aa5b6c74e4203"
-SRCREV_meta ?= "80606e5b79499427524c82e4965de27e1f57c61c"
+SRCREV_meta ?= "cdacaee0449386523770415ceeded76585064265"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index b530990f20..66199674a6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_meta ?= "80606e5b79499427524c82e4965de27e1f57c61c"
+SRCREV_meta ?= "cdacaee0449386523770415ceeded76585064265"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index ed722f2f80..ce9169ac76 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
 SRCREV_machine:qemux86-64 ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
 SRCREV_machine:qemumips64 ?= "d41c8b84fcfcb4c2dd8eb856172cdc2b6a1bd342"
 SRCREV_machine ?= "195b2994f955071be3dd16ff61127dbc6b2e0069"
-SRCREV_meta ?= "80606e5b79499427524c82e4965de27e1f57c61c"
+SRCREV_meta ?= "cdacaee0449386523770415ceeded76585064265"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


