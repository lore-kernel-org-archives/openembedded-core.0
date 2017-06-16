Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 129C278478
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:28:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279538"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:28:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:33 +0300
Message-Id: <ca6c489179bb29adc7cd122f97e8a8f8e77ae611.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/32] oe-selftest: add a test for upstream version check regressions
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
X-List-Received-Date: Fri, 16 Jun 2017 12:28:58 -0000

The test runs an upstream version check, and then compares the
list of recipes that failed the check (i.e. those where latest
upstream version could not be established) against the list of
known-broken upstreams. Mismatches either way (upstream check failed,
recipe not in the exception list, or upstream check worked,
recipe in exception list) fail the test.

[YOCTO #11031]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-selftest/files/distrodata/checkpkg_exceptions | 26 +++++++++++++
 meta/lib/oeqa/selftest/cases/distrodata.py         | 43 ++++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta-selftest/files/distrodata/checkpkg_exceptions
 create mode 100644 meta/lib/oeqa/selftest/cases/distrodata.py

diff --git a/meta-selftest/files/distrodata/checkpkg_exceptions b/meta-selftest/files/distrodata/checkpkg_exceptions
new file mode 100644
index 00000000000..f0d1f674872
--- /dev/null
+++ b/meta-selftest/files/distrodata/checkpkg_exceptions
@@ -0,0 +1,26 @@
+build-compare
+calibrateproto
+dbus-wait
+distcc
+fstests
+gnu-config
+gst-player
+kmscube
+libxcalibrate
+linux-firmware
+lsb
+mmc-utils
+ovmf
+piglit
+psplash
+puzzles
+rpm
+squashfs-tools
+tcf-agent
+unzip
+update-rc.d
+x264
+xcursor-transparent-theme
+xinetd
+xvideo-tests
+zip
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
new file mode 100644
index 00000000000..d5d286d5cc3
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -0,0 +1,43 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.decorators import testcase
+from oeqa.utils.ftools import write_file
+
+class Distrodata(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(Distrodata, cls).setUpClass()
+        cls.exceptions_path = os.path.join(cls.testlayer_path, 'files', 'distrodata', "checkpkg_exceptions")
+
+    def test_checkpkg(self):
+        """
+        Summary:     Test that upstream version checks do not regress
+        Expected:    Upstream version checks should succeed except for the recipes listed in the exception list.
+        Product:     oe-core
+        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
+        """
+        feature = 'INHERIT += "distrodata"\n'
+        feature += 'LICENSE_FLAGS_WHITELIST += " commercial"\n'
+
+        self.write_config(feature)
+        bitbake('-c checkpkg world')
+        checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
+        exceptions = [exc.strip() for exc in open(self.exceptions_path).readlines()]
+        failed_upstream_checks = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == '']
+        regressed_failures = set(failed_upstream_checks) - set(exceptions)
+        regressed_successes = set(exceptions) - set(failed_upstream_checks)
+        msg = ""
+        if len(regressed_failures) > 0:
+            msg = msg + """
+The following packages failed upstream version checks. Please fix them using UPSTREAM_CHECK_URI/UPSTREAM_CHECK_REGEX
+(when using tarballs) or UPSTREAM_CHECK_GITTAGREGEX (when using git). If an upstream version check cannot be performed
+(for example, if upstream does not use git tags), you can add the package to list of exceptions in
+meta-selftest/files/distrodata/checkpkg_exceptions.
+""" + "\n".join(regressed_failures)
+        if len(regressed_successes) > 0:
+            msg = msg + """
+The following packages have been checked successfully for upstream versions (or they no longer exist in oe-core),
+but are in the exceptions list in meta-selftest/files/distrodata/checkpkg_exceptions. Please remove them from that list.
+""" + "\n".join(regressed_successes)
+        self.assertTrue(len(regressed_failures) == 0 and len(regressed_successes) == 0, msg)
-- 
2.11.0


