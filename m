Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7FFF44866
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:11:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155767.1775826666149044866
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XzI4x9v6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A68B01A325A
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:11:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D4A4603F0;
	Fri, 10 Apr 2026 13:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 345BB10450021;
	Fri, 10 Apr 2026 15:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775826663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lQ9KwcqAWvv8g1ZZt9uxYuIMEpqx/KyDd+el8QlgBF0=;
	b=XzI4x9v6LsToG0XJhOLRNgkUUAgdMg4Uj6B+bLUDAQleydJ0SwAdcUoX8IUF+9azvhw6o7
	yUj3Bongi4+Mk6dTUqeonb6+56X8EYdhoCjNCEYQxYz8c/A0OWkxFQqzLIrp9jUB+diLl0
	oNBQQ/ZPsS5yAeeBEp4XLDJUz7x97VExkgtSubUqdgOvJkonAU0RDuKUB6gT+oXiUo0v9z
	LcDuEuY9NH0+uypu1BcWu2qBsON+qsrWi0LAqUWoQmpMNaH3FDOWVh69d0RWcYZ+OFtL7Z
	8RtTs/5n9AdQ9YP4ODaDK06oCajj6K/8qNnyHpOPdlmGrKlzj1/GYCqgjhQBHA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 10 Apr 2026 15:10:44 +0200
Subject: [PATCH 2/4] cve_check: do not break old CVE_PRODUCT with escaped +
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-fix-cpe-escaping-v1-2-ed63c2477f46@bootlin.com>
References: <20260410-fix-cpe-escaping-v1-0-ed63c2477f46@bootlin.com>
In-Reply-To: <20260410-fix-cpe-escaping-v1-0-ed63c2477f46@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 peter.marko@siemens.com, stefano.tondo.ext@siemens.com, 
 jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235025

For now, until all layer are fixed, replace already escaped plus (+)
with a simple + before doing the escaping.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/lib/oe/cve_check.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 22b5062c977c..e6104a279d5e 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -227,6 +227,9 @@ def cpe_escape(value):
     if not value:
         return value
 
+    # Do not break compatibility
+    value = value.replace("\\+", "+")
+
     return value.translate(_CPE23_ENCODE_TRANS_TABLE)
 
 

-- 
2.53.0


