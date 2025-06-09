Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D44C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:52:25 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.55578.1749462739355908280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RI958Eh8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4508287895dso31529835e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749462737; x=1750067537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=m5h3cVRsI6g4ZGIykj0ZD2tddHq/J9Jt2gzMhPGJv7U=;
        b=RI958Eh8BdwwH4EVhmBhAT1YPTwS7S12nOamwXnLhxfqJC3jZCRWludP/jk/FRNAn8
         0bR6cXSYwUJYQWyrwe8prv+BjOf4iUiUusNmto1E7nb1HB1fgKGl+qGQYpqHISLXaRkX
         UEK+0kio2BP2nRROf09c3K9UtnwB/ObYzla6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749462737; x=1750067537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5h3cVRsI6g4ZGIykj0ZD2tddHq/J9Jt2gzMhPGJv7U=;
        b=vZBPPPChniU22hBn/GLf1Djamv06RwnH3jM0N/mkEm0GSEt3wGjKNXJ+X/ACcqdP+s
         J+eexhvFfnGUbJDe3ovqkg1yNU5PEVhgxq10Qhmgw/fylw2ti/nZUhGcEoiQ8ebs3auv
         Vx32uxyuPW7xgLxArL98WlxrWj8PtGJ7vWHMxdFywd8xfpz+gnzgxPdxwRFFUXcWReD9
         mOhG7ALcPn2ZFCeJFRm0WuFHN633813xJSMO8axU06R3aDd9jHNMH+XMQ0kyZSb2k9E1
         kD0DyhM233/6RV87vc+MxL+H+KOe2Lu6YIK/TfcxfU1hJPTU12O842CBSjxsUuZ74gjz
         mkVQ==
X-Gm-Message-State: AOJu0YyH2677AtO8nyVDFFplHsgaIZ4pt6ihifAdof8pmV30StCTEh2a
	9mHlBKmi9tAYXJOaLcGT+YIvCcKeAqhgeLL6ahrn1TMF94R/rkfuoINRmLNI4K6Guu1hEMZz2gp
	5CNOmSzA=
X-Gm-Gg: ASbGnctz+PDITK74IE25FLm5XffB+TYpsmFCpNQbdHTfn02LMNCpJu4nxwkec+NKimK
	M2U8bga+JuL77FbQKeWkhDolz1GXKVLoueWC2h/YOZwpvuZ1cIJcL53X0iRpBtrYUoIO2CjViKH
	PJfPSZ+FbzAyURIcNYoUWHE3cT707eDXhVp2OHY1w7wY6sdgPs9KtksVjMXuypjCmGAiAxNvWXG
	mwT9JPmOtRdQRXOLLx68an2AHO2MbSlrjb0F310oLDvsHNk/abLeXUOCpBEIhtIoxcYCaL+LoJw
	5bwZrfZrEFVO+IZng/pLqrRS1Q93+v3NmLtYDyIU0cMb9AkKMwYZS+WAmp+RDDkcRZyrWy0BPTx
	xZZ+9
X-Google-Smtp-Source: AGHT+IHIt9rR2lLX54dy1ANvwvUsI+Z/ZFvqi60kMosgiFKnyLHBYBpNH6J1auWZXazK3eR/kS+HxA==
X-Received: by 2002:a05:6000:2404:b0:3a4:e231:8632 with SMTP id ffacd0b85a97d-3a531327354mr8941946f8f.12.1749462736948;
        Mon, 09 Jun 2025 02:52:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm9079801f8f.74.2025.06.09.02.52.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:52:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xwayland: Add missing libtirpc dependency
Date: Mon,  9 Jun 2025 10:52:15 +0100
Message-ID: <20250609095215.936751-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218249

This was being pulled in through python by accident. It no longer needs
it but exposes this missing dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xwayland/xwayland_24.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
index 350b8e93cc6..540ec100bda 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy libxcvt"
+DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy libxcvt libtirpc"
 
 OPENGL_PKGCONFIGS = "glx glamor dri3"
 PACKAGECONFIG ??= "${XORG_CRYPTO} ${XWAYLAND_EI} \

