Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43F0CAC583
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:51:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.14559.1757501468221813043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BG4SIA31;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so42433785e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501467; x=1758106267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hc5ozQQELa2WrXAdJH6lGE7eO+RK0A8zSvzjDsw9Q4I=;
        b=BG4SIA31EoMBryU9hww2fVRHGvddjk1Uji2FX9xqg80EfO9vdxKNT5bo7QqYzV1dLx
         Q20YwCWfjuIXabYPjHZ613R7lm0Hd+hvUiPaQ6TViBPp8Euy/Nj31y8DaCuqj/mOv7VE
         Zcxmy0YH0QBVnW7fNisG+0Gujp2uNuhtQHbhEjxl7webHV8hbEpqIORDla+Wn7lt24bt
         uXC0/v1Ob5jw7/wTAPrAYb/6O5ld+eW2QsboMydbffB57QA81v6wMwccblKmkQ82azLx
         iqa+llRr54ZmSax0cUnQigPzuGhhok4t0VnJLK4NPkhcAPXWtX5LBPvIT8/c75IO+6aq
         F/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501467; x=1758106267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hc5ozQQELa2WrXAdJH6lGE7eO+RK0A8zSvzjDsw9Q4I=;
        b=JVjLUiNKf6JhEnmuxt3IJ44Ivf748gfVQOR98ea27tG4MWNf7Wai7FJmWJlyrK+ot5
         dWzocNLOIXryED2wJ4rRuvfvTbGbkyyVhiEeBQMywPO9GbhTpAy5/tV+LiZs/pMn5vpc
         REhjWWVyzaedNxmkxbcvTLBpDeRkAdKycYyVUujuNvqZhPqjD4DuE2DL1gISGAa9CavO
         Ph7TKNLgRjNHLUKg3waYQZY4QjSi1XipdcJoA2G9zLp2x/qGhwEXcSxn0Zlv7/MMUafs
         2EZwdR3S1cBjiBx/5IBGcXVIPctdPPuKDwu8di2htduzvKRzIsHYi6hEhZDTyvfcDL6b
         mzNg==
X-Gm-Message-State: AOJu0Yz9iDDxIxqTAlF6sn/zK0QwtmEnN/4kUXGEHtrMm5dd9Tt4MZA2
	57ZDS/fP4/8Xud7dJ8gJDN06I7eLZaj7imqInc3V4fZG0Nm/9vndQHobiHSk5g==
X-Gm-Gg: ASbGncukIxHZd4a/w4Ng+3mL420P2tZEKC7y74U/+qaA9SI0WGmSsnYXh63AjsXGlMv
	y9zopCH+x9ODDirUVPi7eYFDItMH/D8BOsSVBLU/Hn0bNHwEvf2HxsG2KFWs1o4WO8obuUtRaRW
	sFthZJdHk+ITZ6C++FiFtjz5hrnAR0G+QzrAPZMbcuDrgMEQAWL8j3YstjuQlkME+iXvZHDR1DM
	xkAKhsQy/838aNP/UNzpnC5AkOY3OxGIeZHhI+LYyLXZwS4qNcgDsUZ2uOwI28Py5apjasTCziu
	5fc2XkzSP5eSYsEXtoyhoouJDYGl8GoXXehBdPzU7ZM1Sy16fev+H8r9CvzFrH2jlqCKXBL3sDY
	suP7FHvgKUPTAcfR9Cq8ipOYvR5VRva5+w/FSmV+/D3ozRtCjFKV/fQZO4ur3GIXAR9NZs3Cbt4
	47PvVdXf+460ckleSEy+WVNx55cNRNcUf46W+UXecZeLzKZlOzcswWKM6U9w==
X-Google-Smtp-Source: AGHT+IEgA0uXJIRn001+H90Dyvb0lQwehG+U+wSwHVBib38mFnqmfY+XWXDm5xib7YgP76vahqhugw==
X-Received: by 2002:a05:600c:1d26:b0:459:e466:1bec with SMTP id 5b1f17b1804b1-45dddea5fc3mr120834385e9.2.1757501466310;
        Wed, 10 Sep 2025 03:51:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247bdesm23349925e9.14.2025.09.10.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:51:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/6] maintainers.inc: unassign Changhyeok Bae
Date: Wed, 10 Sep 2025 12:50:51 +0200
Message-Id: <20250910105053.315379-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250910105053.315379-1-alex.kanavin@gmail.com>
References: <20250910105053.315379-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223195

From: Alexander Kanavin <alex@linutronix.de>

Same as other unassignments: timely updates are not happening.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c44d67d4490..f69939413a9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -104,7 +104,7 @@ RECIPE_MAINTAINER:pn-cmake = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cmake-native = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-compiler-rt = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-compiler-rt-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
+RECIPE_MAINTAINER:pn-connman = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-consolekit = "Chen Qi <Qi.Chen@windriver.com>"
@@ -175,7 +175,7 @@ RECIPE_MAINTAINER:pn-enchant2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-erofs-utils = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-ethtool = "Changhyeok Bae <changhyeok.bae@gmail.com>"
+RECIPE_MAINTAINER:pn-ethtool = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-eudev = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-expat = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-expect = "Unassigned <unassigned@yoctoproject.org>"
@@ -291,12 +291,12 @@ RECIPE_MAINTAINER:pn-initramfs-module-install-efi = "Unassigned <unassigned@yoct
 RECIPE_MAINTAINER:pn-initramfs-module-setup-live = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-initscripts = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-intltool = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
-RECIPE_MAINTAINER:pn-iptables = "Changhyeok Bae <changhyeok.bae@gmail.com>"
-RECIPE_MAINTAINER:pn-iputils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
+RECIPE_MAINTAINER:pn-iproute2 = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-iptables = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-iputils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-iso-codes = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER:pn-itstool = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
+RECIPE_MAINTAINER:pn-iw = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libjpeg-turbo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
@@ -884,7 +884,7 @@ RECIPE_MAINTAINER:pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-which = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wic-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wireless-regdb = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@gmail.com>"
+RECIPE_MAINTAINER:pn-wpa-supplicant = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpebackend-fdo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-x11perf = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-x264 = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.39.5


