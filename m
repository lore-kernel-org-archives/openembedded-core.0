Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6E5CD4F25
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 13:54:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75988.1778594053356910475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 06:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dJTMVyE3;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72961302A
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:54:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F19D3F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778594052; bh=FFFtm0HnlasH4P6AdtvNvmwb1Yxy3GKgSh8ZsnnVd6U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dJTMVyE3eYpRFB2Pcfe39pZO71wa7wM357GSZr1KC0+k3PBqW/lgyUFbmsEdqNcT6
	 wUEKE1rM5+ESAmomoGhCtuW/CLr4+Z3sGTbwRd11x14O1/xbxFPQQRQAPIYfPr6+hT
	 NJdAHsc0GvzV//2N0HXjuT80r8HCoHyWjdfIEx/E=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] librsvg: remove obsolete .la deletion
Date: Tue, 12 May 2026 14:54:04 +0100
Message-ID: <20260512135407.3056055-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512135407.3056055-1-ross.burton@arm.com>
References: <20260512135407.3056055-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 13:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236884

librsvg is built with Meson now, so there's no need to delete .a or .la
files that don't exist.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.61.3.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.61.3.bb
index 1375fcae509..be72b1a1491 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
@@ -68,11 +68,6 @@ PACKAGECONFIG[gdkpixbuf] =3D "-Dpixbuf-loader=3Denable=
d,-Dpixbuf-loader=3Ddisabled,gdk
 PACKAGECONFIG[vala] =3D "-Dvala=3Denabled,-Dvala=3Ddisabled"
 PACKAGECONFIG[apitest] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
=20
-do_install:append() {
-	# Loadable modules don't need .a or .la on Linux
-	rm -f ${D}${libdir}/gdk-pixbuf-2.0/*/loaders/*.a ${D}${libdir}/gdk-pixb=
uf-2.0/*/loaders/*.la
-}
-
 do_compile_ptest_cargo:prepend() {
     # The packageconfig is for meson, but the rust tests are compiled di=
rectly with cargo,
     # so these arguments don't apply. Note that this is Python, the inte=
ndation is intentional.
--=20
2.43.0


