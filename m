Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC64C6379F
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:21:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.3137.1675840910086201632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EMiO8qc6;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso741451wms.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEmTRFdr0K9xleGc/hFx+Shs0ydvKnbX+PxME1ANz18=;
        b=EMiO8qc6ycR9DhuCA7QEHkZ3Y6qk1x65SraH/89vio2OhwoELrs2EfEOnCCS3MCFGu
         88OEJZVxpzaJjWQuhPWYDgNMMDByr/gtQW655uw4iZECGbc40sUmNOv5KBlPDXzFZh6n
         W3NbhC0fEFkcnf3rKoFwypUh4w+w6+VzKdBrwYZgS4xUprafksFbfdaJZsMB1MzhA5n1
         RNOC4XUZxIdOyRrbgPx+yFy5B5dd4pD0HfEtDnm/W4eP2sIfDFSwMqUcPNETYoXXKla4
         rsrWd+gVMYSIswFeMJfCJTOA+XDgGEtalCknZAhhzjI2kj//3UKzSlyJyiVXecgdsYJf
         BANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEmTRFdr0K9xleGc/hFx+Shs0ydvKnbX+PxME1ANz18=;
        b=v2nBA2W68yRTVBum3f+TS2XT1o6m6fkuRb//JwQF/WD6BF12gfm6hJU4Pi+jffRPZV
         tefWKOgArAOWBrnH5hoKdket4aYGCOued4DV+J3Lf0FRQ5RHMTlXydVp9NF0Xf5ypGOJ
         FiJuBsBqioov8UJv8i/9tKN5cqanfyw0bpdEOG4JZg9SJXnnWg8hvDynridH1T2/JaHX
         Bhf3ZLrM+5DiNWgiFgvGrQU93YuW2XGMbeb4lZGz73i4/Ag2FaOWQZRrjH4mvvWBAVkM
         aOdAE35RYaqY3+vrA7j3JDceUnDYacjsKS2Bcd8su0IPnw8JQi4gC+9rFzsOLIUV4sfG
         jFFA==
X-Gm-Message-State: AO0yUKUQoZiC0GvE6d54NYo7ZUD39OVXk/PK4YnhwtD08qy2sMIq63uT
	H5UDG1eDDi4GEH5vxxbLPO+ZT72NfyI=
X-Google-Smtp-Source: AK7set90NZqFLCZlyGFCVIihSnP8bEJZw6GjkdNHt1k/Ixu4IJFLfsrWYt6YC57UUjG5i1WiuZ7y0Q==
X-Received: by 2002:a05:600c:18a0:b0:3df:3bd6:63e5 with SMTP id x32-20020a05600c18a000b003df3bd663e5mr5308588wmp.12.1675840911434;
        Tue, 07 Feb 2023 23:21:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/52] rt-tests: update 2.4 -> 2.5
Date: Wed,  8 Feb 2023 08:20:58 +0100
Message-Id: <20230208072143.2930292-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176846

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 6 +++---
 meta/recipes-rt/rt-tests/rt-tests.inc                       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index 5410ec94e9..e9967767a0 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -1,4 +1,4 @@
-From 5a7caafe04cac805b5057db2632b0defe703eacd Mon Sep 17 00:00:00 2001
+From 174fd202f2c85e43261139d71ad18908cc29b586 Mon Sep 17 00:00:00 2001
 From: Randy Witt <randy.e.witt@intel.com>
 Date: Fri, 16 Oct 2020 16:54:30 -0700
 Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate [other]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 3fbf882..04d3c0f 100644
+index 4df61ec..a229986 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
- VERSION = 2.4
+ VERSION = 2.5
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 93fa390bba..0481bf6028 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "ca4a6293da23ad0fd708ea1fecb2d465a9ea6093"
-PV = "2.4"
+SRCREV = "4579b9a6d85ae528f76e92421eb5e7b33cd26b17"
+PV = "2.5"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
-- 
2.30.2


