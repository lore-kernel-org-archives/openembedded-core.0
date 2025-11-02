Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CA3CCFA02
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 08:49:33 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6988.1762073367657682670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 01:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XRoo33YF;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f5d497692so4548209b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 01:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762073367; x=1762678167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hqgn4pgbRjUljwzrNqES0T3oAzQObarvcBowsr9mKVA=;
        b=XRoo33YFGTdp8qpDb1Y8jkpvRz5PZsHdJhaxR5+KfHDn7mihvDVHaujnvkRth/wR1m
         kDArZnxpIOBGtmC7zVGOPqvm52HZWErOO6GDzLrYWeVSo6XbXTSsa7x9rjgBJvHP64Lw
         +obFu/yyXKuSjjYJpkSHuzaAOXUhJ8bpYfqQ+6LjCat7CcayWpmD/wUmXoGkYZ+v8a+o
         0/V4sbGeanYWWM445TsD7qkdnaG/msHFPGTbyzfBvkmHsJWBptNVy5h9ZRk+oD5ph8cc
         ejCQmuvB13/y5S5l9KxeL/esug1vDLlPak1spqjrmGOjX/Myd3ErbczCUwo+FcnU4UI5
         r0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762073367; x=1762678167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hqgn4pgbRjUljwzrNqES0T3oAzQObarvcBowsr9mKVA=;
        b=fgDXvm82G6Zt4XlKDZvQ5U+vBhAnEVC28vzD1C0Owd5z3xUWyyFxY53vsT+/N5N2dS
         89AMfuW8EmRMAzt2m4OMdu5TASn9dRwdQrOJuAVh4UV3cFrgfF6jDmLS/VFNsztUpZDQ
         ISBrz7AE1BK5QuxfuGlMv6BCjkSzpuGBZGDnYzRdpqOYp77Twb6yf4BDq0WwQx59D1sE
         rlekGg+jym/PxFpDH3N2LicAPG1YBiJEOc5NHnpbJKJi4SNBCl/j+FOd903dShpCqrDP
         KSTez6lRe5dqISQuwMiV0ctD7UpMCCgkXLabtuWuBz7fSa9oipjsqYq2nhoWI+ye8NXK
         XuGw==
X-Gm-Message-State: AOJu0YyKM/tQnx+U3Ia19CLXClk6LinQTAlRWZ1fNLyp4QlyvzpEZ9BH
	vtkuwz+EnK7gHzpmhPKqOtxivqEF7H4AohAc+BBpARFK+mGIpq6gg22L7phirg==
X-Gm-Gg: ASbGncsCmAjlZVLrL1+uO1Dy2cUgvDAeyUUhm1PTNSbULh5ocU8lkY1Z2G2Y5+atBFA
	eyXumEiWwAQmcHCAjrTL1Ceig6avk67gVNoIn33BX5QuJjKA/nFPNpzv2zfDMrplRkoirc+P1PX
	L/JOnA++mE9OS+NZM4dkB9yoUvHJXqeyVR7qzQ4dxRMGqehNw7wNRQeG19pdl5FP241k11arzKl
	LEmvNMRdWAanxazItviYmDuVg5W5yoUAB3FVm7GAwD6cMZjGzBZbIwh0+U9MRHp5bWOJh98ckzS
	GgHVYjWZ1/uc2+QfM1u1Gry1tqtbn64VaUMps/AGP56OLKJFxcuWWhsH/WbzmEvx9M4PNr4dUC3
	utVtjM5FknQB1J6vNgsoMs1Km4KkO0fIxKzJdCUT+s/tQmUge/JZRFiS+lsd0XPkR4+b1b3igkN
	Vk4mxwBWsegV7qwx4vFtl+jRDi
X-Google-Smtp-Source: AGHT+IEVB1zZ0i61k3so3qdhrZqzZt61Ny0AGawJUT1aI80EXJ9Fxja/U60VWqv0hA99KXUDXwJffA==
X-Received: by 2002:a05:6a00:3d4e:b0:7a2:7833:8b5d with SMTP id d2e1a72fcca58-7a7788ffd40mr12643443b3a.17.1762073366872;
        Sun, 02 Nov 2025 01:49:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aaf449e8f1sm113891b3a.11.2025.11.02.01.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:49:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 4/5] libevdev: upgrade 1.13.4 -> 1.13.5
Date: Sun,  2 Nov 2025 21:48:54 +1300
Message-ID: <20251102084855.1555197-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
References: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 08:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225571

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
- sync event codes with kernel 6.16
- change the bit to shift to ULL
- sync headers with kernel 6.17

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libevdev/{libevdev_1.13.4.bb => libevdev_1.13.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.4.bb => libevdev_1.13.5.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.4.bb b/meta/recipes-support/libevdev/libevdev_1.13.5.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.4.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.5.bb
index 3ff64bd04b..a42bd38489 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.4.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f00ab8d42ad8b905296fab67e13b871f1a424839331516642100f82ad88127cd"
+SRC_URI[sha256sum] = "89918ae7b7c13936e6482604a77a2bfbbb74544c5d039fde01c3fa1bdf639987"
 
 inherit autotools pkgconfig
 

