Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEB3C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:28 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.4539.1661294187637940017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ygkt1Hgb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so16151643pjl.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=hC4j7jjOuKgWKTka8PiasHatNLZWdrC4xVflWW4Rgeg=;
        b=Ygkt1HgbSZK/SUc9F5fimDFBXrX39+cbPkhLdqxhsEy9aodbIFD0MPxUevNh5CBxmX
         Ja5plCISEl1wzS9bLH6XwCbOVbdHpRnZR2gjBS6H/jE/ylEqf/DZAJUAJ4MEGPgaa6i4
         4q+z7bpgjUUERcO6pgfx2g+CGjLtiJAJPEIA/Gx8x3vckiKZrkzK7FQ+6/wN/f4SHgJ+
         T2BAZkDzTIjgLpWphgBuYICAIPjMlEgsg/UWBLskVqtZZXeH2V2Ld1ahMoKwh6bN6Zfi
         sXrYJSfSHKuEMy1yAoBpmKW6pj5Ts3Fr8BbMExdjzbDHQId12QiM3bDJKjuSjorVy3ud
         PmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=hC4j7jjOuKgWKTka8PiasHatNLZWdrC4xVflWW4Rgeg=;
        b=tLZD6TanH3LR4Hp009WTJcgIUHpor+ZnAERET2sPKtg0f+HkcuAmHk3Kn7yfGFO1I/
         arhZ/1JVClXi0O4jKXPYLXm1Hqg4vnwumrJMES/13/VmWTUJ5G3KDJB2TYmdjMLA7rY6
         e4bhAoMfiqt+bV8nANRaPIdO17DKn8S4EPiPBBidOctvhzlgNZw13qYgpYZcuXac1NoO
         IjZaVShJ4ICBLBTf/XJPlpMPVWxPB9vyozFLiyU6xOk/5HEqpuI6RlofVIeKXzTaO1AR
         mdaGb3TSJ5TBItjpXasUYY36QstqZoTDQbHPCaF9J5HOdKiZPq53Kd9xFAZCeAHu6Icy
         GrUg==
X-Gm-Message-State: ACgBeo3gcoqjmiY2xznlpsILNn64kcsJ15eme3LUN99rBrjtWqmvVGfV
	lrXlcG1RcaI1mxx694zIOuTehyo0/R5xfn4N
X-Google-Smtp-Source: 
 AA6agR4E9ME1wSJ75sDksH3ZggOtWOJKGdFKSq/wZwXQGWihr9R6zTxkl/Hwt3M7QFwCUHNi2BxkJQ==
X-Received: by 2002:a17:902:d4c4:b0:170:9fdb:4a2a with SMTP id
 o4-20020a170902d4c400b001709fdb4a2amr25198167plg.137.1661294186616;
        Tue, 23 Aug 2022 15:36:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/28] weston: upgrade 10.0.1 -> 10.0.2
Date: Tue, 23 Aug 2022 12:35:30 -1000
Message-Id: 
 <457900220ca6bfbda8b3e7485bac3c0c92d05a7f.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169750

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is a bugfix release

Full commit history below.

Daniel Stone (1):
      tests: Use test-desktop-shell for devices-test

Pekka Paalanen (1):
      tests: preserve ivi runner section

Simon Ser (1):
      build: bump to version 10.0.2 for the point release

Drop dont-use-plane-add-prop.patch as issue is fixed elsewhere
(see the link in the patch).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed54ef8f094fb6759316781a5ac626af40ad8ffc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../weston/dont-use-plane-add-prop.patch      | 32 -------------------
 .../{weston_10.0.1.bb => weston_10.0.2.bb}    |  4 +--
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
 rename meta/recipes-graphics/wayland/{weston_10.0.1.bb => weston_10.0.2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch b/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
deleted file mode 100644
index 1ac0695222..0000000000
--- a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ece4c3d261aeec230869c0304ed1011ff6837c16 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 12 Sep 2020 14:04:04 -0700
-Subject: [PATCH] Fix atomic modesetting with musl
-
-atomic modesetting seems to fail with drm weston backend and this patch fixes
-it, below errors are seen before weston exits
-
-atomic: couldn't commit new state: Invalid argument
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/issues/158]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- libweston/backend-drm/kms.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libweston/backend-drm/kms.c b/libweston/backend-drm/kms.c
-index 780d007..9994da1 100644
---- a/libweston/backend-drm/kms.c
-+++ b/libweston/backend-drm/kms.c
-@@ -1142,8 +1142,8 @@ drm_pending_state_apply_atomic(struct drm_pending_state *pending_state,
- 		wl_list_for_each(plane, &b->plane_list, link) {
- 			drm_debug(b, "\t\t[atomic] starting with plane %lu disabled\n",
- 				  (unsigned long) plane->plane_id);
--			plane_add_prop(req, plane, WDRM_PLANE_CRTC_ID, 0);
--			plane_add_prop(req, plane, WDRM_PLANE_FB_ID, 0);
-+			//plane_add_prop(req, plane, WDRM_PLANE_CRTC_ID, 0);
-+			//plane_add_prop(req, plane, WDRM_PLANE_FB_ID, 0);
- 		}
- 
- 		flags |= DRM_MODE_ATOMIC_ALLOW_MODESET;
diff --git a/meta/recipes-graphics/wayland/weston_10.0.1.bb b/meta/recipes-graphics/wayland/weston_10.0.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/weston_10.0.1.bb
rename to meta/recipes-graphics/wayland/weston_10.0.2.bb
index e27dac164e..f81a33fd1e 100644
--- a/meta/recipes-graphics/wayland/weston_10.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_10.0.2.bb
@@ -13,9 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI:append:libc-musl = " file://dont-use-plane-add-prop.patch "
-
-SRC_URI[sha256sum] = "8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115"
+SRC_URI[sha256sum] = "89646ca0d9f8d413c2767e5c3828eaa3fa149c2a105b3729a6894fa7cf1549e7"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.25.1


