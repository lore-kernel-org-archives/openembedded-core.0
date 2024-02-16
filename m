Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D79C48BF3
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 20:05:31 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.8034.1708113922277250515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 12:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f3Xzpnuj;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-785d954b236so146433985a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 12:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708113921; x=1708718721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMtN4YG9VVlKC1qnDomJ6gpNSGv71Xt4joJl+F30AJk=;
        b=f3XzpnujhQDUvdbKkObH+w+xcEha7JphM7dLD3T5AtQAp6yOWfuet7bicKDSTEY0a/
         ZbghqdKZVC/J2ZTSlvC3wZlt0pons5pI3iA1hjmihey1pB2+aaaIu9sXrrLWh+jfJg5X
         NVeYKgNFwXASOIYpC4gAFmzOiXezEdVqVr/uMe5vvJkhVXkb1tYwLBPdmQDcE8rfng+b
         f0FIoLMWpf8fVjrebWjq5oD7DLEbyEJh3xIYo0iThWMjVqbUvGZwUEfgVnWWbhQBUGe7
         NbdGccweOKpF4SgTqlj5eHY1K7NqX9L2H8C/xLf1RIoa09bmhPRt/m342NiFMeJZMVmb
         YyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708113921; x=1708718721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMtN4YG9VVlKC1qnDomJ6gpNSGv71Xt4joJl+F30AJk=;
        b=a0MhdYeq15mVC1n5k7LLdC97Evq27lE9AZqQbz3VkUw1igcYnwyDDsabW540gHcSw6
         rFKQxc7HxV/biX3FlKWoJOLv9FkSfr1ayrTbe1P3FtYngitLbNHXHVSMSjH6TBQaF5aU
         19XFUfq1lZ2kG2v7RNAM9diXvkoWTzALap3docPxJweE0UXcX2hQnr5xKdozcKsqMs3X
         M+vzDgy007TAvEWpoC+8LlShVatW1L3C50rNren+xa2d83h1MIX6LnDbX8oS+o8dTclw
         SfweU7dKWP5/e1aJs4loS/r9baq+opN9W2uJ4IPq8ijnCJNoZ1L6PHgE9sI//pRfzOh+
         Kadg==
X-Gm-Message-State: AOJu0YwDHmkpU+jLddwZ9iNWBDgMaW64Kjs2ZZ4/JjjKQ8kCNfc9Tmq/
	bEKzgCo4mXiRC5YoZMGF92nMWM9hPWChNVf/4uP6lz0r7a8XAWOsYFToQTsUF/4=
X-Google-Smtp-Source: AGHT+IEUL2kJPN3broVi0NocFPDfzLRuiIkt/raSUM0kQfrwW80e40Zy9OEHrI6skiI1uv4go8AXgA==
X-Received: by 2002:a05:620a:8d4:b0:787:32a4:84e9 with SMTP id z20-20020a05620a08d400b0078732a484e9mr5976411qkz.68.1708113921208;
        Fri, 16 Feb 2024 12:05:21 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id vu21-20020a05620a561500b007872e92ff64sm246046qkn.63.2024.02.16.12.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 12:05:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/6.6: qemuriscv: enable goldfish RTC
Date: Fri, 16 Feb 2024 15:05:16 -0500
Message-Id: <5aa28c9a970219afca08cce557d4d3c2b0b9df09.1708113821.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708113821.git.bruce.ashfield@gmail.com>
References: <cover.1708113821.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195805

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Khem Raj
    Email: raj.khem@gmail.com
    Subject: qemuriscv32/qemuriscv64: Enable Goldfish RTC
    Date: Fri, 16 Feb 2024 01:05:51 -0800

    This is required for the qemu based riscv system to set system time
    correctly. Otherwise, it falls back to defaults in /etc/timestamp which
    is set at image build time and is not current.

    Fixes
    hwclock: can't open '/dev/misc/rtc': No such file or directory
    Fri Mar  9 12:34:56 UTC 2018
    hwclock: can't open '/dev/misc/rtc': No such file or directory
    hwclock: can't open '/dev/misc/rtc': No such file or directory

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
index 0030be98ce..a516404d88 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "4076926df2ff94dd0b990acba799e95de5fb1c53"
-SRCREV_meta ?= "9b93e812d98c4709146f8f8fa24855a23ebbccb9"
+SRCREV_meta ?= "301db0019eb67dd500919a201eaf49a6690b9c55"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 511f2761c3..2073a4b036 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_meta ?= "9b93e812d98c4709146f8f8fa24855a23ebbccb9"
+SRCREV_meta ?= "301db0019eb67dd500919a201eaf49a6690b9c55"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 594bee645e..4fa6eca8aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
 SRCREV_machine:qemux86-64 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
 SRCREV_machine:qemumips64 ?= "d764bf0df085f9901e4466eec99442b5c48aa814"
 SRCREV_machine ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_meta ?= "9b93e812d98c4709146f8f8fa24855a23ebbccb9"
+SRCREV_meta ?= "301db0019eb67dd500919a201eaf49a6690b9c55"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


