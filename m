Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C8A5060123
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 23:57:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 06 Jul 2016 16:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,322,1464678000"; d="scan'208";a="1016966632"
Received: from lynhueyo-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.219])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2016 16:57:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 11:57:11 +1200
Message-Id: <2d2ecd1452207bdc8d3884d9853ffd53a1058bd0.1467849364.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467849364.git.paul.eggleton@linux.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467849364.git.paul.eggleton@linux.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] devtool: reset: allow reset to work if the recipe file has been deleted
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
X-List-Received-Date: Wed, 06 Jul 2016 23:57:44 -0000

We were attempting to open the recipe file unconditionally here - we
need to account for the possibility that the recipe file has been
deleted or moved away by the user.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a7e365f..8236dd5 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1327,7 +1327,7 @@ def reset(args, config, basepath, workspace):
         for recipe in recipes:
             targets.append(recipe)
             recipefile = workspace[recipe]['recipefile']
-            if recipefile:
+            if recipefile and os.path.exists(recipefile):
                 targets.extend(get_bbclassextend_targets(recipefile, recipe))
         try:
             exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % ' '.join(targets))
-- 
2.5.5


