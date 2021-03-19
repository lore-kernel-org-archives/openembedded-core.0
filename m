Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.3568.1616143518346696047
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZKqG6bVB;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id b7so8379483ejv.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dbphuBmAAVqzqaKC6vmmXM3VRoyHR7b3dkr64NKwpQI=;
        b=ZKqG6bVBRfKfD9FltvPx8KP179AXSl9WeIokrfGC9Y7/sPpDa7UlmilG+X1llrIZxe
         HlNYpKulhXvqFikCTa8GI+KKlHHCaidN/EPLLzPyUpCrEelO3oz8P+2StE0xf26eXNfH
         6l2XNz9I6BNdipsFQr5EwyvQRBX4hEN6tq2Xip1Q+rSfxLKuwI2sE8ac1IV73/2jNqJe
         SEpUGkYbDq0Ey3zmhd0CKgQrgDM6oU4nsHY6dc4CYSheNHwmwKeEzlUdcLeLZogiqmoI
         wMlEpm83nhz2vk7FgBnIariRwBndhk/lDMhOdCPvbGRnmPVItDLnh3c3t2qduCR6apNK
         aMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dbphuBmAAVqzqaKC6vmmXM3VRoyHR7b3dkr64NKwpQI=;
        b=SBiGu4wV0D8bBxUKcZ8pHr3RsChZkJjHifrcaaowkTPPEULJo7gtxGFTjBgAAqIUJq
         pZkt+g7zIlq2eg3pPlj5haJMfmnz/prsj6FMiKFs8WEpW7TB5yaOiVBY3pArQzUy2Aat
         H4VPPPzk68iVo/mKrjUUREcGf+STj5tJTTC9mzsz5Y0w8XpPN9OOB+FQMQDmNW61Hexm
         cuzCZKkUP59RBDw/oGUN2bbqicxPuae/El6l0ppYkwcbaFa1cHD29rxQGwyhr6sxotKt
         BU01iQ8v1UtWYvOb5hUxIe2LVgLSv7SWysS7pXQxSPPbu7e01TuosEyo8G+4an0XhFse
         GZUQ==
X-Gm-Message-State: AOAM532Pv42LAHIx2FWzBBRAHED81z+b3vD/vrIfvBqzpCQ/xSHVTi3c
	GJ91eZvKLyKodtAS1SunAeSICbaHlkNHVg==
X-Google-Smtp-Source: ABdhPJz53nVrhlbrDMiCElU08erOrLhZBRyZKNQQYcChOp2gy00Z8932ytupyQIuS2M+fl14FtEZVA==
X-Received: by 2002:a17:906:32da:: with SMTP id k26mr3004680ejk.483.1616143516976;
        Fri, 19 Mar 2021 01:45:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/16] apt: mark as incompatible with musl
Date: Fri, 19 Mar 2021 09:44:00 +0100
Message-Id: <20210319084401.576728-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are multiple failures with the new version; unless
someone steps up to fix them, let's exclude for now.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/apt/apt_2.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.2.bb
index b838495da8..52ca7e97a1 100644
--- a/meta/recipes-devtools/apt/apt_2.2.2.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
@@ -39,6 +39,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS += "db gnutls lz4 zlib bzip2 xz libgcrypt xxhash"
 
+COMPATIBLE_HOST_libc-musl = 'null'
+
 EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
     -DUSE_NLS=False -DDPKG_DATADIR=${datadir}/dpkg \
     -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
-- 
2.29.2

