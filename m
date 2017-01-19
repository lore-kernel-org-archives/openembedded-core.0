Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7976571D8C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 23:49:56 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 19 Jan 2017 15:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,256,1477983600"; d="scan'208";a="50581054"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by orsmga004.jf.intel.com with ESMTP; 19 Jan 2017 15:49:56 -0800
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 15:55:52 +0000
Message-Id: <1484841352-10441-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH] selftest: automatically add the meta-selftest layer
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
X-List-Received-Date: Thu, 19 Jan 2017 23:49:58 -0000

adding the meta-selftest layer is a small bump you always encounter
when you want to run selftest. Adding an automatic procedure to include
the layer if it is not yet present.

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 scripts/oe-selftest | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 120a6c2..b81e58c 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -131,8 +131,16 @@ def preflight_check():
         os.chdir(builddir)
 
     if not "meta-selftest" in get_bb_var("BBLAYERS"):
-        log.error("You don't seem to have the meta-selftest layer in BBLAYERS")
-        return False
+        log.warn("meta-selftest layer not found in BBLAYERS, adding it")
+        meta_selftestdir = os.path.join(
+                get_bb_var("BBLAYERS_FETCH_DIR"),
+                'meta-selftest')
+        if os.path.isdir(meta_selftestdir):
+            runCmd("bitbake-layers add-layer %s" %meta_selftestdir)
+        else:
+            log.error("could not locate meta-selftest in:\n%s"
+                    %meta_selftestdir)
+            return False
 
     log.info("Running bitbake -p")
     runCmd("bitbake -p")
-- 
2.5.1


