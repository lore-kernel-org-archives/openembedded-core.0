Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 125F3731E6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:17:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594356"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:16:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:47 +1300
Message-Id: <d2ac335246d71355e0c5637e6c3f2fd21a879f15.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/14] devtool: sdk-update: fix error checking
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
X-List-Received-Date: Wed, 06 Jan 2016 11:17:00 -0000

Running "raise" with no arguments here is invalid, we're not in
exception handling context. Rather than also adding code to catch the
exception I just moved the check out to the parent function from which
we can just exit.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index daa3e4e..2d9d911 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -36,14 +36,9 @@ def generate_update_dict(sigfile_new, sigfile_old):
             continue
     return update_dict
 
-def get_sstate_objects(update_dict, newsdk_path):
+def get_sstate_objects(update_dict, sstate_dir):
     """Return a list containing sstate objects which are to be installed"""
     sstate_objects = []
-    # Ensure newsdk_path points to an extensible SDK
-    sstate_dir = os.path.join(newsdk_path, 'sstate-cache')
-    if not os.path.exists(sstate_dir):
-        logger.error("sstate-cache directory not found under %s" % newsdk_path)
-        raise
     for k in update_dict:
         files = set()
         hashval = update_dict[k]
@@ -112,7 +107,11 @@ def sdk_update(args, config, basepath, workspace):
             logger.debug("Found conf/locked-sigs.inc in %s" % updateserver)
         update_dict = generate_update_dict(new_locked_sig_file_path, old_locked_sig_file_path)
         logger.debug("update_dict = %s" % update_dict)
-        sstate_objects = get_sstate_objects(update_dict, updateserver)
+        sstate_dir = os.path.join(newsdk_path, 'sstate-cache')
+        if not os.path.exists(sstate_dir):
+            logger.error("sstate-cache directory not found under %s" % newsdk_path)
+            return 1
+        sstate_objects = get_sstate_objects(update_dict, sstate_dir)
         logger.debug("sstate_objects = %s" % sstate_objects)
         if len(sstate_objects) == 0:
             logger.info("No need to update.")
-- 
2.5.0


