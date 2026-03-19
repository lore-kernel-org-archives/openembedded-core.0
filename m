Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D5E1090226
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 13:29:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11025.1773926974093439218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 06:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=or+y4Rp/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 219061A2EE5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 13:29:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E62495FDEB
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 13:29:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 096C8104503A5;
	Thu, 19 Mar 2026 14:29:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773926971; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=M8BEVhXsMDHgGltHKiRx9DqubTNyz50R5UleJvvDJkU=;
	b=or+y4Rp/kFI5pmJRroG9MEc7l6NXHV0OegWkI1BFw8WlRtjTzfqV4s7riYViBtLgRzn6CD
	vP6XEEnsE/p5JSZgYabVK6O7Wzxk79wJUpKWQ6ZkIFxgSssmqGyL6zn0QnCXkDVF2P/eJz
	rI4ZwjAQYWW8b8isWSePQJJVuP63Y2sHg1ZmIhT6PiewdJ+qoYD/HVCNRkTbETI009VXJZ
	4/YQlJFWdDOD08sgtXWK3ZtTQkzNB1DUcm8fVVBaHb2xHdUjg8SxNEPvyvghdC4I1OBHjx
	rYyJFMpxKej28iJV732nyiqp47TMlcAfLcA+DBbwTlzWYIcBlIsE/D0DUNiFWg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] ltp: fix warning in remove_broken_musl_sources
Date: Thu, 19 Mar 2026 14:29:04 +0100
Message-ID: <20260319132904.1308436-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 13:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233526

If this was originally intended to be an actual warning, it was not
behaving as such: echo only prints to log.do_patch, so the message ends
up hidden there.

Replace 'echo' by bbwarn to display the warning message correctly.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-extended/ltp/ltp_20260130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-ext=
ended/ltp/ltp_20260130.bb
index 75c5b8b7bd..36432c15b2 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -126,7 +126,7 @@ remove_broken_musl_sources() {
 	[ "${TCLIBC}" =3D "musl" ] || return 0
=20
 	cd ${S}
-	echo "WARNING: remove unsupported tests (until they're fixed)"
+	bbwarn "remove unsupported tests (until they're fixed)"
=20
 	# sync with upstream
 	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L3=
3
--=20
2.47.0


