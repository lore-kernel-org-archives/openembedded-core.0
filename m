Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE9CC46CA2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:44:23 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.39800.1702889055833327407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:44:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IdQUk8Ix;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a2363e4f996so23678166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 00:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702889054; x=1703493854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nDHmBbAIJvsZgBWNxwA7mhh6S1bqL6N7QUu1IwG3P/I=;
        b=IdQUk8IxXXl5oMrOzfiYtUda0BvJR3cBO9P+cD8fuvI9Gkt+aEEJAsiaxgTqMqW25d
         fIY6OOW6ooZSVdkN7q7120GgncXjghgtYw64+mWqYWleoxJBC+uHcuftf49OBb8bFOhR
         /yA528EmPonM8k32YaC/ekvnB097jXPWVZ0Th87H0PTanmKON68QR5mKMpV0mwwMWa/Z
         wFqkMzygN2uh8jvmJT2YM6svDPUFqI068lWX3cN4ojDR+286bvJqQTw4TFi4wfMIDYCk
         6ecUM9v9cVbKXflRwm1SDRmuQ+/peiJaiHfsF6kq1rhwklkwqt84PlgYM2kLBJbgv1/U
         iwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889054; x=1703493854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDHmBbAIJvsZgBWNxwA7mhh6S1bqL6N7QUu1IwG3P/I=;
        b=IMN3U8PxAlNx4b5Lwj+8NGPQZSQLFd+enzFt8hBIymm114180ljGKAqv/aWghcB0Cb
         Dkxld31/dX8wu0gDMCqjtDi1iqzS1YI6NC90SADxtYseIk1IrSpu6QxW8xdxHdB42q50
         Fc9W9QZUoHfIubGqqbkmtyr8Km2TL+5WRfLH8BqvJd0m7VrJ7KIkQqkRYYFP2itmQ1Ej
         IQuSuzTTjsmPSp6Iu/btUi5q5l0vmIzdE27H4EfSke8lAoixBQ3fgZ8jV0nh8V3IyI8t
         U5Epmnb0QjvwwOk3tREtC57wBfTagIQenrEk195/PFc2icDug3AhEUblH8W0C7yTfV9Z
         moZQ==
X-Gm-Message-State: AOJu0YxPgW1+s9pqLvdu3PtqE2zrK1zAJiOfV2cJZ/eVlIRh5fIK8lac
	/m5ENHRYYmZhpX0rhXBbgT5eJBL9640=
X-Google-Smtp-Source: AGHT+IGzoUAKIF2+O2AP9vnyb47RVMb5u77wzeCc0gF8SW9SIzC62R2X+iW5WfyjvJgOSsS78AbY6w==
X-Received: by 2002:a17:906:73d0:b0:a22:f58e:ed09 with SMTP id n16-20020a17090673d000b00a22f58eed09mr4097919ejl.153.1702889054055;
        Mon, 18 Dec 2023 00:44:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vt6-20020a170907a60600b00a1ce98016b6sm14016299ejc.97.2023.12.18.00.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 00:44:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/7] bitbake/runqueue: rework 'bitbake -S printdiff' logic
Date: Mon, 18 Dec 2023 09:43:57 +0100
Message-Id: <20231218084403.599015-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192612

Previously printdiff code would iterate over tasks that were reported as invalid or absent,
trying to follow dependency chains that would reach the most basic invalid items in the tree.

While this works in tightly controlled local builds, it can lead to bizarre reports
against industrial-sized sstate caches, as the code would not consider whether the
overall target can be fulfilled from valid sstate objects, and instead report
missing sstate signature files that perhaps were never even created due to hash
equivalency providing shortcuts in builds.

This commit reworks the logic in two ways:

- start the iteration over final targets rather than missing objects
and try to recursively arrive at the root of the invalid object dependency.

A previous version of this patch relied relies on finding the most 'recent'
signature in stamps or sstate in a different function later, and recursively
comparing that to the current signature, which is unreliable on real world caches.

- if a given object can be fulfilled from sstate, recurse only into
its setscene dependencies; bitbake wouldn't care if dependencies
for the actual task are absent, and neither should printdiff

I wrote a recursive function for following dependencies, as
doing recursive algorithms non-recursively can result in write-only
code, as was the case here.

[YOCTO #15289]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/lib/bb/runqueue.py | 41 ++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 24497c5c173..f54d9b85541 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1685,6 +1685,17 @@ class RunQueue:
         return
 
     def print_diffscenetasks(self):
+        def get_root_invalid_tasks(task, taskdepends, valid, noexec, visited_invalid):
+            invalidtasks = []
+            for t in taskdepends[task].depends:
+                if t not in valid and t not in visited_invalid:
+                    invalidtasks.extend(get_root_invalid_tasks(t, taskdepends, valid, noexec, visited_invalid))
+                    visited_invalid.add(t)
+
+            direct_invalid = [t for t in taskdepends[task].depends if t not in valid]
+            if not direct_invalid and task not in noexec:
+                invalidtasks = [task]
+            return invalidtasks
 
         noexec = []
         tocheck = set()
@@ -1718,35 +1729,35 @@ class RunQueue:
                     valid_new.add(dep)
 
         invalidtasks = set()
-        for tid in self.rqdata.runtaskentries:
-            if tid not in valid_new and tid not in noexec:
-                invalidtasks.add(tid)
 
-        found = set()
-        processed = set()
-        for tid in invalidtasks:
+        toptasks = set(["{}:{}".format(t[3], t[2]) for t in self.rqdata.targets])
+        for tid in toptasks:
             toprocess = set([tid])
             while toprocess:
                 next = set()
+                visited_invalid = set()
                 for t in toprocess:
-                    for dep in self.rqdata.runtaskentries[t].depends:
-                        if dep in invalidtasks:
-                            found.add(tid)
-                        if dep not in processed:
-                            processed.add(dep)
+                    if t not in valid_new and t not in noexec:
+                        invalidtasks.update(get_root_invalid_tasks(t, self.rqdata.runtaskentries, valid_new, noexec, visited_invalid))
+                        continue
+                    if t in self.rqdata.runq_setscene_tids:
+                        for dep in self.rqexe.sqdata.sq_deps[t]:
                             next.add(dep)
+                        continue
+
+                    for dep in self.rqdata.runtaskentries[t].depends:
+                        next.add(dep)
+
                 toprocess = next
-                if tid in found:
-                    toprocess = set()
 
         tasklist = []
-        for tid in invalidtasks.difference(found):
+        for tid in invalidtasks:
             tasklist.append(tid)
 
         if tasklist:
             bb.plain("The differences between the current build and any cached tasks start at the following tasks:\n" + "\n".join(tasklist))
 
-        return invalidtasks.difference(found)
+        return invalidtasks
 
     def write_diffscenetasks(self, invalidtasks):
 
-- 
2.39.2


