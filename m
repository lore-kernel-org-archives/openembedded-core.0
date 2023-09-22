Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A75CD4F2A
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.16021.1695367499714830547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YOnsG7/B;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so6922443a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367498; x=1695972298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2NADD8GZD1u4DACmVLLrwXXQ6e3/lwY9+AO8kNsZIQ=;
        b=YOnsG7/BImNvtOpDVy7bIICtQKNphv+cMB26QWaeF8XH2lMmO/mGoCJEp+FYgotWra
         AmYZo3BQfTb14GxGdAFk6hrcrv3p4lwyuyH5KcqtfIC2047qCC5seQ6KNMo0ZgR9jeOd
         2nlFKYYvl5uuIZ0nBnU93Jm4P0gMspH2kSmop3E/37M/NrahtDAiXQRg0QxB06RuIM27
         L9kt4zocxRH3M1u67jHNOLPNSAVMMcshMftJMs12IgL1STMYrNBVj+Dreq1aNIMfVX6r
         kURdAp5i9czYubT4h1fUPzqwYfQizXfQ2ixYzxMSJPSVvptuPjS5W/smnuoUazdJXe2u
         E7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367498; x=1695972298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2NADD8GZD1u4DACmVLLrwXXQ6e3/lwY9+AO8kNsZIQ=;
        b=L9eE9kn9jUGX4ypCpHRo9mXrj3XYPJYRMp0yd/cGKpKGuFLNcYjd9vk+HWmlIj6ftD
         eWM+nRFMF6ch8CJIhAhW0gRj2aBVf+xwv3A4uQXzpGdZFmmJd1Y+UBov+Fo53z/HBds6
         hZy7WiHgUqB/YSmaY5d1MStkc1stt64Vyv/tknpmA54zDmcbZSWpAz2WiikeGl5Fyt43
         HPikurLasEf7Wd8LEQ68wikmoE33cMX6xnfNaCzAvGHrarR0dEMRlDGNpyK6V4MFAvgj
         XVT+h/sSp/K0ESKA+j83RST8D59qfTCPwwc/zkCVbCbRu8yqj383/z5flmZYJyDFLfE0
         kQmw==
X-Gm-Message-State: AOJu0YwTKpnpT7p+7G9uEHDxcItFCterDLBE7+BKllosFOMVCpFccOtk
	U/S+eLwSjuFSuhK4MhHwlgFM+aJoSiQ=
X-Google-Smtp-Source: AGHT+IH9Q15zZcJ4/rz5LJct5gHpuwMEs69ySViP2c0CxmzUiFfk6bQ+nVHbozq99RrbEtfOPQIX6Q==
X-Received: by 2002:a17:906:3147:b0:993:eee4:e704 with SMTP id e7-20020a170906314700b00993eee4e704mr2490055eje.38.1695367498200;
        Fri, 22 Sep 2023 00:24:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/40] xf86-input-libinput: upgrade 1.3.0 -> 1.4.0
Date: Fri, 22 Sep 2023 09:24:29 +0200
Message-Id: <20230922072431.1481743-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188080

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...f86-input-libinput_1.3.0.bb => xf86-input-libinput_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_1.3.0.bb => xf86-input-libinput_1.4.0.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb
index 892046e959c..92272c3f2a7 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
 DEPENDS += "libinput"
 
 XORG_DRIVER_COMPRESSOR = ".tar.xz"
-SRC_URI[sha256sum] = "1446ba20a22bc968b5a4a0b4dbc3b8e037c50d9c59ac75fa3f7fc506c58c1abb"
+SRC_URI[sha256sum] = "3a3d14cd895dc75b59ae2783b888031956a0bac7a1eff16d240dbb9d5df3e398"
 
 FILES:${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.30.2


