Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C151ECD37AC
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8237.1778224350001157924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sL4vTUFe;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44509921fbcso891884f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224348; x=1778829148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUnuLVnmzVfJIJZkedIW89ARFRRG+q7lAXES07DMjCM=;
        b=sL4vTUFeV96NYIRl58PWtqyw26Q0c/B4/XKjyohSEZVReQhBjugztrU/h14Oe+VX+I
         Cow21FjhcrKkjqIUqOZ2Wn2yEWVYhWSgcivpdnqFmTYEs2OcMZ6V/J9ntdQpPixog2H0
         WYYwjbPqtpOB3VGF48lkjp9cAs5Ko7JQlqboM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224348; x=1778829148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iUnuLVnmzVfJIJZkedIW89ARFRRG+q7lAXES07DMjCM=;
        b=pK+O63UJmR9ocit3y1j9y28yv40vTX1BUY2wasjGCsuHSgEjX5+P7LGeBQvLg/5h/y
         b/gs963P94+oY2vSnkfMNXrYNtpG5g5nRGfXA6wWQ50+ODjf5fkF21Pe+BrGlj+V1p7T
         lslfwdw7Gj6e/r9L/GFZDjIW655euO/LSy7pXzg6y8k/h3anYo4j6BpNT3B5Agu81Xz4
         rpmtA98wi/nxMGKN4DAXkgsKGX9l7eqlJoraXnuTeq+i0ioARHoFMpSqxdjpPa0kBU0r
         PwVHZ++uGWK4O6A3vrYtuELrACk838bBzxl6kqC5tJ82T8o0U72ix1c04dT2lnFmJbVA
         /JqA==
X-Gm-Message-State: AOJu0YyqRblEYkKOE6qvydxzS2RdL9P+wuygkOoJrkkPTVBA36UTYS/v
	25/MZ+/Tgxa+JnYaY4YiSjRPiiYPv5GAliDrYU/cygz2vM8A+jICGGWacp22gMCl+ow22/A5Dqy
	JvAUUpDM=
X-Gm-Gg: Acq92OEymKvLQpDm5w7MbAg7yi3oYkErIpSpTImOP0uq9hSPQ4iDFzgFKP7DhWQqOH0
	PPIcc0t7k4vRMdDdjbY161XVZra6xMukdjCtRzXyOKn0zo4SLsaLBGSm8DMD8/wHHeSDyo7hgTT
	FFz1QfC5ubbA70FQbTB0N6zEfq6LfnZUk0kYCCnxapTbZIvww58dPs8YtKgPN8Bg2WYm/N4adIY
	WPsL0bt6dC06vDmISCiMnLelkaR1yW5E0WgZN4XXxt7iDn2hCrTOJw0U+5l4JTdxVwybJ6V5ig0
	r0edk0lkC2rQ6Fwh+9ppA+fHjE2VFQxlrRZ8w7bZYesdG00JfpXZntnYM5ybTNabXdau/pS3cWa
	Xb4z2qhPgzxIbXEKDH7nV/LGuFMt+8q1oy18j+CUhcGr+UE6RqDNjonCVRqweh4Huok0D7XlvE6
	Mz8FOlXtrGMoU2QtGvrB7XEyFIqAK40IMhHsav8YHRf1JwyDWLFKitvwf4U6lZzKaMd9v0zhyul
	wFO90uQLJu2ZcE52mR6ukG95LY=
X-Received: by 2002:a05:6000:3107:b0:44a:2cb3:b633 with SMTP id ffacd0b85a97d-4515b5240dbmr18176832f8f.12.1778224347988;
        Fri, 08 May 2026 00:12:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/52] gtk+3: upgrade 3.24.51 -> 3.24.52
Date: Fri,  8 May 2026 09:11:17 +0200
Message-ID: <61187cff91740a4faaf8b2a1252a7fa2229bb7cd.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236666

From: Wang Mingyu <wangmy@fujitsu.com>

* Bugs fixed:
  - #6306 [GTK3] Zlib required when broadway is enabled.
  - #7796 [GTK 3] Invalid a11y events when calling `gtk_tree_view_set_cursor` on
    an unfocused GtkTreeView
  - #7976 Firefox crashes at gdk_wayland_drag_context_manage_dnd() when missing
    toplevel wl_surface
  - #8103 gtk3 refresh_rate calculation overflows on 32-bit targets
  - #8114 Images for recolored icons are constantly being reloaded
  - GNOME/gimp#14901 Wild strobing in multi window mode
  - GNOME/gimp#15480 GIMP does not focus on dialogue boxes on Mac
  - !7332 quartz: add automagic uti<->mime conversion for clipboard
  - !8216 Fix position of child tooltips in GTK3 custom windows
  - !9005 a11y: Don't send focus-related events for unfocused treeview
  - !9012 quartz: gtkwindow - fix windows fighting focus
  - !9022 gtkmenu: Await more motion events before deactivating on release
  - !9044 wayland: Handle XKB initialization failures gracefully
  - !9067 gdk/win32: Add missing EGL conditional compilation guard
  - !9098 gdk: do not run gdk_wayland_window_export_handle() callback when
    window is already destroyed.
  - !9119 Declare an explicit dependency on zlib when broadway is enabled
  - !9141 [GTK 3] wayland: Try to open the display even if XDG_RUNTIME_DIR is
    unset
  - !9155 [gtk3] emoji: Update data to CLDR 48
  - !9214 display/wayland: Gracefully handle dispose being called twice
  - !9284 gdk/wayland: Map stylus buttons for BTN_BACK and BTN_FORWARD (Peter
    Hutterer)
  - !9322 [Quartz] Fix dialog keyboard focus while preventing focus fighting
  - !9344 Fix a couple of leaks
  - !9394 gdk/wayland: Map stylus buttons for BTN_BACK and BTN_FORWARD
  - !9397 wayland: Avoid a crash
  - !9600 Replace outdated freedesktop.org Window Manager spec links
  - !9676 x11: fix overflow in refresh_rate calculation on 32-bit systems
  - !9706 cssimage: Store and reuse icon info for recolored images
  - !9707 wayland: Fix uninitialized value when no cursor
  - !9708 fontchooser: Fix signedness of axes count
  - !9709 fontchooser: Remove const on float return values
  - !9710 print: Remove unused variable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 015d6e1565effccabc427b75912c114216870cef)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.51.bb => gtk+3_3.24.52.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.51.bb => gtk+3_3.24.52.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
index 51a293c1d8e..1fcc08443d9 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
@@ -22,7 +22,7 @@ inherit gettext gnomebase gtk-doc update-alternatives gtk-immodules-cache gsetti
 SRC_URI += "\
            file://opengl.patch \
            "
-SRC_URI[archive.sha256sum] = "0013877c6bd23c2dbe42ad7c70a053d0e449be66736574e37867c49c5f905a4f"
+SRC_URI[archive.sha256sum] = "80931fa472a77b9a164f6740e3c0b444fac6770054632d35a7ff9d679e5e7b9f"
 
 BBCLASSEXTEND = "native nativesdk"
 

