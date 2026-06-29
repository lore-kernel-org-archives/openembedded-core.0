Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94D1C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 11:07:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89748.1782731214455707510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 04:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=M8ivRolD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CB19D4E40B66
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 11:06:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A163D5FF96;
	Mon, 29 Jun 2026 11:06:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2D67106F1739;
	Mon, 29 Jun 2026 13:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782731212; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BSuUxVtYO/lNmATiVbFSGpoXaCZ0eULy6HiAPUjmuEY=;
	b=M8ivRolDd8cN7KS8Lq/oyMLEc0AqRqYn+3jWmDSXLVjb0iF5f+73pavC90z2dRk02kKcH7
	vZDEJZ+PD+feRH49/LSod6eR9Xf9KcFgzQ2wJGxdJIXUgMEesgx39drZb/VyslVJIM5t/w
	D46qyjqgRL3mAZPNpBRWjpiBEJYrkKOdCdutoik0Z1b3VSsjRYFkvV/PYR8x91uhWi/7Vj
	kEmpsXXqbBprTLGhvqbtVUXq1x1LT6rql8m7ksOTYCScak5AWXzb7aL5b1sB4JlFN5d8F2
	ULXgM4aw9UeTIVubzoHxbo1dvxnWTSFhpdPxVJbDobip/feAg/XEUF4iy6JH8A==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 1/2] common-clang.inc: fix undefined name in get_clang_arch
Date: Mon, 29 Jun 2026 13:06:18 +0200
Message-ID: <20260629110619.530623-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260629110619.530623-1-joaomarcos.costa@bootlin.com>
References: <20260629110619.530623-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 11:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239757

Replace arch_val by arch_var, thus fixing:

NameError: name 'arch_val' is not defined. Did you mean: 'arch_var'?

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
index ed628008e0..9018094419 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -35,7 +35,7 @@ def get_clang_arch(bb, d, arch_var):
     elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
     elif re.match('loongarch64$', a):                  return 'LoongArch=
'
     else:
-        bb.fatal("Unhandled architecture %s" % arch_val)
+        bb.fatal("Unhandled architecture %s" % arch_var)
         return ""
=20
 def get_clang_host_arch(bb, d):
--=20
2.47.0


