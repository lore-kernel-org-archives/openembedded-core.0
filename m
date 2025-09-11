Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C4ACAC598
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.41415.1757580706796446350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pgf+3RE+;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3e751508f21so325524f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580705; x=1758185505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUDNcCbnIRb++38115p2wzc7DWVsSFTrvcyE4jJ0vII=;
        b=Pgf+3RE+hPCPv+GMtiV54EZ59s2n+sxF3WVCtNEXV6kDNrhVNFBBKM3jfYfRs8K+Ri
         Ji+JnVWz9bJXsewT9Y0GCnDUwVe1JogzP2zS7BrNohtYbDMyPcmFlI9djxo6hBkQKimL
         QO3CxUY2ecuBBmUQQkFDwvk38QZuZOKUo8UcTuyi5XlCJM1BiO60F98Ex4iUidl9CeDq
         qmqLdAt4/hFZh9xJq2d1THZXUlJ0laDc3MnVzeWS9eTmlRAuiirtmMLMWw02eAT/phzh
         wSXHLRvHHj9YZn3LiA1p1y2jGr9sha0WGvSNdmnktBtwPCIG0cVQio42fstAqhdnJagu
         gg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580705; x=1758185505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUDNcCbnIRb++38115p2wzc7DWVsSFTrvcyE4jJ0vII=;
        b=QLyaHll4QHiIVlqj2h0tkJRb4/fEoFkPJb7jsjGkSuHs06CahFGrm+sQqKy1ZfF1a1
         iZa7qFGpjt94R3muAF9WVOK/ELqLLFucOfLtljWSnrMORa0Guo4idPj9cCC8R+CyeAXb
         XWJOgpRtaKUerCVr7Q6Mk0pLqHcRUpeT4D7svDV4xDrVmiphDBGw1KK7wQXGH48zN0G5
         +2fldq+8CzGz+0jpk+Krm/ln6r6lOP7i99zx3sQbiLz3leGuru92ovnzFbUOX777rXNm
         EMd7udffBcFGQMPj2p6eIPnEsWygkRpoJdd2JdS0F/Ag9CqW9akSIly6KLBpenrH42B6
         Rnyw==
X-Gm-Message-State: AOJu0YwR7F03CMeQvTauMNVApqI9qeTtXDNYO3OBjyWUyv4WWEDLaqL7
	j9TjdR+QlhVG0348qbRxhqmAY9/yim1w0Fwbg5EqGjjFwn4exi193L5vFiQ23Q==
X-Gm-Gg: ASbGnctfg88FNO3wOrSCf3GUpDn9V3ohGGb9Ka4pPS24Qr1ncnOZh44YLNuYmbL93tc
	eDxa3wAVuSkas4kCyGi629P0qtaSvquWkIeNyi6JFq3dQzXA+wQrSzv4QOGFSrYq89QTgk8gDAD
	Rph8N6VW1ZmuPjE8BbqqAoD2wJzqCIC6W9aHNGdKa72tdn9/IBvsKWSj2q9mbCK52YxnmoKSd1Z
	dVb5KwX77JIz9H1EWSnsYCViQTL31J0IDyCt+7c7iZF8Fx2RENgnLfx9MNarQ3I9nASFS51zicK
	emjOO0Ol+Gmy1XTJOBqklE++mCx2gC/JH/mv1nt+JFIxMOUL2YQs4L/MQyLq2JkfHJnyP3g75gJ
	abMn+vuxJ+0CzfvQ4NQNnjQqfgm0omU1NccA8JI8q2LPd9RZaEOJzCV/wORzNEQI/nK2F7nsYnj
	0yqmBV+SnY6/Bt8XoZbB9MNxnSTASVrZH2efs5TnQK3UlML6tKYAzC4tsdSE86BcSMjGXW
X-Google-Smtp-Source: AGHT+IGan76lxcQkfkNZKy374ZWQUhoRBUC7bC4iq/jfNs1KwUq0aQHn0LpiLHOo18EyKtq37+aA6Q==
X-Received: by 2002:a5d:5f50:0:b0:3e7:4fda:fe0c with SMTP id ffacd0b85a97d-3e74fdafe2bmr9842345f8f.15.1757580705065;
        Thu, 11 Sep 2025 01:51:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/16] xkeyboard-config: update 2.44 -> 2.45
Date: Thu, 11 Sep 2025 10:51:22 +0200
Message-Id: <20250911085123.1551425-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223262

From: Alexander Kanavin <alex@linutronix.de>

License-update: disclaimer and copyright clarifications per
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_requests/821

Replace manual symlink creation with a meson option.

Drop no-op autoconf options.

Adjust packaging as this is where upstream installs now.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...oard-config_2.44.bb => xkeyboard-config_2.45.bb} | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.44.bb => xkeyboard-config_2.45.bb} (65%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
index 52d074fd5ed..857ccc75160 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
@@ -10,23 +10,18 @@ HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config"
 
 LICENSE = "MIT & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264"
+LIC_FILES_CHKSUM = "file://COPYING;md5=faa756e04053029ddc602caf99e5ef1d"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "54d2c33eeebb031d48fa590c543e54c9bcbd0f00386ebc6489b2f47a0da4342a"
+SRC_URI[sha256sum] = "169e075a92d957a57787c199e84e359df2931b7196c1c5b4a3d576ee6235a87c"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
 
-EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
-
-FILES:${PN} += "${datadir}/X11/xkb"
+FILES:${PN} += "${datadir}/X11/xkb ${datadir}/xkeyboard-config-2"
 
 inherit meson pkgconfig gettext python3native
 
-do_install:append () {
-    install -d ${D}${datadir}/X11/xkb/compiled
-    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
-}
+EXTRA_OEMESON += "-Dxorg-rules-symlinks=true"
 
 BBCLASSEXTEND += "native"
-- 
2.39.5


