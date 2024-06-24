Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2FFC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:32:10 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.150917.1719257528238910337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SX+fWjKc;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3d21f7cc6c0so2658012b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257526; x=1719862326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1umlNIyxvuUMaI+gYEzgZHiHArD0JPLN7b6s2b4Hs7g=;
        b=SX+fWjKci63FgT10KTaHobOpu8lV35VLrmEQZ6M4yRCuIhniWL8BbLUFn+aSF8SFAb
         jm5D5ZBgOiQO3LdmHwwR3hNJSTqs9bFrETIAL97SiPbBBWKa6UDmXnWztWUH1NWKYgFM
         xU7Q3HO6d+b6+bc5xD23Ib9+Pfoy5Zc9SxW7otfQyMf0A8wI96dhMjKO6UeWIXzpH+m/
         f3gor1h88LQmrX3ghaorqeeV8uxZx7W86N0kDvSqpIKCZUYQgmhPyh7TPOGkREDh613M
         fb7sbsqlvitDX3b2YH3k5yB6pS1VTMuO4THVKJvlnRG/PzYNCTnSrzej7ce1v/2jF0IM
         apkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257526; x=1719862326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1umlNIyxvuUMaI+gYEzgZHiHArD0JPLN7b6s2b4Hs7g=;
        b=VQwlLH7pXkR/Hb0ocTxTLuq94EX7SDUmC7BY8tBozpf6l6SdbYElTxA83T0oonavOx
         yIE13beQlMRUTrpjDPnp6k7WxW5uo8a+JN1uzGuj6cQYejVaybQU4pO6NXaZt30RHL+d
         j2Z8xJ2e9nyFBWkrk8Tf/pMq7z4BiDPNbKZtMekM6M58A6W0uu5xhV+z130/svGfMEeg
         02lO4Bk446ojSw47FbRX7VPZs/3EvmHflcfVVOQ3Lgr7Pw4DjJlLOg3Tg9gADkyFeIKX
         42lAJAhmRqF5GVUS1kYVJd6dSfZcfLDw8z/XbUaDPy0o8ybwx2DyoKk3E5xh6Y7Fzc/d
         Sfrw==
X-Gm-Message-State: AOJu0Ywhe4SxrkvPnIMsd3NZvyf86y2fAdIfOf/naP9TyU7QvBQzzAiz
	0OSDRPGwlbFTvUzE3qfjuDOsOpJ2rxhj36rFN4U7tla3kq6b/u3OLkX9lA==
X-Google-Smtp-Source: AGHT+IEoObl72vOkPLPceQpdcaRE47USX8IeyyyfEZeZr6djQ1UEEl+biFVLn8MOnwwiVMXcbHMPDQ==
X-Received: by 2002:a05:6808:200b:b0:3d2:27c7:21b8 with SMTP id 5614622812f47-3d541d35650mr7361842b6e.37.1719257526315;
        Mon, 24 Jun 2024 12:32:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa91csm1586711b6e.19.2024.06.24.12.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:32:05 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 04/10] classes-global/staging: Exclude do_create_spdx from automatic sysroot extension
Date: Mon, 24 Jun 2024 13:10:54 -0600
Message-ID: <20240624193151.1645802-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624193151.1645802-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201105

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
2.43.2


