Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5875.1794742442920271422
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 03:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SHxhwZhz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4CA8E1A1670
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:34:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AB0660238
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:34:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42B6811BC1D63;
	Sun, 15 Nov 2026 12:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794742440; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rx+hOStkKyYo63TIvdofFhjS2Ad/e8BqrgoroiQdx2U=;
	b=SHxhwZhzlZshgretdBcovdVuJ0inaJup7COQMLcBlssfAygRH+vyQ74K7Gntvyk6uKwMHz
	3J2eUB95ktK5WBCkxqVOP3CqXHEhiv+VeiOpQADg5ct5tVa6nzc9uEQzi358ER2C6fQ/Dp
	LM+cfCcsI/XZLsq5tC4QRpr1+j+SnhD/rqmo2I0/UrC1Ng96DbMmC4JQTOskXiveAKJAm3
	QZuGIRriCWOyTcBMGzJtkruRdbsWKTSGODR0qDD6eQjoWs2tB5OPsYwVdgLin0r2hkNqxm
	20IuDS7KPrNkIbnbgFTtl0rLwV2zG8Yy8jMqLiyM9Lght0eLFz9lISAvlUmNqA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 15 Nov 2026 12:33:55 +0100
Subject: [PATCH RFC v2 2/3] sstate: Replay the records of tasks covered by
 setscene
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-mathieu-debug-replay-v4-v2-2-8fbfc07058b1@bootlin.com>
References: <20261115-mathieu-debug-replay-v4-v2-0-8fbfc07058b1@bootlin.com>
In-Reply-To: <20261115-mathieu-debug-replay-v4-v2-0-8fbfc07058b1@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794742439; l=6756;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=N9Z1ouAio57Rx1IqLfLN2ZQBpc64T02YBVrX9Mrz7IM=;
 b=iV1rjFkqFfOsVo8W+ywjpa/SrMP1NZZ8U4+SqJezKo+eBKhDeR50stx68zSv/zwzw50fcfoAf
 WpueBfz9TOUD/fROxEt5+25muGJ1OA4pjSMlZCytghDuPsIVtuYWin/
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250275

Tasks which are not sstate tasks (do_configure, do_compile, do_install)
are skipped when covered by a setscene task, so their messages were never
shown again on sstate reuse.

When creating an sstate package, also bundle the records of the non-sstate
tasks this task depends on, from this recipe or from others, read from the
location returned by logrecords_path(). On install, replay the records of
the covered tasks bitbake assigned to this setscene task through
BB_SETSCENE_CLAIMED_TASKS, so each covered task is replayed exactly once
even when several setscene tasks cover it.

AI-Generated: Uses opencode (DeepSeek V4 Flash)
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/classes-global/sstate.bbclass | 103 ++++++++++++++++++++++++++++++-------
 1 file changed, 84 insertions(+), 19 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index ed88dae17202..c7a21310003c 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -206,6 +206,10 @@ def sstate_state_fromvars(d, task = None):
     ss['fixmedir'] = fixmedir
     return ss
 
+def sstate_logrecords_path(d, tid):
+    recordfn, taskname = tid.rsplit(':', 1)
+    return bb.utils.logrecords_path(d, recordfn, taskname)
+
 def sstate_log_strip_paths(d, message):
     import re
 
@@ -239,6 +243,11 @@ def sstate_log_save(d, record):
     levelno, message = record
     return {'levelno': levelno, 'message': sstate_log_strip_paths(d, message)}
 
+def sstate_log_expand(d, logentry):
+    # Archived record (dict) -> raw logstore entry, with path placeholders
+    # expanded back. Inverse of sstate_log_save.
+    return [logentry['levelno'], sstate_log_expand_paths(d, logentry['message'])]
+
 def sstate_log_emit(d, logentry):
     levelno = logentry.get('levelno', 0)
     if levelno < bb.msg.BBLogFormatter.WARNONCE or "message" not in logentry:
@@ -253,24 +262,84 @@ def sstate_log_emit(d, logentry):
     else:
         bb.warn(message)
 
