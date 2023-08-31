Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DBCC83F10
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 10:02:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13347.1693476166410075631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 03:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F8FEFEC;
	Thu, 31 Aug 2023 03:03:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C1F73F64C;
	Thu, 31 Aug 2023 03:02:45 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] glib-networking: use gnutls backend for TLS sockets
Date: Thu, 31 Aug 2023 11:02:43 +0100
Message-Id: <20230831100243.3946833-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831100243.3946833-1-ross.burton@arm.com>
References: <20230831100243.3946833-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 10:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186968

From: Ross Burton <ross.burton@arm.com>

As per upstream:

  There are hacks in half the tests where this backend doesn't return
  the expected error code or doesn't work as expected. I do hope to
  enable this backend by default in the future. For now, it's not there
  yet.

https://gitlab.gnome.org/GNOME/glib-networking/-/commit/8e1d80c1e0fc52d17=
d08a21946fa4a86ec30e1db

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.76.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
index 66b6a78a531..ed1625617e6 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
@@ -16,7 +16,7 @@ DEPENDS =3D "glib-2.0-native glib-2.0"
=20
 SRC_URI[archive.sha256sum] =3D "5c698a9994dde51efdfb1026a56698a221d6250e=
89dc50ebcddda7b81480a42b"
=20
-PACKAGECONFIG ??=3D "openssl environment ${@bb.utils.contains('PTEST_ENA=
BLED', '1', 'tests', '', d)}"
+PACKAGECONFIG ??=3D "gnutls environment ${@bb.utils.contains('PTEST_ENAB=
LED', '1', 'tests', '', d)}"
=20
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Denabled,-Dgnutls=3Ddisabled,gnutls=
"
 PACKAGECONFIG[openssl] =3D "-Dopenssl=3Denabled,-Dopenssl=3Ddisabled,ope=
nssl"
--=20
2.34.1


