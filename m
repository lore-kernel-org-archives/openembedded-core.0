Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.5398.1611738236763953855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 01:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: WfaAGPPz9WMafaUx6QkzB5Ch8NngxY7vWSDNwDcAW8rwbaC+M4rVGZ/GzSrwbk6EwRZdB3uRoI
 QCgfiWDHIURw==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="159212995"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="159212995"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2021 01:03:56 -0800
IronPort-SDR: /qXw6AAyDElVOyh4nwDUP5WJgOMVqBL5N0ticxE7nGA0EPimZYP6GtSmTcq9c0kDTpX8LydLaA
 ND1A6m+hkHrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="407037711"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2021 01:03:55 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] cve_check: add CVE_VERSION_SUFFIX to indicate suffix in versioning
Date: Wed, 27 Jan 2021 17:03:53 +0800
Message-Id: <20210127090354.25091-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

add CVE_VERSION_SUFFIX to indicate the version suffix type, currently
works in two value, "alphabetical" if the version string uses single
alphabetical character suffix as incremental release, blank to not
consider the unidentified suffixes. This can be expand when more suffix
pattern identified.

refactor cve_check.Version class to use functools add parameter to handle
suffix condition.

Also update testcases to cover new changes.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/classes/cve-check.bbclass            | 12 ++++---
 meta/lib/oe/cve_check.py                  | 40 ++++++++++++-----------
 meta/lib/oeqa/selftest/cases/cve_check.py | 11 ++++++-
 3 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 646cc879dd..ed86403b6b 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -53,6 +53,9 @@ CVE_CHECK_PN_WHITELIST ?= ""
 #
 CVE_CHECK_WHITELIST ?= ""
 
+# set to "alphabetical" for version using single alphabetical character as increament release
+CVE_VERSION_SUFFIX ??= ""
+
 python cve_save_summary_handler () {
     import shutil
     import datetime
@@ -210,6 +213,7 @@ def check_cves(d, patched_cves):
 
     pn = d.getVar("PN")
     real_pv = d.getVar("PV")
+    suffix = d.getVar("CVE_VERSION_SUFFIX")
 
     cves_unpatched = []
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
@@ -263,8 +267,8 @@ def check_cves(d, patched_cves):
                 else:
                     if operator_start:
                         try:
-                            vulnerable_start =  (operator_start == '>=' and Version(pv) >= Version(version_start))
-                            vulnerable_start |= (operator_start == '>' and Version(pv) > Version(version_start))
+                            vulnerable_start =  (operator_start == '>=' and Version(pv,suffix) >= Version(version_start,suffix))
+                            vulnerable_start |= (operator_start == '>' and Version(pv,suffix) > Version(version_start,suffix))
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
@@ -274,8 +278,8 @@ def check_cves(d, patched_cves):
 
                     if operator_end:
                         try:
-                            vulnerable_end  = (operator_end == '<=' and Version(pv) <= Version(version_end) )
-                            vulnerable_end |= (operator_end == '<' and Version(pv) < Version(version_end) )
+                            vulnerable_end  = (operator_end == '<=' and Version(pv,suffix) <= Version(version_end,suffix) )
+                            vulnerable_end |= (operator_end == '<' and Version(pv,suffix) < Version(version_end,suffix) )
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index ec48a3f829..e40929fd2b 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -1,58 +1,60 @@
 import collections
 import re
 import itertools
+import functools
 
 _Version = collections.namedtuple(
-    "_Version", ["release", "pre_l", "pre_v"]
+    "_Version", ["release", "patch_l", "pre_l", "pre_v"]
 )
 
+@functools.total_ordering
 class Version():
-    _version_pattern =  r"""v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
-    _regex = re.compile(r"^\s*" + _version_pattern + r"\s*$", re.VERBOSE | re.IGNORECASE)
-    def __init__(self, version):
-        match = self._regex.search(version)
+
+    def __init__(self, version, suffix=None):
+        if suffix == "alphabetical":
+            version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<patch>[-_\.]?(?P<patch_l>[a-z]))?(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
+        else:
+            version_pattern =  r"""r?v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
+        regex = re.compile(r"^\s*" + version_pattern + r"\s*$", re.VERBOSE | re.IGNORECASE)
+
+        match = regex.search(version)
         if not match:
             raise Exception("Invalid version: '{0}'".format(version))
 
         self._version = _Version(
             release=tuple(int(i) for i in match.group("release").replace("-",".").split(".")),
+            patch_l=str(match.group("patch_l")) if suffix == "alphabetical" else "",
             pre_l=match.group("pre_l"),
             pre_v=match.group("pre_v")
         )
 
         self._key = _cmpkey(
             self._version.release,
+            self._version.patch_l,
             self._version.pre_l,
             self._version.pre_v
         )
 
-    def __le__(self, other):
-        if not isinstance(other, Version):
-            return NotImplemented
-        return self._key <= other._key
-
-    def __lt__(self, other):
+    def __eq__(self, other):
         if not isinstance(other, Version):
             return NotImplemented
-        return self._key < other._key
-
-    def __ge__(self, other):
-        if not isinstance(other, Version):
-            return NotImplemented
-        return self._key >= other._key
+        return self._key == other._key
 
     def __gt__(self, other):
         if not isinstance(other, Version):
             return NotImplemented
         return self._key > other._key
 
-def _cmpkey(release, pre_l, pre_v):
+def _cmpkey(release, patch_l, pre_l, pre_v):
     # remove leading 0
     _release = tuple(
         reversed(list(itertools.dropwhile(lambda x: x == 0, reversed(release))))
     )
+
+    _patch = patch_l.upper()
+
     if pre_l is None and pre_v is None:
         _pre = float('inf')
     else:
         _pre = float(pre_v) if pre_v else float('-inf')
-    return _release, _pre
+    return _release, _patch, _pre
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 35e2b29a9a..3f343a2841 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -23,5 +23,14 @@ class CVECheck(OESelftestTestCase):
         self.assertTrue( result, msg="Failed to compare version '1.0_dev' <= '1.0'")
 
         # ignore "p1" and "p2", so these should be equal
-        result = Version("1.0p2") <= Version("1.0p1") and Version("1.0p2") >= Version("1.0p1")
+        result = Version("1.0p2") == Version("1.0p1")
         self.assertTrue( result ,msg="Failed to compare version '1.0p2' to '1.0p1'")
+        # ignore the "b" and "r"
+        result = Version("1.0b") == Version("1.0r")
+        self.assertTrue( result ,msg="Failed to compare version '1.0b' to '1.0r'")
+
+        # consider the trailing alphabet as patched level when comparing
+        result = Version("1.0b","alphabetical") < Version("1.0r","alphabetical")
+        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0b' < '1.0r'")
+        result = Version("1.0b","alphabetical") > Version("1.0","alphabetical")
+        self.assertTrue( result ,msg="Failed to compare version with suffix '1.0b' > '1.0'")
-- 
2.17.1

