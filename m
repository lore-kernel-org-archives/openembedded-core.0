Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A75186FF72
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:37:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 24 Jan 2016 11:37:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,341,1449561600"; d="scan'208";a="888277319"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2016 11:37:51 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 32CB12C8001;
	Sun, 24 Jan 2016 12:25:45 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jan 2016 21:49:41 +0200
Message-Id: <1453664991-31706-3-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
References: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
Subject: [PATCH 03/13] utils/decorators.py: add TestNeedsBin() decorator
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
X-List-Received-Date: Sun, 24 Jan 2016 19:37:51 -0000

TestNeedsBin() is used in all tests where binaries are required.
It offers functionality to send binaries to DUTs
both in unpacked (raw)  and in an .rpm form.
It is able to handle native binaries, intended for the machine
launching tests on DUTs.
It also offers functionality for removing DUTs
related binaries after finishing the test.

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 0d79223..a3878ef 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -12,7 +12,9 @@ import sys
 import unittest
 import threading
 import signal
+import re
 from functools import wraps
+import testexport as te
 
 #get the "result" object from one of the upper frames provided that one of these upper frames is a unittest.case frame
 class getResults(object):
@@ -260,3 +262,59 @@ def timeout_handler(seconds):
         else:
             return fn
     return decorator
+
+class TestNeedsBin(object):
+    """
+    This decorator provides binary support for test cases.    
+    Binaries can be versioned. The decorator works with .rpm files and can send
+    both the rpm or the content of the .rpm to the DUT in the corresponding location 
+    as indicated inside it. When the .rpm file is sent to the DUT, it will be available
+    in /home/root. 
+    It supports sent files removal after testcase completion.
+    In case no version is specified for the needed binary, it will take as default 
+    the latest version of the corresponding package.
+    Future support for .deb and .ipk will be available.
+    """
+    def __init__(self, *args):
+        self.args = args
+        self.params_list = list()
+        self.clean_list = list()
+        if self.args:# these are tuples of values
+            for param_tuple in self.args:
+                bn,bv,t, p,rm_b = ("", "", "", "", "")
+                for index,value in enumerate(param_tuple):
+                    if index == 0:
+                        bn = value
+                    elif index == 1 and re.match("[0-9]+\.",value):
+                        bv = value
+                    elif value == "rpm":
+                        p = value
+                    elif value == "native":
+                        t = value
+                    elif value == "rm":
+                        rm_b = value
+                self.params_list.append((bn, bv, p, t, rm_b)) #ensure order of params is as desired
+
+    def deploy_binary(self, params):
+        from oeqa.oetest import oeRuntimeTest
+        p = params
+        if p[3] == "native":
+            te.process_binaries(oeRuntimeTest.tc.d, params)
+        else:
+            status = te.process_binaries(oeRuntimeTest.tc.d, params)
+            if status:
+                bin_to_rm = te.send_bin_to_DUT(oeRuntimeTest.tc.d, params)
+                if bin_to_rm:
+                    self.clean_list.extend(bin_to_rm)
+                    
+    def __call__(self, func):
+        def wrapped_f(*args):
+            for item in set(self.params_list):
+                self.deploy_binary(item)
+            func(*args)
+            te.rm_bin(self.clean_list) # used to remove sent binaries 
+            return
+        wrapped_f.__name__ = func.__name__
+        wrapped_f.args = self.args
+        return wrapped_f
+
-- 
2.5.0


