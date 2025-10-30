Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB569CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:48 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.3238.1761844358929340054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L1Yx8cgk;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-88f239686f2so141842185a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844358; x=1762449158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7t9owKvrZXB0qmz4347rldIWvaplg/wHRzbwCioQqA=;
        b=L1Yx8cgkKFpbLlolIiOsTvUsm3kRhvxvcz4t3WghjGoO1cOp/32ZvR+7tR9w1i5Xjl
         DCl7F12+kDHOX2sG/bi2xmIAagP8j28iqZ8TSPE/sta8ztaev1A6LR7rswgNyYdHKRm6
         ulefZULdtCwLAwUjTj3r56RjKEo13XXA5oKr6muzoEGbw8yHZOf4tamXPoVv0FclkmNl
         bzaigE3sEoIEXzxKLSBms1l3+SzDKOzNNx44iCJr8sWpm5k2VGh5LqnGB3G6mHn2nDQZ
         znCdL2AKtq2oGzYgJH4clb9UcdUaqYMEFIHtbwq0zmy0zu+XE+NHr310WKv3jJQY+ZpK
         CH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844358; x=1762449158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7t9owKvrZXB0qmz4347rldIWvaplg/wHRzbwCioQqA=;
        b=MfW8NVb98XUstUWf8ck3vpA3KKk3c5BO3bHhyIpS7Ebo+h67BAQIm430kWynv1+5pK
         bd3kTvB3E2/Cl3f0XrrfjhOD3LQP4BN5oevlnkx6egTw+9epnwkA2vg+AtaS47JHrlYt
         enk99UDSGyzdGFEoDFGQl8iUHPASOK0aGujPjX9VbXMivQTPfS6RQQJs82N7Zd32pCw/
         MiyCzqBAjm7pC1sZN2fwPACbRhttpdLOMn/yD32vuB80inUQxrgwRR8rDcYP+Tt977FK
         Pdn5V2qtk0vxN3Zsdnzu2DfNiPhYL5P/f65p7rSy7otcJMxphYQVqk+Bfc+MesHq0ghj
         X6Nw==
X-Gm-Message-State: AOJu0YxJLT7q6YjFXnQVD+q62Dj/v66BnGIvHaL8Q7sjbzBpKL7m9feu
	mYQRLTYgCTPnTOR3tfCmE87gQgTBafrCmYHsLjXHqARklaWCOpm8G4rS
X-Gm-Gg: ASbGncsyAZnEmVHilJhGLMUJKW1kG1DKO3muHOVdudnkL7+MxmjE4JRwGFyrw+fqGyr
	rkusOTFxvEzUB1IqlMLwralOlVu5JEBvbdWmwQCykV0ZbrW34ADXz5RYN0ArgMNgITu9o/RKZy2
	Oko//ZAxary0ul3ftN95aMSa/zJ3pRN+PonyobSzGtkDmbvJrGa/w4EsixD5r2xT5Z3NyJZ1lqB
	m5mcioD8CyycnraILKMa0gLXbrc8kjGmGPBVa1QtxBHxDdXKmoj84MFJwXpzVpfKN/WEyNZKb7m
	zEEqrySbIWLvUFfZbsJc1aBUW0b89cFaF+EJ3MW2kGN2EL7yvDiK4+S9WG+z+bjtOj0UuUy+dsH
	/+9b5+hmAc+P3wLTTWabSp6Du6EV69YPBVvw53iJPTUKvJlfnlfhHf3QCutxptQ20M6wjQ1cnlR
	V4QfV5KBIwzLXUBI7vZ/4MnqAkYLD2W2BHc/9oJdgQh+sbN9QH1KYfaspojFQZtwcdHsq6X7wEk
	3AaRurYc0oy7vc=
X-Google-Smtp-Source: AGHT+IFdgptUqbLJEd1hA9areUPA8nt8U61KBoZM8EG/MJnsaSotU/KlZ9yEHAvpkjrGwFnDeQ/TMA==
X-Received: by 2002:a05:620a:700d:b0:867:454c:ba79 with SMTP id af79cd13be357-8ab9b59914fmr25665685a.62.1761844357707;
        Thu, 30 Oct 2025 10:12:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/14] linux-yocto/6.17: fix rdinit boot warning
Date: Thu, 30 Oct 2025 13:12:18 -0400
Message-Id: <12bd430dee40fbf76c6ef5e6000c85751db2eb5f.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225507

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.17:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: boot: only emit rdinit warning on initramfs boot
    Date: Mon, 27 Oct 2025 09:47:05 -0400

    commit 98aa4d5d242d3a73 [init/main.c: add warning when file specified in
    rdinit is inaccessible] promoted a long time check to be visible on
    boot.

    The issue is that it is always issued even when an initramfs boot is
    not used.

    To avoid needing to completely disable CONFIG_BLK_DEV_INITRD and not
    have the warning issues when an initramfs isn't used, we add checks for
    the existence and size of an initramfs before allowing the warning
    to be generated.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.17.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.17.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index 5af16f9b61..2e3b05c563 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "268abc460d21fe8510bc8a521f3ea887f2bbeef0"
-SRCREV_meta ?= "8f5d87f8cae63175d9a7d6b8791864df15b327ec"
+SRCREV_machine ?= "ded5de96729dc397870572482c44c65e4c353998"
+SRCREV_meta ?= "7b13aa26166b61951a03005f72d158543ad9f3c8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index 81a24b6bc9..4ed894239f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_meta ?= "8f5d87f8cae63175d9a7d6b8791864df15b327ec"
+SRCREV_machine ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_meta ?= "7b13aa26166b61951a03005f72d158543ad9f3c8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 9d2f51ad41..1a1078daaa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.17/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
 KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "23c78022fc97ea5ebc19ea8fb86d324c23a6fbaa"
-SRCREV_machine:qemuarm64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_machine:qemuloongarch64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemuarm ?= "d71de08747bc2f9b9b4a67baec689847c89f4fec"
+SRCREV_machine:qemuarm64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemuloongarch64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_machine:qemuriscv64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_machine:qemuriscv32 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_machine:qemux86 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_machine:qemux86-64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemuppc ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemuriscv64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemuriscv32 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemux86 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemux86-64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_meta ?= "8f5d87f8cae63175d9a7d6b8791864df15b327ec"
+SRCREV_machine ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_meta ?= "7b13aa26166b61951a03005f72d158543ad9f3c8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


