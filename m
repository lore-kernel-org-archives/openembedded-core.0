Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9D8CDB471
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6021.1781960432455936077
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lCXZbc6U;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1344223f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960431; x=1782565231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGBC1yQl2vQXGoiqfzTDqcMcrH3whXaRU3QYBIg0M/0=;
        b=lCXZbc6UvMgbrE/Zpt3A/g4VOZkLrPeZvkbfVFiSKonVMiBhjxqBEcSBvXz0nemhKR
         y5nArLm+vvcq83gUnDR7cabFUe2uDR1SaURz7jMSTcW/TQfwkb2FntJbPvTYxIrjoipY
         2yn+X4eFiy7ZaaKFtuFJII/iaJLu6mhTlOTmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960431; x=1782565231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZGBC1yQl2vQXGoiqfzTDqcMcrH3whXaRU3QYBIg0M/0=;
        b=jSUvKypMekMJzonvDD9CPMgCHby7zRFbY3ZVAGau+Juw1BbxIYIfhbMFmpCryrmee1
         CwMgSj+Ay0+pocUieiJ1PJiWsAxIoICmdpCa+ORxQb7G5jzINkokUVs9a1CsMMqWF4lE
         E5v527CUhb8nvRnGzf9jzav/Wkj8jnhDa/+zpCat7Is8W1bZW5ENnUeg7wq+Mi9/YZiy
         GAxcagn/L2GACgBblPg7q6fhkB5fJHCCyiG7rZwobqOWHRGZBbIkTpr22DvhrkZwcGuw
         hGepVJil7lofeVdS4x+OYDKlMD0PCmUjtkpYgwbwUfeFZo0u5ALoQX4SVGt45exm/EKG
         OggA==
X-Gm-Message-State: AOJu0YzO4R5J5+TDJp5FM1Ehy1aVDI40dOWMn7qrh15FZBWnShIG7Hjl
	ZDicW1uOgIApPhhcc4ILr6kC5/nI7eKkXfbkLgIu+JXp7jHp+iA7WVX+cz20cIUxH+esCLth5mX
	RPAzV
X-Gm-Gg: AfdE7cklDcdZGCCRPB0bYghrFXopONz4bGGZvt1ONrmDAgfjmf3Q94/1jGXAPxbahAz
	KyPvn9hQFDexQcXn29Zp2rchCbBib84RArs7RwffStE9XlmGHYjEV0jP2ijg0nWzqd/M7X+hHPA
	99XyTbO+9trh3PZuUBC9MRh+oXJUn3Fa+nq5H+c7+ETUYMtaktcAUv7GWDmG3e+CgzPq6O7axKB
	2FajzHarHbIJ1BhQWfVZkeZYP3/VUzDFYvioj+sy242MxPPivu9lHLSjEkFAe2gwLz4A1OdYD9f
	MCF4XQEa/K6O+6qXgngyywsmayxnDBmLJ0o3iL4Uqi6pm9EEsjDVq94Z5R78LqhfDoLTf2fJCaW
	P3ea7cRzHJsVLNFNP74WLpCr0BkWfQVhGCZ+Oj1OtPnlE7PDbhZ6fiz8L4AAmssJheII8anb9z9
	MFuBSHCFV4IZ8BTKFkaZOFkgZ+mRuuaBsRQle0okGk9if1q/fMw/f70FdMWBwvxux74cPlX6dx7
	o09U+XftOAa8s4z
X-Received: by 2002:a05:600c:a318:b0:492:4c2e:9613 with SMTP id 5b1f17b1804b1-4924c2e97d2mr19518615e9.18.1781960430664;
        Sat, 20 Jun 2026 06:00:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 31/36] ppp: Remove PD license
Date: Sat, 20 Jun 2026 14:59:46 +0200
Message-ID: <a78184f423cc400f255a96a1a68212acd818db3c.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239241

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The code referred to as having a "public domain" license (chat) has a
MIT SPDX license indentifier and matching license text. We can therefore
drop the PD license field entry.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6f416b0862c3dbe46f3ea2d8b77ef0ddfc12b36)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 607678db8bb..37e223b4abe 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap virtual/crypt"
-LICENSE = "BSD-2-Clause & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD & MIT"
+LICENSE = "BSD-2-Clause & GPL-2.0-or-later & LGPL-2.0-or-later & RSA-MD & MIT"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=25;md5=f0463bd67ae70535c709fca554089bd8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=1;md5=234d7d4edd08962c0144e4604050e0b6 \

