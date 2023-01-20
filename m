Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14066C25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:00 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.82178.1674238316102496611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=C6lWY3hZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id c85so4570411pfc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCZhVYhBjeuMCXsyViHrne9wV3yQ/eM829UI+kr8IHQ=;
        b=C6lWY3hZsyzI8lfu4+xbmNTXrelpUpc6FNJYQM8cHQzp19rpOxqwb3J0NUoeLBFGFC
         Su3OOXaSVloegR5pQJkqukqqTaZMeTHq83lwjKAb6vK/afF/wAaEQfQacncDmFN7Cugd
         qOZ6WozX0+bG2M+pF27CP3Ik6ijn//WooLlCKXMw+2AxKSUVF4A+UUL84IeLITbO2SPZ
         1rYS5a6Yov1Pz1GGbzjzvPIb7TJ3RN78Fe9Zt0PMjHfLNClUqkhxILYOJ+4LEtJa7h9F
         dMVBvN1yeKETCElhMLM0Bc28Jt6gKmgK5wCdnLzEV02+2vm3rnmlFKvU65vXkEQ0eBMQ
         /2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCZhVYhBjeuMCXsyViHrne9wV3yQ/eM829UI+kr8IHQ=;
        b=QJIFXa+zwzRWYoZIXwaixgMEcMfjwBdyxKKmpleXImPIWcRSZVgoOrMgL4q9dVsq/C
         dqK2R8HnR7XIE6b5BNGf72QCuotdPVGAZQd2go9v1NWQmNUy3PdwFv50EqhKTTobft+K
         BRHwZJfJ2/n5su93klgnLeQtwROo387hkVj76097YxfYqYfLQdTx+6FXl8s+4aBFXTsV
         hRdeLNKIvMgAPy5smKNwNMLz2iAoFm5KqjEY7XGc60yJGyrA6ni7UAkHOmMSTrsEmMV1
         2NauC0EqAH7MGCCWUPh2Nn8ItlIl3FBeAq0e3NxpaKIhxfWG9UWiXkuwEHrfHWhAL3tX
         DtGw==
X-Gm-Message-State: AFqh2kp8susUFVkFHk4jLzQhHojx7w0z4ZWfzGGeCHqA3uZDsbYiECHw
	G/xaPgoShgbSy/gQ0sHqmKPuOS6dQoy1UVeTXNg=
X-Google-Smtp-Source: AMrXdXsdgMSx0TvXtKGONNxi4T770S2lRXN2yjJjlEE5b+Sc5ylOeB8JjUdC2qfMb9PDErUlkXGe0A==
X-Received: by 2002:a05:6a00:1887:b0:58b:c688:6ac0 with SMTP id x7-20020a056a00188700b0058bc6886ac0mr24328336pfh.10.1674238315192;
        Fri, 20 Jan 2023 10:11:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 28/41] tiff: Add packageconfig knob for webp
Date: Fri, 20 Jan 2023 08:10:45 -1000
Message-Id: <02a77676bab5fe36f8209d9eedd38a384d6c0ab5.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176235

From: Khem Raj <raj.khem@gmail.com>

tiff-native otherwise falsely detects webp if its installed on build
host. This ensures deterministic behavior regardless of host.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 718c44f282310b2ca85877fed706460ccc1eebea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index 970aab5433..831014bff1 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -45,6 +45,7 @@ PACKAGECONFIG[jbig] = "--enable-jbig,--disable-jbig,jbig,"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg,"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
 PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz,"
+PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp,"
 
 # Convert single-strip uncompressed images to multiple strips of specified
 # size (default: 8192) to reduce memory usage
-- 
2.25.1


