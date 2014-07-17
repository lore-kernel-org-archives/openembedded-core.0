Return-Path: <georgex.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 441AF7060C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 11:00:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2014 04:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,677,1400050800"; d="scan'208";a="574604402"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2014 04:00:17 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id BA3556A4087;
	Thu, 17 Jul 2014 03:59:42 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 13:57:00 +0300
Message-Id: <1405594620-10131-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] oeqs/selftest: Added test case decorators for toaster
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
X-List-Received-Date: Thu, 17 Jul 2014 11:00:43 -0000

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/selftest/_toaster.py | 94 ++++++++++++++++++++++++++------------
 1 file changed, 64 insertions(+), 30 deletions(-)

diff --git a/meta/lib/oeqa/selftest/_toaster.py b/meta/lib/oeqa/selftest/_toaster.py
index 5a42e93..1cf28a0 100644
--- a/meta/lib/oeqa/selftest/_toaster.py
+++ b/meta/lib/oeqa/selftest/_toaster.py
@@ -14,6 +14,7 @@ os.environ.setdefault("DJANGO_SETTINGS_MODULE", "toastermain.settings")
 import toastermain.settings
 from django.db.models import Q
 from orm.models import *
+from oeqa.utils.decorators import testcase
 
 class ToasterSetup(oeSelfTest):
 
@@ -31,19 +32,22 @@ class ToasterSetup(oeSelfTest):
 class Toaster_DB_Tests(ToasterSetup):
 
     # Check if build name is unique - tc_id=795
-    def test_Build_Unique_Name_TC795(self):
+    @testcase(795)
+    def test_Build_Unique_Name(self):
 	all_builds = Build.objects.all().count()
 	distinct_builds = Build.objects.values('id').distinct().count()
 	self.assertEqual(distinct_builds, all_builds, msg = 'Build name is not unique')
 
     # Check if build coocker log path is unique - tc_id=819
-    def test_Build_Unique_Cooker_Log_Path_TC819(self):
+    @testcase(819)
+    def test_Build_Unique_Cooker_Log_Path(self):
 	distinct_path = Build.objects.values('cooker_log_path').distinct().count()
 	total_builds = Build.objects.values('id').count()
 	self.assertEqual(distinct_path, total_builds, msg = 'Build coocker log path is not unique')
 
     # Check if the number of errors matches the number of orm_logmessage.level entries with value 2 - tc_id=820
-    def test_Build_Errors_No_TC820(self):
+    @testcase(820)
+    def test_Build_Errors_No(self):
 	builds = Build.objects.values('id', 'errors_no')
 	cnt_err = []
 	for build in builds:
@@ -53,7 +57,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for build id: %s' % cnt_err)
 
     # Check if the number of warnings matches the number of orm_logmessage.level entries with value 1 - tc=821
-    def test_Build_Warnings_No_TC821(self):
+    @testcase(821)
+    def test_Build_Warnings_No(self):
 	builds = Build.objects.values('id', 'warnings_no')
 	cnt_err = []
 	for build in builds:
@@ -63,7 +68,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for build id: %s' % cnt_err)
 
     # Check if the build succeeded then the errors_no is 0 - tc_id=822
-    def test_Build_Suceeded_Errors_No_TC822(self):
+    @testcase(822)
+    def test_Build_Suceeded_Errors_No(self):
 	builds = Build.objects.filter(outcome = 0).values('id', 'errors_no')
 	cnt_err = []
 	for build in builds:
@@ -71,8 +77,9 @@ class Toaster_DB_Tests(ToasterSetup):
 		cnt_err.append(build['id'])
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for build id: %s' % cnt_err)
 
-    # Check if task order is unique for one build - tc=824	
-    def test_Task_Unique_Order_TC824(self):
+    # Check if task order is unique for one build - tc=824
+    @testcase(824)	
+    def test_Task_Unique_Order(self):
 	builds = Build.objects.values('id')
 	cnt_err = []
 	for build in builds:
@@ -83,7 +90,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for build id: %s' % cnt_err)
 
     # Check task order sequence for one build - tc=825
