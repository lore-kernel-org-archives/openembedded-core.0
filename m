Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50857C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:10 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9633.1633945266645565075
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jqZGgxrm;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id o20so54022554wro.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xDKTRaWQjJS5lMcuAt7cyGVPX/ozK1CY/M1hjFxwXiU=;
        b=jqZGgxrmt8N2bG9ViXJs0dISsART3jVWLrFPIG8h8lBbQDTDHvVdFUpbE8qVUYgWzn
         2LTuJlPe0MFdJXD3gAYPzD7OQRLX4Yl2ZfhYR2RFH/crBqt63u4B3kwrS5P9Bf08xPoz
         z80bRXfB4KG4DguLBZxy778WHmL79JGCTOOJ0camR86y+RWL3EUuA2MrYBAQVH0u9C5O
         xDmJ2gVV9UO6ziSGyuEznmO8YUmMPD1hoRTSSr9ujuaIStVb5p8hYxFBo7RRYf6QSReD
         xri3MW5CcImX+hXWgMoWh9oFxzehf55x2svudHCFYSHYU6ALmWd7hBNVosLQojX2NtPU
         Kc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xDKTRaWQjJS5lMcuAt7cyGVPX/ozK1CY/M1hjFxwXiU=;
        b=Nb9IGYh2CUeq7RxqwxObGc4JLS/GrugbxmDz3fc4Vf27vvieY9j7Zxx7rtKb8QoKZ4
         HedyVHsuPJzf7+CzUsyOruQSf5pNGG8FCxeZztjsl7CQmbAXFzVtimPD4gIiqoigjEK5
         TthLDi66G4Y6LNkfVBw7d9OQRXuso5iFBgc5HK5hoHKO+PWXv93eYTTf9HcuLlo4q5Km
         5d1oOCr0t6EixGr+yPZIG2CYwSt2i4V5pkhGAEErYR1xrX+ajT2WfiCi/utzDvceetOl
         hiktEghuLvqkNnMbhS1WhFRYGlufqaGtfQHQeUVA6RuKeeru2oyVD74iMtue9pmwBHWE
         vlsQ==
X-Gm-Message-State: AOAM532gd3TTbFPaC+Pcwxq50bnIyS6/BEMt1KOr94UQYg1/UEpZ02DE
	7bzIKwXVtn1jD9XQf5+XnETamOZZAsA=
X-Google-Smtp-Source: 
 ABdhPJxfT9MeQdGxgJhKvHPNBvZf0UmlpKR2KozClClA3y6MDyI/V3XaxdLEFBYAkRd7bHAgkpX2IA==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr8921281wmj.160.1633945264854;
        Mon, 11 Oct 2021 02:41:04 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/25] rt-tests: update 2.1 -> 2.2
Date: Mon, 11 Oct 2021 11:40:37 +0200
Message-Id: <20211011094059.4184654-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156816

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 6 +++---
 meta/recipes-rt/rt-tests/rt-tests.inc                       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index 56556dfe63e..1e8ff4619b5 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -1,4 +1,4 @@
-From 7b0ab10370cad38e26c5ffaaa55a1fd77fff0f18 Mon Sep 17 00:00:00 2001
+From 05ccf5045adf4248f29623ad0db2d2a55ae5cd06 Mon Sep 17 00:00:00 2001
 From: Randy Witt <randy.e.witt@intel.com>
 Date: Fri, 16 Oct 2020 16:54:30 -0700
 Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate [other]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 63cd77c..495d6bb 100644
+index ec5d693..ab8a8de 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
- VERSION = 2.1
+ VERSION = 2.2
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 5ce4d298b96..71227307c3f 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "667e1aae896f8448615b062d27c818b32cb960ff"
-PV = "2.1"
+SRCREV = "75c16956e32817dfb0d5cb7379e731061e16593f"
+PV = "2.2"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
-- 
2.20.1


