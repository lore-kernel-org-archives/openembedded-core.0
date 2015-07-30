Return-Path: <kad@kad.name>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5FBF860053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 16:49:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 30 Jul 2015 09:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="533166191"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2015 09:49:25 -0700
Received: from akanevsk-mac01.fi.intel.com (akanevsk-mac01.fi.intel.com
	[10.237.66.34])
	by linux.intel.com (Postfix) with ESMTP id 875036A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 09:48:40 -0700 (PDT)
From: "Alexander D. Kanevskiy" <kad@kad.name>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 19:49:17 +0300
Message-Id: <1438274957-50358-1-git-send-email-kad@kad.name>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] combo-layer: fix AttributeError traceback.
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
X-List-Received-Date: Thu, 30 Jul 2015 16:49:27 -0000

From: Alexander Kanevskiy <kad@linux.intel.com>

Commit c908a423f85a84ddd8249abd00254f29d47df74b introduced new
issue in combo-layer tool that leads to traceback as
args.hard_reset is unknown variable. This changed defines
appropriate destination for command args parser and fixes
reference.

Signed-off-by: Alexander Kanevskiy <kad@linux.intel.com>
---
 scripts/combo-layer | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 6b0c56d..70dad83 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -587,7 +587,7 @@ def action_pull(conf, args):
         branch = repo.get('branch', "master")
         runcmd("git checkout %s" % branch, ldir)
         logger.info("update component repo %s in %s ..." % (name, ldir))
-        if not args.hard_reset:
+        if not conf.hard_reset:
             output=runcmd("git pull --ff-only", ldir)
             logger.info(output)
         else:
@@ -902,7 +902,7 @@ Action:
 
     parser.add_option("--hard-reset",
                help = "instead of pull do fetch and hard-reset in component repos",
-               action = "store_true", default = False)
+               action = "store_true", dest = "hard_reset", default = False)
 
     parser.add_option("-H", "--history", help = "import full history of components during init",
                       action = "store_true", default = False)
-- 
2.5.0


