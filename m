Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6685573237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 10:56:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 27 Jul 2015 03:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,553,1432623600"; d="scan'208";a="755544976"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2015 03:56:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id AE01D6A4083;
	Mon, 27 Jul 2015 03:55:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 13:55:52 +0300
Message-Id: <1437994552-29471-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] toaster.bbclass: Fix ValueError
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
X-List-Received-Date: Mon, 27 Jul 2015 10:56:10 -0000

The reason for this exception was usage of ':' as a field
delimiter in toasterstatlist file. As target can optionally
contain ':<task>' suffix it caused split(':') to throw exception:

File "toaster_collect_task_stats(e)", line 71, in
toaster_collect_task_stats(e=<bb.event.BuildCompleted object at
0x7f8434deed50>)
ValueError: too many values to unpack

Fixed by changing delimiter ':' -> '::'

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/toaster.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index eeca9de..d63cff5 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -192,7 +192,7 @@ python toaster_collect_task_stats() {
             bn = get_bn(e)
             bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
             taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
-            fout.write("%s:%s:%s:%s\n" % (e.taskfile, e.taskname, os.path.join(taskdir, e.task), e.data.expand("${PN}")))
+            fout.write("%s::%s::%s::%s\n" % (e.taskfile, e.taskname, os.path.join(taskdir, e.task), e.data.expand("${PN}")))
 
         bb.utils.unlockfile(lock)
 
@@ -245,7 +245,7 @@ python toaster_collect_task_stats() {
         events = []
         with open(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"), "r") as fin:
             for line in fin:
-                (taskfile, taskname, filename, recipename) = line.strip().split(":")
+                (taskfile, taskname, filename, recipename) = line.strip().split("::")
                 events.append((taskfile, taskname, _read_stats(filename), recipename))
         bb.event.fire(bb.event.MetadataEvent("BuildStatsList", events), e.data)
         os.unlink(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"))
-- 
2.1.4


