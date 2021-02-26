Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web09.9963.1614349576763552435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=H0Mce6DG;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.54, mailfrom: steve@sakoman.com)
Received: by mail-io1-f54.google.com with SMTP id u8so9744671ior.13
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=g17jqhPrbZc7kvohQjx/+Nessi0s4rg9YCGebIFUIVE=;
        b=H0Mce6DGeo8sGLz7+9PBTJzjWUZ7EQAj1c54V7wWVh4vRvTPtxlQSujXhFNNmTVnia
         0529E3mSYE7iiQvQkcNYPRp7S4vyMyUYIkI0gFl2mXSGgMvXHb9zGcBmYT/cT1qlmHBK
         VS2rriS0MdD94b11suK3O95pkv2gREbnTGopzJRsGFRcvjHod9SwHR+pKVKRw3eV9Blo
         3K2Hd6xJ2bRWiAj/E5sVvZAzNlDzOkDtMHnNvnsiDCCXB+ijvSWCOaW4GdCy4621PTnU
         1GpC79xVskcDooiWr8eNp0Gv7QiLURukkpupfTy9m/IKCPEfhHxYrzyl8uCAf5rSKuXK
         Osyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g17jqhPrbZc7kvohQjx/+Nessi0s4rg9YCGebIFUIVE=;
        b=hL447HQ3S6/8nWdQM2V0OaylwzNrdtMeV6z4QnXZEAOcDHQI5HrZLt/hMrM5uIqGI9
         x555kpri+lMIrVNS+oQU09u0I3h/0y5wmCWo746MlgTRxUsMX8nPfRupzyQSW2amUds4
         iHgTt8VkJMK1lK+1WDgAJeqDrl1QYJFIEhXNanQuBWNsG8oTpGo7wBgO/AVJ+SrH7ftF
         JM8rB/FU2TdM62fRSY81HAwysc5hrTcNbIDm0lidJwvGhLv+cwXpTumNMPPwhsKGsCec
         kc730gVVQPFHnnw1Bytikrl9uO38XZGQPf95HRLg5zOSSJsLPWqfwxdwqoCT0YOHIpS+
         gSvw==
X-Gm-Message-State: AOAM5309JVpYhpxVrkz3GKZm24mfs+C6jxLccrCClSc17S67dl6Hshpi
	A5Lrei7HOHgym8Q+C3y6T/1hc4dx9X+VkVEx
X-Google-Smtp-Source: ABdhPJx6Uw2EYy3d9AzSEUGnLtO6YYuVZSLhE/WbzT5TK6i88w+ycE43iqU49lMB385PkGmfL28LCw==
X-Received: by 2002:a6b:d010:: with SMTP id x16mr3004774ioa.107.1614349575556;
        Fri, 26 Feb 2021 06:26:15 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:15 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/40] buildtools-extended-tarball: Add glibc-gconvs needed for build
Date: Fri, 26 Feb 2021 04:23:58 -1000
Message-Id: <c868296e7cbec768e207cd27d1434b655d968e2f.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When building vim it tries to rebuild files using iconv. If this fails
the build continues anyway but the output is not determnistic as builds
using a hosttools tarball are different from builds where there isn't a
hosttools tarball. Add the needed gconvs to the tarball when iconv is
present to become determistic and generate vim locales consistently.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b945652a088f430a2adec6b968cd00c5928d4272)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 0816486754..83e3fddccc 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -28,11 +28,21 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
+    nativesdk-glibc-gconv-ibm850 \
+    nativesdk-glibc-gconv-iso8859-1 \
+    nativesdk-glibc-gconv-utf-16 \
+    nativesdk-glibc-gconv-cp1250 \
+    nativesdk-glibc-gconv-cp1251 \
+    nativesdk-glibc-gconv-cp1252 \
+    nativesdk-glibc-gconv-euc-jp \
+    nativesdk-glibc-gconv-libjis \
     nativesdk-libxcrypt-dev \
     nativesdk-parted \
     nativesdk-dosfstools \
     nativesdk-gptfdisk \
     "
+# gconv-cp1250, cp1251 and euc-jp needed for iconv to work in vim builds
+# also copied list from uninative
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
 
-- 
2.25.1

