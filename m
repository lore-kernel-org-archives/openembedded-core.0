Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315E0CA5FA1
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:55 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33586.1790495028864610454
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fvl0cRNy;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso14758575e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495027; x=1791099827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TanhanvSwXs9grXrRE+yM2+44PPo+WRZjAeHgqAN9kY=;
        b=fvl0cRNyBcynF6YTiwEJbKF4dPoiAO9+VNVwzL6lf6uxqbq9hDUL1ukQrIK/HqFoQQ
         tY7O/yM5zp2wIfhYbmNP5fDeQ9KWqDpkprd1xyUtF4cScRqnxxGrzOHxQbZwaIPGbZuV
         zuj8p+3ATCvCJSrHZTqiGwQ7g5rpUo4yy3BQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495027; x=1791099827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TanhanvSwXs9grXrRE+yM2+44PPo+WRZjAeHgqAN9kY=;
        b=bT7m71lCMuFq78uQpPQ2FrCyn5NO2fI4CMXsyYKv6SVJjQlSZUbqdC+bNSJzC6Km5X
         j4NeTjB9OHy2Ntg/8D52uNr2we5iIRRW7EKv775So7P1DqJyDmYw3c93voiyWRJk6hCW
         FXV8GJMhbj/PrJRg7Gx6ZNDvt1/MH5YR0yiCkJ3BRsDVxKn+fdfTDRMiILWQvIgRpi+0
         poANkHNav5vxr57NtseoPqA0XJKFJDZD5homSVPSbyLKZgqp0u/Sxh4Xw7D6fY2FWEWl
         kpGP/ywq93krm49m21txrMPd1NJbi24EwGmr2wjTzX8qTnVLy6m0ueKyo+2SYJKfvbJ2
         uvbg==
X-Gm-Message-State: AFuF++kg5EYz9vjJIKPvL23HmTIJfFqksppqXpNDjqOXLSKCm9YRDN0K
	WgOd/6tDZS+dEkIUtEKmVl2uRnlluKrWLSyzNcb9z1Q+Mi9SvUeTudu3l05clfjjwf2/V/HqRLz
	ncoO/iRk=
X-Gm-Gg: AYBFou1BXOQJe3Ggm7YGm5LxUwLp14YvBx1u6B/KA00wIDIeOu3uddtC2x9g4lAUkYl
	yfAoLb16H6gsBCZGzgJcqZboaP3gI3EuDdr9xyT2wF81nJyzEqh3nfXeinfgkuaaSKmcyzOaQ6U
	Vya4/+JlkgNsAUr9srnLox3BzIWXtoqwOTwHRC9eqKxH1ud+BXUS/5lWHP9TFUBQZbGy8VTEHXn
	k3DheuSdTCIH0Fz5z8ncaEkx0ZZNMdJJZxoH0s04A2mcA3vX/RBcj5WQMSRck1LXXpWTuEtlGsL
	sf4WCgR7ecolBiGvcCMcBvzCLr1+gfPg4h6Kp5WZWRvd8O+5sIXZsxyQd08Bgj5YfKbF2mDu62A
	LUoQl5KsXON7Fia4goiINq2wTw0RumtDtmmzcVQrplmBZA8VSDQTkRC57tbywoZHr0CxmVwQNaE
	uTEJoqVV2OXDQlK4h1GamT+ae7em3c2LHWbvqy4wQpmQZUOzHRi3KBNi4Vn4PxUhtYW4NQfshNQ
	pOjtedok1TGVyG+B+W1bN2OFlg67nKTLdenctwIzSIdBPslm5ARuaUvdH/b3e+3uonKXvbf5g==
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr178270355e9.3.1790495027106;
        Sun, 27 Sep 2026 00:43:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/28] at-spi2-core: RDEPENDS on gsettings-desktop-schemas
Date: Sun, 27 Sep 2026 09:43:03 +0200
Message-ID: <f9ce91a928fd6072f78e9a4c0b5411e63b3992c9.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246662

From: Tim Orling <tim.orling@konsulko.com>

at-spi-bus-launcher aborts when no compiled GSettings schema is present.

This has been a fatal error since [1]:
"26f75dc0 bus: Abort if we cannot get the default GSettingsSchemaSource"

[1] https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/26f75dc00eb16ccec89561aefe15f4036d45b4ec

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fb1b8a5338201a2163fcdb5d46550f46da716d8b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/atk/at-spi2-core_2.60.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.0.bb b/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
index 8e3314222c7..a32cce56cbc 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
@@ -23,6 +23,8 @@ DEPENDS = " \
 PROVIDES += "atk at-spi2-atk"
 RPROVIDES:${PN} += "atk at-spi2-atk"
 
+RDEPENDS:${PN}:append:class-target = " gsettings-desktop-schemas"
+
 inherit gnomebase gi-docgen gettext systemd upstream-version-is-even gobject-introspection python3targetconfig
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \

