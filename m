Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A05E81BDF
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 16:26:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51319.1770654357822270955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 08:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OzPEmBGs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B093F1A078C
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 16:25:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 867316068A;
	Mon,  9 Feb 2026 16:25:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE36E119D22E0;
	Mon,  9 Feb 2026 17:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770654355; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=EBT39jG/5A6AmOJXX+GG9yGcHB+zek3Rqa+B35/ARko=;
	b=OzPEmBGsFPLM+rdoYfHeP6x5h31vBeRhz7vtyw4QHb3nF310ogwYf4Les2y2NTYZqP4L80
	/uZgwXKnMqVVkpDrJcieOT2MQNZVykU/dPzcmsG5KAPKEsX5IvrkgyhF9Tf6RmU7iVExR1
	8QAeiURtME6f4h4lI4Ndcu1PZ6c1gAjFcTDwnGH0dGHCBoJP8cQMN0ScKOPqr01rbUePBc
	gdLUClCg/QTnW8L19QnKLg0UewxlYocfCjoTAwxjlNa9WpdJ2IjnuFscBfXP8K6zB88BJr
	leJ1NS+Y/hTlBW2e6yXbtCrjYoM9E5ayvY8qUrheZ6B4QEZyKfP0G2KfJOA9uA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 09 Feb 2026 17:25:52 +0100
Subject: [PATCH] spdx30_tasks: Exclude 'doc' when exporting PACKAGECONFIG
 to SPDX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-fix-packageconfig-export-to-spdx-v1-1-b8ddcdf184b0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqAIBAAvxJ7bkElivpKdFh0syVQ0Qgh+nvSc
 Q4z80DhLFxg6R7IfEuRGBrovgN7UPCM4hqDUWZURs24S8VE9iTPNoZdPHJNMV94RSzJVdQzuZG
 mwSrS0DIpc3P+xbq97wdyUCG+cgAAAA==
X-Change-ID: 20260209-fix-packageconfig-export-to-spdx-19ad6a74c0a1
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, kamel.bouhara@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 16:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230810

Currently when generating an SBOM, all packages have the 'doc' feature
indicated as disabled. This is in fact *not* a feature that was
declared in the recipe, but instead the documentation of the
PACKAGECONFIG variable.

But to be safe, if somehow a feature is named 'doc' and enabled, do
not exclude it when exporting PACKAGECONFIG features to SPDX.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx30_tasks.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 01e7dcbbc686..3515ccd4493d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -824,12 +824,14 @@ def create_spdx(d):
 
     if d.getVar("SPDX_INCLUDE_PACKAGECONFIG", True) != "0":
         packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
-        all_features = (d.getVarFlags("PACKAGECONFIG") or {}).keys()
+        all_features = set((d.getVarFlags("PACKAGECONFIG") or {}).keys())
+        blacklisted_features = {"doc"}
 
         if all_features:
             enabled = set(packageconfig)
-            all_features_set = set(all_features)
-            disabled = all_features_set - enabled
+            disabled = all_features - enabled
+            all_features -= disabled & blacklisted_features
+            disabled -= blacklisted_features
 
             for feature in sorted(all_features):
                 status = "enabled" if feature in enabled else "disabled"

---
base-commit: 6ce19709f7835ee5cd7915e181f89397975236c8
change-id: 20260209-fix-packageconfig-export-to-spdx-19ad6a74c0a1

Best regards,
-- 
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


