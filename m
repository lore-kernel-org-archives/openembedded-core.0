Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA7DC54F4C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 08:34:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26607.1785141286976785988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 01:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GN4g1rwu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 042411A1283;
	Mon, 27 Jul 2026 08:34:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0D10601BE;
	Mon, 27 Jul 2026 08:34:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69C5A11C12290;
	Mon, 27 Jul 2026 10:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785141280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5S3xcRQ/GU26JMSxUa4G1A0doM13JeQHaIDHDHpB7v0=;
	b=GN4g1rwuoJEwibmI+pOlG5WLQ+PD7f9Y1CoGl94y2xolcddjVUMQGV6NlEOxrpJtWiLfax
	Gvef3gpS0K22Hjrg3316eq3vgcWakO73ws6xEV9GWjJs/DGDRLXJfLI1z+rZKVfN3rGbVu
	+kvH3qMK9xXMWFKeCdFZk8Ogg5smFqJUmRXcNO712SyL1yJd1LrFxvuMjVL2033MrNj8b2
	LqhuS59Xv8yAYy4fqCfnuTVTNwo5bI5IC1zRH9lgOs7Ft7YjUsQevbqMOQd22bHp0DbjWs
	1V4374DBQ3qnLM7uQeLh2RtYTiFGugPn7X2diLM9w3TMF+ZnyzzU9Afldzqhyw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH RFC 0/3] spdx_common: improve get_patched_src()
Date: Mon, 27 Jul 2026 10:34:27 +0200
Message-Id: <20260727-fix-get-patched-src-v1-0-f5054ca10e14@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMz3bTMCt301BLdgsSS5IzUFN3iomRdSwtLM0vTZENTE8MUJaDOgqJ
 UoDKwqdFKQW7OSrEQweLSpKzU5BKQeUq1tQCOIEzqfAAAAA==
X-Change-ID: 20260726-fix-get-patched-src-989695c1541d
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 daniel.turull@ericsson.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 08:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242063

The overall goal of this series is to fix SPDX SBoM generation in such a way
that it correctly includes the kernel compiled sources for all cases.

Currently the SPDX is only generated properly for the following case: A kernel
recipe using git sources with kernel-yocto class.
With this series, if a kernel recipe only inherit the kernel class and use a
tar file for the kernel sources, the SPDX file now contains the proper list
of compiled files.

But while testing this series, I found out that SPDX_INCLUDE_COMPILED_SOURCES
for something else that a kernel recipe is broken (and never worked?).

In save_debugsources_info() this `src.replace(f"{debugsrcdir}/{pn}/", "")`
is never executed since `KERNEL_SRC_PATH` is always defined globally.
But even if this part is going to be executed, this is still not going to work.

Am I missing something here?

I also found out that if PACKAGE_DEBUG_STATIC_SPLIT is defined (which is not
documented, introduced in commit 17fa66c8199d73f0b59b2b3e609075933bf1e74b)
then the `results` variable is overridden instead of being extended.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Benjamin Robin (3):
      spdx_common: simplify get_patched_src() implementation
      spdx_common: modify UNPACKDIR instead of WORKDIR in get_patched_src()
      spdx_common: In get_patched_src() ensure kernel dir name to be ${BP}

 meta/lib/oe/spdx30_tasks.py |  1 -
 meta/lib/oe/spdx_common.py  | 83 ++++++++++++++++++++++-----------------------
 2 files changed, 40 insertions(+), 44 deletions(-)
---
base-commit: 9a25b3e72051a30794e147564028487a598ce82d
change-id: 20260726-fix-get-patched-src-989695c1541d

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


