Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD70EA854B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 11:57:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12495.1773057444611432829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 04:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LohifXjf;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E55284E425DC
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Mar 2026 11:57:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCC545FFB8;
	Mon,  9 Mar 2026 11:57:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 161C010369820;
	Mon,  9 Mar 2026 12:57:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773057442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=FdRx6I893o7Zji7T7rTJXxLJkY+4NZjHiI9K7bkmdBQ=;
	b=LohifXjfLLbeaBxuNVhs14849hFWlWwOPtDHWhCJ3vbErnJN8i3CzTYJeCkm7fPHT9X0cY
	cLcWAbGu70mByXgL91CtYe7JP1Zg/tbikBVIcTaCNIdFrsnWlV2XucFG2ZJESdST37Th3s
	DOoHH4jEbYo2u/hWY5ICh0Kc3znvt2KfnfrXCPfy6fotVbepAt8tEwwuohCzfXSziOwMcH
	Dm0PLsPqN4eoSTL13Rdla3MmyqnO4M9vNdJ2lqYpuJRjcv1cgOhiGAaktyZ36GXxrv8CXb
	Ht2/27a/z+dZmSn3ka0LNqMtnLP1Yg4c0dNka4PIxf5fUwjl+P7Y6jbibDwJPg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using BitBake
 fetcher
Date: Mon, 09 Mar 2026 12:57:09 +0100
Message-Id: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwML3cSUFN3ipPxc3eSyVN3kjNTkbN0CoyTdNOMUYwMzS5MU40RTJaD
 mgqLUtMwKsMHRSkFuzkqxtbUA5ucaoW0AAAA=
X-Change-ID: 20260308-add-sbom-cve-check-p2b-f3d30694d3a5
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
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 11:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232699

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

  In this series, we are going to do a full clone of the git repository,
  so this point is not going to be fixed.

- Performance overhead for CVE databases deployment: The recipes
  downloading CVE databases must copy them to the sysroot or to the
  deploy directory. This requires copying the extracted databases
  multiple times, even with hard links, which is slow due to the
  combined size (~6 GB, ~672,000 small files).

  In this series, we are using a custom deploy task that is going to
  copy the git repository using rsync directly in the final deploy
  directory, by-passing all the Bitbake logic.

Additionally, there's no built-in way to control the interval between
CVE database fetches: In this series, we are going to use AUTOREV,
which imply to query the git repositories for each build, to check if
there is a new git revision.

Moreover, this series ensures that the CVE analysis runs only when
the original SBOM changes or when the CVE databases are updated.

Upon revisiting the class and its associated recipes, I identified
several areas for improvement, which were fixed in the first commit.
This series also includes a second commit making the VEX class optional
rather than mandatory.

[1] https://lore.kernel.org/all/20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com/

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Benjamin Robin (2):
      sbom-cve-check: Download CVE DB using BitBake fetcher
      sbom-cve-check: VEX class is no longer mandatory

 .../sbom-cve-check-update-db.bbclass               | 87 ----------------------
 meta/classes-recipe/sbom-cve-check.bbclass         | 63 ++++++++++------
 meta/recipes-core/meta/sbom-cve-check-config.inc   |  4 +
 .../meta/sbom-cve-check-update-cvelist-native.bb   | 11 ++-
 .../recipes-core/meta/sbom-cve-check-update-db.inc | 28 +++++++
 .../meta/sbom-cve-check-update-nvd-native.bb       | 11 ++-
 6 files changed, 89 insertions(+), 115 deletions(-)
---
base-commit: ac13c78c0b1a73aa3f21a506a8709ecebfd98faf
change-id: 20260308-add-sbom-cve-check-p2b-f3d30694d3a5

Best regards,
-- 
Benjamin Robin <benjamin.robin@bootlin.com>


