Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1215CA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 02:47:08 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.6244.1756262821169700253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 19:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d9pOzohX;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e8704b7a3dso673212385a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 19:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756262820; x=1756867620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOBaXj9suu3Dmd9g1eK9MijwwOP/wMy3vR7JYe9GHUM=;
        b=d9pOzohX4Bx8EPH30d/EkxvZfUHQX+PhHibjesk6lJsebPD3l4ZUoCVMEBJJBh+pji
         DEaVGdhjjkd1hXjyA/ZQmRvxbKnMcsS/1dPs8YKA5dclsNNW3vKElT+NuGHDhe0ofbwl
         FQgXVMqTy4N35Ns/7tX/A4TsiDw+6BsSOy65EC5RApDa+VQqVxYQ60Oio27ZspXKGfXs
         E0vTlmxwhqD1jhQgt/Xw7a3P8S5kJGJHch1K0+vAc5wMaZ0+gz0DZ0YADFISbCsJv3MG
         cSySbVYdOSBPxAr0EEOMQfeNXQZwTa6EfZ890gcPwpd82IydLaRbAyW6IMPm0YiD2Vno
         3KCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756262820; x=1756867620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOBaXj9suu3Dmd9g1eK9MijwwOP/wMy3vR7JYe9GHUM=;
        b=peA6V+FwObqyuKJ8oZ56fIAz7GyLAfV7QT6JWiq9HoQP7gcMVcCiAX2BImaPkXuHx/
         ZHYThr3lOTaOOHAGii+LTFVMM8FbYd2W1iacioO7rrUCbasaRRQfzyaDSg1WmjpH61e+
         TbcEXkRVORmCHp9wvsed+LE3zsxNnPoTtoZJAobyg5Pjuk2PZMcwqiJl7HINSwqXMEr8
         KB89C6OGali5uy/BHQ+Gqe8IXALuoeVDdXLR7KxP9urQwSoH6LKb/iGSDWS+Y7OxubGH
         ADPcGRGoODORiYRiuQOPIpcNFOy4whtGzQBfiVOggQqT1+Q00AHhsThFRcz6k49+aSmb
         rtUg==
X-Gm-Message-State: AOJu0YyS94cNqEfjaGu+bQd7k50LDM12hVFb8cle8SHMuBBVW3J5Avno
	LR+NaRKa2byVv2x3IwU+grTPNywFYnTO0+Jrqsir8FzCts6CwXGiZyTRP6N/5pFV
X-Gm-Gg: ASbGncsc2IegIhwwQPd3HJ3htwNYzdeJ3MYyDOn5fW6Hr5TYTBw1Y7QHPHxOztXKhYM
	ZlSGtS8OARux6WBdr4uzAwYEdrB+3qRuRGpvDz8uB20F/pi/8zjL/fjcZnWLeGbCKyrLoAMC5p/
	84QHqQGOAYmXwXcmxoDaxd2upYYyq/Yo1EC34XpNeJEbCoCNBotbmfX4ZzLM3EVMWZflbxlFX3E
	AAhFt4LCkqC+hTUynEFEwZrESDv9hpyNlZWhDYvY20qu2GDatIZrX2SO6wRKRwutkXgBurOzGNM
	RJyeyaenFXIfz/HDsTL3pxkgaNYZPY74LbkL/dvwzWGzetLnJ+gVjVnw9389nJaxrnAdP9coq7C
	73Kh6cViOpNIPumfl3fg2NguhVEHjvo4eV8Z7j+jsAC2sM7PpWmUIB4nqQ9p5ohtieA7HVIxrCr
	pxEmEpdQmNjA2DNCeXSKrwOz2Xyh1WpuFrTvFtFSms2CB0tWNbED7imP5TH/a1+53R7g==
X-Google-Smtp-Source: AGHT+IFnoSx+Gi3ubgC6LtLo+e9PB8rvpHJBVr2fHobRRZc0WW/pCofVLZegufy0O5ZVoxVO1B6yKg==
X-Received: by 2002:a05:620a:294b:b0:7f2:d9d3:f5ae with SMTP id af79cd13be357-7f2d9d3fa53mr843027285a.85.1756262819996;
        Tue, 26 Aug 2025 19:46:59 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebecb1a86dsm782942185a.12.2025.08.26.19.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 19:46:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.16: cfg fix configuration audit warnings
Date: Tue, 26 Aug 2025 22:46:58 -0400
Message-Id: <20250827024658.2076887-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 02:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222484

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: arm/6.16: remove unsettable and obsolete options
    Date: Tue, 26 Aug 2025 22:43:01 -0400

    These crypto options are only selected or have been dropped
    from 6.16, so we drop them from our configs.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

I wasn't able to config these via a build, but by inspection
and the autobuilder warning, the fix is obvious.

Apply these after my 6.16 series and the warnings should be
gone.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index a5046cb38e..06d4c51a70 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "0efe352ff92817ba56a91bfe983e96cd55c76940"
-SRCREV_meta ?= "1fedc277abf169c6032ea77d5d61be91dba9f0df"
+SRCREV_meta ?= "f7034ee0721badc73a0417aa324755c1e6c415e5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index df2b0a67b2..04fb3eef42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_meta ?= "1fedc277abf169c6032ea77d5d61be91dba9f0df"
+SRCREV_meta ?= "f7034ee0721badc73a0417aa324755c1e6c415e5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 4c070b0b2c..d19803cb6c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
 SRCREV_machine:qemux86-64 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
 SRCREV_machine:qemumips64 ?= "dea33382cd8394c214422ebead1a2e08a4832c90"
 SRCREV_machine ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_meta ?= "1fedc277abf169c6032ea77d5d61be91dba9f0df"
+SRCREV_meta ?= "f7034ee0721badc73a0417aa324755c1e6c415e5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


