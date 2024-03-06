Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50824C54E5D
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.14859.1709739724218175131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AnkJLIqq;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4499ef8b5aso569169266b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739722; x=1710344522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/wvvlH3XQj68dkHgow2OHyfUkVg6IWUH9KA0LgsUWg=;
        b=AnkJLIqqeTIQx0aEDR4HNKJY6MKjyUKbLufe/eYyNGEoZK5DBveNfPKGRJIa8sE1xA
         BS8w6R9ESkhsgtlLVc0KriFZ7XZV7PYfVXhsO/TzeaRINSnc8yBfmzSiVFc2FC9Y1bTW
         V2UchjxPmKM3YF/aK5/MRMVrxvvNgsUfIxIK8YpWahU92KEHl979iG1frepSE7LUjv36
         ABMHH2/szDR33n9xcQwEY+P/5j0AFc+7FYnJrVW7Yhto+MfZD+cNL9H7voCBSmo/fgjm
         6liS8dIVBOC6dMoENAPRO1EaQzOZi5bp2lx2LBaW10eKIKDyPxvE6Pi6aVlp1OXgnbGf
         34Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739722; x=1710344522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/wvvlH3XQj68dkHgow2OHyfUkVg6IWUH9KA0LgsUWg=;
        b=PtTDZLXb5q8yXO5/E7XMNt3EvLT5DH4LSwDKrXyYfXtSZJzq3ClnyMkPU/DLcxlGDd
         D33IXUU9nH5AHBKM7DIQ9vXBleBMvU9GfkqPy68KGv3ZmklfeuzI/lATX7sG1cEHrcXo
         h2qvbGrkuj2zhbEjRonBQFg3RV6OZE1K7fkeFAujQJLpdbAGreEZiepMyjlwt27hRqqf
         XFJQMNZNTr7AmV8VKzmkI8qpEokdZrLTVm8gChv024oOhWuzOu8Pce5FRirzXkb4JKHg
         e0L52R4xLGfukp82V5tpUaiFKaR95EM72w1tIn5YIjWLSMfZRtErq3ZhJe4A5/O818gm
         wLWw==
X-Gm-Message-State: AOJu0Ywb2ztgEVjdLJScPxOUGMBf07ROq5GFsqF3y/WGn2X728ZKnnBq
	LGhp0dXbHej+uYrdA4OcaCUgh4WnM0vuTgIN8ZclXiRE5SMDhVWCTeF/nujR
X-Google-Smtp-Source: AGHT+IE2FNvrZfIhq6quJFCqQk6TWmJ1Jc8UW7ghJLINppcdwbVahJbkx5ZN2YD/82X98VTf55Xc3g==
X-Received: by 2002:a17:906:3c10:b0:a43:c0f7:d2cd with SMTP id h16-20020a1709063c1000b00a43c0f7d2cdmr10326746ejg.3.1709739722430;
        Wed, 06 Mar 2024 07:42:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/47] btrfs-tools: upgrade 6.5.3 -> 6.7.1
Date: Wed,  6 Mar 2024 16:41:09 +0100
Message-Id: <20240306154151.3741709-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196688

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.5.3.bb => btrfs-tools_6.7.1.bb}          | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.5.3.bb => btrfs-tools_6.7.1.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 5846f04d1a9..4b1797b65f5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From d3adfc21c9cc264bd191722f102963cbc4794259 Mon Sep 17 00:00:00 2001
+From 980f6edc269fa3ef8d4d4b9cd1aada2328131c19 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 1697794c..8ab38818 100644
+index 374f59b9..ed083f6b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -651,7 +651,7 @@ endif
+@@ -959,7 +959,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb
index 6455efd1bca..8132c2cc729 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "a45c360b64660477c726e192d9e92ceb73a50f80"
+SRCREV = "60abf7a90776c2405f616182ef6129474bbcb109"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
@@ -27,7 +27,7 @@ PACKAGECONFIG ??= " \
     python \
     crypto-builtin \
 "
-PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, python3-sphinx-native"
+PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, python3-sphinx-native python3-sphinx-rtd-theme-native"
 PACKAGECONFIG[programs] = "--enable-programs,--disable-programs"
 PACKAGECONFIG[convert] = "--enable-convert --with-convert=ext2,--disable-convert --without-convert,e2fsprogs"
 PACKAGECONFIG[zoned] = "--enable-zoned,--disable-zoned"
-- 
2.39.2


