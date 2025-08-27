Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E25CA0FFC
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:29 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.6606.1756330228408980672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QMZGccbH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso337051b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330228; x=1756935028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXgtD0QrPyUFlP1oCsvVr7/qYKRH8bb14uys1zsOBp4=;
        b=QMZGccbHLWa4csB2xoW9lj199806MQk/1Hi8ImJ55hQN+IcYRMX1TgVZX158gz7hQK
         MCAv+gDyazc8h5q56whg/7raJuaguRm7HIDMwswonQ/9ONu7RMoK/30HImPqjinQwxiK
         0j7fAioqgUGFva+HoZ37T7iNNXXp3Q8mV2a/bj/oRua4Vv+UWz01o2ISbQbeQvNkHm1w
         0CsXr6fuhryXlxWdvEz5q5T0/a0yAwS9iFc+cpEuEVqF4wdjPeK+9uE624Rl6Qfa9lRg
         cpYOM2rBO/Xqh9q4TjCl3TlSshRm2rmf4FRLk8zayIhMIRMDI6x6k1+beqOY3n/a7Soq
         HtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330228; x=1756935028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXgtD0QrPyUFlP1oCsvVr7/qYKRH8bb14uys1zsOBp4=;
        b=RVknN0FUR80673G7u60hwjWZN3aFXyHeFHAUJo1fiMWfIKUO4tEPgddV3UZUXOcXZW
         zluyYP6OaXf8i57gt8+0nUkGD2TV96mInITr9ECP+c6K+Ugkhms3evnZvdu7yWo5lEJt
         YHI/zoVOyygjQccBfLH1eLflR/ZI3TGOfd92C+g6Gkutkro/T4KXQYm6zt7LnU/nM04W
         5NqFBA+SIk1cVJhfgcn4OY56iIBDCGlD6FQEiy2f5h0YH4OvwS8g6YRr5h8MYF3ThxUf
         ekDF/EFN93SOucA8R3WErL/OFvJSpwLxC31j7FXnjsp5bJ5jiK4LrI5nAH2pYlELpspA
         1feQ==
X-Gm-Message-State: AOJu0YyifWdEdBbCmcMvLF0vwce1m3FfINMSr3hw4Fp/KofCLiYEVRY+
	LfVnZ5R9GSIjO+gguZJzb0Il8Y+2WNpGTwDVlgaQZLqol/3TwonWyA2yswl9rYz1Zw0pjIcDAa5
	QC16S
X-Gm-Gg: ASbGncsWMoT//nVN0RKAYpNHaXCPU0IlXfDini+VE88LzZCXt4nAxyICHGpXj5Br/yK
	CSHoBsBVRivhgTo5qi4Vpx+tzOF7vpTYSg27OUX8ztMHx8/EQVZwiGfQEMGhCbh5raERTRGpQed
	/GFrwSS+96fLVPQxRUaRYVpr9gthfqfQ/gR5OsYZ07TfnbR1JMY+GYJs2+vr95pbU4DHgRwJ19o
	JKtB/UQaa++DMGmJmtNFnjtNnjwy5op8+rXp1WaRKV1t51mN5hC6HovdD37/ZQTn4ULwzOylNLY
	/Gvse/RwgGtwM8Ob2T5VfC6u1xSFcPyZyv6M6JfbjyEg9Ldqf2ycsRLfu3kCpBWFiImTyllQXpR
	svW9+eGZrR7WnUA==
X-Google-Smtp-Source: AGHT+IFNGuCQhozP5i1nqGebLE470yMhqoZh+fQbPJdOsXRsJBHu7i97Kpekc/+vMAD+9OgG5Kd7cg==
X-Received: by 2002:a05:6a21:7e87:b0:243:4eb0:5835 with SMTP id adf61e73a8af0-2434eb05a09mr22094235637.57.1756330227583;
        Wed, 27 Aug 2025 14:30:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/33] gmp: Fix build with older gcc versions
Date: Wed, 27 Aug 2025 14:29:26 -0700
Message-ID: <237085506a454fb927389d681f30c8c995bc7b2b.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222527

From: Khem Raj <raj.khem@gmail.com>

The fix to make this work with GCC15/C23 caused problems with older gcc versions.
Add a fix for that.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...d-parameter-names-in-prototype-for-g.patch | 50 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.3.0.bb         |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch

diff --git a/meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch b/meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch
new file mode 100644
index 0000000000..ae2411fd1b
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch
@@ -0,0 +1,50 @@
+From 1744e433a16fb39a55c4c771b8ecb02246aa5b99 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Mar 2025 09:40:06 -0700
+Subject: [PATCH] acinclude.m4: Add parameter names in prototype for g().
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows it to compile with older gcc e.g. gcc-10
+which does not have allow parameter name omission, it results
+in
+
+a.c: In function ‘g’:
+a.c:3:8: error: parameter name omitted
+    3 | void g(int,t1 const*,t1,t2,t1 const*,int){}
+      |        ^~~
+
+this was added to gcc via [1] thats why it is supported in
+newer gcc.
+
+Adding the parameter names make it compatible with
+old and new gcc
+
+[1] https://gcc.gnu.org/pipermail/gcc-cvs/2020-October/336068.html
+
+Upstream-Status: Submitted [https://gmplib.org/list-archives/gmp-devel/2025-March/006294.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ChangeLog
+
+2025-03-15  Khem Raj <raj.khem@gmail.com>
+
+   * acinclude.m4: Add parameter names to function prototype.
+
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 4fca12de2..b9d1eacfe 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -609,7 +609,7 @@ GMP_PROG_CC_WORKS_PART([$1], [long long reliability test 1],
+ 
+ #if defined (__GNUC__) && ! defined (__cplusplus)
+ typedef unsigned long long t1;typedef t1*t2;
+-void g(int,t1 const*,t1,t2,t1 const*,int){}
++void g(int a,t1 const* b,t1 c,t2 d,t1 const* e,int f){}
+ void h(){}
+ static __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
+ {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support/gmp/gmp_6.3.0.bb
index fd810a264d..1508744ef1 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
            file://0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch \
+           file://0001-acinclude.m4-Add-parameter-names-in-prototype-for-g.patch \
            "
 SRC_URI[sha256sum] = "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6fe2e47b000d1c20cb"
 
-- 
2.43.0


