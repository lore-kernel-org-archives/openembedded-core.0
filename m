Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.20223.1594649858937457600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UPRlCrju;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id l63so6060392pge.12
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oC6/Do2C9dkYsM8X+pEzb8ugmb88kxj+EIwTVvPPlrg=;
        b=UPRlCrjunT1v9rRk8Oik1r87PRL4YfUOJg4egMJoPKtRU1ELIE4bakX4wOq4rwoXwM
         LiCEerZ2fwTVOtHtgxET3M62+rvTLKDmZK36Yy4CTgP9X14Ixuyp699jQljrNs+Erxta
         VJiETxPg3cbF9TJA/bI/6V1bHMP2gSJXWw40Xk26v7+k61zLbmF1Hz3kwEmx6ZR+5zLv
         e2ONPZlTGMdY5ccpPOy5mpzgWX2hz9658yHaaBkVOOv8AoDAa6cdb8KIs/C9Ww0vTxOt
         EvcE/S/mw12tEWs/2ManLHFMMQDaCnrmDGOVS0P03ysVkoTEmFEMZgq5DjI17y5U9EpR
         PMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oC6/Do2C9dkYsM8X+pEzb8ugmb88kxj+EIwTVvPPlrg=;
        b=dclNqmnyBEk1H5VeeGFfrbyiJ8ZR8dXLCsBZ/NL8/6w+7TepukrV6ruqDFKhGRfkpb
         5iu9iMtbNUhjFbXmrmHe2mAhkoN+busUGaT6NPl5sTCDL+vtdhiz+2KhemSTlSCAPahU
         3tL9inOm3srFyEAlV2m3OiixLrmqX5b8mKciFmQLP6NsQRlcvZQajSqo2OQJ9YVuFYoF
         qOhS7mZxflsMOa+KxVWzHSDL5qSvFueWXXYOU7FMm/PTvwz70kkbqZugylnIDOrySnjo
         UF6r+Qv6bGPiJEFfBu58MBB8Wv6NZRF1NvvaaP4NEAK2GYE5y4vWpEag7nKuqyL7XMC9
         rwvA==
X-Gm-Message-State: AOAM5332b5/n8T1s3CDraB6OTHG7bw/s/Cv++B1fUusbqcaQ4JkhFauT
	LmR2cItE0MiqT6IhXvR0VG1kF9N8nGuIXA==
X-Google-Smtp-Source: ABdhPJz/jvZeMIvwXFquXhS+MiDYYS1g7V7tJH5KZGtAzPCW8TiOwyeanwdhkfQ1K2ez0Mp1gjwL0g==
X-Received: by 2002:a65:5c88:: with SMTP id a8mr34748687pgt.215.1594649858116;
        Mon, 13 Jul 2020 07:17:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/15] kernel.bbclass: make dependency on lzop-native conditional
Date: Mon, 13 Jul 2020 04:16:56 -1000
Message-Id: <ad44aab08c0c204923d44aa37c39559a7bd843c0.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Timon Ulrich <t.ulrich@anapur.de>

a native lzop is only needed when an lzo compressed initramfs is actually present

Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9e3c34ad48..af7e88b380 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -4,7 +4,8 @@ KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
-DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
+DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
-- 
2.17.1

