Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE586FFD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 19:00:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 31 Dec 2015 11:00:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,504,1444719600"; d="scan'208";a="872553512"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 31 Dec 2015 11:00:09 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 79E6D6A4087;
	Thu, 31 Dec 2015 11:48:07 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Dec 2015 19:03:39 +0200
Message-Id: <1451581419-30276-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] native: fix incorrect addition of -native suffix
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
X-List-Received-Date: Thu, 31 Dec 2015 19:00:13 -0000

The code in native.bbclass adds -native suffix for recipes that
don't have it. If native package doesn't have this suffix it
will be added to it. For example perl-native-runtime becomes
perl-native-runtime-native because of this.

Added check to -native- in the recipe name to prevent addition
of -native suffix.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/native.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index aac2c1e..8bb3244 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -120,7 +120,7 @@ python native_virtclass_handler () {
         return
 
     pn = e.data.getVar("PN", True)
-    if not pn.endswith("-native"):
+    if not (pn.endswith("-native") or "-native-" in pn):
         return
 
     def map_dependencies(varname, d, suffix = ""):
@@ -136,7 +136,7 @@ python native_virtclass_handler () {
                 continue
             elif "-cross-" in dep:
                 newdeps.append(dep.replace("-cross", "-native"))
-            elif not dep.endswith("-native"):
+            elif not (dep.endswith("-native") or "-native-" in dep):
                 newdeps.append(dep + "-native")
             else:
                 newdeps.append(dep)
-- 
2.1.4


