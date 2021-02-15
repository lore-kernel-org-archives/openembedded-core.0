Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.816.1613432833815070672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 15:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NhwlbIhi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id 7so11112973wrz.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 15:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tHehJy3TjeZU6+2UQcsz64pLHlrjehXvrnnvbQcDe8M=;
        b=NhwlbIhiWB5E5ivtNJvwUKa20ZqfKp4WbPA7SWSCXNraU4sLRuqyDp0gzrcrNE+MPn
         mdXmhaNVNKCOsTzLJXjAzd6Irjw4pkUed0x8DpKeGQW5b9gd8gx4kG6AjIsytOe5dabW
         3B/Wb0+WRAj4kOMNH5gDey1WVWN3BVHbd0V9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tHehJy3TjeZU6+2UQcsz64pLHlrjehXvrnnvbQcDe8M=;
        b=WbUsgEngczVJq2HujVgERbT3YEYtLfpSFDYGh3rphHlIneekVSocLe4+aEQbT2hN60
         YXpZqfM6mVB06dgFVIivaMBygaAQSqnwDL7Vj6s+TklJGZmzPQTQdYPddDXcCEeKru/L
         irIPgY/+G38vKbCX8LeYK6GnzsbH5ntxMHAbPlc0tg4W5ogWimXw/ZCJgBgasZaxpvQ8
         so4Mh2U1tAtAT+sEhh2jveWkrytA4G5iju773DND0i8vauEE/EFoVnCK7qhSUtWx1Vf3
         f87n98qsdl6sVBXyrP/1w9mHImuLg0F9p/S8NaeyRoOAo1D3BI/7fka3+0RfXlLnbSXS
         6S4A==
X-Gm-Message-State: AOAM530wdVjZzacPxTYzVR0mLF8ycKZ9QZvG3u0xXtIaTqK8E46A1b6G
	R1R2EVaNCz5hNzGtEzizf1UPPhH245PJWw==
X-Google-Smtp-Source: ABdhPJy3VIlKyHdQSzicKkcIED3B9Wfz1D9GRaH+pPUsZeu9zfOfqaoI4andcFGBi5aL1tX6D3mR+g==
X-Received: by 2002:adf:8545:: with SMTP id 63mr18399587wrh.128.1613432831758;
        Mon, 15 Feb 2021 15:47:11 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id g18sm6925352wrw.40.2021.02.15.15.47.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 15:47:11 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] xorg-fonts-minimal: Fix reproducibility
Date: Mon, 15 Feb 2021 23:47:10 +0000
Message-Id: <20210215234711.2007976-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When installing the font files, preserve their timestamp rather than using
the current time which fixes reproducibility issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 1ea08a6c99a..e1e470bf344 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -26,7 +26,7 @@ RDEPENDS_${PN} += "font-alias"
 
 do_install() {
 	install -d ${D}/${datadir}/fonts/X11/misc
-	install -m 0644 ${S}/* ${D}/${datadir}/fonts/X11/misc/
+	install -m 0644 -p ${S}/* ${D}/${datadir}/fonts/X11/misc/
 	install -d ${D}/${libdir}/X11
 	ln -sf ${datadir}/fonts/X11/ ${D}/${libdir}/X11/fonts -s
 }
-- 
2.27.0

