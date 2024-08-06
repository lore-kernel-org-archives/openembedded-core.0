Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8F0C52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 18:56:13 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.15075.1722970566948444322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 11:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d7kEqTtT;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a1dcba8142so13979385a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 11:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722970566; x=1723575366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jZ8Ta3HoR7apGsJLypcyf6Cgj4Wbso8sZOFjQWVS8U=;
        b=d7kEqTtTP2KTlynPfWf4HdDvQngbWeYFke0JSB0XpO6xD3pfeGQrzULPwzW0J0g8gs
         Q0AXABaLu1I0rAIj5CBAXUy/DTjIjb/+vqlbbT17UXAn0HMxrlsKipADxtwBhjUGdsp6
         SMP23nbJnR0k6C8Quc28vSvoaY9lUF6ihFxwuqLzieLBdcNuBnwQA+qdtx6UFdw+crMT
         S7aLeEFZBi4Pkmq/bSaseff62CPvNDmVnH/yEzp/QOCxf3fLrBhid1yK4IhOy2ui1Wb6
         /5dLEMqYJU0IJqF/B5ODKXATVVUIUlb61OmCMT1Uomjc/xMQjeBYF86E7dh0HvvPpHGE
         QrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722970566; x=1723575366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jZ8Ta3HoR7apGsJLypcyf6Cgj4Wbso8sZOFjQWVS8U=;
        b=eG/v3EsheiLszowGEfW6Aw5gvczh3l2U3levXDtNXXszI0d0JFEY1dUoeturHghun/
         vqSzPqT7607mqD+oICfyy8W04D8FupUA75CrDP+zBIQNDBPe8NYuS9ynzXU+9c9ZJFfM
         I5GdxmvRb7fS7CXMnKkIZfVOheT9HOnVwxwc0u0Q76eGpxv62rtBRQg1oO2B0Fpar1C3
         4TZYECcwUo2r9OwB5dKz+dApCMeGosZIjZzKC2ZgJUJre07dQZSbeyx6/ABdVq6Ucbjl
         ssZqKMFKLnzhUIsmwcLGqRytAj3wRQfltAdLW/Oq0Yo3ZGY+IgcuuQp2JOldssxqMmlY
         TueQ==
X-Gm-Message-State: AOJu0YygYFHhqLLZrqgkGniZEThu26XwZmoHHuQCVsXMmPS6ayu+uyUv
	UZhQnEhcJ3bctxhHBFfF2ct7rsL+5GA7TVYdwNOLabaf6Xqq8v48
X-Google-Smtp-Source: AGHT+IFWD8zi1OJE9osKC65XCVpXUD9yKPQWTrxRQ+5vNAgKWWU3vkPnBrhU+fHaF6tQ0+NgLSNTZQ==
X-Received: by 2002:a05:620a:1711:b0:795:5c48:4271 with SMTP id af79cd13be357-7a34efde561mr3113151985a.25.1722970565759;
        Tue, 06 Aug 2024 11:56:05 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6ebcd3sm481988185a.42.2024.08.06.11.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 11:56:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] yocto-bsp: set temporary preferred version for genericarm64
Date: Tue,  6 Aug 2024 14:55:53 -0400
Message-Id: <37a605bf6a9c119bf9c2c0995be4b0b4e351d052.1722970092.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722970092.git.bruce.ashfield@gmail.com>
References: <cover.1722970092.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 18:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203046

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We want to introduce the 6.10 linux-yocto recipe, but genericarm64
hasn't been valided for it yet. As such, let's temporarily set the
preferred version to 6.6 so the builds don't break.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/conf/machine/genericarm64.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-yocto-bsp/conf/machine/genericarm64.conf b/meta-yocto-bsp/conf/machine/genericarm64.conf
index 1cb5e46dcf..8c1b09fdd5 100644
--- a/meta-yocto-bsp/conf/machine/genericarm64.conf
+++ b/meta-yocto-bsp/conf/machine/genericarm64.conf
@@ -12,6 +12,7 @@ MACHINE_FEATURES = "acpi alsa bluetooth efi keyboard pci qemu-usermode rtc scree
 
 KERNEL_IMAGETYPE = "Image"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?= "6.6%"
 
 # Install all the kernel modules into the rootfs
 MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
-- 
2.39.2


