Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3F66277389
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:09:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 21:09:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,492,1449561600"; d="scan'208";a="658305614"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.175])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 21:09:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:07:25 +1300
Message-Id: <de58208e892e6b7207dfa0693b4fa3df6b217a02.1456290353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/14] devtool: upgrade: fix version argument checking
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
X-List-Received-Date: Wed, 24 Feb 2016 05:09:15 -0000

For recipes that specify SRCREV, the code here wasn't quite doing the
right thing. If the recipe has a SRCREV then that needs changing on
upgrade, so ensure that the user specifies it. If it doesn't, then it'll
be "INVALID" not None since the former is the actual default, so handle
that properly as well. Additionally an unset variable was being
erroneously passed when raising the error about the version being the
same leading to a traceback, so fix that as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 279a65f..77b48f4 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -314,8 +314,13 @@ def upgrade(args, config, basepath, workspace):
         srctree = standard.get_default_srctree(config, pn)
 
     standard._check_compatible_recipe(pn, rd)
-    if rd.getVar('PV', True) == args.version and rd.getVar('SRCREV', True) == args.srcrev:
-        raise DevtoolError("Current and upgrade versions are the same version" % version)
+    old_srcrev = rd.getVar('SRCREV', True)
+    if old_srcrev == 'INVALID':
+        old_srcrev = None
+    if old_srcrev and not args.srcrev:
+        raise DevtoolError("Recipe specifies a SRCREV value; you must specify a new one when upgrading")
+    if rd.getVar('PV', True) == args.version and old_srcrev == args.srcrev:
+        raise DevtoolError("Current and upgrade versions are the same version")
 
     rf = None
     try:
-- 
2.5.0


