Return-Path: <michael.g.wood@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 264B862135
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 11:27:30 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p65so23210254wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 03:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=1qkKhK3efl1FbvyQXkiPNmpuqgZ0wo6sUIv0DMLq3AM=;
	b=dGh2xXtCdJzRM/LUVY/trcM2pIIGFQliQ53fZFTEF4ul3EcWVfjhSOHzWmBHJ5563O
	OWI4wOrXU2Q0SXA/kgBYUD37qAqrOrMGLRFGNawqVtTH5uGuLoLg5o/UTB5Ga6MRrht4
	WH/UomuVJQwERBTgUraB7ngdJenrw5IOzoypdLH0Fnvq6j8MoJJaitaFZJKtMeldKLTN
	6QN7PJHPGG5qRscXLcSyF+O7wpix/RRwnCdDdIDJ32a4e0/FtQzqprQHUGnH3Z5f5iZJ
	qEXw6Z7NtrMQrQW/3E67Zef9OYxnGVxiYZNzNjjmyn1Hc8vlNvZvYdRguYiAy3oC5KQQ
	FohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1qkKhK3efl1FbvyQXkiPNmpuqgZ0wo6sUIv0DMLq3AM=;
	b=KFCa1GiOaQa3czmHxu7LtIEWGaktsOezaDY5d71I1kiYmr4HeFMmRRl39gTIuhgHJl
	q/nDHlpuVy2fxkiYwAziVuu4QCnFB3olCizJ7lgOUd5PM4w3LkKjibRDP8nk2irnxxjn
	QBJ5ZkDscD7W7yEcNE+tAwMxX0tp5116YtnPGEWnZMzcDFjiseA+yuy8HXH6eWrhz67C
	c6l0k9fW1qnyDj5brrrd9fD8262f6zXF1LkrEs4cL6pBdQAEMnPqe5xKlG2keelG5DEv
	o1v4g6bSBQOVvfORRs98jQ5qlBH70mbKVyUEuBXwzzsyW/luUrckYvaqdmDmZrp+busE
	sS7g==
X-Gm-Message-State: AD7BkJLvKB7buXDnrmFTTmsI0zxIjjXITnBDdMNgLoQPThyT+vFXs7XmHA6QywOiTezJMGmO
X-Received: by 10.28.145.8 with SMTP id t8mr18905541wmd.103.1457436451148;
	Tue, 08 Mar 2016 03:27:31 -0800 (PST)
Received: from dorado.home (host86-147-84-80.range86-147.btcentralplus.com.
	[86.147.84.80]) by smtp.gmail.com with ESMTPSA id
	i186sm1301434wmf.1.2016.03.08.03.27.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Mar 2016 03:27:30 -0800 (PST)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 11:27:24 +0000
Message-Id: <1457436444-7335-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] toaster.bbclass: improve how we gather buildstats for Toaster
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Mar 2016 11:27:31 -0000

From: Elliot Smith <elliot.smith@intel.com>

Clean up the code which gathers buildstats for Toaster,
and modify the field names so that the correct parts of the
buildstats files are used to derive the CPU usage values.

Also derive elapsed time for the build here, rather than in
Toaster, as we have ready access to the data in the correct
format.

