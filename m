Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.860.1589820594030171906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mL5dKFx0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id a13so2908024pls.8
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=w+hf8AXIQINzGWED8Bhkjw4lQAcnzoehHMVEzFfAz/M=;
        b=mL5dKFx0C0S4BxWYaz2pGWbqzgja2YyvmQAXAPRY+nUd/lvlMd6mgOKzM2ZGFIVIL8
         sq+vKdnEavBpOUzjIY43XLhFbVmEXiK+SBGn1qbn+H3ajPfGJjdvUmAVW6XmsMRWJVoM
         Tanv0GgcJr+RjHNUIRUd1jfpq+0v1cJJY+5/TztG8yWGEigfxe9Ti9Rzuo3Dt9G3L6Z8
         gBBaLQJOE4OeoZjbgzvpBkc0MlEw2h5351ZjRG1V8/sDvxD/2tfUwXXlUcbwv4G0rkkz
         bJucO7GBh/fJ3FpPpRPk47M8QVjtZ7UVmB2XFfgxfP/q/94y3ZWAROHkZpv8tD8wnsss
         leUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=w+hf8AXIQINzGWED8Bhkjw4lQAcnzoehHMVEzFfAz/M=;
        b=txNoz3hoykXwODxXd39h44YU99k+T+HziQocHHH19Hlyrc8pHrTyOaUfrz57lucjVq
         j37q/2EZMNHMfalbnL9rpDSZCHHVnt6kZYYehs3GRiRSL/w5SRjxAqNJb5czV3qpwh9Q
         L4PCVFrv/Bt2gEY3f5x297/UnyKfx9tjqmR2unC+Yk2JF90knQs59BzEl29bHBlrdM3L
         qmMhczUrMJsGtWYOsugysJdRm/j/A5YVwgP40UtjOQQkT4PdszHOHWDIEu51MXkJMnbV
         u6r7cOXNgKfr9XI1Mm2AuVojvVVgFgZEOuUKhatzvnW6lSUeUb5HoDdYpwUz+HOMuFW2
         Kpjw==
X-Gm-Message-State: AOAM530OjkrhUaRDUbvSCDD48wX2r+AZNgYgF9t5vzlvGYDQKv58QWGm
	xvNydKlAul+jOMbD4quyXYhv1iahbVwBXw==
X-Google-Smtp-Source: ABdhPJwqvAYi9oXuUgInw5zJi4UHb8orlSdSjsHIBLVfqY8HUdXR25hk7o5KytIQ3UVTpUmCWypQNg==
X-Received: by 2002:a17:902:b98c:: with SMTP id i12mr2766013pls.41.1589820593117;
        Mon, 18 May 2020 09:49:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:52 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/19] file: add PACKAGECONFIG for auto options
Date: Mon, 18 May 2020 06:48:38 -1000
Message-Id: <5bfdb6bfbd6f1de10d415228e5a5ebe01a623e2a.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

A few options of file configure are set to auto, which can lead to
unpredictable effects when something in the sysroot does provide
things that satisfy the autotools checks.
In the worst case this will lead to package-qa failures as libraries are
not set in RDEPENDS but configured for the tool.

To mitigate changes of accidental configure set explicit options via
newly introduced PACKAGECONFIG variables for bzip, lzma and zlib
support, where the default is just zlib, as it was before

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/file/file_5.38.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtools/file/file_5.38.bb
index b8f09107e8..f5ad568936 100644
--- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -8,8 +8,8 @@ SECTION = "console/utils"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdda1b"
 
-DEPENDS = "zlib file-replacement-native"
-DEPENDS_class-native = "zlib-native"
+DEPENDS = "file-replacement-native"
+DEPENDS_class-native = ""
 
 SRC_URI = "git://github.com/file/file.git"
 
@@ -18,6 +18,12 @@ S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
 
+PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG_class-native ??= "zlib"
+PACKAGECONFIG[bz2] = "--enable-bzlib, --disable-bzlib, bzip2"
+PACKAGECONFIG[lzma] = "--enable-xzlib, --disable-xzlib, xz"
+PACKAGECONFIG[zlib] = "--enable-zlib, --disable-zlib, zlib"
+
 EXTRA_OECONF += "--disable-libseccomp"
 
 ALTERNATIVE_${PN} = "file"
-- 
2.17.1

