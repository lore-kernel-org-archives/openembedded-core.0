Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C402C7318B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2015 20:04:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621978888"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:02:57 +1300
Message-Id: <0443897aba52e93a3cc7cbf3a3c2d730c9ab75ae.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/26] recipetool: create: fix do_install handling for makefile-only software
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:20 -0000

In my testing here it appears make -qn returns an error (exit code 2)
whereas make -n doesn't; I can't immediately tell why based on the
documentation. We don't actually care for it to be quiet since we're
capturing the output, so let's just leave -q off and have this work
properly as a result.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index ed14a53..931ef3b 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -279,7 +279,7 @@ class MakefileRecipeHandler(RecipeHandler):
 
             installtarget = True
             try:
-                stdout, stderr = bb.process.run('make -qn install', cwd=srctree, shell=True)
+                stdout, stderr = bb.process.run('make -n install', cwd=srctree, shell=True)
             except bb.process.ExecutionError as e:
                 if e.exitcode != 1:
                     installtarget = False
-- 
2.5.0


