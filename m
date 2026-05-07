Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03CDCD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 14:28:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13318.1778164098695493871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 07:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=e/2kCuzq;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F5C51A3562
	for <openembedded-core@lists.openembedded.org>; Thu,  7 May 2026 14:28:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5590960495
	for <openembedded-core@lists.openembedded.org>; Thu,  7 May 2026 14:28:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12135108194E3;
	Thu,  7 May 2026 16:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778164095; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Fy6zLCcvBtOGLP979DKA7mkElfNg/J/TPCziZparfyA=;
	b=e/2kCuzqoznUZM3R3G/dO/95Vyl2W0zlUWKOkSATkr1HD47DcjfDX4iWEMFkZO+J0S9995
	KbIpN/D5KAePZ0LTB4875z8BfNj3gQk7mVnz3FVpnYlJkXzzSOZKNCmTT8Ih1CvbHVQscq
	v0SnVJloxVYnb03Mj+qAWGfVTibePPMasEBVGDZ4yA+nqwhCdz3GRzwxeH2mzWz+UysBOP
	6Xpteby2eXlkisHe7aMr6Yy4VixcTo4oAmI8DSt7belu85Ah3jUF4atOJDeXRoaHz0eMK/
	fLOQ4UC2hGk5xhUfAtImeRUjNJsORUpMBDX3EXMa+ifThMLavvmHTF0QCQ2HAA==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] fetch2/crate: skip yanked versions when reading cargo index
Date: Thu,  7 May 2026 16:28:06 +0200
Message-ID: <20260507142806.915139-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 14:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236592

From: Thomas Perrot <thomas.perrot@bootlin.com>

The cargo sparse index marks yanked crate versions with "yanked": true.
Treat those the same way as non-existing versions so that version
checking never promotes a yanked release as the latest one.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 lib/bb/fetch2/crate.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/bb/fetch2/crate.py b/lib/bb/fetch2/crate.py
index b89817ab94d5..d84bae0bcd1e 100644
--- a/lib/bb/fetch2/crate.py
+++ b/lib/bb/fetch2/crate.py
@@ -178,7 +178,8 @@ class Crate(Wget):
         response =3D self._fetch_index(ud.versionsurl, ud, d)
         for line in response.splitlines():
             data =3D json.loads(line)
-            versions.append((0, data["vers"], ""))
+            if not data.get("yanked", False):
+                versions.append((0, data["vers"], ""))
=20
         versions =3D sorted(versions, key=3Dcmp_to_key(bb.utils.vercmp))
         return (versions[-1][1], "")
--=20
2.54.0


