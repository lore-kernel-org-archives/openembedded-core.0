Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.35308.1612792401392449109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JSlXA2qR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id r21so5708401otk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rYXAmNDnjMO8IyRbCSeUVGhwJgRMu9BLAEfRxBWIcd8=;
        b=JSlXA2qRixo9+TrOEfnPNdHZkQD//HHcyVKtH4Zf0Xaelixgf4A4u1F96Ka4U1KsM2
         Oald5GABeFFvSpuhy1Mo0BsFCTiXRTPq061867JlvgyAT3aTUt+TAVWR22zuA/62imBJ
         i86b2sgEUmxAtV4bIo3F2/3B5lr/j9ULQ9x/YWRnedUXRSQ7X91ATlNS14yYsbLwOF66
         AdQACnktdQSVBi7iC6ugO8I9NQYIIDS+Cj4GaBX+ijaQbeufwP0TsCQ3NMfNUqUgKjjB
         rZZSkDvlFKbG58YU1ZeMG1Kl87xHjPZkCYnEWshF4h0bNR86e0TDD5wAp6LdgGfqjgBO
         8G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rYXAmNDnjMO8IyRbCSeUVGhwJgRMu9BLAEfRxBWIcd8=;
        b=IXAHudkZp/dMqlN6Dz38SD/ctEcKW8pcd66JBsZw4dGxkJbbx0aPsxrxv0F5TqBPHE
         6Lu74xfSuIpqGImNZOU6Oc9xjYyWE/+CwHQNnjIjjfi9aQAiJWBnVkVeu4jZBfySMGwt
         l+mu4NMCf8Ns4LA+20FNnQT4KWNGr14+bqJON1R2NjiYGX2K7dP7BApbljwDyABKYzzL
         M5iQtX8N5FU8ZolpFQJBrAYhTcGW+5+DidfVTEz8JKTYPcWrMgEdAEVfd0BF5+UDszX2
         jfjHAakywvc2dwjZYLagVt30wwgFq+5GegK5MfD3phvPnd4dnnS1if8S3wSYNvgl3i8l
         aHGw==
X-Gm-Message-State: AOAM530sfjNJC5YyYeod5Q2Wu+F6oZ3dVojd1NAV0I5DGoEAnaSg3cOZ
	Rr7ztAWgAqirLCo3E9k3frOZK5pLaawQK3WzSMU=
X-Google-Smtp-Source: ABdhPJxJlRZhZ+KBOzyYTYJbPEtL0O2falAhpV/6KPnD7xAmaiYCPRxAjIEGoyYpdGdu1tsT9cmbBA==
X-Received: by 2002:a9d:6650:: with SMTP id q16mr11918608otm.57.1612792400228;
        Mon, 08 Feb 2021 05:53:20 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.53.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:53:19 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/28] cve-check: replace Looseversion with custom version class
Date: Mon,  8 Feb 2021 03:51:58 -1000
Message-Id: <294baea424472341d2ec880f13699076315d8274.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
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

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6ced85e9ddd3569240f1e8b82130d1ac0fffbc40)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass            | 10 ++--
 meta/lib/oe/cve_check.py                  | 58 +++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/cve_check.py | 27 +++++++++++
 3 files changed, 90 insertions(+), 5 deletions(-)
 create mode 100644 meta/lib/oe/cve_check.py
 create mode 100644 meta/lib/oeqa/selftest/cases/cve_check.py

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 669da6c8e9..93af667544 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -203,7 +203,7 @@ def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
     """
-    from distutils.version import LooseVersion
+    from oe.cve_check import Version
 
     pn = d.getVar("PN")
     real_pv = d.getVar("PV")
@@ -260,8 +260,8 @@ def check_cves(d, patched_cves):
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
@@ -271,8 +271,8 @@ def check_cves(d, patched_cves):
 
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
2.25.1

