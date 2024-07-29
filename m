Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE991C3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:47 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.55963.1722258820491245149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RksWBenK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cb7cd6f5f2so2489184a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258820; x=1722863620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68rMcpHNuLTAakc5Iwt2tRhMrKLvg0iFDpfulHgzST0=;
        b=RksWBenKMN3xRUasPD69guujz0ABLktSvlylm2SJ5a9xgESTpZvZdkrrHDFoBjwKen
         np2RfnHZMeh9x0FIdCbPdRi/oaWvxEwqaKzhaBO7aOAmj6U5TPQ1ea4Dl2txfuX4ifgW
         zYsZtquKSwU0JJjSH5+pOfbIWISdrcKZp2km8RiS3sVwSnOyUvp4ES1beQqUUOdSIcv8
         fRF52IE5w6DnVdPUhaiOIrxoS6MC0XT9DeeL+dupNQ/PSCZ9tHU8kjrGvyyr15iXupuG
         k9LfrCRkSK28dVlTpk0I2/sGz6GLWg0pDWDK//ciQWzrPaLtGIYWKxDFvSJiFu9zoSgp
         qsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258820; x=1722863620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68rMcpHNuLTAakc5Iwt2tRhMrKLvg0iFDpfulHgzST0=;
        b=vy3xU89uN94YKJ7NgPNhYmM7i5qvy/Fec62pTydugq817TBWyHGgI0CjuQW8FuJ6Pp
         JtuUb+dhZqPinCqzM7fHJSojQBZ0M6QLKVUlFDHwS2rDQRiRlYg3eZwJiRIpNT+fBP4E
         771WfIy3vkCh6gevizI4Ihbhav+AAgAS0qK6pOCpcpNKC8azgms+CFfad3pm6qWBvI75
         5DDan4x/571uAmQloWNUdZbnr3Qg96JTeSrsw6YCblxUi2SVAG9qdKkqXQJNUh08Qh9g
         a9ktGXe43l5OLPDi4ZaZ9ZL5wWb4RC0wjnk7t2NyEWNQKMyc89xM6389WVqyuGN7rEZq
         +m+A==
X-Gm-Message-State: AOJu0YxdDvb59fCZ+J0PyY4jz9NHnPkkXh6cPAYyO39cgfQTd9HX2PYX
	UJZcQ29JeYC3ziVxis3Uo76Uz0AKsM+K01ah+wMtvGRCYPSupAacNbGQSyX9Un8EgCCO4URTrIP
	puy2+hA==
X-Google-Smtp-Source: AGHT+IEUWFIveWetwUZNoT8trs5OdV7c/B4uSuptUsW1sUGTZTmGDAybfzBgflJ2pZW1wlnXDcaUTw==
X-Received: by 2002:a17:90a:b30f:b0:2c9:731b:8561 with SMTP id 98e67ed59e1d1-2cf7e1ac614mr8876842a91.8.1722258819713;
        Mon, 29 Jul 2024 06:13:39 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/37] dpkg: mark patches adding custom non-debian architectures as inappropriate for upstream
Date: Mon, 29 Jul 2024 06:12:41 -0700
Message-Id: <bd782cf02ab8ae5250d8009595a877fab54b8d1a.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202645

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit da9906553c69af0db8b14c39ee224348d539e7b1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch            | 2 +-
 .../dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch             | 2 +-
 .../dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch   | 2 +-
 meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch   | 2 +-
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch                   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
index 52e85705fa..a137764409 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
@@ -3,7 +3,7 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 29 Apr 2020 22:02:23 -0700
 Subject: [PATCH] Add support for riscv32 CPU
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [not a debian architecture]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  data/cputable                 | 1 +
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
index d66ab4476a..9677a8cd23 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
@@ -3,7 +3,7 @@ From: sweeaun <swee.aun.khor@intel.com>
 Date: Sun, 10 Sep 2017 00:14:15 -0700
 Subject: [PATCH] dpkg: Support muslx32 build
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [not a debian architecture]
 Changes made on ostable and tupletable to enable muslx32 build.
 
 Signed-off-by: sweeaun <swee.aun.khor@intel.com>
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
index 8797ea55c6..76708f5bef 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] add musleabi to known target tripets
 
 helps compiling dpkg for musl/arm-softfloat
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [not a debian architecture]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 ---
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
index d165616a19..417beafb63 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -21,7 +21,7 @@ the required combination of "gnueabi-linux-armeb" was not found in
 the triplettable file thereby returning dpkg_arch as
 empty in configure script.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [not a debian architecture]
 
 Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
index 4e0d22acbb..f8be0f940e 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -3,7 +3,7 @@ architecture for mips64, and possibly other arch's
 because of faulty code added to Arch.pm in the latest
 release from upstream.  We remove that code.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [not a debian architecture]
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
 
-- 
2.34.1


