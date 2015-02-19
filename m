Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DE026735BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425645"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:39:59 +0000
Message-Id: <84225c91ac9967259a1eb2fe98c8963c9a53852b.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/15] lib/oe/recipeutils: minor improvements to patch_recipe()
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:32 -0000

* Ensure it knows where to put SRCREV and S
* Handle prepend/append and functions in general

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 1758dce..159a103 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -18,7 +18,7 @@ from collections import OrderedDict, defaultdict
 
 
 # Help us to find places to insert values
-recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRC_URI', 'do_fetch', 'do_unpack', 'do_patch', 'EXTRA_OECONF', 'do_configure', 'EXTRA_OEMAKE', 'do_compile', 'do_install', 'do_populate_sysroot', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'do_package', 'do_deploy']
+recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRC_URI', 'S', 'do_fetch', 'do_unpack', 'do_patch', 'EXTRA_OECONF', 'do_configure', 'EXTRA_OEMAKE', 'do_compile', 'do_install', 'do_populate_sysroot', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'do_package', 'do_deploy']
 # Variables that sometimes are a bit long but shouldn't be wrapped
 nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER']
 list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
@@ -113,7 +113,7 @@ def patch_recipe_file(fn, values, patch=False, relpath=''):
                         insert = False
                         for k in remainingnames.keys():
                             for p in recipe_progression:
-                                if re.match('^%s[ ?:=]' % p, line):
+                                if re.match('^%s(_prepend|_append)*[ ?:=(]' % p, line):
                                     if remainingnames[k] > -1 and recipe_progression.index(p) > remainingnames[k] and runthrough > 1 and not k in existingnames:
                                         outputvalue(k)
                                         del remainingnames[k]
-- 
1.9.3


