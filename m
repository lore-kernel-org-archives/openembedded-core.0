Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.7392.1614869068912691676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 06:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: IuqOjQjBjC1X7vZcVQAQv5hgxkL692wcdLTFDEXGYBdJw8JuwupOPNQNexeBj0GumNIVF7PB/6
 viToWCIfM2Bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="186775392"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="186775392"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 06:44:10 -0800
IronPort-SDR: fUSpLzT+DnkJ2e4rWFZEHCyp5tB61gyQCdBwyNI0vjdXFuei+UypryJpkvbRueIcK027tWIhmj
 86xeOyJ9vGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="445752975"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga001.jf.intel.com with ESMTP; 04 Mar 2021 06:44:10 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] cve-check: CVE_VERSION_SUFFIX to work with patched release
Date: Thu,  4 Mar 2021 22:44:07 +0800
Message-Id: <20210304144407.66850-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304144407.66850-1-chee.yang.lee@intel.com>
References: <20210304144407.66850-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

CVE_VERSION_SUFFIX in "patch" to treat version string with suffix "pX"
or "patchX" as patched release.

also update testcases to cover this changes and set CVE_VERSION_SUFFIX
for sudo.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
index 97ecabe0fc..0bea35a0a3 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -49,3 +49,5 @@ do_compile_prepend () {
 do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
+
+CVE_VERSION_SUFFIX = "patch"
-- 
2.17.1

