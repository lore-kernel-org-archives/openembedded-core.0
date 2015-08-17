Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E5DC5767D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 11:23:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Aug 2015 04:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,694,1432623600"; d="scan'208";a="626925824"
Received: from jwanrooi-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.11.216])
	by orsmga003.jf.intel.com with ESMTP; 17 Aug 2015 04:23:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2015 12:23:04 +0100
Message-Id: <117070a08075c31f5d6e9d63616e3cec5abab6da.1439810551.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1439810551.git.paul.eggleton@linux.intel.com>
References: <cover.1439810551.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1439810551.git.paul.eggleton@linux.intel.com>
References: <cover.1439810551.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] devtool: extract: remove patches subdirectory when S == WORKDIR
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
X-List-Received-Date: Mon, 17 Aug 2015 11:23:12 -0000

Ensure that the "patches" subdirectory is removed from the right
location when S == WORKDIR (e.g. devtool extract makedevs).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e4ee7f7..658076c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -301,7 +301,6 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         logger.info('Unpacking...')
         task_executor.exec_func('do_unpack', False)
         srcsubdir = crd.getVar('S', True)
-        patchsubdir = srcsubdir
         if srcsubdir == workdir:
             # Find non-patch sources that were "unpacked" to srctree directory
             recipe_patches = [os.path.basename(patch) for patch in
@@ -322,7 +321,7 @@ def _extract_source(srctree, keep_temp, devbranch, d):
 
         scriptutils.git_convert_standalone_clone(srcsubdir)
 
-        patchdir = os.path.join(patchsubdir, 'patches')
+        patchdir = os.path.join(srcsubdir, 'patches')
         haspatches = False
         if os.path.exists(patchdir):
             if os.listdir(patchdir):
-- 
2.1.0


