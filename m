Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8714ECD98F0
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:17:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5801.1781637428316903285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JexVzFoS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so32341185e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637426; x=1782242226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNXo4uGgy1Ze+whLvvY1evTgDmT/TSqlDPuSfc/ieDU=;
        b=JexVzFoSgJBMnksH5O5ZRfxRk3ZyGmPWkw5NCNMNx2wPa2VEoWe9UnWDj3tHUWYuFY
         x2hZsxHfdmCcBah5xUJXbDttOvITv1OVWiq/MVJPmVsR7+1XKRvkl10HVvQVu/xAllvE
         iINzbLgh2LLPeaFvODou9hmHDlOukRgodgy4qFnmHRC0UAG7OKfpw456wpQLHFJuTzmr
         wZNkloz5d4wUcsseB2XeL2wIUPT02gYX4vbId7ow4kvNufbGyjsK7qHJjCJA0Bq0XNG1
         dJoAAMKYi/nGDvoU0i/1KQejBH3F42BQZrTfSd+hkxXlwSvvME4/ZTlHZl0a27ZxlALV
         /yJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637426; x=1782242226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RNXo4uGgy1Ze+whLvvY1evTgDmT/TSqlDPuSfc/ieDU=;
        b=Z/9s2hv2fzl02cmZyuEUhtuUe+yuS3WZceufCwE7bssD33v/miJxkhi3TGGzj+WRep
         7BmhrnClhWJYq4HEl6t6E0BLCYr04DidZS8d+scryxto64kpVd9jZ0biRKUBUUJZxALF
         RJU+GrHpXGw68X1FCHNuQKlh3I1CCOWDy/fdBhGXaa3QDmsvFhJjLQcAPhAyNZIUyIud
         T/9QNqDmqsXPfALG2bvnehjVnY8JCEy487X1tIByehRNty+S45NazCsRaaeJpRphWqc3
         X/DFZKwyZuzUm6y7fSvXy6hhgmaFDCDQ5xagHo8UU0gaTCVCuz+BgabuOJe7YJrxkyx+
         6jPQ==
X-Gm-Message-State: AOJu0YzrlZcvhvgrXaOkCYbQI8DWcfV5iSM4Cz4E5r4fLXGLXUQ2xogS
	U+7pIrYmKo/Sf+TUsh+irYy8TGdiOP60/3O+djuhNNHnkc7xGv44kpE9ZRveI3dN
X-Gm-Gg: Acq92OGlzvT8no5C0ag1xNF/aUHl/Qx6J+zamc6C0N2oDqBuzOrPg/H/OToPleUhoeK
	rf3/b6Ti6EkpLVWHTTvlbktxfuC512f1FbCvMMYtCNSDJhwXJ+VI69RA+Fo18C572iYDskB5SDP
	7oVwd4e2zLDziLvyTqcYuwefg8uHDVP0VRbvR77nADxz656OxMP1waBUcH/K0tIvakWDz5lX5FB
	I4qjSheobFin4UjX1kQjyBMTJdx6n5VWnNh2X0nlL3xdiyWqA0zH4qXxuXf5kGm6zOUkZlx/CwX
	K/mtIXj5eFVwFnQtwmo61KTCsxi462s8eSlXPOgpglG8aV2SBBloy1UPV9FIr16snVzUfsCip7h
	1lZbxdRhB7zolX3EMoAJYm1Cs6qt3pWGuM6VKKOazjeXbwT+h163m4ggkCLjVJnhyISX7cv0CnG
	f5kSWtJjrdlXWaswLTS1mLwpIJM/PKBItxtTSrpLfX8EWOsipK4dSRTNzMhl96keurzkGQvA==
X-Received: by 2002:a05:600c:c113:b0:490:ea88:9d4c with SMTP id 5b1f17b1804b1-492333df02dmr12000615e9.32.1781637426290;
        Tue, 16 Jun 2026 12:17:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:17:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/30] tcf-agent: upgrade 1.9.0 -> 1.11.0
Date: Tue, 16 Jun 2026 21:16:24 +0200
Message-ID: <20260616191628.2014553-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238953

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../tcf-agent/tcf-agent/ldflags.patch         | 22 +++++++++----------
 ...tcf-agent_1.9.0.bb => tcf-agent_1.11.0.bb} |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_1.9.0.bb => tcf-agent_1.11.0.bb} (98%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
index d701e8dec0..9a911051e6 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
@@ -1,29 +1,27 @@
+From 2132bc5206b5d619c74caa391bc00d6f91d6ebe2 Mon Sep 17 00:00:00 2001
+From: Abdur Rehman <abdur_rehman@mentor.com>
+Date: Wed, 26 Aug 2015 19:18:11 +0500
+Subject: [PATCH] tcf-agent: obey LDFLAGS
+
 We need LDFLAGS to be respected otherwise there are QA warnings as the right
 flags don't get used.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From d92af0483c20365fd0af740d0baef8870b4aa374 Mon Sep 17 00:00:00 2001
-From: Abdur Rehman <abdur_rehman@mentor.com>
-Date: Wed, 26 Aug 2015 19:18:11 +0500
-Subject: [PATCH] tcf-agent: obey LDFLAGS
-
 Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
 
 Rebased to 4a2c4baaccbc8c29ce0297705de9a4e096d57ce5 version
 
 Signed-off-by: Mark hatle <mark.hatle@amd.com>
-
-
 ---
- Makefile.inc |    2 +-
+ Makefile.inc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: agent/Makefile.inc
-===================================================================
---- agent.orig/Makefile.inc
-+++ agent/Makefile.inc
+diff --git a/Makefile.inc b/Makefile.inc
+index 63f062b2..5da23c02 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
 @@ -111,7 +111,7 @@ NO_LINK_F   ?= -c
  # Linker definition and flags
  
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
similarity index 98%
rename from meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
rename to meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
index 132b3d7dee..6e9c7fc0ad 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "EPL-1.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "9076423f959d53aafa4000d6bb8bf2a1485971b9"
+SRCREV = "3051a4806ac4b041ec7c49ffc6d07f0014b8480c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master;tag=${PV} \
-- 
2.47.3


