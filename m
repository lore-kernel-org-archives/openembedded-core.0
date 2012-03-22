Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAlk5-0004g6-CB
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:24:05 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Mar 2012 10:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="143359139"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2012 10:15:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 17:15:05 +0000
Message-Id: <f876f5ca2d2e19fd35d90706f9e7087ed31ba5e0.1332436375.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332436375.git.paul.eggleton@linux.intel.com>
References: <cover.1332436375.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332436375.git.paul.eggleton@linux.intel.com>
References: <cover.1332436375.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] scripts/combo-layer: handle diffs in commit messages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 17:24:05 -0000

A few recent commits in the OE-Core repository contain diffs in their
commit messages, which totally confuses git-am when applying them to the
combo repository during update. Add some code to detect and indent any
diff text in the commit message so that this does not happen (and show a
warning).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   38 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 3612323..73d61cc 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -144,6 +144,43 @@ def check_repo_clean(repodir):
         logger.error("git repo %s is dirty, please fix it first", repodir)
         sys.exit(1)
 
+def check_patch(patchfile):
+    f = open(patchfile)
+    ln = f.readline()
+    of = None
+    in_patch = False
+    beyond_msg = False
+    pre_buf = ''
+    while ln:
+        if not beyond_msg:
+            if ln == '---\n':
+                if not of:
+                    break
+                in_patch = False
+                beyond_msg = True
+            elif ln.startswith('--- '):
+                # We have a diff in the commit message
+                in_patch = True
+                if not of:
+                    print('WARNING: %s contains a diff in its commit message, indenting to avoid failure during apply' % patchfile)
+                    of = open(patchfile + '.tmp', 'w')
+                    of.write(pre_buf)
+                    pre_buf = ''
+            elif in_patch and not ln[0] in '+-@ \n\r':
+                in_patch = False
+        if of:
+            if in_patch:
+                of.write(' ' + ln)
+            else:
+                of.write(ln)
+        else:
+            pre_buf += ln
+        ln = f.readline()
+    f.close()
+    if of:
+        of.close()
+        os.rename(patchfile + '.tmp', patchfile)
+
 def action_update(conf, args):
     """
         update the component repos
@@ -227,6 +264,7 @@ def action_update(conf, args):
         count=len(revlist)-1
         for patch in patchlist:
             f.write("%s %s\n" % (patch, revlist[count]))
+            check_patch(os.path.join(patch_dir, patch))
             count=count-1
         f.close()
 
-- 
1.7.5.4



