Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD652CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 15:58:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40181.1779379096404005238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 08:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VC3ggUVg;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92BC32BCB
	for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 08:58:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4972B3F632
	for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 08:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779379095; bh=tYGhomxrasxHhkL7+6iOSrHEz2LlSVQ7pdYoKLygWgE=;
	h=From:To:Subject:Date:From;
	b=VC3ggUVgGgjtlwuBk9MyFIlrUs8CdL4gY/i8AGE3D4fFO59unZeKxu+J5vhu5UuJQ
	 +HQRLDSGzWabgzpTalEXWvJ9+Xi6m7Nwt0QiNsp/U1fSzM7+1g0pDDph2yCDayw2EZ
	 O+D2izhLjM1PXLW9SwpdHudlVsIF1sesSOB7R9Jk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] matchbox-panel-2: backport patch to set a constant size for the clock
Date: Thu, 21 May 2026 16:58:11 +0100
Message-ID: <20260521155811.2554795-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 15:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237517

Measure the size of "88:88" and set an explicit size of the clock label
so that it doesn't slightly move over time as the digits change.

Also update the status of a patch that is upstreamed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-clock-fix-clock-widget-width-resize.patch | 51 +++++++++++++++++++
 ...ts-systray-Allow-icons-to-be-smaller.patch |  2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.12.bb |  1 +
 3 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/matchbox-panel-2/files/0001-applets=
-clock-fix-clock-widget-width-resize.patch

diff --git a/meta/recipes-sato/matchbox-panel-2/files/0001-applets-clock-=
fix-clock-widget-width-resize.patch b/meta/recipes-sato/matchbox-panel-2/=
files/0001-applets-clock-fix-clock-widget-width-resize.patch
new file mode 100644
index 0000000000..b87213aed4
--- /dev/null
+++ b/meta/recipes-sato/matchbox-panel-2/files/0001-applets-clock-fix-clo=
ck-widget-width-resize.patch
@@ -0,0 +1,51 @@
+From 5244e02f14b3b99f60b4d9f90f504f6a7d6f2205 Mon Sep 17 00:00:00 2001
+From: Dmitry Sakhonchik <frezidok1@gmail.com>
+Date: Mon, 18 May 2026 16:21:06 +0300
+Subject: [PATCH] applets/clock: fix clock widget width resize
+
+Previously clock widget used to change its size depending on digits'
+width inside it, which caused other icons in the panel to move.
+
+Fixes [YOCTO #15435]
+
+Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ applets/clock/clock.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/applets/clock/clock.c b/applets/clock/clock.c
+index b8057a4..3065cfc 100644
+--- a/applets/clock/clock.c
++++ b/applets/clock/clock.c
+@@ -73,6 +73,7 @@ mb_panel_applet_create (const char    *id,
+         GtkWidget *label;
+         time_t t;
+         struct tm *local_time;
++        int ref_string_width;
+=20
+         applet =3D g_slice_new0 (ClockApplet);
+=20
+@@ -81,6 +82,17 @@ mb_panel_applet_create (const char    *id,
+=20
+         gtk_widget_set_name (label, "MatchboxPanelClock");
+=20
++        /* Size the widget using the widest possible time string ("88:8=
8") */
++        PangoContext *context =3D gtk_widget_get_pango_context(label);
++        PangoLayout *reference_string =3D pango_layout_new(context);
++
++        pango_layout_set_text(reference_string, "88:88", 5);
++        pango_layout_get_pixel_size(reference_string, &ref_string_width=
, NULL);
++
++        g_object_unref(reference_string);
++
++        gtk_widget_set_size_request(label, ref_string_width, -1);
++
+         g_object_weak_ref (G_OBJECT (label),
+                            (GWeakNotify) clock_applet_free,
+                            applet);
+--=20
+2.43.0
+
diff --git a/meta/recipes-sato/matchbox-panel-2/files/0001-applets-systra=
y-Allow-icons-to-be-smaller.patch b/meta/recipes-sato/matchbox-panel-2/fi=
les/0001-applets-systray-Allow-icons-to-be-smaller.patch
index d13dd3d5a0..870ef8800e 100644
--- a/meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow=
-icons-to-be-smaller.patch
+++ b/meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow=
-icons-to-be-smaller.patch
@@ -8,7 +8,7 @@ systray panel. This makes sure the icons are drawn at the=
 size they
 expect.
=20
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted
+Upstream-Status: Backport [c5f3e42a29a36a12d11007b21904d343dfbd6ad3]
 ---
  applets/systray/systray.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb =
b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
index a126571ade..f4e0000ee0 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
@@ -23,6 +23,7 @@ RCONFLICTS:${PN} =3D "matchbox-panel"
=20
 SRC_URI =3D "git://git.yoctoproject.org/${BPN};protocol=3Dhttps;branch=3D=
master \
            file://0001-applets-systray-Allow-icons-to-be-smaller.patch \
+           file://0001-applets-clock-fix-clock-widget-width-resize.patch=
 \
            "
=20
 EXTRA_OECONF =3D "--enable-startup-notification --enable-dbus"
--=20
2.43.0


