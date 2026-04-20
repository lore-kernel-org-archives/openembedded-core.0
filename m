Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5C4F36C4C
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:44:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14869.1776671089878677670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nnp4L4Kp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E2DF4E42A75;
	Mon, 20 Apr 2026 07:44:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0DDAD5FFA5;
	Mon, 20 Apr 2026 07:44:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A36710460B74;
	Mon, 20 Apr 2026 09:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776671087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=elhwNXb6qyNCHqMdK5UyWLfTJsVVq1eVgq4TcKLwz/c=;
	b=nnp4L4KpC+/h8R8L3CbcS7BML8ZNbf/zJsZ8HSILr2G8WD0mu16v3wIC5X3CDVSYG3xHCE
	+oJYaU1ozwOaoakPig2cnftnci/zwjFm1av4533a83tAkCDvMKA2InfmulpYzc8vhCaupQ
	XuwBcW8c+KMBPtPCBxe34UJMxsk5Sdu9+4d3OsG/LKFXOAk1bKSCwsHCwKVLoiynXxDPKE
	7lBt2Sg0pZV44sxFbNfyF0Lf6JX7w4AR/zpX63sTsLu+iE5I0pxpYCbc2LScqvLmxCRGSG
	vOBYRQI38wxrsweNWJg6TYshWUQ+VKQtUL7njF0b7FJ2yz3UO52KXkZmlIld9Q==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 09:44:33 +0200
Subject: [PATCH 02/10] oe/sbom30: Simplify sorting of license_text_map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spdx3-improvements-v1-2-27e0d5edcdbe@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235543

In new_license_expression() the code used to sort the license_text_map
dictionary can be simplified.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/sbom30.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 9f50821af087..f45d8f6773ba 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -585,9 +585,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             re.sub(r"[^a-zA-Z0-9_-]", "_", license_expression),
         ]
 
-        license_text = [
-            (k, license_text_map[k]) for k in sorted(license_text_map.keys())
-        ]
+        license_text = sorted(license_text_map.items(), key=lambda t: t[0])
 
         if not license_text:
             lic = self.find_filter(

-- 
2.53.0


