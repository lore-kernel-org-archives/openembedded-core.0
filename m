Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D46E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.8160.1733294992073031793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/MTwyLp;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a742481aso52671675e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294990; x=1733899790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxxKRtT3Sedo7mdS2tDC0fArPE0B5X8cdYS7nqsLjQA=;
        b=Y/MTwyLpRjucFhl+lOkeFr0XEi7A1JlkIE4I2CpstDMltbrVXMudKZapQl6vUpJdAu
         kRaJQSeSROxKo+wBjhQC8Ij2zgROx9Xwj7A0liAbljrC56P9Vkf1VfgcZnYlDKk8JYFy
         mHg/wmy7gxbUzBOWV8RuR4vc1wTxLlGMEOvNxv4tdrfaPttk/JI8TGnFfs5k8UoyfYSJ
         FDEpDMet4NOhed7/dNAR9TOIN992y1z1mgaLb5AB9am/q4v8wdtw//4t28W8KUrFCQAD
         jAErOHzHIpu5kEhfgaCroW9IRCclfX8fYlLFc+FQYZb/CYYM1s//R5tbvyt0cyyuSB1N
         RI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294990; x=1733899790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxxKRtT3Sedo7mdS2tDC0fArPE0B5X8cdYS7nqsLjQA=;
        b=uOveRB8pfUGBr4RvKNuCKzKi73Nmb9P3AT/ZzAeFEqHLtVUztX9tYpg/0EtmLcpjhG
         1lZyyBv8ryIqeh8Uo7RS43RYaVtAAWNInnThFVx8SpfIxTSydYgVwu1C+jKkFjBZvt0F
         YMK/abjfQS7fSN682YyBP4BNKXsBu2nRAUuuVRE3dAh48WNi9pjX2rTXw6JA+8GM0R9k
         KK2GSt0t7GFa84ZmA3U3dicfwhz8zoqVc5GnF7f9o+nyORCKCNsc/qXZ1FEnItARwity
         nKqLL4GjGKiFi1wP1BCw6X/INr3Q3seVLyCxV4CIt8yUsOhFyydpjS23i+0vOeOv3AIy
         St+Q==
X-Gm-Message-State: AOJu0YyKt1XZKfU390WNAp2pwTM5WPySTKInc4w5LRG4+3E1GVDQ7THz
	Qz/mqdDBE5GBPYOqhSpyuYUD0BFu8KXJ0c5qtNirVVOUdDfhO15QRGv4qw==
X-Gm-Gg: ASbGncuXtSR5D6Ymp65pH8TCCVTPEhNm+SLmZCnjmIzfC0b1GwPiguEmzPSJmhVjkHR
	hpWTAavt5R381jTbKR3+3OxwKNwAlylFHjkuX23kbIsZEFjvNLg//q4lqw6OxclrKBy7ve9EWMm
	xqU1TrrjjwzRzXvB1jTRvlo9QeRuOF1nVWtCiLBpx/d86PMhTu+e7eKOiAPQXGxhQCeEqGJ2L3x
	da2jwpxR2605pCfdZPtXBFpsmzYSvDHIcNX85JTCdmmJoJFW5XsVj64w6atOZ0LHVFptyuL1gS2
	p48eZGC7efE=
X-Google-Smtp-Source: AGHT+IFNP+sUtKE5nN8511kBi3WBbnufQO8lbnnitr83mVmfOmYXybG22qln6+UEIBuiVhK80NXICQ==
X-Received: by 2002:a05:6000:2c6:b0:385:f6c7:90c6 with SMTP id ffacd0b85a97d-385fd3f9082mr4607483f8f.20.1733294990429;
        Tue, 03 Dec 2024 22:49:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/37] btrfs-tools: update 6.10.1 -> 6.11
Date: Wed,  4 Dec 2024 07:49:03 +0100
Message-Id: <20241204064920.817016-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208249

From: Alexander Kanavin <alex@linutronix.de>

Use github, as kernel.org has the needed tag, but not the branch it's on.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...Add-a-possibility-to-specify-where-python-modules-ar.patch | 2 +-
 .../{btrfs-tools_6.10.1.bb => btrfs-tools_6.11.bb}            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.10.1.bb => btrfs-tools_6.11.bb} (94%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index fbd1b05a7fa..59ea5a66dac 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From cb7f8a6c3538ee3086d15c4d2c9f2a2f4f38db3b Mon Sep 17 00:00:00 2001
+From 76e635a56c5973671da3a8a2fd4fc32e823bf8c9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.11.bb
similarity index 94%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.11.bb
index f37272d7ab9..fa0599d28d7 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.11.bb
@@ -15,10 +15,10 @@ LIC_FILES_CHKSUM = " \
 SECTION = "base"
 DEPENDS = "util-linux zlib"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "a00c2b25474b5306ef29a790adb5fd5afbaba9a2"
+SRCREV = "8859114eaee39c117ff95f5b60b4e81fc22f96e7"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.39.5


