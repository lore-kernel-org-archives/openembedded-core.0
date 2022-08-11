Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EE1C19F2D
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 19:58:21 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.2521.1660247894686278188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U0sCfCpF;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id uj29so35425555ejc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Rrh71xddDzyjatKHf5dkG+lPyULKTsTWObTh1cVqxzw=;
        b=U0sCfCpF8Vpn3KSYOlE2HLAyVLTEgRnFfr4URXbmc8tJh/qGOAAZdhA4qcXgJ9HAC5
         T/F2Iziq8VZ5OiOFLt9FllXJKto+JtU3uFP7yd5L7vMXOaOHaOIFpmTlvu9ScKnO4+wT
         3FeExpii2627u7NJuaWIrVUkWND2NDWvllAKYWTkO2ljlgDIlHqEjC//l9n9Mzv65siG
         YoHfh7Ixfq3r/8XraL+R7bCeEgA8Cvtthe7mpRkb4fY5tf7F17SwI/mT/JnQMWezSSwx
         q+TXPwogpCAsCqbsYUVFGaoz0+vNxZvTIhVe8vFBrl8TX0LKiPZUSaAky+FvJwb3CmTr
         ivYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Rrh71xddDzyjatKHf5dkG+lPyULKTsTWObTh1cVqxzw=;
        b=MeiWGxmgnFVPmcGep3EfdjxqmY8Ve9GQ1X7ZB90S907kLg1/nXP0/Q7D/uBiTPGllE
         F5eXUFzz88h9Uqydn03l9MvnPaYcXxvVAzrkHy/900ASCyYXhjueQqDAIw1rEgGMYiUM
         qLhISAjIG0NqmWZo7wjofrl0NiAN0Mc4RqTvKAat7Hdsaz1TIIGsgh7h7LJA649ehuhs
         HV2q7x9y17u3dByje8MS8wsh+fuKGJWnDyuG4pjhnQl1S60eX3xxfVJD7Xm5zCgHXDqD
         2s/zoAv/GNErJYGLEfBJB+9d4DEyYyfMyk1p9qyoyzix4Leot40KeXD54GJ9hiFyFki8
         UhAg==
X-Gm-Message-State: ACgBeo3Yz1dNToRFHmgdDQtEPE03Io21J0sfsbXbI1dIEUiRBCzCLbhs
	ycozqW5udGGPpJ2r/on6Fx9h9rEzzvY=
X-Google-Smtp-Source: 
 AA6agR6kU2qmMqpX+ZT7PEKxKunPUupT2/OMj3bv7dFxbhJxiHGakrjCGnil7zdPUZhPIw0upf09Bw==
X-Received: by 2002:a17:907:60c7:b0:731:14e2:af10 with SMTP id
 hv7-20020a17090760c700b0073114e2af10mr450676ejc.92.1660247893215;
        Thu, 11 Aug 2022 12:58:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fu18-20020a170907b01200b007308bdef04bsm22010ejc.103.2022.08.11.12.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 12:58:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/7] weston: upgrade 10.0.1 -> 10.0.2
Date: Thu, 11 Aug 2022 21:58:03 +0200
Message-Id: <20220811195806.1571221-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811195806.1571221-1-alex@linutronix.de>
References: <20220811195806.1571221-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 19:58:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169266

Drop dont-use-plane-add-prop.patch as issue is fixed elsewhere
(see the link in the patch).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
2.30.2