-python sstate_save_task_log () {
+def sstate_replay_logs(d, logdata):
+    """Replay the log records of the tasks this setscene task was handed via
+    BB_SETSCENE_CLAIMED_TASKS, plus its own task.
+
+    Fold each task's records back into the shared logstore (always, even
+    empty, to clear a stale entry from an earlier native run), so an sstate
+    archive created later in this build still bundles them although the
+    tasks were restored rather than run natively. Then emit them for the
+    user.
+    """
     import json
 
-    # Save the messages logged by this task, so they can be replayed when the
-    # task is restored from sstate. The records are written by bitbake right
-    # after the task body, before the postfuncs.
-    mytask = d.getVar('BB_RUNTASK')
-    recordsfn = os.path.join(d.getVar('T'), 'logrecords.%s.json' % mytask)
-    if not os.path.exists(recordsfn):
-        return
-    with open(recordsfn) as f:
-        records = json.load(f)
+    claimed = (d.getVar('BB_SETSCENE_CLAIMED_TASKS') or '').split()
+    filename = d.getVar('BB_FILENAME', False)
+    claimed.append((filename + ":" if filename else "") +
+                   d.getVar('BB_RUNTASK').removesuffix('_setscene'))
+
+    records = []
+    for task in claimed:
+        taskrecords = logdata.get('tasks', {}).get(task, [])
+        logrecordsfn = sstate_logrecords_path(d, task)
+        bb.utils.mkdirhier(os.path.dirname(logrecordsfn))
+        with open(logrecordsfn, 'w') as f:
+            json.dump([sstate_log_expand(d, e)
+                       for e in taskrecords
+                       if 'levelno' in e and 'message' in e], f)
+        records += taskrecords
+    for logentry in records:
+        sstate_log_emit(d, logentry)
+
+sstate_replay_logs[vardepsexclude] = "BB_SETSCENE_CLAIMED_TASKS BB_FILENAME BB_RUNTASK"
 
-    tasks = {mytask: [sstate_log_save(d, record) for record in records]}
+python sstate_save_task_log () {
+    import json
 
-    logfn = os.path.join(d.getVar('SSTATE_BUILDDIR'), "sstate-log.json")
-    with open(logfn, 'w') as f:
-        json.dump({'tasks': tasks}, f)
+    # Also bundle the messages of the non-sstate tasks we depend on, from this
+    # recipe or from others: they are skipped when restored from sstate, and
+    # bitbake picks which setscene task claims them (BB_SETSCENE_CLAIMED_TASKS).
+    taskdepdata = d.getVar('BB_TASKDEPDATA', False) or {}
+    sstatetasks = d.getVar('SSTATETASKS').split()
+    mytask = d.getVar('BB_RUNTASK')
+    # The running task is always an entry in taskdepdata, under its own tid.
+    # Reconstruct that tid from BB_FILENAME and BB_RUNTASK.
+    filename = d.getVar('BB_FILENAME', False)
+    start = filename + ":" + mytask if filename else None
+    if start not in taskdepdata:
+        bb.fatal("sstate: cannot identify task %s in taskdepdata" % start)
+
+    loggedtasks = {start}
+    seen = {start}
+    todo = [start]
+    while todo:
+        for dep in taskdepdata[todo.pop()].deps:
+            t = taskdepdata[dep]
+            if dep in seen or t.taskname in sstatetasks:
+                continue
+            seen.add(dep)
+            todo.append(dep)
+            loggedtasks.add(dep)
+
+    # Every task writes its records right after its body, before its postfuncs, to
+    # the location returned by logrecords_path(), so the files of all dependencies,
+    # including from other recipes, exist here.
+    tasklogs = {}
+    for tid in loggedtasks:
+        recordsfn = sstate_logrecords_path(d, tid)
+        if os.path.exists(recordsfn):
+            with open(recordsfn) as f:
+                tasklogs[tid] = json.load(f)
+
+    tasks = {}
+    for tid, records in tasklogs.items():
+        tasks[tid] = [sstate_log_save(d, record) for record in records]
+
+    if tasks:
+        logfn = os.path.join(d.getVar('SSTATE_BUILDDIR'), "sstate-log.json")
+        with open(logfn, 'w') as f:
+            json.dump({'tasks': tasks}, f)
 }
 
 def sstate_add(ss, source, dest, d):
@@ -480,11 +549,7 @@ def sstate_installpkgdir(ss, d, replay=False):
         logfp = os.path.join(sstateinst, "sstate-log.json")
         if os.path.exists(logfp):
             with open(logfp, 'r') as logfile:
-                logdata = json.load(logfile)
-            records = logdata.get('tasks', {}).get(d.getVar('BB_RUNTASK').removesuffix('_setscene'), [])
-            for logentry in records:
-                sstate_log_emit(d, logentry)
-
+                sstate_replay_logs(d, json.load(logfile))
         bb.utils.remove(logfp)
 
     return True

-- 
2.47.3

