Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 28C1773300
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 15:00:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Feb 2015 06:55:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,559,1418112000"; d="scan'208";a="664875905"
Received: from jjurski-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.24.180])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2015 07:00:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 14:59:55 +0000
Message-Id: <a588d2d0823b93b190ae5989de21d8708fcf6d89.1423666576.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/7] oe-pkgdata-util: make find-path show a proper error if no package found
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
X-List-Received-Date: Wed, 11 Feb 2015 15:00:16 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index f70f85e..2baa9f4 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -239,6 +239,7 @@ def lookup_recipe(args):
 def find_path(args):
     import json
 
+    found = False
     for root, dirs, files in os.walk(os.path.join(args.pkgdata_dir, 'runtime')):
         for fn in files:
             with open(os.path.join(root,fn)) as f:
@@ -248,8 +249,12 @@ def find_path(args):
                         dictval = json.loads(val)
                         for fullpth in dictval.keys():
                             if fnmatch.fnmatchcase(fullpth, args.targetpath):
+                                found = True
                                 print("%s: %s" % (fn, fullpth))
                         break
+    if not found:
+        logger.error("Unable to find any package producing path %s" % args.targetpath)
+        sys.exit(1)
 
 
 def main():
-- 
1.9.3


