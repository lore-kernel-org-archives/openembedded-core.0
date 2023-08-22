Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B17BEE49B0
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 17:43:55 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.100])
 by mx.groups.io with SMTP id smtpd.web10.2662.1692726226578565949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 10:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=nX+3sFp2;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.100, mailfrom: jasper@fancydomain.eu)
From: jasper@fancydomain.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1692726223;
	bh=SzFEjrqmCJyrfjQvpEgarJUtTRctCnwnJy69QfiHbh0=;
	h=From:To:Cc:Subject;
	b=nX+3sFp2c7Saw9XE2rfldWWzICH/wlt0ygnUTwxQCaMCZB100AKmhiohv6cuNr4Ko
	 X/m4GGwWwCxzWk7S7bZ7lgk/4lWuJ3iSVP1XeDI/oFKKAty+h8iGPG2tlHEOBJmKDS
	 eAa0KrdyrYNiDarkZS6lOhcp8qlfLVg0G5gsVNj7gHxc9QEw0OUj/1o3xzNs5t3gbW
	 6ZqFDe//WK8zcEZ/GeRt5hMrvYfK4dQy2JLCUz1593/Dvb4C9r/UyIcjqInw1Use/5
	 jCllgn9TcnRXl4ZP1ZHbxvf2IAMEGi6EOBVwDM7wGMjWJk1QCSDq0yVQGG0EU3JI9s
	 /piE1M4j/dIig==
To: openembedded-core@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] cve_check: Fix cpe_id generation
Date: Tue, 22 Aug 2023 19:41:04 +0200
Message-ID: <20230822174104.70321-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 17:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186519

From: Jasper Orschulko <jasper@fancydomain.eu>

Use "*" (wildcard) instead of "a" (application)in cpe_id generation,
as the product is not necessarily of type application, e.g.
linux_kernel, which is of type "o" (operating system).

(From OE-Core rev: cae9528b002c06143bf048b991b9d7e93968cb6b)

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 42a77872e9..06d3c6dbda 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -143,7 +143,7 @@ def get_cpe_ids(cve_product, version):
         else:
             vendor =3D "*"
=20
-        cpe_id =3D 'cpe:2.3:a:{}:{}:{}:*:*:*:*:*:*:*'.format(vendor, pro=
duct, version)
+        cpe_id =3D 'cpe:2.3:*:{}:{}:{}:*:*:*:*:*:*:*'.format(vendor, pro=
duct, version)
         cpe_ids.append(cpe_id)
=20
     return cpe_ids
--=20
2.41.0


