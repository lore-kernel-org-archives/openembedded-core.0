Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC04C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 05:23:02 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.115304.1699507381108466413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 21:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hQPdcGqW;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc3542e328so3703895ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 21:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699507380; x=1700112180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AIxhYa7CY+e2+5gcik0kihRC2YggsiuKqlSZvRTO9tQ=;
        b=hQPdcGqWO8UhuMnGDAb2fzK+PyKj/acKVs8+GHK32C/yo0ICGOCuv4+zaGygppuvJ/
         DLHlhQA9OLpvKunVvqxrd5IhAx8yIxHD42XKsNyhZEYb+WAvDfCw5Vyq0P3kcvN3we4Z
         zyrSptpgvAwP+0Gvc6ZIlAG8a7u2Q72JzSo928+SCGteXI9HM2rMUPQKi6EUmzrNO7F+
         LbTHjnCSdOH4NGWjTPJE7L95+HGfTv8kja0jCTCsqqq/4WtUTW05imLK3QeDp6LLrPgP
         OFZZffwKdfiUN9koFoTJ5GwWHMp9E0ahAApyspd32Yn0JLeIl+6qqsBkbHK2oMa5M0wu
         0tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699507380; x=1700112180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AIxhYa7CY+e2+5gcik0kihRC2YggsiuKqlSZvRTO9tQ=;
        b=gvqFdcXIo7koNIreQkI9XGsXQUMAcjcbUon7z6RzPmRzic29/s2cWZaaZJMZ/zQLaw
         olW4dsMGKvu2JrD5xU48cvtvo7UfBf8JvFnyLN3cSWMm1VbAWOdFX/gbfaL8Mvh5ZAO5
         NPtdrE4UtzsNhtqxOEH96/6tLOGnsds6i7SiOrSBdIXIKw6DK8l5XRuyJwbEmHtSIOiQ
         hbccee37Oz6uOkB2vwDX8t+z6gJGwH0O29QhOWs27bnm69XupQn0+mThHWbmBTHtd+Ob
         QMcpWdCBz8AC/sq6KWWKNV8UFfZTlJDody0/zR5FVn1HhxYr0hIMwiis29Fa4r79OoJh
         rctg==
X-Gm-Message-State: AOJu0YwvNw21+SmstfDmkWw/QdWKh4Z2GfhnDycTAgK13YYUVKwcIzPT
	FwYcXB5uK9Znyrgyj17JYdfKPqXjbQ5HQg==
X-Google-Smtp-Source: AGHT+IEBIJar8TzbS9ODXlLKXsbEoNbUWjSreV10qGlmR8IJl0K7RGuc3dHkOr9AKDkyzVATSyu6fw==
X-Received: by 2002:a17:902:f54c:b0:1cc:4146:9eb0 with SMTP id h12-20020a170902f54c00b001cc41469eb0mr4704068plf.57.1699507380019;
        Wed, 08 Nov 2023 21:23:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71b7])
        by smtp.gmail.com with ESMTPSA id n11-20020a170902e54b00b001cc3f9b70e9sm2552531plf.220.2023.11.08.21.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 21:22:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libarchive: Add packageconfig knob for libb2
Date: Wed,  8 Nov 2023 21:22:56 -0800
Message-ID: <20231109052256.1602425-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 05:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190376

automatic detection could result in inconsistent host dependencies
since it will be enabled for libarchive-native if the build host has
libb2 installed and this can then fail on hosts which do not have
this library installed

Fixes errors like
recipe-sysroot-native/usr/bin/opkg: error while loading shared libraries: libb2.so.1: cannot open shared object file: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libarchive/libarchive_3.7.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.2.bb b/meta/recipes-extended/libarchive/libarchive_3.7.2.bb
index a09f607fcf8..91f521fa4db 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.2.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib,"
 PACKAGECONFIG[bz2] = "--with-bz2lib,--without-bz2lib,${DEPENDS_BZIP2},"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
+PACKAGECONFIG[libb2] = "--with-libb2,--without-libb2,libb2,"
 PACKAGECONFIG[libxml2] = "--with-xml2,--without-xml2,libxml2,"
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat,"
 PACKAGECONFIG[lzo] = "--with-lzo2,--without-lzo2,lzo,"
-- 
2.42.1


