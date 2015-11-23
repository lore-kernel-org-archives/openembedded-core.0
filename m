Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 42C086AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:10:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213372"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:25 +1300
Message-Id: <6a71d6e13e88024f0c672149bfd208ad9c2fc485.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/18] lib/oe/patch: improve extraction of patch header
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
X-List-Received-Date: Mon, 23 Nov 2015 02:10:43 -0000

For patches that we have to extract the header information by hand (i.e.
will not apply with "git am"), make the following improvements:

* If we can't extract author/date/subject, then try to do so from the
  commit that added the patch in git (assuming the metadata is tracked
  by git)
* Take only first Signed-off-by line instead of last
* Accept any case for "Signed-off-by" in case author has typed it by
  hand
* Improve conditional - we can skip the other cases if one matches

Implements [YOCTO #7624].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 58 ++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 2bf501e..2255ce4 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -282,33 +282,32 @@ class GitApplyTree(PatchTree):
         return lines
 
     @staticmethod
-    def prepareCommit(patchfile):
-        """
-        Prepare a git commit command line based on the header from a patch file
-        (typically this is useful for patches that cannot be applied with "git am" due to formatting)
-        """
-        import tempfile
+    def decodeAuthor(line):
+        from email.header import decode_header
+        authorval = line.split(':', 1)[1].strip().replace('"', '')
+        return decode_header(authorval)[0][0]
+
+    @staticmethod
+    def interpretPatchHeader(headerlines):
         import re
         author_re = re.compile('[\S ]+ <\S+@\S+\.\S+>')
-        # Process patch header and extract useful information
-        lines = GitApplyTree.extractPatchHeader(patchfile)
         outlines = []
         author = None
         date = None
-        for line in lines:
+        subject = None
+        for line in headerlines:
             if line.startswith('Subject: '):
                 subject = line.split(':', 1)[1]
                 # Remove any [PATCH][oe-core] etc.
                 subject = re.sub(r'\[.+?\]\s*', '', subject)
-                outlines.insert(0, '%s\n\n' % subject.strip())
                 continue
-            if line.startswith('From: ') or line.startswith('Author: '):
-                authorval = line.split(':', 1)[1].strip().replace('"', '')
+            elif line.startswith('From: ') or line.startswith('Author: '):
+                authorval = GitApplyTree.decodeAuthor(line)
                 # git is fussy about author formatting i.e. it must be Name <email@domain>
                 if author_re.match(authorval):
                     author = authorval
                     continue
-            if line.startswith('Date: '):
+            elif line.startswith('Date: '):
                 if date is None:
                     dateval = line.split(':', 1)[1].strip()
                     # Very crude check for date format, since git will blow up if it's not in the right
@@ -316,12 +315,41 @@ class GitApplyTree(PatchTree):
                     if len(dateval) > 12:
                         date = dateval
                 continue
-            if line.startswith('Signed-off-by: '):
-                authorval = line.split(':', 1)[1].strip().replace('"', '')
+            elif not author and line.lower().startswith('signed-off-by: '):
+                authorval = GitApplyTree.decodeAuthor(line)
                 # git is fussy about author formatting i.e. it must be Name <email@domain>
                 if author_re.match(authorval):
                     author = authorval
             outlines.append(line)
+        return outlines, author, date, subject
+
+    @staticmethod
+    def prepareCommit(patchfile):
+        """
+        Prepare a git commit command line based on the header from a patch file
+        (typically this is useful for patches that cannot be applied with "git am" due to formatting)
+        """
+        import tempfile
+        # Process patch header and extract useful information
+        lines = GitApplyTree.extractPatchHeader(patchfile)
+        outlines, author, date, subject = GitApplyTree.interpretPatchHeader(lines)
+        if not author or not subject:
+            try:
+                shellcmd = ["git", "log", "--format=email", "--diff-filter=A", "--", patchfile]
+                out = runcmd(["sh", "-c", " ".join(shellcmd)], os.path.dirname(patchfile))
+            except CmdError:
+                out = None
+            if out:
+                _, newauthor, newdate, newsubject = GitApplyTree.interpretPatchHeader(out.splitlines())
+                if not author or not date:
+                    # These really need to go together
+                    author = newauthor
+                    date = newdate
+                if not subject:
+                    subject = newsubject
+        if subject:
+            outlines.insert(0, '%s\n\n' % subject.strip())
+
         # Write out commit message to a file
         with tempfile.NamedTemporaryFile('w', delete=False) as tf:
             tmpfile = tf.name
-- 
2.1.0


