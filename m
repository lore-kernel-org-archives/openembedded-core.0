Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.646.1594231347412046705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 11:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=JgOZsl1F;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 86C5620B4909; Wed,  8 Jul 2020 11:02:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 86C5620B4909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1594231346;
	bh=tdbLL3cUk/77j0qJEkK5Fnv5IMy/UiLoslpSDow8k8s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JgOZsl1FIA+5qv3cspCjveMerAyQyGo7w97X6vLyCPjr9KLGiz39d8cNtVpLwACpi
	 /xus/otMrjMcAaFTy+SOH3/n2e3p3eVT/JpRFR6VMO7B64vjKIWcFZu0QIjFmDN5Kp
	 jXu2ymD8DEODP46ehxbUjy5DwCMtYIO8LO6pMG9A=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/1] classes: add workdir_save class
Date: Wed,  8 Jul 2020 11:02:20 -0700
Message-Id: <8a17db382b6b7fde9d5dddebb0fc410dc35b5088.1594231229.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1594231229.git.paul.eggleton@linux.microsoft.com>
References: <cover.1594231229.git.paul.eggleton@linux.microsoft.com>

If you are running your builds inside an environment where you don't
have access to the build tree (e.g. an autobuilder where you can only
download final artifacts such as images), then debugging build failures
can be difficult - you can't examine log files, the source tree or output
files. When enabled, this class triggers on task failure and saves a
tarball of the work directory for the task's recipe and puts it in a
configurable location, where it can be picked up by a separate process
and made available as a downloadable artifact.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>
---
 meta/classes/workdir_save.bbclass | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta/classes/workdir_save.bbclass

diff --git a/meta/classes/workdir_save.bbclass b/meta/classes/workdir_save.bbclass
new file mode 100644
index 0000000..7007041
--- /dev/null
+++ b/meta/classes/workdir_save.bbclass
@@ -0,0 +1,54 @@
+# Save the work directory for a recipe when one of its tasks fails.
+# Useful in cases where the environment in which builds are run is
+# ephemeral or otherwise inaccessible for examination during
+# debugging.
+#
+# To enable, simply add the following to your configuration:
+#
+# INHERIT += "workdir_save"
+#
+# Notes:
+# * For this to work you also need corresponding logic in your build
+#   orchestration tool to pick up any files written out to WORKDIR_SAVE_DIR
+#   (with the other assumption being that no files are present there at
+#   the start of the build).
+# * Work directories can be quite large, so saving them can take some time
+#   and of course space.
+#
+# Copyright (c) 2020 Microsoft Corporation
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+WORKDIR_SAVE_DIR ?= "${TMPDIR}/workdir_save"
+WORKDIR_SAVE_ENABLED ?= "1"
+
+addhandler workdir_save_handler
+workdir_save_handler[eventmask] = "bb.build.TaskFailed"
+
+python workdir_save_handler() {
+    import datetime
+    if d.getVar('WORKDIR_SAVE_ENABLED') != '1':
+        return
+
+    base_workdir = d.getVar('BASE_WORKDIR')
+    workdir = d.getVar('WORKDIR')
+    outdir = d.getVar('WORKDIR_SAVE_DIR')
+    bb.utils.mkdirhier(outdir)
+    pn = d.getVar('PN')
+    tstamp = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
+    tarfn = 'workdir_%s_%s.tar.gz' % (pn, tstamp)
+    tarfp = os.path.join(outdir, tarfn)
+    taskname = d.getVar('BB_CURRENTTASK')
+    bb.plain('NOTE: Saving workdir for failed task %s.do_%s to %s' % (pn, taskname, tarfp))
+    try:
+        bb.process.run(['tar', 'czf', tarfp,
+                os.path.relpath(workdir, base_workdir)], cwd=base_workdir)
+    except bb.process.ExecutionError as e:
+        # It is possible for other tasks to be writing to the workdir
+        # while we are tarring it up, in which case tar will return 1,
+        # but we don't care in this situation (tar returns 2 for other
+        # errors so we we will see those)
+        if e.exitcode != 1:
+            bb.warn('workdir save error: %s' % str(e))
+}
-- 
1.8.3.1

