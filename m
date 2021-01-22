Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.6806.1611310042802615323
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: phwBd5JPt3RKFQrdVYnr9YEhkqSlsS0qgM5fVl2yN3J7Bk//UwZCf7m29uu3WyMfttkGd+gJla
 tuZEfscl1Nyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="198179519"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="198179519"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 02:07:21 -0800
IronPort-SDR: /eLxU2dVeoXgtHs8jPDU9qjqvV5m16Vw9Hmq1VRaxoroZK5Q1eZoxisI3HO9Sz3SyHKkc6FU8Q
 V78w4XdgYuNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="355199790"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga006.jf.intel.com with ESMTP; 22 Jan 2021 02:07:20 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] cve-check: replace Looseversion with custom version class
Date: Fri, 22 Jan 2021 18:07:19 +0800
Message-Id: <20210122100719.38378-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

The way distutils.version.LooseVersion compare version are tricky, it treat
all these ( "1.0-beta2", "1.0-rc1", "1.0A", "1.0p2" and "1.0pre1") as greater
version than "1.0". This might be right for "1.0A" and "1.0p1" but not for
the rest, also these version could be confusing, the "p" in "1.0p1" can be
"pre" or "patched" version or even other meaning.

Replace Looseversion with custom class, it uses regex to capture common
version format like "1.1.1" or tag format using date like "2020-12-12" as
release section, check for following known string/tags ( beta, rc, pre, dev,
alpha, preview) as pre-release section, any other trailing characters
are difficult to understand/define so ignore them. Compare release
section and pre-release section saperately.

included selftest for the version class.

[YOCTO#14127]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/classes/cve-check.bbclass            | 10 ++--
 meta/lib/oe/cve_check.py                  | 58 +++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/cve_check.py | 27 +++++++++++
 3 files changed, 90 insertions(+), 5 deletions(-)
 create mode 100644 meta/lib/oe/cve_check.py
 create mode 100644 meta/lib/oeqa/selftest/cases/cve_check.py

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index d843e7c4ac..646cc879dd 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -206,7 +206,7 @@ def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
     """
-    from distutils.version import LooseVersion
+    from oe.cve_check import Version
 
     pn = d.getVar("PN")
     real_pv = d.getVar("PV")
@@ -263,8 +263,8 @@ def check_cves(d, patched_cves):
                 else:
                     if operator_start:
                         try:
-                            vulnerable_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
-                            vulnerable_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
+                            vulnerable_start =  (operator_start == '>=' and Version(pv) >= Version(version_start))
+                            vulnerable_start |= (operator_start == '>' and Version(pv) > Version(version_start))
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
@@ -274,8 +274,8 @@ def check_cves(d, patched_cves):
 
                     if operator_end:
                         try:
-                            vulnerable_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
-                            vulnerable_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
+                            vulnerable_end  = (operator_end == '<=' and Version(pv) <= Version(version_end) )
+                            vulnerable_end |= (operator_end == '<' and Version(pv) < Version(version_end) )
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
new file mode 100644
index 0000000000..ec48a3f829
--- /dev/null
+++ b/meta/lib/oe/cve_check.py
@@ -0,0 +1,58 @@
+import collections
+import re
+import itertools
+
+_Version = collections.namedtuple(
+    "_Version", ["release", "pre_l", "pre_v"]
+)
+
+class Version():
+    _version_pattern =  r"""v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
+    _regex = re.compile(r"^\s*" + _version_pattern + r"\s*$", re.VERBOSE | re.IGNORECASE)
+    def __init__(self, version):
+        match = self._regex.search(version)
+        if not match:
+            raise Exception("Invalid version: '{0}'".format(version))
+
+        self._version = _Version(
+            release=tuple(int(i) for i in match.group("release").replace("-",".").split(".")),
+            pre_l=match.group("pre_l"),
+            pre_v=match.group("pre_v")
+        )
+
+        self._key = _cmpkey(
+            self._version.release,
+            self._version.pre_l,
+            self._version.pre_v
+        )
+
+    def __le__(self, other):
+        if not isinstance(other, Version):
+            return NotImplemented
+        return self._key <= other._key
+
+    def __lt__(self, other):
+        if not isinstance(other, Version):
+            return NotImplemented
+        return self._key < other._key
+
+    def __ge__(self, other):
+        if not isinstance(other, Version):
+            return NotImplemented
+        return self._key >= other._key
+
+    def __gt__(self, other):
+        if not isinstance(other, Version):
+            return NotImplemented
+        return self._key > other._key
+
+def _cmpkey(release, pre_l, pre_v):
+    # remove leading 0
+    _release = tuple(
+        reversed(list(itertools.dropwhile(lambda x: x == 0, reversed(release))))
+    )
+    if pre_l is None and pre_v is None:
+        _pre = float('inf')
+    else:
+        _pre = float(pre_v) if pre_v else float('-inf')
+    return _release, _pre
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
new file mode 100644
index 0000000000..35e2b29a9a
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -0,0 +1,27 @@
+from oe.cve_check import Version
+from oeqa.selftest.case import OESelftestTestCase
+
+class CVECheck(OESelftestTestCase):
+
+    def test_version_compare(self):
+        result = Version("100") > Version("99")
+        self.assertTrue( result, msg="Failed to compare version '100' > '99'")
+        result = Version("2.3.1") > Version("2.2.3")
+        self.assertTrue( result, msg="Failed to compare version '2.3.1' > '2.2.3'")
+        result = Version("2021-01-21") > Version("2020-12-25")
+        self.assertTrue( result, msg="Failed to compare version '2021-01-21' > '2020-12-25'")
+        result = Version("1.2-20200910") < Version("1.2-20200920")
+        self.assertTrue( result, msg="Failed to compare version '1.2-20200910' < '1.2-20200920'")
+
+        result = Version("1.0") >= Version("1.0beta")
+        self.assertTrue( result, msg="Failed to compare version '1.0' >= '1.0beta'")
+        result = Version("1.0-rc2") > Version("1.0-rc1")
+        self.assertTrue( result, msg="Failed to compare version '1.0-rc2' > '1.0-rc1'")
+        result = Version("1.0.alpha1") < Version("1.0")
+        self.assertTrue( result, msg="Failed to compare version '1.0.alpha1' < '1.0'")
+        result = Version("1.0_dev") <= Version("1.0")
+        self.assertTrue( result, msg="Failed to compare version '1.0_dev' <= '1.0'")
+
+        # ignore "p1" and "p2", so these should be equal
+        result = Version("1.0p2") <= Version("1.0p1") and Version("1.0p2") >= Version("1.0p1")
+        self.assertTrue( result ,msg="Failed to compare version '1.0p2' to '1.0p1'")
-- 
2.17.1

