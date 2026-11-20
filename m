Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2609.1795166598792861901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 01:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=pBErw/CT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1328017-202611200923163b8f511c3b000207d1-nteup7@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202611200923163b8f511c3b000207d1
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Nov 2026 10:23:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=U76+3vLoJfaUQBKjuQ/91R5h0NjTpXa63sIQaa9YvFo=;
 b=pBErw/CTl15fAzSeWclj39XiB0Hf/fPROw5cXCTaWQluSSawC8zZa261B+kDxGCdH2dYQt
 TiY3xsG5xeiXmGDp+KWYXS7oBh4xKIz2SB6CIpROf4LJq90ThBvTaC24m+KkT76fXvpqnYgu
 2GOa/P4JO3/HhJx+QEQVH5ZseUEBXEPQXMPBrku3bMXmvA7wH/55jTT01e0zgduTtfGqu5ik
 h1bwhu5fUwHNGDoJ9dF17YNHQwyG2+bPaXEjkbfUb8owlehouOSUMOzf30RSeo/RtgvlmtpF
 FVKyuMsNZsheQ7MF77RmhNKSuyl9vRhtds1Wc5lpmKbCDtgAXjpkpGbA==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [scarthgap][PATCH 1/2] cve-check: keep global CVE exclusions out of unrelated reports
Date: Fri, 20 Nov 2026 10:23:08 +0100
Message-Id: <20261120092309.4056817-2-peter.tatrai.ext@siemens.com>
In-Reply-To: <20261120092309.4056817-1-peter.tatrai.ext@siemens.com>
References: <20261120092309.4056817-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 09:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250753
Content-Type: text/plain; charset="utf-8"

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

The Scarthgap SPDX 3.0 backport [1] did not bring over product
filtering for CVE_STATUS assessments. The follow-up [2] made SPDX
export all CVE_STATUS assessments, exposing the same problem in SPDX
that already affected CVE-check reports.

Global exclusion lists are loaded for every recipe. Without product
filtering, assessments intended for one product can appear in the
CVE-check and SPDX/VEX reports of unrelated packages.

Backport the scoped parser from OE-Core commit abca80a716e9 and the
product matcher from 452e605b55ad as they appear in Wrynose. Preserve
Scarthgap's tuple and set APIs and the behavior of unscoped entries.

