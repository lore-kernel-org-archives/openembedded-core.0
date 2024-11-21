Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22501E64025
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:31 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.10673.1732226067458596973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kyv1URrj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fbce800ee5so71585a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226066; x=1732830866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7qc3o+vt/ujKsNQh0Uss1th8csMj8VZ1LFX7bXJnqM=;
        b=Kyv1URrjI6CkY/omOjSzKUXvhtOskmrIFAgxffGRTEZGFPlmCTqn4/0KGsc99WZlbd
         rNJJQGBYKXDprXQ84xh+IW0uZyrCjb6rbvwZ1O55TyRC9UQf57YNj4FgaGIDcYu5wgFw
         PPPSOoaKJLoqSRQieaNzgbiEjHKUDGfOgektphgH/OgcZr2jfMLbnSAbWpGRXZqNDT6E
         36E+keP5FLjZLMBnh6//eGNURPTRCgG0Kp5U3yREFQ0So+nyknFmGZad+USwpt6B/LCT
         oKgawHNQ7mZ+951l+0XvzmOoozsBnJicj7kqYNtfumV9NtxNPvFsYrhMDC3XDH4WfwNY
         cc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226066; x=1732830866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7qc3o+vt/ujKsNQh0Uss1th8csMj8VZ1LFX7bXJnqM=;
        b=SVyeOSZBNqsInMMbPLtFy6bYG25DoCn4RH5O+7Dpwn35/VrSnsdi88uBGgZAIQ0abG
         yG0wxobFCsd9IMhtENTV5CW7UuVDKHDejV+6YVjk1rHS8zXZpyJStipAi5vbucc3iUMT
         zROJyI1mV6QoV2+0/Z9IG7Lw5in694y1g8e0Xg+LdhNg86GA7nf+5mN1s+3VlLlbk2v0
         5dWn56vDXFIT3FCGbIo/jhF55foclH9TMKJ0u2ulb9K6PUyo6YK4r55OVFL/S6ocjbMl
         cBoC9/WTpNzH2kLXNFbn70dhPr9XWSv1hE2OLEQn6aARaEC6aXRGUsM94ZHuPf1jmtbY
         pVdA==
X-Gm-Message-State: AOJu0YzMktSRgR47sFC1GPGpRIiseoqwoY+KfpCtVX65+0ZAC1fDT8GB
	+ULk2ICQgbGniYaSWEnomMwt5rfoHtdkw43L3hyAWZ03EmLUAIbm0lvG7xQjouoJD+lpv73POZ9
	9
X-Gm-Gg: ASbGncug0HqDUCMprky6duoAhTH6E73vl5S+L1lyXswrRvH7tzp2an9TOz8XK8hubTq
	nsX2XLLZezuLu+BOLxmpYNDA6VInxIZREqnlaoXEGi8eXJWbtDd7+Kh5wb3m2iQwQMnq5GcaM47
	Uw5E+r3GfAToFo6ZDwwlJtRD9NCWg6s2YAwxUkuBtIBNQuyFeuKoDaRhTtmVTBCN0ydkKnkV3fX
	vkJJkRVZEzY8stQ0z54IoK6PIsgwVC8AaB8PaE=
X-Google-Smtp-Source: AGHT+IG266zyt3iszbUYD/EIIvOHLlTgddoyRKP2Mj6/4m1x7CQJTV8iPXy3fLmtkhbbKQkojoRQ1g==
X-Received: by 2002:a05:6a20:9149:b0:1d8:a9c0:8853 with SMTP id adf61e73a8af0-1e09e4b1b05mr800142637.23.1732226066582;
        Thu, 21 Nov 2024 13:54:26 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/27] ghostscript: upgrade 10.03.1 -> 10.04.0
Date: Thu, 21 Nov 2024 13:53:53 -0800
Message-Id: <a0c802e9b1d8400589aede20e52f40d10a344314.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207558

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

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


