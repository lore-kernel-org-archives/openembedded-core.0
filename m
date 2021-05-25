Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.7344.1621935332221291189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 02:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UEfJ4hse;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id c10so24038002lfm.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 02:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VJE8sZrTpM52H7jTlI4s+VXbOBMBuXGT5d7dtKdF/eU=;
        b=UEfJ4hseXXMNwiRbkIYB/wJ31d7W+MxjBTPKTpKYvP/39Cz3M2wnyuPlMZXMyd/TL/
         eIHzyYnE4gj9IduGUXaEcQkHIlBgrmMDNxmaD4qomVidF853g/h7Q1dgVsH16FWgR4V7
         gx/XfSvYrF61MxAUCP8BmjT4D+IoLdxs4/NjfEEODRCB1KxjFIdT+1oLXUDZONkd2Y2k
         cNWXD/SWZyCLgl6IfrPdaKNQWnYsiuP6UCT2b/pKmxk0OWTM2ovab1W8tlce9HNT1gps
         b8sw6E30KnWkIImE10pWkEQh29F4wpTvYFcK3rAijRvWYlfaEC+s7urARCiUuGIF++gi
         D35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VJE8sZrTpM52H7jTlI4s+VXbOBMBuXGT5d7dtKdF/eU=;
        b=RcTMcwGJRDgfe6XCzW8e0TZ0OUGqi/NUEqjzq9PQbjFZaNJUZG9lbuf0gvfvmzsoof
         ivg27IWWv4Yu1hks3BQSNIIlBNDh0B1wRwcq5zCDFONhczioZf4MtGzNMKGOd9kaWYoD
         H1b3XTN+fc3sd4YV1S10PgsCHlj7O6yHVJlLMG26J0EuRpXgkubv5lxoyVdvHLX8b1AA
         UQxip/SGMme0YO5pZMI9oWi2MATnLBNQqOrp2Q3EXUja2Wj5riH9yDDmq1/Uz5pKQ2hL
         XwIz71K4HVE/Z2tBqvJ/T6sEDpEbRbAasJtpvcgk/2YCmgALCs/KfEvycqBdvtWbO9MF
         2bQQ==
X-Gm-Message-State: AOAM531RVGJLuWuq2aNBAeYfUilzN0PizQtQde4yFmkFvFKgNHg958UR
	HlN0iO672ccQaOz0sVKShDQZweoqk0dfARwc
X-Google-Smtp-Source: ABdhPJxsaX78cxMxylSB4XaCzg3sywA9ZPhH9GOucx+eBfsmUVIKUbDw8MGIci2KZsfYXdf4r5CQOw==
X-Received: by 2002:a05:6512:6d3:: with SMTP id u19mr13997798lff.236.1621935329933;
        Tue, 25 May 2021 02:35:29 -0700 (PDT)
Return-Path: <samuli.piippo@gmail.com>
Received: from munkone.intra.qt.io (62-183-187-94.co.dnainternet.fi. [62.183.187.94])
        by smtp.gmail.com with ESMTPSA id g19sm2022658lja.139.2021.05.25.02.35.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 02:35:29 -0700 (PDT)
From: "Samuli Piippo" <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libarchive: enable zstd support
Date: Tue, 25 May 2021 12:35:22 +0300
Message-Id: <20210525093522.3860494-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that zstd is in oe-core, add PACKAGECONFIG for it and enabled
it by default in libarchive.

zstd support is expected by CMake, which in nativesdk depends on
libarchive (https://gitlab.kitware.com/cmake/cmake/-/issues/21552)
---
 meta/recipes-extended/libarchive/libarchive_3.5.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb b/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
index c9e30f468f..ebecee1f3e 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d499814247adaee08d88080841cb5665"
 
 DEPENDS = "e2fsprogs-native"
 
-PACKAGECONFIG ?= "zlib bz2 xz lzo"
+PACKAGECONFIG ?= "zlib bz2 xz lzo zstd"
 
 PACKAGECONFIG_append_class-target = "\
 	${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)} \
@@ -28,6 +28,7 @@ PACKAGECONFIG[lzo] = "--with-lzo2,--without-lzo2,lzo,"
 PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile"
 
-- 
2.25.1

