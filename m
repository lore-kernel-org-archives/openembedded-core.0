Return-Path: <sipke.vriend@xilinx.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe002.messaging.microsoft.com [213.199.154.205])
	by mail.openembedded.org (Postfix) with ESMTP id 04DF460E07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 06:26:07 +0000 (UTC)
Received: from mail71-am1-R.bigfish.com (10.3.201.245) by
	AM1EHSOBE016.bigfish.com (10.3.207.138) with Microsoft SMTP Server id
	14.1.225.22; Thu, 30 Jan 2014 06:26:07 +0000
Received: from mail71-am1 (localhost [127.0.0.1])	by mail71-am1-R.bigfish.com
	(Postfix) with ESMTP id 36DA31A055B;
	Thu, 30 Jan 2014 06:26:07 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2fh95h839hc61hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h226dh24afh2327h2336h2438h2461h2487h24d7h2516h906i1155h)
Received-SPF: pass (mail71-am1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=sipke.vriend@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail71-am1 (localhost.localdomain [127.0.0.1]) by mail71-am1
	(MessageSwitch) id 1391063165149472_3869;
	Thu, 30 Jan 2014 06:26:05 +0000 (UTC)
Received: from AM1EHSMHS013.bigfish.com (unknown [10.3.201.230])	by
	mail71-am1.bigfish.com (Postfix) with ESMTP id 17049340065;
	Thu, 30 Jan 2014 06:26:05 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by AM1EHSMHS013.bigfish.com
	(10.3.207.151) with Microsoft SMTP Server id 14.16.227.3;
	Thu, 30 Jan 2014 06:26:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<sipke.vriend@xilinx.com>)	id
	1W8l4c-0000r8-Vl; Wed, 29 Jan 2014 22:26:02 -0800
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: <stefanx.stanacar@intel.com>
Date: Thu, 30 Jan 2014 16:25:54 +1000
X-Mailer: git-send-email 1.7.9.5
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <100f2412-dee1-4d0a-ba01-1319a5d4c797@AM1EHSMHS013.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oeqa: allow multiple layers to provide their own TEST_TARGET class
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
X-List-Received-Date: Thu, 30 Jan 2014 06:26:08 -0000
Content-Type: text/plain

Use a python module "folder" rather than a single module within
layers to ensure multiple layers can define a TEST_TARGET class.
Current implementation using controllers.py module will only allow
a single layer to define test targets.

Add a controllers folder as well as a TestTargetLoader class whose
job is to load the given TEST_TARGET class from any number of
python modules within the oeqa/controllers/ directory of any
layer.
The only condition will be that layers will need to ensure
the TEST_TARGET class name they provide is unique otherwise there
is no guarantee which class is instantiated. a bb.warn is used
to alude to this if it happens.

Signed-off-by: Sipke Vriend <sipke.vriend@xilinx.com>
---
 meta/lib/oeqa/controllers/__init__.py         |    3 ++
 meta/lib/oeqa/controllers/testtargetloader.py |   69 +++++++++++++++++++++++++
 meta/lib/oeqa/targetcontrol.py                |   13 ++---
 3 files changed, 79 insertions(+), 6 deletions(-)
 create mode 100644 meta/lib/oeqa/controllers/__init__.py
 create mode 100644 meta/lib/oeqa/controllers/testtargetloader.py

