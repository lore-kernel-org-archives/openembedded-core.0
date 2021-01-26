Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.12979.1611672174408289990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Xib50fXn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id i63so10523174pfg.7
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BcmNTvT5qIpThUGGd0ih8RCSyXRxCqpOAdfnJlZxAg0=;
        b=Xib50fXnYq7+31IytSKG9fdHAoGDlPw/4khjGIL9RZV5zqtoXQGjcJAyla0KjYIrgN
         jlly4mBkEQuolUMpm2pyZC+/9mN5bXLuR8Nq42GPbwPrH9Do+bSI2dT1w6/4YRN/EZAt
         u7NJ2rI7jEFoIOUGdUhulJFk5PGxtdZRr6BdkEKwXYqyfhD9h5IQl8VKVorsunCc5dUg
         ZoEDS5e/iYM4eUJKfgxI4xDGBLEqhQbAbH4XkYW440Sr6xNkI1G/knRYQQy2bhh/0lBf
         gx1VQh4BRxeL6vQa7rBG5a/CRU85zisRTfYVBPKJ9kf5lHvbVcu7CHhhq6PjZMYV+Wrr
         Bxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BcmNTvT5qIpThUGGd0ih8RCSyXRxCqpOAdfnJlZxAg0=;
        b=KfcYOVtpaYD+ueEFPa6cKS+O2ScvDgCboM+s3Yc9ur6ZKAncVlHtmK4zdqZSeat69G
         hO7rTnxpBGuwcQaA0ROVk7rTPxbhevKH3RsG+d/zTtrPOcPBDRRFe8UPIW2xmct89a07
         ePipyCdhih+yZPuVxeN2STJXkZl6X6yov7qUEQy+TZWjwgf7RViMa6B6h15TqzRv14/G
         pY4RZaGLh1o9D1MqF37HOjRF4J3UmZTKHpDmEuV/lwdeplNHm19mZ6e4Fs7GJbgucgwi
         r5vfcXB8VD9aE46IN6P8BOAOvFDL+KCKccqW+T7ugy/Aq2G9+9Czc8+JH0Dq7MSlCm5b
         hHjQ==
X-Gm-Message-State: AOAM530iO5BZB3kZdfAZLeq315/Ej14+UsCTQEMdIHk/roKqyvqPYIjz
	4ynUODMh1nQMvKi8LBiuFIzuJ4TqyjdC9WuUJ+A=
X-Google-Smtp-Source: ABdhPJzB0g13UDKgLFdVQ5lmKs7mp8bZ2oL7dtc+QiB3ToBp17TVcGrXOvwGsHiaRXkLzFvnWUrTow==
X-Received: by 2002:a63:4764:: with SMTP id w36mr5852796pgk.127.1611672173511;
        Tue, 26 Jan 2021 06:42:53 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:52 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 15/46] wic: Avoid creating invalid pseudo directory
Date: Tue, 26 Jan 2021 04:41:26 -1000
Message-Id: <92eed9dcaf57cb2aa1535e7199c96e2f1f49bda1.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

If the source of the rootfs is not a bitbake cooked image, or it is not
pointing to the root of one, we call pseudo again, which will produce
a new pseudo folder at rootfs/../pseudo

Eg:

part /etc --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/home --fstype=ext4

Cc: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 799a24ae78655f7a3eda7456b1a0ffaf3e43ec16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 18ecec2de9..1347571aa0 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -199,13 +199,14 @@ class Partition():
         Currently handles ext2/3/4, btrfs, vfat and squashfs.
         """
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
-        if (pseudo_dir == None):
-            pseudo_dir = "%s/../pseudo" %  rootfs_dir
-        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
-        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
-        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
-        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
-        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
+        if (pseudo_dir):
+            pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
+            pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
+            pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
+            pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
+            pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
+        else:
+            pseudo = None
 
         rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
                                          self.lineno, self.fstype)
-- 
2.25.1

