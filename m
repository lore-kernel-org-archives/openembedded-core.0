Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972A3EE57F4
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:24:07 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.35264.1726097044887273918
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dPeo259p;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71790ed8c2dso253009b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097044; x=1726701844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rDjnmtIOGxGii2tfljCZ0WQGHQoMNj2qYzIpybz2po=;
        b=dPeo259pb4hc2QaCkvR4TZtzl6Wj8KPSaz2+v/6l0nPo0CwIKtS5KL4CnUGj1BnGwj
         SIDOBdwd6zLnYrmPkkSCApnYT2OUbjLA4ncIZlmXVdXIybZNEvf+aAkH8gbAjRSqTl8K
         uvLajsULq7fLnfoeGvwUdbXeAxb76ul/bEOdN/uav1SxWYRcJTn8jODP+DmxwmFg9O5B
         5btan9Lc37zjTq6IRvxA4evE8MDoSSJ0sfSzKjZ0rxxoI9K80PAU/HDn2VJ1hOuhQPI9
         5v/9Fif4+a6E/5csYXaIwcvgmFO1MmegXBdvX9ypyphllz7n09EfiLZjeMOkM+5QknoF
         Tn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097044; x=1726701844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rDjnmtIOGxGii2tfljCZ0WQGHQoMNj2qYzIpybz2po=;
        b=M8D2xEeQ5dURJLKUGd79OpqQ2b84m7M0wlYARZH1uApxRy8Bet9FGj6CBQbKI0op+M
         g5NoWkIh3KPh2TTmguLhNqgyoiPUDpz2U5u0GEalSRus65KxvPHnkDM1Jl9viogw/IWK
         DP3ar3qE58OtbRV3xo2eCuYtHSrQMA0/8qudAV6lRhHaSSZMFhcLtDdp85RCIe5TKtRy
         4WUvZdS384mKJsho1YkjYiAD7GvAOlmMmT4/vMMEF2UI1M0TgVzEh2ewpQ2gKWsYjhHp
         CUtmvd/gpz8/IUttxTiHnxAp4HoajSU+MJWimsvnfMW0o2ekY/8PtP7o8sIAlTqEZu5Y
         Vs0g==
X-Gm-Message-State: AOJu0Yz11LEoa/octQ1RQ05pASYj5roTsZ1E9hBq2vceXmZvQ9a4Reag
	Vyxnj1Oicqsg2UxkOIjvx+JHX9nShFiLJbQkz6Js0M6pA+Q0TnJ49B1V8u3I7vUCAdWNiIsPz9S
	Z
X-Google-Smtp-Source: AGHT+IEAgVvdD+2D8f8DEbUSKtj7c06EkbsS70fvL4/h6fs49aQrWvC7RdKtYwkTG2h5sKwLeKCNzQ==
X-Received: by 2002:a05:6a00:2352:b0:70d:2e24:af75 with SMTP id d2e1a72fcca58-71926210c2cmr1746584b3a.24.1726097044030;
        Wed, 11 Sep 2024 16:24:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.24.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:24:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/22] gcr: Fix LICENSE
Date: Wed, 11 Sep 2024 16:23:17 -0700
Message-Id: <2db7a2538f7cbc54cbe6614a84ffc17bb422a4a8.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204414

From: Niko Mauno <niko.mauno@vaisala.com>

The contents of the COPYING file included in the current source code
package match those of LGPL-2.0 license, which seems to have been the
case since 2011 commit
https://gitlab.gnome.org/GNOME/gcr/-/commit/c6691faa0348ab087e99ab9bd9914e1d5e81fa14

(From OE-Core rev: f3ae58b741e4e6e3a5196ff75fcc4da6ee89d0b9)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gcr/gcr_3.40.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
index 8719884f25..7985339483 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -5,7 +5,7 @@ GNOME desktop."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
 
-LICENSE = "GPL-2.0-only"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
-- 
2.34.1


