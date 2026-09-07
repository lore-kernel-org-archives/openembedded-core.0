Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7005C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 12:12:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33556.1788783122567003471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 05:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MKwR2jeB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E5BF31A1A33;
	Mon,  7 Sep 2026 12:12:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B3F5E60383;
	Mon,  7 Sep 2026 12:12:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC50811C7AF28;
	Mon,  7 Sep 2026 14:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788783119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vvoivmy+EOGbxUAqllN716+0+uqZmCvd5nKHKcW91wI=;
	b=MKwR2jeB3x5qGnJWVDHZPMEkaYUM+rNMwavQfVYJp5uguZ8o+1fW11hFbLoC8lj9p43UD+
	v0PZQLjPI+n3TWFwnCnnuWdMq9dGGMBIJwSg2ArokNQm4wuLr2Ev4L6xXbX/5oBfy+drK4
	zynNDCpZcltRWfNgOBfR6KaV1R6Zrjl2beNhXoa8BDpKt5bgHbrT6bXMmcocXMrCoFJGDo
	I11D0f4HvINC0YOTWvXfb7V4hBrC7UMKWFoGdTU2sXepxBLxuqwrkH8gcSkyCRO8Au2FVT
	fcIlb2JiffMVEsVGly3eEU2IniRxVps3KnuVDzZGxOPv+xrNl7MOdX+mRDfzNQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 07 Sep 2026 14:11:55 +0200
Subject: [PATCH 2/2] sbom-cve-check: enable offline mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-sbom-cve-check-update-1-3-4-v1-2-93034b6bd44c@bootlin.com>
References: <20260907-sbom-cve-check-update-1-3-4-v1-0-93034b6bd44c@bootlin.com>
In-Reply-To: <20260907-sbom-cve-check-update-1-3-4-v1-0-93034b6bd44c@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Peter.Marko@siemens.com, 
 olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 12:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245251

Since v1.3.4, `sbom-cve-check` includes a new `--offline-mode` flag that
raises an error if a git command requiring network access is executed.
Note that `--offline-mode` does not automatically enable
`--disable-auto-updates`, so both flags must be specified explicitly.

For example, with the `--offline-mode` flag, if the CVE database is not
already deployed, `sbom-cve-check` will not attempt to clone the git
database, it will generate an explicit error instead.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/classes/sbom-cve-check-common.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sbom-cve-check-common.bbclass
index 1bd1af22b6cb..7918cb25f2a7 100644
--- a/meta/classes/sbom-cve-check-common.bbclass
+++ b/meta/classes/sbom-cve-check-common.bbclass
@@ -102,6 +102,7 @@ def run_sbom_cve_check(d, sbom_path, export_base_name, export_link_name=None):
         "--sbom-path",
         sbom_path,
         "--disable-auto-updates",
+        "--offline-mode",
         "--export-process-native",
         scan_scope,
     ]

-- 
2.55.0


