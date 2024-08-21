Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E04FC54722
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:54 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.18874.1724244646444793066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NJRLzAS+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so4448912b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244646; x=1724849446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSF0yBIzCfhyw2SWK/ZBv/9mlk6ejdJsZTwh2tr1a50=;
        b=NJRLzAS+st1Kva6mTwlRsiQa0Grzf2k+jvjmyxYfC1/X5mE5qzJ9sY7O+32zkOmnpQ
         TPQZ3oPPh6tThhVMd1NNqquX+y7mqlEBlXqBmSeC9XdJe2ijBC/i9XSdmv6OJrzgMVPo
         RG/L89rM3u9pHMUXtxZZrEkdHr1OjDnIPNj74XvLukGOEdjm4iVAW5G+hBorMu5rYudp
         b+fUPn62tjOZQdxVuHZWc5PKkogji6wCSEyksaYjlZS3sBK/q0dobHD1eAVRUNX06y05
         js+yVJfQ9XVLgBrLvxVLhy8R/y+r17SSmE8/9PUoUEPymCi4jQo02gzAhk75GOyb8g0g
         g2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244646; x=1724849446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSF0yBIzCfhyw2SWK/ZBv/9mlk6ejdJsZTwh2tr1a50=;
        b=VhBG1ihGGrl2kRmsTP5xZ9YgpfYK2dDoJh+qEUgt9ZBAgcW5baKTCe0RUFvug6dMdk
         GQa5qDQuQxW/zbn08A24czcmNM8veU+OaIHUERFO+HZZE4ebobly1ONm90z/VWU4T0+I
         fXyDlv6OXSrTKvmRk3xhs+5IuTyD+zIdWanJubOlS1lMtZpNwBVx2kOonJOZ8e4v3S/a
         pNsedMZp5oFlwBtgHGuVS+4zYcPRxTEVzBEWJb1pkKN3Mq+R6a9ElqaXwz/atuw0+yvi
         DracrAgPmHp/uFOxzC/gxvlH36/FY9RdV/V92vXdmyY7eZWrPQWd0HWTfoP03wC9d44e
         dR+Q==
X-Gm-Message-State: AOJu0YyMCvN3WZ+3ySsC5s8GcWnjMM4WWlpehqptOzvunWIxuf1ncnGc
	J/eH4gZA5L5Db0O6ZUrQlCdk+2PQ2yd+VyBIAQFWOrMYu+Og1A1p+cWzwK4FGTXqQ9DjT6DamRb
	55/s=
X-Google-Smtp-Source: AGHT+IEOHC50Ua50yyyUuS9wjoytat8Wy2mg9QMG4+wIFCtSprkUkr1AEtco1Lm/T0ruMysWTN68Xg==
X-Received: by 2002:a05:6a00:4f8b:b0:70d:2a88:a486 with SMTP id d2e1a72fcca58-7142396baa6mr2169924b3a.29.1724244645586;
        Wed, 21 Aug 2024 05:50:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/18] libgfortran.inc: fix nativesdk-libgfortran dependencies
Date: Wed, 21 Aug 2024 05:50:19 -0700
Message-Id: <63ecb048f8238f67e21f77512b5276021b060d64.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203596

From: Martin Jansa <martin.jansa@gmail.com>

* use virtual/* variables as INHIBIT_DEFAULT_DEPS does to avoid dependency on gcc-cross-
  from nativesdk-libgfortran

* the dependency was added in:
  https://git.openembedded.org/openembedded-core/commit/?id=00fba52c8a6f6383137cf89fc7aa34cc3e2ff45f
  causing:

  build/oe-core $ bitbake -g nativesdk-libgfortran
  NOTE: Resolving any missing task queue dependencies
  ERROR: Nothing PROVIDES 'gcc-cross-x86_64' (but virtual:nativesdk:/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/libgfortran_14.1.bb DEPENDS on or otherwise requires it). Close matches:
  gcc-cross-aarch64
  ...

  with:
  MACHINE=qemuarm64
  FORTRAN:forcevariable = ",fortran"

* after:
  https://git.openembedded.org/openembedded-core/commit/?id=44fc7aa1468ff042739cc5a91c84ef5c2a09e0a3
  nativesdk-libgfortran is pulled as dependency of nativesdk-gcc so this affects
  more people who didn't explicitly use nativesdk-libgfortran before

* the INHIBIT_DEFAULT_DEPS and gcc-runtime was there since gcc-4.8:
  https://git.openembedded.org/openembedded-core/commit/?id=a5e7ee5770b9e0cf719c573efffd874440f74289

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5ce2e9c66cd2c08e141913ec65386f940353a8c5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index e810146d4d..c68645e392 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -47,8 +47,9 @@ do_install () {
 	chown -R root:root ${D}
 }
 
+# avoid virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "gcc-runtime gcc-cross-${TARGET_ARCH}"
+DEPENDS = "virtual/${HOST_PREFIX}gcc virtual/${HOST_PREFIX}compilerlibs"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
2.34.1


