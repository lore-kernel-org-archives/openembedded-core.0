Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5400.1792845269208778076
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 05:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=w7yqc24L;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 588144E412F3
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 218F060769
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5742D10328EDB;
	Sat, 24 Oct 2026 14:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792845266; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pbIuq3MNoTcLFqoeLlH/y/CfM+bwgaWPv7uVWm6lzb0=;
	b=w7yqc24Lbu878g3x8ZQus140mYGIMpptaIusTZOfH+ihTFjkqPkD+eS4ZP2JB6fmOYR0rD
	cU0cyWVXaOeBRWqaYH9nX+RhUoYxDPTcm4ncnaKPUKmkc+qT7bH5gAlPHeXhNHeNkkLJoR
	kd2k5qom8aeVfpqryzumptvFQUF7kics2hlzkh4NuO/q5XcS+9cCeElNily/ocMNfIiE7G
	jOz3WQTL2tXN0DUhKnWJlCbHfweitmOSF59erFpX5xXlGPCjWaFIdhKTh+sAsnm6A+PRYC
	A2CZOgeBesLHXob87F5aVTJxCsmWrK6T5uSPJAuZr5Ucj26rJtJEXpBDUaclDw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 24 Oct 2026 14:34:11 +0200
Subject: [PATCH RFC 2/3] sstate: Replay the records of tasks covered by
 setscene
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-mathieu-debug-replay-v4-v1-2-fc591ec473a7@bootlin.com>
References: <20261024-mathieu-debug-replay-v4-v1-0-fc591ec473a7@bootlin.com>
In-Reply-To: <20261024-mathieu-debug-replay-v4-v1-0-fc591ec473a7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792845263; l=4987;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=GTI7nMIkgNTKlmgpxV55ojjUWHXkJlhwTIs9ayoAUxw=;
 b=GPrFGrguPunMjxuPTWuoG0DXkjfAvzBRsn0nLCeu0McX3j5VSRr7ow/d0nFAOzP631dEk6ZRd
 wzNuPwBt8U3BmdAzsvXOhMAmEgvf2Bb53mtkgIqOIZxghHAX5mRM7XJ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248589

Tasks which are not sstate tasks (do_configure, do_compile, do_install)
are skipped when covered by a setscene task, so their messages were never
shown again on sstate reuse.

When creating an sstate package, also bundle the records of the
same-recipe non-sstate tasks this task depends on, read from
${T}/logrecords.<task>.json. On install, replay the records of the
covered tasks bitbake assigned to this setscene task through
BB_SETSCENE_REPLAY_TASKS, so each covered task is replayed exactly once
even when several setscene tasks cover it.

AI-Generated: Uses opencode (DeepSeek V4 Flash)
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/classes-global/sstate.bbclass | 67 ++++++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 17 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index fe14022bc09f..a157ad5cb461 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -235,23 +235,50 @@ def sstate_log_expand_paths(d, message):
 python sstate_save_task_log () {
     import json
 
-    # Save the messages logged by this task, so they can be replayed when the
-    # task is restored from sstate. The records are written by bitbake right
-    # after the task body, before the postfuncs.
+    # Also bundle the messages of the non-sstate tasks of this recipe we depend
+    # on, as they are skipped when this task is restored from sstate. bitbake
+    # picks which setscene task replays them (BB_SETSCENE_REPLAY_TASKS).
+    taskdepdata = d.getVar('BB_TASKDEPDATA', False) or {}
+    sstatetasks = d.getVar('SSTATETASKS').split()
     mytask = d.getVar('BB_RUNTASK')
-    recordsfn = os.path.join(d.getVar('T'), 'logrecords.%s.json' % mytask)
-    if not os.path.exists(recordsfn):
-        return
-    with open(recordsfn) as f:
-        records = json.load(f)
-
-    tasks = {mytask: [{'levelno': levelno,
-                       'message': sstate_log_strip_paths(d, message)}
-                      for levelno, message in records]}
-
-    logfn = os.path.join(d.getVar('SSTATE_BUILDDIR'), "sstate-log.json")
-    with open(logfn, 'w') as f:
-        json.dump({'tasks': tasks}, f)
+    # The running task is always an entry in taskdepdata, under its own tid.
+    # Reconstruct that tid from BB_FILENAME and BB_RUNTASK.
+    filename = d.getVar('BB_FILENAME', False)
+    start = filename + ":" + mytask if filename else None
+    if start not in taskdepdata:
+        bb.fatal("sstate: cannot identify task %s in taskdepdata" % start)
+
+    loggedtasks = {mytask}
+    seen = {start}
+    todo = [start]
+    while todo:
+        for dep in taskdepdata[todo.pop()].deps:
+            t = taskdepdata[dep]
+            if dep in seen or t.fn != taskdepdata[start].fn or t.taskname in sstatetasks:
+                continue
+            seen.add(dep)
+            todo.append(dep)
+            loggedtasks.add(t.taskname)
+
+    # Every task writes its records to ${T} right after its body, before its
+    # postfuncs, so our own file and the dependency files all exist by now.
+    tasklogs = {}
+    for taskname in loggedtasks:
+        recordsfn = os.path.join(d.getVar('T'), 'logrecords.%s.json' % taskname)
+        if os.path.exists(recordsfn):
+            with open(recordsfn) as f:
+                tasklogs[taskname] = json.load(f)
+
+    tasks = {}
+    for task, records in tasklogs.items():
+        tasks[task] = [{'levelno': levelno,
+                        'message': sstate_log_strip_paths(d, message)}
+                       for levelno, message in records]
+
+    if tasks:
+        logfn = os.path.join(d.getVar('SSTATE_BUILDDIR'), "sstate-log.json")
+        with open(logfn, 'w') as f:
+            json.dump({'tasks': tasks}, f)
 }
 
 def sstate_add(ss, source, dest, d):
@@ -462,7 +489,11 @@ def sstate_installpkgdir(ss, d, replay=False):
         if os.path.exists(logfp):
             with open(logfp, 'r') as logfile:
                 logdata = json.load(logfile)
-            records = logdata.get('tasks', {}).get(d.getVar('BB_RUNTASK').removesuffix('_setscene'), [])
+            replaytasks = (d.getVar('BB_SETSCENE_REPLAY_TASKS') or '').split()
+            replaytasks.append(d.getVar('BB_RUNTASK').removesuffix('_setscene'))
+            records = []
+            for task in replaytasks:
+                records += logdata.get('tasks', {}).get(task, [])
             for logentry in records:
                 levelno = logentry.get('levelno', 0)
                 if levelno < bb.msg.BBLogFormatter.WARNONCE or "message" not in logentry:
@@ -481,6 +512,8 @@ def sstate_installpkgdir(ss, d, replay=False):
 
     return True
 
+sstate_installpkgdir[vardepsexclude] += "BB_SETSCENE_REPLAY_TASKS"
+
 python sstate_hardcode_path_unpack () {
     # Fixup hardcoded paths
     #

-- 
2.47.3

