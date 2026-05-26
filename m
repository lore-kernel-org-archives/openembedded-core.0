Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4D3CD5BD0
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 12:27:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35842.1779798429726407940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 05:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=exQqfBEG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49039a8851fso49708065e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779798428; x=1780403228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6Vl/6mBkbdzkd68v5dpZBMecAW8gDShOp3kPQ2LwgQ=;
        b=exQqfBEGtBbWeZamui/H1nM9Md/vifSoyw0ti9E9Is88Ctdt/+AwAgSh43iJeiLbte
         TkzIdHMSYMy43i6P8soeE/Yn5vaBw14lPU+gkHtWG0gWnVltmrIjfNiq6wjlW+3W9CjI
         Z0lsVCmGU6YrzKp7FYAl1hTtu1nO+QENNs2xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798428; x=1780403228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6Vl/6mBkbdzkd68v5dpZBMecAW8gDShOp3kPQ2LwgQ=;
        b=BK9IDAhC71NULxBCFmuN9TZkzxvXUYRrNZe/3GXXv1TXAZXs6d6mkgiQ4iVeqjl4TT
         BwrFbkt7rajCXiohCFzO+GUn6SA18WSkBGgBfG2N9/YwVU2H3brgIaJo4ujgavoSKz2T
         t/mNi7phwnAoNgji9b60Me84Ii1c+tcYbv56R9JgT5F/Qk/ykluR82hBvom1CKP9xc+M
         HSrEPFG8wO8RMEBEgE9zbrn6Y1AdIfNQ3w3v0zrkuHguSezqksQqujr4ofd4VpsIp3Ll
         1rOO277wmjIu8MfAoYCDjMRrFyVSD0DojGeV/rlTE+avrjPARAup4i+uVnUcT6v6MJ+j
         fqmw==
X-Gm-Message-State: AOJu0Ywp4Ve0SfO6tnRgjO4sfJmuPy0NI6QNW/NQZ+aavGDfjdMHrAbT
	zghg92VnozkBZHusYck/sf1GP3zq+GzlJUwbGgejtfkcI34Yo9cSSyeMe8iyBcYEFvk7wipK6sx
	/rvMG
X-Gm-Gg: Acq92OEe8lkUBlhcbDG9asJlMT9yNSvhLcRVVlwhB2iQJZzaT0TUn+zV6R/huh9TzEi
	BHJAgbH1DPySr7pRhb46hcBj3wwS/8IN4BB3P/nVtOZVqJzO4h463m/QyHyutxfIslF1sMRkg6S
	VRQPTg9wLttnOEIf7532U66svI6pARaVV7erM2FSyAgu06AjnIAAL1VZ+C0H0wCowc+tbri0MAz
	KbmswG7Js55acq1+D1R/7f3tip1UG4dallhusBWv57qfhjQkoasX2GOVIBtMmP7d9OpbxX8emjC
	0CiwCwLWavSY4e7ouIpSif+WaUUgiL/Jj3SUJCnuuZYg1OsTy8sl+0dYeXOuIoFE1yJ5sId5QvI
	qI6SJ4ouRyWYLnRZkJ/dI7it/bgI6ngMSsMnAyanEBw9BjXLp8mqjZQQowds41ijWDcz9e5fde3
	gY/4aCXjTB6Qfr+TOdNujjnqwNuhJlcO4ClME/l98qLCMO9gs9H339
X-Received: by 2002:a05:600c:1c21:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-49044ebc2edmr311184945e9.24.1779798427415;
        Tue, 26 May 2026 05:27:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2e34:2d9a:782f:4147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527526dsm356759945e9.4.2026.05.26.05.27.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:27:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] xserver-xorg/xwayland: 'Clarify' xserver license
Date: Tue, 26 May 2026 13:27:04 +0100
Message-ID: <20260526122705.4171028-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237598

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
index f720c9cef4d..50e2dcb9752 100644
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

