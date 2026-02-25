Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B57FD375C
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:37:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44124.1772023052637111406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B66C81691
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 04:37:25 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE45C3F59E
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 04:37:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] lzop: improve aclocal.m4 handling
Date: Wed, 25 Feb 2026 12:37:24 +0000
Message-ID: <20260225123727.2043715-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225123727.2043715-1-ross.burton@arm.com>
References: <20260225123727.2043715-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 12:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231964

This upstream has a hand-maintained aclocal.m4 which we don't want to
delete (autotools.bbclass does this).  For some reason this was worked
around by shipping a copy of aclocal.m4 as acinclude.m4 and dropping
that into the build tree.

A better solution is to just exclude aclocal in EXTRA_AUTORECONF, which
has the side-effect of not removing the file.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/lzop/lzop_1.04.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/lzop/lzop_1.04.bb b/meta/recipes-suppor=
t/lzop/lzop_1.04.bb
index c32aa534228..57c2190cf40 100644
--- a/meta/recipes-support/lzop/lzop_1.04.bb
+++ b/meta/recipes-support/lzop/lzop_1.04.bb
@@ -12,15 +12,12 @@ LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
                     file://src/lzop.c;beginline=3D5;endline=3D21;md5=3D2=
3d767de7754eb24b9e900b025cf7fc8"
=20
-SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz \
-           file://acinclude.m4 \
-          "
+SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz"
 SRC_URI[sha256sum] =3D "7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe177=
4d95147f305a2f41"
=20
 inherit autotools
=20
-do_configure:prepend () {
-    install -Dm 0644 ${UNPACKDIR}/acinclude.m4 ${S}/acinclude.m4
-}
+# Ensure we don't delete the shipped aclocal.m4
+EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


