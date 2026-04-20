Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0767F36C4D
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:44:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14473.1776671090504549939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kOcnoLIG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B052DC5C98E;
	Mon, 20 Apr 2026 07:45:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED8905FFA5;
	Mon, 20 Apr 2026 07:44:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9009510460B76;
	Mon, 20 Apr 2026 09:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776671088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q5iG8wH9AIDxUApfpFPIQToEeExLbCsfdFYpZHsqYgc=;
	b=kOcnoLIGfAj9l+G6bdMSS6CkCl9RSlklNTAlFII56Od7deMW+nn11eDfaZQBGzh1CxVrt2
	NpAS0aWMjJc7gtQXKRElFGeQ+MiMbjVehENbjbjqp/BubO21VC5jCceVTRSFOwXAivdsgB
	n0ARKRpVBmGfFSpmNnh5r3vhDW87RMgYMtFxcud5+dBzPRnpFMgI1XfcJ6t2gm1b75oFcv
	MdQVLcB3NiMb4VX35YCtyQEPjWRV5QgeZXOoUzLUS4bUXQvMwJYNp//9sGs73yphMgWGq4
	hMxzBwku6MM5ynz+QsJ/YD7/PUJ6Uy4eNRZYKSpgZcUFpLtlQR+wVl93eDxAoA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 09:44:34 +0200
Subject: [PATCH 03/10] oe/sbom30: Fix undeclared variable in
 import_bitbake_build()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spdx3-improvements-v1-3-27e0d5edcdbe@bootlin.com>
References: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
In-Reply-To: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235544

In the error path, deploy_dir_spdx variable was not defined.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/sbom30.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index f45d8f6773ba..5d020b934cc0 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -760,6 +760,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         bb_objset = self.import_bitbake_build_objset()
         build = find_bitbake_build(bb_objset)
         if build is None:
+            deploy_dir_spdx = self.d.getVar("DEPLOY_DIR_SPDX")
             bb.fatal(f"No build found in {deploy_dir_spdx}")
 
         return build

-- 
2.53.0


