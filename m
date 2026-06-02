Return-Path: <rl@karo-electronics.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E99ACD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 14:22:07 +0000 (UTC)
Received: from dd54918.kasserver.com (dd54918.kasserver.com [85.13.167.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26821.1780410117895164859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 07:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@karo-electronics.de header.s=kas202603021246 header.b=eOWw0gNl;
 spf=pass (domain: karo-electronics.de, ip: 85.13.167.58, mailfrom: rl@karo-electronics.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202603021246; t=1780410116;
	bh=hVU1nXHW3FkuTLxLwLKePV7oCVim8+UG4X0fFcOlkyI=;
	h=From:To:Cc:Subject:Date:From;
	b=eOWw0gNlwI/9WvRSA2wIfPQgArEu9FkcWIXH1JTk3HkpWdDtsFIqsACASHZDbMV9J
	 ph/Wj4jGqLBJRUe25wHYrxBcVxXgtzHw2GqwOWUr4E32xSG03M11fJWjNln3nWIqGN
	 XznSIW5SpOMt3C70WqyH1Qo4gnSHJQms2M8q4/gBhhWbNj2DdoLQivI6SmzP9eOXzW
	 ENmFoG6HDJ7dcEpqH16/abyobDcaUjE66AJlGaTogeQ8tDwf5pOK1NmLOmIr+T8AsR
	 pwm7NYUTAXKRz1BFhrsb+lvXT7xoispOoxD7mhjqdmcX5RRiyXj3fDWCJQYnMyfBD9
	 e2nRN2rM5cb4A==
Received: from robin-MS-7E12.ka-ro.local (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id 134DA77223CA;
	Tue,  2 Jun 2026 16:21:56 +0200 (CEST)
From: Robin Lintermann <rl@karo-electronics.de>
To: openembedded-core@lists.openembedded.org
Cc: Robin Lintermann <rl@karo-electronics.de>
Subject: [scarthgap][PATCH 1/5] sign_ipk.bbclass: add missing 'd' parameter to raise_sanity_error()
Date: Tue,  2 Jun 2026 16:21:28 +0200
Message-ID: <20260602142132.976138-1-rl@karo-electronics.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: /
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 14:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238051

The second raise_sanity_error() call in this class lacks the 'd'
parameter which would lead to a python exception rather than the
desired error message when the corresponding error condition is
fulfilled.

Signed-off-by: Robin Lintermann <rl@karo-electronics.de>
---
 meta/classes/sign_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sign_ipk.bbclass b/meta/classes/sign_ipk.bbclas=
s
index 51c24b38b2..9f666998ba 100644
--- a/meta/classes/sign_ipk.bbclass
+++ b/meta/classes/sign_ipk.bbclass
@@ -40,7 +40,7 @@ python () {
=20
     sigtype =3D d.getVar("IPK_GPG_SIGNATURE_TYPE")
     if sigtype.upper() !=3D "ASC" and sigtype.upper() !=3D "BIN":
-        raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE (%s), u=
se either ASC or BIN" % sigtype)
+        raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE (%s), u=
se either ASC or BIN" % sigtype, d)
 }
=20
 def sign_ipk(d, ipk_to_sign):
--=20
2.43.0


