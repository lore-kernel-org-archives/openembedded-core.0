Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E63CCD98F6
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 07:04:12 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13855.1781766245629558302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 00:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kdBCctvv;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf3781ca51so5665345ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 00:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781766245; x=1782371045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ql3KdNiEje4OB4M4JQvDuqF3xcuoDlf+SWz82Z7c+jg=;
        b=kdBCctvvAmBfADO5e6HsuFhBh5vGStNMDEzndJvi9MP9WPdasRJ/rlFe9h7lj0igBt
         Y+S5F0hUxmLiBCwlAlkEbs4aGZWeZzDB/Mm80eOePd0+gX0kso3BSv7FOt3cQO2RcUun
         olkDrU7AqDQea88uTwgvhUQwDBdSAtZIgeDQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781766245; x=1782371045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ql3KdNiEje4OB4M4JQvDuqF3xcuoDlf+SWz82Z7c+jg=;
        b=lyF1cHYsmoh4cmbUVNhZ71QM+4tmN+JXJu4GvsuVgDbZG7TvLTd2RE5aIW90U/dC9b
         EL0xX/sgruuI4pFA7MpN+YolD7ZdjRzdxe1NQAtlIGurDAYtBpElkgxcIc3t9Mbuspzt
         ABD5yWcM1FezpqkZLAT2h9cpZeu2xXC6Vjv0loIOS2znxVQ0/JNTQmGuAJ0TrsEnnVjK
         1kW7TezwLZ3XSuim/m54bNZO82mp8NE/xgR3gnrj4/dUVxUY4TS8aj69mSld105q2SAy
         JjPtmjG1hkyWG3apwkpId+A4zF6RyC3MAiiWuYfcBOEgINchQllw57qAy+gCVNmVY/Yz
         0QgA==
X-Gm-Message-State: AOJu0YyHdcteRh0vNooSB4p5/wuARQstFsOzrh7wZHbSjH4GxiEMFVj2
	rNkr+rbfybiPp2D4mwyHOHljDauBoxR1JbXloMMiEXJCTCrzz7p1PZzwyxbpsoVGY+v/51Ri3qm
	NOBqvYjU=
X-Gm-Gg: AfdE7cliEZVCEdsoDH53e4l7ruuaeC9ZNHLUeKkHEG1Az5JuS8Hmx7aDXo5hWgamd+d
	256F4kWlRNNCR3++fG4gV6aOqGK/mJ88z5hZSav/QVALZliAZoujAuBt7IIByROuzukPjfW7B68
	5OMLbjzhRpZH+UwIFgntcoO2z1AncXah3enwv1d8BARmX4rJEsnunFwJ843Vuh6O2iHNmz1vDET
	0UdNgXL3MRVRoMuUb6DMGC+x7OgwTpGoaTJbRYk8ipkmG7t/rX+M1QhggZA78VYt8Ya/6O2bxES
	oCfqIOHS8oRqxdKAQOa2uEriLoVDrBxNo1vaKTp48QKrN52hyiNIBEJDt3h0a5U87GdeSteiwoH
	+E7iGOunCNGQOyiQsfS3aG+xpOVTn/ziTZ5NmqzMannKaLd3cdvUH4WEnynkiB41DwVVuSnlrGn
	GcQIhYYy4GCp+y9Sj5NxttYLRDxluq
X-Received: by 2002:a17:903:4b2d:b0:2c2:25d8:d5a3 with SMTP id d9443c01a7336-2c6e4719f68mr25766005ad.3.1781766244865;
        Thu, 18 Jun 2026 00:04:04 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc5:39e0:9a1b:5daf:bc8c:6c46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433460a60sm224314525ad.76.2026.06.18.00.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:04:04 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 5/5] xserver-xorg/xwayland: Drop X11-swapped from LICENSE
Date: Thu, 18 Jun 2026 12:33:26 +0530
Message-ID: <20260618070328.650509-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618070328.650509-1-vanusuri@mvista.com>
References: <20260618070328.650509-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 07:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239059

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The licenses are all X11, not X11-swapped so this can be dropped, was a mistake
on my part with the original analysis from some tooling that got confused.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e62676f614d93368b065a932762116f3c86c4164)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 meta/recipes-graphics/xwayland/xwayland_24.1.11.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b82fb3c8cd..7491715134 100644
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
index 477db6f8c4..eabf66ffec 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
@@ -6,7 +6,7 @@ the transition from X Window System to Wayland environments, providing \
 a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
-LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons & X11-swapped"
+LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-- 
2.43.0


