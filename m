Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E383C55170
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32338.1771565685765362574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KYbWX0dV;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14505; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aRexKGyrTpvfMEiwL0zxw3Jwy4CRqyS77N3otej5uCg=;
  b=KYbWX0dVLmzb1XVf8G3XMtHgmaufEdOg0Cs/RtRS1C6aMe0Jew06j3tZ
   6JTFmEgq6+B/qWoUQHe52XMDS5fQrEolptG6sXIWjSGDKvfOX7S6mVGNV
   nf4R3Co0VKzfJvM5MBCYj3G3yr0gz5wgx5dHdq/RwfmddWBuLoqhPPdj3
   eX5O016pgZpwYsgjxuYRDCDaSKtKvtv0Ll3S7z1iDo0dmUJmBDQHft7fu
   nhYuk3ayp7K2IGYQyfT6BMePZkXCyDQszL3/RMBls3yBRF1pvsau/yM/b
   BIQD0FxLFm3Pw8MQyPNEG7Wq3WI1zzogYwkLajTxYQVoSPcCTAogbW7Pg
   Q==;
X-CSE-ConnectionGUID: lVVXVgqzTYqL1DaGKwJcjw==
X-CSE-MsgGUID: phRrhl0VS3qwM3zjdQIH7A==
X-IPAS-Result: =?us-ascii?q?A0BBBAC68Zdp/5P/Ja1aglmCSA+BUEJJlksDgROKUZI2g?=
 =?us-ascii?q?X8PAQEBD1EEAQGFBwKNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGXIZbAgEDMgFGECAxIAsrGYMCgjsDNgIBp0+CLIEBhHzYR?=
 =?us-ascii?q?w2CUgELFAGBOIU8gnmFIFoahHonGxuBcoEUAYJydoIfgkqGHgSDMI1Chg1Ig?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWHUw+JBXhugSCBGwMLG?=
 =?us-ascii?q?A1IESw3FBsEPm4Hji8/gUFzASwmOwElHQkCWRZsUZMMOxOPV4IhgTWeG01xC?=
 =?us-ascii?q?iiDdJtchXwaM4QElBWSUpkGgliPOpFeMjeEaIFoPIFZcBU7gmdSGQ/NGSI1A?=
 =?us-ascii?q?joCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:YFR7MqICDFJsXprTFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS12EHx
 zAYWziEO/uNN2Smc4skOYux/BxT6MWGyoVhSQUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnU0
 T/Oi5eHYgH9gWQsajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1qMn8GA4IB6NpGGEUX2
 fU3Cy8vZRKc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEuojx5nYj/7DLo+kfuwj2XXeDxDo1XTrq0yi4TW5FIuiuOybIeIJ7RmQ+1NnnyCp
 maewV+iGw4/b86dxQOk0i2F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:+78UCaoCOkmWC18FVmdHRSEaV5oseYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMbC/5vyKmTVR1L0bsb+6zJw=
X-Talos-CUID: 9a23:vx+MN29ZdaK3mBc5oYeVv0oqJPAbfWTP8EbJBxaUAElKV5+eS0DFrQ==
X-Talos-MUID: 9a23:5B0SSAlInE4o9Zv8p2Umdnp6NP1y46D2NntWiIoj4NuGORVRG2i02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="672374555"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 2F34D180008B4;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 9839ACC8CFE; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 14/34] cve-check: Rework patch parsing
Date: Thu, 19 Feb 2026 21:34:23 -0800
Message-Id: <20260220053443.3006180-14-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231463

From: Colin McAllister <colinmca242@gmail.com>

The cve_check functionality to parse CVE IDs from the patch filename and
patch contents have been reworked to improve parsing and also utilize
tests. This ensures that the parsing works as intended.

Additionally, the new patched_cves dict has a few issues I tried to fix
as well. If multiple patch files exist for a single CVE ID, only the
last one will show up with the "resource" key. The value for the
"resource" key has been updated to hold a list and return all patch
files associated with a given CVE ID. Also, at the end of
get_patch_cves, CVE_STATUS can overwrite an existing entry in the dict.
This could cause an issue, for example, if a CVE has been addressed via
a patch, but a CVE_STATUS line also exists that ignores the given CVE
ID. A warning has been added if this ever happens.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87c6da681609b4f8e048eca2a27ae8e068c724e1)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/lib/oe/cve_check.py                  | 166 ++++++++++++------
 meta/lib/oeqa/selftest/cases/cve_check.py | 205 ++++++++++++++++++++++
 2 files changed, 317 insertions(+), 54 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 8e676bcc74..c1f36db775 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -5,9 +5,11 @@
 #
 
 import collections
-import re
-import itertools
 import functools
