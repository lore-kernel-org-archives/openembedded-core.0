Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913A5C25B4E
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:36 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.33751.1674440553745477887
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=N6rH1C0M;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id b6so7948125pgi.7
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jt8h7eHx1jf1X56TyhoTVh3LqqLMDwnJZn/1l/5zJQ=;
        b=N6rH1C0MqsDHkyidXAYUgbeaJxWNeXXCx5iw4lw5tixXYgjFgU3balz3c3vnVgFGFf
         jOrqQAtgziOFPkq3W1qbazgIYya5C7kSkZl9OP/aHn7BhxLb+2IV8hdDuuDNoJ3lVYTF
         6z6dPGHmte/9JPaYFHaWhR/WzPrscBSiN0gnI7Fa5OghsN7tkfXTWX1QRg1exmzLBGrF
         AzRZNZklKRZkFO43yy/kcXWcs9zQB4+tkQf3cRfrq+N2QO8ZOrj3wwKzM4GrcyksxjLZ
         mPq5cUF8IpaDz2AjCElYhQ8MAzzbiN5PeL7UPIHQS1YFXc//rwjGFK3FjoAVBgnNMNs1
         SgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jt8h7eHx1jf1X56TyhoTVh3LqqLMDwnJZn/1l/5zJQ=;
        b=2xqSGWeQG5k6tnMgkd/fn0eox9NUoBbzyd6yWhsv/sQfiFssCm1vNWkluzjvH1W87t
         AJw3JTsWenpTL5xgTNYWJPDfX1xvW8a+7LG+hQWG/CSnbXgsbdThIG11246Ht06xR8Kd
         umKg/W9GxKuObIk51JzqeTlsqj3yvy+jTTrKwzGlXIz7i8MzVC8VGl3y9PHMlUBUqqpa
         OhzCVx5Uv/Ai8uOiUVqQd2c2DDLu+W9X9KKLH45OI2qf6net71WyDDzUzwWViMEa0Tk7
         jJJgaR5/brgRNw1kIbU3d9uFjxXEoCUcj6/L3r29ljzxKXyjyS4rIpp11kjh385X5z6K
         qcjg==
X-Gm-Message-State: AFqh2kprBhfbWTi+NHgd0Kt7oLUSwc10E7+UGqKDxmrozxd4/xry2fYc
	WQ/bXaKY+OGfINc0MGG+mQnXS63kdILAyKVMDsU=
X-Google-Smtp-Source: AMrXdXs+B4Ccb2WpvBO5V1AklU9TNj+MBYew7ML1oY2HFx7L3iunEKTMOSkl3+4uly92YJ0ky1FGgQ==
X-Received: by 2002:a62:1992:0:b0:58d:be61:8bc8 with SMTP id 140-20020a621992000000b0058dbe618bc8mr20877058pfz.8.1674440552801;
        Sun, 22 Jan 2023 18:22:32 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/32] tiff: Add packageconfig knob for webp
Date: Sun, 22 Jan 2023 16:21:19 -1000
Message-Id: <dafd8cf38d6414ca3102695b5a55a8fd2718e584.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176289

From: Khem Raj <raj.khem@gmail.com>

tiff-native otherwise falsely detects webp if its installed on build
host. This ensures deterministic behavior regardless of host.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 718c44f282310b2ca85877fed706460ccc1eebea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index b3737f962e..ef4fa97585 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -60,6 +60,7 @@ PACKAGECONFIG[jbig] = "--enable-jbig,--disable-jbig,jbig,"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg,"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
 PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz,"
+PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp,"
 
 # Convert single-strip uncompressed images to multiple strips of specified
 # size (default: 8192) to reduce memory usage
-- 
2.25.1


