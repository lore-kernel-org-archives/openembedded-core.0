Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C68C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 06:24:03 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.78438.1723184634136671233
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 23:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NUoyAI8E;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-36844375001so788951f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 23:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723184632; x=1723789432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vMVOWK0Ob8vW8q0xic+tuk4FsVtwxj8oBsCXe+xeZVs=;
        b=NUoyAI8E7juEJXk/ugomNAUGAZGI6Opya9kpBOmUM68CfZJYkdHQ+isFubSnhsCQFD
         0YMTexxMCl/L556QKse2LDB4BGQG8O8sr0hyV5nCinoTu4+IWLmj8Pbl+52U10XYzkdf
         /QTts1a7xw9PG9kM2fjQwG/qWQwiAi+Ov3FbcuL0YGxsY+TMNsQ+9nEHjyRUpXxjUMse
         m5s9XQKcUF+gG3+upEQ1urq9e2l/lT05hrstOGcr1gGhexyNFsRsT95MShBll7uUtSyR
         KBA8ROHStFhvSpP6mliRp19zrEpvv/EI5eL9XkFd2DitusK++dmefvzxjCcu+HLQLZoA
         ZCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723184632; x=1723789432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMVOWK0Ob8vW8q0xic+tuk4FsVtwxj8oBsCXe+xeZVs=;
        b=ilXpi0aHe3/CRt9TIAJ211IbWfO7R1vNvLoBG9MUuazNc6e4LdMfVdIA6OB6MZjVL8
         TgCOKwDeWfRqViAQPSG/8bRKKTFZFjcgaWcvyn4wa5+NEUeBzl+7UT4obxRN3bo5t1jj
         V5VenurSWV9G31MxZwPA8th7s+JF2pHEx95R1D1ehXXd+nfFGca1FycTCOXdDP80+oHP
         UscqIuRIjBLzTADLWubye8451wvRH1UT3ym872jIcDvG6lA90qatlcPrnEizgrduQvgQ
         MPNRurAPRSy7jGE/wkeSrgcttW5JAB7T7lAUyxyLp69us0LKj1ye/OdZE8gvJQ+sTIFQ
         vtuQ==
X-Gm-Message-State: AOJu0YxflFrcgJQt5Hw90N64xyu++5RfbPsxAQira+Yrl+nVFC6upXuf
	onG0jy0q9oqyev2HEt60bSSAA9S4tfsxfr6rgTUc3qnJSAUW4tMwiFJNCw==
X-Google-Smtp-Source: AGHT+IG5GRvvO8wrJ96y8eZnJg/NkeYG+Mer/ZI04w2oNLfQyq5M6gqSB+VEH4RtdB5Ruzybp6E+lw==
X-Received: by 2002:a05:6000:1003:b0:368:74c0:6721 with SMTP id ffacd0b85a97d-36d6006485fmr400094f8f.38.1723184631397;
        Thu, 08 Aug 2024 23:23:51 -0700 (PDT)
Received: from localhost.localdomain ([2a04:cec0:1117:4fa6:ec:4387:cc6f:ef67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27157347sm4291782f8f.2.2024.08.08.23.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 23:23:50 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [RFC][PATCH 1/2] cve-check: encode affected product/vendor in CVE_STATUS
Date: Fri,  9 Aug 2024 08:23:38 +0200
Message-ID: <20240809062339.15465-1-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 06:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203151

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
 meta/lib/oe/cve_check.py       | 22 +++++++++++++---------
 meta/lib/oe/spdx30_tasks.py    | 11 ++++++-----
 3 files changed, 31 insertions(+), 26 deletions(-)

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
index ed5c714cb8..f71fdc672c 100644
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
 
@@ -227,19 +227,23 @@ def convert_cve_version(version):
 
 def decode_cve_status(d, cve):
     """
-    Convert CVE_STATUS into status, detail and description.
+    Convert CVE_STATUS into status, vendor, product, detail and description.
     """
     status = d.getVarFlag("CVE_STATUS", cve)
     if not status:
-        return ("", "", "")
+        return {}
 
-    status_split = status.split(':', 1)
-    detail = status_split[0]
-    description = status_split[1].strip() if (len(status_split) > 1) else ""
+    status_split = status.split(':', 3)
+    status_out = {}
+    status_out['detail'] = status_split[0]
+    status_out['vendor'] = status_split[1].strip() if (len(status_split) > 3) else "*"
+    status_out['product'] = status_split[len(status_split)-2].strip() if (len(status_split) > 2) else "*"
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
index 9d5bbadc0f..fd80713234 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -486,21 +486,22 @@ def create_spdx(d):
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


