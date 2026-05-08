Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CE8CD37B1
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8247.1778224365786266324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2wlam30m;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso11099265e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224364; x=1778829164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROUJiz5JCDL3JogXOKmozZYoKVn8B66kR+GDTPE4O5Y=;
        b=2wlam30mUBL6N2J0Jkp4iwrH7gfgoTHPiyg45vFRg46DVh+esEQe3vg/BBkS3ZESIL
         QSCc6n0jfj8juOkrn6PKi1bshHtr9PnmlC/5VW/2/Ugp05xQdeE56lMMZTdyOoeFkhmx
         iCn0gJGSm0SP/xfMbUF17OFkxQx4N1oypCdLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224364; x=1778829164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ROUJiz5JCDL3JogXOKmozZYoKVn8B66kR+GDTPE4O5Y=;
        b=AULJSipwkCj1QZQZPhNMel+GVIIQC66T4p55yNXaRLweUfLVzRKM0v/9G7seFGxRmy
         N4/ATKeS3+M6hTXnmbvES0MV3gO0AjDplBcBO4GAkmFUvnGuF+ZrM0u3UgrQMNnz92cu
         K2HARFOitksB2IExa6ilhvpsW6QC7tnHsnzgunUdc0ggDwDsJ61G0+GHv8YiSI8p5Y0M
         gxZ0URAcZoVfiPrs997xhjkuTCsmvBHcS5fVNZDIywG/9XSXKdVXNOBYw8fHY1m8d67O
         nMbcDZHzTrs96IPdaDwR2OYsLH1OKidervMykgOyP7EhE/rAWPDokfJvAxRwLDWLAME9
         p0Jw==
X-Gm-Message-State: AOJu0Yxob3dv/l5K2ug61Tu5LpuHyCtpvV/Z1WY9PDUtrV/KCBRat7Gn
	c+W7/YfLEKI5avPEjkVxUkXPiLKQ2h7CXgIcelpci9qQW/m7VEbVfC1Fw8a1qyMRxo+/w3KoAkn
	BQ0Mw3hQ=
X-Gm-Gg: AeBDiesNsJxMXx2exYfzhK1Y2tiaL34lo17BrKVI5YyeJ1TpHOwG/WU3vSCAZfbrcFl
	+W5cIPRaQ0rHROQTRxg0sj8W38N7F5ZooUxRIyQqUhpLgV2jO5Fe9vZvtCtw3wjImsRoZHlnFQc
	NdOAr16KdJRCFHpxqUcUZZj3PG0KtZTZcppi47OD9NMveq40Zub75fRdlnuWYxifsSyswLgQEyr
	VdpOno9A7T5o5sL59WK4EF/iPQ15N1flmxAwnPUHxd/EbO0mwyzYyz59Z7E3ccIagzVAM56/GiA
	SXLalYsqiNvLVXTpdrzUxzgXVBAKu8vY408cWIwM3vo2vyBm+rWOwKpiZAWZ0SVa71ujjkdwV/J
	OoKHUkXt8WtZ93WYPwP8VfwnVeebwoDGyJyfbzIdxJ5ZVygnpmc1U0nxPSjGuaGg20iVuBtfuSR
	g/YsHa6CXYzgCzAjRUPX2/Kj5Yt/whjb//HCLOXMlHtC70U70ee1ygIEIDpRMDaLSeEwQ0aAtmU
	EYBoQlrdRzVWjJQz2mCq4MJzf8=
X-Received: by 2002:a05:600c:45d3:b0:48a:563c:c8d6 with SMTP id 5b1f17b1804b1-48e6767dd6bmr21245065e9.7.1778224363642;
        Fri, 08 May 2026 00:12:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 44/52] dhcpcd: remove obsolete explicit debug packaging
Date: Fri,  8 May 2026 09:11:37 +0200
Message-ID: <75b1a55adc6bab71bab8a3fadc0f1b94e87e5f8a.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236686

From: Ross Burton <ross.burton@arm.com>

The .debug directories are packaged automatically by default, so this is
redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c3e8394c53581fd6b1d69669f6e0668c5af9d13)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index c940d6806a6..6a77ab9f1fe 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -63,5 +63,3 @@ do_install:append () {
     chmod 700 ${D}${DBDIR}
     chown dhcpcd:dhcpcd ${D}${DBDIR}
 }
-
-FILES:${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"

