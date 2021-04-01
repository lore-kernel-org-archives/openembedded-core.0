Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.7006.1617310136511615880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 13:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bgwhMdgp;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id f12so2473837qtq.4
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 13:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LVNzKyVBuqm7+9ZVB0l4mH+Q/qFF6ShduPkknG5K9uQ=;
        b=bgwhMdgpmorKTQCr+JtsdON53h1bGfHa6Tja4UknPt2VyF2RCn3gAIZOk0tsR4HO5O
         7vY4iiZNGiBz0D2RAhxp/qvCzK0d0UdsmffqLBLJqYmiP1nct7JdO+3LdOwyRx/YwZar
         OUgF7fD9wp1jj8oMuJ0c8O0bsMcQainQbvLnmPkEouAfkiTzr0A7MkvXHrlJOA9j5d8T
         tqAA1LUpckjfFGulq7a1EvjRnm1krH/M67ePbXRH1EOHSfAb7yDnhNjSqmss+QmaCN24
         L/jB0S/yuFaHX8PcRM9uwe2bwqnblStOPnACzSOsqSPTS6YDoBLooIf5U+PsMZdhijcp
         WqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LVNzKyVBuqm7+9ZVB0l4mH+Q/qFF6ShduPkknG5K9uQ=;
        b=Uw1JNuWLHpE8VZoH4wIegdx+dRqokT78RpXsDnmONhHi9rGnbMPmRMA8Nr9jDVc1HA
         XkXJ457XaSv/d+KNLkDvhRlyAZaJRjJe3kX6uYdm2BbApSAe9tQP45Et/SdDGK6XuKO5
         XsmJPgetsNQuWTzKK5nITBg6sZH/2CL3N4v73EyeebY43ysL9cziM9xyzzoc/z+Ccdxd
         IHoLI3inxoim2vBrU+Z02HHaQq+zgBekBMCLUikYdqRy1e1erfsSzSLbmhtcSu691Qaa
         x1Ue1WSzlyujhrWyVAz3iKt+2M1BNgeLEI0Fk1AWWj3RJ1Mf9B9SybL5Cwo/dJaDF2Sm
         mtbw==
X-Gm-Message-State: AOAM5311u6dwCCSf08SeYBTNclkG/UeK12P9kjoxoPj+1gONoFiRtdcq
	ZNIt5vuaQJvlv58qu2ufVQlvlcVzGDY=
X-Google-Smtp-Source: ABdhPJy8wycaRAAu4K0QLbHm7NBlRVxKMB7vZ7vLyeqKjSc56aIHeI3FPkBME3q89e579OnQEwcb1Q==
X-Received: by 2002:a05:622a:486:: with SMTP id p6mr9015144qtx.98.1617310135573;
        Thu, 01 Apr 2021 13:48:55 -0700 (PDT)
Return-Path: <champagne.guillaume.c@gmail.com>
Received: from gchdesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id o7sm4985165qki.63.2021.04.01.13.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 13:48:55 -0700 (PDT)
From: "Guillaume Champagne" <champagne.guillaume.c@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [PATCH] image-live.bbclass: optional depends when ROOTFS empty
Date: Thu,  1 Apr 2021 16:48:49 -0400
Message-Id: <20210401204849.4360-1-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`ROOTFS` is optional. It can be empty if the live image doesn't require
a rootfs.  In such cases, the build doesn't depend on
`do_image_{LIVE_ROOTFS_TYPE}`.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 1b2183eadd..8b08305cdb 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -30,7 +30,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
                         ${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot \
-                        ${PN}:do_image_${@d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')} \
+                        ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')) if d.getVar('ROOTFS') else ''} \
                         "
 
 
-- 
2.20.1

