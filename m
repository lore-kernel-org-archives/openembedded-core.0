Return-Path: <xmdy61@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D34AC83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 11:41:02 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.19100.1693914055896236896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 04:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=X3vjylu2;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: xmdy61@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68a42d06d02so1473215b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693914055; x=1694518855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lbNzfrMN93UPXsiZnxwbhQJOON1Lx+UCl5dYQRfauFM=;
        b=X3vjylu28vbSKs+SKxOaeWNXMyCbaUrhRgXtH3CCJ6kueeSsV1h7H0oMdw/P3RATQx
         AhQZzQKN+XsL08IRgOCzKNpjXT7xcaC0R+MGEU2nXfhg1aqsF5c9RqEudZifRteBJUOI
         z4xrZ38JrBZkEN34O7phZhLkH1pTIGWwNP5qNiwoqkMpKfY4Jle8TR6PkO3RblSr4VY0
         +XabWhD1bIODgkmwwCrQLqedoNEai0ss9Jqqusd87AR+Tq6lr6qpUcfBfMkdEoMzxM23
         kenvP+gPlD13Ls58LTUe5vVBcgdlzVSte7ijsAgcNDJO5/A4o/PaP1YeWclv3F5T4K4Z
         zQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693914055; x=1694518855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lbNzfrMN93UPXsiZnxwbhQJOON1Lx+UCl5dYQRfauFM=;
        b=PBXRAkzzlt+GhvkDlg0qA0EWd5m96D1/WRG1dL8NkF1aITsgktDrGH11fZpCpnAbe4
         QpUM68okwlohEuBD24w+qQpDm32moNhJKelXt7aR/9Ge0B6bVpDvPnrozPuIeDIj5bXN
         XiCQwoPsGAteSQ8Y0xR42WKv3zhUYwC04d7UVVBCdObBmXtApqPqV8ypgMczf4HvqVR5
         f0jVyIAObGOWO7c9z1yBXSEhchPySTlhEJTVmiSJVajIMVt0AS1NeCaykjTcll/3qUHw
         ppSo6RCbjofFLPeGPyVquICUQW/jixM03KWtKBREP+cPmYadGXifUSiAjQJ2J6Eg5o43
         Yiqg==
X-Gm-Message-State: AOJu0Yz21AGJVUxTNj/RfKZZAe5fpBd6dtbfhSSSmSBnU734WgG+cZhv
	5d3c14/jXccv/Df111QtkyEuyX4LZKl7Gp5d
X-Google-Smtp-Source: AGHT+IGy21fH4hU5CgXN0hjQ14N66FvWNqQNa9EpBz3zhPR+gq2ihrzz72oXuUAm3WDBETdUxX+fvw==
X-Received: by 2002:a05:6a21:33a1:b0:137:7198:af9b with SMTP id yy33-20020a056a2133a100b001377198af9bmr12701247pzb.56.1693914055114;
        Tue, 05 Sep 2023 04:40:55 -0700 (PDT)
Received: from localhost.localdomain ([112.20.109.102])
        by smtp.gmail.com with ESMTPSA id j13-20020aa7928d000000b00689f8dc26c2sm8852848pfa.133.2023.09.05.04.40.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:40:54 -0700 (PDT)
From: Zang Ruochen <xmdy61@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] [OE-core][PATCH] gcc: Fresh 0003-64-bit-multilib-hack.patch to add loongarch64 support
Date: Tue,  5 Sep 2023 19:40:48 +0800
Message-Id: <20230905114048.18870-1-xmdy61@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 11:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187211

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 .../gcc/gcc/0003-64-bit-multilib-hack.patch   | 54 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
index 3b3eec2027..69e7fa0ba9 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
@@ -28,6 +28,7 @@ Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
 ---
  gcc/config/aarch64/t-aarch64-linux |  8 ++++----
  gcc/config/arc/t-multilib-linux    |  4 ++--
@@ -35,7 +36,8 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  gcc/config/mips/t-linux64          | 28 ++--------------------------
  gcc/config/riscv/t-linux           |  4 ++--
  gcc/config/rs6000/t-linux64        |  5 ++---
- 6 files changed, 14 insertions(+), 41 deletions(-)
+ gcc/config/loongarch/t-linux       | 34 ++++++++++++++++++----------------
+ 7 files changed, 32 insertions(+), 57 deletions(-)
 
 diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
 index 57bf4100fcd..aaef5da8059 100644
@@ -147,3 +149,53 @@ index 01a94242308..1429eceaebf 100644
  
  rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.cc
  	$(COMPILE) $<
+diff --git a/gcc/config/loongarch/t-linux b/gcc/config/loongarch/t-linux
+index e40da1792..0c7ec9f8a 100644
+--- a/gcc/config/loongarch/t-linux
++++ b/gcc/config/loongarch/t-linux
+@@ -18,7 +18,9 @@
+
+ # Multilib
+ MULTILIB_OPTIONS = mabi=lp64d/mabi=lp64f/mabi=lp64s
+-MULTILIB_DIRNAMES = base/lp64d base/lp64f base/lp64s
++#MULTILIB_DIRNAMES = base/lp64d base/lp64f base/lp64s
++MULTILIB_DIRNAMES = . . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+
+ # The GCC driver always gets all abi-related options on the command line.
+ # (see loongarch-driver.c:driver_get_normalized_m_opts)
+@@ -36,18 +38,18 @@ else
+ endif
+
+ # Don't define MULTILIB_OSDIRNAMES if multilib is disabled.
+-ifeq ($(filter LA_DISABLE_MULTILIB,$(tm_defines)),)
+-
+-    MULTILIB_OSDIRNAMES = \
+-      mabi.lp64d=../lib64$\
+-      $(call if_multiarch,:loongarch64-linux-gnu)
+-
+-    MULTILIB_OSDIRNAMES += \
+-      mabi.lp64f=../lib64/f32$\
+-      $(call if_multiarch,:loongarch64-linux-gnuf32)
+-
+-    MULTILIB_OSDIRNAMES += \
+-      mabi.lp64s=../lib64/sf$\
+-      $(call if_multiarch,:loongarch64-linux-gnusf)
+-
+-endif
++#ifeq ($(filter LA_DISABLE_MULTILIB,$(tm_defines)),)
++#
++#    MULTILIB_OSDIRNAMES = \
++#      mabi.lp64d=../lib64$\
++#      $(call if_multiarch,:loongarch64-linux-gnu)
++#
++#    MULTILIB_OSDIRNAMES += \
++#      mabi.lp64f=../lib64/f32$\
++#      $(call if_multiarch,:loongarch64-linux-gnuf32)
++#
++#    MULTILIB_OSDIRNAMES += \
++#      mabi.lp64s=../lib64/sf$\
++#      $(call if_multiarch,:loongarch64-linux-gnusf)
++#
++#endif
+
-- 
2.20.1


