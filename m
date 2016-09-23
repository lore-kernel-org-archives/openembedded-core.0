Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 90E226FFCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:22:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 23 Sep 2016 02:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="1060910480"
Received: from yleow-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.155.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2016 02:22:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 21:22:11 +1200
Message-Id: <37522ed0c0fe70b6957900d47931f550175a2450.1474622468.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474622468.git.paul.eggleton@linux.intel.com>
References: <cover.1474622468.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474622468.git.paul.eggleton@linux.intel.com>
References: <cover.1474622468.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] lib/oe/patch: improve accuracy of patch header extraction
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
X-List-Received-Date: Fri, 23 Sep 2016 09:22:20 -0000

When PATCHTOOL = "git", if we need to manually apply a patch and then
commit it (i.e. when git am doesn't work) we try to extract the author /
date / shortlog from the patch header. Make the following improvements
to that extraction process:

* If there's no explicit Subject: but the first line is followed by a
  blank line, isn't an Upstream-Status: or Index: marker and isn't too
  long, then assume it's good enough to be the shortlog. This avoids
  having too many patches with "Upgrade to version x.y" as the shortlog
  (since that is often when patches get added).
* Add --follow to the command we use to find the commit that added the
  patch, so we mostly get the commit that added the patch rather than
  getting stuck on upgrade commits that last moved/renamed the patch
* Populate the date from the commit that added the patch if we were able
  to get the author but not the date from the patch (otherwise you get
  today's date which is less useful).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index c04f098..0332f10 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -351,6 +351,21 @@ class GitApplyTree(PatchTree):
                 # We don't want the From <commit> line - if it's present it will break rebasing
                 continue
             outlines.append(line)
+
+        if not subject:
+            firstline = None
+            for line in headerlines:
+                line = line.strip()
+                if firstline:
+                    if line:
+                        # Second line is not blank, the first line probably isn't usable
+                        firstline = None
+                    break
+                elif line:
+                    firstline = line
+            if firstline and not firstline.startswith(('#', 'Index:', 'Upstream-Status:')) and len(firstline) < 100:
+                subject = firstline
+
         return outlines, author, date, subject
 
     @staticmethod
@@ -373,21 +388,24 @@ class GitApplyTree(PatchTree):
         # Process patch header and extract useful information
         lines = GitApplyTree.extractPatchHeader(patchfile)
         outlines, author, date, subject = GitApplyTree.interpretPatchHeader(lines)
-        if not author or not subject:
+        if not author or not subject or not date:
             try:
-                shellcmd = ["git", "log", "--format=email", "--diff-filter=A", "--", patchfile]
+                shellcmd = ["git", "log", "--format=email", "--follow", "--diff-filter=A", "--", patchfile]
                 out = runcmd(["sh", "-c", " ".join(shellcmd)], os.path.dirname(patchfile))
             except CmdError:
                 out = None
             if out:
                 _, newauthor, newdate, newsubject = GitApplyTree.interpretPatchHeader(out.splitlines())
-                if not author or not date:
-                    # These really need to go together
+                if not author:
+                    # If we're setting the author then the date should be set as well
                     author = newauthor
                     date = newdate
+                elif not date:
+                    # If we don't do this we'll get the current date, at least this will be closer
+                    date = newdate
                 if not subject:
                     subject = newsubject
-        if subject:
+        if subject and outlines and not outlines[0].strip() == subject:
             outlines.insert(0, '%s\n\n' % subject.strip())
 
         # Write out commit message to a file
-- 
2.5.5


