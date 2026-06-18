Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC02CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 07:04:02 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13853.1781766236556293274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 00:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=f7if6w+X;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso6375665ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 00:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781766236; x=1782371036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OrCpeCi05fIqvrk069jMtWqKMTj8f+Hd+p6iHm4Oxo=;
        b=f7if6w+XBwm77AJVz+WcWSpPtw/sZgNqQJIpcb9Gu/ZHhFg42+HH+E662L/sW1lPtT
         6jnFEexb8z8C6GjcJix81wetBDqkKFHeLRFvHTM7GdvH5jg9NJphAD2f76xchw7G7VMf
         19DLISLmORn3j6f9P1MW/mpKeAGAtKO9Bj5XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781766236; x=1782371036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8OrCpeCi05fIqvrk069jMtWqKMTj8f+Hd+p6iHm4Oxo=;
        b=noUpXkIUQPh6FPC9dWyFb4v6ICjxnz8e8C1dYJhQHxHE+2TVIVbtVNMqV2UlCThUqz
         znZEQp5TSesJkmCKBcL7uQT5oFl7Uhq7A3fHeYFIvfCUqxCpsCQPD4GHE9tXnvQq8Gz5
         EQARNiu/VlxVSLKsgrRmlnaCm6QQ4Tg+g0763E8HOYd0wwU1HQlFVCfKBBHINA8aYGtX
         bcB5ChewWs/KciAec366Xq080MylMmVJi8M2Z6WJg6vwRCiUSBhsyvdrZWzwu1iQVazL
         t5oKtDdSEiWWRHLbbSZiniJ6wb2a3ddqZtSUl5fXn7WLNAnZau8XHKpeSysUavhOsU+Y
         0Maw==
X-Gm-Message-State: AOJu0YxjGcL2XRM0x3LSxjKGjqnh32Hzn3LDsX3FWhs6OzKw1XuUHhpN
	qsDlaJXxe9VQPSvEjbdlgTI07RBxzQtAuEQzJaYMW9jIiclWu6N4oxu+Q1hb03Xe/uWSj8dON68
	yWDdCGvk=
X-Gm-Gg: AfdE7ckfeHR0dWS+53UNqfnskqCQbh7R00BBSB0BKaqqpZjnIOL6uDm1oM70iSdG1BZ
	p9chWrJSqvuz5wQAYTVAuA/ng6TYnfk3MFAdfuGIkljDrsCgEEo+CFS93FwXYXP0zKEEmZKeCuP
	hJ7bYflk7uK6y43nSRrTCOgezGXOx+ioky1QumZ0hjVSQW2/oU7osJYQxOU/8tmJ8kPXeBpXQdj
	pSiPaVU17CBqHRZru5pgDsH5m1Nxvn9YugCPY8tpA5Gsze/i1Bl93StKyJxmj2Q4WAIvirBpGIX
	eE+xRWRMfgZldd2hLaZO6RdDEp8+76rqJ70ifcHBrnlLH3onLxtoQBfmID3ggqHoqbuuxdFYEuA
	Owb5l+xLc3Ulo9AbvFx/Sm7LXMyqdlxp11kb12skCQBMDKRWLpeOee7k1v3YgxHbzXdrN8weztd
	YJFp3U+rCGpgW3ZNYUmAkmvGjZcrAi
X-Received: by 2002:a17:903:38cc:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c6bc0c13e2mr73808335ad.16.1781766235708;
        Thu, 18 Jun 2026 00:03:55 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc5:39e0:9a1b:5daf:bc8c:6c46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433460a60sm224314525ad.76.2026.06.18.00.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:03:55 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 3/5] xserver-xorg/xwayland: 'Clarify' xserver license
Date: Thu, 18 Jun 2026 12:33:24 +0530
Message-ID: <20260618070328.650509-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618070328.650509-1-vanusuri@mvista.com>
References: <20260618070328.650509-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 07:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239057

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

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91ecfdcc1da3fdfee670244c90da0ab4eb296453)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 meta/recipes-graphics/xwayland/xwayland_24.1.9.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 0d8d782712..b82fb3c8cd 100644
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
index c4e2d7cfdb..b12b0d0cc7 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
@@ -6,7 +6,7 @@ the transition from X Window System to Wayland environments, providing \
 a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
-LICENSE = "MIT"
+LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons & X11-swapped"
 LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-- 
2.43.0


