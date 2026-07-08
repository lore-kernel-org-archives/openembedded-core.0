Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22455C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 17:37:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14389.1783532220220754929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 10:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=A6E+CGxG;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 720DB1756
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 10:36:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D0AB3F905
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 10:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783532219; bh=eyu6hSZw0TeuMKUuSz2RB9V38U8JBjk2dO36girSUVk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=A6E+CGxGlqplfBWo3PrYPrAsMLrsbCPFMa8SWl13YPAqN/gQr1xGB3Oqasn6NFZlH
	 2pOkUOgJVpnk1W7Wr9xwyjhwt2AZ82JCu0mZTR7KprmFQW29E74AsCPyIoRPBIWiev
	 2/1szf3V877xfX9ruxbtMLcBtdudTDotpesNbOBw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] glibc: only inherit init script classes if nscd is enabled
Date: Wed,  8 Jul 2026 18:36:50 +0100
Message-ID: <20260708173651.1435387-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708173651.1435387-1-ross.burton@arm.com>
References: <20260708173651.1435387-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 17:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240502

As nscd is the only part of glibc that uses init scripts, we can use
inherit_defer to only pull systemd or update-rc.d into the build if nscd
has actually been enabled.

As systemd-systemctl-native has non-trivial dependencies (such as
python3-native), this can help reduce rebuilds of glibc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
index 7403eb845a..d46c31593d 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -9,7 +9,10 @@ HASHEQUIV_HASH_VERSION .=3D ".1"
=20
 PROVIDES =3D "virtual/libc"
 PROVIDES +=3D "virtual/libintl virtual/libiconv"
-inherit autotools texinfo systemd update-rc.d
+
+inherit autotools texinfo
+
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'nscd', 'systemd upd=
ate-rc.d', '', d)}
=20
 LEAD_SONAME =3D "libc.so"
=20
--=20
2.43.0


