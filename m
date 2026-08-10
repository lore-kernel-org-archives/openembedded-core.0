Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8330AC5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 07:11:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24614.1786345897537806248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 00:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=w9ZP1HmQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E193A1A151D;
	Mon, 10 Aug 2026 07:11:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFE836033B;
	Mon, 10 Aug 2026 07:11:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97CA411C49AF6;
	Mon, 10 Aug 2026 09:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786345891; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gqVR34soj596/UYLIQJ3rVjEtTrweyhtCmSkqwIbp5w=;
	b=w9ZP1HmQqAsxyE6u6e+MUY2kfwuPdqlg2pTRTyqGC7LDETHLCe3xwaD0logdYHykYD6py5
	MiqWuU+YexI1opHdCTE9plWLCqgT1IxHVGshMZhlqUuEO63CCkoJ+4EngFHdiCXCpAZf+C
	+scsyBVkQkRYgKjpcYiqNytm8V9u5vSEubk3O4M2RMZj519ajZIK9QNUa60a867930Z1BV
	fLKpEUjGOEyheBQLlK4cQdRBBwWNy0osftYB+R5zLUzYzEKi3BAkcl2lrf1XASqpwPrdT7
	pqUGdnSbQr9Sh2d6R92kZIvDwl7+XdR8iTsZZbwrDx/p093OZSVectXpFx0rog==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 10 Aug 2026 09:11:20 +0200
Subject: [PATCH 1/2] package: Fix source info when
 PACKAGE_DEBUG_STATIC_SPLIT is set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-fix-save-debugsources-info-v1-1-2e83131bcf01@bootlin.com>
References: <20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
In-Reply-To: <20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243113

Do not override the list of ELF files, with associated source info, when
PACKAGE_DEBUG_STATIC_SPLIT is set. Extend the list instead.

When PACKAGE_DEBUG_STATIC_SPLIT is not set, use a generator expression
instead of calling append for each element: Small cleanup.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/lib/oe/package.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d047e41a78ec..4a244ec9801e 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1292,10 +1292,9 @@ def process_split_and_strip_files(d):
 
         if dv["srcdir"] and not hostos.startswith("mingw"):
             if (d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
-                results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, dv, d))
+                results.extend(oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, dv, d)))
             else:
-                for file in staticlibs:
-                    results.append( (file,source_info(file, d)) )
+                results.extend((file, source_info(file, d)) for file in staticlibs)
 
         d.setVar("PKGDEBUGSOURCES", {strip_pkgd_prefix(f): sorted(s) for f, s in results})
 

-- 
2.55.0


