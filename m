Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE868C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:02:10 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.18810.1738252921026176860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YEPAyyT+;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7be3f230436so89486785a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738252920; x=1738857720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOCspCJLENXg2CbPgbcWlC1N95UlCbM8Y6Q5nwlwlsM=;
        b=YEPAyyT+aYzfXfoCvMeJ5Vkr/MJaO8eC37miQkZ35Y7xqCcd8Vs3PiMR/ZzXKWN0ai
         AosAg7z2jRCbFsQfkE8AIOo6mrcwtm88VKj4421Ui2CwrUOrFGzH8iS/hzuwpx+WEGM3
         +F2p43ZC4VN6o7KNrP6AqfbOvmGUfG0Kuhk+yv5s46Qrsx0OrlT07lah8eRqXqY5Uh7x
         asM99tJpiISNVZLc96C69l1lBno++Menw6HUDIt4eUPLahllYsHQxhzsuErbZ+RCGp6L
         ZOvWwuSl5vhrZ5cP8XPKvr4O+RQKLx2WxHJNVFglguyz3rSXuk4d7btIbc6dEzC0VB8j
         +S5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252920; x=1738857720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOCspCJLENXg2CbPgbcWlC1N95UlCbM8Y6Q5nwlwlsM=;
        b=QY0R1EtCa6ocibKt7JPKobgj5dJu41TWxTR+cXzp3uwg/pXdT9PK9omwtvUuf+wCzZ
         PoOmlw4FVt/0puB8vm1jFE7Lj/QLepo7PozEaCmqORJDNxIdycBvetEyS9JvzrS9q7Uv
         nRaepvOvmwoid3eELSa/3LaTdPArx6sdm7n9+d5dIJ3p9rk755F75AL9htOU6eRrUp0y
         tq0J3xpif0yyU8i9Taa3vVx9leUOkxqc/RdxdYiy4Yyn8wQLAE9YFX8Ne7p4dubTD6yC
         tRkAe3BkT3ui77C9LERHKeFqY4TBVAD8HvfDIAEvtO2a4dFv3HLeKEdXOqBoMw5lLgYq
         rfig==
X-Gm-Message-State: AOJu0YzOErX4nfDIqE6WXel+XstQR7edQVMcjtyBx8ZBBaEYAYXTBArK
	qRPbPuU4yI+Lg7RLk7nFpDpqA6TMSJPyiWsZEBCzaeyYqxsCke3P
X-Gm-Gg: ASbGncvCd1pJ9zvdW3xCDJOBkawr+b+7hZSgH/tb/5gYum42yzUBTY3+Eh2spJLkXqd
	dlWmuSXhdRC0eGEsE/EnDbFEyzbleIrCImbC/QLQ6cgACpOXmspiEbyJsX1ujGC5S74RKqfCBqC
	u079+7Ao0JDrMmZ5kadnisZWc+EK668QQMbw975qqRqouk4BuWvk6ZSTTYqbH+gSDiJ3Ku2gGSy
	ZAcYLfBfkrXJySM7hBwFm59uY+22QBVDW2C23DWzNbcX63aDmaaIsjLoT2uAmiEkMMAWTXJlVdl
	auypIpC2CoWgYIIgieNAkCo6lQDEothfCN37E6G0CCRN4yrWonvKM21AzDCANcDYRZILjkOTBld
	RmA8is7GJMQy+37jY
X-Google-Smtp-Source: AGHT+IHUxkWYxGLOIOkfWrFHh/OH9aE+zR+1QZbQ1q5woQRRWIfyVNqrclnyk2suoGGDbLVYVhK1Jw==
X-Received: by 2002:a05:620a:6228:b0:7c0:a2:e689 with SMTP id af79cd13be357-7c000a2e939mr751757085a.31.1738252919765;
        Thu, 30 Jan 2025 08:01:59 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d3c4sm86086285a.111.2025.01.30.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:01:59 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yoto/6.12: skylake drop CONFIG_SND_SOC_INTEL_SKL_RT286_MACH
Date: Thu, 30 Jan 2025 11:01:50 -0500
Message-Id: <6f7e6c769ab80906793fb89714be4b787e1ab467.1738252521.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1738252521.git.bruce.ashfield@gmail.com>
References: <cover.1738252521.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210456

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Yogesh Tyagi
    Email: yogesh.tyagi@intel.com
    Subject: features/soc/skylake: drop CONFIG_SND_SOC_INTEL_SKL_RT286_MACH
    Date: Fri, 17 Jan 2025 23:54:27 +0530

    skl_rt286 board driver has been removed[1], if turn on this config, kernel would report a warning.

    [INFO]: the following symbols were not found in the active configuration:
         - CONFIG_SND_SOC_INTEL_SKL_RT286_MACH

    [1] https://git.yoctoproject.org/linux-yocto/commit/?id=51d8e9b2

    Kernel's 6.12+ needs this change.

    Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 044c956b4a..85874b74a9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "259cb3adc1a277c386c512449cad948e0f5420f0"
-SRCREV_meta ?= "8acbf9e961463a60949e0ead93260daa6b3361c6"
+SRCREV_meta ?= "538531267a60a7b5b7fcbccd659276d20f480677"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index b930f92863..1fe8a93339 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_meta ?= "8acbf9e961463a60949e0ead93260daa6b3361c6"
+SRCREV_meta ?= "538531267a60a7b5b7fcbccd659276d20f480677"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 7d5a7afbf4..1c1e8aedfc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
 SRCREV_machine:qemux86-64 ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
 SRCREV_machine:qemumips64 ?= "ef7cfae37a97b3c61f9127abcfe1307fdd56ec50"
 SRCREV_machine ?= "4878dc2a6770f4ee8d47051e44dd43102e98a0ff"
-SRCREV_meta ?= "8acbf9e961463a60949e0ead93260daa6b3361c6"
+SRCREV_meta ?= "538531267a60a7b5b7fcbccd659276d20f480677"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


