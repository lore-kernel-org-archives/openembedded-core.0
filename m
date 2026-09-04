Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C18C79F83
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 08:23:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9188.1788510191814147233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 01:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BHrISpzT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 20E244E41506
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 08:23:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAA3E6057F
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 08:23:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4630911C7A7B6;
	Fri,  4 Sep 2026 10:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788510189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=47xmka2z474Sfcf7WO1x3zMLwiWI6HjlRdltJUxVyH0=;
	b=BHrISpzTz7qGlF+CJxrZ00mtLl3OLnBCwEtTRmUc7IV9otydR4tnJtt+YL/5gF2lA2UGPB
	vDoSj3ue9GVaVj9VcUwEb+sgmPEXXDqlX4hCo9tb8av8hO0rNyG1AdXIxqLOkbDxzq9hCk
	5wXZa7EmalHSnNbQ8A48DlVcGxCMILlz+xD5gRHm7p2RYKX2yFidFkkmC7gGKXds/tgO4W
	qDN3f3zhzAA8LFWd3Sjk2pyyta82c41l+juXd5S9dRHjN9+4jHuFgrPjcTjHX3SkfKuptQ
	vsZuwrlR/cg3k3XzwV3Rn7EO87hWEgkfR04vSBFKX36TOdll6BbaQ45r/JHNVA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 04 Sep 2026 10:22:59 +0200
Subject: [PATCH 2/4] scripts/oe-depends-dot: remove custom argument
 checking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-oe-depends-dot-cleanups-v1-2-b56bf05fc5fd@bootlin.com>
References: <20260904-oe-depends-dot-cleanups-v1-0-b56bf05fc5fd@bootlin.com>
In-Reply-To: <20260904-oe-depends-dot-cleanups-v1-0-b56bf05fc5fd@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YUlKFpAfyHWE81mVPe3K/IhaSO+9J8jN0sLeqr5Hbts=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqmn/mSvRHAeGu2zDIbLJBxpEwhbR/8yJEuLY4Y
 AVz5Q61VQaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCapp/5gAKCRDRgEFAKaOo
 NvVTD/9KDz7g24oh0wJ1f97BuJ2BaBJa3+7XB84qIDGh+1nn3e7zDeO5vuituxISbQHc9O1hCe8
 1oh6nERhl+ASx1qRWS0hTPTmgUzUdYXp5UyMt02uRys2LpKF0w7267b7H3zm/Mu9oiidB7VXzgI
 2IOqMVa/1zplxAQqxmaV8E0hROWKler1rSPuiAtfeDPZa0VkVjhU3C78FLrqYu9zWBwVUYIxiHS
 IHQz7f5chjI793xiLUjAlZGBkmUfW4WBqO4WaDHlsqSd1I0v8jz6HpdD3//j79lDHwKV8F1g+u+
 ffyfNZ4Qm8v3HiqnKkaxlkZQBieGGUPIMRShpcA8q0u1Ez1wrCC2+N0a8qW4oxscFPH3NIL82Yk
 nLBhP5nt868ERmx7VmFhsz4oT8hFkmNz4yW5hsecqMKdjBL5BnWH1C8GzHfJ8Kum12zTqCU8Ssm
 jaHTSQwJr+QlXiMuuxQWgTbyPQfGxU+O0r1Vr6bFvWji8hwoiJrz88s0lBHb/VEYZyRv7uHD+f+
 owGH5J6WIQqbv4aY4FF8ScCZ8d9G2QA/KuMPtvTL/h/Yr9eA1aMrsEqI+agVL3RRFDyYCZTxzW3
 zmPWMQaCTPmFI61VDVtkZbnixh1okIA+x5ftjd+BlYg/ByP0AoxGH4lUr8rUQzGy9+WYgxDg3eU
 Irl+MT4nhNbRTnQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 08:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245067

The argparse Python module already handles argument parsing and checking
for us, so there's no need to do it another time here. Remove these
checks.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 scripts/oe-depends-dot | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
index 7b16b911bd..c505a196f9 100755
--- a/scripts/oe-depends-dot
+++ b/scripts/oe-depends-dot
@@ -49,9 +49,6 @@ Reduce the .dot file packages only, no tasks:
 
         self.args = parser.parse_args()
 
-        if len(sys.argv) != 3 and len(sys.argv) < 5:
-            print('ERROR: Not enough args, see --help for usage')
-
     @staticmethod
     def insert_dep_chain(chain, rdeps, alldeps):
         """

-- 
2.55.0


