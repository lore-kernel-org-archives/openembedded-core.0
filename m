Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5399.1792845268377413950
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 05:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uA2kouGc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B02EC4E412EE
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8675760769
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94F1810328FE8;
	Sat, 24 Oct 2026 14:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792845266; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ipD7sVxVuvh+H724kDaSG9T2yErirHh+FBXuwjTBxCI=;
	b=uA2kouGcvoPKMyybUtutvDg2uA1uqxqYm2C+myNPohbINw5Cnl9x98YBwEKPPMJ+DeN6eI
	XCLMB8W5bhMTKkMel68PaYGgSmq61JeUMN8nkHb33UrZkSeL/zdVaBX2jB4J9YDBRK8uKk
	WN7pdXb/O5D4gPxAqqTE9fwjDvYzXYSXcw3qvw5wIzQ92RqMQV3IKW9rHz0C2IbnL/XqQT
	q+5M5lbGPtk4NCYyh9V2noRXYrHhCFRjeQrNjLvikXRb/rh5EQM8Fn6vg2xBCZNmPIAuFn
	QhFXdx7/RktkP76lXgFuNSfMwbp5p+r4LwM5pKxMULh6sO8OSjGF2AdYOy1+hQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 24 Oct 2026 14:34:10 +0200
Subject: [PATCH RFC 1/3] sstate: Replay warnings and errors when restoring
 from sstate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-mathieu-debug-replay-v4-v1-1-fc591ec473a7@bootlin.com>
References: <20261024-mathieu-debug-replay-v4-v1-0-fc591ec473a7@bootlin.com>
In-Reply-To: <20261024-mathieu-debug-replay-v4-v1-0-fc591ec473a7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792845263; l=5710;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=euHvwC+Ij3a7eabKphfjdGJFmkNuRbL9qZcX9E1SIYQ=;
 b=0yUfme2Y9YfApfWc7EhgJpcg2HroCn4dh+eZzVMprMndRUNbM4954tOzIpTTlqOdpTxecVqX9
 cdC+sUaO/QdCo99cjvRksvF3xoWmcn553S71RK8UXg04WWNz+SIzaku
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248588

Save the messages logged by an sstate task into its sstate package
(sstate-log.json, with build-specific paths replaced by @VAR@
placeholders) and replay them when the package is restored from the
sstate cache, substituting the paths of the build doing the replay.
Errors are saved too, since bb.error() can be called without failing the
task, so warnings which previously only appeared on the first build (e.g.
QA messages) are now shown again on sstate reuse.

AI-Generated: Uses opencode (DeepSeek V4 Flash)
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/classes-global/sstate.bbclass | 83 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index b2fa93650ab8..fe14022bc09f 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -101,6 +101,12 @@ SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
 EXTRA_STAGING_FIXMES ?= "HOSTTOOLS_DIR"
 
+# Build-specific paths substituted in replayed task log messages. Keep the
+# order longest-path-first: a shorter value is a prefix of the longer ones
+# (e.g. TOPDIR is a prefix of TMPDIR, HOME of both) and must be substituted
+# after them, or it would match inside their values.
+SSTATE_LOG_VARS ?= "TMPDIR DL_DIR SSTATE_DIR TOPDIR COREBASE HOME"
+
 # Check whether sstate exists for tasks that support sstate and are in the
 # locked signatures file.
 SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK ?= 'error'
@@ -200,6 +206,54 @@ def sstate_state_fromvars(d, task = None):
     ss['fixmedir'] = fixmedir
     return ss
 
+def sstate_log_strip_paths(d, message):
+    import re
+
+    # Replace paths in log messages by placeholders, so we are not leaking
+    # build paths and can show consistent paths on replay.
+    # Escape literal '@' first.
+    message = message.replace('@', r'\@')
+    for var in d.getVar('SSTATE_LOG_VARS').split():
+        value = (d.getVar(var) or '').rstrip('/')
+        if value:
+            message = re.sub(re.escape(value) + r'(?!\w)', '@%s@' % var,
+                             message)
+
+    return message
+
+def sstate_log_expand_paths(d, message):
+    # Add back paths into the replayed log messages
+    for var in d.getVar('SSTATE_LOG_VARS').split():
+        value = (d.getVar(var) or '').rstrip('/')
+        if value:
+            message = message.replace('@%s@' % var, value)
+
+    message = message.replace(r'\@', '@')
+
+    return message
+
+python sstate_save_task_log () {
+    import json
+
+    # Save the messages logged by this task, so they can be replayed when the
+    # task is restored from sstate. The records are written by bitbake right
+    # after the task body, before the postfuncs.
+    mytask = d.getVar('BB_RUNTASK')
+    recordsfn = os.path.join(d.getVar('T'), 'logrecords.%s.json' % mytask)
+    if not os.path.exists(recordsfn):
+        return
+    with open(recordsfn) as f:
+        records = json.load(f)
+
+    tasks = {mytask: [{'levelno': levelno,
+                       'message': sstate_log_strip_paths(d, message)}
+                      for levelno, message in records]}
+
+    logfn = os.path.join(d.getVar('SSTATE_BUILDDIR'), "sstate-log.json")
+    with open(logfn, 'w') as f:
+        json.dump({'tasks': tasks}, f)
+}
+
 def sstate_add(ss, source, dest, d):
     if not source.endswith("/"):
          source = source + "/"
@@ -387,11 +441,12 @@ def sstate_installpkg(ss, d):
         # All hooks should run in the SSTATE_INSTDIR
         bb.build.exec_func(f, d, (sstateinst,))
 
-    return sstate_installpkgdir(ss, d)
+    return sstate_installpkgdir(ss, d, replay=True)
 
-def sstate_installpkgdir(ss, d):
+def sstate_installpkgdir(ss, d, replay=False):
     import oe.path
     import subprocess
+    import json
 
     sstateinst = d.getVar("SSTATE_INSTDIR")
     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
@@ -402,6 +457,28 @@ def sstate_installpkgdir(ss, d):
 
     sstate_install(ss, d)
 
+    if replay:
+        logfp = os.path.join(sstateinst, "sstate-log.json")
+        if os.path.exists(logfp):
+            with open(logfp, 'r') as logfile:
+                logdata = json.load(logfile)
+            records = logdata.get('tasks', {}).get(d.getVar('BB_RUNTASK').removesuffix('_setscene'), [])
+            for logentry in records:
+                levelno = logentry.get('levelno', 0)
+                if levelno < bb.msg.BBLogFormatter.WARNONCE or "message" not in logentry:
+                    continue
+                message = sstate_log_expand_paths(d, logentry['message'])
+                if levelno >= bb.msg.BBLogFormatter.ERROR:
+                    bb.error(message)
+                elif levelno == bb.msg.BBLogFormatter.ERRORONCE:
+                    bb.erroronce(message)
+                elif levelno == bb.msg.BBLogFormatter.WARNONCE:
+                    bb.warnonce(message)
+                else:
+                    bb.warn(message)
+
+        bb.utils.remove(logfp)
+
     return True
 
 python sstate_hardcode_path_unpack () {
@@ -686,7 +763,7 @@ def sstate_package(ss, d):
     if d.getVar('SSTATE_SKIP_CREATION') == '1':
         return
 
-    sstate_create_package = ['sstate_report_unihash', 'sstate_create_and_sign_package']
+    sstate_create_package = ['sstate_report_unihash', 'sstate_save_task_log', 'sstate_create_and_sign_package']
 
     for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
              sstate_create_package + \

-- 
2.47.3

