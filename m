Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C404103E189
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:47:10 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14411.1773841625043908134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L5lBhIby;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-67bb17938d5so481644eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841624; x=1774446424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=L5lBhIbyw+9aJChVQKxpObOXPtuFufsCM2xf8w/ut0e69DbuS9KKpicga0oaIsJoFJ
         gMJbFZmwva3Fn7mdjsCiCMtvs9kuQ/1Q8sAof/eKPKM+VziLvtV34OWVR/DmuwI8eJln
         dBvNJ3sF2b2OEZC9z+imREVsf0sDK5BDKtr5WtKEeZQSbCj3eDAY8/r5GDFDLPOlOo0l
         OHiLrtKpyC5TTEjDJOgxwc6VSKzpu0tjXF2CbIZARVFRxxom0TaRnj+2KSutSERcUVcN
         OSFObJCKqwMw6PTj2016fOZbLGI1z6LLOCPdzwtk4hQdeuV7f6tVNOsVqY0JsTqSNxFi
         +g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841624; x=1774446424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=o8FXYQiwaAAK7WLVFV23MlVHzHRx3RuC+YgrChvE0Ek9bskwXm7Zlc4PiP9Z6rPNrT
         +rL+MXmmOLbKMXcW8NCuZNEpWogO53awyK1a0bCe7rKkFpdbExkJ7OPFmxmZIPHOf3Ev
         LGTvGWyaLmKVlhZrMtpFnp3NF7q3YRybF16N5KTYFnBr8WPFMd1lZXc1xXEm51LRnOoO
         EqpVQtHaWQ5UJowDr22memoyBTiGvJ81bkP7gvMQC5yCGxLvisYNfKSxRacxp+zgxfD7
         se+8XHUXTF4OUv4+Lo8d5AHk0Fror8rcY6R6YaGCzZjLkS1AEYjYZpTTnuiszsvZgMY9
         7DRw==
X-Gm-Message-State: AOJu0YzFqkpOfzul44kNJ/EM0Ff13nOB1mLbxGijhITfX7pbIuu0dgFL
	B3UX6yhzeoQpHApa1+wdZ6CX/MvbcAweYf+6Pv9i838ZBNaoko2gqk015KP9Zg==
X-Gm-Gg: ATEYQzwqogGYQaqceQ/37Np5KC3Ku2KmUuqsAyBcDsWicWH4pETO8yvjZ7wauLGR30l
	b9DOJNDgcbWdNkH1/80MUr7PHR7bi30ThfRtm+1qnjgqaH8SnwzqVKQjXUSALDNXhefJx5Hurmp
	aylIMzs+5Rh8zJUAXCYtPmWVM1wHb34hn9o4dgQx6BH6P+LAuK6dXWkdnnhGW3QxSW4jf40VP4I
	yfe+kB6fKuLZDyZ4TIo5LSAGoohU4P/If9nxxJZCiT1Oqc90R5XwNkyUOTN9LUvzGkN/1SvAvJ2
	lsnRkHvYoad+mK6sBv9Gx7Hu4O+Fj9mP25yC7JGnKY+eZMZjXMYIUGWU68QR7KV9rjM4QGZcdi6
	nR15iyPyiR3/M5gj6afCYP6Wyg126yCR+JPSzr1V15xjsctfazNH7ESK6qVf/ahP1nkCkNWIGc1
	ePLj/s/B/ajZbnrA2Jl89k
X-Received: by 2002:a4a:e901:0:b0:67b:af79:4c28 with SMTP id 006d021491bc7-67c0da70e69mr2398651eaf.13.1773841624001;
        Wed, 18 Mar 2026 06:47:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::8279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89c739sm1763625eaf.13.2026.03.18.06.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:47:03 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 06/12] spdx_common: Check for dependent task in task flags
Date: Wed, 18 Mar 2026 07:44:34 -0600
Message-ID: <20260318134655.953233-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318134655.953233-1-JPEWhacker@gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233396

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


