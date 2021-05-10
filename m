Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.32429.1620657071812892498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=igYU/mkA;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.50, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f50.google.com with SMTP id p6-20020a4adc060000b02901f9a8fc324fso3508933oov.10
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CYYwJhLsTeDFj3t/ck7sjIb9pLVFzEorL/cJEJGSHBs=;
        b=igYU/mkAfny9hrLEKv6Ir+yjy14z0Qd4nDSG4eK5efSSYLd0Cm26aasbc0Vk4HHXVF
         soM4z/j9Hd9r6hIVB7wWDYxFBFQOZ9bhUaiG7qNpVsylmdR7aNbKsHkwN2FRRQUoaSKa
         AnI+7sGvxmMNBro69QlNdEYEPPm2V8LiaNEXVUCiplQNWZj9zecZ3+mcNm8pxXmViPNd
         zbpBt20GnBo54qihp81NJWK3VOdnRhPjhgE9uaDNTbDmUlil3nFHoFEpvgmSAgDShW6K
         SMsL/j/g5mv57+U89FjQu9xHzW2Fnv0Tuirn35wFI3Duhv4VKwAuc/KtU2GQp2PLs8IN
         jNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CYYwJhLsTeDFj3t/ck7sjIb9pLVFzEorL/cJEJGSHBs=;
        b=J8rkRuDU8v4BDkCbbPEmr7bDsLPPPeHW5GAzVGD4pP8AqA7VNpdeSlr7hIEX001TuN
         /mFRRSQrv86QTkeMuAD55xw3qy8n9DUH8PP9XAxPQyXHiFHW52wQyDt/Ftr+4+/CfMds
         26SKIQWx41UgMf/c/wAV0mbdH2gkDBMK/bzhInCMK/7TWYDLg/mkAZP5A7HoniE86jVQ
         DOatlZu3F8rFLCctryP0geRmJlDm0kg+7728Lt5e+uzSQyzCQhnldXljhsW3qvAz7ncO
         AibD8EHi70wAx8tc7GTxQIxfjyxCkoUXknAAqVXDzc/QjvemGJ8VMeQUlABg10DuT7j+
         xWuQ==
X-Gm-Message-State: AOAM531HgZ5Wm+T91KBWsDvW/upJo/NkaKA1Xc9/iCth6ns6u76JjbJD
	0qKFERTg/nmLEZ+C9u70/K2C7e9HoFbYpCrb/Dg=
X-Google-Smtp-Source: ABdhPJwWp1yNGsVPn4AdcWIEIWmMknq01LRrhO+IDmLDrVhVOzwe2EXK8x5CDV7OVlznjqVklp0gyQ==
X-Received: by 2002:a4a:1104:: with SMTP id 4mr19391836ooc.57.1620657070702;
        Mon, 10 May 2021 07:31:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.31.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/25] classes/image: Use xargs to set file timestamps
Date: Mon, 10 May 2021 04:28:59 -1000
Message-Id: <2538a566f01f79537f8a94d93ac02588d6c239ec.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

Instead of having find directly invoke touch for each file in the root
file system, pass a list to xargs for batching. This significantly
reduces the number of times the touch program is invoked and speeds up
the do_image task time:

    PKG           TASK      ABSDIFF  RELDIFF  CPUTIME1 -> CPUTIME2
    my-image      do_image   -45.3s   -94.2%     48.1s -> 2.8s

    Cumulative cputime:
      -44.3s    -92.3%    00:48.1 (48.1s) -> 00:03.7 (3.7s)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15c65f90a3aa1e98c2beab2539403157df1fca08)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 79c487ea18..98513ddf08 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -662,7 +662,7 @@ reproducible_final_image_task () {
         fi
         # Set mtime of all files to a reproducible value
         bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
-        find  ${IMAGE_ROOTFS} -exec touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS {} \;
+        find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS
     fi
 }
 
-- 
2.25.1

