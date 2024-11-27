Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC0FD66BB8
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:11:57 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.64661.1732680710119255238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DHu2wW/j;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7252b5d7b1dso313189b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680709; x=1733285509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYMFHnqmXwbd2ERbA8xqnBTWC5JI6Ij+Zscxv7nD2J0=;
        b=DHu2wW/jQbdCBs3GEu8LyE5rq+dYNi5mjFhtYm11dTv33nep7PTvPC1/f0A0psyo01
         nqVkl3bom4VxNVCt8NmJQeNzv/+Ty2mphGF0dxGc+qQlWyt/UnQIC9iR+tXdUUDAFYw7
         jgHuMjsVUK7Kgv8B5k+hvhCfRwQAHBi46Wnkb88lIuMu7bTf5k1cqZ4Ko5Z9TvdLkkof
         xyKmUlL7pM3D6HRg4CY8Yd24t/ZHFNHUFk1VY8ChMC+SsIUGvkFM/b78xneeuK/LMVkD
         mcCzF1SgRch1A3Ke0UvjzKwswft95Rw17xL9yl3yZa86YaDjSsndKuK4B98OeP0oRLTZ
         5h7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680709; x=1733285509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYMFHnqmXwbd2ERbA8xqnBTWC5JI6Ij+Zscxv7nD2J0=;
        b=rd2Nsga5eFYm2qvtw/7PTX4Q5aWZCPmAvT4hHtyvVBzagNH3tuEfbongRcYi92wP5f
         3mRgEXv2RldjFGWOdvFy4iS2NY2FANuA13jiyMbVjofi/MZtyPRidrg89aV7AJNxO+6H
         SYpkciuyoa4/JXwtTMIAMT/NxCcHdwOoZfwzLQeZUHKgX/nd8vhmfywPP1xd9yfwrIff
         0Ci66PvYSgJEyStxq4oXSDy7Y5wh6J5kCbUbMcYfpBe5cmUYDsxQe8F/qrQEOrk3t2OR
         mqcYHT5l+Y1hNNOPd95SJ6Lg9N9p1lyy5tBHMdg2uMgNts+CaXTfvnZV28qZ6hDkoYL4
         sC0g==
X-Gm-Message-State: AOJu0YyuVTpKgikgax1MDe+xvOeDl63+h+fTMk/KLS79h9UEc5DPfvvz
	9Gu6qZcDgGguxODQgKeApoxGTDvYsTaalR+py8fgK46BSBeKcrVbezM9AdMgO/YW/57CxxuSb31
	+
X-Gm-Gg: ASbGnctmNGikuWL3oyQuFN88mea0PO1iysTM4iC9BkpSYybESRV3xpB0N8Vn1G4GEZV
	/T+6+DWhk5nyjaXEXV/cY3jboA3sczG0zSdNHBYIQz6gzQ2MHiAbD+V0j+5hgHeSkhtQD56VbER
	GkrKU1qcO6Ak379iW4wzuEfVWVZwauAgflaTv3dGwyGNXLVT+RE66Ds98UOkJmX2ElOMymcRs/f
	O7n7chGJN5/z2+uDfxReYxha00pZmUACGpRo4Q=
X-Google-Smtp-Source: AGHT+IGNTdALZiIAdqvdcvta+C4jl8ZLo7pFO2j0i8qZXNZLi5v3Hco+p6Ri0bBfphLqfPT4KQM0XQ==
X-Received: by 2002:a05:6a00:2351:b0:724:bb67:a6b0 with SMTP id d2e1a72fcca58-7251ccc21eamr11437147b3a.3.1732680709259;
        Tue, 26 Nov 2024 20:11:49 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.11.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:11:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 04/18] xwayland: upgrade 24.1.2 -> 24.1.3
Date: Tue, 26 Nov 2024 20:11:24 -0800
Message-Id: <38a09bff16c85b10386435eca88358aec0159ba5.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207898

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b42744482d5b883c04e81b4be56ef19bc27caa3f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_24.1.2.bb => xwayland_24.1.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.2.bb => xwayland_24.1.3.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.2.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
index a3ece64348..7e817a7241 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "141eb76e7e422a3661c08782c70be40931084755042c04506e0d97dd463ef7d2"
+SRC_URI[sha256sum] = "dcdb57a66cc9b124c8f936760592628ac4e744a7d7b3179aa86189ad7ea4cb10"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


