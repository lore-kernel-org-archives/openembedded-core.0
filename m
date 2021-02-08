Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web09.35236.1612792491394366049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XHetlMqx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id 100so7522547otg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IilND4UHrvwqLwg/n+uA0/gRj5taEYyQVDmbgXVmiu8=;
        b=XHetlMqxqJvIwrcaWGRaTflkGSB2vUZrsq1PbmRBO+6Kaenf1jPSXM0ifFVUDcqPL+
         zlS4csWn9+pcR8CSOry0CClaGFaBSpVuQ2tdiDhvnhm5ofrwcj4l8gnbaUFVNWA0Uv3E
         JTVGHewL4S2dKpnlZbB8yddBsWyE4qUbDGGxMGpBQ+yKRqCXKCnCgVXc0mvkhL00ULJ+
         ykDSzfJLDS8HWMp77XpaBYuIi64N54Jv0n6nbWd1wcH4kvDTtJHpuXeeAQXuLpc1qP1O
         VI88vGOPmmzq/gKRv53F4cWYN9p8XYelc764nGWCl+e+MpPN+Dky71Uld/OiI56V/uRv
         7gMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IilND4UHrvwqLwg/n+uA0/gRj5taEYyQVDmbgXVmiu8=;
        b=i2z2B6k9EfqajQq6IMAOKeje52Q/8LVTz2SYlYERx/B4R2xqekQ/+x+IYxdD6GFVmZ
         vTDPZZbd0t4ym0Z+nPyaXErJYHuH5Z96SgHinzIBmBiEm6JYHGQepa1q0T8ImgbTB/0T
         Iq4o5CwqRwl0nEw5wxtG7QUxd6Xnr3lxGMuurfHeSI73qbmNrx8nEx5nXS35WeBe5L7L
         6FvivWn/bFjVkp0KjfyUuXsFqibMJRqBGbTdpt0A8/vVfNyJai61MNjWNTPCBvP3mEBz
         rBcf9VptgIl2KRDZW6xa2fw2t7ckWFcaWPV5Ull+IJvyn+RLjEj2g5r9Vba3e6o/Merv
         e26w==
X-Gm-Message-State: AOAM532C9u/9ryFzjiU+mat+Pz4ewmMQT3YmdyABs9Ed+TSMbVXOeY2q
	fzGxnn/B29iUHBu8S4E1caSMOG4E/yv2+WOzEYo=
X-Google-Smtp-Source: ABdhPJyw8ZonGqsafprS+vSjIrz+v7hjxabZl1bAphq73G4rTsx+hEHbanV/9abzr1rIskASccm1Bg==
X-Received: by 2002:a9d:6ac3:: with SMTP id m3mr3640657otq.52.1612792490258;
        Mon, 08 Feb 2021 05:54:50 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.54.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:54:49 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/28] image_types: Ensure tar archives are reproducible
Date: Mon,  8 Feb 2021 03:52:10 -1000
Message-Id: <347808ca0898452d9656317cd24559bc34f9ed78.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The tar output seems to vary depending on the version of tar used and distro
configuration. Be explict about the output format to avoid this and be
determinstic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c56f3c9febc1732aa1302524c6c4da36f16bd1f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d81747527b..6de16d42b9 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -126,7 +126,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 # required when extracting, but it seems prudent to use it in both cases.
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --format=gnu --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
2.25.1

