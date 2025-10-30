Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F01FCCFA05
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:49 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.3351.1761844359714019951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zfs7fULN;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8a074e50b41so163467685a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844359; x=1762449159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNNMBmhlvOlPHho0Q1DLXyd6nfiOPtZcNWJZ4B0VGaU=;
        b=Zfs7fULNTohKL5o3U6R4N8t87dSI9gNJ6R85K9RKlXaacRrMz8XlOPX8rcjCha3M2h
         EjXCFCICHmZn3inC5VivORlhB0skjyXYJph8LUkHC9msZS74dIVJu5E/hDQAig15rmlX
         Ytih50HjVDTkUCBbTywA/lto4071rmYhbX/s8Rco+6wLDA5Plj7IYziuAzwPT10whba0
         nQLRS0qMYx1D1ruOlu72QbiPx6XE64/iItIajr1OMJdhzlhYdyZChPfTV15iGy4M5z80
         Mrt0kTqXK6fyIDAzKybYt5yQf26Vyu+PB5bOgDUa0F6xhiybR0s/aTCD1lflnb15zxZg
         92lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844359; x=1762449159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNNMBmhlvOlPHho0Q1DLXyd6nfiOPtZcNWJZ4B0VGaU=;
        b=TwROazr6YVnTdb9vP0iJTLzKtdyaO/2d+MsV+klRcseKiXnuV5WJwxs/+vHj7vtbVs
         IbyjWZ4EgouPvP5tjur1wbbXn+7TJgeQEGHs4evZX6SMAQaWuobwfIN+iC+VElITuvQ/
         menmvjSmNT2yCBWsS290lvaTuJtC9pHNdXijLftEaoQS9xPhyhnknYtSW5rh6xXP7j+5
         //h21xBCrjFIVNZKxuykEOLRaGvCwvrHV15kS068Zts1+2/VDcqVwDXMbYrCoy6W5Fpd
         iy0lq5GuO6c657HibsjviWAfXhrE81FqDAVrI+iCK3mFnQQbU6NY7tfWPVKfm8EqxoVu
         zaLw==
X-Gm-Message-State: AOJu0YwEYMBVhhkdyJI/Nn0cSzX5UCfeMuVQnQVBqWP9mLkH652y/9qn
	W9qFvGeeR4qcH5+1B7KZr9XN41bqshqc2aKhIftWcAmruTj8a3FSLJT/ESGWUNhHnQ0=
X-Gm-Gg: ASbGncsQRyNDL7RLir+pMCjRuhL/CGWIKQfiIuVDdNSVgcrafPql/rwy2ddplBDGaZR
	xjx9L1naVsGY3uwygqRnJDojxZsStVf5UWz/f0GiLwDcscVu0kV9d8Z/dm2G5IBbuhkDhVpBtLl
	FmI6SnrAy9gBP1tmWp/L/F1YrTILHI7nn5KDekpYBeX2mRjxfg00CVDwXq6TeJXvxWww/0Jo7h1
	Yw0SNKSL0BnkP2XVIATdvQM5CoNIX87Nl2UOVrtW0PFJFgzxiKeGh8CUDITzbsHp1WpOEtkBBF1
	AyyuPuDXwFaAc5M5hpbyp2wzSGKQamXrrHDqEp3FVgl68GVz3pB6ngCNtYE9Mdv3bw5t7eZW7bU
	OvbbrsNh7NNT3ZlUX69KCnY779YMinzawh7H4lnYjEkxEcFR8hlZISSLpeTe0rGw/IkrKRoIXEG
	n/yuMhilIH5j+l8B5B7LBIr436AQx2fV6C/mHObn4GUHVqou0Yv9jU+w7DOLu1tEqcUGiBZEo9/
	rC0zoO4lvfg9Fw=
X-Google-Smtp-Source: AGHT+IGrA4lQiJDJOq8eX2tDXC5iXrt3xIgIfe19QeoK2mamlfr4vb4NtW8/62iXYuFrtPvXnEJHAA==
X-Received: by 2002:a05:620a:4004:b0:89f:7109:185f with SMTP id af79cd13be357-8ab9949b8d6mr30898785a.31.1761844358611;
        Thu, 30 Oct 2025 10:12:38 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/14] linux-yocto/6.17: update to v6.17.6
Date: Thu, 30 Oct 2025 13:12:19 -0400
Message-Id: <ddcc47a73d6a7b3bf4090ac9c4c301a75a7f8a42.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225508

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.17 to the latest korg -stable release that comprises
the following commits:

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.17.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.17.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index 2e3b05c563..864ab29fcb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ded5de96729dc397870572482c44c65e4c353998"
-SRCREV_meta ?= "7b13aa26166b61951a03005f72d158543ad9f3c8"
+SRCREV_machine ?= "a481087a5bd14195ca2f74527b3454ecf210a7ac"
+SRCREV_meta ?= "b4e4cfd96ab92d6bdf9d4498dde977aa66ee0702"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.17.5"
+LINUX_VERSION ?= "6.17.6"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index 4ed894239f..2a0a651fd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.17.inc
 
-LINUX_VERSION ?= "6.17.5"
+LINUX_VERSION ?= "6.17.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
-SRCREV_meta ?= "7b13aa26166b61951a03005f72d158543ad9f3c8"
+SRCREV_machine ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
+SRCREV_meta ?= "b4e4cfd96ab92d6bdf9d4498dde977aa66ee0702"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 1a1078daaa..5d10a17e70 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.17/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
 KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "d71de08747bc2f9b9b4a67baec689847c89f4fec"
-SRCREV_machine:qemuarm64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
-SRCREV_machine:qemuloongarch64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemuarm ?= "565a0d8d4266f4357e9fea437ad72699aed95606"
+SRCREV_machine:qemuarm64 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
+SRCREV_machine:qemuloongarch64 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
-SRCREV_machine:qemuriscv64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
-SRCREV_machine:qemuriscv32 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
-SRCREV_machine:qemux86 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
-SRCREV_machine:qemux86-64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemuppc ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
+SRCREV_machine:qemuriscv64 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
+SRCREV_machine:qemuriscv32 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
+SRCREV_machine:qemux86 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
+SRCREV_machine:qemux86-64 ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
-SRCREV_meta ?= "7b13aa26166b61951a03005f72d158543ad9f3c8"
+SRCREV_machine ?= "19af2117bca4cf9244bb7b561ddf42c3cd7d51ff"
+SRCREV_meta ?= "b4e4cfd96ab92d6bdf9d4498dde977aa66ee0702"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "99efbd4259f384718dd16a7423d8e944396b65d4"
+SRCREV_machine:class-devupstream ?= "371f1e070fa95c71356104a406855a361aad5668"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.17/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.17.5"
+LINUX_VERSION ?= "6.17.6"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


