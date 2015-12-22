Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACE77318B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621978972"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:00 +1300
Message-Id: <fdd166259f649cde13c12a1c4aba3b0dbaa3f783.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/26] recipetool: create: detect when specified URL returns a web page
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:31 -0000

If the user specifies a URL that just returns a web page, then it's
probably incorrect (or broken); attempt to detect this and show an error
if it's the case.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index f98f525..3d5a373 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -130,10 +130,17 @@ def create_recipe(args):
         dirlist = os.listdir(srctree)
         if 'git.indirectionsymlink' in dirlist:
             dirlist.remove('git.indirectionsymlink')
-        if len(dirlist) == 1 and os.path.isdir(os.path.join(srctree, dirlist[0])):
-            # We unpacked a single directory, so we should use that
-            srcsubdir = dirlist[0]
-            srctree = os.path.join(srctree, srcsubdir)
+        if len(dirlist) == 1:
+            singleitem = os.path.join(srctree, dirlist[0])
+            if os.path.isdir(singleitem):
+                # We unpacked a single directory, so we should use that
+                srcsubdir = dirlist[0]
+                srctree = os.path.join(srctree, srcsubdir)
+            else:
+                with open(singleitem, 'r') as f:
+                    if '<html' in f.read(100).lower():
+                        logger.error('Fetching "%s" returned a single HTML page - check the URL is correct and functional' % fetchuri)
+                        sys.exit(1)
     else:
         # Assume we're pointing to an existing source tree
         if args.extract_to:
-- 
2.5.0


