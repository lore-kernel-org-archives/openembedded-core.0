Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CDCC3DA78
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 05:10:20 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.110347.1673673013937849067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 21:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hVUCIWy5;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id w2so2167266pfc.11
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 21:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cV/uXDRJoxQTTq/94APaI+FuaGsfH51yxNvdff58NG4=;
        b=hVUCIWy5/G4f1YzOoDKh3r0Qp+rHY2UzpYijFghhOO+raKdub+l8pfk2gu4+r9IF0Z
         eCyly9zKZ22zYpYk/Q5Lyx1mcmKYe/93ez0x2bMCMCAAy3yOkUCrufYPZ/mko4QTyUhU
         nufjcY0GJq0n9FJdBNGGP/nYO7hc9mfJDNprNE2T0fuc2KuK93o5pKbK4MYYdk19Ntb3
         qFotRCCEmVgiJouCGIV2hKmYVvFfPeLXdGer4L+JlE+YHHPuDbrhA6nDC+HPhC8Aid6C
         TzxvrqGSM+jXDC8eQvCQbtg7gEYNu6ydQLJTi5yy+VUA1iKO/sUQoWanKet2T6fdwzbV
         5EBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cV/uXDRJoxQTTq/94APaI+FuaGsfH51yxNvdff58NG4=;
        b=yAvKFsBnc0R60JJqMnqBMlLBK3czhl6YXA+qOtOjEL3u4Kf1X/FJZ6tyvKHnZz0dQd
         /yE6cArYoE35hAd9LNm+GYV4cE8HJqI35/9/Fe8iIE9VA8N8z504CXgXfRfHZmkaeFRH
         YqlHBo3nnSVqXkQyPdvs9pODXICNvcWm7Ut3IWMZgfOaB5hqPWPoQRQhVvE0m0ccVFFs
         eEL7HCkSzeo+X7BiS/687STVa3F3TLUPZYpCJKm/yYKWZBJcd25vABlNrWYPgVh3Zm01
         kZIZErNdpFFAMhtfvEx24cx6/ZpEEXLQbFgcbxeKQUMcwzJnzcJNhL1L5DIMf1Z8McLI
         m5xA==
X-Gm-Message-State: AFqh2krZxn8vPRdehpT56KXY0bOfKNvY59Iokx2+97E/CBYH47DA1h7O
	okc5uVxoG757VV24PC5Hi2ugCLnAPtJGSg==
X-Google-Smtp-Source: AMrXdXs1AvT6mAlv/w86m2ivW5Jj+mnHDrRLtELHXg5o7Z4bX95mUXKObQa7rAhFrAUzVIfwVifeyQ==
X-Received: by 2002:aa7:8186:0:b0:58b:d244:b525 with SMTP id g6-20020aa78186000000b0058bd244b525mr304473pfi.17.1673673013009;
        Fri, 13 Jan 2023 21:10:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id h6-20020a628306000000b0058a7bacd31fsm8049246pfe.32.2023.01.13.21.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 21:10:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libglu: Remove deprecated register in C++17
Date: Fri, 13 Jan 2023 21:10:10 -0800
Message-Id: <20230114051010.2654332-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 05:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175849

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Remove-deprecated-register-in-C-17.patch | 32 +++++++++++++++++++
 meta/recipes-graphics/mesa/libglu_9.0.2.bb    |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/libglu/0001-Remove-deprecated-register-in-C-17.patch

diff --git a/meta/recipes-graphics/mesa/libglu/0001-Remove-deprecated-register-in-C-17.patch b/meta/recipes-graphics/mesa/libglu/0001-Remove-deprecated-register-in-C-17.patch
new file mode 100644
index 0000000000..95d56e9573
--- /dev/null
+++ b/meta/recipes-graphics/mesa/libglu/0001-Remove-deprecated-register-in-C-17.patch
@@ -0,0 +1,32 @@
+From 1910b3a83a7e5aa1a31c4325829c94134fafce76 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 13 Jan 2023 20:58:07 -0800
+Subject: [PATCH] Remove deprecated register in C++17
+
+Fixes errors like
+
+src/libnurbs/internals/varray.cc:76:5: error: ISO C++17 does not allow 'register' storage class specifier [-Wregister]
+    register long ds = sgn(arc->tail()[0] - arc->prev->tail()[0]);
+    ^~~~~~~~~
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/glu/-/merge_requests/10]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libnurbs/internals/varray.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libnurbs/internals/varray.cc b/src/libnurbs/internals/varray.cc
+index 1cb2354..41b3b18 100644
+--- a/src/libnurbs/internals/varray.cc
++++ b/src/libnurbs/internals/varray.cc
+@@ -73,8 +73,8 @@ Varray::~Varray( void )
+ inline void
+ Varray::update( Arc_ptr arc, long dir[2], REAL val )
+ {
+-    register long ds = sgn(arc->tail()[0] - arc->prev->tail()[0]);
+-    register long dt = sgn(arc->tail()[1] - arc->prev->tail()[1]);
++    long ds = sgn(arc->tail()[0] - arc->prev->tail()[0]);
++    long dt = sgn(arc->tail()[1] - arc->prev->tail()[1]);
+ 
+     if( dir[0] != ds || dir[1] != dt ) {
+ 	dir[0] = ds;
diff --git a/meta/recipes-graphics/mesa/libglu_9.0.2.bb b/meta/recipes-graphics/mesa/libglu_9.0.2.bb
index 0d27dd116b..525d631611 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.2.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.2.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b35645
 # Epoch as this used to be part of mesa
 PE = "2"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.gz"
+SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.gz \
+           file://0001-Remove-deprecated-register-in-C-17.patch \
+           "
 
 SRC_URI[sha256sum] = "24effdfb952453cc00e275e1c82ca9787506aba0282145fff054498e60e19a65"
 
-- 
2.39.0


