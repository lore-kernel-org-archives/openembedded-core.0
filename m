Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D186D0EE39
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:59:10 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4282.1764104344015406052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PqvoNsal;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so5632969b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104343; x=1764709143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8JYDIKS1OfC4RX3gjy4wwAnmgWYmfS/Etae2tgQXFQ=;
        b=PqvoNsalyiXX8tGEusNJsAEJWC0zFTIBLuOIbMRbvYuxj4mUP5o97fhEEIk/4Ueyt/
         RhFUb/iQTtWiQBHONN8Wk6biaujtKN6JVoR4D7YbLzZXm7GJgqz78oe81P5xAiT3336o
         GNLjsmGdbTzLaFr3M+o+rnTnWr+hFAH8CLXo1wHQ4opbC5wXnD9otAkkP8UKE3JI0z0f
         tkaclcK7oMp4Kn4R+rHvsTpYz92veS1qYRGR5dMblZF1ndHLiN9tNqOOVlcdSMUutBQJ
         4QtMunwAO0PuDoT3vRtzfJ+L+bS/dVbrbL2L/GuFqKsY/lbiskqL2CogMA9x4fAtXQCe
         oKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104343; x=1764709143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l8JYDIKS1OfC4RX3gjy4wwAnmgWYmfS/Etae2tgQXFQ=;
        b=cu3IMnbHECvF8nKx8zLkJTGZp1t9mq9oSYuwx0J+EowsHgAlFur+YptIUNiJXHvb1A
         R2sxWSvLmxY7IVfhBSwJDzvYnOQB3KRcG3O1VsuMHmYFQcp76OR5xG2ULnw7xmtjeCwb
         jW05K5vS7bz02AFr1g6tn1iKun/92Q3NMWu7PbiU0cvviSygX4PJEAJvlts1kztG84QF
         P//UA9lK/n8QSPM0w4q/GDnrt1w4LByZiB92Y+SaQ8pJu/EJKMyvhhYs9AURwvR9sDCb
         2M2VMMBwAajjHf9eDtb5DDcaGeiAvpbDWsR63REFaK6xz3+tqsOV/t+7L96+110zFhnA
         mApA==
X-Gm-Message-State: AOJu0YwobFPk2luQnCl+wquFaf3KtGW3JlNCurMCTdFOowCOEZ/zONsi
	Wls9U4d/Sa6c3xJdC9UdtftXipIYxjSt7vH2UGhSrVwCTuLeVItYNN9axvpbH8pO0RdzLWKLTMi
	t9SsW
X-Gm-Gg: ASbGnctf72SiW/6tnLO+193lAEUR7dkgcFiFqPkis1jQlKZ0n65fFX8eZYpDfS/COxm
	BexOi0Kdrpr+SJDChYlELRdv3eH54oCFe/YiDAC5hvPZg2vERJb1nkOAPslcsR6NAx0H5yL1D8J
	Ee1b3OBbQYOLRBQ0BbAZj+se0TFbG5M0RmMXk1l00cprTGyPz9tMpAUnEBqsUvnxbMbn29XcFS9
	DvqyA2dMZMPmE/Xjj4Mrhbkc23X4Gpy678TZDaRfaBmdCm223/Gt9cGfsesNByY37pfTUttWsNw
	bwn/uIqxfFNcTEA4vau0myheyu+MDFVlSOCm+NGEBFmciRIdkrAwnNQAV7Q2gmZXLVDfYy5qKYf
	aP8n4B+QgGpK2r9WhIWCg+jgHI2dotEE1jbrRngWL0PueWGR8NdaSOrsM2MF21J08cNmAPQ2P9y
	9lfg==
X-Google-Smtp-Source: AGHT+IG6ieu/RddaDlK/oua28UsPwezlQ+eAH9McaLgp0RhHxIZlV2Yy174azrxwwZSXVodNjUX6sw==
X-Received: by 2002:a05:6a21:339b:b0:35b:c903:1db3 with SMTP id adf61e73a8af0-36150e2b548mr20619043637.6.1764104343232;
        Tue, 25 Nov 2025 12:59:03 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm17340755a12.4.2025.11.25.12.59.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:59:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/9] cve-check: extract extending CVE_STATUS to library function
Date: Tue, 25 Nov 2025 12:58:42 -0800
Message-ID: <ddd295c7d4c313fbbb24f7a5e633d4adfea4054a.1764104199.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764104199.git.steve@sakoman.com>
References: <cover.1764104199.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226789

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

The same code for extending CVE_STATUS by CVE_CHECK_IGNORE and
CVE_STATUS_GROUPS is used on multiple places.
Create a library function to have the code on single place and ready for
reuse by additional classes.

Conflicts:
  meta/classes/cve-check.bbclass
  meta/lib/oe/cve_check.py

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45e18f4270d084d81c21b1e5a4a601ce975d8a77)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 17 ++---------------
 meta/classes/vex.bbclass       | 17 ++---------------
 meta/lib/oe/cve_check.py       | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index d08c6ac670..f5bbaa5d15 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -107,21 +107,8 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
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
 }
 
 def generate_json_report(d, out_path, link_path):
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 73dd9338a1..c447b37db8 100644
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
index ed5c714cb8..7c09b78242 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -243,3 +243,25 @@ def decode_cve_status(d, cve):
         status_mapping = "Unpatched"
 
     return (status_mapping, detail, description)
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
-- 
2.43.0


