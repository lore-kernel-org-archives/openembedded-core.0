Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0650D711AE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:23 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1945.1766089396518535518
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hpzexubo;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88a3bba9fd4so10658276d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089395; x=1766694195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pO2jmpAR+clEgDQka7wK9Kkd9YBtR6pLQZvXeUpkTOg=;
        b=hpzexuboK8AsUutMa84sLTZGdIReTGckfcBNaIGPhvz/+IuWFWZ61OzswaOqVUO7jj
         TCONmZL5rAOV7wNlhshMKetbMzB1OvZHc7KxLst9B8HDvTMFSTZMiMPNrjZhPbhb/s1O
         YzWwl1byTe4YCBTZh5dxWIGN2AkOs0gHGDJRipjxIzPLxK+fu9prGg5tKclz3gq/tZIf
         H99kAR/t6vq4QAiZFywV5Ayh0bGh/9vEbcdsKfXWZaw7Htjyo7QV4Tm38fQ44A7Kkuqm
         41GI2xFwThMBWvsrsjd0RjzZC6KUcpePpjzZ6BQcY3RkvOgBRMHCF8uDF4P9n3VitUyJ
         VfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089395; x=1766694195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pO2jmpAR+clEgDQka7wK9Kkd9YBtR6pLQZvXeUpkTOg=;
        b=apGu1Y4KeA9XuDuKiclqGn9K36fOtouW59jS2OqPwYeutGkPD1vQdPUTCOPhVfpOzi
         b3UFCS1Y4DSYCtBWpDpufHsuw8FDewxFMdDgeXTeQkKijnPa2avMiR8Qm9k5Nmf5K+MU
         9My1W9dnGduaICjObR/8kvZ7i4XJg4KjiWUn+rScCM2pNQ9HN46xij1xw35SuaM5RsFP
         xozWtTPX28yFysgcyWFVNVhmBl0RVGnANAQhd028iuSwwGlLpzZZG5D9eOO+wwq8PidP
         SzoF3bFSX32Of+C+LCmWjoqAz459tY5MExaqO9pUg5KtQ4QhFVu/Qb3upOWMqxOfrLwK
         NtnQ==
X-Gm-Message-State: AOJu0YyeBPMG+0KtDkQ6O596/og0y2wy0gnqJmMI8YRKCL2f3oFhsNZw
	oH9kpKneaMJi+0MmNtQT89vgVPHGT6OGNFcyuyAmHcbYYWDV68b7SwCb
X-Gm-Gg: AY/fxX7UbRd+WI0IieA8SvDsuksKQtmgyGk1g51E87dBneXsaGCZ1pG+tIWNw+o0RM7
	Ay2DqeRhW+uybBpDYyedUB/OGrjFR+46FizCUJwvy0NdSDl/h9acLKvTWDGvyh7+yb64sC2Qizr
	PbOLyivNEW7X1A46UAifssV9c74VL84DpP18M+xGDG9xUefFUGQ8jrspwQWHhDb8WZaLeeYxSW1
	yWFx3I2Ogt102tS4bnbpZHgdmsYxvcPr/1arJl1XYGNhLAwaA+mwQsb8eXpxz3hDThYQzpb7v7/
	Akxd8cT3pmrVOwFJgy8Gu2vJXqLPJHYLxqs31M4yZZ0fp6I6pCjjCiY6pnXRbmU6eR8/jYcEMcO
	dpqEZ+6S0KfKcw9PDg7MF7ZCvSxA8UgW676Ur+0Qv1dIS0CJcm7yljA5IvywtyKs+N4alqvasr1
	jwt2TtFEQFZMhShkofj98X+4133kH1k2MRZgbPYTPpYpqS/rDAIInPQyMgB3Nes6Reo3oimczEM
	zfyr9xkoGnkUdM=
X-Google-Smtp-Source: AGHT+IFj/IQoyV8d914NyhhVufDAW1zJzKXwad04E02DvkSvJtLdzdEwdTkdv0+oXjm9l3698cVLNA==
X-Received: by 2002:a05:6214:23c7:b0:88a:4698:1b37 with SMTP id 6a1803df08f44-88d853ec197mr16564156d6.60.1766089395470;
        Thu, 18 Dec 2025 12:23:15 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:23:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [04/06][meta-yocto] poky: make 6.18 preferred kernel version
Date: Thu, 18 Dec 2025 15:22:44 -0500
Message-Id: <20251218202248.70476-19-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228162

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.18-LTS is our reference kernel for poky in the upcoming release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/poky.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index f1e91ec..dc39e53 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
-PREFERRED_VERSION_linux-yocto ?= "6.16%"
-PREFERRED_VERSION_linux-yocto-rt ?= "6.16%"
+PREFERRED_VERSION_linux-yocto ?= "6.18%"
+PREFERRED_VERSION_linux-yocto-rt ?= "6.18%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
 SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
-- 
2.39.2


