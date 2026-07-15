Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C0AC44517
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6664.1784124315920858858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=IrZ75Tw5;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52BEA1477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A9E43F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124316; bh=xq24es7QEoCNTQ1NChSvKDiY4X6PTCo0eZB4K3LfdLU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IrZ75Tw5H9oVVJJn1yNjdRx9h7TnoaCD0cDIgUfq23YpwT0bEyTrPZp6dmCcJ8EOl
	 CYwK70HgonoCxRh8Sf7SvIKA+x60wobCgY1bF2hH0aRooc5Gl2O0CnVUmbGFSrVP7S
	 V8uOGHdFYYmEFUsMtTOnzkKjkewEx6Tw0hqDYu5s=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/12] xorg-app-common: add builder class variable
Date: Wed, 15 Jul 2026 15:05:00 +0100
Message-ID: <20260715140507.2329605-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240964

Add a variable XORGBUILDCLASS to control which builder class is used.

Defaults to autotools for no change, but this lets recipes switch to
Meson if they can.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/xorg-app-common.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/re=
cipes-graphics/xorg-app/xorg-app-common.inc
index 5dbe8abe862..23a526413ad 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -11,6 +11,9 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
 SRC_URI_EXT =3D "bz2"
 SRC_URI =3D "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.${SRC_URI_EX=
T}"
=20
-inherit autotools pkgconfig features_check
+XORGBUILDCLASS ??=3D "autotools"
+inherit_defer ${XORGBUILDCLASS}
+
+inherit pkgconfig features_check
=20
 FILES:${PN} +=3D " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
--=20
2.43.0


