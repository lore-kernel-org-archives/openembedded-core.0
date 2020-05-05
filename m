Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.1523.1588648876639517902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xSIW5MxT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id w65so198205pfc.12
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LSOQP5Jkdz48cKsgM58mmWUdOchDiOp1yU2l9/3TThQ=;
        b=xSIW5MxTnQp5eI8de5IZalUX5DV+L6btVuZ7iZAJyXksyQD94VC1DxLgudykRDj98p
         xgdw+oXSQdqrkeWdKI8u4K7ic4givohX8BiaxNskwucV+G/Qi3wa6a5/i1zVZz0ElW4/
         j22H1dVx3+8cb/tCNTQfttmf+JiBvYgZsE22nMH1YX4zvK92rPutjGN+BX3BVG5jH6CX
         ++Syb12ONxOH6x2JRdZPRIWXzT3LzKSQP/0t7GNtHRxdm5jkpWqvKuL6jxOe01qF2hVd
         W3BBqy6/VQ1cTFAMsIfy9zhc8cEDoyVETDUqs7EfS8DVsYpMbY1vfZfF8nO96abmlDET
         Ykbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LSOQP5Jkdz48cKsgM58mmWUdOchDiOp1yU2l9/3TThQ=;
        b=Jd9N2/lprtZoFWo2bAZz5mFTZzTA9cbJFJjvZS5Pwa3+opFJ9/Jc+RRzbvlF28bQBl
         BR6nSNkdX5v03kMAWFTTVfCAfJeUBsdYfvzCrbQeWF3A6IrxpeZvc0XExXUpvUh4Svq3
         IKI6jgVXyR3vTOTsVPeeVjBMdil9vfLVbfT3u5AUs8NAhA+FX6wnRnj0nPO80OTPJf54
         qXqvx3OCfIphBlu4v3SXiSL/j4nIfKTvGlbm8HfpMt4PMZNuB6fL58nLxMXH6dGng6Lf
         Svj3H5rjUH7ndUCOcpU9gBjK8iI9B12Q2TT3JmtJWhqTGBPnz8NhSM6Kiu0N7Gk9WBfd
         C2qg==
X-Gm-Message-State: AGi0PuYoyXimxhZ8yV1nEPCeAyuqjYFi+S+83aRNsAZBTxD4WylnHYiP
	WpNPoVAwz/k9mGC0Gf1cWaIeOxRFi1u71g==
X-Google-Smtp-Source: APiQypIPZNC5me2iB8EXdyLueJJl+eg52AW65VXVhFbuL2bMXn0VQ+vRmIZXOC4TaWezxNwPOgSwpw==
X-Received: by 2002:a63:1854:: with SMTP id 20mr1294420pgy.257.1588648875669;
        Mon, 04 May 2020 20:21:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.21.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:21:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/28] gcc-target: Ensure buildtools-extended-tarball doesn't use arch=native
Date: Mon,  4 May 2020 17:19:20 -1000
Message-Id: <3fff2c9400f2f64cbc8cc450b5ab29505eacbdd1.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

A nativesdk BBCLASSEXTEND was added to gcc-target without realising this
would pass arch=native through to it for x86-64. This heavily optimises
gcc output for the host its running on meaning it can't be reused via
sstate on other machines.

Add class-target overrides here to get the desired behaviour. All
targets have been covered for completeness.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 8cb432780f..6263e81497 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -15,11 +15,11 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
 ARMFPARCHEXT ?= ""
 
-EXTRA_OECONF_append_armv6 = " --with-arch=armv6${ARMFPARCHEXT}"
-EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a${ARMFPARCHEXT}"
-EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve${ARMFPARCHEXT}"
-EXTRA_OECONF_append_arc = " --with-cpu=${TUNE_PKGARCH}"
-EXTRA_OECONF_append_x86-64 = " --with-arch=native"
+EXTRA_OECONF_append_armv6_class-target = " --with-arch=armv6${ARMFPARCHEXT}"
+EXTRA_OECONF_append_armv7a_class-target = " --with-arch=armv7-a${ARMFPARCHEXT}"
+EXTRA_OECONF_append_armv7ve_class-target = " --with-arch=armv7ve${ARMFPARCHEXT}"
+EXTRA_OECONF_append_arc_class-target = " --with-cpu=${TUNE_PKGARCH}"
+EXTRA_OECONF_append_x86-64_class-target = " --with-arch=native"
 
 # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
 # set in subdir gcc, so subdir libcc1 can't use it, export it here to
-- 
2.17.1

