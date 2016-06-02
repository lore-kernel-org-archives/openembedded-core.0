Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 41718773D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:13:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jun 2016 03:13:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="993699736"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2016 03:13:50 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 321EB6A4008
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:17 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:12:49 +0300
Message-Id: <c4ece1668b56b37967f2f63b8e60d136086ebd8b.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 03/16] scripts: python3: rename raw_input to input
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
X-List-Received-Date: Thu, 02 Jun 2016 10:13:50 -0000

Renamed raw_input to input as raw_input does not
exist in python 3.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/bsp/engine.py        | 12 ++++++------
 scripts/lib/bsp/kernel.py        | 12 ++++++------
 scripts/oepydevshell-internal.py |  2 +-
 scripts/send-error-report        |  6 +++---
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index 3ab4295..f75454d 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -464,9 +464,9 @@ class ListInputLine(InputLine):
         choices_str = self.gen_choices_str(choicepairs)
         choices_val_list = self.gen_choices_val_list(choicepairs)
         if checklist:
-            choiceval = default(find_choicevals(raw_input(msg + "\n" + choices_str), choices_val_list), default_choice)
+            choiceval = default(find_choicevals(input(msg + "\n" + choices_str), choices_val_list), default_choice)
         else:
-            choiceval = default(find_choiceval(raw_input(msg + "\n" + choices_str), choices_val_list), default_choice)
+            choiceval = default(find_choiceval(input(msg + "\n" + choices_str), choices_val_list), default_choice)
 
         return choiceval
 
@@ -540,12 +540,12 @@ def get_verified_git_repo(input_str, name):
     """
     msg = input_str.strip() + " "
 
-    giturl = default(raw_input(msg), name)
+    giturl = default(input(msg), name)
 
     while True:
         if verify_git_repo(giturl):
             return giturl
-        giturl = default(raw_input(msg), name)
+        giturl = default(input(msg), name)
 
 
 def get_verified_file(input_str, name, filename_can_be_null):
@@ -555,14 +555,14 @@ def get_verified_file(input_str, name, filename_can_be_null):
     """
     msg = input_str.strip() + " "
 
-    filename = default(raw_input(msg), name)
+    filename = default(input(msg), name)
 
     while True:
         if not filename and filename_can_be_null:
             return filename
         if os.path.isfile(filename):
             return filename
-        filename = default(raw_input(msg), name)
+        filename = default(input(msg), name)
 
 
 def replace_file(replace_this, with_this):
diff --git a/scripts/lib/bsp/kernel.py b/scripts/lib/bsp/kernel.py
index 5bfa663..3c4b798 100644
--- a/scripts/lib/bsp/kernel.py
+++ b/scripts/lib/bsp/kernel.py
@@ -202,8 +202,8 @@ def yocto_kernel_config_rm(scripts_path, machine):
     config_items = read_config_items(scripts_path, machine)
 
     print("Specify the kernel config items to remove:")
-    input = raw_input(gen_choices_str(config_items))
-    rm_choices = input.split()
+    inp = input(gen_choices_str(config_items))
+    rm_choices = inp.split()
     rm_choices.sort()
 
     removed = []
@@ -359,8 +359,8 @@ def yocto_kernel_patch_rm(scripts_path, machine):
     patches = read_patch_items(scripts_path, machine)
 
     print("Specify the patches to remove:")
-    input = raw_input(gen_choices_str(patches))
-    rm_choices = input.split()
+    inp = input(gen_choices_str(patches))
+    rm_choices = inp.split()
     rm_choices.sort()
 
     removed = []
@@ -610,8 +610,8 @@ def yocto_kernel_feature_rm(scripts_path, machine):
     features = read_features(scripts_path, machine)
 
     print("Specify the features to remove:")
-    input = raw_input(gen_choices_str(features))
-    rm_choices = input.split()
+    inp = input(gen_choices_str(features))
+    rm_choices = inp.split()
     rm_choices.sort()
 
     removed = []
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index f7b2e4e..2566606 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -67,7 +67,7 @@ try:
                     i = i[4096:]
                 if sys.stdin in ready:
                     echonocbreak(sys.stdin.fileno())
-                    o = raw_input()
+                    o = input()
                     cbreaknoecho(sys.stdin.fileno())
                     pty.write(o + "\n")
             except (IOError, OSError) as e:
diff --git a/scripts/send-error-report b/scripts/send-error-report
index ed78bd6..7251e27 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -44,12 +44,12 @@ def getPayloadLimit(url):
 
 def ask_for_contactdetails():
     print("Please enter your name and your email (optionally), they'll be saved in the file you send.")
-    username = raw_input("Name (required): ")
-    email = raw_input("E-mail (not required): ")
+    username = input("Name (required): ")
+    email = input("E-mail (not required): ")
     return username, email
 
 def edit_content(json_file_path):
-    edit = raw_input("Review information before sending? (y/n): ")
+    edit = input("Review information before sending? (y/n): ")
     if 'y' in edit or 'Y' in edit:
         editor = os.environ.get('EDITOR', None)
         if editor:
-- 
2.1.4