[YOCTO #8842]

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 meta/classes/toaster.bbclass | 70 ++++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 25 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 51a4c74..a17501e 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -202,25 +202,37 @@ python toaster_collect_task_stats() {
     import bb.utils
     import os
 
+    toaster_statlist_file = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist")
+
     if not e.data.getVar('BUILDSTATS_BASE', True):
         return  # if we don't have buildstats, we cannot collect stats
 
+    def stat_to_float(value):
+        return float(value.strip('% \n\r'))
+
     def _append_read_list(v):
         lock = bb.utils.lockfile(e.data.expand("${TOPDIR}/toaster.lock"), False, True)
 
-        with open(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"), "a") as fout:
+        with open(toaster_statlist_file, "a") as fout:
             taskdir = e.data.expand("${BUILDSTATS_BASE}/${BUILDNAME}/${PF}")
             fout.write("%s::%s::%s::%s\n" % (e.taskfile, e.taskname, os.path.join(taskdir, e.task), e.data.expand("${PN}")))
 
         bb.utils.unlockfile(lock)
 
     def _read_stats(filename):
-        cpu_usage = 0
-        disk_io = 0
-        started = '0'
-        ended = '0'
-        pn = ''
+        # seconds
+        cpu_time_user = 0
+        cpu_time_system = 0
+
+        # bytes
+        disk_io_read = 0
+        disk_io_write = 0
+
+        started = 0
+        ended = 0
+
         taskname = ''
+
         statinfo = {}
 
         with open(filename, 'r') as task_bs:
@@ -228,41 +240,49 @@ python toaster_collect_task_stats() {
                 k,v = line.strip().split(": ", 1)
                 statinfo[k] = v
 
-        if "CPU usage" in statinfo:
-            cpu_usage = str(statinfo["CPU usage"]).strip('% \n\r')
-
-        if "IO write_bytes" in statinfo:
-            disk_io = disk_io + int(statinfo["IO write_bytes"].strip('% \n\r'))
-
-        if "IO read_bytes" in statinfo:
-            disk_io = disk_io + int(statinfo["IO read_bytes"].strip('% \n\r'))
-
         if "Started" in statinfo:
-            started = str(statinfo["Started"]).strip('% \n\r')
+            started = stat_to_float(statinfo["Started"])
 
         if "Ended" in statinfo:
-            ended = str(statinfo["Ended"]).strip('% \n\r')
+            ended = stat_to_float(statinfo["Ended"])
 
-        elapsed_time = float(ended) - float(started)
+        if "Child rusage ru_utime" in statinfo:
+            cpu_time_user = cpu_time_user + stat_to_float(statinfo["Child rusage ru_utime"])
 
-        cpu_usage = float(cpu_usage)
+        if "Child rusage ru_stime" in statinfo:
+            cpu_time_system = cpu_time_system + stat_to_float(statinfo["Child rusage ru_stime"])
 
-        return {'cpu_usage': cpu_usage, 'disk_io': disk_io, 'elapsed_time': elapsed_time}
+        if "IO write_bytes" in statinfo:
+            write_bytes = int(statinfo["IO write_bytes"].strip('% \n\r'))
+            disk_io_write = disk_io_write + write_bytes
 
+        if "IO read_bytes" in statinfo:
+            read_bytes = int(statinfo["IO read_bytes"].strip('% \n\r'))
+            disk_io_read = disk_io_read + read_bytes
+
+        return {
+            'stat_file': filename,
+            'cpu_time_user': cpu_time_user,
+            'cpu_time_system': cpu_time_system,
+            'disk_io_read': disk_io_read,
+            'disk_io_write': disk_io_write,
+            'started': started,
+            'ended': ended
+        }
 
     if isinstance(e, (bb.build.TaskSucceeded, bb.build.TaskFailed)):
         _append_read_list(e)
         pass
 
-
-    if isinstance(e, bb.event.BuildCompleted) and os.path.exists(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist")):
+    if isinstance(e, bb.event.BuildCompleted) and os.path.exists(toaster_statlist_file):
         events = []
-        with open(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"), "r") as fin:
+        with open(toaster_statlist_file, "r") as fin:
             for line in fin:
                 (taskfile, taskname, filename, recipename) = line.strip().split("::")
-                events.append((taskfile, taskname, _read_stats(filename), recipename))
+                stats = _read_stats(filename)
+                events.append((taskfile, taskname, stats, recipename))
         bb.event.fire(bb.event.MetadataEvent("BuildStatsList", events), e.data)
-        os.unlink(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"))
+        os.unlink(toaster_statlist_file)
 }
 
 # dump relevant build history data as an event when the build is completed
-- 
2.5.0


