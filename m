Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.26510.1592249797018564075
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QSNrKMZB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id m7so7212556plt.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ENKmg8fshfBTuSdmDc77vqcrKHpZkk+6e2M/PHdHQww=;
        b=QSNrKMZBD0SnNzgtiOxmK/wNeo1TbBfKEoWXAuigwuR+U4R5j3yJUfzK9wyUnHv7fA
         C2rrxRhVIyT1s6XqSCfrOhele/t8aUipXb+UnMGLUtpeMSbtF5/NZAt1EZd/yFiqsvoT
         vrqAd/7RWZf0FqfrspDbM06TJDfo+0jismUuS6iizl0gvH82mRu177aM4GFXbeWEfXyO
         M8F9mTDWPRDs351WgFbVleqHvGfCH7hxGbSubDEIdA37glntDGJbVf2z+EesxfPj8YJd
         f7dmHh6XCm7e/IDlz4MeNOe9yuFW2j7JySa3YMIW4Pjlj5bmFF8spv8tjMUKkZ87u6u+
         YQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ENKmg8fshfBTuSdmDc77vqcrKHpZkk+6e2M/PHdHQww=;
        b=GW+SUcN2wWTQWP/gSGZ3sneROkCBey6vOaTNHwiGQi7oEqG3y/j1czB6ETyjOHxNmM
         1AIl9/mGREr2qjQ1YaVJOkpVvgxUDh2/uoWGXEMNqX1Hv5TAYG/PQHci0PYTAYB7Gma7
         I4g3wFThj/dl4rEfnJz2gEUXfWxViz1lp8dmy69A7vCR3Zb7NafoHa9stx8/HUz8t1ec
         duJnPnvnivs3iSLEgmV84NNul1YDE85e7u2DyV9gNK1znN4fEHPk0Ht3ukELRF4Z+KIb
         5H4IpbR3qL9Jlrxl3OqNqt+CAnUtMR2BrBoxji0TyR3mrvbQdjlnacYcmNnIo++x25rx
         CdKA==
X-Gm-Message-State: AOAM533WR7QR/UZAQvTDazkW5zRmZUR0k+xMvbnlFX2GpJFtSq1FlYe9
	LolVGhRVyOVbbitVot2EWS3tgBpYUYw=
X-Google-Smtp-Source: ABdhPJwXg2xxliZgVHas1NW1twJqjftXQi79sdZZa9UHntNk5Rcs0L5pJ4IgIuOKT01UGCHO98qgIw==
X-Received: by 2002:a17:902:7d89:: with SMTP id a9mr23080938plm.309.1592249796079;
        Mon, 15 Jun 2020 12:36:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/21] archiver: Fix test case for srpm archiver mode
Date: Mon, 15 Jun 2020 09:35:33 -1000
Message-Id: <f256e0e6ad356714710f5a5e887d742a316f0ae7.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Paul Barker <pbarker@konsulko.com>

We can't assume that rpm packaging will always be enabled when running
oe-selftest. In particular when using nodistro instead of poky this is
not enabled by default.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23df3024664ec56dbbe8865ef3953d2c33a7a2cb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 606eaabcb0..bc5447d2a3 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -126,6 +126,7 @@ class Archiver(OESelftestTestCase):
 
         features = 'INHERIT += "archiver"\n'
         features += 'ARCHIVER_MODE[srpm] = "1"\n'
+        features += 'PACKAGE_CLASSES = "package_rpm"\n'
         self.write_config(features)
 
         bitbake('-n core-image-sato')
-- 
2.17.1

