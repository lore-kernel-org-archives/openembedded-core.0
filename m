Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED67CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 15:44:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39782.1779378277512544732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 08:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N2tsBuOj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso47710865e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779378276; x=1779983076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SmV3aN9DQkSmUucYt5yZMJPhsO4O+3+jbCKrpMFmp1Y=;
        b=N2tsBuOjWsiRNMpBr/8q2BpLNfgDNOlCIc0lBwrHtNiE4Q9BFIUijXCZZfdTS0eWkm
         1hAdZSOa8EquVAmjqKMkb/3vF7WLi9UgmrwMfv2DcAMJ2+02HQhRWOlFHhdr5wYvQmpa
         RW+P6TaSxlcE5Qvbj7OAX9JjgWoZrvfbWe5YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378276; x=1779983076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmV3aN9DQkSmUucYt5yZMJPhsO4O+3+jbCKrpMFmp1Y=;
        b=S+aDMpAwoGtPt5eRJDyd4z1lAlC0/UxvFLE0v3+yhOHM/slwnJKvt7hUMdPusP+7/f
         Et29iNL5SfIH+6+5nZGdXm6wODTxUbZw8/Iy9YMe7WxU1iY9MCC3yfX7dA2hF51r49jv
         h9BA90NA6MALzvoMs6gk6rECcuGgGcBz9IAgR+RVmCz4BjR9nvIJYlKcYomZjF8xjj4Q
         oS/akwxiqL3VfOw7Y/wzD08UysQXj4Ipf9V/1iJL/MBcJIeSPH7uvCIWRy/cKhrNDs02
         GesHqw0CQ0Ud/MEd2I7YsUdlnhIOtmQxDKtQZcaNIyv2dK2VSBCogYmHKdYDnfRzFYCy
         wYPA==
X-Gm-Message-State: AOJu0Yx5+rCrvd1T0uoDFsHRGxsGakPcOuUKQTB/Iud8JH5jeGYoevsc
	WbtK0D/EZUSoJqj4HTWHYsWovxC4/vT6vJC1J0lFsPyhUniCRkOpOv1KUYl7USkJvhDNQv3sXnU
	tKOqt
X-Gm-Gg: Acq92OGWDXhWNOruGOhVUzwAkBA31p/v4OmOISYzSXyoXo7F1O+JdTQHzjGz4U28ZmU
	Qz8SuOakmCGswddA2SGFVIIFuZmTA5VkUgu9LBXfYfpzBKFjkr0Y2lnCitvJ9QuqJJHr+H5DNhh
	OHehwhBUUbKY1O5k9kroMXYWoRsZZ4fav/XXzNkhMd0mspnvyz1x3h23zTzfGCxevvMr/2zWu2d
	U62/iDuQX9JHvCqqgHVurPetajeOOFao04cVokcA1wzPZNq2bn2rJWAUdyFxEmqvcYS6pnHtxkN
	/hMAJh6uGtlrosMvnG6EyO7CdNmNYlThUmBtk7NawQ9BVWcJ5p/9/aROoNx75qXKVYLrFBfkH0Q
	LpFPIVB7A3qKOV5BGOGDbCzwnGL0IiTBJ/biG16Zf9K8tGHDpEXpy+CPv56cyn5hs666BI/dhXC
	7M6mhxR3a/dqBIEaHouFJJviLjRU0ny4pUXTMye2eHJ7eDuBA/3VMU
X-Received: by 2002:a05:600c:2d85:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-490360b142fmr34814265e9.21.1779378275593;
        Thu, 21 May 2026 08:44:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8b8a:4d15:b8f5:8634])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903cd7f7efsm30766975e9.14.2026.05.21.08.44.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:44:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xserver-xorg/xwayland: 'Clarify' xserver license
Date: Thu, 21 May 2026 16:44:34 +0100
Message-ID: <20260521154434.2273692-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 15:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237514

The Xserver license, https://gitlab.freedesktop.org/xorg/xserver/-/blob/main/COPYING
is a bit of a challenge to decode. Whilst overall thought to be MIT, there
are many other simlar/related licences included in there.

The make our license data more accurate, update to include all the license
variants present.

I have submitted a patch upstream to add identifiers to the COPYING file to
make it clearer where these come from and save others from repeating this painful
exercise:

https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2218

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 meta/recipes-graphics/xwayland/xwayland_24.1.9.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index f720c9cef4d..0f7eeb33d5f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,7 +1,7 @@
 SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
-LICENSE = "MIT"
+LICENSE = "MIT && Adobe-Display-PostScript && BSD-3-Clause && DEC-3-Clause && HPND && HPND-Netrek && HPND-sell-MIT-disclaimer-xserver && HPND-sell-variant && HPND-UC && ICU && ISC && MIT-open-group && NTP && SGI-B-2.0 && SMLNJ && X11 && X11-no-permit-persons && X11-swapped"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
index c4e2d7cfdb9..44b8bb605a7 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
@@ -6,7 +6,7 @@ the transition from X Window System to Wayland environments, providing \
 a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
-LICENSE = "MIT"
+LICENSE = "MIT && Adobe-Display-PostScript && BSD-3-Clause && DEC-3-Clause && HPND && HPND-Netrek && HPND-sell-MIT-disclaimer-xserver && HPND-sell-variant && HPND-UC && ICU && ISC && MIT-open-group && NTP && SGI-B-2.0 && SMLNJ && X11 && X11-no-permit-persons && X11-swapped"
 LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"