+import itertools
+import os.path
+import re
+import oe.patch
 
 _Version = collections.namedtuple(
     "_Version", ["release", "patch_l", "pre_l", "pre_v"]
@@ -71,76 +73,132 @@ def _cmpkey(release, patch_l, pre_l, pre_v):
     return _release, _patch, _pre
 
 
-def get_patched_cves(d):
+def parse_cve_from_filename(patch_filename):
     """
-    Get patches that solve CVEs using the "CVE: " tag.
+    Parses CVE ID from the filename
+
+    Matches the last "CVE-YYYY-ID" in the file name, also if written
+    in lowercase. Possible to have multiple CVE IDs in a single
+    file name, but only the last one will be detected from the file name.
+
+    Returns the last CVE ID foudn in the filename. If no CVE ID is found
+    an empty string is returned.
     """
+    cve_file_name_match = re.compile(r".*(CVE-\d{4}-\d{4,})", re.IGNORECASE)
 
-    import re
-    import oe.patch
+    # Check patch file name for CVE ID
+    fname_match = cve_file_name_match.search(patch_filename)
+    return fname_match.group(1).upper() if fname_match else ""
 
-    cve_match = re.compile(r"CVE:( CVE-\d{4}-\d+)+")
 
-    # Matches the last "CVE-YYYY-ID" in the file name, also if written
-    # in lowercase. Possible to have multiple CVE IDs in a single
-    # file name, but only the last one will be detected from the file name.
-    # However, patch files contents addressing multiple CVE IDs are supported
-    # (cve_match regular expression)
-    cve_file_name_match = re.compile(r".*(CVE-\d{4}-\d+)", re.IGNORECASE)
+def parse_cves_from_patch_contents(patch_contents):
+    """
+    Parses CVE IDs from patch contents
 
+    Matches all CVE IDs contained on a line that starts with "CVE: ". Any
+    delimiter (',', '&', "and", etc.) can be used without any issues. Multiple
+    "CVE:" lines can also exist.
+
+    Returns a set of all CVE IDs found in the patch contents.
+    """
+    cve_ids = set()
+    cve_match = re.compile(r"CVE-\d{4}-\d{4,}")
+    # Search for one or more "CVE: " lines
+    for line in patch_contents.split("\n"):
+        if not line.startswith("CVE:"):
+            continue
+        cve_ids.update(cve_match.findall(line))
+    return cve_ids
+
+
+def parse_cves_from_patch_file(patch_file):
+    """
+    Parses CVE IDs associated with a particular patch file, using both the filename
+    and patch contents.
+
+    Returns a set of all CVE IDs found in the patch filename and contents.
+    """
+    cve_ids = set()
+    filename_cve = parse_cve_from_filename(patch_file)
+    if filename_cve:
+        bb.debug(2, "Found %s from patch file name %s" % (filename_cve, patch_file))
+        cve_ids.add(parse_cve_from_filename(patch_file))
+
+    # Remote patches won't be present and compressed patches won't be
+    # unpacked, so say we're not scanning them
+    if not os.path.isfile(patch_file):
+        bb.note("%s is remote or compressed, not scanning content" % patch_file)
+        return cve_ids
+
+    with open(patch_file, "r", encoding="utf-8") as f:
+        try:
+            patch_text = f.read()
+        except UnicodeDecodeError:
+            bb.debug(
+                1,
+                "Failed to read patch %s using UTF-8 encoding"
+                " trying with iso8859-1" % patch_file,
+            )
+            f.close()
+            with open(patch_file, "r", encoding="iso8859-1") as f:
+                patch_text = f.read()
+
+    cve_ids.update(parse_cves_from_patch_contents(patch_text))
+
+    if not cve_ids:
+        bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
+    else:
+        bb.debug(2, "Patch %s solves %s" % (patch_file, ", ".join(sorted(cve_ids))))
+
+    return cve_ids
+
+
+def get_patched_cves(d):
+    """
+    Determines the CVE IDs that have been solved by either patches incuded within
+    SRC_URI or by setting CVE_STATUS.
+
+    Returns a dictionary with the CVE IDs as keys and an associated dictonary of
+    relevant metadata as the value.
+    """
     patched_cves = {}
     patches = oe.patch.src_patches(d)
     bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
+
+    # Check each patch file
     for url in patches:
         patch_file = bb.fetch.decodeurl(url)[2]
-
-        # Check patch file name for CVE ID
-        fname_match = cve_file_name_match.search(patch_file)
-        if fname_match:
-            cve = fname_match.group(1).upper()
-            patched_cves[cve] = {"abbrev-status": "Patched", "status": "fix-file-included", "resource": patch_file}
-            bb.debug(2, "Found %s from patch file name %s" % (cve, patch_file))
-
-        # Remote patches won't be present and compressed patches won't be
-        # unpacked, so say we're not scanning them
-        if not os.path.isfile(patch_file):
-            bb.note("%s is remote or compressed, not scanning content" % patch_file)
-            continue
-
-        with open(patch_file, "r", encoding="utf-8") as f:
-            try:
-                patch_text = f.read()
-            except UnicodeDecodeError:
-                bb.debug(1, "Failed to read patch %s using UTF-8 encoding"
-                        " trying with iso8859-1" %  patch_file)
-                f.close()
-                with open(patch_file, "r", encoding="iso8859-1") as f:
-                    patch_text = f.read()
-
-        # Search for one or more "CVE: " lines
-        text_match = False
-        for match in cve_match.finditer(patch_text):
-            # Get only the CVEs without the "CVE: " tag
-            cves = patch_text[match.start()+5:match.end()]
-            for cve in cves.split():
-                bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
-                patched_cves[cve] = {"abbrev-status": "Patched", "status": "fix-file-included", "resource": patch_file}
-                text_match = True
-
-        if not fname_match and not text_match:
-            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
+        for cve_id in parse_cves_from_patch_file(patch_file):
+            if cve_id not in patched_cves:
+                {
+                    "abbrev-status": "Patched",
+                    "status": "fix-file-included",
+                    "resource": [patch_file],
+                }
+            else:
+                patched_cves[cve_id]["resource"].append(patch_file)
 
     # Search for additional patched CVEs
-    for cve in (d.getVarFlags("CVE_STATUS") or {}):
-        decoded_status = decode_cve_status(d, cve)
+    for cve_id in d.getVarFlags("CVE_STATUS") or {}:
+        decoded_status = decode_cve_status(d, cve_id)
         products = d.getVar("CVE_PRODUCT")
-        if has_cve_product_match(decoded_status, products) == True:
-            patched_cves[cve] = {
+        if has_cve_product_match(decoded_status, products):
+            if cve_id in patched_cves:
+                bb.warn(
+                    'CVE_STATUS[%s] = "%s" is overwriting previous status of "%s: %s"'
+                    % (
+                        cve_id,
+                        d.getVarFlag("CVE_STATUS", cve_id),
+                        patched_cves[cve_id]["abbrev-status"],
+                        patched_cves[cve_id]["status"],
+                    )
+                )
+            patched_cves[cve_id] = {
                 "abbrev-status": decoded_status["mapping"],
                 "status": decoded_status["detail"],
                 "justification": decoded_status["description"],
                 "affected-vendor": decoded_status["vendor"],
-                "affected-product": decoded_status["product"]
+                "affected-product": decoded_status["product"],
             }
 
     return patched_cves
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 3dd3e89d3e..511e4b81b4 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -120,6 +120,211 @@ class CVECheck(OESelftestTestCase):
         self.assertEqual(has_cve_product_match(status, "test glibca:glibc"), True)
         self.assertEqual(has_cve_product_match(status, "glibca:glibc test"), True)
 
+    def test_parse_cve_from_patch_filename(self):
+        from oe.cve_check import parse_cve_from_filename
+
+        # Patch filename without CVE ID
+        self.assertEqual(parse_cve_from_filename("0001-test.patch"), "")
+
+        # Patch with single CVE ID
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2022-12345.patch"), "CVE-2022-12345"
+        )
+
+        # Patch with multiple CVE IDs
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2022-41741-CVE-2022-41742.patch"),
+            "CVE-2022-41742",
+        )
+
+        # Patches with CVE ID and appended text
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2023-3019-0001.patch"), "CVE-2023-3019"
+        )
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2024-21886-1.patch"), "CVE-2024-21886"
+        )
+
+        # Patch with CVE ID and prepended text
+        self.assertEqual(
+            parse_cve_from_filename("grep-CVE-2012-5667.patch"), "CVE-2012-5667"
+        )
+        self.assertEqual(
+            parse_cve_from_filename("0001-CVE-2012-5667.patch"), "CVE-2012-5667"
+        )
+
+        # Patch with CVE ID and both prepended and appended text
+        self.assertEqual(
+            parse_cve_from_filename(
+                "0001-tpm2_import-fix-fixed-AES-key-CVE-2021-3565-0001.patch"
+            ),
+            "CVE-2021-3565",
+        )
+
+        # Only grab the last CVE ID in the filename
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2012-5667-CVE-2012-5668.patch"),
+            "CVE-2012-5668",
+        )
+
+        # Test invalid CVE ID with incorrect length (must be at least 4 digits)
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2024-001.patch"),
+            "",
+        )
+
+        # Test valid CVE ID with very long length
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2024-0000000000000000000000001.patch"),
+            "CVE-2024-0000000000000000000000001",
+        )
+
+    def test_parse_cve_from_patch_contents(self):
+        import textwrap
+        from oe.cve_check import parse_cves_from_patch_contents
+
+        # Standard patch file excerpt without any patches
+        self.assertEqual(
+            parse_cves_from_patch_contents(
+                textwrap.dedent("""\
+            remove "*" for root since we don't have a /etc/shadow so far.
+
+            Upstream-Status: Inappropriate [configuration]
+
+            Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+            --- base-passwd/passwd.master~nobash
+            +++ base-passwd/passwd.master
+            @@ -1,4 +1,4 @@
+            -root:*:0:0:root:/root:/bin/sh
+            +root::0:0:root:/root:/bin/sh
+            daemon:*:1:1:daemon:/usr/sbin:/bin/sh
+            bin:*:2:2:bin:/bin:/bin/sh
+            sys:*:3:3:sys:/dev:/bin/sh
+            """)
+            ),
+            set(),
+        )
+
+        # Patch file with multiple CVE IDs (space-separated)
+        self.assertEqual(
+            parse_cves_from_patch_contents(
+                textwrap.dedent("""\
+                There is an assertion in function _cairo_arc_in_direction().
+
+                CVE: CVE-2019-6461 CVE-2019-6462
+                Upstream-Status: Pending
+                Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+                index 390397bae..1bde774a4 100644
+                --- a/src/cairo-arc.c
+                +++ b/src/cairo-arc.c
+                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t          *cr,
+                    if (cairo_status (cr))
+                        return;
+
+                -    assert (angle_max >= angle_min);
+                +    if (angle_max < angle_min)
+                +       return;
+
+                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+                    angle_max = fmod (angle_max - angle_min, 2 * M_PI);
+            """),
+            ),
+            {"CVE-2019-6461", "CVE-2019-6462"},
+        )
+
+        # Patch file with multiple CVE IDs (comma-separated w/ both space and no space)
+        self.assertEqual(
+            parse_cves_from_patch_contents(
+                textwrap.dedent("""\
+                There is an assertion in function _cairo_arc_in_direction().
+
+                CVE: CVE-2019-6461,CVE-2019-6462, CVE-2019-6463
+                Upstream-Status: Pending
+                Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+                index 390397bae..1bde774a4 100644
+                --- a/src/cairo-arc.c
+                +++ b/src/cairo-arc.c
+                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t          *cr,
+                    if (cairo_status (cr))
+                        return;
+
+                -    assert (angle_max >= angle_min);
+                +    if (angle_max < angle_min)
+                +       return;
+
+                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+                    angle_max = fmod (angle_max - angle_min, 2 * M_PI);
+
+            """),
+            ),
+            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463"},
+        )
+
+        # Patch file with multiple CVE IDs (&-separated)
+        self.assertEqual(
+            parse_cves_from_patch_contents(
+                textwrap.dedent("""\
+                There is an assertion in function _cairo_arc_in_direction().
+
+                CVE: CVE-2019-6461 & CVE-2019-6462
+                Upstream-Status: Pending
+                Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+                index 390397bae..1bde774a4 100644
+                --- a/src/cairo-arc.c
+                +++ b/src/cairo-arc.c
+                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t          *cr,
+                    if (cairo_status (cr))
+                        return;
+
+                -    assert (angle_max >= angle_min);
+                +    if (angle_max < angle_min)
+                +       return;
+
+                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+                    angle_max = fmod (angle_max - angle_min, 2 * M_PI);
+            """),
+            ),
+            {"CVE-2019-6461", "CVE-2019-6462"},
+        )
+
+        # Patch file with multiple lines with CVE IDs
+        self.assertEqual(
+            parse_cves_from_patch_contents(
+                textwrap.dedent("""\
+                There is an assertion in function _cairo_arc_in_direction().
+
+                CVE: CVE-2019-6461 & CVE-2019-6462
+
+                CVE: CVE-2019-6463 & CVE-2019-6464
+                Upstream-Status: Pending
+                Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+                index 390397bae..1bde774a4 100644
+                --- a/src/cairo-arc.c
+                +++ b/src/cairo-arc.c
+                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t          *cr,
+                    if (cairo_status (cr))
+                        return;
+
+                -    assert (angle_max >= angle_min);
+                +    if (angle_max < angle_min)
+                +       return;
+
+                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+                    angle_max = fmod (angle_max - angle_min, 2 * M_PI);
+
+            """),
+            ),
+            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463", "CVE-2019-6464"},
+        )
 
     def test_recipe_report_json(self):
         config = """

