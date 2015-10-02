Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 38E4F770B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 13:05:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 02 Oct 2015 06:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,623,1437462000"; d="scan'208";a="656554884"
Received: from amattock-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.24.105])
	by orsmga003.jf.intel.com with ESMTP; 02 Oct 2015 06:05:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Oct 2015 14:05:08 +0100
Message-Id: <6ecdd2dca2cf3cf7a8297fd8ba45fce206470476.1443791083.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443791083.git.paul.eggleton@linux.intel.com>
References: <cover.1443791083.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1443791083.git.paul.eggleton@linux.intel.com>
References: <cover.1443791083.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] recipetool: create: fix change in path structure if --extract-to path exists
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
X-List-Received-Date: Fri, 02 Oct 2015 13:05:21 -0000

If the directory specified by --extract-to exists, because we were using
shutil.move() to move the temporary extracted directory to the specified
path, a subdirectory was being created under that directory instead of
moving the contents, which was a different result than if the directory
didn't previously exist. We could try to always move the contents but
that's complicated when any symlinks are involved; the simplest thing is
just to remove the directory (which should be empty anyway) before
moving the temporary directory across in its place.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 844073b..15aa9bd 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -260,6 +260,12 @@ def create_recipe(args):
 
     if args.extract_to:
         scriptutils.git_convert_standalone_clone(srctree)
+        if os.path.isdir(args.extract_to):
+            # If the directory exists we'll move the temp dir into it instead of
+            # its contents - of course, we could try to always move its contents
+            # but that is a pain if there are symlinks; the simplest solution is
+            # to just remove it first
+            os.rmdir(args.extract_to)
         shutil.move(srctree, args.extract_to)
         logger.info('Source extracted to %s' % args.extract_to)
 
-- 
2.1.0


