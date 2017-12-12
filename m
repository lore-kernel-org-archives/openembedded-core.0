Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AA96078856
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 00:32:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 16:32:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,393,1508828400"; 
   d="scan'208";a="2042595"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.41.228])
	by orsmga006.jf.intel.com with ESMTP; 11 Dec 2017 16:32:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 11 Dec 2017 16:31:59 -0800
Message-Id: <20171212003202.4209-2-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171212003202.4209-1-sgw@linux.intel.com>
References: <20171212003202.4209-1-sgw@linux.intel.com>
Subject: [PATCH v2 1/4] devtool QA: switch which git recipe is used
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
X-List-Received-Date: Tue, 12 Dec 2017 00:32:04 -0000

Since we have removed the mkelfimage recipe, select a new recipe to
use for the devtool git test.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8a1e6858d3a..99e856d3cbc 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -611,7 +611,7 @@ class DevtoolTests(DevtoolBase):
     @OETestID(1165)
     def test_devtool_modify_git(self):
         # Check preconditions
-        testrecipe = 'mkelfimage'
+        testrecipe = 'file'
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
         # Clean up anything in the workdir/sysroot/sstate cache
@@ -623,9 +623,9 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
-        self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
+        self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. devtool output: %s' % result.output)
-        matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'mkelfimage_*.bbappend'))
+        matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'file_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created')
         # Test devtool status
         result = runCmd('devtool status')
-- 
2.13.6


