Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D07FC78849
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:50 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.18448.1726839580315517816
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QoVWxuOv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-719858156f4so1667668b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839579; x=1727444379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2LrArErj8Xt7VPPislNSqCTodYL4VLkPIT8RO0SSF0=;
        b=QoVWxuOvidSZXZZXf/vv7TtOZfN40YLKqHSmpH/qvc6YDdGPEOZnaZToWkHi5djpua
         nZmL7tFrg+Us8H63br9nnjULgZPis8OjVagR9EVPE4ekViI+bo6qMeYBKVqGvDI3dEE6
         SL3jJDTvewjb61CI0qQLxcamUIXIrXZ+sHNjaarRO4Z3KvMxZsXsavogUue0Und91dqn
         mMlmSOMQJPAyIiAv8JeA4XSkYQDHaU9Z8L9u39Q8nC3LSNpi+69pid6qnJ6NGbRQM5SA
         ZeO7fVtzBVb8dR8zaGaLxB8BPoNNl+xrwzxZ3G3cP0j8prREu1giSQC3qA4YW/gRPdPk
         DVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839579; x=1727444379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2LrArErj8Xt7VPPislNSqCTodYL4VLkPIT8RO0SSF0=;
        b=pgzuITXLTZ+WScK9DVQlRPaJIN48OpASa/9QksIWZZhKI5my4mDcFe/N60CBwh8ges
         +kO0h/Zj4Z5Nw2u+ePAsEmSDX4Ko+IqzlM8gZl2lobERZ6GtmaKqeXTZ1513nj8gG1YH
         iSiz20ZkktUCJohaKt8Y3XDypbDlbcS+t9I0MT0xNdek3wkslLibOVXgyh67PQGCK9RS
         RH4cYdoBa5JShzKl7aI8NlfOBB0STVO+pQekjIKFZ8WMMtRMtiD1OHOPpNWHBwfA2jtl
         eu8rLYaEPQisbr9cyMomoDIHGFwdEnISYMBRkATQ1CLBnZ0PmSS70ZOO8Lp7a+NAMNOG
         HUQg==
X-Gm-Message-State: AOJu0Yy2/vW+U++DSpd3G9SGnhm2rHzAuX1lf7wu5zhcPdLc/Sw7mo27
	Me0ArDScHfDGyj8JNEzGtzaYlf8N4bQZ8ea8o2F5+3rqc5seCt/DT2n1T2QMecak7Hly71i78xV
	v
X-Google-Smtp-Source: AGHT+IEX7Wk6XZ6J2P07ZbIb8hx5iRzpNRg1KtDE1+0cocixFoP1nvXNd74ptcqyrOS7bZ4oUQ/O7g==
X-Received: by 2002:a05:6a00:9284:b0:70d:2725:ebe4 with SMTP id d2e1a72fcca58-7199c9764d9mr4120534b3a.13.1726839579547;
        Fri, 20 Sep 2024 06:39:39 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/16] gcc: Fix spurious '/' in GLIBC_DYNAMIC_LINKER on microblaze
Date: Fri, 20 Sep 2024 06:39:09 -0700
Message-Id: <d143981f78a85a4c5e057528f4bad7acefd46465.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204750

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport from master OE-Core rev: f0eac82b9a1e4549b7d918df768c369ed7ab5183

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index b0b77dbfa0..9de883c2c7 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From aacfd6e14dd583b1fdc65691def61c5e1bc89708 Mon Sep 17 00:00:00 2001
+From 4067ae345f0ff1fbf37c0348f2af09257513b817 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -185,7 +185,7 @@ index aecaa02a199..62f88f7f9a2 100644
  #undef GNU_USER_TARGET_LINK_SPEC
  #define GNU_USER_TARGET_LINK_SPEC \
 diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux.h
-index e2e2c421c52..6f26480e3b5 100644
+index 5ed8ee518be..299d1a62c81 100644
 --- a/gcc/config/microblaze/linux.h
 +++ b/gcc/config/microblaze/linux.h
 @@ -28,7 +28,7 @@
@@ -193,7 +193,7 @@ index e2e2c421c52..6f26480e3b5 100644
  #define TLS_NEEDS_GOT 1
  
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
  #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
  
  #if TARGET_BIG_ENDIAN_DEFAULT == 0 /* LE */
-- 
2.34.1


