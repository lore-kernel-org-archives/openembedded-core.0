Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7234C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 18:24:31 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.67.1716488671288284912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 11:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SLlECE5L;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6f0f252db4dso3420104a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 11:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716488670; x=1717093470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNnV6eUC2jD6Jq/17CS7S0wQ9CKbocEnBL4kM/9EXxc=;
        b=SLlECE5L95FuqwR8pDQgP6r6VSACgDZOVBDT1LnHccyHxmVhJHtVnVTOR5vgjyPt4T
         C5yICxsqAqjimzvGXhngowjAjUsTSJWiE12iR43NHvDjZ2saLAh/3N9777N+XiZGVbLa
         l6qZou1lZc7i38h0rK8QYmBHRjEyx0PCrz6C+V3snJQVKhnV0gIyTWnGpMuYzYxquYcU
         vghcVQOSbnXZan6sWWsCexemZH1DK/NLnJFgTbLzziypkYCZpXSAT2iwxD16a7wefgL3
         gf+g6wqD/rU2WJG9EIbp4DPpM0Qow0wRBjaC05MF3XBD5A/lHBwtnsXeeX3pBy2qh2yJ
         wo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716488670; x=1717093470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNnV6eUC2jD6Jq/17CS7S0wQ9CKbocEnBL4kM/9EXxc=;
        b=eyoPoo1vRsP2wjnBYjeqmyjOhKGuN6pmCPZdm6qhS4RGNKHlEqoGABHrYwt0MeP478
         hVXR+RVcaL1xkvsl/FqCDOgeVAgzBOgY1holhqDgqnSRbZf9LOUBGJSa/vfWripPSe9M
         b1h43bUdAxSKHYUnmy04iLqo9FnaesEvCF2HJAnvNgKV0y9F0oe6w+hbxApLXpwKdn66
         c5ND3fAJCJIKnzOYK2J8VMjcYDdkcCOwqgMCM9HYkoDw6OXHkIkBGZ+5lqej9NwngJ+h
         VfxZy8w9Y4xs8/9WTGdyHtpihbxcnEkTRduiZobPZxKxT1KQE11gQCcBKkxyNA3CePXZ
         uayQ==
X-Gm-Message-State: AOJu0YwC9QrseiGE3aBL50/C2dDeZ17NSxTmqh98PO5kiGus/GILjpkH
	IrkYU7+Gh/I+su+6yGvzUGoZ63UAIl+M6ddT+Br5qVcne1xN0TyfIkEU1Q==
X-Google-Smtp-Source: AGHT+IEKo0gXmkA0ck1y2zzW3JdCJ8UMTLBTi2XM7nNn4SjjYv8Cjc8/sugeU0HSAYndRGVK3y4cBw==
X-Received: by 2002:a9d:638b:0:b0:6f2:5e72:2a47 with SMTP id 46e09a7af769-6f665191a22mr6195913a34.1.1716488669884;
        Thu, 23 May 2024 11:24:29 -0700 (PDT)
Received: from localhost.localdomain ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0ff995ccdsm4493118a34.34.2024.05.23.11.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 11:24:29 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/staging: Allow tasks to opt-out of extending the sysroot
Date: Thu, 23 May 2024 12:24:25 -0600
Message-ID: <20240523182425.2254046-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 18:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199816

Adds a task flag called 'extend-sysroot' that allows a task to opt out
of having the sysroot extended just because it depends on
do_populate_sysroot. In some (rare) cases (e.g. SPDX), tasks only really
care about looking at the sysroot output of the local task, and this
allows them to do that without extending the sysroot.

Modify do_prepare_recipe_sysroot to use this new flag instead of being
hard-coded

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/staging.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 3678a1b4415..86cdacd307a 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -646,6 +646,7 @@ python extend_recipe_sysroot() {
 extend_recipe_sysroot[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
 
 do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"
+do_prepare_recipe_sysroot[extend-sysroot] = "0"
 python do_prepare_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
@@ -655,7 +656,8 @@ python staging_taskhandler() {
     bbtasks = e.tasklist
     for task in bbtasks:
         deps = d.getVarFlag(task, "depends")
-        if task != 'do_prepare_recipe_sysroot' and (task == "do_configure" or (deps and "populate_sysroot" in deps)):
+        extend_sysroot = d.getVarFlag(task, "extend-sysroot") or "1"
+        if extend_sysroot == "1" and (task == "do_configure" or (deps and "populate_sysroot" in deps)):
             d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
-- 
2.43.2


