Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.9860.1621607618638481271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 07:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=giC9TpWC;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id a4so9391397ljd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CT3dwomrUTwGIOZRRAlHeTNDGPb3zX1Nt3TBSojneVc=;
        b=giC9TpWCAt4nz2TT4+dWk+I4+67iRRXM7nreINOJUcKdo20/9ALhCLrtbNhuDL4XZy
         tPu+38aLaEuzPJAmipae+rFUc0La+77CbKqzqwALgHMwtlb+5xHWvadSDQzSVoHs4qUv
         VUEXqgXF7ZVeIwMByMt7xtvNv542LJdbUOcIaR3FMRvgMboT0RVHs6PRscjhCU9Z1PAg
         Y6rC5ObeJiayG+MDxXYGP78PYM1n8bu4HG2u9E6Q/kWg4C25yzoEMyeieaaBkYdEu5Rc
         ThGeUiQOeB73g/8R08GjCdfrm6aFnvQfZnJeLmfz3m8Rfmv0qG/z3ChDtjjDGArLwB5l
         3xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CT3dwomrUTwGIOZRRAlHeTNDGPb3zX1Nt3TBSojneVc=;
        b=RAugNrvoUuiPYjEF2yBuKt2VcuELfzzimQHAAl2q9aq439EL6z7NQu+xWUhfq4LJXm
         k3YWFaH/HerRoopuEUGf58wYKhpDGBOoe/O+zuMqkAnNhdeaJgJBhlMIqFgXlqo+rjLY
         SatoUApL8280lbjCTte9TKrMbg8jCLhDU9ETMAdcNxDfII2aVMzIApR4mcsxSn2BvPP8
         AWv1CSMczypMxLj2ocEs9rLgpzjO4RVLg4KyBCm6bSF1f6F3Td4D+SEab2blMgyGptDK
         2jX1UMtNbs3+xSdE2DYbGVHFBboLhkxL80hZUcStMcuPNd9OvZzIQoeMZS1u1JJh0Eak
         YRIA==
X-Gm-Message-State: AOAM5338swONlcCSY04fSfFQxeanu4zZgQvxkwQ5l2KMO/eq/9Y6ERd3
	BmNUF1c5dt7pa8LvBG/XG8qdnH50foIRUsLZ
X-Google-Smtp-Source: ABdhPJxFnyLVqxdPrtZzzL4QNvYNVkYxtCzqCXKYHoUcmUX5V+Ke84lHXyKFzDwRyps17ccNyFOW3g==
X-Received: by 2002:a2e:7a17:: with SMTP id v23mr7036098ljc.99.1621607616364;
        Fri, 21 May 2021 07:33:36 -0700 (PDT)
Return-Path: <samuli.piippo@gmail.com>
Received: from munkone.intra.qt.io (62-183-187-94.co.dnainternet.fi. [62.183.187.94])
        by smtp.gmail.com with ESMTPSA id x32sm638543lfa.178.2021.05.21.07.33.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 07:33:35 -0700 (PDT)
From: "Samuli Piippo" <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] Revert "gcc-cross-canadian: Add symlink to real-ld alongside other symlinks"
Date: Fri, 21 May 2021 17:33:28 +0300
Message-Id: <20210521143328.3368988-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit cdd86896c8d29135f937968e9aa07f919cf543d3.

real-ld is always used if that is found, which means you cannot
switch between bfd and gold linkers using -fuse-ld gcc option.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 878feaf810..e8fbb6186b 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -131,8 +131,6 @@ do_install () {
 
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix
 	done
-	t=real-ld
-	ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld$suffix $dest$t$suffix
 
 	# libquadmath headers need to  be available in the gcc libexec dir
 	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
-- 
2.25.1

