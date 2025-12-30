Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDEEEE49BB
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:45 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71739.1767125558612555873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xa6jgyRj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0f3f74587so145890575ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125558; x=1767730358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RVUT0c/v5nckWSTIaGmhSHkon5HCukCWlx88CT3oSI=;
        b=xa6jgyRj+xrBxGxoITRCZFBmEZXyNOhK+W6mnjM84VaWNRLanGK4e7e2VBVF2pVL8a
         /A1vwoDYWkvYsezohLybDW50fYjmvtThgNTOhQsTFth/cyKQ35KONQoDuTw4RtIBRvye
         f59bRcCyAGxeFo9IDpg900ZF6RdUr0AsYaUWaPEK6MctyjuSkBiHteVuE+OPTdPEIslM
         /dshSCva75PriKk2A1ajWksPiTtCULpHiGXMaATynQKBANQlVdcDqRxCEPZWZlKNOsfF
         ahn36nStZFpgLPjNHtMaa4FubYFOxPT7aGLPLjUy9Rwy6YnzD9JxHd1+7rzBEw9cJ3Dy
         teZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125558; x=1767730358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/RVUT0c/v5nckWSTIaGmhSHkon5HCukCWlx88CT3oSI=;
        b=YXehXrT7VR1miDaoMRBvZDqXmhyM2ikp532Tmu+ISAqWvxx8NzVS6GGohTOQtnun/W
         r8FYkqIeeFsGgW0l0PpnAx1BRmB3yVQjaeWuNjwcye+aW7/TY0V1y6cIlizTdV3s6ftC
         B6iXLfGogWaNX1TdVopEr1fnuuvDakaBrWvOppPPhdcyUt8WWC+xm/qLQ+07SfTGOdCh
         4s3pMsmAro+7/WsYW2adTb/talYexqFaSgbYT5SuL1izTufkg++fEPQDsICe8DUzpq8L
         xv6s3+N8/q+6oMsoypvON2rfp2lNBB0AhqRSLKE20iokd3lRuChQCo1y6+jpQGyo+O+u
         XJHA==
X-Gm-Message-State: AOJu0YzZLsE6oaCnwrqkpubiKSpqK+zizlc2GgqXiITdIZRxx/BnyI7E
	NogKLiIhbKdNYiiR5q9FSsRYTjz15saYisNyNNlSR9NMgLwW1jK22V1vguaLjUovw5T79JO0v45
	nRv1T
X-Gm-Gg: AY/fxX5+55ZulW+PZ1gn/QhIx9WJh4bH3jOTFK/Q8d4HviA1Gnfx63RIKeNeIBYeIJy
	v+pZrv0u6o/vIF20/9Lq5aB/XCqzKSkAJ1ezdUQsy15J+RceJxWyqcc6Sxew8ezl2lmVe0XP2SX
	KXEAT3mK0V/D3QeF2ZDej1x5knpxLvd5rd2lVc/7n274mWggR1S3bJ+n/QU1RRkOBIeRKsfBLGq
	PdZNk/1RLVxk/CdNpgZHwT3wrTawE2/xnajaU0oh284051WAv2SbUTeRJyk+hyrdCWDloS6GDEE
	1TICkbesjVpaessnoxCzm+t5riRopo7vA1xwrrKml+fvkgsPX/oQcjb0vMjVDnB+KPAbRvF7gXk
	Z38AEv7FhbyU9w0oMpFYxUT4s4WVnKYX3wyHBqbp4b4WZ2xbOPYNxVghbX9hc1WaO+55Q1Jl/Qh
	R8tA==
X-Google-Smtp-Source: AGHT+IEZBQjQGoKA+8UCMTlZsKt/8aSTrmG0yfyYj+GQPJrOtMJIkNoot4YY0g8261G7oA1ijIisAQ==
X-Received: by 2002:a17:902:cecb:b0:29e:940c:2cdf with SMTP id d9443c01a7336-2a2f2830f73mr312342735ad.36.1767125557850;
        Tue, 30 Dec 2025 12:12:37 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 18/29] gstreamer1.0-rtsp-server: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:48 -0800
Message-ID: <8592e3f4fbcf87e792a83d45e048feef4e16b252.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228710

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 03dbfa735eb15295e7d58b2029c1a88cd98c2fd2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
index a6bfd1d2b0..0bc858a03b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "328dff2457419683f2a4f06ca119cfd22beb632cee1ad6830591213325353c44"
+SRC_URI[sha256sum] = "4f234594aea692e3c1bfaa969965039aaf7483bdfc5862b31d614a59e6718abf"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


