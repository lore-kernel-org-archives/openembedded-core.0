Return-Path: <stanciux.mihail@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D74B7673C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 14:53:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 07 Aug 2015 07:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,630,1432623600"; d="scan'208";a="537791404"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2015 07:53:28 -0700
Received: from localhost.localdomain (unknown [10.237.112.206])
	by linux.intel.com (Postfix) with ESMTP id 392932E055B;
	Fri,  7 Aug 2015 07:52:40 -0700 (PDT)
From: Mihail Stanciu <stanciux.mihail@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 19:18:09 +0300
Message-Id: <1438964289-10870-1-git-send-email-stanciux.mihail@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [selftest][PATCH] Removed tests for TCs that are no longer valid
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
X-List-Received-Date: Fri, 07 Aug 2015 14:53:28 -0000

Several toaster backend tests are no longer valid due to design changes.

Signed-off-by: Mihail Stanciu <stanciux.mihail@intel.com>
---
 meta/lib/oeqa/selftest/_toaster.py | 125 -------------------------------------
 1 file changed, 125 deletions(-)

diff --git a/meta/lib/oeqa/selftest/_toaster.py b/meta/lib/oeqa/selftest/_toaster.py
index 51ebda3..c424659 100644
--- a/meta/lib/oeqa/selftest/_toaster.py
+++ b/meta/lib/oeqa/selftest/_toaster.py
@@ -45,38 +45,6 @@ class Toaster_DB_Tests(ToasterSetup):
         total_builds = Build.objects.values('id').count()
         self.assertEqual(distinct_path, total_builds, msg = 'Build coocker log path is not unique')
 
