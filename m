Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E8CC07D5A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:17 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.91600.1701080291531739930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9GGerce;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a011e9bf336so550777266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080290; x=1701685090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaJiiVjcni57c3zek6VKdf4USKXatzmMCjFjglOT6Og=;
        b=R9GGerceAo9QaRV+MtbfXBCtCFka+eiMYbS9+0kNO/ky8xvLjDgwuAdhTznVfJCc5f
         OfhG+huTSTdAe8IDqgN6FXiRyp+4X2MY5ckTXkyAK+2h4di1SJQbktqPpiTnjbp09Unt
         7LDoPurMHaeLzoo8l8+xfmDg98UxNf4YKSXdM38zLF/zDniFBVfla7HNJcGL77mVDT8w
         nsj7iQ+0oJFcTJkmrTb1JA0yOLeMw9jd4pWduDHUub8/UAKm3sq/zM5Bir/qGuwF4zya
         mqsKxLK6Ap99/czq4tXvcLZ3hF8Dkzh77e3qHTtGH39DtEmNG1o4VJ8obtCfDcCUsksn
         XhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080290; x=1701685090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaJiiVjcni57c3zek6VKdf4USKXatzmMCjFjglOT6Og=;
        b=V8g6Ne5VavleKiZhcftrICufeIzjZEV6DErEGhx35b6jHf4VeVulsHa2efpUTlPSD3
         1s8MaCFFpz6bLgAeKC4xpSI4Gwstydul1YeA9Qx9zr0yog/2ClDrZw1jcDQIr4icqg6M
         ABstfmX4WdIZ2AyOuDWuTS9n9J8SanNAFTtneiv45+qdP0I1hx2kVfZww1Pq03C097R3
         ztDoEKKdM9xJA4+B9XIGAjtg2XXMXLoJwANxE6/thjBfPqz+QTlLbqqlZFzejWOPHz1o
         3Sh4LNzeYGqcluq2PuZQGJHAXw2XHQyWsgj4fjla5x4pZgCA93ELjB+ICULu8fvgayMz
         1DbA==
X-Gm-Message-State: AOJu0YxCSRzbomZpIeg9UluXKTvrqvzIKfrNQ29MPs7b7PpXIVSsamQK
	wwoRTHZlPhZ8cyL11WsVmwuoL5BX80g=
X-Google-Smtp-Source: AGHT+IGmLr5xWdiNmEBpZx4EuWhjN/PKJP1LkLyFQcsfULSwXOJgbAJF/LNILJs95p5uM1/bj46KlQ==
X-Received: by 2002:a17:906:71cd:b0:a01:c7de:9704 with SMTP id i13-20020a17090671cd00b00a01c7de9704mr8122502ejk.68.1701080289726;
        Mon, 27 Nov 2023 02:18:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/19] rt-tests: update 2.5 -> 2.6
Date: Mon, 27 Nov 2023 11:17:51 +0100
Message-Id: <20231127101751.3187950-19-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191286

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 6 +++---
 meta/recipes-rt/rt-tests/rt-tests.inc                       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index e9967767a0f..a1fc9e26a03 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -1,4 +1,4 @@
-From 174fd202f2c85e43261139d71ad18908cc29b586 Mon Sep 17 00:00:00 2001
+From 7cf4cf097895bd4c3f3d3a6f783c766b3173cf1a Mon Sep 17 00:00:00 2001
 From: Randy Witt <randy.e.witt@intel.com>
 Date: Fri, 16 Oct 2020 16:54:30 -0700
 Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate [other]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 4df61ec..a229986 100644
+index 223a839..a735584 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
- VERSION = 2.5
+ VERSION = 2.6
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 527e14ad546..70315c46941 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "4579b9a6d85ae528f76e92421eb5e7b33cd26b17"
-PV = "2.5"
+SRCREV = "217cd8518c5f7777d490892aa9c765a6b2782cb5"
+PV = "2.6"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
-- 
2.39.2


