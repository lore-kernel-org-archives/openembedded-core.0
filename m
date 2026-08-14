Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08576C5CFDB
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 14:49:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14549.1786718963137951693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 07:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nKS4WcNY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D5FD11A04E9
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:49:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB9576046D
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:49:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 746F611C4EE19;
	Fri, 14 Aug 2026 16:49:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786718956; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/hil1a3Xtqcm8py9XL2/CM2FSRflz5IgGRuWuTkdTqc=;
	b=nKS4WcNYK/nqcYQ40l/LVWgLgTyw9PKVsytTsY1BvZdxxTpKI+Z7xmT975MM/EUvFInGm9
	ZpE7Hvroufcr4zrtZ+0+Vd26gOiBb7kqR4NxFjhcAFHDduCL6cgAhOdipObMe8WbyS5XrL
	MY9T6Nrjgde7MxhanHgh7HBb9JGN559r70XJfmKI2BtS3TnrIjP1vVo9InJseljuId/lAL
	uPISF3T+9MypWgBXy2FvmtiiOWaTOr1xVdqw3WiB61ORyyu3YNuwPA0nHENZqiC2oWjrEU
	92Luc/v4Z7EjSJA5tnYEi5LiOE8oJNFg7fs/MaNq8Cwu59GWTiBjLg8Rxa2byw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/2] sudo: Ignore hardcoded home paths in QA
Date: Fri, 14 Aug 2026 16:48:50 +0200
Message-Id: <20260814-mathieu-sudo-home-v1-0-d6c8251de9f4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIqf2oC/x2MywqAIBAAf0X23IL2MvqV6FC55R7K0IxA+vek4
 zDMJAjkmQL0IoGnmwO7I4MqBCx2OjZCNpmhlGUrO1XjPl2WKWKIxqF1O6HKRupqbqTWkLvT08r
 P/xzG9/0AAoTOHmMAAAA=
X-Change-ID: 20260814-mathieu-sudo-home-1260073b5077
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786718955; l=693;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=LK3euqUld5M7CCVxVzIQiKzvswnKxHGjr+lhaUKuplY=;
 b=Z6W78oKWycHyqYISasS/1+xvVccvP+ymYvr+E9NX17A8xMydFwIR08ERDejSwcgSY4ktcOEC6
 hGPdmdPQKEJDHB7eFlwJ4szRgqh7vGX+//yszrQCQHB/E8bh4uOupYj
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243454

The changelog contains the "/home/buildroot/autobuild/" string: ignore
it in QA. This needs to evolve a bit how OEQA_BUILDPATHS_SKIP is
handled.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (2):
      classes/insane: improve HOME checks exceptions
      sudo: Ignore hardcoded home paths in QA

 meta/classes-global/insane.bbclass  | 3 ++-
 meta/recipes-extended/sudo/sudo.inc | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)
---
base-commit: dd003e147db548d9c86821a08450d6461d061cea
change-id: 20260814-mathieu-sudo-home-1260073b5077

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


