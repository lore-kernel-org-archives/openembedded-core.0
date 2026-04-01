Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C1AD3517C
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 12:36:19 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12046.1775046970485414191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 05:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=O3RmxuAH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kory.maincent@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6BF57C59965
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 12:36:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 596EA602BF
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 12:36:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C60C10450285;
	Wed,  1 Apr 2026 14:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775046967; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ua1JkouNtsOdwt8oj+JkHz+McyFO6HxRagmLdZqcX2I=;
	b=O3RmxuAHMaMq+u42T+5GImc7+uOXUbaImufLgCFRyfqI67zH1w0+Tff+iulNus+ChX4z1f
	u57hW+uEDV/bZS6dFZN5N54nCU00Gq5nK3LqAcI98SdzIm9X1a+jkxoqQkue+wwJDF81Nl
	3abdLQnqy0qrAGmq3xZF5LhLB/tzXpDzJqHiSRTn5rd0KxHJIewoPPg5IOUH30R9cqrX2k
	gOQhqxneEF/lZqhCvmcLr+TtPVVvr+h2AjBK5ehnGqY3HVR8Hf+rlXdBGYNTtq7KKsZtzC
	JfSdkjGx8SL7BrfHijWZ5Yk+rxAgLWWp4Jvm/n0fnBrg8Q3mPmpuQpgW6R5A/A==
From: Kory Maincent <kory.maincent@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: [OE-core][PATCH] machine/arch-microblaze: Fix newlib builds
Date: Wed,  1 Apr 2026 14:36:00 +0200
Message-ID: <20260401123601.466036-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 12:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234346

Fix the following errors for newlib libcs:
ld: unrecognized option '--hash-style=3Dsysv'

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 meta/conf/machine/include/microblaze/arch-microblaze.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/m=
eta/conf/machine/include/microblaze/arch-microblaze.inc
index 4f58076ac9..deae580ae5 100644
--- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
+++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
@@ -60,3 +60,6 @@ MBPKGARCH_SIZE =3D "${@bb.utils.contains("TUNE_FEATURES=
", "64-bit", "64", "", d)}"
 # Package Architecture formatting
 TUNE_PKGARCH =3D "microblaze${MBPKGARCH_SIZE}${MBPKGARCH_ENDIAN}${MBPKGA=
RCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
=20
+# Misc settings
+# Fix: ld: unrecognized option '--hash-style=3Dsysv'
+LINKER_HASH_STYLE:libc-newlib =3D ""
--=20
2.43.0


