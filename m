Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6905FEEF57
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 15:01:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83418.1775574077073210985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 08:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=02eb2AtQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1558D4E42947;
	Tue,  7 Apr 2026 15:01:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0279603C7;
	Tue,  7 Apr 2026 15:01:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E546D1045021F;
	Tue,  7 Apr 2026 17:01:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775574070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=g2mI42CmDlePd2bwzYmgd8QR32zx4OUfg5nVDt8FMYw=;
	b=02eb2AtQfXR9FmiyWpjWs1tqKKXpSSaA+bzvYDOphlm7hMKLot13G//kAc57NQxAMsbNSq
	q5O1IUUP2EWBpYX8Q7ITBG+RvWeeF0B4cwG9lNxzakUdq9w+Ea5UoUXoO+3D7ngu8uAAv/
	PF8oaxKMPkGEu2tJjKRIc22/La54rFB+fyRWcfUjXv3g7gk73SkhiDYyYTBdCG6Ea9kuRa
	PdBlPW7KWMZxmApMjxSHctZnDfQLE1HZxnqCe6bkpL9l+8+0xM1vVbXRAHlgQ/7+giWTWl
	FAkOqvUuuDFpGK+XUScgcHAtXbkPUD77yFtackD2+AYp/jOL1vcKR6pI1Y7Dng==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH v2 0/2] sbom-cve-check-update-db: Fix various failures
Date: Tue, 07 Apr 2026 17:01:06 +0200
Message-Id: <20260407-fix-lic-sbom-cve-check-v2-0-f69da412fd67@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6dgytFakr72FY0HaQUWhNi42Gc
 HcLHsDlS95/f2YRA2Fk52JmARNF8i6D2BXM9K27IZDNzEQpqlKWHDp6w0AGovYjmIRgejQPqJS
 tZGuVVFqyPH4GzOYWvjY/ji99RzOttdXoKU4+fLbnxFfv70niwEGorj5Ky+vDqbto76eB3N74k
 TXLsnwBFIW6RdAAAAA=
X-Change-ID: 20260401-fix-lic-sbom-cve-check-69d64ad949b4
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rybczynska@gmail.com, 
 ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 15:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234744

This series addresses 2 failures that were not discovered before:
 - The `do_populate_lic` task was failing.
 - The `do_unpack` may fail or remove other CVE databases.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Changes in v2:
- Add another fix related to unpacking the databases
- Link to v1: https://patch.msgid.link/20260401-fix-lic-sbom-cve-check-v1-1-29f854d1837f@bootlin.com

---
Benjamin Robin (2):
      sbom-cve-check-update-db: Fix do_populate_lic failure
      sbom-cve-check-update-db: Fix unpack removing other databases

 meta/classes-recipe/sbom-cve-check.bbclass                            | 4 ++--
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb            | 2 +-
 meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc     | 4 +---
 .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb                | 4 ++--
 4 files changed, 6 insertions(+), 8 deletions(-)
---
base-commit: e954a94b5b528b2430e8da331107d7d58287f89b
change-id: 20260401-fix-lic-sbom-cve-check-69d64ad949b4

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


