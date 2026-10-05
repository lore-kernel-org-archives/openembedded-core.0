Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C27CA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 10:29:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17091.1791196140405312029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 03:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=j35EoHSB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45C0E152B
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Oct 2026 03:28:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4741E3F763
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Oct 2026 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791196139; bh=SoAvKs8IbbOqqRxTVzUFJzF3wRtEV2zNlnngCjHxp6w=;
	h=From:To:Subject:Date:From;
	b=j35EoHSBr1gmZEzJe9zHgUIZOVepRoD3tUHUcL1RMgSrl2c+pKST49CtKHvrBmR5C
	 HZSLIjgiqsZtsm+4emYNiO3CafVxWA9hJ2N/w0bDrhbM1MmsR7I0fqNjAnvSWVyBFK
	 mSxlhIMQu9eUwU23l4OmDCycQ0pYTI5uhklf53rQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gtk4: upgrade 4.22.5 -> 4.24.0
Date: Mon,  5 Oct 2026 11:28:55 +0100
Message-ID: <20261005102855.1214076-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 10:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247237

Hightlights from the upstream release notes:

* GtkSvgWidget is a widget to display SVG, with some support for
  interactive aspects of SVG

* Wayland:
 - Version 3.2 of the text protocol is supported
 - xdg-session-management-v1 is used

* GSK:
 - A number of 10bit image formats are supported
 - We are now using clip masks to reduce the number of offscreens

* The gtk4-encode-symbolic tool for producing symbolic png icons has
  been dropped.

* Snapping: GTK can now snap contents to device pixel boundaries,
  for better control of rendering with fractional scales

* GTK now respects the reduced motion setting in various places
  and avoids animations (GtkSpinner, GtkStack, GtkRevealer)

* New GtkShortcutTrigger functions it easier to handle synonymous
  keys (in particular keypad keys).

* Type-to-search (in particular interaction with input methods)
  has been redone, switching from a "pull" to a "push" approach.

* The first part of ongoing frameclock work has landed, improving
  our ability to deliver frames on time

* GTK supports the ext-background-effect Wayland protocol to allow
  blurred background behind windows

* The visible focus timeout can be changed with the new
  gtk-keyboard-focus-visible-timeout setting

* The GDK frameclock has been reworked to improve precision and reduce
  frame drops

Add a hook to rewrite the content of the meson-generated unity sources,
as these contain absolute build paths.  Manipulate the file during the
packaging process so that the actual build tree isn't altered, meaning
rebuilds are not affected.

Based on work by Markus Volk <f_l_k@t-online.de>.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gtk+/{gtk4_4.22.5.bb =3D> gtk4_4.24.0.bb}          | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.22.5.bb =3D> gtk4_4.24.0.bb} (85%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.24.0.bb
similarity index 85%
rename from meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.24.0.bb
index cf0ea114e08..08fd2c30b7c 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.24.0.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM =3D " \
     file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19=
d29fb2 \
 "
=20
-SRC_URI[archive.sha256sum] =3D "7fd725deb2cb3f8dc218ad862c5056ff8548f49d=
3b0e4081796e444c22d19686"
+SRC_URI[archive.sha256sum] =3D "28ba4ac1c04f86eac09b79a163cb163a4c2b5444=
2d9f7eccc04679062a581044"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
@@ -76,6 +76,16 @@ PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=
=3Ddisabled, vulkan-loader vulka
=20
 LIBV =3D "4.0.0"
=20
+# gtk/svg is built as a unity target, and meson implements that by gener=
ating a
+# source file that #includes the real sources by absolute path. That gen=
erated
+# file is part of the debug information and lands in the -src package, s=
o give
+# it the same rewriting that -ffile-prefix-map does for the compiler. Ot=
herwise
+# the build directory leaks into the package and buildpaths QA rejects i=
t.
+rewrite_unity_sources() {
+	find ${PKGD}/${TARGET_DBGSRC_DIR} -name '*-unity*.c' -exec sed -i -e 's=
|${B}|${TARGET_DBGSRC_DIR}|g' -e 's|${S}|${TARGET_DBGSRC_DIR}|g' {} +
+}
+PACKAGESPLITFUNCS =3D+ "rewrite_unity_sources"
+
 FILES:${PN}:append =3D " \
     ${datadir}/bash-completion \
     ${datadir}/gtk-4.0/emoji/ \
--=20
2.43.0


