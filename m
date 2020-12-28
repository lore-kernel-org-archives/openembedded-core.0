Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.46638.1609166176636693323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 06:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OfUxgaUR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id n10so7415550pgl.10
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 06:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GcHo7JiMeu00IZJPNyOZv3yv82Xcej4YaqtfUUjSohw=;
        b=OfUxgaURdAdmHqTGBGk2C+yB4BvCJdn7wV5juMIbsKT27uoedsaeavJ7LhmdK9ns6n
         EUvSf1316uj7VXrHfv8fSrUEbtir5a5JcIDGVfBJHUJ2i+QwwYMrj1Ufj9gxPGaEFl16
         on8dcxyewnJrb445Jmha7Y6sf5awGu2Z332u9+0CFryGFSp9HFzx7HqJVRjtoxOWjt+h
         6C84pn6r7DUAdQgyNGT/Vm8PmTH4RNiukS/9Cr7oJ43jwLplQwybk/AGK5EkUI3q4xkR
         yTMQwSABLonDU37yDVA+Q6Q5m861cwafezXUgXNsN2DHOPgHPTOQA2qBqXZJ9SVpOHof
         LElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GcHo7JiMeu00IZJPNyOZv3yv82Xcej4YaqtfUUjSohw=;
        b=LHRYD6EyekOk9c4r8N2EXg9VxreN7SZy715ZwMMljjqMJ5k+nNnYkLnYsTwjLWB5i9
         QVZAU6Jh8dLIy3AxGOu3Hd1h3cTLyiVBi5VH7sfG6nDrxPjyBG+30H3YJZ+ToE643NHY
         41Z0fskYdHIRFtPTWEFOltXesYL23QdoPc0gnNYIdf/D0URilbl7WTLPrGBbgfs2CF0t
         KLMqzxRD1bZFUx8y1g41lx2X6Yth7TucsbKHY+3T/VVUPovBJ5EPLL2eV8fiUapEZE9m
         r3/5JXnZNJ4CBbCY1vx94a233NmyemrOmRFK6s+U7hP1RGICVVEOUGaTIRjb2aEdRbtB
         GmkQ==
X-Gm-Message-State: AOAM533WaZ09ddDHgxgFbRlBI16nGfG4RtHAqKTn42VnZCChJ0uk+4mg
	E15iu4WRFt9hNhWFVnfJGUByuSfqD2PSy1vI1Fg=
X-Google-Smtp-Source: ABdhPJzrATBJN/0fy9bUNiXwgInjLchDGeyBx7bl0lTXQovw2fhyMLnz5MsrvzhNbBNtL40T9+V5Hw==
X-Received: by 2002:a63:f21:: with SMTP id e33mr16425261pgl.84.1609166175504;
        Mon, 28 Dec 2020 06:36:15 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b22sm36422469pfo.163.2020.12.28.06.36.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 06:36:14 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/8] u-boot-tools: Fix reproducibility issue
Date: Mon, 28 Dec 2020 04:35:43 -1000
Message-Id: <d39587d65bd57148c2c76b23e7a6ec78de855909.1609165912.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609165912.git.steve@sakoman.com>
References: <cover.1609165912.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If you build on a system with git < 2.14 from scratch (e.g. debian9), the
tree will be marked as "dirty" and the version will include "-dirty", leading
to a reproducibility problem. The issue is the inode count for Licnses/README
changing due to do_populate_lic hardlinking a copy of the file. We avoid
this by ensuring the index is updated with a "git diff" before the
u-boot machinery tries to determine the version.

build$ ../git/scripts/setlocalversion ../git
""
build$ ln ../git/
build$ ln ../git/README ../foo
build$ ../git/scripts/setlocalversion ../git
""-dirty

(i.e. creating a hardlink dirties the index)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a4de915af9e2c4d365527ad09286483b2ee904fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
index 8ae290acc6..4ed936a70d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -23,6 +23,21 @@ SED_CONFIG_EFI_armeb = ''
 SED_CONFIG_EFI_aarch64 = ''
 
 do_compile () {
+	# Yes, this is crazy. If you build on a system with git < 2.14 from scratch, the tree will
+	# be marked as "dirty" and the version will include "-dirty", leading to a reproducibility problem.
+	# The issue is the inode count for Licnses/README changing due to do_populate_lic hardlinking a
+	# copy of the file. We avoid this by ensuring the index is updated with a "git diff" before the
+	# u-boot machinery tries to determine the version.
+	#
+	# build$ ../git/scripts/setlocalversion ../git
+	# ""
+	# build$ ln ../git/
+	# build$ ln ../git/README ../foo
+	# build$ ../git/scripts/setlocalversion ../git
+	# ""-dirty
+	# (i.e. creating a hardlink dirties the index)
+	cd ${S}; git diff; cd ${B}
+
 	oe_runmake -C ${S} sandbox_defconfig O=${B}
 
 	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
-- 
2.17.1

