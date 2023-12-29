Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096F4C47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.151512.1703864723923306628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DHHdxf/E;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3e8a51e6bso52868595ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864723; x=1704469523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfU9g46mlaG8hNzGjGElecCVMzDDc5PVw0oLQWYt4PY=;
        b=DHHdxf/E+2tRwbbLiagSIlLrRb2Ap3VEmR+9SKsOSaIOOfQkRCe7mNGlALm94ySwpT
         22EfaR/S5V7JiwUZX7FNtMs1S7mvxu7NDUDIL2shu1GqXqr7zpAEw5WzGdmmi79MQbOz
         /DAS3PjcuRbY8QQdjjIZB4ILq5qAG3J4VvR/MzxAd/CdLgCmLcwwfTJ1w2Y9J0tlTueA
         gkmcp2VhDVP6S2W1x2PJiHJKzWSHRcJeYksgd/+B8UdIymjj4Dy92cxmkr7sW/RXIe3v
         UiT2JnlwNWezI9DQlN0d+RNXfXhlMqLn3n9ETg0tcfCMRnMYQ0AoToa/S8PmsBIhPrGO
         +WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864723; x=1704469523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfU9g46mlaG8hNzGjGElecCVMzDDc5PVw0oLQWYt4PY=;
        b=KwqvsmiTfPnQJWD+J8bTJtHp+dpFnMGaEObFJAqfwPWrbUAvYKGzypvA0qAp2vxAUJ
         zn3xSkME4miKhzuEFUBnRH5+Py38QhJZl/E8KElMGxXTuf1V1KMZIm8vv5Rm49jpRIuU
         NeXqxOygR0cZYZy8x8FB2Ia00BCnFze4l4ePGu/uRmVWyX8yrZgEycGl9L/eVulIDG4X
         l88RNfXTvIw2YvkGA4NuJqQfvyjM9zOx/xsNEq+DGezo1+eygOJgwlmR4Qj1McOKy8yW
         Xw1zc0ikGYZGHFuyPNHj/4xdI24mBKrCcfBEbRSOx4+1mHxy/50+5Nd8oksT35FAcR0l
         4lgw==
X-Gm-Message-State: AOJu0YyGgG9XkOhMRF5jVFn+LzTf3bwueoPo1+2upODImGxwtoBLm2Sd
	YISthswJokGUykHW1bRkul2BwVX3sJDLIynPQVTmp/o0lRtpaw==
X-Google-Smtp-Source: AGHT+IGT1HxbLbyHa59Yu+ezHLLmy8aqCdXCcrvd9URKqUY5H77ziVDuqus1IKOfUj+c2bu/haFU5g==
X-Received: by 2002:a17:902:fc8f:b0:1d4:5ead:785e with SMTP id mf15-20020a170902fc8f00b001d45ead785emr8756339plb.76.1703864720840;
        Fri, 29 Dec 2023 07:45:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 10/41] linux-yocto/6.1: update to v6.1.67
Date: Fri, 29 Dec 2023 05:44:24 -1000
Message-Id: <c1411f50533512973e16e1e4b3a6e950c9bb9a77.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193027

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    e7cddbb41b63 Linux 6.1.67
    db46c77f3d51 Revert "wifi: cfg80211: fix CQM for non-range use"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a80b32127dccd35ed7ed129e28231229afdaa53b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 54f7f4efef..93fc6a73e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "97d59da1d2d5a9ace6b4e7695b1eabbcd6197c4c"
-SRCREV_meta ?= "211dccdc1a71cd953c83f88a025adfa6b5c58ad4"
+SRCREV_machine ?= "40d218ec6d26f4d8de1481ef665e7eafb18f45aa"
+SRCREV_meta ?= "b1742128ddec29743c5f9d5c031a5770ece2b1b6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.66"
+LINUX_VERSION ?= "6.1.67"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 3e025e6726..e3d3671a32 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.66"
+LINUX_VERSION ?= "6.1.67"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_meta ?= "211dccdc1a71cd953c83f88a025adfa6b5c58ad4"
+SRCREV_machine ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_meta ?= "b1742128ddec29743c5f9d5c031a5770ece2b1b6"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 18beb3c3a1..3380604229 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7f7eb326b47065b720ad4c760b77d52021336f95"
-SRCREV_machine:qemuarm64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemuloongarch64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemumips ?= "638a98e4a2146f79a588b125d74addaae42f75a2"
-SRCREV_machine:qemuppc ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemuriscv64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemuriscv32 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemux86 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemux86-64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_machine:qemumips64 ?= "d39acda588fe786b00969ade6eef057d86386578"
-SRCREV_machine ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
-SRCREV_meta ?= "211dccdc1a71cd953c83f88a025adfa6b5c58ad4"
+SRCREV_machine:qemuarm ?= "6b4fd468de656727bb53d6faf7634157a3f80d4b"
+SRCREV_machine:qemuarm64 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemuloongarch64 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemumips ?= "09c54782be2fdab1a62e547504c28f57160b81fd"
+SRCREV_machine:qemuppc ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemuriscv64 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemuriscv32 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemux86 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemux86-64 ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_machine:qemumips64 ?= "a4b4e1d2daa47b400beb16e7f4aa0e7b650d8649"
+SRCREV_machine ?= "5b9711b24429c3543018411369d7086839169481"
+SRCREV_meta ?= "b1742128ddec29743c5f9d5c031a5770ece2b1b6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6c6a6c7e211cc02943dcb8c073919d2105054886"
+SRCREV_machine:class-devupstream ?= "e7cddbb41b63252ddb5b7f8247da5d0b24adfac5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.66"
+LINUX_VERSION ?= "6.1.67"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


