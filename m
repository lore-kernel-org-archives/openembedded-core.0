Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E07FE77184
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.20321.1734012496295309045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xcz4zERq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21670dce0a7so7184225ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012495; x=1734617295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+dWA0VGtJ+bTUd4/EYARwlLXfkyK/9axz8bOVs1QhE=;
        b=xcz4zERqM2TzKT/5d5/Pn3fVnIOtHYaA4b8ycNaEEH+YF1KDY7dL4LsoMGy1g6F53L
         MpWB62ZtTjT/XVjDtvbBAx2mwnl9ObDjSakPlIRb3ubmGhrk1XxUZrkYB7y8WRXcwd5C
         xAEsNX6o1rOSf1k5jeJ6JPJVk6P5uVeb6EB2IbXSw6yx7r7hpC6E5Gyw15BpU8UhV5Xw
         TMHN0xmhezUktXVhEIASyFFoM5U76YcErhA4WbjNSr0zVymoLmo0wqa8ZHV5cLla2dG3
         kdYhuShv/LFzIgZLqqEo4LcHkuQfXnp2HKG+tNnuQ7Kg/vW8UFERv8uGlbyiG1m+bsIQ
         xzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012495; x=1734617295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+dWA0VGtJ+bTUd4/EYARwlLXfkyK/9axz8bOVs1QhE=;
        b=QIPWL4kR570i4R37z6yu/sspKYijgZIeMit39tu4RhFK7v8luLZvAlJEJ8HzpfM0xP
         pFpOkVgPYzkr0dD7C5vReYY30BRPJ9sLxwEdh79DgtuDZwQPc7KwaCgYDU5gyIr2XYr7
         uNZMeRNfAb1Y9AfESXh18Bh+QDN2WcrmrbZKTywTaxb+1wkTzrxjjLOn1xxcpa7OoYJ5
         L3VzRF6MzwFY+uOcY5CBH5a1UWwWIHuKAcI4EFJaM4HDAuWO1TcfGtxY60dM6XPb3V/e
         /WYuRUKY46HlxAVFCu2wGMrUqoLZp+DtQ20Cti5NYA7qrNl81WwUizh934dKArJ//oWU
         fk/w==
X-Gm-Message-State: AOJu0YyHmNsiv6gfhWEO3duSgp4T0zUinokU7TgfhhN1zhJE1+w2xDeq
	Eksq56FhJ+fKw+yopYG4VO9ysNnGZieg1Pq5AkDHjNVsBQv6AXysq7X/7RnvUco1MlDMrx600ya
	f
X-Gm-Gg: ASbGnctfiRe9UX+E2Ltn+965CvTIHQDMb9JgiPKekxAXtusmE72RPQltMIUHJq15wq8
	bHAjHMC7F4f/sbxSenKEIA9/6gD43Xah6BCtqnwF87hLgF671Ue0hqTsxGmBzXQRVPbXPj6LKAH
	DGpbPzsaN07eo7K5q9NmpE6SpJJajwQHpUVWN2finQFrqOQ+ODrb2o4LbF+NvZz4pJw6CwgJp7x
	PYpVUZKuN6nYI2dfiikUlDJURdeQDDas2WNfV/A1FJJGA==
X-Google-Smtp-Source: AGHT+IHz8UE3zW/2gP3VLMIhlrmHvOTDcJ1el775Yk1sl/gSzOLOThjApgYQaBNJ0jXGotniNJcKkw==
X-Received: by 2002:a17:902:d4c8:b0:215:a412:4f12 with SMTP id d9443c01a7336-2177854ad0dmr110699385ad.33.1734012495529;
        Thu, 12 Dec 2024 06:08:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 07/12] ghostscript: upgrade 10.03.1 -> 10.04.0
Date: Thu, 12 Dec 2024 06:07:53 -0800
Message-Id: <067e769ada6c8cd5783c6d32f24cea9f0e4ed666.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208641

From: Hitendra Prajapati <hprajapati@mvista.com>

avoid-host-contamination.patch
refreshed for 10.04.0

Changelog:
===========
- addresses CVEs: CVE-2024-46951, CVE-2024-46952, CVE-2024-46953, CVE-2024-46954, CVE-2024-46955, CVE-2024-46956
- add protection for device selection from PostScript input.
- efforts in code hygiene and maintainability continue.
- The usual round of bug fixes, compatibility changes, and incremental improvements.
- add the capability to build with the Tesseract OCR engine.

(From OE-Core rev: a0c802e9b1d8400589aede20e52f40d10a344314)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/ghostscript/avoid-host-contamination.patch  | 6 +++---
 .../{ghostscript_10.03.1.bb => ghostscript_10.04.0.bb}      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.03.1.bb => ghostscript_10.04.0.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index 67f14bd368..0546fdf8f0 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,4 +1,4 @@
-From b36713c8f1ba0e5755b78845a433354a63663b1a Mon Sep 17 00:00:00 2001
+From 095bb1db8b2e68cac40e985f347a7039573e1e80 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
 Subject: [PATCH] avoid host contamination
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/devices/devs.mak b/devices/devs.mak
-index 186f704..88ab8c9 100644
+index a5dbc7a..27b55f2 100644
 --- a/devices/devs.mak
 +++ b/devices/devs.mak
-@@ -397,7 +397,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
+@@ -403,7 +403,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
  ### NON PORTABLE, ONLY UNIX WITH GCC SUPPORT
  
  $(DEVOBJ)X11.so : $(x11alt_) $(x11_) $(DEVS_MAK) $(MAKEDIRS)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
index 0504f5244f..546d734333 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "31cd01682ad23a801cc3bbc222a55f07c4ea3e068bdfb447792d54db21a2e8ad"
+SRC_URI[sha256sum] = "c764dfbb7b13fc71a7a05c634e014f9bb1fb83b899fe39efc0b6c3522a9998b1"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.34.1


