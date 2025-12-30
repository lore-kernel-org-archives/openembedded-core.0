Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832E2EE49B4
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:55 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71752.1767125575172231139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=r1gQoLg6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0a95200e8so88889985ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125574; x=1767730374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTNgVlnuAdzJdZmyEZSK2nb7ofggr9RKiIES77WRezs=;
        b=r1gQoLg6EGSWrf3NPH+O899E9ZmPlTQoyZkmvduxLbX3274U2Luid/rXYuF3Ib/5Mq
         BWPdzgzCP1X59nJNs+yv270wd3w+ghbclheH01wzEVMtxAszugufC3SEP0Ia/aF3Moyd
         jxhIlQvRkdNrvvpQ4JeIWaJyVdx3TJh7t4264iK6RF0mV7JXCCwQ+13Ftr1ZpuIEeanW
         X6QTpGVUX+10AkxWhzhXqJL9CdgeNizgTUmMPQIUcXhLIPEL0TP/KljehrhS2hoddRdH
         SYhm8MKkJijoUuE1IYBWjkYyX9vssHnEVQ+c67zkbTilydItFxgIGA8G9aRywq1TcsK+
         X0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125574; x=1767730374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTNgVlnuAdzJdZmyEZSK2nb7ofggr9RKiIES77WRezs=;
        b=WB6K/m+OL9mkpUhyUMwtjUKWJGYF1ErdYTLl9gln/VMIB9W9SX32RSGwrym6hAnAa+
         0XHYYQcPOYaEXmxK5mLR+qye62AoxZLFjFqIwSrxjZkr/hsu68Dgw284DE5Z/PGniifb
         J8FlulZgGyJb2bkkd+UlhiznWk34VPXMsX2Zsg+Ncx1PP98OxvZFHUXwtyzj5gn5hyL3
         R+mGRlh6N3zbBQRuu9SCFEguMHm5IlmIAdaDsoms8D1W1Kl7h6ba89snlBiexbed8eRp
         qgV/EfSEwW4a0h6WOq+FhfkRt8pvlp9kqL79+17Mm8co+GtV2tx9/Le2lE3Fx1hjyChw
         Exgg==
X-Gm-Message-State: AOJu0Yx3vm0tAjs4INR7C6TXlyY5CS9vl5sndHMJb1UhY8dlhL1TLopH
	kRovqtwYJlZXEdiOxXru2uLnsq0k+BeVOyB72rYRbcSauVeEyl6Y0JLzTHyvPbG/oJ7C4X0f9PL
	obmSC
X-Gm-Gg: AY/fxX7G8pOGMS1SlkZWiZSrMVIj8208mxOU4Xxvsvzfwk6n8UBNyY45wrdAo6ha5WC
	kWgeUl6OAdI1G/YH1mRYdDLPPYEdHLIKaQzp7UenHgw94E8aRpioMKNZ3Hkl8s1cGTWIBAZvapv
	GbFWC9bf6XUABJq49yRRYD+5HO4o6hxCufJV37u1Da5XT7ifIbdYeBxr6No7KQ3U6uxghBQxHuf
	Be1dNedMBEcU1iJLgXymDUY3NYIThlQkl4OxM+z5CkgMApTVWxrqunb6vLmE8zcgniZw9+DOt8x
	9a+VTyM+pwDlmdibneC0IU/B5aL71EmU6c4MDdlm+sL7oyXeYaXW1b1oP5YECP7xu66fDqKns07
	HQhtt2Zfa48UHi1X7x2T8H6qNsQH3vCl6PEE6ENC1lGFWhEmT56D2h1vO0LHZP5FyxVPjY//oeJ
	ct3A==
X-Google-Smtp-Source: AGHT+IHv7n6TPY1zO345b2i1efSpEv1ViVvydojtLsgdIhFEQVCpgkHLVgIOGebhyNGsevopYzsJIQ==
X-Received: by 2002:a17:903:11c5:b0:29d:f739:ff5f with SMTP id d9443c01a7336-2a2f2a4f27cmr324158585ad.61.1767125574430;
        Tue, 30 Dec 2025 12:12:54 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 29/29] cups: upgrade from 2.4.14 to 2.4.15
Date: Tue, 30 Dec 2025 12:11:59 -0800
Message-ID: <6c4c6d39ea3202d756acc13f8ce81b114a468541.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228721

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade cups from 2.4.14 to 2.4.15.

- Fix various cupsd issues which cause local DoS (CVE-2025-61915)
- Fix unresponsive cupsd process caused by slow client (CVE-2025-58436)
- Fixed potential crash in cups-driverd when there are duplicate PPDs (Issue #1355)
- Fixed error recovery when scanning for PPDs in cups-driverd (Issue #1416)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c4ad96193c2e892aa06912808d21e7f861fb9c5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/{cups_2.4.14.bb => cups_2.4.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.14.bb => cups_2.4.15.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.14.bb b/meta/recipes-extended/cups/cups_2.4.15.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.14.bb
rename to meta/recipes-extended/cups/cups_2.4.15.bb
index 5d5a1dc97f..dc22771db3 100644
--- a/meta/recipes-extended/cups/cups_2.4.14.bb
+++ b/meta/recipes-extended/cups/cups_2.4.15.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699"
+SRC_URI[sha256sum] = "eff0bbd48ff1abcbb8e46e28e85aefaffa391a1d9c4d8dc92ab3822a13008d7f"
-- 
2.43.0


