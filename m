Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F78EDA69D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 16:46:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23069.1772556401905617434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 08:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tSkW1u5e;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B3B9B4E42502;
	Tue,  3 Mar 2026 16:46:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A2CF5FF29;
	Tue,  3 Mar 2026 16:46:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FB851036974F;
	Tue,  3 Mar 2026 17:46:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772556398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5TvHB6PsXR2S1KkpGaCtxhDg2G+CDaAudd9jsJ0Vq6E=;
	b=tSkW1u5ekXt5Tkqv6p+d81FrzwfQ5mI2XuUB4kLLP53gm9Z1vcrCF0skIzLjMYqki8GSoX
	peS/lQdfro2urPO6e50axws1KG5O0oXdhz6T2IA0Yf7zkbAa3vyPHE4SlK3MLYNsBYE8c3
	hoJHnP7oiDg5rI9eeqQvndzvKPvo8YsNXmPR72FJMmj7tbgmdyVfNk3s/b0WIDbS/ZOWMS
	XCHdrZabgIOa4SEjzQi9eqFzuJ5A9FUaZOpehB0QrMCEcflbKl6c2Gz/cyzMmFPJVVVxk3
	BHfGl4JtCyIBOU2hKNzO7hfDLZdVGM8CUcjF7lLmMGC5po+5+5CdISRjrwTouQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [PATCH scarthgap 0/3] meta: Backport rejected CVEs and SPDX3 fixes
Date: Tue, 03 Mar 2026 17:46:14 +0100
Message-Id: <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z3LTQqDQAxA4atI1g3EH0rpVUoXcSYzhoIOiRRBv
 LuDC5cPvreDi6k4vJsdTP7qusw12kcDYeI5C2qsDR11T+qpx5HDryy2YtJNHD2wrVPmguEVh3Y
 giYkJ6l5MLlLvD9wMvsdxAl48mKp1AAAA
X-Change-ID: 20260303-backport-fixes-scarthgap-c8d4140edfa0
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, richard.purdie@linuxfoundation.org, 
 JPEWhacker@gmail.com, thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 Ross Burton <ross.burton@arm.com>, 
 =?utf-8?q?David_Nystr=C3=B6m?= <david.nystrom@est.tech>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 16:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232325

This series backports three patches from `master` to `Scarthgap`.

Removed references to rejected CVEs:
 - Removed references to `CVE-2025-62813` and `CVE-2021-3502` in patch
   files, as these CVEs have been rejected.
 - This change prevents rejected CVE references from appearing in the
   generated SBOM.

Fixed kernel `CONFIG_` generation in SPDX3:
 - Backported a fix for the generation of kernel `CONFIG_` values in
   SPDX3 output.
 - This is a important fix, as the generated SBOM file might otherwise
   randomly omit kernel `CONFIG_` values.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Benjamin Robin (Schneider Electric) (3):
      avahi: Remove a reference to the rejected CVE-2021-36217
      lz4: Remove a reference to the rejected CVE-2025-62813
      meta: fix generation of kernel CONFIG_ in SPDX3

 meta/classes-recipe/kernel.bbclass                 | 27 ++++++++++++----------
 meta/lib/oeqa/selftest/cases/spdx.py               |  2 +-
 .../avahi/files/local-ping.patch                   |  1 -
 ...5-62813.patch => fix-null-error-handling.patch} |  1 -
 meta/recipes-support/lz4/lz4_1.9.4.bb              |  2 +-
 5 files changed, 17 insertions(+), 16 deletions(-)
---
base-commit: a9a785d7fa0cfe2a9087dbcde0ef9f0d2a441375
change-id: 20260303-backport-fixes-scarthgap-c8d4140edfa0

Best regards,
-- 
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


