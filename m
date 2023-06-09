Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2941CC87FDC
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:16 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.133.1686329654565059414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=IxCBh2zo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6563ccf5151so2115941b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329654; x=1688921654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRdPwRrfsfwFIOrz/mqSqpXneQecfdim6K4w9A6f2AY=;
        b=IxCBh2zovsECZ4gi9TP01u/9Jw4m26/yFc2Uih+tkonWE6BhBb22IJsC817W3pXu9L
         ao2mLbGepxNCd/yT03ENFsJfL5nk6CSGA8tytrvbdWZ1LcyOkgAH4aiMGuQCE63eUkbV
         ttqc2MlbW34n4tQ8Rfd982SnvHBFN4Ud/W5iQEfzJSWs15fICFIISoapzxIUWS8avr5c
         BrMZYZFLV/3Mi8ZXHe8P4XlMOsUdOw14isQpONIHH6U1dwycNL2NyUmkz7A+hh1GHL7N
         2ocRHkaiZ/TjlFCv2YiNIDuJtbeA0Lf1sABPG3gRdbMl52DaUCZ7T60DEDKucFnwCqSe
         kLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329654; x=1688921654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRdPwRrfsfwFIOrz/mqSqpXneQecfdim6K4w9A6f2AY=;
        b=P6+/7Z4TbFYCixFPtz1LkdaWy9wjUX/PGXvLYw1UVNqbD7r9PyCg/3xyDE+bqW6wRh
         4hVvul9wgBTHJqr9G5LXNhZqX3xX4bnUPZrU7XzHQUvW07Cg2uIUuEMbDOuDnqJ5g/dZ
         1yFsGOEirMl43504c/cma5jmH6DJcNkORzQjSoGvzOVKhygG7v7IkemEivRsIkmGZFq3
         6qNGHP6ilTwVBvBfQFKRYICSgqz34je6y2H/x5O0T22mOHMy2nNd1GPXPjmc1yrJnA+9
         zkaDFgdrsDjFzyIS6zMiHD7b2ea7cUx63U0TLH+8mokWjIlwUqX6KtrOdraeEm7t0FUV
         CdsQ==
X-Gm-Message-State: AC+VfDy2AMcnRkYgdl1GP5THzk6TOAphmtGwTrHBsxblJ9T++ufkPmVf
	hbW3zztF8V3Ty217a1D5Ydf8YGzbVaa23ugVN/Q=
X-Google-Smtp-Source: ACHHUZ5fxJRgQfsprZbtQiZGbEFdg4ifgYBbgNQGG0UPpyXSijCm3DM9zqQx3bE7zAPUK1HWVPRXog==
X-Received: by 2002:a05:6a20:3d08:b0:10b:91c5:45b5 with SMTP id y8-20020a056a203d0800b0010b91c545b5mr2124029pzi.31.1686329653734;
        Fri, 09 Jun 2023 09:54:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/30] xz: upgrade 5.4.2 -> 5.4.3
Date: Fri,  9 Jun 2023 06:53:33 -1000
Message-Id: <c450040e2f177b2ef64c0817ca0aad4051d5f25f.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182572

From: Denys Dmytriyenko <denis@denix.org>

5.4.3 (2023-05-04)
    * All fixes from 5.2.12
    * Features in the CMake build can now be disabled as CMake cache
      variables, similar to the Autotools build.
    * Minor update to the Croatian translation.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 75aaa3d8efa9ba4fdf7145321dc85b34cd3dcebb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/xz/{xz_5.4.2.bb => xz_5.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.4.2.bb => xz_5.4.3.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.4.2.bb b/meta/recipes-extended/xz/xz_5.4.3.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.4.2.bb
rename to meta/recipes-extended/xz/xz_5.4.3.bb
index 87f9602bf6..e1cdac3014 100644
--- a/meta/recipes-extended/xz/xz_5.4.2.bb
+++ b/meta/recipes-extended/xz/xz_5.4.3.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] = "87947679abcf77cc509d8d1b474218fd16b72281e2797360e909deaee1ac9d05"
+SRC_URI[sha256sum] = "1c382e0bc2e4e0af58398a903dd62fff7e510171d2de47a1ebe06d1528e9b7e9"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.34.1


