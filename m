Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47287C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:37:53 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.8654.1709854667098357192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CDNUfWBG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so11000035ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709854666; x=1710459466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfAgc9kbKrx8Cb1DrqZyRSG0+exmwkGyW9JRzZjJz8E=;
        b=CDNUfWBGCdqEVhDwHcM9DXH3zDZ88HlkA6k8jXljTp3RjepsMPgBRDO/IhfOS00mkV
         l3LTFW6Wems+/f79/VWXzEvPB7xfTp1qlhuiD8FDMXHMY/GnPUUtXxvnkH/OGXNpRSMY
         L5uBZZknHI9pCYz28TNwyNM5eQ0NvBHkAm0RBPjncc3lg7Zu3C/AFknPe4FQ1X3zOhkS
         HBkbMAN+1/w8OMJcuk/YC8is6kPopxV/AIQGJGyeN6DvWtwLl6z1T52SX/hGpSuY7n7n
         C7Ynf7kvMoRnTrAOddFdsRRoYOijlq5XtV/QCyFdsyrhWqhiCIPOCyJQFEYs76R6abib
         8+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854666; x=1710459466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfAgc9kbKrx8Cb1DrqZyRSG0+exmwkGyW9JRzZjJz8E=;
        b=etledHtenURN2SGBiYnyK68LW4FDQXAns0BUm5lxSVw6uEfCuJhISj4EyyI7sWZDWb
         lDm7u7G1CLHZ+vhvCTfxX7oGYVUUIcrV1EaWWVrIEJUpbSG0QqQV3yrgBMeeTC/u7qEs
         5AWGXPofit34cKzVLxsNbYkq3eWszzQn2Mq+0kvePMWHdGGP+ZDRrAdXTkVmwDa9Wmsg
         GGWA+rocPgmHZYfchUWIvBgr0b7r9kffW3TvCeSDLs6zpBHSlR2RX/HtVTpLGp8zlriS
         p2xVgTVlvkh4L+PumospI8jjaRlbRIK95bL7U+prn9qK1S9PcPOKIxGcHu7fN6Tf+z6k
         Hbew==
X-Gm-Message-State: AOJu0YyiX6x+eDcKmPPw+rLh+cT/ilbfHnLvVwuFSR2gxQff4Wv64znt
	iBzZ6AL0uwHkSdAx/SrRaqxdLHMz8JJ7r9fodCzXUewCcVTthV6lEp5yhLqe4Jm0cE2KR4Hw1vs
	8UHY=
X-Google-Smtp-Source: AGHT+IErNZdocFYbkFePY1Sy9YdhU/bebeGBdw7A34KTzX4RK9VgZVmXeYMaj5YEpozEO6TycLU+ww==
X-Received: by 2002:a17:903:24d:b0:1dc:6073:a3a4 with SMTP id j13-20020a170903024d00b001dc6073a3a4mr4067767plh.3.1709854666338;
        Thu, 07 Mar 2024 15:37:46 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001dd526ff7d2sm1933243plw.308.2024.03.07.15.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:37:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] Revert "linux-yocto/5.15: update to v5.15.141"
Date: Thu,  7 Mar 2024 13:37:21 -1000
Message-Id: <f41f4cc473791f8d3c697483124e874b499decb9.1709853987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709853987.git.steve@sakoman.com>
References: <cover.1709853987.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196836

This series is causing issues with adding and resizing partitions.

This reverts commit 5832eebee3c150a30bd489699ca693240d11beda.
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f7286759a9..6ac3118f81 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "423b5d5cb3f45a272285fa4157d1964086fabc2e"
-SRCREV_meta ?= "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
+SRCREV_machine ?= "0ac91942af8fec31671ffe62e9518aaf15f110b3"
+SRCREV_meta ?= "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.141"
+LINUX_VERSION ?= "5.15.124"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 7461087299..9c06ddf200 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.141"
+LINUX_VERSION ?= "5.15.124"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ddf2eeeb31d1edaa5a80e9aabc8b2674ae95f865"
-SRCREV_meta ?= "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
+SRCREV_machine ?= "cdb289c798fe1fc9f259a08c32e2dd9516ccb7a4"
+SRCREV_meta ?= "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index c7b07dee62..439479022b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0bd882ff2a47566033965928ab468491f7e1ffd6"
-SRCREV_machine:qemuarm64 ?= "d353330a9ba30300be32f1d732723ae3678da684"
-SRCREV_machine:qemumips ?= "7f8fbffda634dc22a70f69ff2b762a1f3ff9c842"
-SRCREV_machine:qemuppc ?= "fb2191ca96824c7451fbca4eef129660d25711af"
-SRCREV_machine:qemuriscv64 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
-SRCREV_machine:qemuriscv32 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
-SRCREV_machine:qemux86 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
-SRCREV_machine:qemux86-64 ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
-SRCREV_machine:qemumips64 ?= "35895af6b529915f9c09a720592554feaca9a2c7"
-SRCREV_machine ?= "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
-SRCREV_meta ?= "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
+SRCREV_machine:qemuarm ?= "676a22c65ec0f8bb5dc7e13d130f6e3764959d75"
+SRCREV_machine:qemuarm64 ?= "f0e7afd5948f71be062cd9194b56cd03de94b7cb"
+SRCREV_machine:qemumips ?= "0f1ceb9008f182cd7f21420bbec6f21a67da8397"
+SRCREV_machine:qemuppc ?= "4ec9fc13283ce01627ef8c32617a1eb71e127c62"
+SRCREV_machine:qemuriscv64 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
+SRCREV_machine:qemuriscv32 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
+SRCREV_machine:qemux86 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
+SRCREV_machine:qemux86-64 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
+SRCREV_machine:qemumips64 ?= "fad09cc6acf2175aa6b5979ef48cd5f05afc3da0"
+SRCREV_machine ?= "1c09be01f4b87f60ea64136459167d73502a118f"
+SRCREV_meta ?= "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9b91d36ba301db86bbf9e783169f7f6abf2585d8"
+SRCREV_machine:class-devupstream ?= "38d4ca22a5288c4bae7e6d62a1728b0718d51866"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.141"
+LINUX_VERSION ?= "5.15.124"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


