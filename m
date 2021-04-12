Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: SSkw3Sj1KP9Qp9zT95R1P99Y25Oxi0Z80MzdjvzjXpK1uBEueMr9UQLy8VmJ4qFbi9plxoE0k4
 Xta5dK+yUwrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467916"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467916"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:46 -0700
IronPort-SDR: 07YLmP4cVAS7pr8MqKdoQVmlelfws7ABNcDAQGaYia/+iJfL7vrIcv5090G8FnhR1Qfnn+hAWU
 nNSKJqu/gITA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809092"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:45 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/18] cve-check: CVE_VERSION_SUFFIX to work with patched release
Date: Mon, 12 Apr 2021 17:08:16 +0800
Message-Id: <7e75801c9a76d7bcd2fed3a6522214f483966166.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

CVE_VERSION_SUFFIX in "patch" to treat version string with suffix "pX"
or "patchX" as patched release.

also update testcases to cover this changes and set CVE_VERSION_SUFFIX
for sudo.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8076815fc2ffc8f632e73527ce2b7d158a29e9ea)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/cve_check.py                  | 7 ++++++-
 meta/lib/oeqa/selftest/cases/cve_check.py | 8 ++++++++
 meta/recipes-extended/sudo/sudo.inc       | 2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index ce755f940a..a1d7c292af 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -11,8 +11,13 @@ _Version = collections.namedtuple(
 class Version():
 
     def __init__(self, version, suffix=None):
+
+        suffixes = ["alphabetical", "patch"]
+
         if str(suffix) == "alphabetical":
             version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<patch>[-_\.]?(?P<patch_l>[a-z]))?(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
+        elif str(suffix) == "patch":
+            version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<patch>[-_\.]?(p|patch)(?P<patch_l>[0-9]+))?(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
         else:
             version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
         regex = re.compile(r"^\s*" + version_pattern + r"\s*$", re.VERBOSE | re.IGNORECASE)
@@ -23,7 +28,7 @@ class Version():
 
         self._version = _Version(
             release=tuple(int(i) for i in match.group("release").replace("-",".").split(".")),
-            patch_l=match.group("patch_l") if str(suffix) == "alphabetical" and match.group("patch_l") else "",
+            patch_l=match.group("patch_l") if str(suffix) in suffixes and match.group("patch_l") else "",
             pre_l=match.group("pre_l"),
             pre_v=match.group("pre_v")
         )
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 3f343a2841..d1947baffc 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -34,3 +34,11 @@ class CVECheck(OESelftestTestCase):
         self.assertTrue( result ,msg="Failed to compare version with suffix '1.0b' < '1.0r'")
         result = Version("1.0b","alphabetical") > Version("1.0","alphabetical")
         self.assertTrue( result ,msg="Failed to compare version with suffix '1.0b' > '1.0'")
+
+        # consider the trailing "p" and "patch" as patched released when comparing
+        result = Version("1.0","patch") < Version("1.0p1","patch")
+        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0' < '1.0p1'")
+        result = Version("1.0p2","patch") > Version("1.0p1","patch")
+        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0p2' > '1.0p1'")
+        result = Version("1.0_patch2","patch") < Version("1.0_patch3","patch")
+        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0_patch2' < '1.0_patch3'")
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 86a18be7e2..8b50f5eee5 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -49,3 +49,5 @@ do_compile_prepend () {
 do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
+
+CVE_VERSION_SUFFIX = "patch"
-- 
2.30.2

