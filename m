Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8FAD3ABDF
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:13:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.66245.1731348826937314647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C8771480
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:14:16 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3C1B3F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:13:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] cairo: disable some features explicitly
Date: Mon, 11 Nov 2024 18:13:33 +0000
Message-Id: <20241111181341.3296523-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206967

These are disabled out of the box but only because the dependencies are
not present. Explicitly disable them to be clear.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/cairo/cairo_1.18.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/cairo/cairo_1.18.2.bb b/meta/recipes-g=
raphics/cairo/cairo_1.18.2.bb
index 12aeb431d0d..65ee3102120 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.2.bb
@@ -57,6 +57,8 @@ PACKAGECONFIG[xcb] =3D "-Dxcb=3Denabled,-Dxcb=3Ddisable=
d,libxcb"
 # cairo-trace is GPLv3 so add an option to remove it
 PACKAGECONFIG[trace] =3D ""
=20
+EXTRA_OEMESON =3D "-Dsymbol-lookup=3Ddisabled -Dspectre=3Ddisabled -Dtes=
ts=3Ddisabled"
+
 do_install:append () {
     if ! ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'true', 'false',=
 d)}; then
         rm ${D}${bindir}/cairo-trace ${D}${libdir}/cairo/libcairo-trace.=
so
--=20
2.34.1


