Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A933C606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 22:55:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2016 15:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,325,1464678000"; d="scan'208";a="731145114"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2016 15:55:05 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 14:48:55 +0000
Message-Id: <502cac006f7b2e23d74a9a1f2037e3a5d8948053.1467902737.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1467902737.git.mariano.lopez@linux.intel.com>
References: <cover.1467902737.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1467902737.git.mariano.lopez@linux.intel.com>
References: <cover.1467902737.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/2] lib/oeqa/utils/commands.py: Move updateEnv() from runexported.py
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
X-List-Received-Date: Thu, 07 Jul 2016 22:55:05 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

updateEnv() can be used in other places so move the
function to utils/commands.py

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runexported.py    | 16 ++--------------
 meta/lib/oeqa/utils/commands.py | 12 ++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 5886739..125e86d 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -31,7 +31,7 @@ except ImportError:
 sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "oeqa")))
 
 from oeqa.oetest import ExportTestContext
-from oeqa.utils.commands import runCmd
+from oeqa.utils.commands import runCmd, updateEnv
 from oeqa.utils.sshcontrol import SSHControl
 
 # this isn't pretty but we need a fake target object
@@ -137,19 +137,7 @@ def extract_sdk(d):
             if f.startswith("environment-setup"):
                 print("Setting up SDK environment...")
                 env_file = os.path.join(extract_path, f)
-                update_env(env_file)
-
-def update_env(env_file):
-    """
-    Source a file and update environment
-    """
-
-    cmd = ". %s; env -0" % env_file
-    result = runCmd(cmd)
-
-    for line in result.output.split("\0"):
-        (key, _, value) = line.partition("=")
-        os.environ[key] = value
+                updateEnv(env_file)
 
 if __name__ == "__main__":
     try:
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 418643a..4f79d15 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -261,3 +261,15 @@ def runqemu(pn, ssh=True):
             qemu.stop()
         except:
             pass
+
+def updateEnv(env_file):
+    """
+    Source a file and update environment.
+    """
+
+    cmd = ". %s; env -0" % env_file
+    result = runCmd(cmd)
+
+    for line in result.output.split("\0"):
+        (key, _, value) = line.partition("=")
+        os.environ[key] = value
-- 
2.6.6


