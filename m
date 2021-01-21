Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.1535.1611195978936726874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 18:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: nVcUGeAMpNhXmh6vJC1FWEovtS4EVXoXExgwJW9ZpPEIlN6uV5OdqV3U/cgQATG8HcaAPPcjLb
 WCQ7j4kZ4fKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="166870638"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="166870638"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 18:26:18 -0800
IronPort-SDR: lcM73DSSij2T7UGRr3ehrwXIe4aEOv0hiSIRMHPJL9JXssviZIyQNH5+J0F1XvfCO4hd0bdBwp
 BB60JHmZbe5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="351303934"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2021 18:26:17 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-check: replace Looseversion with custom version class
Date: Thu, 21 Jan 2021 10:26:16 +0800
Message-Id: <20210121022616.4451-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

The way distutils.version.LooseVersion compare version are tricky, it treat
all these ( "1.0-beta2", "1.0-rc1", "1.0A", "1.0p2" and "1.0pre1") as greater
version than "1.0". This might be right for "1.0A" and "1.0p1" but not for
the rest, also these version could be confusing, the "p" in "1.0p1" can be
"pre" or "patched" version or even other meaning.

replace Looseversion with custom class, it uses regex to capture common
version format like "1.1.1" or tag format using date like "2020-12-12" as
release section, check for following known string/label (beta, rc, pre, dev,
alpha, preview) as pre-release section, any other trailing characters
are difficult to understand and define so dont consider these when
comparing. compare release section and pre-release section saperately.

[YOCTO#14127]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/classes/cve-check.bbclass | 55 ++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index d843e7c4ac..b119353781 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -206,7 +206,52 @@ def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
     """
-    from distutils.version import LooseVersion
+    import collections, re, itertools
+
+    _Version = collections.namedtuple(
+        "_Version", ["release", "pre_l", "pre_v"]
+    )
+
+    class Version():
+        _version_pattern =  r"""v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
+        _regex = re.compile(r"^\s*" + _version_pattern + r"\s*$", re.VERBOSE | re.IGNORECASE)
+        def __init__(self, version):
+            match = self._regex.search(version)
+            if not match:
+                raise Exception("Invalid version: '{0}'".format(version))
+
+            self._version = _Version(
+                release=tuple(int(i) for i in match.group("release").replace("-",".").split(".")),
+                pre_l=match.group("pre_l"),
+                pre_v=match.group("pre_v")
+            )
+
+            self._key = _cmpkey(
+                self._version.release,
+                self._version.pre_l,
+                self._version.pre_v
+            )
+
+        def __ge__(self, other):
+            if not isinstance(other, Version):
+                return NotImplemented
+            return self._key >= other._key
+
+        def __gt__(self, other):
+            if not isinstance(other, Version):
+                return NotImplemented
+            return self._key > other._key
+
+    def _cmpkey(release, pre_l, pre_v):
+        # remove leading 0
+        _release = tuple(
+            reversed(list(itertools.dropwhile(lambda x: x == 0, reversed(release))))
+        )
+        if pre_l is None and pre_v is None:
+            _pre = float('inf')
+        else:
+            _pre = float(pre_v) if pre_v else float('-inf')
+        return _release, _pre
 
     pn = d.getVar("PN")
     real_pv = d.getVar("PV")
@@ -263,8 +308,8 @@ def check_cves(d, patched_cves):
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
@@ -274,8 +319,8 @@ def check_cves(d, patched_cves):
 
                     if operator_end:
                         try:
-                            vulnerable_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
-                            vulnerable_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
+                            vulnerable_end  = (operator_end == '<=' and Version(version_end) >= Version(pv))
+                            vulnerable_end |= (operator_end == '<' and Version(version_end) > Version(pv) )
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
-- 
2.17.1

