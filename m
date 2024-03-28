Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A50C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 15:43:49 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.20076.1711640624628577481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 08:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kf/1+1Pz;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3688effa61bso3980175ab.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711640624; x=1712245424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=svmwjn/CIihjtQ2DXzXC1MPbbEwVtWXQOhZlaFyW9ks=;
        b=kf/1+1Pz0UohJlwjemcYfVXO15Ah9OnwMHFIaDBk/TcrjFg2rZVz/lbvAWA38ALwXw
         cFaxbsvQaMtnAkszOAT0rgaYmQWwWT1IFblqWf5zP0LM3Spqg+PrI3mZ6PBwffp7OT2q
         MYGsVjO7Me3KyndrIPIKZnCX/BxzVRWFLuSyCI1w30hIRglyBa1PYr/liI5kqyJwRrW2
         i86Y+sjPQ464nQ4tLfLSgMcEaR0m3vfBGaNMIg+2XfJWaEB5VH6Za5ms5yzZha7XlEQL
         RUwFXOKgdlyKNi4lp5MHmyytktfxQ2eWisAtBvi04DJvlwzQWv9rLgvCjioz0Af4V4Xl
         4TdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711640624; x=1712245424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svmwjn/CIihjtQ2DXzXC1MPbbEwVtWXQOhZlaFyW9ks=;
        b=WJwzCH5fB/jUdBrU4/aPws/ivQdhBIW6O1g5rPqgqeh1yyhf1iNS+6x4TLpgTqUQ6t
         me/59L+VAC53a8EAsOw1IB/9bfG4Z5jGuq4qDRA48F7c1nheMO7XJOVN4GWQE6r86tEq
         S4eXQQsGJG3mhkSS+zEcJertGWTSXEsyTHW5NoCs643mdTYdAwKrx9VgzzqzYA49HMx6
         Tb0QyxjRXNX91WwlP4nTP6PkzojtlwYt/zM5tePFW4LtV2G0PTDaY8oPsvFCeVo+N7Ve
         pcm6ircpsff3FUXt5PxWbSulekHybzaItjGxnKirXPZjsToiqhNb46m9/zwrkDOG2HuL
         QOZg==
X-Gm-Message-State: AOJu0YyRNrccWW8YXi74Cxz6y26+6I0yH3kP2Ljpf7hF5EMkU0+DpK7z
	OAHDEY7DhT4X74GJrlHtSerEc6ckCsoryP8dlrCNkjyKdA/dBXYyoS7/B0kcKoU=
X-Google-Smtp-Source: AGHT+IECFJyukQrsGtjxb5h9LRDUXWf9kbENkmZ/BrUEYy7mtHolVQUIEE1aCG1FJ/vGd7+dsbDNfg==
X-Received: by 2002:a92:d8d1:0:b0:365:bee:2563 with SMTP id l17-20020a92d8d1000000b003650bee2563mr2565449ilo.32.1711640623661;
        Thu, 28 Mar 2024 08:43:43 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id a35-20020a029426000000b0047ecfb30fe9sm242595jai.116.2024.03.28.08.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 08:43:43 -0700 (PDT)
From: Daniel McGregor <danismostlikely@gmail.com>
X-Google-Original-From: Daniel McGregor <daniel.mcgregor@vecima.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH] gcc: Allow using libc++
Date: Thu, 28 Mar 2024 09:43:40 -0600
Message-ID: <20240328154340.503623-1-daniel.mcgregor@vecima.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 15:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197582

With the addition of the C++ runtime setting added recently, allow
gcc to use libc++ as its runtime. There's some minor fixes still
required, such as allowing setting the unwinder library. But this
allows for testing libc++ with gcc.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/gcc/gcc-13.2.inc           | 6 ------
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
 meta/recipes-devtools/gcc/gcc-cross.inc          | 1 +
 meta/recipes-devtools/gcc/gcc-target.inc         | 1 +
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtools/gcc/gcc-13.2.inc
index 603377a49a2..a19ceadeaae 100644
--- a/meta/recipes-devtools/gcc/gcc-13.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
@@ -109,11 +109,5 @@ EXTRA_OECONF_INITIAL = "\
     --disable-libssp \
 "
 
-EXTRA_OECONF_PATHS = "\
-    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
-    --with-sysroot=/not/exist \
-    --with-build-sysroot=${STAGING_DIR_TARGET} \
-"
-
 CVE_STATUS[CVE-2021-37322] = "cpe-incorrect: Is a binutils 2.26 issue, not gcc"
 CVE_STATUS[CVE-2023-4039] = "fixed-version: Fixed via CVE-2023-4039.patch included here. Set the status explictly to deal with all recipes that share the gcc-source"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index ec87b462193..7c4233c2115 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -12,6 +12,7 @@ require gcc-configure-common.inc
 EXTRA_OECONF += "--with-plugin-ld=ld"
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=/not/exist${target_includedir}/c++/${BINV} \
+    --with-gxx-libcxx-include-dir=/not/exist${target_includedir}/c++/v1 \
     --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
     --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index a540fb2434a..5b0ca15d476 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -37,6 +37,7 @@ EXTRA_OECONF:remove:libc-newlib = "--enable-threads=posix"
 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=/not/exist${target_includedir}/c++/${BINV} \
+    --with-gxx-libcxx-include-dir=/not/exist${target_includedir}/c++/v1 \
     --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 7dac3ef422c..82da5ef82be 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -2,6 +2,7 @@ GCCMULTILIB = "--enable-multilib"
 require gcc-configure-common.inc
 
 EXTRA_OECONF_PATHS = "\
+    --with-gxx-libcxx-include-dir=${target_includedir}/c++/v1 \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
-- 
2.41.0


