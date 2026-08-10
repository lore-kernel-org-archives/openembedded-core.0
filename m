Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730BCC5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 07:11:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24612.1786345893407971122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 00:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ar1Qo+0m;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2A4DD1A151D;
	Mon, 10 Aug 2026 07:11:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0069A6033B;
	Mon, 10 Aug 2026 07:11:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93F5211C494BE;
	Mon, 10 Aug 2026 09:11:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786345886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=XOE9LDjoIAepJk9/6e2DtStxonUbvz1Qf2k0xhSvc84=;
	b=ar1Qo+0mWhAYtKJXJav9LazvB4LbobIHNZA/4Cg52NAtIEibxhEFLZbaTlZM6qr72M3cb+
	cBXUXLKKkGKFr1Lwq8yuNwB8TecGzd0JO4H1X2SbST+T+T6ra8vmh/rtUcR97nIlDZSL/l
	Pi7ntLA/DV8Qgnz2lbIdjuBjeBTFNeGukKM7oqmttxueK47XNc6GjNC04C1x+tZpZj2hlM
	Xpb8sGTlbQQMibIbRyp9EBUfdhwKzx7sM7KaK3KJMjHNkMta6zWjXBP0VrBDUeHxWj7TiP
	v0HF57Rjt0AQtq2qLMKDF4CdcFS3S9OXaRgML+KZ8R+PB5+t0pEZED9jR+O6KQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH 0/2] package: improve save_debugsources_info()
Date: Mon, 10 Aug 2026 09:11:19 +0200
Message-Id: <20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywrCMBBG4Vcps3ZgGqQUX0Vc5PK3jotEMqYIp
 e9u1OUHh7OToSqMLsNOFZualtwxngaKd59XsKZucuImmUfhRd9sfgMnhLZaaTXCWPNSOMxJfDz
 DO5moD54Vvf7Nr7e/rYUH4ut7pOP4AJUQUxd+AAAA
X-Change-ID: 20260810-fix-save-debugsources-info-b8d0ac4ea206
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 daniel.turull@ericsson.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 07:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243112

The overall goal of this series is to fix SPDX SBoM generation in such a way
that it correctly includes compiled sources for "normal" recipes (a recipe
which does not inherit the kernel class).

This was tested with the busybox recipe. The following command list the
effective list of compiled sources.

python3 -m json.tool \
  tmp/deploy/spdx/3.0.1/cortexa15t2hf-neon/builds/build-busybox.spdx.json | \
  grep -F '.c"'

This is the same list as the extracted sources from the debug symbol:

zstdcat tmp/pkgdata/qemuarm/debugsources/busybox-debugsources.json.zstd | \
  python3 -m json.tool

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Benjamin Robin (2):
      package: Fix source info when PACKAGE_DEBUG_STATIC_SPLIT is set
      package: fix source path in save_debugsources_info()

 meta/lib/oe/package.py | 79 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 28 deletions(-)
---
base-commit: 20f678d825d1b8a1e8bfa88dedd51eb628c96d51
change-id: 20260810-fix-save-debugsources-info-b8d0ac4ea206

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


