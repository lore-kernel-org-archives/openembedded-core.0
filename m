Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27531093191
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 09:11:12 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8741.1773997862461434121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 02:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=rbKZHh0r;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 413E1C415A4
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:11:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1BC6600E0
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:10:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FD5510450B7A;
	Fri, 20 Mar 2026 10:10:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773997859; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bY6aFf7RH3HMOFvvPPGPTiAaluOIz3ktT99nvCMWw6M=;
	b=rbKZHh0rqqKIskyjOLpBrYgN+UTjD21sNkabjTQ648N/vN9w4KVfhSMGcgCwVf5YrRCxlH
	5mk5ShlBTCGvWDwU8U71SGrOQMFosGuAJ3OdnxrmJgnh1p/Yxwv4/lGlsDuAufUKYmxgou
	dE9F9IfDfBEQoZIWZ1BwWphZOrMToRJnw17oXl1Ksp0RMVxtwZWrbaSvdGRqJM9YzUxN0b
	pT7iNza/5ozUGiBje3ipBaomekeS8IStRW1t0qbto3oLIoTvFcr6gkOMQPfzgda1kxwwfi
	Iahh/W4lq25TVOu99UqtEkuYKA1xzhrqdNmsAoOFVzrlZKzBP7lVDa6OaPPpww==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2] ltp: fix warning in remove_broken_musl_sources
Date: Fri, 20 Mar 2026 10:10:45 +0100
Message-ID: <20260320091045.1641281-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233589

If this was originally intended to be an actual warning, it was not
behaving as such: echo only prints to log.do_patch, so the message ends
up hidden there.

Replace 'echo' by bbverbnote to display the message (as a NOTE) correctly=
.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-extended/ltp/ltp_20260130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-ext=
ended/ltp/ltp_20260130.bb
index 75c5b8b7bd..dcd1e81398 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -126,7 +126,7 @@ remove_broken_musl_sources() {
 	[ "${TCLIBC}" =3D "musl" ] || return 0
=20
 	cd ${S}
-	echo "WARNING: remove unsupported tests (until they're fixed)"
+	bbverbnote "remove unsupported tests (until they're fixed)"
=20
 	# sync with upstream
 	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L3=
3
--=20
2.47.0


