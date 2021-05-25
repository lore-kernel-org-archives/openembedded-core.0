Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.9102.1621946461300287648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 05:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l3yrRu1/;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id r5so45835015lfr.5
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CAKY13/6n/Me6rjJPB+h+5qIMXuIokSzYECs4C4TwM8=;
        b=l3yrRu1/LzXS8y9ibPRcJRlhjGZ4wP1hP7Q1ZddXJl4/jIdZfdL12Hwxrt6BFJYl5a
         ey7IH/21ayWZhcrdIbC3hteLn5armBTz7v45tqAQ/+8vNNbK8JkB5rRzkE8CaxDYn0de
         EoaNb1dr0lBxcF2K59ML7prsVdcGww1ykhwDWHGQ1TuQfRyuKgqjxbDSapRj1xVtwMl1
         M7LyMQEGjhPOgT8wnnl40X3rJWV9gakzELMYM0a+gEVpN0Fbyp121Z9mYHPCD5WD7Noj
         C5LN8sAueuh344SaSbf13DOpVLQH4iifk0zW8MJwevlVxqtH3gLHqbBOtQzubPnubtpT
         iXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CAKY13/6n/Me6rjJPB+h+5qIMXuIokSzYECs4C4TwM8=;
        b=s+f1wJyzKW/FdQFazk0G9OxsXuQ3wuS+OpP3VdWN3ech8ClAoD3eJqrmJevlYglLZt
         qhVT0lfVVSETLStnBtOg1Cse1CI4yPpOv1vI/CsDS1kGezPEfHjyC7GppapSAxcpCfPD
         SL5Wd38dkVnqt07h8NWKqCzc0cDjFBabQWFXypDN4Kx5DJAYN1DncVdfxeO6/3cDQzWk
         tMM6+XvEwUlShHR0KghNbcZ9vFPwsCtgHACESCpJyBbF1//v+/bW5Zt864nzZNbQRpYZ
         MubEp+6hg+IkhYBW7jxaQ9seJXu1712T68XlJOI1kihuYNnMHsuUXeXS0ZnyEUNnSdku
         zh9A==
X-Gm-Message-State: AOAM533xCqWsoN+UMYSKvVNNwIgTLTvrCkTQyMEDfvy2fZirC8bQjMBk
	qlk091538uNgsMnibb9fKT7jUl+eKJO3P1Zz
X-Google-Smtp-Source: ABdhPJwv/N8KyeFq8dOTDm3Rc08kXn4Bq4/KDglIBLxMWxhT5MbOdppR8+R5cMynoJaLAAp9aNVXUw==
X-Received: by 2002:ac2:44a8:: with SMTP id c8mr14113237lfm.232.1621946458871;
        Tue, 25 May 2021 05:40:58 -0700 (PDT)
Return-Path: <samuli.piippo@gmail.com>
Received: from munkone.intra.qt.io (62-183-187-94.co.dnainternet.fi. [62.183.187.94])
        by smtp.gmail.com with ESMTPSA id t1sm52507lfp.168.2021.05.25.05.40.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 05:40:58 -0700 (PDT)
From: "Samuli Piippo" <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] libarchive: enable zstd support
Date: Tue, 25 May 2021 15:40:47 +0300
Message-Id: <20210525124048.282824-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that zstd is in oe-core, add PACKAGECONFIG for it and enabled
it by default in libarchive.

zstd support is expected by CMake, which in nativesdk depends on
libarchive. CMake depends on having all formats supported and build
issues can arise when zstd is not available:
https://gitlab.kitware.com/cmake/cmake/-/issues/21552

Quote from a CMake dev:
"As far as CMake's design is concerned, we have no optional formats.
All should be supported. That's why we bundle sufficiently new versions
of libarchive and libzstd. If a distro builds with an older libarchive
that doesn't have zstd support, then that is not a proper packaging of CMake."

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
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

