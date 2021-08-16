Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.21581.1629104606759164250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 02:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JR+2dFYk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id u15so11092196wmj.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 02:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JM5V9+AZ3/wsJy/hY75IlSiPL2AMOuWXcD2A6QWZOFE=;
        b=JR+2dFYkTGyloviUAZL6MkxQTfTvuMYcsHoGI56nTSJYuo9ZDThDtioGx9HJD3UFc1
         XAcDTS3+KI0Fbcrqh82kGT2A4S/VMiiOql3R67p+eLlaGp5iMeCEfy3yd0CttnSTDlAF
         w/DmsbLbJoWL5qBaeXwmRl4pNW4zp8HTxFo1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JM5V9+AZ3/wsJy/hY75IlSiPL2AMOuWXcD2A6QWZOFE=;
        b=FofC4SqKySrR5Qpdzj+IKag7m8MYrlYAd0K9NsM7MbmcDnCcSUvnD4CF+NcA6gO8AB
         nhcOd+7LLIMbXw4bQF2GT+FdfVLm9KdiVuHefFqakY5GbY4Z71e/Vk7D13J15uqV+6+C
         JySvkZUHBXcT28ceQTpG+kuWe503wmQ7oD13S/2wCB2tdDwoUTiAFdsGfkqtldQzyO2M
         Y2zjJa2l+Yo6VewDIoiwyt1WdChcdoY0pPCpofQo57gpUHCkqfyy49otfPhg0I7bfwEO
         zv1vmFbju0iEGrO+LEdpm6oGp/xlgMgKWfEN/dkGxnqrWz91K5fwYa2XNhI+bngZM1pX
         KWwA==
X-Gm-Message-State: AOAM531XS1R/OFC5GslWtgCtd7TUUF0vcAhU+GB84SZsjIPPLi110viP
	o3RlqGpUja+ZZpN2vlTNlZfKP8T82AIj/w==
X-Google-Smtp-Source: ABdhPJzHayRDXYOenvgfM44eV/Grht1hn9zFiSRfRU0pwx4+m3fNVc75/14kttQ4AA84iRZATzarZw==
X-Received: by 2002:a05:600c:2f17:: with SMTP id r23mr6551293wmn.118.1629104604900;
        Mon, 16 Aug 2021 02:03:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.. ([148.252.128.117])
        by smtp.gmail.com with ESMTPSA id f2sm10899728wru.31.2021.08.16.02.03.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 02:03:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] elfutils: Add zstd PACKAGECONFIG for determinism
Date: Mon, 16 Aug 2021 10:03:21 +0100
Message-Id: <20210816090322.3844125-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure builds as deterministic by covering all compression configuration
options.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/elfutils/elfutils_0.185.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.185.bb b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
index 7a88c5259fd..3d103c7c48e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
@@ -32,6 +32,10 @@ SRC_URI:append:libc-musl = " \
            "
 SRC_URI[sha256sum] = "dc8d3e74ab209465e7f568e1b3bb9a5a142f8656e2b57d10049a73da2ae6b5a6"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".2"
+
 inherit autotools gettext ptest pkgconfig
 
 EXTRA_OECONF = "--program-prefix=eu-"
@@ -42,6 +46,7 @@ DEPENDS_BZIP2:class-target = "bzip2"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'debuginfod', 'debuginfod libdebuginfod', '', d)}"
 PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl"
 PACKAGECONFIG[debuginfod] = "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
 
-- 
2.30.2

