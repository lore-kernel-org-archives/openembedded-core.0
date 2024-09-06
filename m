Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511A3E6FE41
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 17:45:57 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.5141.1725644750828371756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 10:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KgumELhO;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7a802deea39so154209585a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 10:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725644750; x=1726249550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8c4Z7Ln5Y6vgihhlSwQ0omu2bsC7U4h2jS7ktZUR3wc=;
        b=KgumELhOQW2voG7/iH/bNCDFOaZ9KVAILYA6ktwLnXAAxyjp3mlSQXZx6mxjjoZlG4
         vqBJ2GjMyN7p9XHYnHylzUKidQiu+uK45vksBYnkU4B8nZ2fibGmbtyAUxVyKUToDpiI
         u0lphFUrMgY5u2DXJA7tDZGzQHzhg40Q/8WWF5YlPtZu6nDi3G30dW4iRc5T9knMHDpw
         0LdUtB3/YkOebSnkSKwsBlPIuA3ZFD3jwTKI9chUwxGnAX437hHN/oY3gmUALcp/PI1p
         7918NeZbA0F5vd0OJ6/sPvVwCrQCQKS6M6JJKBHI6nKKEjG4JDC1R267y9qvojrHiBLK
         Vl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644750; x=1726249550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8c4Z7Ln5Y6vgihhlSwQ0omu2bsC7U4h2jS7ktZUR3wc=;
        b=kGF3ogwh3epmVrDwNnXTHYcie89Y+RmMHLtBSGnkM0x+EgaimeM7dRuTx6HW5hvZnK
         RnrkinZBbcfhCZC+xf208mH0IIUc4V7gTsyTRdrA18WKhu9VEjnx0Ix9oP9mt9dRtzI7
         LWo2NxH7Sp7ekz9t+tw0+yE+wIKOFpoB/PUhU7ABzziKGC5xSa4kDeQoTubKdmLWmQly
         iejbgcOoKDb1q5oGl3wQxrDXS/mnnK8e21VCb6hau/LUzK2djQq9F4ejlkzR/lQkbBeV
         Yv8a1728k5eErMYSH0PlbUkCFD2lVyk+3PF4iezVKntJ00PTUTheChlEsune+Kef6O1l
         Kkiw==
X-Gm-Message-State: AOJu0YzJhRqWlOAbbfWvuH6a1vKKhtpSHL+L7ImUxuD5bvGvnGw5Mxhb
	c1TivPlIhECmwNGLU/ANOHvsoEClNKzaYFBjgZjjNV+vDclfVMUoKev8bA==
X-Google-Smtp-Source: AGHT+IEpWbDZwQ4W3pjLl3w6dykumRqDM2Ji1AKD/B79/5tIwHznWIpcDZAoGCny5c7iHJS3cUqPpQ==
X-Received: by 2002:a05:620a:240e:b0:7a1:dcc6:fbc2 with SMTP id af79cd13be357-7a8041bb548mr2858532885a.24.1725644749728;
        Fri, 06 Sep 2024 10:45:49 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98efea9c1sm188589385a.75.2024.09.06.10.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:45:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/6.10: fix CONFIG_PWM_SYSFS config warning
Date: Fri,  6 Sep 2024 13:45:41 -0400
Message-Id: <addda60399e8fa58e8836199cd2111b0e7a6212c.1725644584.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725644584.git.bruce.ashfield@gmail.com>
References: <cover.1725644584.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 17:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204283

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Yogesh Tyagi
    Email: yogesh.tyagi@intel.com
    Subject: bsp : remove sysfs configs for pwm class
    Date: Fri, 23 Aug 2024 12:54:56 +0530

    Following commit removed the CONFIG_PWM_SYSFS from linux kernel:

    https://github.com/torvalds/linux/commit/e9cc807f87ffd1ccc919731e8f624982935af3e0

    Having these configs is causing below warning during linux-yocto-6.10 kernel build:

    WARNING: linux-yocto-6.10.3+git-r0 do_kernel_configcheck: [kernel config]: This BSP contains fragments with warnings:

    [INFO]: the following symbols were not found in the active configuration:
         - CONFIG_PWM_SYSFS

    This changes is needed in 6.10 as well as master branch

    Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index 0c0620469e..c217ab779b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "c0094e55e84db839eb3624a2f99d826dd3cbb3e3"
-SRCREV_meta ?= "5161bedbdc3ff6f22a75fb5afb96a4077f4b4ab0"
+SRCREV_meta ?= "e4d2ade39f231ea279f19298c008ba48f4a202e5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index deb19c3dc8..f7993bbf15 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_meta ?= "5161bedbdc3ff6f22a75fb5afb96a4077f4b4ab0"
+SRCREV_meta ?= "e4d2ade39f231ea279f19298c008ba48f4a202e5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index c0b1b0b6cc..fb3c244a94 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
 SRCREV_machine:qemux86-64 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
 SRCREV_machine:qemumips64 ?= "c1f8e21e4999d233df12ee60c7a47cad144e7344"
 SRCREV_machine ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_meta ?= "5161bedbdc3ff6f22a75fb5afb96a4077f4b4ab0"
+SRCREV_meta ?= "e4d2ade39f231ea279f19298c008ba48f4a202e5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


