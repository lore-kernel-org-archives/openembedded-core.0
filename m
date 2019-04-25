Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7CF7D692
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 02:25:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Apr 2019 19:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,392,1549958400"; d="scan'208";a="164853449"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga004.fm.intel.com with ESMTP; 24 Apr 2019 19:25:31 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2019 09:54:36 +0800
Message-Id: <1556157276-87248-1-git-send-email-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3 2/2] bitbake: fetch2/git: git-lfs check
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
X-List-Received-Date: Thu, 25 Apr 2019 02:25:30 -0000

Build will fail if repository has lfs contents in absense of git-lfs tool on host.
Build will pass if repository may or may not contains lfs content if host has git-lfs installed.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 bitbake/lib/bb/fetch2/git.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 8185bf4..d862942 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -503,6 +503,15 @@ class Git(FetchMethod):
 
         repourl = self._get_repo_url(ud)
         runfetchcmd("%s remote set-url origin %s" % (ud.basecmd, repourl), d, workdir=destdir)
+
+        if self._contains_lfs(ud, d, destdir):
+            origbbenv = d.getVar("BB_ORIGENV", False)
+            path = origbbenv.getVar("PATH")
+            gitlfstool = bb.utils.which(path, "git-lfs", executable=True)
+            if not gitlfstool:
+                raise bb.fetch2.FetchError("Repository %s has lfs content, install git-lfs plugin on host to download" % (repourl))
+
+
         if not ud.nocheckout:
             if subdir != "":
                 runfetchcmd("%s read-tree %s%s" % (ud.basecmd, ud.revisions[ud.names[0]], readpathspec), d,
@@ -553,6 +562,21 @@ class Git(FetchMethod):
             raise bb.fetch2.FetchError("The command '%s' gave output with more then 1 line unexpectedly, output: '%s'" % (cmd, output))
         return output.split()[0] != "0"
 
+    def _contains_lfs(self, ud, d, wd):
+        """
+        Check git lfs repository
+        """
+        cmd = "%s grep lfs HEAD:.gitattributes | wc -l" % (
+                ud.basecmd)
+        try:
+            output = runfetchcmd(cmd, d, quiet=True, workdir=wd)
+        except bb.fetch2.FetchError:
+            return False
+        if int(output) > 0:
+            return True
+        else:
+            return False
+
     def _get_repo_url(self, ud):
         """
         Return the repository URL
-- 
2.7.4


