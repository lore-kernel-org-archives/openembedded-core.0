Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12333CE9D53
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:24:01 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92275.1767713036956130727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nw5q59dZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a2fe9e200so8495246d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 07:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767713036; x=1768317836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UpBEyMPO3gYEPguxIdPq6xbyg737x/cPI0n2dAsJH4=;
        b=Nw5q59dZFtMAwVyfo3gWBHz557kScKLUQAxPoa8hrN3LIMf4BGV0xHcWXxqQCJeGhi
         bWeVQtyoHP4PiILvxsHEJAGbW6jvWOWSv72dtf8kp73brOkjotvfNCxc1UBQ5WlRZx0h
         JyAn0Hs0s/myAwkyo2F/c/GrwXbuDibxL+kL32kn5nlxycbORCbhPkJaBxM5slvXkKAX
         dz1TNJZMQ1znzAULrf6jW58yNjzNVVAmqA/GzYy7zKon/W1lqxsD5YVm0x+sSgECzAYZ
         QXkqCGXsO9z3P0L7MnPP98HPEouXRwaONLPJmz4+rhnJKtyiW5hsPfy4RJXPZ3ramlsA
         t2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713036; x=1768317836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UpBEyMPO3gYEPguxIdPq6xbyg737x/cPI0n2dAsJH4=;
        b=QAbHzSjc7tl0YhGHTfD8fKTFhqq0et+BgL0xIiMK7pcsEip/V5gG3kQ4ehTn264Um9
         8OeJWo5r15m6/EfprWAgAqWfYLCTCYVCRQMI6CT4tLNiELhdGtfSoyoJ4G9v579G4Hvx
         hQyOGrU1QdAP5Qsk8kzHYikayOdUlI3dFbEdbXfTzUgk6MAr45PBHDlskCrGeCypDup4
         VEktN5hizpkAFcWKrgVmiBFkeQ2AxnFsvWz+kM2hqtR2pgNo/Mqf4il6ZeIaStj41GGy
         w/6HkGB+RmyAyw4J9MLPMYZDIgfVk/g9w91orNfJFRQruOnyDYibeksDgkhLQitnktHF
         qeHg==
X-Gm-Message-State: AOJu0YzK+ETyyoBeUve9OhqBAaP21SKBjON7qUQZpSy9iIN5oc30SoRY
	h1epAJO2WdBCJnaj7Fcgz5PB0Tk2soWNwRXmyYj33BjBa5jrU3SCPWqe
X-Gm-Gg: AY/fxX6P2mzObn2GH9UcImL0NQ81rV0OY8CqpOS1uY1BuaAtIm5D7QPh8C0Ip10d2Kr
	E97dwW2Lz4lRSixkuktpLSYZMMciV65egL53NHwVl9hWLUeQgrEEZHXuFhhlrHDFirxIbuk7u78
	Sd1br57z9SbZrufpcbV/yrV2v6zxiBbg6pAfd3Afk6uP6Chntxwvq0+3OPXSUgSA7R3flLiLvVq
	P+QGNQxsmE6Zmn+5Ez6IdNRyi3w+vjcQ1mXJwMhCmL3uQVjfM3RtLtTazZQ/8Es8cugn8RvHZqh
	sPRnxX9Cy45KBUzq/lztAIF/cbpvCDDPs6Q60uEIWbDcb0T6/ibrhlCT1ItC9Egl+pPvrvhynZK
	HaKMmix+/PeFjH4M51HiFEnHaV6urUK7eRBfI+XCBMRzJjGIH0MegyeWIa5WlmzhamHnWfDnG8L
	QBGUriSs++bEneIPTpg2pq1WvVebhYycU02a1l0Zenk5/TH0ldbVKoHXOtAQx7AbxFZXvhQcvBy
	BmHTTFaVpMwAq4=
X-Google-Smtp-Source: AGHT+IHjmeaPS358UQ4Yuc96QAKaQW8Js98ctgbBFETfW9LoMgOagcgXdYBG0fxmXn+RewftxFWi8Q==
X-Received: by 2002:a05:6214:2d42:b0:890:2bb:c85d with SMTP id 6a1803df08f44-89075e27cd1mr44028166d6.24.1767713035901;
        Tue, 06 Jan 2026 07:23:55 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267b9esm15587326d6.48.2026.01.06.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:23:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	haokexin@gmail.com
Subject: [meta][PATCH 01/07] linux-yocto/6.18: genericarm64: remove SLIM_QCOM_CTR
Date: Tue,  6 Jan 2026 10:23:46 -0500
Message-Id: <20260106152352.932717-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260106152352.932717-1-bruce.ashfield@gmail.com>
References: <20260106152352.932717-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228895

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: remove SLIM_QCOM_CTRL
    Date: Tue, 23 Dec 2025 15:26:44 +0200

    It has been removed from 6.17 kernel in commit
    7cbba32a2d62c3c18128c04f88b1901d702bb2bf

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 32ed29f25e..c54e4a0b18 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "be7ae5a34401b4f6dcb48ff7ae47e67394dba79c"
-SRCREV_meta ?= "20f3b59dfee2c9766656309ece38c588854d5fc7"
+SRCREV_meta ?= "8ac9b1baf5d3cc1cb53a87a449b52f253dc32cab"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 2afdc02467..bce86a263e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
-SRCREV_meta ?= "20f3b59dfee2c9766656309ece38c588854d5fc7"
+SRCREV_meta ?= "8ac9b1baf5d3cc1cb53a87a449b52f253dc32cab"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 562a997020..a4e56acee6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
 SRCREV_machine:qemux86-64 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
-SRCREV_meta ?= "20f3b59dfee2c9766656309ece38c588854d5fc7"
+SRCREV_meta ?= "8ac9b1baf5d3cc1cb53a87a449b52f253dc32cab"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


