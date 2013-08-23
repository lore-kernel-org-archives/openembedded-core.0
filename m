Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8E26B6BA35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2013 08:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="392267384"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2013 08:32:47 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 7424C2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:45 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:30:59 +0300
Message-Id: <e5a8d26e735aa3147a347844138ab6f692af9dda.1377269486.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 19/21] lib/oeqa: change behaviour for unskippable tests
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
X-List-Received-Date: Fri, 23 Aug 2013 15:32:46 -0000

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
index 7f6baa4..e694c0b 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -96,7 +96,9 @@ def skipModule(reason, pos=2):
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


