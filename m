Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E575977407
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:14:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jun 2016 03:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="979359559"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2016 03:14:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 736A26A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:13:00 +0300
Message-Id: <1510a782cfd3508049b31a69e233cdfc48c43ab5.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 14/16] scripts: python3: decode subprocess output
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
X-List-Received-Date: Thu, 02 Jun 2016 10:14:02 -0000

stdeout and stderr content returned by subprocess API has different
types in Python 3(bytes) and Python 2(string). Decoding it to
'utf-8' makes it unicode on both pythons.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/cleanup-workdir   |  2 +-
 scripts/combo-layer       |  2 +-
 scripts/lib/bsp/kernel.py | 10 +++++-----
 scripts/oe-selftest       |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index fee464c..0b2cf99 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -45,7 +45,7 @@ def run_command(cmd):
     if pipe.returncode != 0:
         print("Execute command '%s' failed." % cmd)
         sys.exit(1)
-    return output
+    return output.decode('utf-8')
 
 def get_cur_arch_dirs(workdir, arch_dirs):
     pattern = workdir + '/(.*?)/'
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 0954bb6..7f0fa48 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -198,7 +198,7 @@ def runcmd(cmd,destdir=None,printerr=True,out=None,env=None):
         raise e
 
     err.seek(0)
-    output = err.read()
+    output = err.read().decode('utf-8')
     logger.debug("output: %s" % output.replace(chr(0), '\\0'))
     return output
 
diff --git a/scripts/lib/bsp/kernel.py b/scripts/lib/bsp/kernel.py
index fe7133d..91cc79c 100644
--- a/scripts/lib/bsp/kernel.py
+++ b/scripts/lib/bsp/kernel.py
@@ -49,7 +49,7 @@ def find_bblayers():
 
     bitbake_env_cmd = "bitbake -e"
     bitbake_env_lines = subprocess.Popen(bitbake_env_cmd, shell=True,
-                                         stdout=subprocess.PIPE).stdout.read()
+                                         stdout=subprocess.PIPE).stdout.read().decode('utf-8')
 
     if not bitbake_env_lines:
         print("Couldn't get '%s' output, exiting." % bitbake_env_cmd)
@@ -734,7 +734,7 @@ def yocto_kernel_available_features_list(scripts_path, machine):
     feature_url = find_feature_url(giturl)
 
     feature_cmd = "wget -q -O - " + feature_url
-    tmp = subprocess.Popen(feature_cmd, shell=True, stdout=subprocess.PIPE).stdout.read()
+    tmp = subprocess.Popen(feature_cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
 
     print("The current set of kernel features available to %s is:\n" % machine)
 
@@ -785,7 +785,7 @@ def get_feature_desc(git_url, feature):
     """
     feature_desc_url = find_feature_desc_url(git_url, feature)
     feature_desc_cmd = "wget -q -O - " + feature_desc_url
-    tmp = subprocess.Popen(feature_desc_cmd, shell=True, stdout=subprocess.PIPE).stdout.read()
+    tmp = subprocess.Popen(feature_desc_cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
 
     return find_feature_desc(tmp.split("\n"))
 
@@ -1001,7 +1001,7 @@ def base_branches(context):
     print("Getting branches from remote repo %s..." % giturl)
 
     gitcmd = "git ls-remote %s *heads* 2>&1" % (giturl)
-    tmp = subprocess.Popen(gitcmd, shell=True, stdout=subprocess.PIPE).stdout.read()
+    tmp = subprocess.Popen(gitcmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
 
     branches = []
 
@@ -1031,7 +1031,7 @@ def all_branches(context):
     print("Getting branches from remote repo %s..." % giturl)
 
     gitcmd = "git ls-remote %s *heads* 2>&1" % (giturl)
-    tmp = subprocess.Popen(gitcmd, shell=True, stdout=subprocess.PIPE).stdout.read()
+    tmp = subprocess.Popen(gitcmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
 
     branches = []
 
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index b1ecf7f..df76f94 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -371,7 +371,7 @@ def coverage_setup(coverage_source, coverage_include, coverage_omit):
     import subprocess
     builddir = os.environ.get("BUILDDIR")
     pokydir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
-    curcommit= subprocess.check_output(["git", "--git-dir", os.path.join(pokydir, ".git"), "rev-parse", "HEAD"])
+    curcommit= subprocess.check_output(["git", "--git-dir", os.path.join(pokydir, ".git"), "rev-parse", "HEAD"]).decode('utf-8')
     coveragerc = "%s/.coveragerc" % builddir
     data_file = "%s/.coverage." % builddir
     data_file += datetime.datetime.now().strftime('%Y%m%dT%H%M%S')
-- 
2.1.4


