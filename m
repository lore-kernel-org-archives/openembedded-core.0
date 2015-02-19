Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 48F8D6B6B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425523"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:39:50 +0000
Message-Id: <4961eed87505127176286a065d8bfe6452b009f0.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/15] recipetool: fix regression caused by previous commit
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:18 -0000

Option was renamed in the setup code but not in the code that used it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 290fc13..ae599cb 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -110,8 +110,8 @@ def create_recipe(args):
     if '://' in args.source:
         # Fetch a URL
         srcuri = args.source
-        if args.externalsrc:
-            srctree = args.externalsrc
+        if args.extract_to:
+            srctree = args.extract_to
         else:
             tempsrc = tempfile.mkdtemp(prefix='recipetool-')
             srctree = tempsrc
@@ -126,8 +126,8 @@ def create_recipe(args):
             srctree = os.path.join(srctree, srcsubdir)
     else:
         # Assume we're pointing to an existing source tree
-        if args.externalsrc:
-            logger.error('externalsrc cannot be specified if source is a directory')
+        if args.extract_to:
+            logger.error('--extract-to cannot be specified if source is a directory')
             sys.exit(1)
         if not os.path.isdir(args.source):
             logger.error('Invalid source directory %s' % args.source)
-- 
1.9.3


