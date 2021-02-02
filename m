Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: rL3pWC6qdnLa8UFNWsp6hO6uW3e5+poj+O7Q6XwJx0GxDcT9zrd0qYPH4J9urfkLmELZKrMwjr
 TP4KdbO2jPVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876920"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876920"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:33 -0800
IronPort-SDR: 5SvCU2yTXbkSAfZnf+CZUFo1O3A9Pz/HpxvKzRH2YH1Wn8u7cGzFmbhMQxkJjICKpGzGIr7NdP
 5h1rMlfWkorw==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360974"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:32 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/25] cve-check: replace Looseversion with custom version class
Date: Tue,  2 Feb 2021 13:34:00 +0800
Message-Id: <02a44b507a1e49a4c460f3e1bec92832b71dfe08.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

(From OE-Core rev: 6ced85e9ddd3569240f1e8b82130d1ac0fffbc40)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3807c6d9a78ac8ade24c9c69cfe2b9624c49a20d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.29.2

