Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC9DC7619A
	for <webhook@archiver.kernel.org>; Sat,  8 Apr 2023 17:13:08 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.908.1680973985026089798
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Apr 2023 10:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RIB0iIk/;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id c10-20020a17090abf0a00b0023d1bbd9f9eso3870127pjs.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Apr 2023 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680973984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0p4cLZxpCVvUpfUv5X3Kcsb21KHYlNjVe29Wsqvokk=;
        b=RIB0iIk/isCDBBqCoLB0GFRnyt/Zd4OVhKeFn4HUyTIjT4F/XnPWUhB0k6vXqMa4Oi
         E6alkRQMH+VTC52Bj7ZkSRt6IKU2Nvd7ar4acG6oEWCt4PAZU+bl6b5yyY8buzmbnFQR
         3m95OnOH54/jE5eM048tnyZFs4POUOUy/qpavVXKJ3HqVSr+tS9+KaGBKPhMeEb3VXif
         ZTT+sXhb7/bE7f/RVk4a+uF/RcNeLtAjACQuHAjmCSIAeTUyC0N5pICHG5/0AXXVe5WL
         9C15P+INQG/P6gVn9z5mGmwi6yTI7XGWnKaXff35hxZnmhF9HGtUmZTx70MlA8JyRUIe
         NNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680973984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0p4cLZxpCVvUpfUv5X3Kcsb21KHYlNjVe29Wsqvokk=;
        b=1okOf8LS8bh0wIIQIfAP0m6pQjE8d6nFJoAPK88lVWOVsWvOexthLYlBmMF9r5eMfB
         zQZS3Rw2/ZZAKpZFqBHMepYNeCFGCTxxYgDWDWYs7rixWVlnEpLG1JMx9cBJYy4V5aRf
         fPrfAx7+PqQCxyS5H/2yhTa6wqoXf2qui4vomruj3/ObfODov/0FcjJ+XEI+yUg+OYwX
         zVwNBdtWig1umNBvyzRv7EzOC/tJvBtWFL94uPFVZGR6tqx5NZkmnQXUxGHOw8kdNDOg
         6YQRj4RYxT8IBIQnqGmEPc71SjmpIhL38v8pR/JWS3gRoHdg18zTV0VKUhHtH7Ntxpe6
         L2bQ==
X-Gm-Message-State: AAQBX9cwDWZ4+7jhvgtdteimlYF0w7MVF1/O5HP5jvWcfVw+ZP+T5R1X
	G4X4ctyuNAckBV5NHLCXUcmZu8DxZicYGQ==
X-Google-Smtp-Source: AKy350bDyRRpvYbNxumIw60oW7WKveSr/FylOudCfe0GO7on8h9C+uT50EbNxkjkljrMmx0l950X6Q==
X-Received: by 2002:a17:902:e802:b0:19c:be03:d0ba with SMTP id u2-20020a170902e80200b0019cbe03d0bamr7744555plg.18.1680973983972;
        Sat, 08 Apr 2023 10:13:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id bi3-20020a170902bf0300b001a245b49731sm4745949plb.128.2023.04.08.10.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 10:13:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] e2fsprogs: Define 64bit off_t on rv32
Date: Sat,  8 Apr 2023 10:13:01 -0700
Message-Id: <20230408171301.2198057-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Apr 2023 17:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179830

Help configure to build it correctly on rv32 and musl especially, it
shoild not ideally poke at _FILE_OFFSET_BITS, its not a portable define

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index 2620610903..f29c55e346 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -20,6 +20,7 @@ EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
 
 EXTRA_OECONF:darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
+CFLAGS:append:riscv32 = " -D_FILE_OFFSET_BITS=64"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[fuse] = '--enable-fuse2fs,--disable-fuse2fs,fuse'
 
-- 
2.40.0


