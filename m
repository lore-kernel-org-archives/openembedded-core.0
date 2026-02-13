Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A2AEF48F3
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67220.1770970223219150718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LfH9SOfY;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4362c635319so592578f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970221; x=1771575021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oiq8vsQqhA0hWo1TE/fZl878s+ThG0vXROmZ0LvF9cU=;
        b=LfH9SOfYixC/tZ/p6mlz8E/rQBH6TtjGWaTD7XcWtcEMWlzpSip5nQD0ko0JyS+e3p
         xJBCBcBY0ma9Sfy6oADhsS9z8ipF8W163NPbOQvivj2xOT9EIjNaGa3kiKWrK4Q0I4sr
         /27pqDlGMeL5twedb5Sxi0LOpJ3s2gyOcvM54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970221; x=1771575021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oiq8vsQqhA0hWo1TE/fZl878s+ThG0vXROmZ0LvF9cU=;
        b=fTpww3G6uDp9xc3ShBIGipDKiW6SpX5Odul2PKxuBsO4nJMYLUjjfc2J/JkBQ7nHHu
         DhgA9ABfcV1tdTqcu1xyWu5H7efI6fGRdbmyuQrlP2YXNd4N6/gDHlG9FXdnuYKKTezr
         RoDD3BwXXWB7q3cr+cxfIPeWxclQ5Iqwo2PRb00AB2NtY1tCv3Vq3APkTWTn+EN2M2Hi
         urtUdsrU9GT/JY4xvloGyyhtBtjWOYOR9gUOPFEPOczapYPMsi3B7gqHVyVnqixP7kEd
         g88vuZGkhfImV/+8Wx3SrNgCC3LGt1W4GhKO3CHeqfKodEyeuVPdCRXO6f0+cH7kRM0b
         jdDg==
X-Gm-Message-State: AOJu0YyPt0geOU4cfLS6b/ef2daCvH9BL1Ag9fm0Ji5XMJB44jazGBDM
	C+g5JlswikRqX6QeHYO31xMlI+bnNL5kpWf0JXktvSnlKGEx8f757EAR7xY6Um6wa4UhiqCjZYK
	2r+a7
X-Gm-Gg: AZuq6aIFsIFcR3rXBvOUQOFwkh8Q0OLH9ABNrBrqC9nKrB/e0F5CKuPJzfjj+dQyuLV
	PCESBas1ADpiV/cDOIB9rp+9PwcsTzyzyL+6G92g4p0GRYY93fYO3BuYFd64cDAOQWV6bLAWFPk
	+HWm1QaJ+9p8AxXMiMI8oZGYI6SbaAE5jcyRyu5Vf8cyczq63IktUYzJSnrPbUzQjXk3cIN9EeZ
	PqcVGF9XiDu+jdbEKOdhX/o/TQSIvrNwSnkxZLsdZSB0adAF4G+Lk0oncMVr8KE1U2SQbUdBQBY
	+MtXqSJX5gMyPBmf4Es6R13XEqhzxZCFplqSDW5AGFti+xu4eBXEiRalNhzmTkw01SW0kRW0nxT
	rdXXLSYGTGaAmqyBa/ChPkFD1sC9AAUD92Sq5MD7WEDx7ODg77dPK9Gyah+7XYyZRzD7S27xo5j
	1hdAqFdOZFgZAHX6vvRK4qj/qXksOBj+1BEVZzHPOkj7iAVxakTw7pzA18A6zoCPf2doUHZFqgd
	vFM406WVdAUJlaFlYrkMAQYDKRTyS4no1i4/Q==
X-Received: by 2002:a05:6000:26cf:b0:437:a49:137d with SMTP id ffacd0b85a97d-437978e1929mr1779852f8f.21.1770970221173;
        Fri, 13 Feb 2026 00:10:21 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 04/19] mobile-broadband-provider-info: upgrade 20250613 -> 20251101
Date: Fri, 13 Feb 2026 09:08:22 +0100
Message-ID: <80211808157dad8ca01f46070b50895d7fcb7012.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231086

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99e2dea3d4328f2aaa6e6e29f5bf4aa38b64b274)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...o_20250613.bb => mobile-broadband-provider-info_20251101.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-broadband-provider-info_20250613.bb => mobile-broadband-provider-info_20251101.bb} (91%)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
similarity index 91%
rename from meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
rename to meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
index 72663c7e0a8..441732afe74 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main;tag=${PV}"
-SRCREV = "2a1b409491a531aedcf3eb3ba907929d96bd181a"
+SRCREV = "18cb97517d9c831e1d2ec057e62d04fd3665e10f"
 
 inherit meson
 