[1] Scarthgap SPDX 3.0 backport:
https://git.openembedded.org/openembedded-core/commit/?id=9c9b9545049a
[2] Export all CVE_STATUS assessments:
https://git.openembedded.org/openembedded-core/commit/?id=9a204670b1c0

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/classes/vex.bbclass                  |  1 -
 meta/lib/oe/cve_check.py                  | 76 ++++++++++++++++++++---
 meta/lib/oe/spdx30_tasks.py               |  1 -
 meta/lib/oeqa/selftest/cases/cve_check.py | 48 ++++++++++++++
 4 files changed, 117 insertions(+), 9 deletions(-)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 97213ea..3c44dbb 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -141,7 +141,6 @@ python do_generate_vex () {
     for cve_id in (d.getVarFlags("CVE_STATUS") or {}):
         mapping, detail, description = decode_cve_status(d, cve_id)
         if not mapping or not detail:
-            bb.warn(f"Skipping {cve_id} — missing or unknown CVE status")
             continue
         cve_data[cve_id] = {
             "abbrev-status": mapping,
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 7c09b78..9620dc5 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -227,22 +227,84 @@ def convert_cve_version(version):
 
 def decode_cve_status(d, cve):
     """
-    Convert CVE_STATUS into status, detail and description.
+    Convert a matching CVE_STATUS into status, detail and description.
+
+    Keep the Scarthgap tuple API for cve-check and existing SPDX consumers.
     """
-    status = d.getVarFlag("CVE_STATUS", cve)
+    status = decode_cve_status_scoped(d, cve)
     if not status:
         return ("", "", "")
+    # Scarthgap applies unscoped statuses even when CVE_PRODUCT is empty.
+    unscoped = status["vendor"] == status["product"] == "*"
+    if not unscoped and not has_cve_product_match(status, d.getVar("CVE_PRODUCT") or ""):
+        return ("", "", "")
+    return (status["mapping"], status["detail"], status["description"])
+
+
+def has_cve_product_match(detailed_status, products):
+    """
+    Check product/vendor match between detailed_status from decode_cve_status and a string of
+    products (like from CVE_PRODUCT)
+    """
+    for product in products.split():
+        vendor = "*"
+        if ":" in product:
+            vendor, product = product.split(":", 1)
+
+        if (vendor == detailed_status["vendor"] or detailed_status["vendor"] == "*") and \
+            (product == detailed_status["product"] or detailed_status["product"] == "*"):
+            return True
 
-    status_split = status.split(':', 1)
-    detail = status_split[0]
-    description = status_split[1].strip() if (len(status_split) > 1) else ""
+    #if no match, return False
+    return False
 
+
+def decode_cve_status_scoped(d, cve):
+    """
+    Convert CVE_STATUS into status, vendor, product, detail and description.
+    """
+    status = d.getVarFlag("CVE_STATUS", cve)
+    if not status:
+        return {}
+
+    status_split = status.split(':', 4)
+    status_out = {}
+    status_out["detail"] = status_split[0]
+    product = "*"
+    vendor = "*"
+    description = ""
+    if len(status_split) >= 4 and status_split[1].strip() == "cpe":
+        # Both vendor and product are mandatory if cpe: present, the syntax is then:
+        # detail: cpe:vendor:product:description
+        vendor = status_split[2].strip()
+        product = status_split[3].strip()
+        description = status_split[4].strip()
+    elif len(status_split) >= 2 and status_split[1].strip() == "cpe":
+        # Malformed CPE
+        bb.warn(
+            'Invalid CPE information for CVE_STATUS[%s] = "%s", not setting CPE'
+            % (cve, status)
+        )
+    else:
+        # Other case: no CPE, the syntax is then:
+        # detail: description
+        description = status.split(':', 1)[1].strip() if (len(status_split) > 1) else ""
+
+    status_out["vendor"] = vendor
+    status_out["product"] = product
+    status_out["description"] = description
+
+    detail = status_out["detail"]
     status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
     if status_mapping is None:
-        bb.warn('Invalid detail "%s" for CVE_STATUS[%s] = "%s", fallback to Unpatched' % (detail, cve, status))
+        bb.warn(
+            'Invalid detail "%s" for CVE_STATUS[%s] = "%s", fallback to Unpatched'
+            % (detail, cve, status)
+        )
         status_mapping = "Unpatched"
+    status_out["mapping"] = status_mapping
 
-    return (status_mapping, detail, description)
+    return status_out
 
 def extend_cve_status(d):
     # do this only once in case multiple classes use this
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 0e9c6fa..539901f 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -470,7 +470,6 @@ def _get_cves_info(d):
     for cve_id in (d.getVarFlags("CVE_STATUS") or {}):
         mapping, detail, description = oe.cve_check.decode_cve_status(d, cve_id)
         if not mapping or not detail:
-            bb.warn(f"Skipping {cve_id} — missing or unknown CVE status")
             continue
         yield cve_id, mapping, detail, description
         patched_cves.discard(cve_id)
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 60cecd1..8cd5eb9 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -11,6 +11,54 @@ from oeqa.utils.commands import bitbake, get_bb_vars
 
 class CVECheck(OESelftestTestCase):
 
+    def test_scoped_status(self):
+        import bb
+        from oe.cve_check import decode_cve_status, extend_cve_status, get_patched_cves
+        from unittest.mock import patch
+
+        d = bb.data.init()
+        cve = "CVE-2020-0001"
+        d.setVarFlag("CVE_CHECK_STATUSMAP", "fixed-version", "Patched")
+        d.setVarFlag("CVE_CHECK_STATUSMAP", "ignored", "Ignored")
+        d.setVarFlag("CVE_STATUS", cve, "fixed-version: cpe:oracle:berkeley_db: Fixed: see upstream")
+        for product, expected in (
+            ("oracle:berkeley_db", ("Patched", "fixed-version", "Fixed: see upstream")),
+            ("other:berkeley_db", ("", "", "")),
+            ("oracle:zlib", ("", "", "")),
+            ("zlib:zlib oracle:berkeley_db", ("Patched", "fixed-version", "Fixed: see upstream")),
+        ):
+            with self.subTest(product=product):
+                d.setVar("CVE_PRODUCT", product)
+                self.assertEqual(decode_cve_status(d, cve), expected)
+                with patch("oe.patch.src_patches", return_value=[]):
+                    self.assertEqual(get_patched_cves(d), {cve} if expected[0] else set())
+
+        d.setVar("CVE_PRODUCT", "zlib")
+        d.setVarFlag("CVE_STATUS", cve, "ignored: Existing unscoped reason: unchanged")
+        self.assertEqual(decode_cve_status(d, cve),
+                         ("Ignored", "ignored", "Existing unscoped reason: unchanged"))
+        d.setVar("CVE_STATUS_GROUPS", "SCOPED_GROUP")
+        d.setVar("SCOPED_GROUP", cve)
+        d.setVarFlag("SCOPED_GROUP", "status", "ignored: cpe:*:zlib: Matching group")
+        extend_cve_status(d)
+        self.assertEqual(decode_cve_status(d, cve), ("Ignored", "ignored", "Matching group"))
+        d.setVar("CVE_PRODUCT", "glibc")
+        self.assertEqual(decode_cve_status(d, cve), ("", "", ""))
+
+    def test_scoped_status_spdx(self):
+        import bb
+        import oe.spdx30_tasks
+        from unittest.mock import patch
+
+        d = bb.data.init()
+        d.setVar("CVE_PRODUCT", "zlib:zlib")
+        d.setVarFlag("CVE_CHECK_STATUSMAP", "ignored", "Ignored")
+        d.setVarFlag("CVE_STATUS", "CVE-2020-0001", "ignored: cpe:*:berkeley_db: Not zlib")
+        d.setVarFlag("CVE_STATUS", "CVE-2020-0002", "ignored: cpe:*:zlib: Matches zlib")
+        with patch("oe.patch.src_patches", return_value=[]):
+            self.assertEqual(list(oe.spdx30_tasks._get_cves_info(d)),
+                             [("CVE-2020-0002", "Ignored", "ignored", "Matches zlib")])
+
     def test_version_compare(self):
         from oe.cve_check import Version
 
-- 
2.39.5

