Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42543C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:16 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.51787.1720015275815939638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c7UOymAa;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7f61549406eso205267239f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720015274; x=1720620074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZBWMwwd9l76frSVWBofn7BnkyRG+ITkf3ToQYJlNsg=;
        b=c7UOymAaRkYjVcHj8eiaLQE0rSHsNZPDmjnZOmluzeqPVN0dkyli/Gp5faogE9ovLj
         HRJjlEWKTTeAF93ApxlaheaNNIy0LfZzP00eWsx/JRrKIjCoZuEVCYW/LfTw7a+JCr5W
         cikre4reYjB1HHO3WEA2ilMSCxDRRSYeyHXB5qCEnlGxk83ABoukxePntyu4RGI59wyb
         4GxshsPvjgwXtjwmYwB8i7Ma0TXu6zrGdO3hm3WroTVLlhfnEbxNGYJ5Zyf9sKAzugFU
         iS+3wlxmtnPMhZ4PgvorhU1U2d6unQREOc3lx89fXn/qdkjZ+yK4SVTTCKxIyPyJa9uf
         tEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720015274; x=1720620074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZBWMwwd9l76frSVWBofn7BnkyRG+ITkf3ToQYJlNsg=;
        b=W03ZkYZOCjumrDVKgnHhbRfKzIp4tn2Hh4dFHn0y4bFQzttcTgLE6M+egVK8FnMjzA
         u+ERp+Rtr8+RqN1gEfvremiu8Baly3rckIEfwOsWIzUPn5JrBf21Fubdfz9ZYWcb3lj4
         QxQJhjc48/13DYEWvpmDQooE1AASLdJEWaFtq9UhPftUot7i4n0xXeFVUZaieCPhaRhT
         s9Wl3/yH+yich70FliduWdem5XV+V5TXBQyYt3Z6edjRmIuqUN4+QE96zVLvBUnUTpxb
         WqT1onknEXm1s2S/ro0NNabgLIwKXgYeLJDbWBPVcugjDDuTghKwD4T4oXwaARERxRIr
         RacQ==
X-Gm-Message-State: AOJu0YxRktIhkj9OWT9bXkDC5Ex8SOTbKCUO7MJE+P0wROWdhZyAjYjn
	i6LaQsQTSMgSJR80EaXc5w5U4wJdjm8EJsrPa/D4IjxVGw8gTZCYEYi5cA==
X-Google-Smtp-Source: AGHT+IHkbVCOgoe/bBPcW40kABhm5Um1LNU//4lX6X6AeV7891KBjCbnBLK7P0sXVCre2gkUuCt+IQ==
X-Received: by 2002:a6b:6113:0:b0:7f3:a7d9:5922 with SMTP id ca18e2360f4ac-7f62ee0c850mr1339114939f.8.1720015273849;
        Wed, 03 Jul 2024 07:01:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f949])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb742f1e77sm3407500173.179.2024.07.03.07.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 07:01:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 4/8] classes-global/staging: Exclude do_create_spdx from automatic sysroot extension
Date: Wed,  3 Jul 2024 07:59:19 -0600
Message-ID: <20240703140059.4096394-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703140059.4096394-1-JPEWhacker@gmail.com>
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
 <20240703140059.4096394-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 14:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201484

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


