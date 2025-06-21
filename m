Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BB7C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:23:34 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.8231.1750515809913973246
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ka4PeCRE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso3247428a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750515809; x=1751120609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBHRSqEGAPu6S4Wwsc4VGMr7aNLhbzI1EE9i16NipD4=;
        b=ka4PeCREbxS/5ko28pio9LCMgR3HNl/zlRjsseBMhJmGsXB6G245kUp9yezdaxWYVB
         /Yrrp+QuQNfuPXVMeFEXOkRGu7lkFQDeMzMnx+JeORe/FIPcfsCYdHkIE6SlboQ1yX4F
         JxHlCR/BHk9iZy807j8HsK3fZeECPDOmch2EU8nq9r7MyFK12mtvuSF7IenJDD1NQjL/
         pLcbGUMQ+yjkuNxFm+6wQL/Dw50vYX3P3uAMn2Lj/At2l6RB+GIqM0NtX4dnFbdY8EjI
         QiFmIB7wSscd5Yos2ZUKQw23ZEzAg5K8MHcNPRsEII4Ciw4KGMCOYU3vAs/xZnDE9a5H
         Ip1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515809; x=1751120609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBHRSqEGAPu6S4Wwsc4VGMr7aNLhbzI1EE9i16NipD4=;
        b=Do/QEu88vpmFdDKCl096O7NVsAY+JgoKN71MJSf1s/UrFsNZ5vU6sromaJECyDAMxz
         Oo9kIx/cM+Gdzci9AchQC6AaZR77QQEbFviTscQK7PN3sKScEk9TIcLUmBIBHai5zpro
         L3Ij0EzOM1c+YuAlmEfik80Zb/Bw42SPyFgOJOT0sVtEVs3KwsavYeGIiqKlUslGsx0K
         DcOPK90Hpu7N577sV7CPVqtq/Rf88ygQZXl0sw64AIXV7l+WpRrtwMKSFhxtmEK579LV
         OrxSdYW7UoVSWJwvxgoC/itB9v0RNffaAoiuSL/CJhB+upJp14sT0+dIXaOk7QYlhtP+
         SBBw==
X-Gm-Message-State: AOJu0YwCdqAOGH2Hbg6eGsBNVRrbRkR/+K+/R/K6ddKh0r4vNEnP0+bA
	Ldb9edxK3gRkgJVrCgV1ZktgZruOv6x04l9gluk5fTF7FtggCZdYIVkNlbkVraQBeIjhQqCSCuR
	YoF6D
X-Gm-Gg: ASbGnctVsfj/yjavWySc1iX2+a4Y7wT0Kf3DpG4D0GACaiFEYdOUpVAUAiGqueiOtjq
	oB1JfVMMnRQo+HnLhLb/61tyadv/1kMfF2Wu50hLfCMbIREiIQ5pKfiHtoKbXqRBDca+40i8Mr9
	ZK96hhO4sg3yj8bLh6IotPmpf/2+5xa5TK12xEIvDusXBIyGFAlYq/UtT8R8WCGgDAjToeA+Sce
	5CJEyQupes7y7d6kwRoI8LiyTkSGDD0oKrsajExpsq1UvgeJqJ2cB3zjx5oqiHhjPTuOAFZ/uPO
	G4Ch3/uy5GAbR0/VAMMbfWQ819EGElZby2COb5tREVZEqflNJHPxmY+k6WlmJ8nP
X-Google-Smtp-Source: AGHT+IFA52K4AdJXGzWD1MDFSVQmuV1Rwtkx7ComF6pvmYsczsQwEKu3LdCMOQHai3+t75zPSgtUkg==
X-Received: by 2002:a17:90b:2703:b0:311:ffe8:20e6 with SMTP id 98e67ed59e1d1-3159d6267afmr9671574a91.3.1750515809028;
        Sat, 21 Jun 2025 07:23:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bf1:320c:7400:5bfc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6efsm6596807a91.16.2025.06.21.07.23.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:23:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 3/7] bind: upgrade 9.20.6 -> 9.20.7
Date: Sat, 21 Jun 2025 07:23:13 -0700
Message-ID: <c955f66ed134bbb8a7cb5d2120ceb591280733e9.1750515680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750515680.git.steve@sakoman.com>
References: <cover.1750515680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 14:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219161

From: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 47128597fbc62164d614aae816edb47a745a5702)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.6.bb => bind_9.20.7.bb}                   | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.6.bb => bind_9.20.7.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 0d670edda6..78ab6b87fc 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 0a45935f9d1207535f83df62ed52f358ed546bbe Mon Sep 17 00:00:00 2001
+From c70f74164bea8a8c54c03becffb2f21103dd1f31 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 10b8caafbb..53e439721f 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From dd484b0bd58832fc241afdc8ea05693228348353 Mon Sep 17 00:00:00 2001
+From 0dd67d85705cbcfa9a2759c46f3cdf3d0d6375de Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 13f9d7f..6516d0d 100644
+index f9cf4a4..0ce3d26 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 49b0a5eea1..38d208fc1c 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 9a06dbf831f012c6019237527d2bf1aa7a3a543a Mon Sep 17 00:00:00 2001
+From 8c9c817933eef20328f10237bbd964580db0a3ad Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 168a77a..13f9d7f 100644
+index 334b551..f9cf4a4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 16ac510cfa..102fe46ffe 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 27d1113a4c378583e0fcff91d70256bdcd78de0b Mon Sep 17 00:00:00 2001
+From 83a892af19bf1455ce7132350332ed6d7f1e2b94 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index baeeafe33e..984d401c70 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 1fa4d0eb9631771bd751f04ce898433580996e5e Mon Sep 17 00:00:00 2001
+From 1393cbf6b0084128fdfc9b5afb3bcc307265d094 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 93aa304126..74f2ef83a0 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 2ea2e4e502e5840d52e76461e071882cc65f1766 Mon Sep 17 00:00:00 2001
+From ce06506bb3fe661e03161af3a603bd228590a254 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.6.bb b/meta/recipes-connectivity/bind/bind_9.20.7.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.6.bb
rename to meta/recipes-connectivity/bind/bind_9.20.7.bb
index 7a03f8598d..b4202f1a59 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.7.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "ed7f54b44f84a7201a2fa7a949f3021ea568529bfad90fca664fd55c05104134"
+SRC_URI[sha256sum] = "43323c8d22d2144282c37b4060ec11e98c24835e225688876fad08ba7b95dca6"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


