Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C55CA600B
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 10:30:57 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12777.1791455453415916091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 03:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fris.de header.s=mail header.b=AkFpxI/r;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791455450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AxGTqlFi8UNhabvSnfrxXaXpuTpfE1hRNzQuMZMWQr8=;
	b=AkFpxI/rjfklAQLM8dpJvqTYLWLmTuYDrJdiEojibIbmE0YoQ0R7MxpTClCgv9c+d4bD9b
	xEvScOrsSrQDZ4mf+Uu2idckUpOrW2vNcF6A5UjvrwdphUGeRReUPDgFGDQQvgbzynBA3l
	3/RSXGjYBLtaqO+gTQm9kQUmzFBsoPNlbrMCSRAv+RUA28uV2W4jj7Dz++olpm5ctr4iS4
	ssIlGmDtaEqcWgOIG10Ci26ja0CHrAChOgH6pHv836Hc6pWrTCWpR+9IOpE9I3qVSpGT/R
	sKfrzTcI2tOTzedeEXtFSj6sFj5tfD/6zye7uRZyedxIiEzQMcqYgRZcrJblDw==
To: openembedded-core@lists.openembedded.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [wrynose][PATCH v2] weston: fix VNC backend build with aml 1.0
Date: Thu,  8 Oct 2026 12:30:47 +0200
Message-ID: <20261008103047.2786980-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 10:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247427

From: Frieder Schrempf <frieder.schrempf@kontron.de>

meta-oe's aml 1.0 installs aml1.pc, but weston 15 looks for aml 0.3.x, so
enabling the vnc PACKAGECONFIG fails at configure time. Backport the aml
part of the upstream fix from weston 16 and add aml to the vnc
dependencies, as weston uses it directly.

Tested by building weston with PACKAGECONFIG vnc for ARMv7.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* Add missing Signed-off-by in patch file
---
 .../weston/0001-backend-vnc-Use-aml-v1.patch  | 24 +++++++++++++++++++
 .../recipes-graphics/wayland/weston_15.0.0.bb |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-backend-vnc=
-Use-aml-v1.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-am=
l-v1.patch b/meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-am=
l-v1.patch
new file mode 100644
index 0000000000..c752a2b362
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-aml-v1.pa=
tch
@@ -0,0 +1,24 @@
+From: Frieder Schrempf <frieder.schrempf@kontron.de>
+Subject: [PATCH] backend-vnc: Use aml v1
+
+aml 1.0 installs aml1.pc and neatvnc already uses it. Only the aml part
+of the upstream commit is taken, as the rest needs Neat VNC 1.0.
+
+Upstream-Status: Backport [partial, https://gitlab.freedesktop.org/wayla=
nd/weston/-/commit/8a1c91e7]
+Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
+---
+ libweston/backend-vnc/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/backend-vnc/meson.build b/libweston/backend-vnc/m=
eson.build
+--- a/libweston/backend-vnc/meson.build
++++ b/libweston/backend-vnc/meson.build
+@@ -8,7 +8,7 @@ if not dep_neatvnc.found()
+ 	error('VNC backend requires neatvnc which was not found. Or, you can u=
se \'-Dbackend-vnc=3Dfalse\'.')
+ endif
+=20
+-dep_aml =3D dependency('aml', version: ['>=3D 0.3.0', '< 0.4.0'], requi=
red: false, fallback: ['aml', 'aml_dep'])
++dep_aml =3D dependency('aml1', version: ['>=3D 1.0.0', '< 2.0.0'], requ=
ired: false, fallback: ['aml', 'aml_dep'])
+ if not dep_aml.found()
+ 	error('VNC backend requires libaml which was not found. Or, you can us=
e \'-Dbackend-vnc=3Dfalse\'.')
+ endif
diff --git a/meta/recipes-graphics/wayland/weston_15.0.0.bb b/meta/recipe=
s-graphics/wayland/weston_15.0.0.bb
index da347659f1..3f9fff51fd 100644
--- a/meta/recipes-graphics/wayland/weston_15.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_15.0.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd79ee9e66bb0f9=
5d3386a7acae780b70 \
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/weston/-/releases/${=
PV}/downloads/${BPN}-${PV}.tar.xz \
            file://0001-vulkan-renderer-guard-surface-output-creation-wit=
h-b.patch \
            file://0001-gl-shaders-Remove-asserts-relying-on-shader-compi=
ler.patch \
+           file://0001-backend-vnc-Use-aml-v1.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
@@ -98,7 +99,7 @@ PACKAGECONFIG[image-jpeg] =3D "-Dimage-jpeg=3Dtrue,-Dim=
age-jpeg=3Dfalse, jpeg"
 # screencasting via PipeWire
 PACKAGECONFIG[pipewire] =3D "-Dbackend-pipewire=3Dtrue,-Dbackend-pipewir=
e=3Dfalse,pipewire,pipewire"
 # VNC remote screensharing
-PACKAGECONFIG[vnc] =3D "-Dbackend-vnc=3Dtrue,-Dbackend-vnc=3Dfalse,neatv=
nc libpam"
+PACKAGECONFIG[vnc] =3D "-Dbackend-vnc=3Dtrue,-Dbackend-vnc=3Dfalse,neatv=
nc aml libpam"
 # Perfetto performance analysis support
 PACKAGECONFIG[perfetto] =3D "-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,libper=
fetto"
=20
--=20
2.55.0


