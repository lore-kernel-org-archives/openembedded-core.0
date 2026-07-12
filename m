Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16269C4450C
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:49 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9507.1783835508573648875
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=M+zaGOfn;
 spf=pass (domain: underview.tech, ip: 74.125.224.54, mailfrom: vince@underview.tech)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-667b0ced2d3so3374880d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835507; x=1784440307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccqQOmdDM/FxPbN/f6xcWjhryokDDB53Pag5RvW67tg=;
        b=M+zaGOfnMVjloeHyuCgz1UlZgBLz+eNIGRH9eHT77GoHMR1d747JqtTgBRAQGJb/I0
         +BtcT8enwzMIf8Zx/vsfOkUZF8hir50+rgDHtrvLDrPgFmzCzx/5VBSOvHB2hphzOd/5
         0EOKhjwEi1oK9gcvuubVDeyhsDQjQhyfGZPzrIsrX7Ji2UbNs8IJ5/RR4UBprHgXAeet
         t1IuxFCYmrIyisscQkDhecIh0bVrl7ZPcOGzGdZasB/V7PWiZ11kjaVfKAVDSY+mpUhA
         ihGkZ9BEl2y2S3nBeNiCKfv+i1x9DzdVovuZ1qfGL2vHEbA0iLMoOCEZEqCPVZtyVOtS
         BWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835507; x=1784440307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccqQOmdDM/FxPbN/f6xcWjhryokDDB53Pag5RvW67tg=;
        b=HDtI9atu0/6RW/oYyp2jw4bEE9fExKdSgynP+pCqfgoNcBZVKNWxAfWDRc7yGRuguH
         +s3pxAIZX1HYb0VpnNT3HZ5ccj0ewq/C8RckzZydWD/acMG5GabxcCHcvEkyZNCzq7Wx
         fhdjZ4hF6rkIc/SJcvD24d2FSpzJw4OD4/ALJdU2l+GkDFrZoOYuc8XQy9XUctLkGOwP
         uCw0OabBVuzjUHG1AS+j2L7xGtKURRCknS1VfCPZYI4puzxjI37KnqjATcGsrB/sEZ0j
         +CdXgAubEhn+bB+FxaehRuqIS29MlfBqOFUiUR++SOOxTbILG+NFN3S+Gpoh+HRpF/JB
         3pdA==
X-Gm-Message-State: AOJu0YzpIIPxG2t9PF2mNr4P6wTAgJxiqR4FPyGMB+bIMQ8c959xvEmq
	zbB2C4owwv8p1feQNrz05ER0ZhMaHtBvxU9koEteT6TWqeu8xMXhdMmuxj+GNul6aiHGni0Tlfw
	r/AzEUdY=
X-Gm-Gg: AfdE7cmmW+I3phgsXCNhcS71DXHd3iTYxn3mZCNBrC8fnw575B5WnOlsHJS3dGgmIJg
	/mPol2tJ5K7phxP3lUIBJS9w3/qWGXFMBmFMkVyg7h347ar2LsMqRRxHjWosQjn4xGqPlgy9ick
	N1eBwOAqamnGpVGBwX2FDXgzwuX83ms7OaAzNXSWkYWiYe4XN0rXZ3vGa8XJXusXXo1R/pVsvPg
	r4PmC+wK+RiySWiIEi2gFUulchNtxyktfnQoGWiFzsnvTib0lSP1EOcFQPNz38NiYp7Ylc/Xm4/
	6SI5wnCad5zupu6YZfBIBCbL5coKrbE/zG38DECIBz/+ogtGytgykrH86TzyF1BFK3t9/yvjq4K
	76bhnAh7Vcj5YQWcUFoWmpat3/ZaimN2jvce/TQwlvfe2tFBVPZ5cO/xUYQlNcTlNFqRqK8g3Sj
	IoHo5lXpXgau3cfnw64ncdOLey
X-Received: by 2002:a53:b646:0:b0:667:aa57:685c with SMTP id 956f58d0204a3-667d7c49206mr2784504d50.56.1783835507619;
        Sat, 11 Jul 2026 22:51:47 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:46 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 18/26] v86d: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:46 -0400
Message-ID: <20260712054954.4063745-18-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240743

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 3bc9b24487..66dc3b177e 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "v86d provides a backend for kernel drivers that need to execute x
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
-RRECOMMENDS:${PN} = "kernel-module-uvesafb"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-uvesafb"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://Update-x86emu-from-X.org.patch \
-- 
2.43.0


