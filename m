Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12459C83F01
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:34 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.11124.1751377107661706440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bj3cIbQQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso4875692a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377107; x=1751981907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNo8mG56HC1PqZA7wxAt5Ip3D9KcaPcuT83sFaR0XiA=;
        b=bj3cIbQQV1XPzKOM6RL4XDf7oHlRj0Mx7wMX8LbPvaistYxUxsGsXHhGulHsyyQUHT
         HYvuGrlKkxCu9MrxcGbfCTdgARfgAu5QR9g4Y7VlKmvit4iQZ+glBYsuXKQ/ohSssJkx
         dxzCjR4LXc/cXctdCzPt1PJMH3U3WIPhoPHJ429IATby+3+AP6SRVsSZ/S9/6LYL6PoY
         rz7OKjakRdzNxoqqvPRlNdjMl5K3Fj2ECRIOXA0bb31qyeugdu/dc6QNukq8uspC9Omb
         M5PUCNtTESoqjfwKNI3sFMJ88FGqW8lwvCT9Jjvq+Qziz6yiAzAr3loJ0gUURtVzlaVD
         6lEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377107; x=1751981907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNo8mG56HC1PqZA7wxAt5Ip3D9KcaPcuT83sFaR0XiA=;
        b=XDDax9BJWwMRciN4HWx06hgDLTwZDijz9UL0npyzZ9SExkExDuBhGFZ/7n0E2R+D4x
         /9eO3oZSUKyucRaec5PEK00tmIj6vC1N+oG0ZBqfx5w5F+9nxHM6lNchAfeww2EQlX43
         uLS2ezevldEqQQt8Mj9GRlLITWFgh4qpJ1kt0aMzvQmTizKHwS/6EqA6oY2OseAfKBAN
         Syx0qVihSrwJs6kBup0KwAkoiRRuvszpBixonduYPx+3xnSh2LI6JS/Fq1ayNyCMwKsf
         EY6VGlpg72xZlQY+XOmAJM7hfhRcNhoRlcdO/nKvsLxVflzlpOXqetnycQ0ViFeLtHNy
         uyXQ==
X-Gm-Message-State: AOJu0YxZjBsidw64Fit/RtUThNxe80TZ1Ke0bkZAjNP2JPbX+lsDHPg2
	OKdBFNP8euv1wt5Lxw1rkOLUv3r8J2MjKBDHWyAYQD06vSpJcPdV7y/xcLpRbFm5pMy0sDygOfi
	/oDfV
X-Gm-Gg: ASbGncsRd6S1bdOMZTwlUWpATuakJ3kaA7Seh3qgRusm5+xJsqIj+CrFGzRrPb05w5v
	uG9efjoCrgx1ulbyuo7kr6LUMIjTZVeAd7jU+E9UR09yKpXu54E/0vS+MtdWrVhAAwtd833PAno
	r5Czl0sNYtSvzdaet3KqOvC/oFmk7oYFr7V+A2/LakRB/vPPa1lwbc+0lXkMZxP/SMfof+58HXh
	e8jf4xuJYXWAF8wQM+BlkID6ijgi310RsKkhBsz/cUZaixI/PfKD4z6YHp7NvYsz4O/Laplgytk
	agJ0wdHxr3hkmOtBiBrVvlBQJsGmDiQ2rgG7nuEXHoUmfZbaF2NNCw==
X-Google-Smtp-Source: AGHT+IFgJElc9Wz4zm2x4slxe6X7ojCbxS9AzQUeFTlFcExBvfE6iRtqnDN0TcaNA/6Ea5frB4UOAA==
X-Received: by 2002:a17:90b:2f8f:b0:311:a54d:8492 with SMTP id 98e67ed59e1d1-318c910de41mr24920581a91.6.1751377106700;
        Tue, 01 Jul 2025 06:38:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/11] xwayland: Add missing libtirpc dependency
Date: Tue,  1 Jul 2025 06:38:05 -0700
Message-ID: <cfc49bbb21bade1d6c5ea96759dabf0dac25f79b.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219578

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This was being pulled in through python by accident. It no longer needs
it but exposes this missing dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xwayland/xwayland_24.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
index 0774c1bbf5..c0b5dee4c0 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.6.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy libxcvt"
+DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy libxcvt libtirpc"
 
 OPENGL_PKGCONFIGS = "glx glamor dri3"
 PACKAGECONFIG ??= "${XORG_CRYPTO} ${XWAYLAND_EI} \
-- 
2.43.0