-    def test_Task_Order_Sequence_TC825(self):
+    @testcase(825)
+    def test_Task_Order_Sequence(self):
 	builds = builds = Build.objects.values('id')
 	cnt_err = []
 	for build in builds:
@@ -100,7 +108,8 @@ class Toaster_DB_Tests(ToasterSetup):
     #def test_Task_Disk_IO_TC828(self):
 
     # Check if outcome = 2 (SSTATE) then sstate_result must be 3 (RESTORED) - tc=832
-    def test_Task_If_Outcome_2_Sstate_Result_Must_Be_3_TC832(self):
+    @testcase(832)
+    def test_Task_If_Outcome_2_Sstate_Result_Must_Be_3(self):
 	tasks = Task.objects.filter(outcome = 2).values('id', 'sstate_result')
 	cnt_err = []
 	for task in tasks:
@@ -109,7 +118,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
 
     # Check if outcome = 1 (COVERED) or 3 (EXISTING) then sstate_result must be 0 (SSTATE_NA) - tc=833
-    def test_Task_If_Outcome_1_3_Sstate_Result_Must_Be_0_TC833(self):
+    @testcase(833)
+    def test_Task_If_Outcome_1_3_Sstate_Result_Must_Be_0(self):
 	tasks = Task.objects.filter(outcome__in = (1, 3)).values('id', 'sstate_result')
 	cnt_err = []
 	for task in tasks:
@@ -118,7 +128,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
 
     # Check if outcome is 0 (SUCCESS) or 4 (FAILED) then sstate_result must be 0 (NA), 1 (MISS) or 2 (FAILED) - tc=834
-    def test_Task_If_Outcome_0_4_Sstate_Result_Must_Be_0_1_2_TC834(self):
+    @testcase(834)
+    def test_Task_If_Outcome_0_4_Sstate_Result_Must_Be_0_1_2(self):
 	tasks = Task.objects.filter(outcome__in = (0, 4)).values('id', 'sstate_result')
 	cnt_err = []
 	for task in tasks:
@@ -127,7 +138,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
 
     # Check if task_executed = TRUE (1), script_type must be 0 (CODING_NA), 2 (CODING_PYTHON), 3 (CODING_SHELL) - tc=891
-    def test_Task_If_Task_Executed_True_Script_Type_0_2_3_TC891(self):
+    @testcase(891)
+    def test_Task_If_Task_Executed_True_Script_Type_0_2_3(self):
 	tasks = Task.objects.filter(task_executed = 1).values('id', 'script_type')
 	cnt_err = []
 	for task in tasks:
@@ -136,7 +148,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
 
     # Check if task_executed = TRUE (1), outcome must be 0 (SUCCESS) or 4 (FAILED) - tc=836
-    def test_Task_If_Task_Executed_True_Outcome_0_4_TC836(self):
+    @testcase(836)
+    def test_Task_If_Task_Executed_True_Outcome_0_4(self):
 	tasks = Task.objects.filter(task_executed = 1).values('id', 'outcome')
 	cnt_err = []
 	for task in tasks:
@@ -145,7 +158,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
 
     # Check if task_executed = FALSE (0), script_type must be 0 - tc=890
-    def test_Task_If_Task_Executed_False_Script_Type_0_TC890(self):
+    @testcase(890)
+    def test_Task_If_Task_Executed_False_Script_Type_0(self):
 	tasks = Task.objects.filter(task_executed = 0).values('id', 'script_type')
 	cnt_err = []
 	for task in tasks:
@@ -154,7 +168,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
 
     # Check if task_executed = FALSE (0) and build outcome = SUCCEEDED (0), task outcome must be 1 (COVERED), 2 (CACHED), 3 (PREBUILT), 5 (EMPTY) - tc=837
-    def test_Task_If_Task_Executed_False_Outcome_1_2_3_5_TC837(self):
+    @testcase(837)
+    def test_Task_If_Task_Executed_False_Outcome_1_2_3_5(self):
 	builds = Build.objects.filter(outcome = 0).values('id')
 	cnt_err = []
 	for build in builds:
@@ -165,7 +180,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
 
     # Key verification - tc=888
-    def test_Target_Installed_Package_TC888(self):
+    @testcase(888)
+    def test_Target_Installed_Package(self):
 	rows = Target_Installed_Package.objects.values('id', 'target_id', 'package_id')
 	cnt_err = []
 	for row in rows:
@@ -176,7 +192,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for target installed package id: %s' % cnt_err)
 
     # Key verification - tc=889
-    def test_Task_Dependency_TC889(self):
+    @testcase(889)
+    def test_Task_Dependency(self):
 	rows = Task_Dependency.objects.values('id', 'task_id', 'depends_on_id')
 	cnt_err = []
 	for row in rows:
@@ -188,6 +205,7 @@ class Toaster_DB_Tests(ToasterSetup):
 
     # Check if build target file_name is populated only if is_image=true AND orm_build.outcome=0 then if the file exists and its size matches the file_size value
     ### Need to add the tc in the test run
+    @testcase(1037)
     def test_Target_File_Name_Populated(self):
 	builds = Build.objects.filter(outcome = 0).values('id')
 	for build in builds:
@@ -210,7 +228,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for target image file id: %s' % cnt_err)
 
     # Key verification - tc=884
-    def test_Package_Dependency_TC884(self):
+    @testcase(884)
+    def test_Package_Dependency(self):
 	cnt_err = []
 	deps = Package_Dependency.objects.values('id', 'package_id', 'depends_on_id')
 	for dep in deps:
@@ -219,7 +238,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for package dependency id: %s' % cnt_err)
 
     # Check if recipe name does not start with a number (0-9) - tc=838
-    def test_Recipe_Name_TC838(self):
+    @testcase(838)
+    def test_Recipe_Name(self):
 	recipes = Recipe.objects.values('id', 'name')
 	cnt_err = []
 	for recipe in recipes:
@@ -228,7 +248,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe id: %s' % cnt_err)
 
     # Check if recipe section matches the content of the SECTION variable (if set) in file_path - tc=839
-    def test_Recipe_DB_Section_Match_Recipe_File_Section_TC839(self):
+    @testcase(839)
+    def test_Recipe_DB_Section_Match_Recipe_File_Section(self):
 	recipes = Recipe.objects.values('id', 'section', 'file_path')
 	cnt_err = []
 	for recipe in recipes:
@@ -245,7 +266,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe id: %s' % cnt_err)
 
     # Check if recipe license matches the content of the LICENSE variable (if set) in file_path - tc=840
-    def test_Recipe_DB_License_Match_Recipe_File_License_TC840(self):
+    @testcase(840)
+    def test_Recipe_DB_License_Match_Recipe_File_License(self):
 	recipes = Recipe.objects.values('id', 'license', 'file_path')
 	cnt_err = []
 	for recipe in recipes:
@@ -262,7 +284,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe id: %s' % cnt_err)
 
     # Check if recipe homepage matches the content of the HOMEPAGE variable (if set) in file_path - tc=841
-    def test_Recipe_DB_Homepage_Match_Recipe_File_Homepage_TC841(self):
+    @testcase(841)
+    def test_Recipe_DB_Homepage_Match_Recipe_File_Homepage(self):
 	recipes = Recipe.objects.values('id', 'homepage', 'file_path')
 	cnt_err = []
 	for recipe in recipes:
@@ -279,7 +302,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe id: %s' % cnt_err)
 
     # Check if recipe bugtracker matches the content of the BUGTRACKER variable (if set) in file_path - tc=842
-    def test_Recipe_DB_Bugtracker_Match_Recipe_File_Bugtracker_TC842(self):
+    @testcase(842)
+    def test_Recipe_DB_Bugtracker_Match_Recipe_File_Bugtracker(self):
 	recipes = Recipe.objects.values('id', 'bugtracker', 'file_path')
 	cnt_err = []
 	for recipe in recipes:
@@ -296,7 +320,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe id: %s' % cnt_err)
 
     # Recipe key verification, recipe name does not depends on a recipe having the same name - tc=883
