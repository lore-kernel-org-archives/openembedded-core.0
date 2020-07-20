Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.35817.1595243320416239906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 04:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20150623.gappssmtp.com header.s=20150623 header.b=n7H5K7UI;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.208.66, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ed1-f66.google.com with SMTP id e22so12463113edq.8
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 04:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WyXWq5vN/P93jf5hX/EjLsleJOKlvLR8N2VfizcL1QQ=;
        b=n7H5K7UIxD32mxEtzSFxTnf5/jDhgWm6fOjf3XDK9buWn3TV/F9UGkoQs+xqfhX1un
         OzVtpSsxd34Qp6UJ5QTZc+NO8nWHGFZR+XeVDq8+8HL/P6oV5g8Ln/PloOlavPPMA1cS
         cz1RLWUrckhLAZyv6dyq6d+TLk2idwyr58vkrkMofrMBSdcnW74LWiiipVm70O5jT8jn
         OyShsFhmyYGbeikzGqY5oUNy1qkbUSLzJXKEyq2nUTn4ZHp1vhGSkWFg8Kf4Nstpcg5R
         +8C8VJ76Ju3HZyeubTVcDhu9dkd4VfAHTyrx95pPDd5jxvez+b3JdP2NNYvedhbJlKSp
         jwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WyXWq5vN/P93jf5hX/EjLsleJOKlvLR8N2VfizcL1QQ=;
        b=seWZ7AJG69yqcAv/pfHbuyXu5Qd2fNICY9MaUE9dCVQQihA9nH8tA8OqXwwrc/d9Pb
         45u3ifUk5VESVbqNe0jxWrmspM9bhNpm/5l7G0s7GrjstWtGa+GL6nwLHo4bBSx+tk/8
         ClgRo/vksS+J9uJWXQapM7zBggM8ToJqDgul9C+X63m6OaFu5OTA7k+jIGLGdmLypuSU
         R0l8dI3jWWTB5+hYMyoED/oB34ObdxvQlfG8VFB4+aKPuEn+CUhKhwLRilCG9aWAu8gc
         rSLIucA+pLcP10WYb2G/EkdxAAxsCsw7hqUF1Q+pp4zfiTt+mh1FZuG7IxIwRXorgYMj
         YC2g==
X-Gm-Message-State: AOAM532vD1Xjsfp4IyrbawKf8qo8s4itm7+RGCEGaTGZrV6XTIMPiptb
	83qxQ72Xe4n+srDP2aLVG7U9p4+tW7hxXQ==
X-Google-Smtp-Source: ABdhPJx3GAjTP9jQ5YNdD2xshhn5i0GZP31FUEwOoz/hrSzGGvJoshLt9YXG8EHClj7sFzO0Y73EAg==
X-Received: by 2002:a50:e801:: with SMTP id e1mr20453645edn.251.1595243318656;
        Mon, 20 Jul 2020 04:08:38 -0700 (PDT)
Return-Path: <daniel.ammann@bytesatwork.ch>
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id be2sm15141358edb.92.2020.07.20.04.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 04:08:38 -0700 (PDT)
From: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] image.bbclass: improve wording when image size exceeds the specified limit
Date: Mon, 20 Jul 2020 13:08:17 +0200
Message-Id: <20200720110817.21168-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 meta/classes/image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 694b58fc9f..3b5600e550 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -548,14 +548,14 @@ def get_rootfs_size(d):
     if rootfs_maxsize:
         rootfs_maxsize_int = int(rootfs_maxsize)
         if base_size > rootfs_maxsize_int:
-            bb.fatal("The rootfs size %d(K) overrides IMAGE_ROOTFS_MAXSIZE: %d(K)" % \
+            bb.fatal("The rootfs size %d(K) exceeds IMAGE_ROOTFS_MAXSIZE: %d(K)" % \
                 (base_size, rootfs_maxsize_int))
 
     # Check the initramfs size against INITRAMFS_MAXSIZE (if set)
     if image_fstypes == initramfs_fstypes != ''  and initramfs_maxsize:
         initramfs_maxsize_int = int(initramfs_maxsize)
         if base_size > initramfs_maxsize_int:
-            bb.error("The initramfs size %d(K) overrides INITRAMFS_MAXSIZE: %d(K)" % \
+            bb.error("The initramfs size %d(K) exceeds INITRAMFS_MAXSIZE: %d(K)" % \
                 (base_size, initramfs_maxsize_int))
             bb.error("You can set INITRAMFS_MAXSIZE a larger value. Usually, it should")
             bb.fatal("be less than 1/2 of ram size, or you may fail to boot it.\n")
-- 
2.20.1

