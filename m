Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9A67477065
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 23:34:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 07 Apr 2016 16:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="780431304"
Received: from bitbang.jf.intel.com ([10.7.199.152])
	by orsmga003.jf.intel.com with ESMTP; 07 Apr 2016 16:34:58 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 16:34:49 -0700
Message-Id: <80722e3b0c776ec5dd6cbc453cc4d5fb9df27eab.1460071932.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1460071932.git.randy.e.witt@linux.intel.com>
References: <cover.1460071932.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1460071932.git.randy.e.witt@linux.intel.com>
References: <cover.1460071932.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/5] sstatesig.py: Split single locked sigs check into multiple checks
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
X-List-Received-Date: Thu, 07 Apr 2016 23:34:58 -0000

Add the SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and
SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK variables to replace
SIGGEN_LOCKEDSIGS_CHECK_LEVEL.

SIGGEN_LOCKEDSIGS_TASKSIG_CHECK will no control whether there is a
warning or error if a task's hash in the locked signature file doesn't match
the computed hash from the current metadata.

SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK will control whther there is a
warning or error if a task that supports sstate is in the locked
signature file, but no sstate exists for the task.

Previously you could only have warning/errors for both controlled by
SIGGEN_LOCKEDSIGS_CHECK_LEVEL. This was an issue in the extensible sdk,
because we know sstate won't exist for certain items in the reverse
dependencies list for tasks. However, we still want to error if task
signatures don't match.

[YOCTO #9195]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/sstate.bbclass       |  8 +++++++-
 meta/lib/oe/sstatesig.py          | 27 +++++++++++++++++++++------
 meta/lib/oeqa/selftest/signing.py |  4 ++--
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3234e79..8c62327 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -53,7 +53,13 @@ SSTATEPOSTINSTFUNCS = ""
 EXTRA_STAGING_FIXMES ?= ""
 SSTATECLEANFUNCS = ""
 
-SIGGEN_LOCKEDSIGS_CHECK_LEVEL ?= 'error'
+# Check whether sstate exists for tasks that support sstate and are in the
+# locked signatures file.
+SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK ?= 'error'
+
+# Check whether the task's computed hash matches the task's hash in the
+# locked signatures file.
+SIGGEN_LOCKEDSIGS_TASKSIG_CHECK ?= "error"
 
 # The GnuPG key ID and passphrase to use to sign sstate archives (or unset to
 # not sign)
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 5828a9d..b2319ff 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -189,20 +189,35 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
 
     def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
-        checklevel = d.getVar("SIGGEN_LOCKEDSIGS_CHECK_LEVEL", True)
+        warn_msgs = []
+        error_msgs = []
+        sstate_missing_msgs = []
+
         for task in range(len(sq_fn)):
             if task not in ret:
                 for pn in self.lockedsigs:
                     if sq_hash[task] in self.lockedsigs[pn].itervalues():
                         if sq_task[task] == 'do_shared_workdir':
                             continue
-                        self.mismatch_msgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?"
+                        sstate_missing_msgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?"
                                                % (pn, sq_task[task], sq_hash[task]))
 
-        if self.mismatch_msgs and checklevel == 'warn':
-            bb.warn("\n".join(self.mismatch_msgs))
-        elif self.mismatch_msgs and checklevel == 'error':
-            bb.fatal("\n".join(self.mismatch_msgs))
+        checklevel = d.getVar("SIGGEN_LOCKEDSIGS_TASKSIG_CHECK", True)
+        if checklevel == 'warn':
+            warn_msgs += self.mismatch_msgs
+        elif checklevel == 'error':
+            error_msgs += self.mismatch_msgs
+
+        checklevel = d.getVar("SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK", True)
+        if checklevel == 'warn':
+            warn_msgs += sstate_missing_msgs
+        elif checklevel == 'error':
+            error_msgs += sstate_missing_msgs
+
+        if warn_msgs:
+            bb.warn("\n".join(warn_msgs))
+        if error_msgs:
+            bb.fatal("\n".join(error_msgs))
 
 
 # Insert these classes into siggen's namespace so it can see and select them
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index d2b3f00..1babca0 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -160,7 +160,7 @@ class LockedSignatures(oeSelfTest):
         bitbake('-S none %s' % test_recipe)
 
         feature = 'require %s\n' % locked_sigs_file
-        feature += 'SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "warn"\n'
+        feature += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n'
         self.write_config(feature)
 
         # Build a locked recipe
@@ -180,7 +180,7 @@ class LockedSignatures(oeSelfTest):
         ret = bitbake(test_recipe)
 
         # Verify you get the warning and that the real task *isn't* run (i.e. the locked signature has worked)
-        patt = r'WARNING: The %s:do_package sig \S+ changed, use locked sig \S+ to instead' % test_recipe
+        patt = r'WARNING: The %s:do_package sig is computed to be \S+, but the sig is locked to \S+ in SIGGEN_LOCKEDSIGS\S+' % test_recipe
         found_warn = re.search(patt, ret.output)
 
         self.assertIsNotNone(found_warn, "Didn't find the expected warning message. Output: %s" % ret.output)
-- 
2.5.5


