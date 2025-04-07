Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C73AC369A4
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.43305.1744018856667554667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AytyEuMn;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so33610995e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018855; x=1744623655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85gLOCQ1XraZAXS6NhOvyuwYaw1NefVa5O75GQfFszY=;
        b=AytyEuMneiZNwHd82qK4lSr4Ui/AmIvN0M1KMUCi/sJBKW0ObYmlvtiXHiMFqfiPW+
         FeF4De4oq7pSFpciRrUzjLl5RgNRvZ73TrwP48P8VJ4eyKwkJL1cpOU+0fs3lCx6C0T3
         A02lMhtNz4wr0JElZVOogIX3VYySikPmELV2lCnB8zb35rQIr2AIeLR42gWB0PNkdW4P
         z6hwnZoVHvWI42BaBJEhyRcHCD6C/A3Kgb29HTUALvPRX42oaxf4TrjH0Y3T6xqLlo7S
         rSTF+jfUSof9ltDan5lzFC4q4LYZPH+6TY5QkxDK649QnLOWlTldVhUhb1WVJXg4RVEi
         nvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018855; x=1744623655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85gLOCQ1XraZAXS6NhOvyuwYaw1NefVa5O75GQfFszY=;
        b=WrAybXc0rXymyb6D8XCRKqwpAUwZoEXyrmX82HtawXVGEeWj3zep5GNE1St3EcGaS4
         9AYhWwxskFA6ChiffGWLtknf7MrvJnTy1heRJLJLoFah+yefBajFcgVs32hJ/0KF7ZBk
         G0XCxRKIYHXYjf9jazBPuXoXe1axfVrYVVykfCFD7QPgmRTTMCxK3ESFrJh3FeBu6eZo
         tp4IUssq6Oru/xqZbLhKPKIRjUoJW6CMde8vYekwv4D06WJgxW+c6BYgxPEccsWOsuPL
         ONAkeuU7rO6l7Mkzbn7WF7+cehvgSG/7Zl3hQn434KWFYDQBCyjPUWLDX7tVBzqYi/52
         Td+g==
X-Gm-Message-State: AOJu0YzoYC1xzv08Q1wzo6q7m4+WBXp1pp5CUGr6DoTEetyqvfcKHSLT
	Ropba3KETuDMcm2WRBA7yTxI4atoRbymjZm3vWwmOfroP8MxC5Mm4j9jjg==
X-Gm-Gg: ASbGncsgleVzA7u5ZaUWB/s8AFPdkvN3pYfc+CGpJCgzUsIV6+Nu1l5lsExjAAdomNP
	7J6yV3ZTIRy0uhJnMty6WYsQUjvit1appgWtzNtMnor2etDlHbponL7mbx8gMmvFWGNopIDWA0a
	ilXCE+YvTwnA1w+dMvG/HccFxTzU+q728DbhvKe6kiJJeRMp0PXRcC9QbK8NsndoR5PKBfb2iS1
	SYep/0/6OkX9VV+4jXgRurDgJ8mULQ6hpyJIr4rUmWWkTXRT0hJ+0kNdBjCKqsvemjKOB+mz/ls
	R8hsvcN5inC8iu4LtqXK62wi53fhCQDQmtfG6GAWM1eh7bIcwLT8WqDxs+XIukj2GIqqSDbDcns
	lMvPaiA==
X-Google-Smtp-Source: AGHT+IG1/DUT67R6dIBB/rz9bZsynENhjL10mrRuwmxTDrIx1pfUci0foIDicC4H1rkdAHMRlB6vtg==
X-Received: by 2002:a05:600c:6990:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-43ecedc1cb8mr110645005e9.6.1744018854530;
        Mon, 07 Apr 2025 02:40:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/18] tcl: provide a description for shared library name fixup patch
Date: Mon,  7 Apr 2025 11:40:35 +0200
Message-Id: <20250407094045.753021-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214417

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
index 343209ececc..cefcb24433f 100644
--- a/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
@@ -1,9 +1,15 @@
 From 822a73a5dec13549cb20e6c7338b059ece2ea95a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
-Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
+Subject: [PATCH] tcl: add .0 to libtcl.so filename
 
-Upstream-Status: Pending
+This patch is fixing the issue after the fact; the issue
+is that upstream defines the shared library filename as
+libtcl.so (without version) for all platforms in unix/tcl.m4,
+and I (AlexK) suspect they won't be interested in
+changing that.
+
+Upstream-Status: Inappropriate [see above]
 ---
  unix/Makefile.in | 5 ++++-
  unix/tcl.m4      | 3 +++
-- 
2.39.5


