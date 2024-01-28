Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D014C47258
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 18:48:01 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.47172.1706467678971504745
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 10:47:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=JYjijmGJ;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 07446240103
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 19:47:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1706467677; bh=5H48tklLYdA7XihamiHQAmX1FOT2k09BBGofe5cC/3g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=JYjijmGJn+3Eoz1K/rqqWU8foreOSOQMGVpmzkToe5HP/BeYl0fwcq3rwv0QM6fli
	 tnsz1Dbgjca/oDp56fhAd8dR1aE+anubp9zgM80VX4PXtT8WP6kLBSudKxz2V8gDgJ
	 1uBb+CfkQUn5rHk8KZfQ/plxt5edyXmFPARKBJ1CIcQ0FfdNqzKU5jhW+zPTdjTSb+
	 Zjw80p5u2Y9SNmWhZ9v1dH05mxACRUURW+LpuUEJpxrilq5bfvN2XCyhujplLyvs7v
	 pML2lJYdNlQXZKnMaOsaR89MQTXz8ShZJ3eichC3OKcG765ZwiGT1eHjdYKYD5gcX/
	 aOJPMGWrb5ZJg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TNL641LHLz9rxM;
	Sun, 28 Jan 2024 19:47:55 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] gnutls: Upgrade 3.8.2 -> 3.8.3
Date: Sun, 28 Jan 2024 18:47:41 +0000
Message-Id: <20240128184741.1446715-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 18:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194450

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Upgrade version to adress recent CVE findings.

Changelog
=3D=3D=3D=3D=3D=3D=3D=3D=3D
** libgnutls: Fix more timing side-channel inside RSA-PSK key exchange
   [GNUTLS-SA-2024-01-14, CVSS: medium] [CVE-2024-0553]

** libgnutls: Fix assertion failure when verifying a certificate chain wi=
th a
   cycle of cross signatures
   [GNUTLS-SA-2024-01-09, CVSS: medium] [CVE-2024-0567]

** libgnutls: Fix regression in handling Ed25519 keys stored in PKCS#11 t=
oken
   certtool was unable to handle Ed25519 keys generated on PKCS#11
   with pkcs11-tool (OpenSC). This is a regression introduced in 3.8.2.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../recipes-support/gnutls/{gnutls_3.8.2.bb =3D> gnutls_3.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.2.bb =3D> gnutls_3.8.3.bb=
} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.2.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.3.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.2.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.3.bb
index 43fb5c4c4e..27d6753be0 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.2.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.3.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
=20
-SRC_URI[sha256sum] =3D "e765e5016ffa9b9dd243e363a0460d577074444ee2491267=
db2e96c9c2adef77"
+SRC_URI[sha256sum] =3D "f74fc5954b27d4ec6dfbb11dea987888b5b124289a3703af=
cada0ee520f4173e"
=20
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
=20
--=20
2.39.2


