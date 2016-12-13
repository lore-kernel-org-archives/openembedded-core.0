Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A34C271B86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885972"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:45 +1300
Message-Id: <6f500c68eb9b2d5dd3a708f6f8bab28b2472ef7a.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/14] oe-selftest: devtool: improve test_devtool_modify slightly
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:33 -0000

* Check that man .in file actually gets modified, since sed -i doesn't
  fail if it it doesn't
* Use a variable for man file path

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 7db286f..5f4e828 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -439,7 +439,15 @@ class DevtoolTests(DevtoolBase):
         # Try building
         bitbake('mdadm')
         # Try making (minor) modifications to the source
-        result = runCmd("sed -i 's!^\.TH.*!.TH MDADM 8 \"\" v9.999-custom!' %s" % os.path.join(tempdir, 'mdadm.8.in'))
+        modfile = os.path.join(tempdir, 'mdadm.8.in')
+        result = runCmd("sed -i 's!^\.TH.*!.TH MDADM 8 \"\" v9.999-custom!' %s" % modfile)
+        sedline = ''
+        with open(modfile, 'r') as f:
+            for line in f:
+                if line.startswith('.TH'):
+                    sedline = line.rstrip()
+                    break
+        self.assertEqual(sedline, '.TH MDADM 8 "" v9.999-custom', 'man .in file not modified (sed failed)')
         bitbake('mdadm -c package')
         pkgd = get_bb_var('PKGD', 'mdadm')
         self.assertTrue(pkgd, 'Could not query PKGD variable')
@@ -447,10 +455,11 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(mandir, 'Could not query mandir variable')
         if mandir[0] == '/':
             mandir = mandir[1:]
-        with open(os.path.join(pkgd, mandir, 'man8', 'mdadm.8'), 'r') as f:
+        manfile = os.path.join(pkgd, mandir, 'man8', 'mdadm.8')
+        with open(manfile, 'r') as f:
             for line in f:
                 if line.startswith('.TH'):
-                    self.assertEqual(line.rstrip(), '.TH MDADM 8 "" v9.999-custom', 'man file not modified. man searched file path: %s' % os.path.join(pkgd, mandir, 'man8', 'mdadm.8'))
+                    self.assertEqual(line.rstrip(), '.TH MDADM 8 "" v9.999-custom', 'man file not modified. man searched file path: %s' % manfile)
         # Test devtool reset
         stampprefix = get_bb_var('STAMP', 'mdadm')
         result = runCmd('devtool reset mdadm')
-- 
2.5.5


