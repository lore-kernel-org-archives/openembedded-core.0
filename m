Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736FCC3600D
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 19:37:15 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.48391.1742845029097298150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 12:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zCXjxdyh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3032aa1b764so2862434a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742845028; x=1743449828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9C5wnGc5srPKNLqnDHSnAAZYLlb+NV4RQ+LEwIO9RI=;
        b=zCXjxdyhEdGc30wLkNyBoHeE1I9qtalSbBhHvNcejP4Z+7OCYztmu+BKsVMdOriYra
         YUzkvFpXziBObQMpmQ6k+HB0ASXFbvrtPSM9e3J6ubUQe8NyYHbT1Uq0JWFs1Idvmfwj
         HJXpB6lQ92PLHXVLXw3eialrKWtcxpWeoPu0icDHRxzH64qZioeDjkx13J/sWIv5NtGS
         TXoTx+l2CGnr+d/VqygcDlQfez5PBLOIo+tDBtatPk8j4Jd21I+OFpZ5jyvRFbGcjXTf
         sY7h8gok5ffMsogvmhd12sfkmLEQeuBFPyaHiLvaBtoMNo+qdyaG9CrybEl9EAcoSkw8
         uYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742845028; x=1743449828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9C5wnGc5srPKNLqnDHSnAAZYLlb+NV4RQ+LEwIO9RI=;
        b=rKSuxspVO26lP8iB/Czvz7iRn2ZV47sWweYCrRmy/DQvyTh+//DhNT4yq5srwM5PwM
         u8S1VoS3IS/ceGdiDXSU9fvrzMhCM4eQAwuqQWiW56oTB9YiMKmZSCl8yxYzxMO6/VhC
         8dX98l5dY1vatSrbl3NO03R3e7fhFTnb9Y2tg7D/DKIq6Q8dBST4J8YQ7R6tUmdmpoWz
         xHdTC5EKrq/2ykEHR8YdXpxmSDwjekAXG/SI5B/5R5k/305HO7zjpnGeBuo2tpcctBgQ
         8sd5R+TBHzNjDAZ9a+A/+X00J5j1eM0kid/CPThNM0A/I/EBQ3GJwBFLlELYeS9ky/XK
         pJ7w==
X-Gm-Message-State: AOJu0Yywd1eLuraPkUbnY6AtmCo5JRQBzuMIcIfI7PtKVecbyLaqKEBp
	oOjhvJ/O4/BYO8D9/6hfnuH6UJ6DRX/p9CN3Gnd22+RrXr7JRecnyf6crHmcRBvjKFGY8Q4kD6t
	R
X-Gm-Gg: ASbGncuNvixxnReUK3aKkd+O1s/aUqzDInVaoAmH9QUv2HrCLa/ziy0PFAZXXe+YGzv
	g7R/2xCkKWS27vme+wU8ocTIP+QyXk6iT8Ono7IZSoWkYYIqGMoi9GcVRTaKGtN8XEeo5fJGVcq
	TfbcDu8057KQXystIv+201EDzK2msIO3awI+3iEUVAfXjhbioJiYlguyRBWTKoGaWsw0iGk99rD
	5oZ5fXYlUJeESke8905QWHkpHQTcDI+ilg5IBxVhCs9uvP1k1YUYT8hTcdMrzTCzawDOiJq1GqR
	6Gh0+AS4X5KZ9G23uOzY3oYUk8pbOYuHWjay
X-Google-Smtp-Source: AGHT+IHn9rgc8wn8R2wzRhRyAvmS6Ssbt8K4ZuszHdzXrbV8c7veWIr07cOB0t4TvOwiEsrR5xC/UA==
X-Received: by 2002:a17:90b:1f86:b0:2fe:9783:afd3 with SMTP id 98e67ed59e1d1-3030fe7575emr23876940a91.2.1742845028141;
        Mon, 24 Mar 2025 12:37:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ee18:96b4:93d3:b88c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f806b48sm8640876a91.44.2025.03.24.12.37.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 12:37:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] libxcrypt-compat: Remove libcrypt.so to fix conflict with libcrypt
Date: Mon, 24 Mar 2025 12:36:53 -0700
Message-ID: <1172a71f2104454a13e64886adbdb381aa8d6e0e.1742844907.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742844907.git.steve@sakoman.com>
References: <cover.1742844907.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 19:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213578

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
IMAGE_INSTALL:append = " libxcrypt-compat"

$ bitbake <image> -cpopulate_sdk
file /usr/lib/libcrypt.so from install of libxcrypt-compat-dev-4.4.33-r0.0.aarch64 conflicts with file from package libcrypt-dev-4.4.33-r0.2.aarch64

Remove libcrypt.so like other files to fix the error.

(From OE-Core rev: dc0c7a8c3d1d4f02869b7f0d42f704fd24bf0dde)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
index ec9f9f4fa3..d5546ce9ba 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
@@ -13,6 +13,6 @@ API = "--enable-obsolete-api"
 do_install:append () {
 	rm -rf ${D}${includedir}
 	rm -rf ${D}${libdir}/pkgconfig
+	rm -rf ${D}${libdir}/libcrypt.so
 	rm -rf ${D}${datadir}
 }
-
-- 
2.43.0


