Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF8E77D25
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 04:57:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 06 Apr 2017 21:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,162,1488873600"; d="scan'208";a="1132406882"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2017 21:57:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 16:57:19 +1200
Message-Id: <226303de6e9a13c22e1e7f367474aa17df85d915.1491540566.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491540566.git.paul.eggleton@linux.intel.com>
References: <cover.1491540566.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] classes/buildhistory: write out task signatures on every build
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
X-List-Received-Date: Fri, 07 Apr 2017 04:57:32 -0000

If we want to determine what changed since the last build, one angle
from which to look at it is to check the signatures. However, if we
don't actually have the signatures from the last build we don't have
anywhere to start. Save the signatures on each build in order to give us
the starting point.

NOTE: you need to set your BUILDHISTORY_FEATURES value to include
"task" to enable collection of these signatures as it is is disabled by
default.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 12 ++++++++++++
 meta/lib/oe/sstatesig.py          | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 109b375..0cafad5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -596,6 +596,17 @@ POPULATE_SDK_POST_HOST_COMMAND[vardepvalueexclude] .= "| buildhistory_list_insta
 SDK_POSTPROCESS_COMMAND_append = " buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
 SDK_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
 
+python buildhistory_write_sigs() {
+    if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
+        return
+
+    # Create sigs file
+    if hasattr(bb.parse.siggen, 'dump_siglist'):
+        taskoutdir = os.path.join(d.getVar('BUILDHISTORY_DIR'), 'task')
+        bb.utils.mkdirhier(taskoutdir)
+        bb.parse.siggen.dump_siglist(os.path.join(taskoutdir, 'tasksigs.txt'))
+}
+
 def buildhistory_get_build_id(d):
     if d.getVar('BB_WORKERCONTEXT') != '1':
         return ""
@@ -761,6 +772,7 @@ python buildhistory_eventhandler() {
                 shutil.rmtree(olddir)
             if e.data.getVar("BUILDHISTORY_COMMIT") == "1":
                 bb.note("Writing buildhistory")
+                bb.build.exec_func("buildhistory_write_sigs", d)
                 localdata = bb.data.createCopy(e.data)
                 localdata.setVar('BUILDHISTORY_BUILD_FAILURES', str(e._failures))
                 interrupted = getattr(e, '_interrupted', 0)
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 13fd3bd..56b33ba 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -211,6 +211,16 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
                 f.write('    "\n')
             f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(l)))
 
+    def dump_siglist(self, sigfile):
+        with open(sigfile, "w") as f:
+            tasks = []
+            for taskitem in self.taskhash:
+                (fn, task) = taskitem.rsplit(".", 1)
+                pn = self.lockedpnmap[fn]
+                tasks.append((pn, task, self.taskhash[taskitem]))
+            for (pn, task, taskhash) in sorted(tasks):
+                f.write('%s.%s %s\n' % (pn, task, taskhash))
+
     def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
         warn_msgs = []
         error_msgs = []
-- 
2.9.3


