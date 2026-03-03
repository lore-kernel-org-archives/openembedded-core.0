Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00D4EB3652
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 00:46:03 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7693.1772498761309840376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 16:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wpg9qWdB;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-464ba2bb3aeso4012552b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772498760; x=1773103560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=Wpg9qWdBIUqb28o5fmhdYIWUd5axE3xKqTXAgedjcbSaMib3FRsppxgh4sYoEn2EdX
         /fChspOznfo413Tq57sGx1uH0vqVsUYrc7dbT6GSm9+cmxlPZdmwThegAjHk5eHY/w7D
         iJHyQU6NvhqcPiyH7bCCllG/exINi1gcY6+bfrfrk6tMWjpkgIx9UAH+C+gTcV76NGio
         9UHCKMQi5oNG9juMgpK2FYcnLDM7WzradD3C4vB30iLZjXKMuIrMj9uhGvekCEby/9ih
         OrbU4ZiGXE4zUHh2Oss2FpeHp9BOWRmGbnA1SYXG/yVGGxeyrQwZR73JSC9svNwDqP3k
         2gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772498760; x=1773103560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=uiFLoiO5RTYqcltMQbouVlSP1LKietxfH0OQFGIoQVChVsilLzSKDk3YSJrC7k3rpv
         SiAL0rV4fSTKZi93Zvvip7ReQJantEqZBOes/oxCsoqe/HeoWU10q1wK6bF3mkk5GvWV
         6GiPfbYeYZLcENpEEaKK5gj1z9eoK0TmzmSHeCoRAh/g1SSe/45Xgp6uLO2jzamgRDeE
         mhfU1MZQ6iE2TDy12dse/XrxqjHWpjZejQWPmVxNdnzpgNnNrRPJKniNwWkWXyBHLy2F
         S7LoOeUIYN/W9t9NvQ9E7QkMvd2a61uADGDeNWowa9Uaf4s1RVR1dxcTPmlcyYexG64g
         RT7Q==
X-Gm-Message-State: AOJu0YzUzk7AI2Qz8nnPznpXYGsEeVbx9uAmvEPaezwWk1oFwJNy0vOq
	ZdGb9EWwaO32XMpQ8XWfmYlSzUH7UEPgk06AFNvyV7iUtFUgN+Z+21bJNzOIeA==
X-Gm-Gg: ATEYQzzleM9stCAp0pVn0oxOJsQaSqwa6hrZWdi3F8IKgupq2uA0sGJ4ZDi8sS4APFD
	KOUDsn6f+JIZTkXMZw+2L//CiG7tYTKpNNW7C/4JBYI/fAwnS4M9ryCkTupKC6cI71yDQGEi1V3
	ePECkMg7Z35PWduCujVhotY+/q6J93sJ75GoEoi98KDKLln/U5jxqYwkjXVfC9QG6glIgj1/c+x
	kGagKzyJzOWgRcVlLB/JfS44M+gF/gRq2UbYoRYMdUFTzfxj6hs5mobikLzVQNvdm8D1B6HyTub
	gvV3fhbLEvPZ7+xmBbiP/B7ISZL/35RogFCcHDqWgN6OAomqy9JBdbGO4ePS9iEYCOc3LXbPbIC
	p0/03PKrI00yQH/vEMQICTkm8/njl+uLsK04YsaKbPkUxlk0l6OAuYtHY12LGg8KFKJmIZaiQDw
	qEAQxh7rpS+URjPytVVDyl
X-Received: by 2002:a05:6808:2383:b0:455:eba2:9efa with SMTP id 5614622812f47-4650c625651mr186337b6e.4.1772498760426;
        Mon, 02 Mar 2026 16:46:00 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb59b66fsm8637446b6e.10.2026.03.02.16.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:46:00 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 8/9] spdx_common: Check for dependent task in task flags
Date: Mon,  2 Mar 2026 17:43:55 -0700
Message-ID: <20260303004550.650726-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303004550.650726-1-JPEWhacker@gmail.com>
References: <20260226173930.2847872-1-JPEWhacker@gmail.com>
 <20260303004550.650726-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 00:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232231

Checks that the task being used to detect dependencies is present in at
least one dependency task flag of the current task. This helps prevent
errors where the wrong task is specified and never found.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx_common.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 72c24180d5..3aaf2a9c8b 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -96,6 +96,17 @@ def collect_direct_deps(d, dep_task):
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
 
+    # Check that the task is listed one of the task dependency flags of the
+    # current task
+    depflags = (
+        set((d.getVarFlag(current_task, "deptask") or "").split())
+        | set((d.getVarFlag(current_task, "rdeptask") or "").split())
+        | set((d.getVarFlag(current_task, "recrdeptask") or "").split())
+    )
+
+    if not dep_task in depflags:
+        bb.fatal(f"Task {dep_task} was not found in any dependency flag of {pn}:{current_task}")
+
     for this_dep in taskdepdata.values():
         if this_dep[0] == pn and this_dep[1] == current_task:
             break
-- 
2.53.0


