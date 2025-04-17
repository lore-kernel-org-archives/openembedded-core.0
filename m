Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93ADC369CA
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 09:35:26 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.4782.1744882515907368505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 02:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JjpYL5KC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202504170935112c5240dd1c4a4b5168-uxfkxo@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202504170935112c5240dd1c4a4b5168
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Apr 2025 11:35:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oYqZZTvAYaOnLZMmYWqA4fZEkScgYBG1nhW9tmuieAU=;
 b=JjpYL5KCq1vtp3iiV12HG+bRfPpE168j+88UeTXs864b66wwPPqTg1HjZ0+r9Fh/JugogQ
 /eaSvdwn9yKChZmKNSpBIn+EqQe/Llfr8/YtnBNpYwl9c4CPxQEp37x8AuUQ9pBva6rlsZe6
 Q5dhAFVFpkHSHGwuhbR6MjpcN1eyfnYPGvJ3MBBOCypXjXa57ioVj25pNg/PL8nA/S97zxJg
 LR73BsiPVz+VwQaN3sK5CMtlCVpCHe4xQXoAVrpHXx99k9gMHqySJtAhdic8WSC2+n8gCtcg
 43vC4I7O189PTqEz3rHediHXEDbNaX4YzXLgb7ciP/a/ANUY4MGrzSIQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] cve-check: extract extending CVE_STATUS to library function
Date: Thu, 17 Apr 2025 11:34:56 +0200
Message-Id: <20250417093457.2091799-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 09:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215047

From: Peter Marko <peter.marko@siemens.com>

The same code for extending CVE_STATUS by CVE_CHECK_IGNORE and
CVE_STATUS_GROUPS is used on multiple places.
Create a library funtion to have the code on single place and ready for
reuse by additional classes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass | 17 ++---------------
 meta/classes/vex.bbclass       | 17 ++---------------
 meta/lib/oe/cve_check.py       | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 555fdaad77..1aef00d297 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -104,21 +104,8 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
 CVE_VERSION_SUFFIX ??= ""
 
 python () {
-    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
-    cve_check_ignore = d.getVar("CVE_CHECK_IGNORE")
-    if cve_check_ignore:
-        bb.warn("CVE_CHECK_IGNORE is deprecated in favor of CVE_STATUS")
-        for cve in (d.getVar("CVE_CHECK_IGNORE") or "").split():
-            d.setVarFlag("CVE_STATUS", cve, "ignored")
-
-    # Process CVE_STATUS_GROUPS to set multiple statuses and optional detail or description at once
-    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split():
-        cve_group = d.getVar(cve_status_group)
-        if cve_group is not None:
-            for cve in cve_group.split():
-                d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_group, "status"))
-        else:
-            bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" % cve_status_group)
+    from oe.cve_check import extend_cve_status
+    extend_cve_status(d)
 
     nvd_database_type = d.getVar("NVD_DB_VERSION")
     if nvd_database_type not in ("NVD1", "NVD2", "FKIE"):
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 01d4e52051..905d67b47d 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -76,21 +76,8 @@ python () {
     if bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skipping recipe: found incompatible combination of cve-check and vex enabled at the same time.")
 
-    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
-    cve_check_ignore = d.getVar("CVE_CHECK_IGNORE")
-    if cve_check_ignore:
-        bb.warn("CVE_CHECK_IGNORE is deprecated in favor of CVE_STATUS")
-        for cve in (d.getVar("CVE_CHECK_IGNORE") or "").split():
-            d.setVarFlag("CVE_STATUS", cve, "ignored")
-
-    # Process CVE_STATUS_GROUPS to set multiple statuses and optional detail or description at once
-    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split():
-        cve_group = d.getVar(cve_status_group)
-        if cve_group is not None:
-            for cve in cve_group.split():
-                d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_group, "status"))
-        else:
-            bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" % cve_status_group)
+    from oe.cve_check import extend_cve_status
+    extend_cve_status(d)
 }
 
 def generate_json_report(d, out_path, link_path):
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 5ace3cf553..ae194f27cf 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -354,3 +354,25 @@ def has_cve_product_match(detailed_status, products):
 
     #if no match, return False
     return False
+
+def extend_cve_status(d):
+    # do this only once in case multiple classes use this
+    if d.getVar("CVE_STATUS_EXTENDED"):
+        return
+    d.setVar("CVE_STATUS_EXTENDED", "1")
+
+    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
+    cve_check_ignore = d.getVar("CVE_CHECK_IGNORE")
+    if cve_check_ignore:
+        bb.warn("CVE_CHECK_IGNORE is deprecated in favor of CVE_STATUS")
+        for cve in (d.getVar("CVE_CHECK_IGNORE") or "").split():
+            d.setVarFlag("CVE_STATUS", cve, "ignored")
+
+    # Process CVE_STATUS_GROUPS to set multiple statuses and optional detail or description at once
+    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split():
+        cve_group = d.getVar(cve_status_group)
+        if cve_group is not None:
+            for cve in cve_group.split():
+                d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_group, "status"))
+        else:
+            bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" % cve_status_group)

