Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96BEC3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 16:02:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.12824.1743609746422020712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 09:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jZDeg1yQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso629435f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743609744; x=1744214544; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TIj0IJjRzT3fFVe29NLLrZNltJEhMy6SWtqRnSaTHc=;
        b=jZDeg1yQ2ZCUPoB0hXDTMrBfZkCP93mMs6MxDsPtAQYCyZmGZXsLoZXu48yAGVXWsI
         9dZ2kcCUvSmaYgN+U6VBlx/OzVo3t55sMvJdSAIhXgjjvRiwEGtgv4yMxGL08yxcTe78
         zf2X5P3GlCCpeTar/CxpqzOoklkAipJHdR9yTBhQOqtXZqi1FZ1EysJTqcLd80iHLGwb
         L6wiZkh4S4aDDESxXUszClv73aoOwLwQIVsarFRoU269HFszj7xQNzUGlYp8tvC8Q07v
         szBgLdqTzBUu9xw3ezvhIW86fjrZ3E9zoC09g0K4D1fDv3gsZc5WYSQvA/SQHbtIB99m
         ZohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609744; x=1744214544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TIj0IJjRzT3fFVe29NLLrZNltJEhMy6SWtqRnSaTHc=;
        b=fIX4GbnZd5W/joZWJmQ1Wu/8yoNZBUdd8PWi1LJbj8SbbcwJ+9gnSuTiCivLdpRzMP
         IyOBRQUfioqeWGQqFI+1cVsHPyv0ilOps0M43l9Xm5V2mTGLBar4O4gOFs1VNPs/zlwT
         PUYLEi3VlWfY/wb4wFUveRbw1iOCG3KtFrOCHPf1qu7y6/XrVGNLPgb+1ciWaStErLY3
         8WR+JkuZ78kV1rwLiZPqzwBwlnCggB906GJ/v7r2vOwgF1j7aZoOQF9eUsVQraOdMgpq
         pjYwvOu8Y69V/PpJu3+1BDITKluV/nuWUGtRuOE/HAMg1P7fQJcVXxGOLJKj7eaKlTVa
         3vaw==
X-Gm-Message-State: AOJu0YxU+WAfOL0swEsrx7fda1YXFDUXzsnuYmEk1Ic/G2HAMqEFri3R
	dns5lcFXu1hBw6it/Km63wFH4M3O90G2btFSNc2UCEf1RCkyFrBlZl3nwg==
X-Gm-Gg: ASbGncuZIsXiRp3aibkZG1v8+b6K2R95qMQL/PfU344HwiLoVn/WqfebCucWGgFmF2l
	+zzuEm/Ei1SttMEGEcf36o59zSNu1XfNyZPg11ZUw0YFRs6pvM91sCysUjbgS3FDPnupXRkqYuU
	zM7NMtjatfmM+N0OkpZAh9wHGKKYNzPGTLq+DcfyKK5ic1jhpoHtCO134AmpMDbWy+kJWTIK8fJ
	fRLUiU2nV5Ufh/B0HUSOuOXNwEG80mJApAqjIhyUUb37qhzIMKFHDSYvaIq/MHKd/eh07Oiws/h
	Pwc38Hxr6iV6TUUmn9PD+jJd74kBkrL6JydacU4UGSlDj2zHOtSXP9UXDIrosggGWcM69yA+S5l
	qAHeJuT3RXRA=
X-Google-Smtp-Source: AGHT+IFpzZLog4tqV/A2Pm0ovipElmZbEni3QDwmNHLgXy11ypmLpuoi+o1vdU4OViQA4BfPYbj5GA==
X-Received: by 2002:a05:6000:420f:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39c2e636b68mr76757f8f.25.1743609744069;
        Wed, 02 Apr 2025 09:02:24 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0a3sm17543565f8f.71.2025.04.02.09.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:02:23 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 02 Apr 2025 16:02:15 +0000
Subject: [PATCH OE-Core 3/5] connman: Move ppp from DEPENDS to
 PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-connman-v1-3-2e4fbbb7caf9@gmail.com>
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
In-Reply-To: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 16:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214283

ppp is only required by connman when building the L2TP or PPTP plugins. Move it
from DEPENDS to PACKAGECONFIG so it's only there when required.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/connman/connman_1.44.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index 553a377684c67190bbf274a28759bc1825b21d75..aa9da070dec1b4aac02019ae9c3158256b534c61 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
 CVE_PRODUCT = "connman connection_manager"
 
-DEPENDS  = "dbus glib-2.0 ppp"
+DEPENDS  = "dbus glib-2.0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
@@ -63,8 +63,8 @@ PACKAGECONFIG[iwd] = "--enable-iwd,--disable-iwd,,iwd"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
 PACKAGECONFIG[vpnc] = "--enable-vpnc --with-vpnc=${sbindir}/vpnc,--disable-vpnc,,vpnc"
-PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2tp,,xl2tpd"
-PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,,pptp-linux"
+PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2tp,ppp,xl2tpd"
+PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,ppp,pptp-linux"
 # WISPr support for logging into hotspots, requires TLS
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-masq-ipv4 kernel-module-nft-nat"

-- 
2.25.1