-    # Check if the number of errors matches the number of orm_logmessage.level entries with value 2 - tc_id=820
-    @testcase(820)
-    def test_Build_Errors_No(self):
-        builds = Build.objects.values('id', 'errors_no')
-        cnt_err = []
-        for build in builds:
-            log_mess_err_no = LogMessage.objects.filter(build = build['id'], level = 2).count()
-            if (build['errors_no'] != log_mess_err_no):
-                cnt_err.append(build['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for build id: %s' % cnt_err)
-
-    # Check if the number of warnings matches the number of orm_logmessage.level entries with value 1 - tc=821
-    @testcase(821)
-    def test_Build_Warnings_No(self):
-        builds = Build.objects.values('id', 'warnings_no')
-        cnt_err = []
-        for build in builds:
-            log_mess_warn_no = LogMessage.objects.filter(build = build['id'], level = 1).count()
-            if (build['warnings_no'] != log_mess_warn_no):
-                cnt_err.append(build['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for build id: %s' % cnt_err)
-
-    # Check if the build succeeded then the errors_no is 0 - tc_id=822
-    @testcase(822)
-    def test_Build_Suceeded_Errors_No(self):
-        builds = Build.objects.filter(outcome = 0).values('id', 'errors_no')
-        cnt_err = []
-        for build in builds:
-            if (build['errors_no'] != 0):
-                cnt_err.append(build['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for build id: %s' % cnt_err)
-
     # Check if task order is unique for one build - tc=824
     @testcase(824)
     def test_Task_Unique_Order(self):
@@ -237,88 +205,6 @@ class Toaster_DB_Tests(ToasterSetup):
                 cnt_err.append(dep['id'])
         self.assertEqual(len(cnt_err), 0, msg = 'Errors for package dependency id: %s' % cnt_err)
 
-    # Check if recipe name does not start with a number (0-9) - tc=838
-    @testcase(838)
-    def test_Recipe_Name(self):
-        recipes = Recipe.objects.values('id', 'name')
-        cnt_err = []
-        for recipe in recipes:
-            if (recipe['name'][0].isdigit() is True):
-                cnt_err.append(recipe['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe id: %s' % cnt_err)
-
-    # Check if recipe section matches the content of the SECTION variable (if set) in file_path - tc=839
-    @testcase(839)
-    def test_Recipe_DB_Section_Match_Recipe_File_Section(self):
-        recipes = Recipe.objects.values('id', 'section', 'file_path')
-        cnt_err = []
-        for recipe in recipes:
-            file_path = self.fix_file_path(recipe['file_path'])
-            file_exists = os.path.isfile(file_path)
-            if (not file_path or (file_exists is False)):
-                cnt_err.append(recipe['id'])
-            else:
-                file_section = self.recipe_parse(file_path, "SECTION = ")
-                db_section = recipe['section']
-                if file_section:
-                    if (db_section != file_section):
-                        cnt_err.append(recipe['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe id: %s' % cnt_err)
-
-    # Check if recipe license matches the content of the LICENSE variable (if set) in file_path - tc=840
-    @testcase(840)
-    def test_Recipe_DB_License_Match_Recipe_File_License(self):
-        recipes = Recipe.objects.values('id', 'license', 'file_path')
-        cnt_err = []
-        for recipe in recipes:
-            file_path = self.fix_file_path(recipe['file_path'])
-            file_exists = os.path.isfile(file_path)
-            if (not file_path or (file_exists is False)):
-                cnt_err.append(recipe['id'])
-            else:
-                file_license = self.recipe_parse(file_path, "LICENSE = ")
-                db_license = recipe['license']
-                if file_license:
-                    if (db_license != file_license):
-                        cnt_err.append(recipe['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe id: %s' % cnt_err)
-
-    # Check if recipe homepage matches the content of the HOMEPAGE variable (if set) in file_path - tc=841
-    @testcase(841)
-    def test_Recipe_DB_Homepage_Match_Recipe_File_Homepage(self):
-        recipes = Recipe.objects.values('id', 'homepage', 'file_path')
-        cnt_err = []
-        for recipe in recipes:
-            file_path = self.fix_file_path(recipe['file_path'])
-            file_exists = os.path.isfile(file_path)
-            if (not file_path or (file_exists is False)):
-                cnt_err.append(recipe['id'])
-            else:
-                file_homepage = self.recipe_parse(file_path, "HOMEPAGE = ")
-                db_homepage = recipe['homepage']
-                if file_homepage:
-                    if (db_homepage != file_homepage):
-                        cnt_err.append(recipe['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe id: %s' % cnt_err)
-
-    # Check if recipe bugtracker matches the content of the BUGTRACKER variable (if set) in file_path - tc=842
-    @testcase(842)
-    def test_Recipe_DB_Bugtracker_Match_Recipe_File_Bugtracker(self):
-        recipes = Recipe.objects.values('id', 'bugtracker', 'file_path')
-        cnt_err = []
-        for recipe in recipes:
-            file_path = self.fix_file_path(recipe['file_path'])
-            file_exists = os.path.isfile(file_path)
-            if (not file_path or (file_exists is False)):
-                cnt_err.append(recipe['id'])
-            else:
-                file_bugtracker = self.recipe_parse(file_path, "BUGTRACKER = ")
-                db_bugtracker = recipe['bugtracker']
-                if file_bugtracker:
-                    if (db_bugtracker != file_bugtracker):
-                        cnt_err.append(recipe['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe id: %s' % cnt_err)
-
     # Recipe key verification, recipe name does not depends on a recipe having the same name - tc=883
     @testcase(883)
     def test_Recipe_Dependency(self):
@@ -409,17 +295,6 @@ class Toaster_DB_Tests(ToasterSetup):
                 cnt_err.append(layer['id'])
         self.assertEqual(len(cnt_err), 0, msg = 'Errors for layer id: %s' % cnt_err)
 
-    # Check if the output of bitbake-layers show_layers matches the info from database - tc=895
-    @testcase(895)
-    def test_Layers_Show_Layers(self):
-        layers = Layer.objects.values('id', 'name', 'local_path')
-        cmd = commands.getoutput('bitbake-layers show_layers')
-        cnt_err = []
-        for layer in layers:
-            if (layer['name'] or layer['local_path']) not in cmd:
-                cnt_err.append(layer['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for layer id: %s' % cnt_err)
-
     # Check if django server starts regardless of the timezone set on the machine - tc=905
     @testcase(905)
     def test_Start_Django_Timezone(self):
-- 
2.1.4


