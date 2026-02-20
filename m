Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3A7C5AC9E
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:41:49 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.322.1771602106299635682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nw6awIB6;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-66f3e7d9eccso1160601eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 07:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771602105; x=1772206905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LF6odpk95FsjyxMBfzPbzwWYGWajjqW2u5EdOHPcbC0=;
        b=Nw6awIB60uC2ZRQENxkFjSBjXCyo9d/TsZ5V2NlSgPAvJKZP/po4dWFxW47CjEhzwD
         7x6MTP5fQFHIVDySNqlClBK2ykfhwI+GqMjn5/OV8Y+jsZHN7nQx+1IqzJOGAqmt7Ibl
         uELCg/DF29WebbjjYylXW61BGaWMqpQGOJBU3IX77fjqsJucm8IHcXUT1Te9r7uPAHti
         wjkJs8t8uPeoaSyj/bKyIlrALs+lJtouhRf7WTJnbJR/ZQN2/phE7hpkY8EyRjxSvsBR
         Ni1ZJNfNpkWcODqBMuri+960Z40swfkD5vohfUQ6dGT2odWdQmfgMRzcjULVAco46nqO
         +flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602105; x=1772206905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LF6odpk95FsjyxMBfzPbzwWYGWajjqW2u5EdOHPcbC0=;
        b=cd+TeASMoqjFhNi2NzqtlFbpmoturm8UzyyKXR8xc6scI2CMd7Zu9CBbmDWa9ZJ+In
         ON54SdZM+MGYGN8aWJrS5fcl6vPb1xRk7pVgyJlq8hR3PCTi4prrcalrY6aQAh1CtmQo
         c/0tEcYk5oWzeYmsVkLVgRLqjwSNAXudug4xKt4HyTNnkXpvkZ8EzukjcwAufeMTODbZ
         fUJVRtqVOtvW2P3SUljjlqrB0Fd/GFOMV10NNL8CMtEWCPStiqaTU5bsUBKhDXvR3yYe
         T6Pot8ZdImuGvq1qL8StvbA39o1cSXHrQubD1JthbC9Z45fb/Zssqzbtphqf63axpEij
         CGbA==
X-Gm-Message-State: AOJu0YwptNUHYkHv5RLwLH0IjIa4poiqzlxk+/Mnzcjzv6LrNhjFRMbB
	R+BFPSg1F3ACDhh3L42ukfMgFq05jTIrUHyPmW5LpUzsAgMCVhxHOkT2JCbn5w==
X-Gm-Gg: AZuq6aLQX1g8lVOS7oxiXEhsibA+Mzb4uUfyoJd0jQwMDo1LejvLkCCrUQmyIbLrmXh
	mbY0AnYmE+QXF9HQHYMPUH6JKvvWQ/h4ePADEJFpik85SeVA6ZX8fvfTvnv9tqI8tOl7GSfcGrU
	HR6g28OabmL8STsIiRKXcv6U8Z6QTIfiaGa8LcTj6at8Ymv7ipQBCSs+VlS9nL7c5gVVioOuTo9
	X1N/0rmXbp5cXwwda0HhQkGfNiRdnYRP7aRH7oq9DRl6dY5t/PzD5cwlxBdRBQ4Mlpw310DKqn/
	Svkm5IWpOocPwRdvV8fGE/40tknp8Q6hTivqR2QmKkZ5Y+kIiAUMVYxJZsyxlEXI4XkAvMfyIAE
	SIFLvFYWibTNtTio1eZL0kPDYhh8BWgMpV+Mf+6jEAvQa3k8/LNLRQZzvQsMDGmbCZT6jmvUgNV
	uhbPAj3LDKTV8jllbtFbtGX/InjVDrSPM=
X-Received: by 2002:a05:6820:2222:b0:677:fc0b:c5 with SMTP id 006d021491bc7-679c44d3634mr149676eaf.31.1771602105301;
        Fri, 20 Feb 2026 07:41:45 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6772583294bsm15127188eaf.14.2026.02.20.07.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:41:44 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 9/9] spdx_common: Check for dependent task in task flags
Date: Fri, 20 Feb 2026 08:40:44 -0700
Message-ID: <20260220154123.376880-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220154123.376880-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 15:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231528

Checks that the task being used to detect dependencies is present in at
least one dependency task flag of the current task. This helps prevent
errors where the wrong task is specified and never found.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx_common.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 03863ef362..9d39b5e9ac 100644
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


