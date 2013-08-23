Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E25A96B9E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:05:07 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2013 11:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="285943329"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 11:04:47 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 033DB2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:43 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:28 +0300
Message-Id: <dfd75bf5d3f51ddcab2a6c2615e5eb44fc879501.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 18/19] lib/oeqa: change behaviour for unskippable tests
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
X-List-Received-Date: Fri, 23 Aug 2013 18:05:08 -0000

When a test module wants to be skipped because it doesn't
apply to the image but it was nevertheless a required
test (one in TEST_SUITES), we issued an warning that it
was a required test and went on with running the module.
Usually all tests in the module failed (e.g gcc tests on a non-sdk image),
but this allowed us to know that something went wrong with the image
(some package/feature didn't make it).

However, instead of just issuing an warning and running the tests
it's better to throw an exception. The traceback will tell us what's wrong,
and we don't run every single test method.
Output will look like this:
--snip--
| NOTE: Test modules  ['oeqa.runtime.ping', 'oeqa.runtime.ssh', 'oeqa.runtime.gcc']
| NOTE: Found 5 tests
| test_ping (oeqa.runtime.ping.PingTest) ... ok
| test_ssh (oeqa.runtime.ssh.SshTest) ... ok
| ERROR
|
| ======================================================================
| ERROR: setUpModule (oeqa.runtime.gcc)
| ----------------------------------------------------------------------
| Traceback (most recent call last):
|   File "/mnt/back/yocto/poky/meta/lib/oeqa/runtime/gcc.py", line 8, in setUpModule
|     skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
|   File "/mnt/back/yocto/poky/meta/lib/oeqa/oetest.py", line 108, in skipModule
|     "\nor the image really doesn't have the requred feature/package when it should." % (modname, reason))
| Exception:
| Test gcc wants to be skipped.
| Reason is: Image doesn't have tools-sdk in IMAGE_FEATURES
| Test was required in TEST_SUITES, so either the condition for skipping is wrong
| or the image really doesn't have the requred feature/package when it should.
|
| ----------------------------------------------------------------------
| Ran 2 tests in 1.036s
|
| FAILED (errors=1)
| NOTE: Sending SIGTERM to runqemu
--snip--

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/oetest.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 4a406e7..c9dc5dc 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -103,7 +103,9 @@ def skipModule(reason, pos=2):
     if modname not in oeRuntimeTest.tc.testsrequired:
         raise unittest.SkipTest("%s: %s" % (modname, reason))
     else:
-        bb.warn("Test %s is required, not skipping" % modname)
+        raise Exception("\nTest %s wants to be skipped.\nReason is: %s" \
+                "\nTest was required in TEST_SUITES, so either the condition for skipping is wrong" \
+                "\nor the image really doesn't have the requred feature/package when it should." % (modname, reason))
 
 def skipModuleIf(cond, reason):
 
-- 
1.8.3.1


