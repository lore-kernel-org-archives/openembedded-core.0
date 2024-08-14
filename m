Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957DFC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 05:30:58 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.91314.1723613454004368184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 22:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XuiHO3tH;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso45689615e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 22:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723613452; x=1724218252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KFhfJ14UFDZvHCsUjlN1yHS763nC7iRZetfFfaKxCa0=;
        b=XuiHO3tHDVrAlmTvkLl7IztTwkEoGoBimJKwyjtDIi/S7Oqd8gKt66h+XZ1ZsfKLDt
         UFukuDGWxXxaMxD7bnrv7isEASf2T5Q3rSMe+QN+hOO65xml2JOauk3yZJsUDW00tPAc
         rofTKDFF78BLBhboEi+UTDygTS7YLhzXPaNJKTtgyeIAJKw/dXIxwK3XpGkiwhKuEDvl
         RQBHsxQszNv27/IeZNGYEMPq04fVDTzyqks0jtkHkcDue6YB/hxNFmWPrgD/sLW4Uvyw
         e1UQZInEMm5QySbnRMIdcnxj9IlR2MjyAtCPqi2XriQt5FhlboebSWlu59cH14UhDMZK
         sJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723613452; x=1724218252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFhfJ14UFDZvHCsUjlN1yHS763nC7iRZetfFfaKxCa0=;
        b=MLz9KNXPM1/OTGuunSznuyyxxbMtP71HPECuUbM2Smk+f4mBweKbhAz5jaZBE5KoIE
         2iKAZ2xXz1XnRS73kkydXKTUuzv559PYaqJjznKcTa3A+y8A4fdRVCGsA8yRnHMFOamn
         aZnBhqDAMK1lPFrM09+nEdwv/KBBQJhcMa2Oe55TJDQP713rjl64ID4dlpcN3Y25CaKm
         K/6sUFGYGAR+RpuwXwEpFlUFjmvJDK+QScQb5Ks+aBAv0ZN/BCa0MHR8q7BZCRCliKUL
         YtFwipOIpaLlqslFFYs5brMBUm2UmwFwBiD4tDC9/m4hEnHhcsJucP/1/ZnKbvh+e5XO
         IAnA==
X-Gm-Message-State: AOJu0YypKvWO769JSQacU6bEqkCTrB7VxALQfpP2sbeiJzw+JJ5IRNU7
	7Nt7LNZUFZtvyCy7Iqc5Knnq4pDKu0Fw3TG/oiJnMdP9D6r3TM4mGl2NoQ==
X-Google-Smtp-Source: AGHT+IGFyNbEepvdoLnrzo6lNSwT8sEgmugxa4ORHiJu06UrgwnU2LEk6jaFR1Jwftce0Uf3i1r28Q==
X-Received: by 2002:a05:600c:3501:b0:426:6388:d59f with SMTP id 5b1f17b1804b1-429dd232bedmr10002425e9.1.1723613451243;
        Tue, 13 Aug 2024 22:30:51 -0700 (PDT)
Received: from voyage.lan ([2a0d:3344:2311:d410:8c63:2ebf:4fe1:9568])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded4db0bsm8885525e9.32.2024.08.13.22.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 22:30:50 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH v5][OE-core 1/7] cve-check: encode affected product/vendor in CVE_STATUS
Date: Wed, 14 Aug 2024 07:30:35 +0200
Message-ID: <20240814053041.4991-1-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203302

CVE_STATUS contains assesment of a given CVE, but until now it didn't have
include the affected vendor/product. In the case of a global system include,
that CVE_STATUS was visible in all recipes.

This patch allows encoding of affected product/vendor to each CVE_STATUS
assessment, also for groups. We can then filter them later and use only
CVEs that correspond to the recipe.

This is going to be used in meta/conf/distro/include/cve-extra-exclusions.inc
and similar places.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 meta/classes/cve-check.bbclass | 24 ++++++++++-----------
 meta/lib/oe/cve_check.py       | 39 ++++++++++++++++++++++++++--------
 meta/lib/oe/spdx30_tasks.py    | 11 +++++-----
 3 files changed, 48 insertions(+), 26 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c946de29a4..bc35a1c53c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -324,8 +324,8 @@ def check_cves(d, patched_cves):
     # Convert CVE_STATUS into ignored CVEs and check validity
     cve_ignore = []
     for cve in (d.getVarFlags("CVE_STATUS") or {}):
