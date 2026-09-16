Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE310C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 14:12:48 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16032.1789567964913580688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 07:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=DoW3sJTj;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id 327E9E721
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 16:12:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.21]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6qNI-3CUHke0; Wed, 16 Sep 2026 16:12:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] gtk4: upgrade 4.22.5 -> 4.24.0
Date: Wed, 16 Sep 2026 16:12:29 +0200
Message-ID: <20260916141229.483396-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789567957-AFFFC9BC-67995155/0/0 CLEAN NORMAL
X-TOI-MSGID: aae5662a-6cb6-48b4-bbbd-5ce93e19bcf4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789567962; i=f_l_k@t-online.de;
	bh=P5PH6CncISnnzVYQePMia7h+7DJy4C8z9B7AFvZjqks=;
	h=From:To:Subject:Date;
	b=DoW3sJTjtccR/Nt+Bz6um266dfQGYxj4qOF34Dx3WLlRvHzJ4L0jPDRQRKqtn+/ty
	 E+UuxYeIoSmhNJz+X4dWew+7tEdqSS+rfFUrl8Goz7vrcK0Qty6ttPwUtSWVJeu5f3
	 vdFhEuD+Q6MfFt0d4V2we2Mn/q2tph/K2p5FvOnScOa/r6r258vWel059myPKwDNnu
	 R8nv0P5JsIjmuwENtGTFcmg8tAKBjxBhP5ZqOkYHx02hDWebS8ONWeML9R6Jn1C3Rl
	 7uqHNZEAdtzJHZTFA8t2nxLT0CCYj3gSB/bkFFvQIAu6mutQ4ChcD+/00hz8BiDPnq
	 5An/pPncIhSFA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245976

Needs glib-2.0 >=3D 2.89.3, which the 2.90.0 upgrade provides.

gtk/svg is new in this release and is built as a meson unity target.
Meson implements unity builds by generating a source file that #includes
the real sources by absolute path, and that file is part of the debug
information of libgtk_svg, so it lands in gtk4-src carrying the path of
the build tree:

    File /usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0=
.c
    in package gtk4-src contains reference to TMPDIR [buildpaths]

Rewrite the paths in the generated file the way -ffile-prefix-map
rewrites them for the compiler, so they name where the sources are
installed rather than where they were built. The rewriting happens at
packaging time, after the file has been compiled.

Dropping the unity build is not an option: the sources rely on being a
single translation unit and do not compile individually.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gtk+/{gtk4_4.22.5.bb =3D> gtk4_4.24.0.bb}          | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.22.5.bb =3D> gtk4_4.24.0.bb} (86%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.24.0.bb
similarity index 86%
rename from meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.24.0.bb
index 5d7385d29a..2d5a2c57cd 100644
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
@@ -80,6 +80,16 @@ CFLAGS +=3D "-Wno-error=3Dint-conversion"
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
+gtk4_rewrite_unity_sources() {
+	find ${B} -name '*-unity*.c' -exec sed -i -e 's|${B}|${TARGET_DBGSRC_DI=
R}|g' -e 's|${S}|${TARGET_DBGSRC_DIR}|g' {} +
+}
+PACKAGE_PREPROCESS_FUNCS +=3D "gtk4_rewrite_unity_sources"
+
 FILES:${PN}:append =3D " \
     ${datadir}/bash-completion \
     ${datadir}/gtk-4.0/emoji/ \
--=20
2.55.0


