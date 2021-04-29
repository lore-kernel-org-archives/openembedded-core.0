Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.1560.1619664659821730837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 19:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XHnDh7JS;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so10106655pjh.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 19:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZZT4ed18d7Pne2aI9PAdoKgC0Vc68vDTcNL6bkjJpBY=;
        b=XHnDh7JSFoQKKfuZ53SChV1ZrC/R9LwFJlWLAr7wHsaKq2+i9HkMP0gkQ8BKLeJENT
         K9vHQh5c6YcJ7pwDOk9gpB1RHxA6LcpRJ+83zWHpylENB7pmdYBpX/KJPX0VFatMtHUI
         x/yWaq86gBAej4hlAr28VtDoCJH0gSRlpsPtBGzEIFv8/BXtkFl6IEDb72f2XDrvh8C5
         PjvaKhp/7QpZMxeHvXOBQ4BeUxtNKynvpwBv5hP+ujw2HVg9yiQ2YLn9xdja53Nqoorx
         dqyplBOwfdcrJzBvmoWUCWyOguz4czKvXNjh7/eliYtSFlXV3D7xHP6xSymkozhH2Bv1
         pm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZZT4ed18d7Pne2aI9PAdoKgC0Vc68vDTcNL6bkjJpBY=;
        b=GbCQ5JCOCTQQZjwDxXAIyGvvenx1vfDpUwTWC9tULwj6Pr/LhPQ7PU/ZKkfEPZx1XW
         Otu7GGVzaQwfyy9BleZNmmSkf5Y61plT+O6csUQqAJMcOgKeHL+2HuwmppHHzLMbWRJK
         YVFJ5guCPT3vJLQg9qtg//R6ln+HccCTPij4RF+LA7vbg3pBc5lGyRALqSBy7CQqdkGw
         9wjzqCBSq+27txoh9up3qMlkgTTXCbqXkj/XTWRltfaLrbTchXGeAROE+Nq2oJI7eHGq
         uKeb5kOXAUS9HmMZ4Z0ec3WWiUmuC0xgG0LBmt8aP5k62X1Oj8ppG4x4bDe2mDhuoXha
         kZ4A==
X-Gm-Message-State: AOAM53237c1vKXbLOUd+v+6Mq+zUn1c54d9oKk/gtEW6ylDIKQzyJrCz
	n3sUnEUdFCoaDqcky1yiYdvWDLTP/Q3ylg==
X-Google-Smtp-Source: ABdhPJwyQ1EVjHskubns2Bp/TEW88nMGDlErekVTuhLy8kDJsyRKmqhJWkwl2bpJmIv5NABaLuaPjg==
X-Received: by 2002:a17:90a:a581:: with SMTP id b1mr36512990pjq.53.1619664659062;
        Wed, 28 Apr 2021 19:50:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id j7sm864688pfd.129.2021.04.28.19.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 19:50:58 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libid3tag: Filter -ffile-prefix-map too
Date: Wed, 28 Apr 2021 19:50:56 -0700
Message-Id: <20210429025057.42312-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

helps when compiler has -ffile-prefix-map flag which helps
reproducibility as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libid3tag/libid3tag/cflags_filter.patch               | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch b/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
index 0d1d0dc381..1895748d1d 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
@@ -4,15 +4,13 @@ flags. We need those to generate reproducible binaries. Allow them through.
 Upstream-Status: Pending
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: libid3tag-0.15.1b/configure.ac
-===================================================================
---- libid3tag-0.15.1b.orig/configure.ac
-+++ libid3tag-0.15.1b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
 @@ -99,6 +99,10 @@ do
  	-mno-cygwin)
  	    shift
  	    ;;
-+	-fmacro-prefix-map*|-fdebug-prefix-map*)
++	-fmacro-prefix-map*|-fdebug-prefix-map*|-ffile-prefix-map*)
 +	    CFLAGS="$CFLAGS $1"
 +	    shift
 +	    ;;
-- 
2.31.1

