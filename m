Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE98C3DA50
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:23 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.11471.1720800196894726960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G4H8EJ8c;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b53bb4bebaso1106880eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800195; x=1721404995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZBWMwwd9l76frSVWBofn7BnkyRG+ITkf3ToQYJlNsg=;
        b=G4H8EJ8ce14OQOGz0GNJBZU0zGJcp57TPfR7kv0p1bhjIdrXDXkPyt/f4o4oFmZcG1
         NrGQLewk8NvfWSM6HcefQof3fpMSkylXVEIVVE3O4uHXMBMJ/9KIsOwS5G7bBeUWGSru
         0SqO5pe8UWt9C3uUnBVM0pD65/f3RgI+9WqD+/eB36zKkjvP6Qq3l0EDQ67n+MIVnGK8
         N0O0P5FcFLfi5GdFV3ZrpJlC3RBiT/gGSzp9Lkk0y35dHvr6XPcBLsUJxfqIDYsVXp0Z
         HalKGKPRRBneWPd9rUpSHJrgunVBaZUeao/36Riz0zAuZkw+6QYTI5Ze8GP7/dD0Fpev
         22Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800195; x=1721404995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZBWMwwd9l76frSVWBofn7BnkyRG+ITkf3ToQYJlNsg=;
        b=QuW3gz07RbnLCpAiuyR5azORo7MCi3VFbAgtmDid5BhhPZwmFK/b5wgD5uD4TH/Vsu
         vV1SoPf9hliUSfG5ahBC/wFNtiwibBLfGO6T4A6BuU71gO0qCF7OiUsy1Ph4IX5kFcv5
         mk8HWfrNyBa3iWABlg2Yx2806FY8uOUULUg7Hd084KcTHCpSelgDkgctlkRyyQAO7Mrm
         qG6DojoylotP6eOb7zb9Qor/WRiTWxqsMsqUYHu9FsLXgTW1BjyFZCHjF87F/fAy2+SL
         PN1pE0gAVipWuEAce10hiLdTkyEa1r/U+toXkLPJLy1UQhn3YSRorlTNulmowNxOK4r3
         j5SA==
X-Gm-Message-State: AOJu0Yy1bkmkgMIzE7sv2GPK7arxSBgpPTipTfEfDqwo/D13UhbuGPdk
	FL7rMLtK+lWGFUuMwV6vJ8Qi/rJCuV0HtxKv4F04jFmO+RN4xdvqg/ZQjQ==
X-Google-Smtp-Source: AGHT+IEs8Y9DastxkCWHDRrtgHmjEylnEe/jXanfZGGp+CvDcnZqisyxrPPfTmUZ8B/2+ZOPnT4KrA==
X-Received: by 2002:a05:6870:2a4e:b0:24f:c715:a4d4 with SMTP id 586e51a60fabf-25eaebdb167mr10058517fac.40.1720800194857;
        Fri, 12 Jul 2024 09:03:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 04/12] classes-global/staging: Exclude do_create_spdx from automatic sysroot extension
Date: Fri, 12 Jul 2024 09:58:14 -0600
Message-ID: <20240712160304.3514496-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201838

do_create_spdx is a outlier in that it doesn't need the RSS to be
extended just because it depends on do_populate_sysroot. In fact, it
only depends on do_populate_sysroot so it can see the actual recipes
sysroot, and attempting to extend the sysroot can cause problems for
some recipes (e.g. if a recipe does do_populate_sysroot[noexec] = "1")

As such, explicitly exclude do_create_spdx from extending the sysroot
just because it depends on do_populate_sysroot.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/staging.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 3678a1b4415..c2213ffa2b4 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -652,10 +652,17 @@ python do_prepare_recipe_sysroot () {
 addtask do_prepare_recipe_sysroot before do_configure after do_fetch
 
 python staging_taskhandler() {
+    EXCLUDED_TASKS = (
+        "do_prepare_recipe_sysroot",
+        "do_create_spdx",
+    )
     bbtasks = e.tasklist
     for task in bbtasks:
+        if task in EXCLUDED_TASKS:
+            continue
+
         deps = d.getVarFlag(task, "depends")
-        if task != 'do_prepare_recipe_sysroot' and (task == "do_configure" or (deps and "populate_sysroot" in deps)):
+        if task == "do_configure" or (deps and "populate_sysroot" in deps):
             d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
-- 
2.45.2


