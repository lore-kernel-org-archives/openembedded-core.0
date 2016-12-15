Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B7BC177347
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 21:17:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2016 13:17:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,354,1477983600"; d="scan'208";a="203074702"
Received: from weipengl-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.182.212])
	by fmsmga004.fm.intel.com with ESMTP; 15 Dec 2016 13:17:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 10:17:37 +1300
Message-Id: <0da624f81c0d1ff1156464927878b718db955d48.1481836625.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481836625.git.paul.eggleton@linux.intel.com>
References: <cover.1481836625.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] devtool: modify: fix usage on the kernel
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
X-List-Received-Date: Thu, 15 Dec 2016 21:17:46 -0000

When using devtool modify on the kernel, we have to do a bit of a dance
with tinfoil instances because we only find out that we're working on a
kernel recipe after tinfoil is initialised, but then we need to build
kern-tools-native which we're doing just by running bitbake directly.
With the tinfoil2 changes, a datastore for the recipe that we were
keeping around across the opening and closing of tinfoil is no longer
able to be used. Re-parse the recipe to avoid this problem.

(In future this whole thing will be able to be done in the same tinfoil
instance thanks to tinfoil2, but that refactoring is yet to be done.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c52b006..793fdaf 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -746,6 +746,8 @@ def modify(args, config, basepath, workspace):
             if not tinfoil:
                 # Error already shown
                 return 1
+            # We need to re-parse because tinfoil may have been re-initialised
+            rd = parse_recipe(config, tinfoil, args.recipename, True)
 
         recipefile = rd.getVar('FILE', True)
         appendfile = recipe_to_append(recipefile, config, args.wildcard)
-- 
2.5.5


