Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DFACD11DB
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 23:01:48 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.30631.1710889298395738771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 16:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+5b1bGu;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6962e6fbf60so14462916d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710889297; x=1711494097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qY/L0Piq1/2xVGlG3wGVCDhnDdt7nX91YdjydhwNHfk=;
        b=U+5b1bGuejhIod1navNrLxPzwJC5IGs9qYx/evV7Ju1J4wWr73fsP/WXNjjDT4C9oX
         1R1VUU7KNHOozkykdgD9gSXb7fZ0xaz2duUwcr9VE/3c1ZnPiaOdKG2ofJ5UWMr8+neY
         CS0jjtVDGc7sDdRfisM05h5MYmxwXbf+0ME78IxITkX4ZEg4z9sFtbL8DYOCyg9xq3vY
         x3tLXdo5wCDcE7T/WuMRwLN5vCVJLspQ9Rdwu1yt9odihn4WWTJtKXk7H/6jWj8U0SG+
         5LDcc3e78k5VxfHERCJyv/5YLa5xKdyioJwqzp09NGYJEHfS+yTotAiLg9t+ZNcIrekK
         d94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710889297; x=1711494097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qY/L0Piq1/2xVGlG3wGVCDhnDdt7nX91YdjydhwNHfk=;
        b=TmgBXCQJn9hgIsqHSGGV9Bz/y83W4qsg6d4FwT5LDoCtcoT/NCGRDdRCgkxrmAHGl7
         ojnhWdU0QKPLpWt7KxXwKphONsD9buuTIsXGpokZDqFKDhTrfjLXXGtlMq+XK5PPL2RV
         r6O9JX3WSFWPpBTOfSUT1AGM93ajypu9o7UbQhMB25LHmoVoPJxV8U7/hroQ6E6QimDJ
         EUUWHafsVrZcxKB1sH5TP4fLYaqNRay4xR/jH8ik1XAGP4964TFu3uMdYC8jvYgOD+Jl
         fbF76FJuQIAIkkOBaMP5f2NqSGOBnBNSEK+U3A6IHX+X3VJCKq7XEB6qHE732ALY3UB7
         iO2A==
X-Gm-Message-State: AOJu0YyuGxfCUZniocGxKfgKgbYClgYXnGOcqEeXXNcWaQ/ruAGJ9kSp
	B2wO4MZdHm6Nnu6ZcW/DQeTqo7y/d9eh73yx6rMdeHLhtzWQ7/ji0txu6R1b
X-Google-Smtp-Source: AGHT+IGZlOR3/kFxliN1s6MbOQY+PR+A+H4oBHjmFUUq615h1DYWhHN0XBw1AbXPX41Nd2qPEGSbdA==
X-Received: by 2002:a05:6214:c68:b0:696:1c3b:ecf3 with SMTP id t8-20020a0562140c6800b006961c3becf3mr9444839qvj.7.1710889297357;
        Tue, 19 Mar 2024 16:01:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc28-20020a056214411c00b00690bfb6aac7sm7047065qvb.51.2024.03.19.16.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 16:01:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/6.6: cfg: riscv XHCI
Date: Tue, 19 Mar 2024 19:01:25 -0400
Message-Id: <256057efd94b6d4ddd95ef77aadf4c37a453dcde.1710888915.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710888915.git.bruce.ashfield@gmail.com>
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 23:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197337

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Khem Raj
    Email: raj.khem@gmail.com
    Subject: riscv: Enable XHCI usb
    Date: Thu, 7 Mar 2024 08:04:18 -0800

    This brings it closer to other qemu configs in yocto and help to use usb
    mouse and keyboard device emulation

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 347c94d31c..fe5d70dea1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "7c5911ab2e70bf84bb38a598b2a7e094618a9620"
-SRCREV_meta ?= "59167507fd955d22a51ddc0011bc75d35e8f702f"
+SRCREV_meta ?= "d2cf51efb880ea1f34f4beaee487edf572e9adc3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 6c74e6d072..417cd16828 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_meta ?= "59167507fd955d22a51ddc0011bc75d35e8f702f"
+SRCREV_meta ?= "d2cf51efb880ea1f34f4beaee487edf572e9adc3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2017c0c9c1..13b8b97619 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
 SRCREV_machine:qemux86-64 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
 SRCREV_machine:qemumips64 ?= "8e7605bafdfeb842396292181d524b183a1e13d6"
 SRCREV_machine ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_meta ?= "59167507fd955d22a51ddc0011bc75d35e8f702f"
+SRCREV_meta ?= "d2cf51efb880ea1f34f4beaee487edf572e9adc3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


