Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB92C54E60
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.15026.1709739734132284019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hTzGYPxb;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-567bac94719so1942762a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739732; x=1710344532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N3KUMP4JcGfXs5pOfKzdH9RMXYdGHiSn6wY9+Xis+Y=;
        b=hTzGYPxbmaMLr16ezNRKbhv5biplyesvJKTTuD7GnCmCh8CH9Mqxb0DnG/Nq/amy06
         T7WF4DQhAAyEfpsQXyY+pznEuFmZCQQnDiu0XUWCYstxIFlCQ+a2JRjq0KeWe6KWy017
         1QSe4nFQ6KNkmYbY782mnZWRmIQ/iV7bIgh2dmrP2sq1CG4kiAi5LPV0CsBsNTiTfCUU
         UKYqHSzGThLTUMiWQ79yxbRGBceH6fafTZJJ9ZBAVwj/UCgpC+qV/5GVppMBWsl1MvgD
         uy6xl/jo/+mw91MSwbIgBUJ8TGK+eFuwvNRe6gmEqofNAkzNCOs5cjXQBENObU58ySrD
         Rzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739732; x=1710344532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N3KUMP4JcGfXs5pOfKzdH9RMXYdGHiSn6wY9+Xis+Y=;
        b=M/Oylh5G4tTkPFWe5oKYpk7EV+E6SdK76MhqJYCINwXeredkcXOKo3LEoGY78HmLBK
         omMXKbBU3K0vAQ96Zots6IDdE37oxP66XJcxCoapER05xjS7+DwcnEX5hCwIc/oEsbV2
         4Hj6Kl+ujNyILC42kpKm/zcwJEw57UOCuarF6iP56pNL7NLKuC3FDaGKxJhJ2SfADOCj
         Aw6twCIWbVrOXL1rOBynVl3y1flYK1Y6Q0SIyzp2urHEug2ai/o7F0A6+qCYxnuf2Lur
         ugTW/xeaQLALNgjUGHAigw+eiZPfOLIx4u32QNRGs5mhpNnjDtXfbKXbTt4SSVeEpalX
         vdIA==
X-Gm-Message-State: AOJu0Yy5lk8eYQ7x+8cBvCYFTO+MZ0TbC5k+16fVGzJTa5VMbE9d7/7H
	Bcrnzf0VUmkL7sm05zpdmF3oHri86eUHbKVioAAW9i8Ub0aZ881rJiErewtb
X-Google-Smtp-Source: AGHT+IGz8QuNf3d/KviPsUqBmI9cgYTKpjZ1mTHyOHRT6U18T8Z9uZ9qet8wGZpCIewQNfe8BJ/a+w==
X-Received: by 2002:a17:906:2789:b0:a3f:bcff:18b8 with SMTP id j9-20020a170906278900b00a3fbcff18b8mr11036458ejc.27.1709739732346;
        Wed, 06 Mar 2024 07:42:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/47] libxml2: upgrade 2.11.5 -> 2.12.5
Date: Wed,  6 Mar 2024 16:41:26 +0100
Message-Id: <20240306154151.3741709-22-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196704

License-Update: hash.c is rewritten and no longer carries a special copyright notice, but dict.c still does
(Copyright file updated to reflect that)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/libxml/libxml2/install-tests.patch     | 9 ++++-----
 .../libxml/{libxml2_2.11.5.bb => libxml2_2.12.5.bb}      | 9 +++++----
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.5.bb => libxml2_2.12.5.bb} (92%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 14ccce5873b..478eeea81b1 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
+From 0779511838a8cbd1e0f431c22f28f286a2a37b1b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -7,17 +7,16 @@ Add a target to install the test suite.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  Makefile.am | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 5bc4018..57d27af 100644
+index 0a49d37..1097c63 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,6 +26,16 @@ check_PROGRAMS = \
- 	testlimits \
+@@ -27,6 +27,16 @@ check_PROGRAMS = \
+ 	testparser \
  	testrecurse
  
 +ptestdir=$(libexecdir)
diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-core/libxml/libxml2_2.12.5.bb
similarity index 92%
rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
rename to meta/recipes-core/libxml/libxml2_2.12.5.bb
index 44336c25e1c..47c1a72e77e 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.5.bb
@@ -4,10 +4,11 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/libxml2"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
-                    file://hash.c;beginline=6;endline=15;md5=e77f77b12cb69e203d8b4090a0eee879 \
+LIC_FILES_CHKSUM = "file://Copyright;md5=fec7ecfe714722b2bb0aaff7d200c701 \
+                    file://dict.c;beginline=6;endline=15;md5=2b4b7b827d2d8b080372433c4c9c85b6 \
                     file://list.c;beginline=4;endline=13;md5=b9c25b021ccaf287e50060602d20f3a7 \
-                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f"
+                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f \
+                    "
 
 DEPENDS = "zlib virtual/libiconv"
 
@@ -19,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
+SRC_URI[archive.sha256sum] = "a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.39.2


