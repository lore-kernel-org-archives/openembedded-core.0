Return-Path: <mike.looijmans@topic.nl>
Received: from smtp03.online.nl (smtp03.online.nl [194.134.41.33])
	by mail.openembedded.org (Postfix) with ESMTP id 0901A6017C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Jan 2015 14:06:17 +0000 (UTC)
Received: from smtp03.online.nl (localhost [127.0.0.1])
	by smtp03.online.nl (Postfix) with ESMTP id 7CDDD68755;
	Sat, 31 Jan 2015 15:06:17 +0100 (CET)
Received: from phenom.local (s55969068.adsl.online.nl [85.150.144.104])
	by smtp03.online.nl (Postfix) with ESMTP;
	Sat, 31 Jan 2015 15:06:17 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Jan 2015 15:06:13 +0100
Message-Id: <1422713174-18522-3-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1422713174-18522-1-git-send-email-mike.looijmans@topic.nl>
References: <1422713174-18522-1-git-send-email-mike.looijmans@topic.nl>
X-Online-Scanned: by Cloudmark authority (on smtp03.online.nl)
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Mike Looijmans <milo-software@users.sourceforge.net>
Subject: [PATCH 2/2] fetch2/git.py: Add gitpkgv_revision alternative version information
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
X-List-Received-Date: Sat, 31 Jan 2015 14:06:21 -0000

From: Mike Looijmans <milo-software@users.sourceforge.net>

gitpkgv_revision returns a sortable revision number that can be used
in the PKGV variable for example. To mimic meta-openembedded gitpkgv
behaviour to provide a sortable revision numner, one could set the
following:

PKGV = "1.0+${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"

This would yield a package version like "1.0+69+fb5eb80".

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 lib/bb/fetch2/git.py |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
index 44fc271..3216ef4 100644
--- a/lib/bb/fetch2/git.py
+++ b/lib/bb/fetch2/git.py
@@ -394,6 +394,31 @@ class Git(FetchMethod):
     def _build_revision(self, ud, d, name):
         return ud.revisions[name]
 
+    def gitpkgv_revision(self, ud, d, name):
+        """
+        Return a sortable revision number by counting commits in the history
+        Based on gitpkgv.bblass in meta-openembedded
+        """
+        rev = self._build_revision(ud, d, name)
+        localpath = ud.localpath
+        rev_file = os.path.join(localpath, "oe-gitpkgv_" + rev)
+        if not os.path.exists(localpath):
+            commits = None
+        else:
+            if not os.path.exists(rev_file) or not os.path.getsize(rev_file):
+                from pipes import quote
+                commits = bb.fetch2.runfetchcmd(
+                        "git rev-list %s -- | wc -l" % (quote(rev)),
+                        d, quiet=True).strip().lstrip('0')
+                if commits:
+                    open(rev_file, "w").write("%d\n" % int(commits))
+            else:
+                commits = open(rev_file, "r").readline(128).strip()
+        if commits:
+            return False, "%s+%s" % (commits, rev[:7])
+        else:
+            return True, str(rev)
+
     def checkstatus(self, ud, d):
         fetchcmd = "%s ls-remote %s" % (ud.basecmd, ud.url)
         try:
-- 
1.7.9.5


