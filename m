Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E88FF8868
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 20:46:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5876.1777322811288408165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 13:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cu3vksce;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CF2C497
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:46:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6CCE43F763
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777322810; bh=mCFuN9XO19jUB89vhcqAobF24+L053sYOdYwLpUnXbA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cu3vksce0vfJQkzBBhz2xvnlbObAdn9rgpOYje616j+Y75Qqk9iy5+k5hroJuAKex
	 A5s9ZPCM4owiC6bdtr2rwi23ttn+NHiok74pjjKvayoUUoeg+DPSRimCWBKv5Dtk3r
	 PgYYlx7AYxWa/pep7EdZxwm5sJfxgaThEiPT81XI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] p11-kit: packaging rewrite
Date: Mon, 27 Apr 2026 21:46:40 +0100
Message-ID: <20260427204640.2003231-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427204640.2003231-1-ross.burton@arm.com>
References: <20260427204640.2003231-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 20:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236024

p11-kit is actually a library, pluggable modules, and some helper tools.

Add new packages -bin -modules and -remote to package up the pieces
separately, and leave just the library in the main package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/p11-kit/p11-kit_0.26.2.bb | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipe=
s-support/p11-kit/p11-kit_0.26.2.bb
index 69fb76658ea..ea636bfb0a8 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://p11-glue.github.io/p11-glue/p11-kit=
.html"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D02933887f609807fbb57aa4237d14=
a50"
=20
-inherit meson gettext pkgconfig gtk-doc bash-completion manpages
+inherit meson gettext pkgconfig gtk-doc bash-completion manpages lib_pac=
kage
=20
 DEPENDS =3D "libffi"
=20
@@ -26,15 +26,22 @@ EXTRA_OEMESON =3D "\
=20
 GTKDOC_MESON_OPTION =3D 'gtk_doc'
=20
-FILES:${PN} +=3D " \
-    ${libdir}/p11-kit-proxy.so \
-    ${libdir}/pkcs11/*.so \
-    ${libdir}/pkcs11/*.la \
-    ${datadir} \
-    ${systemd_user_unitdir}/*"
+PACKAGES =3D+ "${PN}-modules ${PN}-remote"
=20
-# PN contains p11-kit-proxy.so, a symlink to a loadable module
-INSANE_SKIP:${PN} =3D "dev-so"
+FILES:${PN}-bin +=3D "${libexecdir}/p11-kit/trust-extract-compat"
+
+FILES:${PN}-modules =3D "\
+    ${datadir}/p11-kit/modules \
+    ${libdir}/p11-kit-proxy.so \
+    ${libdir}/pkcs11"
+
+# p11-kit-proxy.so, a symlink to a loadable module
+INSANE_SKIP:${PN}-modules =3D "dev-so"
+
+FILES:${PN}-remote =3D "\
+    ${libexecdir}/p11-kit/p11-kit-remote \
+    ${libexecdir}/p11-kit/p11-kit-server \
+    ${systemd_user_unitdir}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.43.0


