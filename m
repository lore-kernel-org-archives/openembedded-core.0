Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.11666.1607008129619654185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=M7umH6LI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id m5so1273212pjv.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Flv0Ggsv0i0cXQSAcLvWvtLP4OHHWuPfB/tcVMbbqcM=;
        b=M7umH6LIlCdJ2H4hN4Ls0FgdFa0BbB+xLbk2wzhGO5fjGM3mlhJfp/oN6j6y4bFETd
         LnfM/Qy+hlxATL8iS2o/mlUH7tnKNzgi0TRLA5WUHZgh4azzyMOA/eeEgxJNUFF+2aTF
         x7qYzMNw1CZS0QnWtzBDnuYmw+0peFIfF4UTblgXJmKLSbwR3WuadSliQyUvBIVWscZo
         1wuZEIKz5QM3WrT45DAyYXLAR8zu42A30u1K4ooa81O2m8GrIowir7+fo0eQBgAuPV7/
         mMScaXEL9qetvgkZqOecTqHUECP1UlZE1CL8TaALf6uy0AhOEumfslIe1OjQ4zX7B8Dz
         ngFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Flv0Ggsv0i0cXQSAcLvWvtLP4OHHWuPfB/tcVMbbqcM=;
        b=HXEWt5A7ZIhTYjBShirBJTk/gaXLWBAZ241Ro/jbwMOHxYo6G5uG5M2Owt1tVEsJ2B
         I9s0G7cLOevzj+PHvQ+1fKBttB74IxHLKPUBK36I7IZq+fFUQ62LZkzzwYgezWs+oaqp
         k4zsCPLgbXGrwmgCWpmJZgyjnWVznBz4eJPl2x9NhnRspPWW4G82OCMG5/MbAwMUGhgs
         YMZct+uXiYbZeZvnkFwZNnrlGYGzQH6DFgwpebDGfOU4LQAjxha8P3vv3m+rWcRg5G6C
         07xKm9+CbKpssuGOCxP2O5Id73FdEi8C/+ZLwawNTmgIW36H2LB8RCAaDbGqOq8dA3yp
         ncjA==
X-Gm-Message-State: AOAM532O84sMv6nhwF+pKPQNsAyaDrfMtUQqKMgRqNKvLEvG/10qHvw5
	EF7lKE4mWkQprYWXT8AmcW5+SqTgROwWaDHb
X-Google-Smtp-Source: ABdhPJzi0sGKp0Ha1sojcgQtO+0ubMKomJKd/mRt4OxmeL4jiwxpwYM8ehnrsl5ClUefZ5rkr+YWOw==
X-Received: by 2002:a17:90a:7c4a:: with SMTP id e10mr3482352pjl.72.1607008128698;
        Thu, 03 Dec 2020 07:08:48 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.08.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:08:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/28] pseudo: fix renaming to self
Date: Thu,  3 Dec 2020 05:07:54 -1000
Message-Id: <fd97ad2e14554743c45424f66022d45685b2baf3.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Joe Slater <joe.slater@windriver.com>

Pseudo tests for an item being renamed to itself only after
information about it has been deleted.  Move the test to before
we change the database.

Note that pseudo does not support renameat2(), but neither does
glibc.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b3d109f42385ad1cf1f297a6c06ea7eb6509f26)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9a22304bba..3b623d8bd7 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "8efb082863ff0ceec7b7e46f9a44750e12f48039"
+SRCREV = "d6b1b13c268d7246f0288d32d6b5eccc658cff4e"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.17.1

