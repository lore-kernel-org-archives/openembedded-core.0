Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74635C27C79
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 14:50:04 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.23084.1718808599207882969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 07:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iMgucp9U;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6ef64b092cso838860766b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718808597; x=1719413397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W9B7A21j0wdGNEZFSQiQqIOZ4KJE9t8wcNaAKp5XN4c=;
        b=iMgucp9UiPPZ0/7WkrHWuR1z7i9sO0oOv3afZpGjO03b8TPU3rlqCc3VzFnc6mzby0
         OaFvva4WBTbWWE0GdOkuXJTuIWALYFVQJGnAuh8BzI4eC7Kn0yZi1JgFqKXh40dCKR0Q
         OKaLULuEqgXzsRvQBYb1Q3itbC/gIRfOKEBvKif0f5p+qCEdG0uK6UQRZME+AtDnAI7T
         mqJgktRovJTgHx7rQ7Bu98s78qnKPHYlUigQ3fCRsaB9WjBaUE0VcL5AQwAa8VHUrL48
         vyvkigYt026MTcrPvDud+6om14Lk76KkpHRFepeH/Y3VasVeVFuspradCqD21FrW36NS
         m2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808597; x=1719413397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9B7A21j0wdGNEZFSQiQqIOZ4KJE9t8wcNaAKp5XN4c=;
        b=B311CpB46HJfcXUo8ZttNiCdZtms2/uEQD6LdxM7e1YHzV3bPH1CihUz7HAArS94PC
         7tLlpswsPbmUNoirUlJgPyeR8SPJn6YLkhJ+6hcu2PxBKdgtBlOANQm7sOwoTy70bcpx
         P0SPEOSjv49N5SYl3x0pvC2Sv/aD7DZcbsUDoT8fPhG3oP70UWu4VyQcu6mBfr3URRXC
         qEx+pRQgQp2Xov23lrDpcK0hhjp83UnwqB01YWw1LCLkNx1OZAx9aT3gGYC9mLrrkg7n
         nZojXtowuAsb1jntZ05cjz0Rw6dv0n9oPLApzMRjTCpEZ024lUygcEhhzbYvAC5meo7+
         YTUA==
X-Gm-Message-State: AOJu0Yz2lmyckEwfi1tFxxb+fMFv5gG/NnjJLZXsExdcsWrSbvv4+hiX
	WRg4Sagy10Dcb67y0nDGveI1q2On6XmMsPlN8s6Y/NpYMcig9nIa+8yuBg==
X-Google-Smtp-Source: AGHT+IEHcDkv2dUZtjmp00vio39Z8M5L0Y0vj/IMABJorVROZ+lpKPZx5dW0KEkF2uZ3EIARWdd1pw==
X-Received: by 2002:a17:906:6a25:b0:a6f:1cf9:9b56 with SMTP id a640c23a62f3a-a6fab60bc7fmr214004066b.9.1718808597394;
        Wed, 19 Jun 2024 07:49:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fb688727bsm24866966b.20.2024.06.19.07.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:49:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC PATCH] libgfortran.inc: fix nativesdk-libgfortran dependencies
Date: Wed, 19 Jun 2024 16:47:55 +0200
Message-ID: <20240619144755.2200541-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 14:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200915

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
2.45.2


