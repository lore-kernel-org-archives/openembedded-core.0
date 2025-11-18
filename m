Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8376DCED632
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 12:09:00 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11026.1763467723892491630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 04:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KaojhO7x;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025111812084056c913d0d50002070c-evq1z9@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025111812084056c913d0d50002070c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 18 Nov 2025 13:08:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MOv0CJXlZGJs68jrqRIyy7De9PLmccGaREq/rkmj6wU=;
 b=KaojhO7xybsrN0tRX2adxdKI01UqRHk7OBME1nceAiAS1enokPrNDcmRRX0OD1KHAXdrZf
 3iLCJ/VEoMlZayJXhUpxMdHd+OWaK6+IoZd7o6UR6wS5fuCzIQHUZ9U454BlNL+6WfjlDowx
 zlfMnfuIQO/NxIXiHdOL7/u6eA2yruTWNj2mzeVS7Q+JjJv9CnQZpz0HL7xXDwZkTzlCMdch
 wN3if3QobAUCEAX/tzQDANxaq2KGJ4qcxeBohm6WET0GnjLE7Goi4a+DFR1QyAii9hI7JQa/
 8IZtlwAcVRYvYxbTfYMFxveH6H3Q/N2PDPzyMrEg5sCboQztdyMWIn2Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: kamel.bouhara@bootlin.com,
	jpewhacker@gmail.com,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] spdx30: fix cve status for patch files in VEX
Date: Tue, 18 Nov 2025 13:08:39 +0100
Message-Id: <20251118120839.603554-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226520

From: Peter Marko <peter.marko@siemens.com>

This commit fixes commit 08595b39b46ef2bf3a928d4528292ee31a990c98
which adapts vex creation between function create_spdx where all changes
were backported and funtion get_patched_cves where changes were not
backported.

CVE patches were previously ignored as they cannot be decoded from
CVE_STATUS variables and each caused a warning like:
WARNING: ncurses-native-6.4-r0 do_create_spdx: Skipping CVE-2023-50495 — missing or unknown CVE status

Master branch uses fix-file-included for CVE patches however since
cve-check-map.conf was not part of spdx-3.0 backport, closest one
available (backported-patch) was implemented.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 6b0aa137c4..8115088ab8 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -503,7 +503,13 @@ def create_spdx(d):
     if include_vex != "none":
         patched_cves = oe.cve_check.get_patched_cves(d)
         for cve_id in patched_cves:
-            mapping, detail, description = oe.cve_check.decode_cve_status(d, cve_id)
+            # decode_cve_status is decoding CVE_STATUS, so patch files need to be hardcoded
+            if cve_id in (d.getVarFlags("CVE_STATUS") or {}):
+                mapping, detail, description = oe.cve_check.decode_cve_status(d, cve_id)
+            else:
+                mapping = "Patched"
+                detail = "backported-patch"  # fix-file-included is not available in scarthgap
+                description = None
 
             if not mapping or not detail:
                 bb.warn(f"Skipping {cve_id} — missing or unknown CVE status")

