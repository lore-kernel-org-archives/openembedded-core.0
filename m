Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5185276DE5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 15:45:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 01 Sep 2015 08:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,449,1437462000"; d="scan'208";a="780398444"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2015 08:45:29 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 07:36:30 +0000
Message-Id: <9b7065d1365871004719c504b16a56551a6ba841.1441091863.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1441091863.git.mariano.lopez@linux.intel.com>
References: <cover.1441091863.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1441091863.git.mariano.lopez@linux.intel.com>
References: <cover.1441091863.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/2 v2] runexported: Make it compatible with host dump
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
X-List-Received-Date: Tue, 01 Sep 2015 15:45:28 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently it is not possible to run a exported test,
but this patch will allow to use the HosDumper class
when running a exported test, otherwise the HostDumper
class will break runexpored test.

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 6 +++++-
 meta/lib/oeqa/oetest.py        | 3 +--
 meta/lib/oeqa/runexported.py   | 8 +++++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 82cb011..8fa00f5 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -173,9 +173,10 @@ def exportTests(d,tc):
     savedata = {}
     savedata["d"] = {}
     savedata["target"] = {}
+    savedata["host_dumper"] = {}
     for key in tc.__dict__:
         # special cases
-        if key != "d" and key != "target":
+        if key != "d" and key != "target" and key != "host_dumper":
             savedata[key] = getattr(tc, key)
     savedata["target"]["ip"] = tc.target.ip or d.getVar("TEST_TARGET_IP", True)
     savedata["target"]["server_ip"] = tc.target.server_ip or d.getVar("TEST_SERVER_IP", True)
@@ -189,6 +190,9 @@ def exportTests(d,tc):
             # we don't care about those anyway
             pass
 
+    savedata["host_dumper"]["parent_dir"] = tc.host_dumper.parent_dir
+    savedata["host_dumper"]["cmds"] = tc.host_dumper.cmds
+
     with open(os.path.join(exportpath, "testdata.json"), "w") as f:
             json.dump(savedata, f, skipkeys=True, indent=4, sort_keys=True)
 
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 4224206..4773bdd 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -13,7 +13,6 @@ import inspect
 import subprocess
 import bb
 from oeqa.utils.decorators import LogResults
-from oeqa.targetcontrol import QemuTarget
 from sys import exc_info, exc_clear
 
 def loadTests(tc, type="runtime"):
@@ -124,7 +123,7 @@ class oeRuntimeTest(oeTest):
         if not exc_info() == (None, None, None):
             exc_clear()
             #Only dump for QemuTarget
-            if (isinstance(self.target, QemuTarget)):
+            if (type(self.target).__name__ == "QemuTarget"):
                 self.tc.host_dumper.create_dir(self._testMethodName)
                 self.tc.host_dumper.dump_host()
                 self.target.target_dumper.dump_target(
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index e1b6642..96442b1 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -32,6 +32,7 @@ sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "oeqa"))
 
 from oeqa.oetest import runTests
 from oeqa.utils.sshcontrol import SSHControl
+from oeqa.utils.dump import get_host_dumper
 
 # this isn't pretty but we need a fake target object
 # for running the tests externally as we don't care
@@ -118,11 +119,16 @@ def main():
     for key in loaded["target"].keys():
         setattr(target, key, loaded["target"][key])
 
+    host_dumper = get_host_dumper(d)
+    host_dumper.parent_dir = loaded["host_dumper"]["parent_dir"]
+    host_dumper.cmds = loaded["host_dumper"]["cmds"]
+
     tc = TestContext()
     setattr(tc, "d", d)
     setattr(tc, "target", target)
+    setattr(tc, "host_dumper", host_dumper)
     for key in loaded.keys():
-        if key != "d" and key != "target":
+        if key != "d" and key != "target" and key != "host_dumper":
             setattr(tc, key, loaded[key])
 
     target.exportStart()
-- 
1.8.4.5


