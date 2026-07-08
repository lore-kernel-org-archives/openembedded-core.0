Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B388C44508
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 17:37:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14022.1783532219264483929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 10:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ECeLFnXO;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43B9A1756
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 10:36:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 41E0F3F905
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783532218; bh=k6JiRLWhImasv0afZRiHfCADQd4QmNnob5o46beI8uw=;
	h=From:To:Subject:Date:From;
	b=ECeLFnXOhH/YykpO8sOWfxwIZ89kCurdzUAU8DUOQ2fnXpraBWwut1p9AMmhCie70
	 FQcCPlSWK0BH0zxq353Vj7efRAgqvj/zWQk4lAgF9DmTq14UyMFElnhuC8uVGoKVHr
	 DzP6xUPbNvK379IqX4mPQUQjbKFd2PI9FdDTccJA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] glibc: inherit update-rc.d
Date: Wed,  8 Jul 2026 18:36:48 +0100
Message-ID: <20260708173651.1435387-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 17:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240500

The nscd package has an init script, so we should be inheriting the
update-rc.d class like we inherit the the systemd class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 3 +++
 meta/recipes-core/glibc/glibc.inc         | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
index 21f2200d19..d4941a21a1 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -297,3 +297,6 @@ CONFFILES:nscd =3D "${sysconfdir}/nscd.conf"
=20
 SYSTEMD_PACKAGES =3D "nscd"
 SYSTEMD_SERVICE:nscd =3D "nscd.service"
+
+INITSCRIPT_PACKAGES =3D "nscd"
+INITSCRIPT_NAME =3D "nscd"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
index 3bb935e223..7403eb845a 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -9,7 +9,7 @@ HASHEQUIV_HASH_VERSION .=3D ".1"
=20
 PROVIDES =3D "virtual/libc"
 PROVIDES +=3D "virtual/libintl virtual/libiconv"
-inherit autotools texinfo systemd
+inherit autotools texinfo systemd update-rc.d
=20
 LEAD_SONAME =3D "libc.so"
=20
--=20
2.43.0


