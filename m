Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697CDE6ADF7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88514.1766436307964819467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yqz3x9DJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79ea617f55so776574166b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436306; x=1767041106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrmoGe6eiciE/HpNj9rAp1z1SpGaBsaJKLNFPYI7fE0=;
        b=Yqz3x9DJdmyzHzO4G1wYzQw4pKXTjcJOKrc2bmAvSyc0tTp+toWtc0bOv4qv3wVg9W
         a++BB+oVtceu6sQy0P00qG0WDVcD2MPkUhutSb/weMUFMI3+61/sg9WXegMyZ2HmAJnb
         goFwKUONG9cBP+Kr7QPZJuP5VoOX+/gY59hBsa6+MM8EqnunWXVRtEKHIzlmcWbRS3Pd
         0sgmPYEYRXLakwK1HVt+5FoRK+giDPnKdF+Io/2zELJ99Sqq2BLdWL7a4Oglva3e3Qtp
         3Y1IR8MBvRVq4NigK/cU0ZKXT68XPiPhwk3PVTAei3rMO+LCSfOg97KVQSLIQ1G8RboJ
         D9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436306; x=1767041106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GrmoGe6eiciE/HpNj9rAp1z1SpGaBsaJKLNFPYI7fE0=;
        b=iN0c/rInrTqswGAVB25rbAqvzczT+jEK23lx5DlYcolUM6Zc8yd/ykjt21eqq4xYJ2
         fvTkdia3q7YWKoDEM3acaeSPO+nwyAnSL6H/2Ua++1bXgPH3j4ziQWZCfHgqnFHrU86q
         Tc1Fd1pzRbDTpq7faXFySErXUKBeju6uN/fYmkgXkYz2LceIjDZKU73eJAfVa52CNSWW
         aXOj4ImQUsEP3vbL4lkzYrA78FzFi6mK0mhIXUWQqdV100YfeblQmBrp3GwBmnFHDvZX
         oU3Z1F7/l2J2Nj09Nsvq1ybGW5ErOhAEWHyIr0xHGhXLd1tZsHMgEF8B2jomJNRvGyh6
         WUmQ==
X-Gm-Message-State: AOJu0YzlgJL1q7Mwnm0+SKu+YT5WHP2GbfIaJQRgyfS7rHrjuB2yH4mk
	y1dDt2cfSCioygvdVsb4viv4wmFoAHTl7M8Ted4G/pY/3ZcYpNXAZnFEVI0weA==
X-Gm-Gg: AY/fxX6j3L3bJWJ9L9ebTcN5g/t/9oILnRaBpiU368SmWhYyQ9Uy3iJQIIM0QPi1iND
	3ESyICXu0YPNXAgwXQZYL1YJBfbj4jA3Dk3ZDt5LIuuMTxmwiNWIwXz4q58+c+dB7uRBJ2mSSNs
	bZCccWjduH7DMh/YZfKK+17+xsh05cbP/5O3wb/4r/uTUt6qXwK6AKcAZhLydWYDWndOveBhg7v
	R5yiRHw4I3+Roz98s6bzFK9NBzITAYKZ6ob6KDY3yuD8lnj4jWmOvI/70IaSsHHoni9pkjBCHmv
	tY9coVqXiSUo1IjFjer6coYGCfCTV8oyjgjJes8q0AXb76Ry7pC6AtuSWTpVVYrMGZfKEBZbed/
	XWqxLFuIu6b0VTj3Zzu13k8LzgTsHDMN/Gn6hfIxzfAtIg91ZB02lWOrkaJZweAep5f21R1Ll8D
	m48Crl1ukWN/4cltMTv72CIc5xaFmjK1hjdR83DaUZHUNKW0A=
X-Google-Smtp-Source: AGHT+IHx589xg5Cj8CRZiu/FqQTT2qy3+wHMbDBwKsm4W/XABuknjO6k6cYPcRW+hFrQs5l3leK/ew==
X-Received: by 2002:a17:907:970f:b0:b80:3445:f4be with SMTP id a640c23a62f3a-b80371744d4mr1329676666b.38.1766436306245;
        Mon, 22 Dec 2025 12:45:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/15] xkbcomp: upgrade 1.4.7 -> 1.5.0
Date: Mon, 22 Dec 2025 21:44:30 +0100
Message-ID: <20251222204455.2284529-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228437

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-app/{xkbcomp_1.4.7.bb => xkbcomp_1.5.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.7.bb => xkbcomp_1.5.0.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
index f259f33dd8..67bed254ac 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
@@ -16,4 +16,4 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF += "--disable-selective-werror"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "0a288114e5f44e31987042c79aecff1ffad53a8154b8ec971c24a69a80f81f77"
+SRC_URI[sha256sum] = "2ac31f26600776db6d9cd79b3fcd272263faebac7eb85fb2f33c7141b8486060"
-- 
2.47.3