-    def test_Recipe_Dependency_TC883(self):
+    @testcase(883)
+    def test_Recipe_Dependency(self):
 	deps = Recipe_Dependency.objects.values('id', 'recipe_id', 'depends_on_id')
 	cnt_err = []
 	for dep in deps:
@@ -310,7 +335,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe dependency id: %s' % cnt_err)
 
     # Check if package name does not start with a number (0-9) - tc=846
-    def test_Package_Name_For_Number_TC846(self):
+    @testcase(846)
+    def test_Package_Name_For_Number(self):
 	packages = Package.objects.filter(~Q(size = -1)).values('id', 'name')
 	cnt_err = []
 	for package in packages:
@@ -319,7 +345,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for package id: %s' % cnt_err)
 
     # Check if package version starts with a number (0-9) - tc=847
-    def test_Package_Version_Starts_With_Number_TC847(self):
+    @testcase(847)
+    def test_Package_Version_Starts_With_Number(self):
 	packages = Package.objects.filter(~Q(size = -1)).values('id', 'version')
 	cnt_err = []
 	for package in packages:
@@ -328,7 +355,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for package id: %s' % cnt_err)
 
     # Check if package revision starts with 'r' - tc=848
-    def test_Package_Revision_Starts_With_r_TC848(self):
+    @testcase(848)
+    def test_Package_Revision_Starts_With_r(self):
 	packages = Package.objects.filter(~Q(size = -1)).values('id', 'revision')
 	cnt_err = []
 	for package in packages:
@@ -338,6 +366,7 @@ class Toaster_DB_Tests(ToasterSetup):
 
     # Check the validity of the package build_id
     ### TC must be added in test run
+    @testcase(1038)
     def test_Package_Build_Id(self):
 	packages = Package.objects.filter(~Q(size = -1)).values('id', 'build_id')
 	cnt_err = []
@@ -349,6 +378,7 @@ class Toaster_DB_Tests(ToasterSetup):
 
     # Check the validity of package recipe_id
     ### TC must be added in test run
+    @testcase(1039)
     def test_Package_Recipe_Id(self):
 	packages = Package.objects.filter(~Q(size = -1)).values('id', 'recipe_id')
 	cnt_err = []
@@ -360,6 +390,7 @@ class Toaster_DB_Tests(ToasterSetup):
 
     # Check if package installed_size field is not null
     ### TC must be aded in test run
+    @testcase(1040)
     def test_Package_Installed_Size_Not_NULL(self):
 	packages = Package.objects.filter(installed_size__isnull = True).values('id')
 	cnt_err = []
@@ -368,7 +399,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for package id: %s' % cnt_err)
 
     # Check if all layers requests return exit code is 200 - tc=843
-    def test_Layers_Requests_Exit_Code_TC843(self):
+    @testcase(843)
+    def test_Layers_Requests_Exit_Code(self):
 	layers = Layer.objects.values('id', 'layer_index_url')
 	cnt_err = []
 	for layer in layers:
@@ -378,7 +410,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for layer id: %s' % cnt_err)
 
     # Check if the output of bitbake-layers show_layers matches the info from database - tc=895
-    def test_Layers_Show_Layers_TC895(self):
+    @testcase(895)
+    def test_Layers_Show_Layers(self):
 	layers = Layer.objects.values('id', 'name', 'local_path')
 	cmd = commands.getoutput('bitbake-layers show_layers')
 	cnt_err = []
@@ -388,7 +421,8 @@ class Toaster_DB_Tests(ToasterSetup):
 	self.assertEqual(len(cnt_err), 0, msg = 'Errors for layer id: %s' % cnt_err)
 
     # Check if django server starts regardless of the timezone set on the machine - tc=905
-    def test_Start_Django_Timezone_TC905(self):
+    @testcase(905)
+    def test_Start_Django_Timezone(self):
         current_path = os.getcwd()
 	zonefilelist = []
         ZONEINFOPATH = '/usr/share/zoneinfo/'
-- 
1.9.1


