Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5891.1794742442279273059
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 03:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qOnFb1Ac;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9E30C1A166F
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:34:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BE1860238
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:34:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A51E711BC1170;
	Sun, 15 Nov 2026 12:33:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794742439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6OAfOiPh94rIzQD7Ken3qafTn1znEBkfdc3rd7fD5o8=;
	b=qOnFb1AcQl3Mul4t07HU81gMVSRVlREp6vXIaRt8E98TkMtiq2DD5qywzU/2JWBSUt6zUM
	cGzgq/rx72Df3kxDeat17eggZUDhKKM7TmunsxJ9W26jpQ0TkMXKsBTtc2gwGaLyaPMKh3
	ov20m+2eCwWrw2Rka7k8k9X+b7IXjcGZ9IDC2MFiSvDCP3Zmit2P1MCwF3Lg+SlJp85n8S
	vzMTJtAVxvleQlwebIqHzv6w6ejquu2nEsCXL2fq7+wl+9HFF2bsI/ZNjU0AFjaLw8ihFr
	YGoqVmdj6FthmGJLNvdM0NvZ8M27YecvBr7eQXaDfs2/tJUVklHKojU739lJxA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 15 Nov 2026 12:33:54 +0100
Subject: [PATCH RFC v2 1/3] sstate: Replay warnings and errors when
 restoring from sstate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-mathieu-debug-replay-v4-v2-1-8fbfc07058b1@bootlin.com>
References: <20261115-mathieu-debug-replay-v4-v2-0-8fbfc07058b1@bootlin.com>
In-Reply-To: <20261115-mathieu-debug-replay-v4-v2-0-8fbfc07058b1@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794742439; l=5871;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=WZxP2FUMNaSK9vidP6wtE7aLtSvn7miRA7NQKbG/yKg=;
 b=muThwQIHX3Sz3J6b+KSOUYBMgY/zGQw/w4uJqB4yQtwJxALkTfVAHBt2v8k1m1MOtSQSUOnpo
 vy5XIZ2eeWvAwSSbYfWMjIoaHAUlShRmuIZVss+aR44/KGUnh3Odxh8
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250274

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
 meta/classes-global/sstate.bbclass | 91 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index c6d945918232..ed88dae17202 100644
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
@@ -200,6 +206,73 @@ def sstate_state_fromvars(d, task = None):
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
+def sstate_log_save(d, record):
+    # Raw logstore entry (a [levelno, message] pair) -> archived record
+    # (dict), with build paths replaced by placeholders. Inverse of
+    # sstate_log_expand.
+    levelno, message = record
+    return {'levelno': levelno, 'message': sstate_log_strip_paths(d, message)}
+
+def sstate_log_emit(d, logentry):
+    levelno = logentry.get('levelno', 0)
+    if levelno < bb.msg.BBLogFormatter.WARNONCE or "message" not in logentry:
+        return
+    message = sstate_log_expand_paths(d, logentry['message'])
+    if levelno >= bb.msg.BBLogFormatter.ERROR:
+        bb.error(message)
+    elif levelno == bb.msg.BBLogFormatter.ERRORONCE:
+        bb.erroronce(message)
+    elif levelno == bb.msg.BBLogFormatter.WARNONCE:
+        bb.warnonce(message)
+    else:
+        bb.warn(message)
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
+    tasks = {mytask: [sstate_log_save(d, record) for record in records]}
+
+    logfn = os.path.join(d.getVar('SSTATE_BUILDDIR'), "sstate-log.json")
+    with open(logfn, 'w') as f:
+        json.dump({'tasks': tasks}, f)
+}
+
 def sstate_add(ss, source, dest, d):
     if not source.endswith("/"):
          source = source + "/"
@@ -387,11 +460,12 @@ def sstate_installpkg(ss, d):
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
@@ -402,6 +476,17 @@ def sstate_installpkgdir(ss, d):
 
     sstate_install(ss, d)
 
+    if replay:
+        logfp = os.path.join(sstateinst, "sstate-log.json")
+        if os.path.exists(logfp):
+            with open(logfp, 'r') as logfile:
+                logdata = json.load(logfile)
+            records = logdata.get('tasks', {}).get(d.getVar('BB_RUNTASK').removesuffix('_setscene'), [])
+            for logentry in records:
+                sstate_log_emit(d, logentry)
+
+        bb.utils.remove(logfp)
+
     return True
 
 python sstate_hardcode_path_unpack () {
@@ -686,7 +771,7 @@ def sstate_package(ss, d):
     if d.getVar('SSTATE_SKIP_CREATION') == '1':
         return
 
-    sstate_create_package = ['sstate_report_unihash', 'sstate_create_and_sign_package']
+    sstate_create_package = ['sstate_report_unihash', 'sstate_save_task_log', 'sstate_create_and_sign_package']
 
     for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
              sstate_create_package + \

-- 
2.47.3

