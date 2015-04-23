Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEBF171144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:19:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 09:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,632,1422950400"; d="scan'208";a="484753675"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 09:18:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:18:24 +0100
Message-Id: <6f579d7c42da07ee3ae75c5efeb876ec852bab46.1429805738.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/8] devtool: modify: use B=S if that is the default for the recipe
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
X-List-Received-Date: Thu, 23 Apr 2015 16:19:08 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Makes the build succeed for packages which do not support separate build
directory, e.g. zlib. The same outcome could be achieved with the
--same-dir option, but, it's generally hard to tell if a random package
would need that option. The negative side effect of this patch is that
dev srctree (of some packages that build fine without this modification)
gets dirtied by build artefacts.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d5ded2f..fbac34e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -384,12 +384,19 @@ def modify(args, config, basepath, workspace):
         f.write('inherit externalsrc\n')
         f.write('# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
         f.write('EXTERNALSRC_pn-%s = "%s"\n' % (args.recipename, srctree))
-        if args.same_dir or bb.data.inherits_class('autotools-brokensep', rd):
-            if args.same_dir:
-                logger.info('using source tree as build directory since --same-dir specified')
-            else:
-                logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
+
+        b_is_s = True
+        if args.same_dir:
+            logger.info('using source tree as build directory since --same-dir specified')
+        elif bb.data.inherits_class('autotools-brokensep', rd):
+            logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
+        elif rd.getVar('B', True) == s:
+            logger.info('using source tree as build directory since that is the default for this recipe')
+        else:
+            b_is_s = False
+        if b_is_s:
             f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (args.recipename, srctree))
+
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
             for commit in commits:
-- 
2.1.0


