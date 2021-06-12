Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.10989.1623536048690170787
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jun 2021 15:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SKZ7iopB;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id nd37so2295029ejc.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Jun 2021 15:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=sqPRB64I7ClxtqXGz7xRLuDK2uPVkocK6IUgCCRIVIQ=;
        b=SKZ7iopBeyRZ4F2D8sqS32ug1BhKhOLuMc8cDENnzYPCK8lD+rcKAEh7jqWkGS6QDi
         7jUoTmeVHBaYTbVBjZyGA5bCY0bRRRQ3ZA0Jw+I4mAHtxh4O3XGkICBahGW06YLg/w45
         vwzWrXhTD+qvgBqrmPKm4Iu5HXNnjgNLIjEoztux/JtfNq96OtZQxrlec/rwef+CxFyr
         bxyKiJOEjTb/hHmaFc8hjln17K41tb6t461WJ2iQWkEcZ3z0EVCirsOvhONg6x1bmbI5
         W8fkQOg2OYMDcfDUqGvBYI5vwHpWv1eXsEbNV6BNogbpf2/uFR3Z4ZzEigvVaDz0i3yR
         opCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=sqPRB64I7ClxtqXGz7xRLuDK2uPVkocK6IUgCCRIVIQ=;
        b=hZroyV2qMsxB+RixQyksxgF3yzlXTUfxaRMQAH9V3pymDTreDMB4JDODrwkihvQoRR
         RnhbpwqWAY9AahYYENKXnQat2t4zwTG9qUJKhcx14qheCNMeiKEUXbCPRBKi2aqWd7ku
         twM4SlZxmI5lLU1+QBkjw1soZLmy1ZgzmiTaDXGnER9vuXPCWCroEHaBLKPe+VhTzC/U
         TkTQjhYRxJcn/i5O3d1YXlk24JIQeX+PRKG6S5/8i7xdhXVgJxlPrAlAMV6tkIGau4r3
         4JFnEpXk2Pmb8A6OVDlINqUEN1z0IR6QbPYooO6Pazh+G33HqnCGVVkQw9yetmIjcKIL
         PhUQ==
X-Gm-Message-State: AOAM531eqDgDrWHgb3blAj01V1xV9aVnA93tnl400YtJspFXCfI9rAjc
	xgqYpnY3+sjKq/7W3hapCJPQOsLxtyWodDKo
X-Google-Smtp-Source: ABdhPJziKHQ/rH1x5thmc9xNiBg0VHHb/fzbQpagzRXUvy55c/enFc5zEjeR6F6/IcIF/t/pXwIaTA==
X-Received: by 2002:a17:907:3d8e:: with SMTP id he14mr9360826ejc.178.1623536047139;
        Sat, 12 Jun 2021 15:14:07 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host-87-0-253-36.retail.telecomitalia.it. [87.0.253.36])
        by smtp.gmail.com with ESMTPSA id dy19sm4509249edb.68.2021.06.12.15.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 15:14:06 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [OE-core][PATCH 1/1] kernel.bbclass: fix do_sizecheck() comparison
Date: Sun, 13 Jun 2021 00:14:03 +0200
Message-Id: <20210612221403.24123-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

The routine do_sizecheck() was historically needed by legacy
devices with limited flash memory.
The lowest extreme is probably with Zaurus collie having exactly
1024*1024 = 1048576 bytes for the kernel partition.

In the years the KERNEL_IMAGE_MAXSIZE has been converted to kilobytes
thus rounded so we have now KERNEL_IMAGE_MAXSIZE_collie = "1024".

The effect is that now the check fails because we hit curiously this
 | WARNING: This kernel zImage (size=1024(K) > 1024(K)) is too big for...
even though zImage is 1047288 bytes (kernel + kexecboot-klibc-initramfs).

Fix this case using test -gt (greater) instead of -ge (greater or equal).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8693ab86be..379bed44f2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -714,7 +714,7 @@ do_sizecheck() {
 		at_least_one_fits=
 		for imageType in ${KERNEL_IMAGETYPES} ; do
 			size=`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$imageType | awk '{print $1}'`
-			if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
+			if [ $size -gt ${KERNEL_IMAGE_MAXSIZE} ]; then
 				bbwarn "This kernel $imageType (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device."
 			else
 				at_least_one_fits=y
-- 
2.17.1

