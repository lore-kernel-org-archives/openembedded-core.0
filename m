Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CDEF373286
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 08:50:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 14 Dec 2016 00:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="912033716"
Received: from oshau-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.185.66])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2016 00:49:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 21:49:50 +1300
Message-Id: <e2e11be34f7fb40dccf7d2ba45c7e8f6a7a10929.1481705295.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481705295.git.paul.eggleton@linux.intel.com>
References: <cover.1481705295.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1481705295.git.paul.eggleton@linux.intel.com>
References: <cover.1481705295.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] devtool: package: don't try to initialise tinfoil twice
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
X-List-Received-Date: Wed, 14 Dec 2016 08:50:13 -0000

setup_tinfoil() already calls prepare(), we don't need to call it again
ourselves and doing so with tinfoil2 results in "ERROR: Only one copy of
bitbake should be run against a build directory". Calling prepare()
twice should probably still be allowed, so that ought to be fixed
separately, but in the mean time this code is still wrong so fix it
here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/package.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index afb5809..4764064 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -28,10 +28,8 @@ def package(args, config, basepath, workspace):
     """Entry point for the devtool 'package' subcommand"""
     check_workspace_recipe(workspace, args.recipename)
 
-    tinfoil = setup_tinfoil(basepath=basepath)
+    tinfoil = setup_tinfoil(basepath=basepath, config_only=True)
     try:
-        tinfoil.prepare(config_only=True)
-
         image_pkgtype = config.get('Package', 'image_pkgtype', '')
         if not image_pkgtype:
             image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
-- 
2.5.5


