Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.12014.1589462407334636816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 06:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=adPbwqSD;
 spf=neutral (domain: kynetics.com, ip: 209.85.221.68, mailfrom: diego.rondini@kynetics.com)
Received: by mail-wr1-f68.google.com with SMTP id e1so4061494wrt.5
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7fB2ptv1eWDI/DQeguScMjpTO0S6iwapbK3i7Uv/uZM=;
        b=adPbwqSDh5n56P1cUWCvcdqwhVYQMBIfopjrRU9nKlDAuiIhrIkr8hnnaqXouiWMBB
         sV55Efb3b46CbAjaYYzYiuhThIYvODB3qlBBgE/UObLRiJsfX8Eneqo3epjYi4d+hV50
         21tWRbj+1/c2Gd6gMxJ2oGKa4W9q8D3bZ2AWPO7/wv4NStUzypSDMlnkfe9EyEtCfcnv
         xbVLsPQSDlGOpEo0cgV04HyDY5usyP1xJAVib+QFL+uv6fOY8f2ZOoXt3nIoX4Ge0mJm
         PO9oxLbkOVtfkgD5OjZ0OBpVq4W7WyWljCVIBfG9W9irZgM7hdkvo6T6om6gf15b2EBW
         D5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7fB2ptv1eWDI/DQeguScMjpTO0S6iwapbK3i7Uv/uZM=;
        b=W1vAgSEuExJ9ZMnnH05sBglmwTbLyc7xFJVwHRjMBmkmi8p8mt3O2HjZzh2GE+vZLD
         rdeauLMfhXvxXG2/Fyy95fzHu2gaB5LX3v8UEGrujg6fiSkJu8j3M0yZIYpGtx37rg0l
         N8IPA5pGyiZ1J59pR/Wj1C+4zP0r8IhAhc29OXzhAya8d7kroEmTOmDVpASe1QuVI3pA
         5jgtuPvICUwNpxvXfgV8yDiJJv99jK0g7qE+pCtd+CcAywBOTOCaK0+GBDdPDL9NnUHx
         5pmJoOXmyyuBemnmJBgxr1hlSPnqa+JK8YATaDnrx0M/IE1W153vmGjHgGBKzoowt5+l
         bKWQ==
X-Gm-Message-State: AOAM533mQq34KYhe8JrCraC1Dm9VpMfDnMBTO7NGiHvgv6oWpgxzFAv3
	HOzV3yu5CPOMLQr76l0fZmAVDSNcjdw=
X-Google-Smtp-Source: ABdhPJzm4MMGUQC3/lDih1Tbg1axhMfx56PzC/b6AleOxbP9r84gaAEr+5zC3mQKrnGjmUnXRuQ8Sw==
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr5292428wrn.137.1589462405617;
        Thu, 14 May 2020 06:20:05 -0700 (PDT)
Return-Path: <diego.rondini@kynetics.com>
Received: from localhost.lan (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id m23sm4487630wmg.45.2020.05.14.06.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 06:20:05 -0700 (PDT)
From: "Diego" <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] image_types: declare support for wic.zst
Date: Thu, 14 May 2020 15:19:56 +0200
Message-Id: <20200514131956.18463-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare images in wic.zst format as supported, as bmaptool now supports
zstd:
https://github.com/intel/bmap-tools/commit/1b8437d58447d3796dc11fd0f2c62bec5746e5d6
Given the very fast decompression speed of zstd over, for example, gzip,
writing images with bmaptool can provide big write speed improvements
when decompression speed is the limiting factor (especially with very
sparse images).

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f82f1d8862..ab05cc90ff 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -273,7 +273,7 @@ IMAGE_TYPES = " \
     ubi ubifs multiubi \
     tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
     cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
-    wic wic.gz wic.bz2 wic.lzma \
+    wic wic.gz wic.bz2 wic.lzma wic.zst \
     container \
     f2fs \
 "
-- 
2.21.3

