Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 65E9373281
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 13:07:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2016 06:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,541,1455004800"; d="scan'208";a="793467212"
Received: from wlee9-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.75])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2016 06:06:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 01:06:19 +1200
Message-Id: <32728ba0a630ec2c4f3c97653e3176161922c5b8.1461762339.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1461762339.git.paul.eggleton@linux.intel.com>
References: <cover.1461762339.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1461762339.git.paul.eggleton@linux.intel.com>
References: <cover.1461762339.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] recipetool: create: fix falling back to declared license for npm packages
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
X-List-Received-Date: Wed, 27 Apr 2016 13:07:12 -0000

Fix two problems falling back to the "license" field from package.json
when no license file is present:
1) The function that was supposed to return the license field value was
   always explicitly returning None, and this was never noticed (because
   the test cases never exercised the fallback as they provided license
   files for each module).
2) Fix the main package not falling back because it had a default of an
   empty list, which evaluates to '' instead of 'Unknown'.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py     | 2 +-
 scripts/lib/recipetool/create_npm.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index bb9fb9b..aade40b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -854,7 +854,7 @@ def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=None, pn
             pkglicenses[pn].append(license)
     outlicenses = {}
     for pkgname in packages:
-        license = ' '.join(list(set(pkglicenses.get(pkgname, ['Unknown']))))
+        license = ' '.join(list(set(pkglicenses.get(pkgname, ['Unknown'])))) or 'Unknown'
         if license == 'Unknown' and pkgname in fallback_licenses:
             license = fallback_licenses[pkgname]
         outlines.append('LICENSE_%s = "%s"' % (pkgname, license))
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index b3ffcdb..cc4fb42 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -45,7 +45,7 @@ class NpmRecipeHandler(RecipeHandler):
             license = data['license']
             if isinstance(license, dict):
                 license = license.get('type', None)
-        return None
+        return license
 
     def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_before):
         try:
-- 
2.5.5


