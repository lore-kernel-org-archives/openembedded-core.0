Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6A82471DEE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 May 2017 22:00:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 14 May 2017 15:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,341,1491289200"; d="scan'208";a="261524615"
Received: from cdhirema-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.50])
	by fmsmga004.fm.intel.com with ESMTP; 14 May 2017 15:00:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 09:59:52 +1200
Message-Id: <3e4f2fa598a5061215315f53dc2086718cce295d.1494799168.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1494799168.git.paul.eggleton@linux.intel.com>
References: <cover.1494799168.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] recipetool: create: skip values extracted from spec files containing macros
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
X-List-Received-Date: Sun, 14 May 2017 22:00:20 -0000

If a value we extract from a spec file contains an unexpanded macro
(e.g. %{macroname}) then we should discard it since we're not seeing the
actual value and we don't have an easy way of expanding it at the
moment.

This fixes for example getting %{name} as the recipe name when running
the following:

recipetool create https://github.com/gavincarr/mod_auth_tkt.git

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index e914e53..4743c74 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -863,6 +863,10 @@ class SpecFileRecipeHandler(RecipeHandler):
                             break
                     if len(foundvalues) == len(valuemap):
                         break
+        # Drop values containing unexpanded RPM macros
+        for k in list(foundvalues.keys()):
+            if '%' in foundvalues[k]:
+                del foundvalues[k]
         if 'PV' in foundvalues:
             if not validate_pv(foundvalues['PV']):
                 del foundvalues['PV']
-- 
2.9.3


