Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.2308.1602642425320138029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 19:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Q96N5q6a;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 8AE5720B4907; Tue, 13 Oct 2020 19:27:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8AE5720B4907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1602642424;
	bh=OkA0jlZqg5MEvAlkmb108e0XPALK0dpH3v5/Mnmceto=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q96N5q6a/Pdyv73tg9F3lFWiPrcqzTG5/Uxot3gDs6lpulYPH0gyjhf1DvMOsa661
	 4GTxcaMDM4cnVIRVHHWepbjoWcyr0sHXqbXBWqF+si+XJCd0lmkRgAimjAJ+8EwND+
	 R8BLFwJMnpGqAou51NK8tfHYp/Y84xaeVsuL0eq4=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/1] classes: add class for retaining build results
Date: Tue, 13 Oct 2020 19:26:42 -0700
Message-Id: <805e5f50760610e9d8fc0531c96ec8b74371892b.1602642330.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1602642330.git.paul.eggleton@linux.microsoft.com>
References: <cover.1602642330.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

If you are running your builds inside an environment where you don't
have access to the build tree (e.g. an autobuilder where you can only
download final artifacts such as images), then debugging build failures
can be difficult - you can't examine log files, the source tree or
output files. When enabled, this class does two things:

1) Triggers on task failure and saves a tarball of the work directory
   for the task's recipe
2) Optionally saves tarballs of a list of nominated directories

It puts these tarballs in a configurable location, where they can be
picked up by a separate process and made available as downloadable
artifacts.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/retain.bbclass | 103 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 meta/classes/retain.bbclass

diff --git a/meta/classes/retain.bbclass b/meta/classes/retain.bbclass
new file mode 100644
index 0000000..e98765f
--- /dev/null
+++ b/meta/classes/retain.bbclass
@@ -0,0 +1,103 @@
+# Creates a tarball of the work directory for a recipe when one of its
+# tasks fails, as well as (optionally) other nominated directories.
+# Useful in cases where the environment in which builds are run is
+# ephemeral or otherwise inaccessible for examination during
+# debugging.
+#
+# To enable, simply add the following to your configuration:
+#
+# INHERIT += "retain"
+#
+# You can also specify extra directories to save at the end of the build
+# upon failure or always (space-separated) e.g.:
+#
+# RETAIN_EXTRADIRS_FAILURE = "${LOG_DIR} ${TMPDIR}/pkgdata"
+# RETAIN_EXTRADIRS_ALWAYS = "${BUILDSTATS_BASE}"
+#
+# If you wish to use a different tarball name prefix you can do so by
+# adding a : followed by the desired prefix (no spaces) e.g. to use
+# "buildlogs" for the tarball of ${LOG_DIR} you would do this:
+#
+# RETAIN_EXTRADIRS_FAILURE = "${LOG_DIR}:buildlogs ${TMPDIR}/pkgdata"
+#
+# Notes:
+# * For this to be useful you also need corresponding logic in your build
+#   orchestration tool to pick up any files written out to RETAIN_OUTDIR
+#   (with the other assumption being that no files are present there at
+#   the start of the build).
+# * Work directories can be quite large, so saving them can take some time
+#   and of course space.
+# * Extra directories must naturally be populated at the time the retain
+#   goes to save them (build completion); to try ensure this for things
+#   that are also saved on build completion (e.g. buildstats), put the
+#   INHERIT += "retain" after the INHERIT += lines for the class that
+#   is writing out the data that you wish to save.
+# * The tarballs have the tarball name as a top-level directory so that
+#   multiple tarballs can be extracted side-by-side easily.
+#
+# Copyright (c) 2020 Microsoft Corporation
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+RETAIN_OUTDIR ?= "${TMPDIR}/retained"
+RETAIN_EXTRADIRS_FAILURE ?= ""
+RETAIN_EXTRADIRS_ALWAYS ?= ""
+RETAIN_ENABLED ?= "1"
+
+
+def retain_retain_dir(desc, tarprefix, path, tarbasepath, d):
+    import datetime
+
+    outdir = d.getVar('RETAIN_OUTDIR')
+    bb.utils.mkdirhier(outdir)
+    tstamp = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
+    tarname = '%s_%s' % (tarprefix, tstamp)
+    tarfp = os.path.join(outdir, '%s.tar.gz' % tarname)
+    tardir = os.path.relpath(path, tarbasepath)
+    cmdargs = ['tar', 'czf', tarfp]
+    # Prefix paths within the tarball with the tarball name so that
+    # multiple tarballs can be extracted side-by-side
+    cmdargs += ['--transform', 's:^:%s/:' % tarname]
+    cmdargs += [tardir]
+    bb.plain('NOTE: retain: saving %s to %s' % (desc, tarfp))
+    try:
+        bb.process.run(cmdargs, cwd=tarbasepath)
+    except bb.process.ExecutionError as e:
+        # It is possible for other tasks to be writing to the workdir
+        # while we are tarring it up, in which case tar will return 1,
+        # but we don't care in this situation (tar returns 2 for other
+        # errors so we we will see those)
+        if e.exitcode != 1:
+            bb.warn('retain: error saving %s: %s' % (desc, str(e)))
+
+
+addhandler retain_workdir_handler
+retain_workdir_handler[eventmask] = "bb.build.TaskFailed bb.event.BuildCompleted"
+
+python retain_workdir_handler() {
+    if d.getVar('RETAIN_ENABLED') != '1':
+        return
+
+    if isinstance(e, bb.build.TaskFailed):
+        pn = d.getVar('PN')
+        workdir = d.getVar('WORKDIR')
+        base_workdir = d.getVar('BASE_WORKDIR')
+        taskname = d.getVar('BB_CURRENTTASK')
+        desc = 'workdir for failed task %s.do_%s' % (pn, taskname)
+        retain_retain_dir(desc, 'workdir_%s' % pn, workdir, base_workdir, d)
+    elif isinstance(e, bb.event.BuildCompleted):
+        paths = d.getVar('RETAIN_EXTRADIRS_ALWAYS').split()
+        if e._failures:
+            paths += d.getVar('RETAIN_EXTRADIRS_FAILURE').split()
+
+        for path in list(set(paths)):
+            if ':' in path:
+                path, itemname = path.rsplit(':', 1)
+            else:
+                itemname = os.path.basename(path)
+            if os.path.exists(path):
+                retain_retain_dir(itemname, itemname, path, os.path.dirname(path), d)
+            else:
+                bb.warn('retain: extra directory %s does not currently exist' % path)
+}
-- 
1.8.3.1

