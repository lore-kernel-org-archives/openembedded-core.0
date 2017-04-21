Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B04D177C17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:40:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 21 Apr 2017 05:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,229,1488873600"; d="scan'208";a="251889289"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2017 05:40:30 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:40:02 +0300
Message-Id: <41eab4c3d1f37b4dc2614de0a5654590dd7bc4b8.1492777818.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/11] oe-selftest: add a test for upstream version check regressions
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
X-List-Received-Date: Fri, 21 Apr 2017 12:40:30 -0000

The test runs an upstream version check, and then compares the
list of recipes that failed the check (i.e. those where latest
upstream version could not be established) against the list of
known-broken upstreams. Mismatches either way (upstream check failed,
recipe not in the exception list, or upstream check worked,
recipe in exception list) fail the test.

[YOCTO #11031]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-selftest/files/distrodata/checkpkg_exceptions | 27 ++++++++++++++
 meta/lib/oeqa/selftest/distrodata.py               | 41 ++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-selftest/files/distrodata/checkpkg_exceptions
 create mode 100644 meta/lib/oeqa/selftest/distrodata.py

diff --git a/meta-selftest/files/distrodata/checkpkg_exceptions b/meta-selftest/files/distrodata/checkpkg_exceptions
new file mode 100644
index 00000000000..f89f4d0bdf9
--- /dev/null
+++ b/meta-selftest/files/distrodata/checkpkg_exceptions
@@ -0,0 +1,27 @@
+build-compare
+calibrateproto
+dbus-wait
+distcc
+fstests
+gnu-config
+gst-player
+libfakekey
+libxcalibrate
+linux-firmware
+lsb
+mailx
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
diff --git a/meta/lib/oeqa/selftest/distrodata.py b/meta/lib/oeqa/selftest/distrodata.py
new file mode 100644
index 00000000000..036560e23d3
--- /dev/null
+++ b/meta/lib/oeqa/selftest/distrodata.py
@@ -0,0 +1,41 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+from oeqa.utils.decorators import testcase
+from oeqa.utils.ftools import write_file
+
+class Distrodata(oeSelfTest):
+
+    @classmethod
+    def setUpClass(cls):
+        pass
+
+    def test_checkpkg(self):
+        """
+        Summary:     Test that upstream version checks do not regress
+        Expected:    Upstream version checks should succeed except for the recipes listed in the exception list.
+        Product:     oe-core
+        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
+        """
+        feature = 'INHERIT += "distrodata"\n'
+
+        self.write_config(feature)
+        bitbake('-c checkpkg world')
+        checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
+        exceptions = [exc.strip() for exc in open(os.path.join(self.testlayer_path, 'files', 'distrodata', "checkpkg_exceptions")).readlines()]
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


