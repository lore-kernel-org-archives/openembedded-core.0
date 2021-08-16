Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.21554.1629103977857173596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 01:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a6WiwKiE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so5131408wme.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 01:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b3etXpBOUo1Gw3HXEs6SVifd4oNyPIOO7VP8aHGcJmA=;
        b=a6WiwKiEi1Ksc+gSkNdv4aHAjloEhfLGpSAHm9zac2Z1+AuHRZ5zljDECRmOmWHZfr
         m59ftpu2ksb111mVktVblW842UD5bp+Eqr8rF5tK5Y38Kiro51uRVnKt5p76l7QwCScq
         X/TPtQ0+Ws7TbEaiDCpoSDmN2mc3OYCkba7h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b3etXpBOUo1Gw3HXEs6SVifd4oNyPIOO7VP8aHGcJmA=;
        b=ZGF7nBuA8xrH1/GCJeAVh6v+9qO3Buss7pbNdyI6saJsiPvp2xSFpnhlT4kIRao9NM
         5BbscUoSv4qsLsAsjmwdjYLSsZD3jK5wpH2sPN9anvq8vWjjFbtFmvUaAw7nJAoM5lO0
         8OLsj9MZ7+HP1xekSqEbYbwjvIvAE/s3HNYJxn7cAkapAX+eyZVYrRO50/g/krT7KfeC
         Eh0WX8+45OoOyW/BJypQcOl39ndc61SPlK/rgaOSlPMck+UcR3aG52uW844vdTyGcuvh
         g/HgIrUINc9J55b3O5EwFZnmNVl2yKAM+jqDVywOCJVp1SSSvxX9SBv7Y2sQU4RkDCs7
         LBYQ==
X-Gm-Message-State: AOAM5335gE2BqRald7SeqCFCN0+jpm7nHWlNxojEoG9e7m9Q6YpVfMoe
	Z5jgBX+a8uf855yaAKPHu2W0QGFdCZA4IA==
X-Google-Smtp-Source: ABdhPJzg5z90LWOG+hguR67izP5xJcoJtFfS9zykWWtGYwnWOvaYw0xWidexYLejgX0/xIewnQrPyw==
X-Received: by 2002:a7b:c353:: with SMTP id l19mr13846327wmj.127.1629103975920;
        Mon, 16 Aug 2021 01:52:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.. ([148.252.128.117])
        by smtp.gmail.com with ESMTPSA id w11sm9646057wrr.48.2021.08.16.01.52.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 01:52:55 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] elfutils: Add zstd PACKAGECONFIG for determinism
Date: Mon, 16 Aug 2021 09:52:52 +0100
Message-Id: <20210816085253.3843644-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure builds as deterministic by covering all compression configuration
options.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/elfutils/elfutils_0.185.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.185.bb b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
index 7a88c5259fd..852d27764c9 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
@@ -42,6 +42,7 @@ DEPENDS_BZIP2:class-target = "bzip2"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod', 'debuginfod libdebuginfod', '', d)}"
 PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl"
 PACKAGECONFIG[debuginfod] = "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
 
-- 
2.30.2

