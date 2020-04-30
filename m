Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.2406.1588286339822909659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NmEQvQLK;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.68, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f68.google.com with SMTP id v18so3937209qvx.9
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nqDf93I6jPrrYGJ/r60E3vJ/rvS0CBgEMJWPdI1Lkwc=;
        b=NmEQvQLK5qzqwvBOJBTZi6S/vY7ioxXkN8XrTOJz36gWU9MQHP1DnTSgJ8ELPWRrGS
         4fIHZiTnv/1nY8CMpUF9TLLHGqEotvk2JSuydPFo/ppDGeSnIGyAfXMDxyp9vjOQz5v7
         Qk1SdaXwvfsxSchjIq/iNDUaqi5toj1u5YQtu8BG5RHjx3iw4eqOVBnkVtcxrbqi8Hhk
         R+q2KlST8Ld3hwXLpVE2AnGjEKKNP+7x5h1eoghIpeaURyPYNgf3ZKZbr2vBeY1nSBGb
         xXwq1jB5+pXwA4XblA2avOfLCBxfYAI2uu3Tq8NXVEx8Rj3F3JetJtLP0nrlekOZr40P
         22MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nqDf93I6jPrrYGJ/r60E3vJ/rvS0CBgEMJWPdI1Lkwc=;
        b=otAomN4OUsFvK2s54pb5UCW+XYUey1ufyZyxVG7T7h+renCs3XrkIuOR9Is7YATZcc
         Lj21BFoUr+1CqEErlKOE3INihhD0Lf4cXxAEqPP+U5ZkqLMWe0QQk4KIwOvEHjWztA+i
         7WmNT4HBL+m2U3HU3eJ4kqcmH1Zx7TQ0jvZIl5VugXUzqUrwQMavZyOqxcC7WuoMEpLB
         /drzBZ652X4oH1E1J9ln8TlDc0wu8x78codlupNF3Y5eGiMa7uW0sITg9NvKpprrvdMl
         pDovYyLH/x8JF2ha3sl2atzqRx/mJEUbfTS3kgkhEZiF+Sek9Cw6FtRZ3tZfBHNYNQai
         1jMQ==
X-Gm-Message-State: AGi0PubjPu3eYv0J5mqXjPocOW0OtqahsmiO45cP2d23cGbv9tHG/27t
	NuhdH/eT05LN+4eDlzjExlT9Hp8OmuRpGQ==
X-Google-Smtp-Source: APiQypIdSCtyNsCTkOnxATSjEs5Ia7/s83OxgdDYlldb/VIh4PFwawcehs2OgCEuxAnjLKPeEQySnw==
X-Received: by 2002:a17:902:8b8a:: with SMTP id ay10mr1295932plb.172.1588285877823;
        Thu, 30 Apr 2020 15:31:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.31.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 13/14] buildtools-tarball: add nativesdk-mtools for `wic ls'
Date: Thu, 30 Apr 2020 12:30:18 -1000
Message-Id: <605c81ff90760cdf4a1247df777d5ce8e12d6f6f.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

From: hongxu <hongxu.jia@windriver.com>

On ubuntu 18.04.1, it does not provides `mdir' by default
which caused `wic ls **.wic' failed on fat partition

...
$ wic ls build/tmp-glibc/deploy/images/xilinx-zynqmp/wrlinux-image-std-xilinx-zynqmp.wic

ERROR: Can't find executable 'mdir'
...

Add nativesdk-mtools to buildtools-tarball and use buildtools
to provide mdir

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index aa55cde84a..977b6a5e1d 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -26,6 +26,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-libnss-nis \
     nativesdk-rpcsvc-proto \
     nativesdk-patch \
+    nativesdk-mtools \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
2.17.1

