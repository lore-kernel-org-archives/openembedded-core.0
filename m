Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0591BC5B552
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 16:58:08 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.26207.1748537879311604343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 09:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ItQK/QAv;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f5373067b3so14332406d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748537878; x=1749142678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0LOim3V9CPD7ZsGOtBwpSIRVorIgT1Bk1aa+/2CDwU=;
        b=ItQK/QAvnGk8jPlz6CJzQjf30M3/9eU6UIRlC1NJQMCxx3NoAlYVNx6sRagQKvOohG
         Ib3z2gALZlpDNDAg9NZzsplxg/2GQatPqXr8CLmxk0w3BRjuRv4yMFw9Ogt5bXoHY5VY
         6q10o6SD5Pp5D0/e/3uaF49RJPdJann9mqTtKVG0c2uDyIsYXISnLtJ2seKVNrBbaBpj
         fs8FyEAhLXG5MSLU4NqhOyCCtlZlfhckQLkYYsOhfg5P6AztdvPCGvfpYIJpq+vlKMPO
         2x4YzfXCUVDSaXAxr8stmsBUkw0Nan08/IuNzv7yFJk5nhQCJYyPXzAktO5PD49qkB2x
         KyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748537878; x=1749142678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0LOim3V9CPD7ZsGOtBwpSIRVorIgT1Bk1aa+/2CDwU=;
        b=ZUPZ3nhtlncoZ2PYVHPA3/By0rkw4mb5gaaWCGwE+OAJMqtmhzdN+LxVe7SviNpUSz
         PXsjpf+rY8iiGsduUMdaawvLGCaKZgJq8JAsRAdwWpz0FtAGEdyqSegXz+f2syTOVX4L
         abJ7RPU1dcXVE0PCsvPrJDTRGEH3fD63t/hDSqULU9wRWqoOHDN+gwlh8MmxZ5ntFkE1
         ETLfhUNbVDkgAkbtP6S8bem9w+CjkzUdzxC1eMeNV3/7JEIEkIpropo5QPyUt9cKlqHm
         oi7L/euVkg7rt/AeFwe/N4rozhNWmievLbfIMOzVAxHr2jxCVqTZPR4CW4xXw1QT/xXB
         VZow==
X-Gm-Message-State: AOJu0YwUJ6S/FK3CZjceIDWReo+6aFMfsFbMxN7XUbQ094f7UrRX10Rj
	RKyMCR3ylPOkuqqNWrzFryn2Qu1cLQlSz4RNw2KnKfvkPZKDKKaUiM5aKaP3nSBg
X-Gm-Gg: ASbGncty1DmwTMYziIxTKwcBukYiUzIGTzmZMV1jT+bOT14Kp9LO0AV1q0jxW8kR0IC
	+RdFuzFed80f0rJhOQJ0eDVsBVao6p6J37O723i3wFyLDyTlgJQzFHpNtqB6hho7EWG+qcID4Ae
	kz+8zmgRdVdPseAS/ZdoPzXt/LyizGuCz/bv+MZ8vcj8yWJ6GkDchBhCrK0GrPv52AJMFTbyu5p
	fxfPe/OrM9v/XdXyKV5c7lWj6eVaoEHGvJ9L0TWqVHmPt5Dxnk0gBNTJeqjdyAimaWtlDNsKKF1
	qfy7iMZKKhPND23aBIWWYpE7//4LI55YcXLnkLtN34yzmTX3uuBccqPvtAJIJEqKmTUGmRjeiwp
	l/hgKFK+qVf4zAHGLvHONJN8kQd/EYcFmeVVqzX2c4PdFiEbrrWHe
X-Google-Smtp-Source: AGHT+IF96MjE3NtjNLaCC5NJmdDl7EaYnUhyceKtq+/stIP4Fbn3lvMGT4O+uyPLCDhBvpBdTTKbnA==
X-Received: by 2002:ad4:5965:0:b0:6fa:a0c2:c35e with SMTP id 6a1803df08f44-6facebf25aamr4157786d6.12.1748537878160;
        Thu, 29 May 2025 09:57:58 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1c02csm11382676d6.109.2025.05.29.09.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 09:57:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 2/8] linux-yocto/6.6: fix beaglebone ethernet
Date: Thu, 29 May 2025 12:57:48 -0400
Message-Id: <20250529165754.264501-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250529165754.264501-1-bruce.ashfield@gmail.com>
References: <20250529165754.264501-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 16:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217421

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Colin Foster
    Email: colin.foster@in-advantage.com
    Subject: ARM: dts: am335x-bone-common: Increase MDIO reset deassert time
    Date: Fri, 31 May 2024 13:38:17 -0500

    Prior to commit df16c1c51d81 ("net: phy: mdio_device: Reset device only
    when necessary") MDIO reset deasserts were performed twice during boot.
    Now that the second deassert is no longer performed, device probe
    failures happen due to the change in timing with the following error
    message:

    SMSC LAN8710/LAN8720: probe of 4a101000.mdio:00 failed with error -5

    Restore the original effective timing, which resolves the probe
    failures.

    Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
    Link: https://lore.kernel.org/r/20240531183817.2698445-1-colin.foster@in-advantage.com
    Signed-off-by: Kevin Hilman <khilman@baylibre.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index c3f2c35b1f..e0006035fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0588a366e1193d9ac23855c4a3c2c784d5ca512b"
+SRCREV_machine ?= "4c94a7140a0416421cd82fe18703e99d7c4eec8e"
 SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index ae0316dade..8c0617be10 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "93714069321a8e2f7d01f51038cc1d9afd64a57b"
+SRCREV_machine ?= "50111c8145a573a5eb34859736492d3914d74f26"
 SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 55304a1929..061837ec88 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "00f5a7d26256a6c96f4c624ed2fcc2915baf69ed"
-SRCREV_machine:qemuarm64 ?= "44c07335c9354d22e1059b773cc5acc6d5997acb"
-SRCREV_machine:qemuloongarch64 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
-SRCREV_machine:qemumips ?= "6f7f7ea73242088f08c504a73144e7c3649548f8"
-SRCREV_machine:qemuppc ?= "af203c26b7349967003580d373f7bb4e32b53c5a"
-SRCREV_machine:qemuriscv64 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
-SRCREV_machine:qemuriscv32 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
-SRCREV_machine:qemux86 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
-SRCREV_machine:qemux86-64 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
-SRCREV_machine:qemumips64 ?= "98b3401fbd220385715648e6bea870482419e7c1"
-SRCREV_machine ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
+SRCREV_machine:qemuarm ?= "c7fc26b463b6d492177ab4f3133ac709f72959e6"
+SRCREV_machine:qemuarm64 ?= "a2123abde1b536e17d6f8b41c07006b1b78fc14e"
+SRCREV_machine:qemuloongarch64 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
+SRCREV_machine:qemumips ?= "441ff4147581f8866ccb145ee1fcecb418543a46"
+SRCREV_machine:qemuppc ?= "c186535e4a16fe6524c963f40744f56d56cc37ae"
+SRCREV_machine:qemuriscv64 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
+SRCREV_machine:qemuriscv32 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
+SRCREV_machine:qemux86 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
+SRCREV_machine:qemux86-64 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
+SRCREV_machine:qemumips64 ?= "ef983636bee26dd17055fbff877a6ca4cd10e4ed"
+SRCREV_machine ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
 SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


