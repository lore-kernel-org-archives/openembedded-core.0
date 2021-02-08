Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.35333.1612792407915862383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dseyI40/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id y11so14237880otq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2D4pk0jxMGfvBIPm/IqeRkHw0YlFub/ujP+LSPEWblI=;
        b=dseyI40/HPAfUhI292JMxTWMBuxKaJ+qJ604kHFYTqgAsxrZzIY3Wb/4SouVnhEX9X
         r47aEl5VPVMg0XRRXtc3/ZSzwt1Kz26tQ8a+3z2tHBdX8Im1805VIK7zsscb1TyYC+CF
         EDA0hNjVVYBA0YFHwajGfQB5JLPkaYt9hhTpNwDjrYbfuiMCYrr6tVpDZNhNOX8U8CNF
         GPX0LQvToxzUwY+B68foe4vtiI+EQ0/8gObBQFfJEpoY3Vj+viiTaOEHZ2P6oHPB79E6
         N59otbDtzp3+3cpFPDb2Fa34sMWKUwTZ5PJc3Tb0gvWhOGdLUB7qxq5PTpk3HyBg3y/N
         FzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2D4pk0jxMGfvBIPm/IqeRkHw0YlFub/ujP+LSPEWblI=;
        b=tBXta5VrVmB4pPOxTgmA4VzPp8tl1AeL6PeE5FCAgPvqMn6HeMuhym//jOZnyOvEmm
         CS8yT4hfwQJFwjUzQgbeaQ7VcAfOjDMDYSLYieND+7JT3SRzqvQV8soevReCjf5q1uYa
         EJ1Oypaq5k9z5ZpFLLNZ08vXMa8odPysCuw4bJjCOPhVL9dMkj7+aTR6c3i050+4KlnB
         KRXdmO5yg2+wgC+7pdUOZT4jxID1QrwjFX4csochbJhr/0HhyS8Y44dI1UpMLvmDVuOL
         RV42jGOia0FbMCJtNKFTDhpEDUs4itYwpAh8wTN2tfzIJ4NjkhDK7WUY5G6IWc9bvQo7
         MWmQ==
X-Gm-Message-State: AOAM531botDGp10qiesXDmk2GC9bNRq6fPJKiyPvscz7ONY7DCcKu7PB
	YNma3lwO7083iNgTNQMssciqxjgXTpVANPL4JEs=
X-Google-Smtp-Source: ABdhPJyDuyXdsCERBF+07/mbJVF9zoMYKBO4vXyZS2rctFOVE3k8HXNvcGOoNPY+NbnEiv80SUWWbg==
X-Received: by 2002:a9d:3b26:: with SMTP id z35mr12402374otb.192.1612792406718;
        Mon, 08 Feb 2021 05:53:26 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.53.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:53:25 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/28] cve_check: add CVE_VERSION_SUFFIX to indicate suffix in versioning
Date: Mon,  8 Feb 2021 03:51:59 -1000
Message-Id: <37a40c30709bf80c74948f47361b2be2c646c9d8.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

add CVE_VERSION_SUFFIX to indicate the version suffix type, currently
works in two value, "alphabetical" if the version string uses single
alphabetical character suffix as incremental release, blank to not
consider the unidentified suffixes. This can be expand when more suffix
pattern identified.

refactor cve_check.Version class to use functools and add parameter to
handle suffix condition.

Also update testcases to cover new changes.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5dfd5ad5144708b474ef31eaa89a846c57be8ac0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass            | 12 ++++---
 meta/lib/oe/cve_check.py                  | 40 ++++++++++++-----------
 meta/lib/oeqa/selftest/cases/cve_check.py | 11 ++++++-
 3 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 93af667544..dbff852e18 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -50,6 +50,9 @@ CVE_CHECK_PN_WHITELIST ?= ""
 # 
 CVE_CHECK_WHITELIST ?= ""
 
+# set to "alphabetical" for version using single alphabetical character as increament release
+CVE_VERSION_SUFFIX ??= ""
+
 python cve_save_summary_handler () {
     import shutil
     import datetime
@@ -207,6 +210,7 @@ def check_cves(d, patched_cves):
 
     pn = d.getVar("PN")
     real_pv = d.getVar("PV")
+    suffix = d.getVar("CVE_VERSION_SUFFIX")
 
     cves_unpatched = []
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
@@ -260,8 +264,8 @@ def check_cves(d, patched_cves):
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
@@ -271,8 +275,8 @@ def check_cves(d, patched_cves):
 
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
index ec48a3f829..ce755f940a 100644
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
+        if str(suffix) == "alphabetical":
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
+            patch_l=match.group("patch_l") if str(suffix) == "alphabetical" and match.group("patch_l") else "",
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
2.25.1

