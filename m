Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4EA6D8F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 19:22:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Feb 2014 11:17:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,774,1384329600"; d="scan'208";a="477352036"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2014 11:21:29 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id BE6AF6A4092
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 11:21:22 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 21:22:30 +0200
Message-Id: <7d18059d82ce91c87c08dfd38835afbb29628e51.1391454072.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391454072.git.stefanx.stanacar@intel.com>
References: <cover.1391454072.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1391454072.git.stefanx.stanacar@intel.com>
References: <cover.1391454072.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/3] lib/oeqa: add module for running tests outside of the build system
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
X-List-Received-Date: Mon, 03 Feb 2014 19:22:01 -0000

This script will run the exported tests outside of the build system.

Simplest way to test this is with a qemu image that you manually start.
For an already build image use this in local.conf:
TEST_EXPORT_ONLY = "1"
TEST_TARGET = "simpleremote"
TEST_TARGET_IP = "192.168.7.2"
TEST_SERVER_IP = "192.168.7.1"
Export the tests: bitbake core-image-sato -c testimage
Then: runqemu core-image-sato
And: cd build/tmp/testimage/core-image-sato
     ./runexported.py testdata.json

The contents of build/tmp/testimage/core-image-sato can be moved on another machine
as long as some paths are updated in the json.
The exported data contains paths to the build dir. We only care about DEPLOY_DIR/rpm (
if the rpm and smart tests are enabled), so running the tests on other machine
means that the user has to move the contents and call runexported with --deploy-dir PATH:
 ./runexported.py --deploy-dir /path/on/another/machine testdata.json
runexported.py accepts other arguments as well, see --help.

[YOCTO #5613]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runexported.py | 140 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100755 meta/lib/oeqa/runexported.py

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
new file mode 100755
index 0000000..e1b6642
--- /dev/null
+++ b/meta/lib/oeqa/runexported.py
@@ -0,0 +1,140 @@
+#!/usr/bin/env python
+
+
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# This script should be used outside of the build system to run image tests.
+# It needs a json file as input as exported by the build.
+# E.g for an already built image:
+#- export the tests:
+#   TEST_EXPORT_ONLY = "1"
+#   TEST_TARGET  = "simpleremote"
+#   TEST_TARGET_IP = "192.168.7.2"
+#   TEST_SERVER_IP = "192.168.7.1"
+# bitbake core-image-sato -c testimage
+# Setup your target, e.g for qemu: runqemu core-image-sato
+# cd build/tmp/testimage/core-image-sato
+# ./runexported.py testdata.json
+
+import sys
+import os
+import time
+from optparse import OptionParser
+
+try:
+    import simplejson as json
+except ImportError:
+    import json
+
+sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "oeqa")))
+
+from oeqa.oetest import runTests
+from oeqa.utils.sshcontrol import SSHControl
+
+# this isn't pretty but we need a fake target object
+# for running the tests externally as we don't care
+# about deploy/start we only care about the connection methods (run, copy)
+class FakeTarget(object):
+    def __init__(self, d):
+        self.connection = None
+        self.ip = None
+        self.server_ip = None
+        self.datetime = time.strftime('%Y%m%d%H%M%S',time.gmtime())
+        self.testdir = d.getVar("TEST_LOG_DIR", True)
+        self.pn = d.getVar("PN", True)
+
+    def exportStart(self):
+        self.sshlog = os.path.join(self.testdir, "ssh_target_log.%s" % self.datetime)
+        sshloglink = os.path.join(self.testdir, "ssh_target_log")
+        if os.path.islink(sshloglink):
+            os.unlink(sshloglink)
+        os.symlink(self.sshlog, sshloglink)
+        print("SSH log file: %s" %  self.sshlog)
+        self.connection = SSHControl(self.ip, logfile=self.sshlog)
+
+    def run(self, cmd, timeout=None):
+        return self.connection.run(cmd, timeout)
+
+    def copy_to(self, localpath, remotepath):
+        return self.connection.copy_to(localpath, remotepath)
+
+    def copy_from(self, remotepath, localpath):
+        return self.connection.copy_from(remotepath, localpath)
+
+
+class MyDataDict(dict):
+    def getVar(self, key, unused = None):
+        return self.get(key, "")
+
+class TestContext(object):
+    def __init__(self):
+        self.d = None
+        self.target = None
+
+def main():
+
+    usage = "usage: %prog [options] <json file>"
+    parser = OptionParser(usage=usage)
+    parser.add_option("-t", "--target-ip", dest="ip", help="The IP address of the target machine. Use this to \
+            overwrite the value determined from TEST_TARGET_IP at build time")
+    parser.add_option("-s", "--server-ip", dest="server_ip", help="The IP address of this machine. Use this to \
+            overwrite the value determined from TEST_SERVER_IP at build time.")
+    parser.add_option("-d", "--deploy-dir", dest="deploy_dir", help="Full path to the package feeds, that this \
+            the contents of what used to be DEPLOY_DIR on the build machine. If not specified it will use the value \
+            specified in the json if that directory actually exists or it will error out.")
+    parser.add_option("-l", "--log-dir", dest="log_dir", help="This sets the path for TEST_LOG_DIR. If not specified \
+            the current dir is used. This is used for usually creating a ssh log file and a scp test file.")
+
+    (options, args) = parser.parse_args()
+    if len(args) != 1:
+        parser.error("Incorrect number of arguments. The one and only argument should be a json file exported by the build system")
+
+    with open(args[0], "r") as f:
+        loaded = json.load(f)
+
+    if options.ip:
+        loaded["target"]["ip"] = options.ip
+    if options.server_ip:
+        loaded["target"]["server_ip"] = options.server_ip
+
+    d = MyDataDict()
+    for key in loaded["d"].keys():
+        d[key] = loaded["d"][key]
+
+    if options.log_dir:
+        d["TEST_LOG_DIR"] = options.log_dir
+    else:
+        d["TEST_LOG_DIR"] = os.path.abspath(os.path.dirname(__file__))
+    if options.deploy_dir:
+        d["DEPLOY_DIR"] = options.deploy_dir
+    else:
+        if not os.path.isdir(d["DEPLOY_DIR"]):
+            raise Exception("The path to DEPLOY_DIR does not exists: %s" % d["DEPLOY_DIR"])
+
+
+    target = FakeTarget(d)
+    for key in loaded["target"].keys():
+        setattr(target, key, loaded["target"][key])
+
+    tc = TestContext()
+    setattr(tc, "d", d)
+    setattr(tc, "target", target)
+    for key in loaded.keys():
+        if key != "d" and key != "target":
+            setattr(tc, key, loaded[key])
+
+    target.exportStart()
+    runTests(tc)
+
+    return 0
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc(5)
+    sys.exit(ret)
-- 
1.8.5.3


