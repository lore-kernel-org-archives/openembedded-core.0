Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1136C02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:28 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.28736.1736801244017014535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3H8uhoTt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2163b0c09afso86729905ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801243; x=1737406043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEvT5vhz+v1aa+UaLECoI8TBmTSxHaNwytK4nVpeicM=;
        b=3H8uhoTtrHpxZNQNoe5LSgck+Gsi2B26Et/rmMPuTMrHsrwz0cYVfC3HpZd1rObPJ8
         bndZqXlagyx/Kk+RXQR2IY9NVOUox18pvIef8Am8gXEx6wlT5cZWVv3vHhoWS4xSoJZ6
         /BQsGBtBRtOt4GO2LzNL8QxoT6N7tJJI/hzkb9Iz50TDcgc5jSp9/l7m+swPXyol6H1C
         Pj5jmoU72vBQlyOmBO7jCkn/mfx+AH9hyMzOfFH/Q6rUjNLQGcgClMJZEJTTrPjRDzDM
         bo21YOzoIFNDcOvwFJxOdzBpBQ1cKhU/ah2mHtagaAJLq4EDlhZVuQBpVp/bW0uIkfl/
         S3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801243; x=1737406043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEvT5vhz+v1aa+UaLECoI8TBmTSxHaNwytK4nVpeicM=;
        b=hpPLSr90PAe70OA87Z3A+SAVuaVQIVp3RrN49mepim40JxP6AgTSas6pp0tOHkbE+2
         2ZK0DL1shWfu5ZZwt4GSnRtO1j/6VIUuZf32FIzX9/NnQurPEP+K5lYFQa2kMz6kC2LD
         TCAJUUL8g8fjFUwunMKBNSXMdmoWbihJMn44AbawtnS7lI8g++ij3Dud4DUojaakFqzV
         g8zG11JlFvdNczvbxvUU52QhF6+p6DMK9akys/FN7Ql1JlgMq82IHTheK9FEy52Qshg8
         GU9QEM92mo/YL+/Wz8H75X/bpHLRo61PolINgBzcUFn8HUJjgNTCUgfVnPLzY0D44Duj
         DFiQ==
X-Gm-Message-State: AOJu0YzDNfRUu3ljlNT1Lkg21Z8ubOtld8eoc9PKc1r2gXOIYpggUaBu
	QytM6wNg6djNIiMighNg7xYoJ1hQ7l51GomTVOHGHK7No9GZZ7QQqisDQ1p5pkWX6F+pX7PFx87
	gP54=
X-Gm-Gg: ASbGncvxnq0sUVkDbOUwmiJG+awe02A+0/soCTNhRv6+gtGUBa17Om63roenDGA3hrp
	4peGPQKzaos0ruWeuWOeLiW6qeJXcc+OMMaGy3mr3FUEwUiGr1RM0GWYNpuHSGUon9vB4tJH5ap
	PPWc/b5DBMaU9I+Reizj9508MVKNMpkymlDFIiclr/1JH5db/n8x+0OkhZYx65NkJ+rBXvgpnwj
	TN8zcPlNPHyKLueQ80JJfGosxYbHHyd0YeXIvG0DhdtTg==
X-Google-Smtp-Source: AGHT+IHxMAxHMzY+7EcoLR7EnTAFpfPqTmSTiryUXPL9Xouv+Koz9B8sDFckk8DSP3i2HqYlLxlMlw==
X-Received: by 2002:a05:6a00:9294:b0:725:cfa3:bc76 with SMTP id d2e1a72fcca58-72d21f115b4mr35006489b3a.4.1736801241742;
        Mon, 13 Jan 2025 12:47:21 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/15] linux-yocto/6.6: genericarm64.cfg: enable CONFIG_DMA_CMA
Date: Mon, 13 Jan 2025 12:46:56 -0800
Message-ID: <5754841cb19c4272fe3494b5d5e450ae9876fa48.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209748

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: enable CONFIG_DMA_CMA
    Date: Thu, 24 Oct 2024 08:49:29 +0300

    It's needed for graphics on AMD KV260.

    Cc: Bill Mills <bill.mills@linaro.org>
    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87bbf8eaa48cfc8bca02d86bd089df61846d2ca4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index fa4a8f564e..b663804e17 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "0dc843fc43271230499a7e5c39e7a22eb1dbd2b9"
-SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
+SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index d913e09212..0faf40ef2d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
+SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 9feaec24c4..db06c05c38 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
 SRCREV_machine:qemux86-64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
 SRCREV_machine:qemumips64 ?= "b15f0ede8d222c8fe745a21e830166a7a8da2f1f"
 SRCREV_machine ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_meta ?= "b1108273b878547b3d3281f21aba44a8c41ca741"
+SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


