Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB350C982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 19:23:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23290.1789586626488091435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 12:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=A3ByH32E;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07EEE1516
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:23:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 237A03F86F
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789586625; bh=kIzzAxdATACvSiUSk/8Ug4LmCrxxo72fRFOH02eYHgQ=;
	h=From:To:Subject:Date:From;
	b=A3ByH32ENUjmVZSWXJezh9ALwtpvUE6ZJWLkqYt80Kq0N+vd35ywP6BYLSVPhbNCY
	 AxhlWeSvOQ1G4L+I4C5VP43clsdQwW3w7ZeqCeQYBCH0IuiGuYnkBgEVeq+Wprif7a
	 Sl5RYjQmiDoDTNinpNtdolpShtpC4b6kjQbBhZNE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gobject-introspection: disable tests
Date: Wed, 16 Sep 2026 20:23:39 +0100
Message-ID: <20260916192339.640456-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 19:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245993

We don't run the tests so there's no point in building them, and this
also means we can make the floating cairo dependency which is only used
by the tests disabled explictly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gobject-introspection/gobject-introspection_1.86.0.bb     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.86.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspec=
tion_1.86.0.bb
index 91525f99b79..b03a9cf4156 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86=
.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86=
.0.bb
@@ -39,9 +39,11 @@ export B
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[doctool] =3D "-Ddoctool=3Denabled,-Ddoctool=3Ddisabled,pyt=
hon3-mako,"
=20
+EXTRA_OEMESON =3D "-Dtests=3Dfalse -Dcairo=3Ddisabled"
+
 # Configure target build to use native tools of itself and to use a qemu=
 wrapper
 # and optionally to generate introspection data
-EXTRA_OEMESON:class-target =3D " \
+EXTRA_OEMESON:append:class-target =3D " \
     -Dgi_cross_use_prebuilt_gi=3Dtrue \
     -Dgi_cross_binary_wrapper=3D${B}/g-ir-scanner-qemuwrapper \
     -Dgi_cross_ldd_wrapper=3D${B}/g-ir-scanner-lddwrapper \
--=20
2.43.0


