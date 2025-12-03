Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1610D116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 09:09:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10820.1764752962737371053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 01:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hc8ZCw6u;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47789cd2083so38746915e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 01:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764752961; x=1765357761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KdlN1VQYNbwTOEDldPKXrsc/3baaeH5LJbzt5j3UClc=;
        b=Hc8ZCw6ufJPv8QFG+4kGXPzv5yf/ThMBfWS4YULJEuZW5KVXuYKNcMK0gbo+VE6WR/
         3OCqzLjdHD5WovEuZeaIq1Xgr+MaqGMYU4iPNI514dmJJ4dMkO0pdppRRCpiYBYLHrWp
         Ji9TkpUjvtj/Z8kPfUPjbw80YFk+i7mhUVgogL4XvdEb/Gl5qmkf4o481R0FGz/AiWTc
         mDrTaK5/1GPlorXtO9EW+8Qp0NbldSyf50Y4jNgYnIrX0dgXP8mBawITtETRn/dR71L3
         VrVwsEq9OCso3NmtXt3ArFbsFUDLisYNHZumb0Xd4yPOmfWCCGd73/p/YFXAL1SZEmsK
         8puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752961; x=1765357761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdlN1VQYNbwTOEDldPKXrsc/3baaeH5LJbzt5j3UClc=;
        b=le9RAjy0eoYu7ho77hVryfSnszb0iiVlROcaKQW6or/u3C0V2JgDaoP396gcLhngBK
         gjia2iaTLVZUnaJdtgXdudKMfi1F1k72EudRT+maHNWl9VvgP9oLCGaC/MoMDInLWaVs
         8Vj6D7VswrYtInsxg8IQmZJVJc8Gz+k6ANcBYVXeocWl+Zv69T0VNBHW/j3J6QFEv+X3
         oipG4Ph+m7NcUaHFa2/P6A+x4ciRKuC9/Ud6O0NMCFta/QwsvKyOLBmliVDQH03uAxGS
         UY4xq39SLE9afz06rHiHgnuUVFrdIevggWhBqL1qJh7nJHyTcGjnnsPPOD2R5Nklxo2K
         cB+w==
X-Gm-Message-State: AOJu0YzcOGElJaG4QeutMlv9MIGGpIHeCPTcykucw5ZHl9IwZKDhhEcx
	lvrb1w3Xa9ZZ5f7gWpKORW2b/xrBxuuqhcfHbMf8SJLU71OHolwOkjbo1h9xzw==
X-Gm-Gg: ASbGnctvbO7KfG08G23kTm1h5D2qh/tLN4alAgwlRIzcjbGZkqecLKhpPqHoLdZcHg1
	rdieE2Eos29/c6UoQi2oH/6hOHa9U6nV49ZI0FQLIcCpSoy+2UKXWhi0lgOeY9QUpJibzmR5B+i
	fvvMTqNGMzKQqhfu76FZLjzJzrouWHutpwqxczBvce2SqNtPVwpV3R5KVmp/3Afj7JbH3IH9soe
	1nQBEr8+sQEym0VcMo3s3/WMp8Z8UFJgZYv3PfsDJKxUeYyDynKkjEFLCFSpN1h2eKD+igumuIW
	ozeuztiMc0DzQ036/GZUlyLOXygbD6XDnYDiK5BvbdnFB27JjqkmK0DVOWM/g5qRBcxFkO8IKMW
	bQ7Q/8OuEQ87jegDwcnnm1EadUkYysvOQDrcesYOLSNvjntd47DAZyOhujeQW7gCfZFOQcE51IN
	xaIbxEmMgT
X-Google-Smtp-Source: AGHT+IEwtA7jZS/5V4YlMqFf3dbU4veld0HV6WpqPyoLdZrl1YU5YDhMWN58JHh05+mx6WLb8XHncQ==
X-Received: by 2002:a05:600c:c492:b0:477:54cd:200a with SMTP id 5b1f17b1804b1-4792aed9dd5mr14407675e9.6.1764752960847;
        Wed, 03 Dec 2025 01:09:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79dd66sm38232205e9.6.2025.12.03.01.09.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:09:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xeyes: upgrade 1.3.0 -> 1.3.1
Date: Wed,  3 Dec 2025 10:09:19 +0100
Message-ID: <20251203090919.3829002-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 09:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227210

License-Update: added new copyright line "Copyright (c) 2023  q3k"

Shortlog:
man page: fix warnings from `mandoc -T lint` and `groff -rCHECKSTYLE=10`
Improve man page formatting
meson: Add option to build with meson
Cast Xlib XID types to xcb types
Add unused attribute to unused parameters of callback functions
Fix 5 -Wuseless-cast warnings from gcc 14.1
Fix -Wcalloc-transposed-args warnings

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/conf/distro/include/maintainers.inc                      | 2 +-
 .../xorg-app/{xeyes_1.3.0.bb => xeyes_1.3.1.bb}               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xeyes_1.3.0.bb => xeyes_1.3.1.bb} (66%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4a6f1ff6c2..dd963b7ad4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -901,7 +901,7 @@ RECIPE_MAINTAINER:pn-xcursor-transparent-theme = "Unassigned <unassigned@yoctopr
 RECIPE_MAINTAINER:pn-xdg-utils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xdpyinfo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xev = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xeyes = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-xeyes = "Gyorgy Sarvari <skandigraun@gmail.com>"
 RECIPE_MAINTAINER:pn-xf86-input-evdev = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-libinput = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-synaptics = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb b/meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
similarity index 66%
rename from meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb
rename to meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
index 3d1a7063ea..d412bfb4c8 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
@@ -6,9 +6,9 @@ follow the location of the mouse cursor around the screen."
 
 PE = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=29277094da1ef0646d5634a79cb0c1c5"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "0950c600bf33447e169a539ee6655ef9f36d6cebf2c1be67f7ab55dacb753023"
+SRC_URI[sha256sum] = "5608d76b7b1aac5ed7f22f1b6b5ad74ef98c8693220f32b4b87dccee4a956eaa"
 
 DEPENDS += "libxau libxt libxext libxmu libxrender libxi"

