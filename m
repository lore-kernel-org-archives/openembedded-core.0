Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 90FE872912
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:42:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2014 03:42:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,606,1413270000"; d="scan'208";a="640244372"
Received: from khamid-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.61])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2014 03:42:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 11:41:46 +0000
Message-Id: <5a7b253f7820d66c13e127997ff4755d57a9688b.1418984743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/15] lib/oe/patch: auto-commit when falling back from git am
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
X-List-Received-Date: Fri, 19 Dec 2014 11:42:09 -0000

When PATCHTOOL = "git", if we're not able to use "git am" to apply a
patch and fall back to "git apply" or "patch", it is desirable to
actually commit the changes, attempting to preserve (and interpret) the
patch header as part of the commit message if present. As a bonus, the
code for extracting the commit message is callable externally in case it
is useful elsewhere.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 86 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 788f465..2d56ba4 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -202,6 +202,78 @@ class GitApplyTree(PatchTree):
     def __init__(self, dir, d):
         PatchTree.__init__(self, dir, d)
 
+    @staticmethod
+    def extractPatchHeader(patchfile):
+        """
+        Extract just the header lines from the top of a patch file
+        """
+        lines = []
+        with open(patchfile, 'r') as f:
+            for line in f.readlines():
+                if line.startswith('Index: ') or line.startswith('diff -') or line.startswith('---'):
+                    break
+                lines.append(line)
+        return lines
+
+    @staticmethod
+    def prepareCommit(patchfile):
+        """
+        Prepare a git commit command line based on the header from a patch file
+        (typically this is useful for patches that cannot be applied with "git am" due to formatting)
+        """
+        import tempfile
+        import re
+        author_re = re.compile('[\S ]+ <\S+@\S+\.\S+>')
+        # Process patch header and extract useful information
+        lines = GitApplyTree.extractPatchHeader(patchfile)
+        outlines = []
+        author = None
+        date = None
+        for line in lines:
+            if line.startswith('Subject: '):
+                subject = line.split(':', 1)[1]
+                # Remove any [PATCH][oe-core] etc.
+                subject = re.sub(r'\[.+?\]\s*', '', subject)
+                outlines.insert(0, '%s\n\n' % subject.strip())
+                continue
+            if line.startswith('From: ') or line.startswith('Author: '):
+                authorval = line.split(':', 1)[1].strip().replace('"', '')
+                # git is fussy about author formatting i.e. it must be Name <email@domain>
+                if author_re.match(authorval):
+                    author = authorval
+                    continue
+            if line.startswith('Date: '):
+                if date is None:
+                    dateval = line.split(':', 1)[1].strip()
+                    # Very crude check for date format, since git will blow up if it's not in the right
+                    # format. Without e.g. a python-dateutils dependency we can't do a whole lot more
+                    if len(dateval) > 12:
+                        date = dateval
+                continue
+            if line.startswith('Signed-off-by: '):
+                authorval = line.split(':', 1)[1].strip().replace('"', '')
+                # git is fussy about author formatting i.e. it must be Name <email@domain>
+                if author_re.match(authorval):
+                    author = authorval
+            outlines.append(line)
+        # Add a pointer to the original patch file name
+        if outlines and outlines[-1].strip():
+            outlines.append('\n')
+        outlines.append('(from original patch: %s)\n' % os.path.basename(patchfile))
+        # Write out commit message to a file
+        with tempfile.NamedTemporaryFile('w', delete=False) as tf:
+            tmpfile = tf.name
+            for line in outlines:
+                tf.write(line)
+        # Prepare git command
+        cmd = ["git", "commit", "-F", tmpfile]
+        # git doesn't like plain email addresses as authors
+        if author and '<' in author:
+            cmd.append('--author="%s"' % author)
+        if date:
+            cmd.append('--date="%s"' % date)
+        return (tmpfile, cmd)
+
     def _applypatch(self, patch, force = False, reverse = False, run = True):
         def _applypatchhelper(shellcmd, patch, force = False, reverse = False, run = True):
             if reverse:
@@ -218,11 +290,25 @@ class GitApplyTree(PatchTree):
             shellcmd = ["git", "--work-tree=.", "am", "-3", "-p%s" % patch['strippath']]
             return _applypatchhelper(shellcmd, patch, force, reverse, run)
         except CmdError:
+            # Fall back to git apply
             shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
             try:
                 output = _applypatchhelper(shellcmd, patch, force, reverse, run)
             except CmdError:
+                # Fall back to patch
                 output = PatchTree._applypatch(self, patch, force, reverse, run)
+            # Add all files
+            shellcmd = ["git", "add", "-f", "."]
+            output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+            # Exclude the patches directory
+            shellcmd = ["git", "reset", "HEAD", self.patchdir]
+            output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+            # Commit the result
+            (tmpfile, shellcmd) = self.prepareCommit(patch['file'])
+            try:
+                output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+            finally:
+                os.remove(tmpfile)
             return output
 
 
-- 
1.9.3


