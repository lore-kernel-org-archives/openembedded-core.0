Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611E5EFCD9C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 11:57:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12488.1773057415144333667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 04:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lR/iUN/H;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2459F4E425DC;
	Mon,  9 Mar 2026 11:56:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D87515FFB8;
	Mon,  9 Mar 2026 11:56:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E572810369A00;
	Mon,  9 Mar 2026 12:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773057412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=UKyspcoGJfDYnp28KFDjSaRiR+5AtAZ/sG4Ek9cH91I=;
	b=lR/iUN/Hn2x3Fet0PjkjbarOxoef2RCBh2dlQ5MBwUe6YJjnsSCHZZ7Rv/286NjqsIkkFB
	nUb+nCeOpPto3LqgSeSicqtMI5o1dVVXbyTq+0mU4nG0BP4eNaJIVyzWTwMSugPJhaYuQX
	tIo4JaAfIK9AL2rpPuwrZA9PuGaUf9XHP8Rwa8TbgUtdDpu/oQBNWJ1gZb7EjrxAfsX1xl
	NxcuhZDKHvbD/mNGtCx+Kau9HcPMBTN6foiiXuoR0ZDNuk9zhURGh1SjJfolxjmeUkPqIL
	+IkB3/157FOCKyAdSG1P2cPpxVZH5xPDpyF63DPPFoYMvg+zF+iXDVzeCrS5bw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH RFC 0/2] sbom-cve-check: Improve class implementation and
 dependencies
Date: Mon, 09 Mar 2026 12:56:41 +0100
Message-Id: <20260309-add-sbom-cve-check-p2-v1-0-72a0771e1f12@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBswBaO2QQdoGy1KxxqiHxQkk
 O6etPwW7yUI5JkCtEUCT5EDX2dGVRZgtvlcCdlmgxRSCyVqnK3FsFwHmkhoNjI73hKVrXQjlHS
 LVpDb25Pj5/+OMPQdTO/7AamgfYhsAAAA
X-Change-ID: 20260307-add-sbom-cve-check-p2-3d169032fb63
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 11:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232697

This series is an RFC and a follow-up to patch 6/6 ("Add class for
post-build CVE analysis"), which was previously discussed [1].
I have prepared two RFC series, this one and another, each exploring
different approaches to handling the download of CVE databases.

I explored using BitBake's internal fetcher instead of direct Git calls
for fetching CVE databases. However, I encountered two major issues:

- No proper shallow clone support: I wanted to clone the repository
  without downloading the entire history (which is very large). While
  `BB_GIT_SHALLOW` exists, it creates multiple tarballs in the download
  directory, which is inefficient for updates.

- Performance overhead for CVE databases deployment: The recipes
  downloading CVE databases must copy them to the sysroot or to the
  deploy directory. This requires copying the extracted databases
  multiple times, even with hard links, which is slow due to the
  combined size (~6 GB, ~672,000 small files).

Additionally, there's no built-in way to control the interval between
CVE database fetches.

Given these limitations, I retained the current custom `do_fetch`
implementation for now.

The primary goal of this series is to ensure CVE analysis runs only when
the original SBOM changes or when the CVE databases are updated.

Upon revisiting the class and its associated recipes, I identified
several areas for improvement, which were fixed in the first commit.
This series also includes a second commit making the VEX class optional
rather than mandatory.

[1] https://lore.kernel.org/all/20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com/

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Benjamin Robin (2):
      sbom-cve-check: Fix task dependencies to run only when DB changes
      sbom-cve-check: VEX class is no longer mandatory

 meta/classes-recipe/sbom-cve-check.bbclass         | 63 ++++++++++++++--------
 meta/recipes-core/meta/sbom-cve-check-config.inc   |  4 ++
 .../meta/sbom-cve-check-update-cvelist-native.bb   |  5 +-
 .../meta/sbom-cve-check-update-db.inc}             | 37 ++++++++-----
 .../meta/sbom-cve-check-update-nvd-native.bb       |  5 +-
 5 files changed, 75 insertions(+), 39 deletions(-)
---
base-commit: ac13c78c0b1a73aa3f21a506a8709ecebfd98faf
change-id: 20260307-add-sbom-cve-check-p2-3d169032fb63

Best regards,
-- 
Benjamin Robin <benjamin.robin@bootlin.com>


