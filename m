Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5638DCDB470
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6003.1781960420108963604
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OPXmRGQE;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490a76757e5so18298635e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960418; x=1782565218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIbXinqfT8ZigwvoFH7eK/DpPfNy/hvi5YwDGp9+Pas=;
        b=OPXmRGQEt3wxKL6Ne0Sh0RF07hElJNJsTV8IwE82avJqkiIfm5VsZsYpkueeUdYaM8
         7hn/rPT1/RRVHO6wyAKqN3AkfGEgpcFjN+lDqz1JlIMnaH3sBEg1CFLlF9TeqK2dpPbC
         OmSiVXtw49Ym4qqppwN+a1tbu2PdLYsZ/r9cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960418; x=1782565218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YIbXinqfT8ZigwvoFH7eK/DpPfNy/hvi5YwDGp9+Pas=;
        b=XsYpRKHc4HXjGaxR61PUOciG/GR/Pxc4kgmM7KcJbLRIzz5AsDN2VxWmJDUxlv3HXT
         dFcfGzNgolLaQj2FqUTvLvPGNfepyn4OYcmcSSkvW7MbhtiuBD42bNg6GR4YfgtfJU68
         v8yuzke+BqSsPsuu9LjzJ1nmcMHu9ee+jcdVm7W0J3iTvaujgLYPd3gsWxS+v8CU71MZ
         ybAv0A7fru2QLF/CQBclm/5aF6f2A0VtfmCBaoHaNQRedLaS9aF6crgPr1LKd7OrwDmN
         8UmVWuhvKm4NcQkTtuWDMyl4qTLszaScZm3b9Gh7mHj4Bwo7aNMJjrXgq8QuQhRc69rh
         J40A==
X-Gm-Message-State: AOJu0Yyu4deGjp5xVoJONGMtbo4Hs31/MBfHqAL2xrzxg4zSLnSJkPho
	qnVAeGcYyoB1Vm871+dtYPXlgebl0dLFVkKs2OMxN7PdnC+SHFg1A+akhMGgTlQvyaq7b7fWMxp
	RJg+A
X-Gm-Gg: AfdE7cn4t8vWHfWbx2yuNMnzbxX9xSh7bmKJcAcKFHFQgInAZHwiSQtLTo/x+cDhfhE
	LAUbwLjy84g8kl5LFy85BVYRgsGr8HPQlVXNWyQPnU4BiayEtqe1PYYqYMhQ70ETYDLb+aHCeCm
	JxqTPH1EKtT/dxI7e6cDmxJfMOqtRvEhr6mYeAQRb0u6MRkaAMD0oemrNWvq24eSQ9OJ2LsCkjC
	+ZoDQJ6LPud+Y+S0CR/QubkO1Fsp6Nrei6TKzTtaVn0eXAW2gFAkO95SnCGfAIPMVpaw27vns3i
	JtfrD5s04a7S9Q+dyHPXXFACFa6+WDNZaWiUesYB+sbyPygEKTrr/e5hjLP+cwrg1ay80b5/8x6
	8ktHKdWpxLI/idUCT/iaM6HJF28rLDd3ep4Z4FhrqpCB/Uu3UU6ykb+NKwL5e30zG6GN2OavgMM
	8ZImxxPeon4i+F1NVL8Aqni8k35uLLbMTLEzFDDfOURzx4Ul5JHzGMTlOkWmkr5BZeSq0hq3oLC
	k3CqlBP7fzSHSWmWNLT6AqY1Qk=
X-Received: by 2002:a05:600c:1c09:b0:492:4d56:d5fe with SMTP id 5b1f17b1804b1-4924d56d644mr25464795e9.14.1781960417975;
        Sat, 20 Jun 2026 06:00:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/36] matchbox-panel-2: backport patch to set a constant size for the clock
Date: Sat, 20 Jun 2026 14:59:29 +0200
Message-ID: <bf575b57f5171e94f7d1d6239bbd9edfa3f3f5ea.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239223

From: Ross Burton <ross.burton@arm.com>

Measure the size of "88:88" and set an explicit size of the clock label
so that it doesn't slightly move over time as the digits change.

Also update the status of a patch that is upstreamed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0e59671009931f84e82ebd7c098802d51f581d44)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-clock-fix-clock-widget-width-resize.patch | 51 +++++++++++++++++++
 ...ts-systray-Allow-icons-to-be-smaller.patch |  2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.12.bb |  1 +
 3 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/matchbox-panel-2/files/0001-applets-clock-fix-clock-widget-width-resize.patch

diff --git a/meta/recipes-sato/matchbox-panel-2/files/0001-applets-clock-fix-clock-widget-width-resize.patch b/meta/recipes-sato/matchbox-panel-2/files/0001-applets-clock-fix-clock-widget-width-resize.patch
new file mode 100644
index 00000000000..b87213aed43
--- /dev/null
+++ b/meta/recipes-sato/matchbox-panel-2/files/0001-applets-clock-fix-clock-widget-width-resize.patch
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
+ 
+         applet = g_slice_new0 (ClockApplet);
+ 
+@@ -81,6 +82,17 @@ mb_panel_applet_create (const char    *id,
+ 
+         gtk_widget_set_name (label, "MatchboxPanelClock");
+ 
++        /* Size the widget using the widest possible time string ("88:88") */
++        PangoContext *context = gtk_widget_get_pango_context(label);
++        PangoLayout *reference_string = pango_layout_new(context);
++
++        pango_layout_set_text(reference_string, "88:88", 5);
++        pango_layout_get_pixel_size(reference_string, &ref_string_width, NULL);
++
++        g_object_unref(reference_string);
++
++        gtk_widget_set_size_request(label, ref_string_width, -1);
++
+         g_object_weak_ref (G_OBJECT (label),
+                            (GWeakNotify) clock_applet_free,
+                            applet);
+-- 
+2.43.0
+
diff --git a/meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow-icons-to-be-smaller.patch b/meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow-icons-to-be-smaller.patch
index d13dd3d5a0b..870ef8800e0 100644
--- a/meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow-icons-to-be-smaller.patch
+++ b/meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow-icons-to-be-smaller.patch
@@ -8,7 +8,7 @@ systray panel. This makes sure the icons are drawn at the size they
 expect.
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted
+Upstream-Status: Backport [c5f3e42a29a36a12d11007b21904d343dfbd6ad3]
 ---
  applets/systray/systray.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
index a126571aded..f4e0000ee0e 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
@@ -23,6 +23,7 @@ RCONFLICTS:${PN} = "matchbox-panel"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
            file://0001-applets-systray-Allow-icons-to-be-smaller.patch \
+           file://0001-applets-clock-fix-clock-widget-width-resize.patch \
            "
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"

