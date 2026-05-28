Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBB2CD6E4A
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 10:41:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8005.1779964855795151020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 03:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PMkMN00E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d146705b4so133688715e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 03:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779964854; x=1780569654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bAiVXbEE+wVyW8yTV0nnLFpgJlhNeUhjSwbo+FnwBYE=;
        b=PMkMN00ELI7l8gvMAIe/zePAjlurJxs+bU439rqbbRQocLTpqAQMsF7dftoAoD1AKB
         Tfk27Mwu0hLInsDECYuLUOkPvC9pI0MWoveD399Q5xH0tWuTIkiM4a1Ub3bS3MKivNgO
         47TyUeUytlT9GelX8c01iCk1/2ATMeXpej0fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964854; x=1780569654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAiVXbEE+wVyW8yTV0nnLFpgJlhNeUhjSwbo+FnwBYE=;
        b=Llq7eLIM7JYOaGp0nMeqKSvUIXLo512357bbxiR90zErx2/umNwtgfS+vL6qd6Eqsk
         scUylClRiNJF4kdJhbLHN6YKMtEwuyuTL8x8+JuCyMWLGa0QqtLkxw7X8OUdCngmfv2J
         mCBavNpSRgqT7GpjBQSh9iu+QAAjYDPPF5DmMQq/XroPCUyiY2Xn4IOUSh21MqguZl2p
         R7fIlprC7IXtu3rGAtw/U+fN96k/EguCgbpyNpeKVtwwhbkBNfxRC4zR0G3aAtSnLKWl
         iyzMxUmhVv/nGA31sPfnl7j8W8Jt+YO0JYB+tmeyyIkO0i3P8iFJt3cHMRdyLDGXotex
         +4dw==
X-Gm-Message-State: AOJu0YwsvgZAZcVX9Gq0nkOgXcw2tNjZKnoRiv7oU4E6Ap+iaNsJlUc8
	XL4NWBJz/Kf7/xUxBscXHe6rSj4FPJ9WALsfmI66qCszh+67VDp2XBKNIQw+MmNLA6bXburPGKi
	6TeC2
X-Gm-Gg: Acq92OGdwlYL2gzKskxfDaiDs9IAn/lT8vQUaz9SuBbiCL4RnCoFtDKDPG5MrfU6vaN
	Ro3FX0pvgpJdhw+KK40+hyJr7FrjgnX9tGHUUOehH6uGEdpuNL0Y9UUYU0Knh5gXTujcpFHIqQ0
	6zEAAixg3wNZWlqX89O6pxsX6hcwsDRmdCvvgl8CDaePl7R3jlDzdgz72DPKOiNfVFNwxOhRn3T
	+cQyqoY5W64+vNFFzhBAf2OeGVUpHz4XGSUDmXegTRJN5Cp5rtTvfovC5whxI/Kvt7LnYmdkUUf
	k+LWCcZ/fKRFvgLBzKHPkI9K0rJtwjUcDYXmM1b+vcJRRBFzjgcvovrn3o8AYeHnqQ5JgjYaR4k
	YjCYNU6B6slA6vhPu+gYsHwa2rsELWN0O4j4fp/ST6Y/BTP4ynbOivckH62z3G3EAKZWlVCYgjm
	OHjoeXlaUtu6v0hwMUX5YfxgyeEvJQr5NbyfILNL9IWYZLUd4SJ8rnOIX+VUxvDQ==
X-Received: by 2002:a05:600c:1553:b0:490:58ef:cea7 with SMTP id 5b1f17b1804b1-49058efcf6amr350116315e9.22.1779964853901;
        Thu, 28 May 2026 03:40:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908eab2109sm12068805e9.19.2026.05.28.03.40.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:40:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xserver-xorg/xwayland: Drop X11-swapped from LICENSE
Date: Thu, 28 May 2026 11:40:52 +0100
Message-ID: <20260528104052.32320-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 10:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237699

The licenses are all X11, not X11-swapped so this can be dropped, was a mistake
on my part with the original analysis from some tooling that got confused.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 meta/recipes-graphics/xwayland/xwayland_24.1.11.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 50e2dcb9752..782c1f76ca4 100644
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

