Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C991CD98F6
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 07:04:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13951.1781766241465534164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 00:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VnItNOO/;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c6bc87f4d5so2407065ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 00:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781766241; x=1782371041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTjdbYGO4kZ8x3uOR1G0NeaEI9aIt4A+bIXXUbi5IC4=;
        b=VnItNOO/ijt2QJEEBpTdqzppEn5sHf4onRLlSIv0p0NBQbdIoweSbZ6rjx2WE6i1Fa
         UT8iCGRPZqKkm2BQOsZtTFbZzabpuG8PQofT+bB74AviuN6Ss3id6IsuzDef8hgfkDWN
         0F/zhsXFAeOWnG4+m2liC0WFMas6IwOIzsrqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781766241; x=1782371041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XTjdbYGO4kZ8x3uOR1G0NeaEI9aIt4A+bIXXUbi5IC4=;
        b=eRcmIudcbZP2L7A0EK894uIMUlpFAIt30jAXPcBvxQOzNyDl7uZSaim8HE+q9Znc0Z
         T2wSXA9yNpbl+fHs3hjcITohiOVuv3FWPDWqDeLgVTU9vNhimkaJp40c+9uwjRk0Bnp2
         5XK0KJQ4W8VYnVv4rGicBD3Iu7vy0IBVFgKKLmB8wtZETm8WosYay6IhfcEsm7nLXmVh
         daTQ6GRgtuxa5hxzUvlCUlpgl2SW720zoGtehTybkFmJCF2RORJJlygdVuEXUjSLM3zD
         7xjm8xIBl8nf/Uep4tsa+8GlxaOhwwXaRTpLcB3rB5pogWJOlk9ZzxUPrjDuQu5Sw7Ib
         IJeQ==
X-Gm-Message-State: AOJu0Yw58MO7AsVRo+nt4cLPZp9ym9TjIr838ghk4osMIsejtq7/CJtA
	ctQmZeUBGRx4BcZHKbsOomEE+0cGob8s+Tw4wwn9DJqij+2VWeNlq7WlaqbWtzU4p3saEyP0Iop
	77/9snFk=
X-Gm-Gg: AfdE7cl40HuaZJFVS4Bq/q3BgDHgxkDxCBHthZs6o0ByLgZw+amMM2Hx2o28EuBXEl0
	yEYyKoBCRvsl4lspuuBFD/nBonfmfvLAM6zdqT6MHJfztYYxL/q+70nSzPZAh1jae1eM7roCNt5
	ZO7u1nVAutK2435QoP78Iu5rsH7e77R4c+ieQVsSjGuv2yEiqXyIqKyCL1MPGMB4gEIsym/eWZx
	Cwb6tAa7MqX0EhUfsA/k/CTtbIwNH+6dTXpJKfvzDt5SdcEyGgOI813DvV8jg7rWy1DZvkfFlHc
	1L1X4WA52k0GvI2o3T8GB3AT0UZIif70fW5m0DFKk/yCQBRQYue3k6Dz/Nav9uZkTj61FGxFgO0
	jFOs3Ilm34xg0DOzghcuWrqZakiNUxwyVPbsBiedtBtlqWxMQyRyWX7EgoxTzVU5xuGhrpN6Hqn
	loW1lpKHgSYcTvl+2hZypNayNaFfIS
X-Received: by 2002:a17:902:f54c:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c6f340c7a5mr13438895ad.5.1781766240797;
        Thu, 18 Jun 2026 00:04:00 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc5:39e0:9a1b:5daf:bc8c:6c46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433460a60sm224314525ad.76.2026.06.18.00.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:04:00 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 4/5] xwayland: upgrade 24.1.9 -> 24.1.11
Date: Thu, 18 Jun 2026 12:33:25 +0530
Message-ID: <20260618070328.650509-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618070328.650509-1-vanusuri@mvista.com>
References: <20260618070328.650509-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 07:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239058

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License-Update: The change was only to add a missing author, licenses
are unchanged.

xwayland 24.1.10
Release Notes: https://lists.x.org/archives/xorg-announce/2026-April/003679.
html

Includes fixes for CVE-2026-33999 CVE-2026-34000 CVE-2026-34001 CVE-2026-34002 and CVE-2026-34003

xwayland 24.1.11
Release Notes: https://lists.x.org/archives/xorg-announce/2026-April/003697.
html

This release addresses a number of regressions found in Xwayland 24.1.10:

* Avoids spurious focus changes with KDE when listening for mouse buttons
   is enabled for legacy X11 application support
* Fix tablet tools not working anymore as "slave" devices
* Fix a crash when running some XTS tests
* Fix a crash in window damage handling caused a NULL pointer dereference

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a08abd1c50ce180b8b3c98636373f6bcdefda17)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/{xwayland_24.1.9.bb => xwayland_24.1.11.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.9.bb => xwayland_24.1.11.bb} (93%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
similarity index 93%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
index b12b0d0cc7..477db6f8c4 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
@@ -7,10 +7,10 @@ a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
 LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons & X11-swapped"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0"
+SRC_URI[sha256sum] = "27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.43.0


