Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 72721619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 14:42:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2013 07:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="370521010"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2013 07:42:11 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id D23496A4091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 07:42:09 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 17:42:25 +0300
Message-Id: <ef8b91e47dc21d0dc6046978d7f75c67f4af82d8.1373899189.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1373899189.git.stefanx.stanacar@intel.com>
References: <cover.1373899189.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373899189.git.stefanx.stanacar@intel.com>
References: <cover.1373899189.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 4/9] lib/oeqa/runtime/multilib.py: use readelf instead of file
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
X-List-Received-Date: Mon, 15 Jul 2013 14:42:10 -0000

file was pulled by rpm in sato images, readelf comes with binutils
so it's in ipk/deb too.
Also the test was looking at connmand instead of connman-applet
(which is what the testcase says and the AB nightly-multilib target installs)

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/multilib.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime/multilib.py
index 397d075..2d952aa 100644
--- a/meta/lib/oeqa/runtime/multilib.py
+++ b/meta/lib/oeqa/runtime/multilib.py
@@ -1,5 +1,6 @@
 import unittest
 from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
 
 def setUpModule():
     multilibs = oeRuntimeTest.tc.d.getVar("MULTILIBS", True) or ""
@@ -7,8 +8,10 @@ def setUpModule():
         skipModule("this isn't a multilib:lib32 image")
 
 
-class MultilibFileTest(oeRuntimeTest):
+class MultilibTest(oeRuntimeTest):
 
+    @skipUnlessPassed('test_ssh')
     def test_file_connman(self):
-        (status, output) = self.target.run('file -L /usr/sbin/connmand | grep "ELF 32-bit LSB executable"')
-        self.assertEqual(status, 0, msg="status and output : %s and %s" % (status,output))
+        self.assertTrue(oeRuntimeTest.hasPackage('connman-gnome'), msg="This test assumes connman-gnome is installed")
+        (status, output) = self.target.run("readelf -h /usr/bin/connman-applet | sed -n '3p' | awk '{print $2}'")
+        self.assertEqual(output, "ELF32", msg="connman-applet isn't an ELF32 binary. readelf says: %s" % self.target.run("readelf -h /usr/bin/connman-applet")[1])
-- 
1.8.3.1


