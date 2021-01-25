Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.364.1611586408925748696
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gDzR8h/s;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d13so1989204plg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vjhZS8ROF6ddlxGwpc2LxqvZjRsM6GDyhLqdB3/ERWg=;
        b=gDzR8h/sXssn9BI4bp/XsNLUG/M+feTaU1GHtfkPtOGXFx4Oc+RHIwK28dCCpv0LUA
         OnjYMAI+cVkmzUqt3lh0qX5YL23hpVDbamZPJGkykTxkh2UeNLLyQptw1gnBjIrgTv1Q
         rHMIL5ow91Vd5/7cVV3Mw56khmIk6kEvLgacXA44HHmXOORX4LoXbvZi1Og5Xm5xWHYM
         gzOQyddziz1n2oMW/QU59WFlr3yipDC/PQk+EM4zReDgNFinY+fGsy/sJ4xppFsqn+2h
         vkGrQ/1tSRJKQBXeA8p/6iU2Dtgh2oRWsPqoBrjyDZBI+9XoD7HRlwHGdUihONL4o4Z6
         06Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vjhZS8ROF6ddlxGwpc2LxqvZjRsM6GDyhLqdB3/ERWg=;
        b=mxgY2KbiWSdLKXiAnw7fYXJpTzaW0/zcKp0sPtLzBfYFXIN/MKJbNGM1ERPYvgpIpX
         zlw7KIiPscTKK6GKWKEDwJnDWnJHCwN1qdhFiKxO9/BwWLS1bU0RHj3SszqEKy/w+YGK
         Cin0EEp4H1RcNosNxjyfhgBe6C/8ZL5iBKjkOorOJ3BmuJemO7WvY7ohmh1p6GmptP6B
         /JRaF0XZ4CvmVqj4rZSNPOk2OQ90Xm8OJNeJbpdc93t1sgxUqCiWCPWOovPSSTaX8abD
         cMjy2xJaAYYoJl6Wlo0tqaCjzMi6E1grYKz96Gyx4nc6ciQS5zLuK4b8Nxvx0jy+Gf1e
         CZqQ==
X-Gm-Message-State: AOAM530VgC9Q0PE/1lroVE8inWvT98aPtyG86hmTzixY8/UUUoYlArTL
	qg56ZH7sGv4EAzpaPAFu/WvI8RObs8fW22Xzz8U=
X-Google-Smtp-Source: ABdhPJzmrzKeJjMy1/4D9+fq63Daq//a3ASm+JPtbt7z6Cf1bs5S2At129HZbJ75l7ikb0+W4LsoRA==
X-Received: by 2002:a17:90a:2f83:: with SMTP id t3mr598253pjd.128.1611586408113;
        Mon, 25 Jan 2021 06:53:28 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:27 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 38/47] pseudo: Add lchmod wrapper
Date: Mon, 25 Jan 2021 04:51:10 -1000
Message-Id: <ced38ea001b9fb405cfd3be3e9c14f3a601fcc42.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

New versions of glibc have an lchmod function so we need to wrap it.

Identified through a reproducibility issue in initramfs-base where
/dev/console created by mknod from coreutils changed permissions
depending on the host distro (mknod used the gnulib wrapper on most
hosts but newer ones used the libc call).

[YOCTO #14162]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 20a645664977530e602e1ac97e8dc0962e730e6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 78c6b01f09..7fa11a54e7 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "6fd57da7b1de1a2b6cf530e336d58bb5f8bdd015"
+SRCREV = "1ee9a1e05e200f189f6644411ba9304e8a479b0b"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

