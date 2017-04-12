Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BD55C77C31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 10:41:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 03:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,190,1488873600"; d="scan'208";a="247654566"
Received: from lheah-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.133.64])
	by fmsmga004.fm.intel.com with ESMTP; 12 Apr 2017 03:41:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 22:41:26 +1200
Message-Id: <8619cdaa74a617eada0c2c20995fd777ecc45028.1491993601.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491993601.git.paul.eggleton@linux.intel.com>
References: <cover.1491993601.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] recipetool: create: fix for regression in npm license handling
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
X-List-Received-Date: Wed, 12 Apr 2017 10:41:35 -0000

OE-Core commit c0cfd9b1d54b05ad048f444d6fe248aa0500159e added handling
for AND / OR in license strings coming from npm, but made the assumption
that an & would always be present in the license value. Check if it's
there first so we don't fail if it isn't.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_npm.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index a215026..eb19555 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -240,7 +240,8 @@ class NpmRecipeHandler(RecipeHandler):
                     packages['${PN}'] = ''
                     pkglicenses = split_pkg_licenses(licvalues, packages, lines_after, licenses)
                     all_licenses = list(set([item.replace('_', ' ') for pkglicense in pkglicenses.values() for item in pkglicense]))
-                    all_licenses.remove('&')
+                    if '&' in all_licenses:
+                        all_licenses.remove('&')
                     # Go back and update the LICENSE value since we have a bit more
                     # information than when that was written out (and we know all apply
                     # vs. there being a choice, so we can join them with &)
-- 
2.9.3


