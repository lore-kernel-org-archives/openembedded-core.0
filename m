Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B457C52D7D
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 04:09:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.38809.1723435763828641205
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 21:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RjF28rrN;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4280c55e488so22048115e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 21:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723435762; x=1724040562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zfpn1lzkdIrpnUgOfNfpW1eeZ8VLG42F21XFcG9t2AM=;
        b=RjF28rrNMbeQqSNZo4jr9VS35AzIFsSTz3N8eV5f0hTHe6DlU5w4MguDWiSJajqUdC
         jf1EHpCkUOKMUYh2fIU4Bpid7HHAPEz1cbFHooM6s6LMiqZR9oxFDQgxaJ383032i/5x
         g4razQn+wf5u+vhMevTYzwX0GbpXGK5zQeKTaT7f1Z19twhz2524s3wbcxQgvB5qrEzq
         Y0f9PMKJIloRBWN23KDcbKFFqlUDaqghEaICAqyj6ZKJ0TX0FUiW7xkfi9qk/D6Kg/q6
         u3VO7SkTRqV30t6omRXVA+azTLqDc7RF7LJJijU3AR1ggwri/MOXxFjMFQEqIdF4o6i9
         DZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723435762; x=1724040562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfpn1lzkdIrpnUgOfNfpW1eeZ8VLG42F21XFcG9t2AM=;
        b=N18rQH+cW3w97e2iUFiOMZL2iylox/te0zHG0kaZ5zNAYvTyjhlOLQESOKzKPOUeAR
         h1NF4N6DKbHcLdz9RkTDidQwTFNKXm0scVvKKPv1mQbgRT6kuODqb9giJ7tb8EkRHkT3
         kfAZFo+DPzpdG/0zyTk1vf5qGRp6dhmZBXXmlqUE9JOtRXjVXDq9/8Qy15G9BxbNgg/5
         hRGODgeAfRP1LqpC4JJlDPhTgGbAOpARfZbPSP+ssV/2Qw37fWeXrZhwt6NrB1gfr9fO
         N8qIj+5/tz9dwEe9D7IeyWRjYqNhKpUuOTyaFaOwODPLzvyHD8lLYCWXDVYRsKjTMVg9
         stpw==
X-Gm-Message-State: AOJu0YwtrL5Qt3ag+5/BVANcr9XDYWPHon9VxPnUlJg7wMJYNHBnWnFP
	/ADyRG0BfwPsDMUxz6ms1KWFeK+IEMIK/Vp+cbNk6YKPwa2vQHPkpA5psw==
X-Google-Smtp-Source: AGHT+IFwsw/stl//0taf7lB/z1rWHe4QhUHsEogExdS1JchRk30jFhtyXsNnV4mx5ry4WSEID0+ufw==
X-Received: by 2002:a05:600c:1d06:b0:426:63bc:f031 with SMTP id 5b1f17b1804b1-429c3abcc75mr57460305e9.1.1723435761171;
        Sun, 11 Aug 2024 21:09:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:76:4400:56c3:4c21:1a48:89b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c7bc8c3sm174144655e9.47.2024.08.11.21.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:09:20 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH v4][OE-core 1/6] cve-check: encode affected product/vendor in CVE_STATUS
Date: Mon, 12 Aug 2024 06:09:06 +0200
Message-ID: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 04:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203194

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
 meta/classes/cve-check.bbclass | 24 ++++++++++++------------
 meta/lib/oe/cve_check.py       | 34 ++++++++++++++++++++++++----------
 meta/lib/oe/spdx30_tasks.py    | 11 ++++++-----
 3 files changed, 42 insertions(+), 27 deletions(-)

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
index ed5c714cb8..26dfdc1a54 100644
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
 
@@ -227,19 +227,33 @@ def convert_cve_version(version):
 
 def decode_cve_status(d, cve):
     """
-    Convert CVE_STATUS into status, detail and description.
+    Convert CVE_STATUS into status, vendor, product, detail and description.
     """
     status = d.getVarFlag("CVE_STATUS", cve)
     if not status:
-        return ("", "", "")
-
-    status_split = status.split(':', 1)
-    detail = status_split[0]
-    description = status_split[1].strip() if (len(status_split) > 1) else ""
+        return {}
+
+    status_split = status.split(':', 5)
+    status_out = {}
+    status_out['detail'] = status_split[0]
+    if len(status_split) >= 4 and status_split[1].strip().startswith('cpe'):
+        # Both vendor and product are mandatory if cpe: present, the syntax is then:
+        # detail: cpe:vendor:product:description
+        status_out['vendor'] = status_split[2].strip() if (len(status_split) > 3) else "*"
+        status_out['product'] = status_split[3].strip() if (len(status_split) > 2) else "*"
+    elif len(status_split) >= 2 and status_split[1].strip().startswith('cpe'):
+        bb.warn('Invalid CPE information for CVE_STATUS[%s] = "%s", not setting CPE' % (detail, cve, status))
+        status_out['vendor'] = "*"
+        status_out['product'] = "*"
+    else:
+        status_out['vendor'] = "*"
+        status_out['product'] = "*"
+    status_out['description'] = status_split[len(status_split)-1].strip() if (len(status_split) > 1) else ""
 
-    status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
+    status_mapping = d.getVarFlag("CVE_CHECK_STATUSMAP", status_out['detail'])
     if status_mapping is None:
         bb.warn('Invalid detail "%s" for CVE_STATUS[%s] = "%s", fallback to Unpatched' % (detail, cve, status))
         status_mapping = "Unpatched"
+    status_out['mapping'] = status_mapping
 
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


