Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8AC73163
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 20:08:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Sep 2016 13:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,358,1470726000"; d="scan'208";a="1058565562"
Received: from yewyangh-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.139])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2016 13:08:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 08:08:05 +1200
Message-Id: <a5e92379b3059d0ed457a2dd73ce00f53cadd23c.1474229259.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/10] recipetool: create: improve python recipe license handling
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
X-List-Received-Date: Sun, 18 Sep 2016 20:08:49 -0000

Try to ensure that for Apache, GPL and LGPL where the values extracted
from the "Classifiers" field may not be version-specific, if there is a
versioned license in the free-form license field then use that instead.
Also insert the free-form license field as a comment in the recipe for
the user's reference.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 30 ++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 354af0c..e41d81a 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -86,8 +86,11 @@ class PythonRecipeHandler(RecipeHandler):
     ]
     setuparg_multi_line_values = ['Description']
     replacements = [
+        ('License', r' +$', ''),
+        ('License', r'^ +', ''),
         ('License', r' ', '-'),
-        ('License', r'-License$', ''),
+        ('License', r'^GNU-', ''),
+        ('License', r'-[Ll]icen[cs]e(,?-[Vv]ersion)?', ''),
         ('License', r'^UNKNOWN$', ''),
 
         # Remove currently unhandled version numbers from these variables
@@ -216,6 +219,9 @@ class PythonRecipeHandler(RecipeHandler):
             else:
                 info = self.get_setup_args_info(setupscript)
 
+        # Grab the license value before applying replacements
+        license_str = info.get('License', '').strip()
+
         self.apply_info_replacements(info)
 
         if uses_setuptools:
@@ -223,17 +229,37 @@ class PythonRecipeHandler(RecipeHandler):
         else:
             classes.append('distutils')
 
+        if license_str:
+            for i, line in enumerate(lines_before):
+                if line.startswith('LICENSE = '):
+                    lines_before.insert(i, '# NOTE: License in setup.py/PKGINFO is: %s' % license_str)
+                    break
+
         if 'Classifier' in info:
+            existing_licenses = info.get('License', '')
             licenses = []
             for classifier in info['Classifier']:
                 if classifier in self.classifier_license_map:
                     license = self.classifier_license_map[classifier]
+                    if license == 'Apache' and 'Apache-2.0' in existing_licenses:
+                        license = 'Apache-2.0'
+                    elif license == 'GPL':
+                        if 'GPL-2.0' in existing_licenses or 'GPLv2' in existing_licenses:
+                            license = 'GPL-2.0'
+                        elif 'GPL-3.0' in existing_licenses or 'GPLv3' in existing_licenses:
+                            license = 'GPL-3.0'
+                    elif license == 'LGPL':
+                        if 'LGPL-2.1' in existing_licenses or 'LGPLv2.1' in existing_licenses:
+                            license = 'LGPL-2.1'
+                        elif 'LGPL-2.0' in existing_licenses or 'LGPLv2' in existing_licenses:
+                            license = 'LGPL-2.0'
+                        elif 'LGPL-3.0' in existing_licenses or 'LGPLv3' in existing_licenses:
+                            license = 'LGPL-3.0'
                     licenses.append(license)
 
             if licenses:
                 info['License'] = ' & '.join(licenses)
 
-
         # Map PKG-INFO & setup.py fields to bitbake variables
         for field, values in info.items():
             if field in self.excluded_fields:
-- 
2.5.5