-        decoded_status, _, _ = decode_cve_status(d, cve)
-        if decoded_status == "Ignored":
+        decoded_status = decode_cve_status(d, cve)
+        if 'mapping' in decoded_status and decoded_status['mapping'] == "Ignored":
             cve_ignore.append(cve)
 
     import sqlite3
@@ -507,11 +507,11 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
         write_string += "CVE STATUS: %s\n" % status
-        _, detail, description = decode_cve_status(d, cve)
-        if detail:
-            write_string += "CVE DETAIL: %s\n" % detail
-        if description:
-            write_string += "CVE DESCRIPTION: %s\n" % description
+        status_details = decode_cve_status(d, cve)
+        if 'detail' in status_details:
+            write_string += "CVE DETAIL: %s\n" % status_details['detail']
+        if 'description' in status_details:
+            write_string += "CVE DESCRIPTION: %s\n" % status_details['description']
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
         write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
@@ -637,11 +637,11 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
             "status" : status,
             "link": issue_link
         }
-        _, detail, description = decode_cve_status(d, cve)
-        if detail:
-            cve_item["detail"] = detail
-        if description:
-            cve_item["description"] = description
+        status_details = decode_cve_status(d, cve)
+        if 'detail' in status_details:
+            cve_item["detail"] = status_details['detail']
+        if 'description' in status_details:
+            cve_item["description"] = status_details['description']
         cve_list.append(cve_item)
 
     package_data["issue"] = cve_list
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index ed5c714cb8..5edd34a2d9 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -132,8 +132,8 @@ def get_patched_cves(d):
 
     # Search for additional patched CVEs
     for cve in (d.getVarFlags("CVE_STATUS") or {}):
-        decoded_status, _, _ = decode_cve_status(d, cve)
-        if decoded_status == "Patched":
+        decoded_status = decode_cve_status(d, cve)
+        if 'mapping' in decoded_status and decoded_status['mapping'] == "Patched":
             bb.debug(2, "CVE %s is additionally patched" % cve)
             patched_cves.add(cve)
 
@@ -227,19 +227,40 @@ def convert_cve_version(version):
 
 def decode_cve_status(d, cve):
     """
-    Convert CVE_STATUS into status, detail and description.
+    Convert CVE_STATUS into status, vendor, product, detail and description.
     """
     status = d.getVarFlag("CVE_STATUS", cve)
     if not status:
-        return ("", "", "")
+        return {}
+
+    status_split = status.split(':', 5)
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
+        bb.warn('Invalid CPE information for CVE_STATUS[%s] = "%s", not setting CPE' % (detail, cve, status))
+    else:
+        # Other case: no CPE, the syntax is then:
+        # detail: description
+        description = status_split[len(status_split)-1].strip() if (len(status_split) > 1) else ""
 
-    status_split = status.split(':', 1)
-    detail = status_split[0]
-    description = status_split[1].strip() if (len(status_split) > 1) else ""
+    status_out["vendor"] = vendor
+    status_out["product"] = product
+    status_out["description"] = description
 
-    status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
+    status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", status_out['detail'])
     if status_mapping is None:
         bb.warn('Invalid detail "%s" for CVE_STATUS[%s] = "%s", fallback to Unpatched' % (detail, cve, status))
         status_mapping = "Unpatched"
+    status_out["mapping"] = status_mapping
 
-    return (status_mapping, detail, description)
+    return status_out
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 03dc47db02..4864d6252a 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -488,21 +488,22 @@ def create_spdx(d):
     cve_by_status = {}
     if include_vex != "none":
         for cve in d.getVarFlags("CVE_STATUS") or {}:
-            status, detail, description = oe.cve_check.decode_cve_status(d, cve)
+            decoded_status = oe.cve_check.decode_cve_status(d, cve)
 
             # If this CVE is fixed upstream, skip it unless all CVEs are
             # specified.
-            if include_vex != "all" and detail in (
+            if include_vex != "all" and 'detail' in decoded_status and \
+                decoded_status['detail'] in (
                 "fixed-version",
                 "cpe-stable-backport",
             ):
                 bb.debug(1, "Skipping %s since it is already fixed upstream" % cve)
                 continue
 
-            cve_by_status.setdefault(status, {})[cve] = (
+            cve_by_status.setdefault(decoded_status['mapping'], {})[cve] = (
                 build_objset.new_cve_vuln(cve),
-                detail,
-                description,
+                decoded_status['detail'],
+                decoded_status['description'],
             )
 
     cpe_ids = oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"))
-- 
2.43.0


