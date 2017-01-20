Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9DEBB7722B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567485"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:53 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:09 -0600
Message-Id: <8a48979332c2121d1c46ebc25d572a89daac2316.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 38/55] oeqa/runtime/utils/targetbuildproject.py: Don't use more than 80 characters per line
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:52 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/utils/targetbuildproject.py | 29 +++++++++++++----------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/runtime/utils/targetbuildproject.py b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
index 006d4d4..1ed5789 100644
--- a/meta/lib/oeqa/runtime/utils/targetbuildproject.py
+++ b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
@@ -14,20 +14,23 @@ class TargetBuildProject(BuildProject):
     def download_archive(self):
         self._download_archive()
 
-        (status, output) = self.target.copy_to(self.localarchive, self.targetdir)
-        if status != 0:
-            raise Exception("Failed to copy archive to target, output: %s" % output)
-
-        (status, output) = self.target.run('tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir))
-        if status != 0:
-            raise Exception("Failed to extract archive, output: %s" % output)
-
-        #Change targetdir to project folder
+        status, output = self.target.copyTo(self.localarchive, self.targetdir)
+        if status:
+            raise Exception('Failed to copy archive to target, '
+                            'output: %s' % output)
+
+        cmd = 'tar xf %s%s -C %s' % (self.targetdir,
+                                     self.archive,
+                                     self.targetdir)
+        status, output = self.target.run(cmd)
+        if status:
+            raise Exception('Failed to extract archive, '
+                            'output: %s' % output)
+
+        # Change targetdir to project folder
         self.targetdir = self.targetdir + self.fname
 
-    # The timeout parameter of target.run is set to 0 to make the ssh command
-    # run with no timeout.
+    # The timeout parameter of target.run is set to 0
+    # to make the ssh command run with no timeout.
     def _run(self, cmd):
         return self.target.run(cmd, 0)[0]
-
-
-- 
2.1.4


