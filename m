Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob04.myregisteredsite.com
	(atl4mhob04.myregisteredsite.com [209.17.115.42])
	by mail.openembedded.org (Postfix) with ESMTP id D0E72609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 06:29:12 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob04.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t4M6TC3n010905 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 02:29:12 -0400
Received: (qmail 839 invoked by uid 0); 22 May 2015 06:29:12 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 22 May 2015 06:29:11 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 08:29:04 +0200
Message-Id: <1432276145-31264-3-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
References: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Mike Looijmans <milo-software@users.sourceforge.net>
Subject: [PATCH v2 2/3] fetch2/git.py: Add gitpkgv_revision alternative version information
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
X-List-Received-Date: Fri, 22 May 2015 06:29:15 -0000

From: Mike Looijmans <milo-software@users.sourceforge.net>

gitpkgv_revision returns a sortable revision number that can be used
in the PKGV variable for example. To mimic meta-openembedded gitpkgv
behaviour to provide a sortable revision numner, one could set the
following:

PKGV = "1.0+${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"

This would yield a package version like "1.0+69+fb5eb80".

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 lib/bb/fetch2/git.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
index 45bdec0..2e53882 100644
--- a/lib/bb/fetch2/git.py
+++ b/lib/bb/fetch2/git.py
@@ -398,6 +398,31 @@ class Git(FetchMethod):
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
         try:
             self._lsremote(ud, d, "")
-- 
1.9.1


