Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881FACD4F5B
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 05:00:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10716.1779425994164675640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 21:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V4URAClJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so1141344f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 21:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779425992; x=1780030792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w88jPDDbDcPqNZk3zmzzfj6cNIsH1UC1LXvVoSiuBX0=;
        b=V4URAClJBmJyux2wLJUTa4Xq6uS1KgMLogypPhHdwlOtqGZSd8D1BS6goSr8d8NdU6
         mSg7/PWaP9BHo/3r2yUHJokdg32XmRWxASCQixp/7i5N5NDIMdfuT/lvzHkR9E+7FuNV
         Mn8dphCEzr+UYoiXPBBhSqOU1PouQbTkZqxrtP+oSsn5+OjsQUF+L7L0prYasRptfoLf
         M8wqOEpRInx2yxXQDvc779lFC3P+Va27ytYqq/BoAZRsnlTjBgO0yfowovbYdaPp+Z6c
         fxVKYD81DbITzsb88nUllg4h7Irp6INnK80/YzXvG98TZqM9yNEsXlc96GIbf7zYk+2G
         0ROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779425992; x=1780030792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w88jPDDbDcPqNZk3zmzzfj6cNIsH1UC1LXvVoSiuBX0=;
        b=cXHvSm1glynEjp+hel/+jZTqNLF8XD0qXTCADJevTDvVIZFff5k7GM7x10s4iLvcfg
         vixLI6IPxjye7ZQoo9ts2BGFhmWDsBiHB25V8KIj/Cp1+kVZ/EEHVDRy18SI2fPqsyXW
         veck2XABL3eAjUAARreRQEvXowpvC8ugWAkyTT+DzmxUSlXdbefbivZp8mPO4A2c+B4q
         pCJswMAYQXhATr2yyJgtZdV0TVB5r7lmt1Popbum2o/9D/q3U4Bd64s/1o7DpwGlsuXD
         o5Pkr/pJMGUXyydtp3Nnk+TwR9Vsv/Te7U013yxyx7BzrzguGQtBM/UwASmMXkaDMO6G
         I7ig==
X-Gm-Message-State: AOJu0Yz7Y6njdpZn2BrNNvH4PHLY10a7/l6jZsYEUF/DvK+JedtSBa/R
	L/CEAidmD8dg+yd9bNE2aAn8uLLzSaEyBViLvcBObziV4mee0m3UdE35njNTlQ==
X-Gm-Gg: Acq92OE+thHGBFuSVfLI/gtAT46aY9QGSj47hNH6pkbad/xBMtVSndltAK+SLxw2aj9
	J/Wxxz2dHbVi2nNDWPRD/hVaJf8G2VDTGY3lu+aPHDc/LYuB5rkGMRvtAyVLJNcX1b9+TQwtlIX
	xwg6nCqPEhW6HBKO1qYi2Sgrs1+q1JTmsI+Q295ZUw48aTDryCj3r24diijfafhecTXso94P3hy
	08J6skF05qLKCiIC+S8zlNAdJQ5rNEcgYqZF9b0dnoVrtyuSjNdK1XK8UsdYgt035VQ/2QKK6Lx
	/su7QTiwhe2re30ePpFN83K/4+yWbcTPiC28x6mgmPL4Uvmwg2unwAp/dtyj410f3tPdDEDF1tL
	/K9IJJ2UhsgIijlwZWBsv2yV4NncVZ45b5cZHIgwxKro2vg0GZA4Z4WyiFsm3wosR+u38PCOqEh
	5npaTU5IX4WeqWuIS7Dj45O9bH7OVzKeameN80
X-Received: by 2002:a05:6000:26d1:b0:451:1143:7df5 with SMTP id ffacd0b85a97d-45eb38e041fmr2086899f8f.41.1779425992210;
        Thu, 21 May 2026 21:59:52 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:60a:2b00:c68:3233:6f5a:58be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb9asm1243676f8f.27.2026.05.21.21.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 21:59:51 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH v2] wic: Fix updating fstab for nvme0n1
Date: Fri, 22 May 2026 06:59:49 +0200
Message-ID: <20260522045949.184811-1-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 05:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237524

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

In case wks file references nvme0n1, update_fstab() function creates wrong entries
in /etc/fstab, as it is not adding prefix 'p' before the partition number (at the
moment this happens only for mmcblk). This leads that entries in /etc/fstab start
with:

    /dev/nvme0n11
    /dev/nvme0n13

instead with:

    /dev/nvme0n1p1
    /dev/nvme0n1p3

The patch fixes this as it extends the if condition and adds prefix 'p' for
both mmcblk and nvme0n1.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index a1d152659b..5600d72e61 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -133,8 +133,8 @@ class DirectPlugin(ImagerPlugin):
             elif part.use_label:
                 device_name = "LABEL=%s" % part.label
             else:
-                # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-                prefix = 'p' if  part.disk.startswith('mmcblk') else ''
+                # mmc and nvme0n1 device partitions are named <disk>p1, <disk>p2..
+                prefix = 'p' if  part.disk.startswith(('mmcblk', 'nvme0n1')) else ''
                 device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
 
             opts = part.fsopts if part.fsopts else "defaults"
-- 
2.34.1


