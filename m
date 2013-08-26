Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8D56E6AE6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 12:16:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2013 05:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,958,1367996400"; d="scan'208";a="368545142"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2013 05:16:53 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id AA3F66A4092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 05:16:51 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2013 15:16:47 +0300
Message-Id: <c772cb86f976a74f6a5e1a8be5deb75f6536d788.1377519067.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377519067.git.stefanx.stanacar@intel.com>
References: <cover.1377519067.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377519067.git.stefanx.stanacar@intel.com>
References: <cover.1377519067.git.stefanx.stanacar@intel.com>
Subject: [PATCH 1/2] lib/oeqa/runtime: smart: add checks for smart output
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
X-List-Received-Date: Mon, 26 Aug 2013 12:16:55 -0000

Sometimes smart throws:

    Committing transaction...
    Preparing...                    ######################################## [  0%]
       1:Removing psplash-default   ######################################## [100%]
    error: Couldn't fork %postun: Cannot allocate memory

and returns a 0 exit code (it thinks it succesfully removed the package,
when in reality it didn't), so we need to catch those specifically.

Also, sometimes output from download command is:
    Saving cache...http://192.168.7.1:49456/rpm/x86_64_x32/psplash-default-0.1+git0+afd4e228c6-r15.x86_64_x32.rpm
and that tricks our smart download test, so use a regex there.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/smart.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 4ea2699..6e20f96 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -1,4 +1,5 @@
 import unittest
+import re
 from oeqa.oetest import oeRuntimeTest
 from oeqa.utils.decorators import *
 from oeqa.utils.httpserver import HTTPService
@@ -19,6 +20,7 @@ class SmartTest(oeRuntimeTest):
         status, output = self.target.run(command)
         message = os.linesep.join([command, output])
         self.assertEqual(status, expected, message)
+        self.assertFalse("Cannot allocate memory" in output, message)
         return output
 
 class SmartBasicTest(SmartTest):
@@ -95,13 +97,11 @@ class SmartRepoTest(SmartTest):
 
     @skipUnlessPassed('test_smart_channel_add')
     def test_smart_install_from_http(self):
-        url = 'http://'
         output = self.smart('download --urls psplash-default')
-        for line in output.splitlines():
-            if line.startswith(url):
-                url = line
+        url = re.search('(http://.*/psplash-default.*\.rpm)', output)
+        self.assertTrue(url, msg="Couln't find download url in %s" % output)
         self.smart('remove -y psplash-default')
-        self.smart('install -y %s' % url)
+        self.smart('install -y %s' % url.group(0))
 
     @skipUnlessPassed('test_smart_install')
     def test_smart_reinstall(self):
-- 
1.8.3.1


