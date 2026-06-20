Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6861DCDB470
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:15 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5997.1781960410290309667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AitTjpee;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b9318997so20265745e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960408; x=1782565208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjsRc9wKe15aIf+B49sgCJVwisfaoGdc97BM0vBs7+g=;
        b=AitTjpeeGOvLcdJCoPlUrxzCSPrydDV8kCrAjclYqG1O3odzWdl1MwGO2pTypF2Mlv
         y/yWkZCYYvWuCilpgkSfGV2hs7SygCcGvpjz3aSmoCjmBockoSpTyiqgw/bucwmh9kPo
         povhpUbEwSSreU6hQ0XXu37al6MPLMGhLbMGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960408; x=1782565208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FjsRc9wKe15aIf+B49sgCJVwisfaoGdc97BM0vBs7+g=;
        b=Z8O5XIJogcdPaGMu/DNEQXw/anTcl1KqUHoCVwNiZHsA8JBoEmqjK2C4JYn5S2ON+9
         2NomXUQEb1CGLEONFqYAAhzWUoYf4Y8Ubahkh18c7wIQAJaWUvvP7TuxH+op1nW0XOIu
         hSUuzrJMmycozqZSQ+aOa+bdDzzL6im4FniPkm0NIaqkzIxgp3wY9GbJGjsZNh6xrvPL
         ATmNdaPy0OMflMpqueJIyZ7u3hOF/JGRo7v6NR8w8cLEr4JEUFIFKL0m0JIIu54KVMKW
         7annDfhfU41c+A6DZ73oy7T4ffYpRWgtwZdq0UV5+Sn9XVlHW5tEVOm5exUMcH5NTkSf
         RODw==
X-Gm-Message-State: AOJu0Yz9E+aEqwDqsMILsRuSpsZhXpUp7uezTjRRxTUZV9mo1OHAA0Fq
	Aba53rlh6oLy3jUKHDYUjWi34Wn6iQiQYjFp+cvLmOruWTFqveXSpYX/DiSqkq4JxR/KqtF/9i5
	CSt5S
X-Gm-Gg: AfdE7cn/A5AMjgJWZqDvhS+zIQgdm1fn1MB+TYiIp1XnNVTWe+1SoiiPnhBlrCJw/tO
	z4eJglRADZzPO3uzmrzQCSBGFv0hLHSmSJaeQ4t2HTMifyLYESREIQ0MVrA/gfZ3oQLIL79ynHN
	0jJY0koAUyothoibways4tSoRJVJ5HNyTFpLm5ixl8mLCVBvtHgl4bmaXzQD7yDDFx4+upT5u5/
	uouK5tM5mlP/JlPHc9XD3yyji0GaDTkDmcVv4XTpAz/Z40MHjSWcY2nab1ZBBbrlvda9iXTiIZf
	r7Fgd0Lo4Z6KHiVeq+86wjuP9koTp+iByzSMPG6eA9EZktjew+DRZxp2yLlK1A+9vJInAeNk3yx
	nyrUoObDD6MTL3FcIeV7zxYp+eP+0+dEnbSuJ7N0ER7wKmdqG6PFf2sQJ3wSH6yGQNkbKaVXeGv
	zSfGbhltIAsBipHzbIKPsaEoq563lM2KiEKp5Ym38AXaspcLG/UBrudWXhqcQRCmIAenqt3G7Yh
	27+W4MjcFlZtVU7
X-Received: by 2002:a05:600c:1c13:b0:492:4e1c:120 with SMTP id 5b1f17b1804b1-4924e1c2052mr17436935e9.32.1781960408442;
        Sat, 20 Jun 2026 06:00:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/36] xserver-xorg/xwayland: 'Clarify' xserver license
Date: Sat, 20 Jun 2026 14:59:18 +0200
Message-ID: <8382a335e8c17872eec9588873289cb207935237.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239212

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The Xserver license, https://gitlab.freedesktop.org/xorg/xserver/-/blob/main/COPYING
is a bit of a challenge to decode. Whilst overall thought to be MIT, there
are many other simlar/related licences included in there.

The make our license data more accurate, update to include all the license
variants present.

I have submitted a patch upstream to add identifiers to the COPYING file to
make it clearer where these come from and save others from repeating this painful
exercise:

https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2218

(cherry picked from commit 91ecfdcc1da3fdfee670244c90da0ab4eb296453)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
[YC: Referenced MR is now merged]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 meta/recipes-graphics/xwayland/xwayland_24.1.9.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 0d8d7827124..b82fb3c8cd7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,7 +1,7 @@
 SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
-LICENSE = "MIT"
+LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons & X11-swapped"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
index c4e2d7cfdb9..b12b0d0cc70 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
@@ -6,7 +6,7 @@ the transition from X Window System to Wayland environments, providing \
 a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
-LICENSE = "MIT"
+LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons & X11-swapped"
 LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"

