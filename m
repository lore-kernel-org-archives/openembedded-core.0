Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AFAC472E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:44:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 Feb 2015 07:44:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,529,1418112000"; d="scan'208";a="682025943"
Received: from kamaher-mobl6.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.37])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2015 07:44:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Feb 2015 15:44:33 +0000
Message-Id: <e1acdea6831bb0fac5618ad1405ff9ebdc0fc527.1423237365.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423237365.git.paul.eggleton@linux.intel.com>
References: <cover.1423237365.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423237365.git.paul.eggleton@linux.intel.com>
References: <cover.1423237365.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] oe-pkgdata-util: make find-path show a proper error if no package found
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
X-List-Received-Date: Fri, 06 Feb 2015 15:44:46 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index fb7734b..e1ec610 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -256,6 +256,7 @@ def lookup_recipe(args):
 def find_path(args):
     import json
 
+    found = False
     for root, dirs, files in os.walk(os.path.join(args.pkgdata_dir, 'runtime')):
         for fn in files:
             with open(os.path.join(root,fn)) as f:
@@ -265,8 +266,12 @@ def find_path(args):
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


