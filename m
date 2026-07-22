Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744DEC4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 21:57:51 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11275.1784757461954363269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 14:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jm2pZdPh;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8486672f03cso12989665b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 14:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784757461; x=1785362261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKtNK5sGf45A67olY4snbv3P1pfhp7CjSWTHdikyRV8=;
        b=Jm2pZdPhoBFs8y40WVCDVH3pU2oF2u2MLGbGyLasKLRl5hgSV8Fxjxjq8QBYInlAo1
         wjewIzwbx4F5y2LTP92m+lEVyA0fMDqOHGg53IES7HaET83cU4vA/JUlna/AqNwqR9m+
         8S4DUaCbNSlzMp3jRFQRq4d6biQb3B8Mzx8aU39663j7t6V2D7NiGK/drXf/laWoW8Zn
         wXIAi5irg2y8Dqnbm72a/mqbwck6vsJphRjHD6Z1LxsW+tLpzhr/6gq4ia4tCYHqpifv
         yWR1qF4jO/7t3DutnG5TPJTEEPBwjIKu9ziJAhxVTKViB91gfEm9PPY0ILHuM8jXfYTT
         D3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757461; x=1785362261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKtNK5sGf45A67olY4snbv3P1pfhp7CjSWTHdikyRV8=;
        b=jFT5Gal6Nu9r1YhMxwi4lseQ8KlO9IKfVxxwH702QHiIuwLZ3QvDOh+JZzmXHG08Zg
         Uof4BFFghqsXtKmhhllWX82z2/U1MlJy753dNMrfDfwcCDA0wi2Rxwko8N/fqVJwezo9
         9VeMnzax01+Z/WRyQWoIIEh0KgJs2YERaPK0/jKTAC/zo/64ZrmX0uYFBD/t1CbiPj6U
         JPpa11Px7PxHLfwP7GEhKhR4gi87ZzcSGCbgB1zQtiYqP21fc0X9rzwJjdjsE+LJ3vjP
         tfRztpnWPDxYJyvu8mUNngUAf848plWHjobLQ35jWi/ddY67ut4Kpgpbv0OLoKk+7MMg
         8rtA==
X-Gm-Message-State: AOJu0YyShBqK1GGmrYsnZN361KbmpurrW54DUirqcASLQcgAiZ9/EfFw
	Sa1fTDVv3fQSvI6foue2yFHww+o2t7omW/yWt+BoxJsmJ4AzQyPW5iBZ+h7KtA==
X-Gm-Gg: AR+sD11Shqd+ySBu2n3Bu31rNfJl9F/DtW57MaODLim32SM61A7yQh/N3Zr9DMhlzlG
	wU5R0QgE6w1PlgiPfsCQpde6u4e6KA9nwKgOrm14AWsY99kMVOhwHA4FikOfkigcbVXj1ro9zHv
	3CsjiqU0EjZ7r2TUHSBtd/NBbsccFE+t1RF9tniwUM6mZ4zkvre1D9kotr32FLvzw1pwQEIEL1G
	d+BbAdt7rStsN2RjJYazEbFayL/cHZoekRHcMGqJ2FA8ykQaocHPejKILCcxGuhdQe+Skd5cJLz
	T4txMeWMpxU2aRvOmIlrsktZ1ICbHZCGDh+EYziRtRuTqnDPJTPrPH+ibAJSYsXvS7FFmNDzhr7
	56WZWjRvjRCXFwGBSWfxLsr5HHWsSXDg55n0zc+e1JJAS5WPkAQBQ/gOQPeWCyvsNSxf9N6UxTA
	wuf29sFURZyWIQZzZIeIpaec3Wwqt9++tZCahtMjR+9KjjjnyZXPrrTFr4Ik/rnl2ujKtzhiU1K
	D0AYEUQOG9OcehXbvcM1g3ERhWBti8AWEsAtK3q19N0qnOHTA+Q+ESK5lCvk8KbAP7IhygXcxHm
	LZdADHx08x3uPy2V4Jfo66eC1aV3lA==
X-Received: by 2002:a05:6a21:7d02:b0:3c0:9c19:65a7 with SMTP id adf61e73a8af0-3c44b244700mr295392637.63.1784757460973;
        Wed, 22 Jul 2026 14:57:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9f2f0sm13264388eec.13.2026.07.22.14.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:57:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2 1/4] libpsl: upgrade 0.22.0 -> 0.23.0
Date: Wed, 22 Jul 2026 14:57:32 -0700
Message-ID: <20260722215737.1940382-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 21:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241758

License-Update: copyright notice reworded, MIT terms unchanged

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libpsl/{libpsl_0.22.0.bb => libpsl_0.23.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpsl/{libpsl_0.22.0.bb => libpsl_0.23.0.bb} (79%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.22.0.bb b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
similarity index 79%
rename from meta/recipes-support/libpsl/libpsl_0.22.0.bb
rename to meta/recipes-support/libpsl/libpsl_0.23.0.bb
index 1e5e9c74b4..793fe0d73b 100644
--- a/meta/recipes-support/libpsl/libpsl_0.22.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
@@ -7,13 +7,13 @@ HOMEPAGE = "https://rockdaboot.github.io/libpsl/"
 BUGTRACKER = "https://github.com/rockdaboot/libpsl/issues"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9f9e317096db2a598fc44237c5b8a4f7 \
-                    file://COPYING;md5=9f9e317096db2a598fc44237c5b8a4f7 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
+                    file://COPYING;md5=49296c1806ef92c28297fb264163d81e \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "c45c3aa17576b99873e05a9b09a44041b065bbfa390e6d474d06fbfaeb9c7722"
+SRC_URI[sha256sum] = "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0eb5d423e4c011f911"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 