diff --git a/meta/lib/oeqa/controllers/__init__.py b/meta/lib/oeqa/controllers/__init__.py
new file mode 100644
index 0000000..8eda927
--- /dev/null
+++ b/meta/lib/oeqa/controllers/__init__.py
@@ -0,0 +1,3 @@
+# Enable other layers to have modules in the same named directory
+from pkgutil import extend_path
+__path__ = extend_path(__path__, __name__)
diff --git a/meta/lib/oeqa/controllers/testtargetloader.py b/meta/lib/oeqa/controllers/testtargetloader.py
new file mode 100644
index 0000000..019bbfd
--- /dev/null
+++ b/meta/lib/oeqa/controllers/testtargetloader.py
@@ -0,0 +1,69 @@
+import types
+import bb
+
+# This class is responsible for loading a test target controller
+class TestTargetLoader:
+
+    # Search oeqa.controllers module directory for and return a controller  
+    # corresponding to the given target name. 
+    # AttributeError raised if not found.
+    # ImportError raised if a provided module can not be imported.
+    def get_controller_module(self, target, bbpath):
+        controllerslist = self.get_controller_modulenames(bbpath)
+        bb.note("Available controller modules: %s" % str(controllerslist))
+        controller = self.load_controller_from_name(target, controllerslist)
+        return controller
+
+    # Return a list of all python modules in lib/oeqa/controllers for each
+    # layer in bbpath
+    def get_controller_modulenames(self, bbpath):
+
+        controllerslist = []
+
+        def add_controller_list(path):
+            if not os.path.exists(os.path.join(path, '__init__.py')):
+                bb.fatal('Controllers directory %s exists but is missing __init__.py' % path)
+            files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
+            for f in files:
+                module = 'oeqa.controllers.' + f[:-3]
+                if module not in controllerslist:
+                    controllerslist.append(module)
+                else:
+                    bb.warn("Duplicate controller module found for %s, only one added. Layers should create unique controller module names" % module)
+
+        for p in bbpath:
+            controllerpath = os.path.join(p, 'lib', 'oeqa', 'controllers')
+            bb.debug(2, 'Searching for target controllers in %s' % controllerpath)
+            if os.path.exists(controllerpath):
+                add_controller_list(controllerpath)
+        return controllerslist
+
+    # Search for and return a controller from given target name and
+    # set of module names. 
+    # Raise AttributeError if not found.
+    # Raise ImportError if a provided module can not be imported
+    def load_controller_from_name(self, target, modulenames):
+        for name in modulenames:
+            obj = self.load_controller_from_module(target, name)
+            if obj:
+                return obj
+        raise AttributeError("Unable to load {0} from available modules: {1}".format(target, str(modulenames)))
+
+    # Search for and return a controller or None from given module name
+    def load_controller_from_module(self, target, modulename):
+        obj = None
+        # import module, allowing it to raise import exception
+        module = __import__(modulename, globals(), locals(), [target])
+        # look for target class in the module, catching any exceptions as it
+        # is valid that a module may not have the target class.
+        try:
+            obj = getattr(module, target)
+            if obj: 
+                from oeqa.targetcontrol import BaseTarget
+                if (not isinstance(obj, (type, types.ClassType))):
+                    bb.warn("Target {0} found, but not of type Class".format(target))
+                if( not issubclass(obj, BaseTarget)):
+                    bb.warn("Target {0} found, but subclass is not BaseTarget".format(target))
+        except:
+            obj = None
+        return obj
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 757f9d3..ba5e6e5 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -11,7 +11,7 @@ import bb
 import traceback
 from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
-
+from oeqa.controllers.testtargetloader import TestTargetLoader
 
 def get_target_controller(d):
     testtarget = d.getVar("TEST_TARGET", True)
@@ -28,12 +28,13 @@ def get_target_controller(d):
         except AttributeError:
             # nope, perhaps a layer defined one
             try:
-                module = __import__("oeqa.utils.controllers", globals(), locals(), [testtarget])
-                controller = getattr(module, testtarget)
+                bbpath = d.getVar("BBPATH", True).split(':')
+                testtargetloader = TestTargetLoader()
+                controller = testtargetloader.get_controller_module(testtarget, bbpath)
             except ImportError as e:
-                bb.fatal("Failed to import oeqa.utils.controllers:\n%s" % traceback.format_exc())
-            except AttributeError:
-                bb.fatal("\"%s\" is not a valid value for TEST_TARGET" % testtarget)
+                bb.fatal("Failed to import {0} from available controller modules:\n{1}".format(testtarget,traceback.format_exc()))
+            except AttributeError as e:
+                bb.fatal("Invalid TEST_TARGET - " + str(e))
         return controller(d)
 
 
-- 
1.7.9.5



