Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 63B5378816
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 15:53:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jan 2018 07:53:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,318,1511856000"; 
   d="scan'208";a="7657693"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 05 Jan 2018 07:53:45 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jan 2018 17:53:41 +0200
Message-Id: <20180105155341.13893-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180105155341.13893-1-alexander.kanavin@linux.intel.com>
References: <20180105155341.13893-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] oe-selftest: add a test for recipes without maintainers
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
X-List-Received-Date: Fri, 05 Jan 2018 15:53:44 -0000

'bitbake -c checkpkg world' is moved to class initializer to avoid
it being run twice in a row.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/distrodata.py | 32 +++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 12540adc7d8..cf8b4a21763 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -9,6 +9,12 @@ class Distrodata(OESelftestTestCase):
     @classmethod
     def setUpClass(cls):
         super(Distrodata, cls).setUpClass()
+        feature = 'INHERIT += "distrodata"\n'
+        feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
+
+        cls.write_config(cls, feature)
+        bitbake('-c checkpkg world')
+
 
     @OETestID(1902)
     def test_checkpkg(self):
@@ -18,11 +24,6 @@ class Distrodata(OESelftestTestCase):
         Product:     oe-core
         Author:      Alexander Kanavin <alexander.kanavin@intel.com>
         """
-        feature = 'INHERIT += "distrodata"\n'
-        feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
-
-        self.write_config(feature)
-        bitbake('-c checkpkg world')
         checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
         regressed_failures = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'UNKNOWN_BROKEN']
         regressed_successes = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'KNOWN_BROKEN']
@@ -40,3 +41,24 @@ The following packages have been checked successfully for upstream versions,
 but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please remove that line from the recipes.
 """ + "\n".join(regressed_successes)
         self.assertTrue(len(regressed_failures) == 0 and len(regressed_successes) == 0, msg)
+
+    def test_maintainers(self):
+        """
+        Summary:     Test that recipes have a maintainer
+        Expected:    All recipes (except a few special static/testing ones) should have a maintainer listed in maintainers.inc file.
+        Product:     oe-core
+        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
+        """
+        def is_exception(pkg):
+            exceptions = ["packagegroup-", "initramfs-", "systemd-machine-units", "container-image-testpkg", "postinst", "devtool-test-", "selftest-ed"]
+            for i in exceptions:
+                 if i in pkg:
+                     return True
+            return False
+
+        checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
+        no_maintainer_list = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[14] == '' and not is_exception(pkg_data[0])]
+        msg = """
+The following packages do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
+""" + "\n".join(no_maintainer_list)
+        self.assertTrue(len(no_maintainer_list) == 0, msg)
-- 
2.15.1


