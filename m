Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4798D7229B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:29:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2014 09:29:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,456,1413270000"; d="scan'208";a="637908702"
Received: from ksperera-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.204])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2014 09:29:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Nov 2014 17:28:42 +0000
Message-Id: <1da78aa63442f8ed589702bb4ee88bf3ffb9109a.1416934753.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 2/7] lib/oe/patch: auto-commit when falling back from git am
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
X-List-Received-Date: Tue, 25 Nov 2014 17:29:49 -0000

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


