Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FDECDB46F
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5999.1781960412035571543
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hreQ/VdT;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4626fdc829aso2115975f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960410; x=1782565210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbnbFOwA0s7e82jO7QTuwR/OcBLcI1NKa0V8mb5szMI=;
        b=hreQ/VdT1ati96FQ25j9Vc83wUubKVBxtd7i3fASZuJGB5xqRZqzGD+1xpFbOnXsS4
         cmFng5QS5QKcw6t1l0NIY4gTgktNe340v21b2g0s2ZX4wPpIhTIzBYalFHv0whe9FUtI
         SsL+PomSjpaGkjUmvmmGnHOwfiQeJ4VrI1qds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960410; x=1782565210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fbnbFOwA0s7e82jO7QTuwR/OcBLcI1NKa0V8mb5szMI=;
        b=TJvCD4xcAvHFfzXBVmHJeys9JZ9qykKjrPn5Hug+pWFFnO73dXQ+A5wo+VlpTByS8d
         2o2e/5Uww+Iqyy7QGqFQKDcR8mMIfvjthynR1lF6sVXlWeKpcwpzskkwjXXgimFboFBF
         mUBqHqs10sqiPKkjhu76qKhCkuhW826LeP5aF8fM1y3/pCwCwNyze6sSELoegxVahfZR
         /6qsR5/MvXIFw0pu2SYQLxIAfCPsWaz6mNF5tyPOCf54bm7sR8+hZgrx7RvbdmrpPRVU
         i4dNrSA96U9c86pDbc2AipB/BdacDRXbOXYCaXhgUvR/5J1h5l7lJjN3Qh+gQUj4PGZK
         kyOw==
X-Gm-Message-State: AOJu0Yxvam7a9GGhMkwTr097g6FiDgGtvdYGozb48yMK+p+3GvVNef78
	IeWIIWGeDG6RoAM6It+yXs4MDXd2a7azsNNAnGa40dKWzX43611ce3KrvoK6vuDEtNGCvWIWY1x
	8bUoH
X-Gm-Gg: AfdE7clIpTv/scifOnffpmqOxGaSZVmtdNo8sdjDRXXDCe4FrlB7jvWmLsYaGtcdZEM
	WgzUfEO9gC31xyinWe+BJGESWWKnR9W81vG7hn/6YmgTbyWAt/nHvawxAHsvlJQegzEOMqcfWb3
	s4lrrm1N4MlQr3Zy0H8JBaFr5XOphweWZ0G4pN8qgFD1yBnNCvIRF+PtdKuCU0vFwRQWAj4+cje
	G6fMSwpElqZ7W1sg4pptcB4ELDcHY3J/dW+ZyzeilcIi1yDsyZnAhODj498W0L0n7Vf2YMuDEPx
	5jXwLVYnEPt+6k0qbDu/nA7S6+Xf11nQsYZKef+m0715+/iD+RklpmJlrkAYEHSOE0pwLX29rNr
	jdyQeKGlwllLR+N/rv95R5w5wCbFfLXa/jhalfCMvQAMVJcavKbyPLKWfQVc5HTP1hBVNwFaJTB
	wVoOePOgZrMjIXnEjjXZDgVs6YB2Wo6FUGbuns1bRcqrbSH0WZSSM3jJAb/3pCkqX2qAB4PAU/y
	KD+vkq/YyeFA0iWzqb16jWl+bk=
X-Received: by 2002:a05:6000:46db:b0:467:2a2:d88b with SMTP id ffacd0b85a97d-46702a2f5camr1576519f8f.32.1781960410158;
        Sat, 20 Jun 2026 06:00:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/36] xserver-xorg/xwayland: Drop X11-swapped from LICENSE
Date: Sat, 20 Jun 2026 14:59:20 +0200
Message-ID: <08ee20ab13e98fa43950acc88c430994d30f80da.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239214

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The licenses are all X11, not X11-swapped so this can be dropped, was a mistake
on my part with the original analysis from some tooling that got confused.

(cherry picked from commit e62676f614d93368b065a932762116f3c86c4164)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 meta/recipes-graphics/xwayland/xwayland_24.1.11.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b82fb3c8cd7..7491715134b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,7 +1,7 @@
 SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
-LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons & X11-swapped"
+LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
index 477db6f8c43..eabf66ffec7 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
@@ -6,7 +6,7 @@ the transition from X Window System to Wayland environments, providing \
 a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
-LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons & X11-swapped"
+LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"

