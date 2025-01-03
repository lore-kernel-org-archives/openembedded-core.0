Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F219E77198
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.27855.1735901133728282225
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aI8f5NGj;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43624b2d453so125558265e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901132; x=1736505932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlK0XM3nUYNgax3hWy922OjMf60Lp6YgCpshVwnMuAM=;
        b=aI8f5NGjqpJlXinTbAG8rctAc0/7iTS+zYOc6cOIb9iVqAAH6csvJn7aSASA6PjV/C
         OYoK7Xbt3iYrILPXC1qWDKUTnKygJfBtNvfPSBuduFhss8Im2JMkFxenqhKN7vQjgrYD
         V76CpTPDytvGl89VlOoT4Q0y19Ve3Fixq/RhtpKWiQQXYSncKn2iIMJWeSX6AxMPBlN4
         2LDZt+Q/KFseLb/Cd2k+UA+dNC+6s3UwJWvh/4V4RcxnZcEPgCrC4f9ijrCmoh+VhZnU
         rxokQ30zT7lXMxvDyfQmsSFvj7sT2O/GTkskPXLgMdzszl6WFeXDmn81FvsMGXKZ1Tbq
         bGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901132; x=1736505932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlK0XM3nUYNgax3hWy922OjMf60Lp6YgCpshVwnMuAM=;
        b=h5hKxW3w2S9xPVPnFMA6CAa5FwKJtznmNgXZHXaU0Ia2s8u7NodTgG0RftbRVsA7Qe
         qvybvYbLaUGN/ThGRHYMw2Dt82rpmKeHob30JZ0XJLibL1y7urX2RyPpRMMIT6pA578o
         U/qRlB1GG4pu/R5gTl/zImTre6/Ileb/IOK/qYTI0n8MQTEToRRng5n3ZH+FR6VwkpYU
         39PsoRNgZ36NEH6thAUgIMAmOLB4m6sfE7AJGGzXFhS7t0BOuyelzgHAzF6BZzjWsHAe
         srxVedT/KEoMaDel4kdR47wI2sARU/dOkWV9CtoCkUKa74WMvm3P2ZGpVOIsaS4VOdjr
         owhw==
X-Gm-Message-State: AOJu0Yx3JbvGSkI+o3RQDLwHrHd+6BodMFcdPFTFQH+bOZ0+N19M+z0d
	l0c9kZ6J0krI8K78rd80AdSi5OEE3km5MT8h/csbZrV9SI5xcVgugXDMdQ==
X-Gm-Gg: ASbGncvqFPaulfGhj0XAfUQe6bDIHj0fMeT925gOoqeDySbzikUDHsG00bvvw8Ac4Nw
	4uXH790CMruZC/E74mswddaJJQhaz7BvmekAeIMNPQmJ/HJSR8VfE/YmYYzMm6tZgrV+zNXBMym
	99hwVaG5QHVAed25XDPV8WIERpUQqFczNSZi756z4pRoq0cHl6pCKul7rhSeoa5gNAt+oVZeVvv
	CrAEnhRS3sBy6XvAEtJTuGWw45qI+CEHFDR+bLP4fY4z9L73ObkR4R4XqWmEnxWsyj4xYHvPTUW
	KqHHiAwO0wyVFYK5MA==
X-Google-Smtp-Source: AGHT+IEnYfJyi7fPENBMJ2azHBpFfR4r3QywgCBBNnz8to5iR0ESblol2LHClYqeSZA91Fv3A1OFSg==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436678f5775mr470515215e9.0.1735901131971;
        Fri, 03 Jan 2025 02:45:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/11] rt-tests: update 2.7 -> 2.8
Date: Fri,  3 Jan 2025 11:45:17 +0100
Message-Id: <20250103104524.4053846-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103104524.4053846-1-alex.kanavin@gmail.com>
References: <20250103104524.4053846-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209335

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch  | 2 +-
 meta/recipes-rt/rt-tests/rt-tests.inc                         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index d5bd7fe523b..fface76731c 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -19,7 +19,7 @@ index 223a839..a735584 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -2,6 +2,6 @@
- VERSION = 2.7
+ VERSION = 2.8
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 3fbdfa20381..f28258ef58e 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "5bd94923ffda2ab326d081926dbfc6775fb5050b"
-PV = "2.7"
+SRCREV = "f5b910a90b6f5ab0ef6df392e009ffe1429d53af"
+PV = "2.8"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
-- 
2.39.5


