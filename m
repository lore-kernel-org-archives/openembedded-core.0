Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42C0CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5174.1791319470866853279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mJ2D1H2U;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so9307275e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319469; x=1791924269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VYJCR6v7F75rR+8z7Yk+cS4NiHV4vcZcWVMQP1Z64fE=;
        b=mJ2D1H2UhhOPh+ZIYVMSW29UzPAXC2+1YmIjr9qgCzJ2JLqjxJNFRRWYD/95Zv6uQU
         NnK5vEr9rveW6pS9E5sQ3e/8m6W7DxbiHk8+gd9lPhHKMJfHJ8lTnIso2bv077D9Isyw
         dMwYs1DlvPwlRF6yJOjh0KcD+XkJbjylM2zg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319469; x=1791924269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VYJCR6v7F75rR+8z7Yk+cS4NiHV4vcZcWVMQP1Z64fE=;
        b=OHXi5ndyuZ8kJtRmVKytkL/ALJicVdlsrUeh3gBaUoZUzf9p8LsvZSc9AiRBjfyhac
         YM8Obugt2bOrO+dRCDepIhFYkM+sj9p8NMUyja979ggA/FTYZBlHPKO+AtQR8ceLr10K
         rukIZgX/Faw9S8N4IDZHtNOicNzaSrD8FVKRhpYocyqcyQ3GRgOC4atMQETOpnrUwwNg
         ugVzaChHqbOLSVLgGWQvskPIY8SFkYQyjwGDkVD7dj5oGS6h/jYMkIR+MZWrVXUljYVm
         NR6XldFVf0mVhnUkon05GL2xKarGa36IqzC3q7hXKWwuCNZcsQCGEYS2EjBH4g+bCUbp
         YDdg==
X-Gm-Message-State: AFuF++kQXG20iqVol3J0OwkZs3/gXRRGhGbNANEXXYavPL1zCF+9m1IZ
	iMh3cZyFmQM76KvCre1u7XJfoT+ZW9KwZe3xsM//r3bv8tbKcF2rTNrAX8l1OX8tkCCWI62wt8J
	jkPIqiJs=
X-Gm-Gg: AYBFou1v064R5ZkMAXFfw8jkFVE20zTgs5Ud7v0XQFSR0g2JaMfxqf6JLp/v5BfZN1a
	R3lBiCCqK+4IODPVP5MY2R1/ncwG5hGzxrJOkZ3AqqzB4JJyBuQG6e0e2xjLv30wN85GIsbNFP7
	B++OPHLdNwVz3FfPu9SIZKnh9T7rC5um4SKgunkxRA1vapl6OKe3tXj9n7BToykhuVWWWdG+laX
	BC1ln+1F6okwH1oa7zr8GncYYN1s4D5fL1TrikcDJQz9+4N+bfcxvQFyf+bOlU9tWhDIHmN1eqW
	dy2Rn6ROj+S4cBaJn4C+dRZ1IegCVAgadYNOtfvi0ghdCF6kUqDAh/satO3uEBtvEbker44/wC0
	iHqzG852jvIb7+cGADe/hQ1zBlY8hHxSstVVUvDlYf5532WaA06N++OPZ8qne+8EfOgiybl8swc
	ICSsr+JP1yCQheqJdj668s0qIcR1q8ohRWRo6M9VvL3psUvC1AsJBjYl8QLyCY5lHhf3CFj2xUI
	gfdt12IxHa+228m604sTSWPHGpLxd9KGcVvY6L1vNJb0eNRgXRh2O/pCNtZdrEfNFe1CairzEf4
	pg==
X-Received: by 2002:a05:600c:524c:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-4a1802f632bmr646325e9.14.1791319469057;
        Tue, 06 Oct 2026 13:44:29 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 09/18] opkg: take the default architecture from the target CPU
Date: Tue,  6 Oct 2026 22:43:44 +0200
Message-ID: <29e59577dc697f550296881ba6ed4c48ecc0ba4c.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247344

From: Sunil Dora <sunilkumar.dora@windriver.com>

opkg sets HOST_CPU_STR from the build machine's CPU, so libopkg built
for aarch64 contains "x86_64" on an x86_64 worker and "aarch64" on an
aarch64 worker. Carry the upstream fix, which uses
CMAKE_SYSTEM_PROCESSOR (HOST_ARCH via cmake.bbclass).

[YOCTO #15784]
[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 97592b875b64db8490b5265a08577bf73a0e9c45)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...the-default-architecture-from-the-ta.patch | 45 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.10.0.bb     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
new file mode 100644
index 00000000000..ee7d35e34c4
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
@@ -0,0 +1,45 @@
+From fd8b3359e9e26a6a81f5f7cb04346c7bf44de279 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Tue, 29 Sep 2026 23:55:32 -0700
+Subject: [PATCH] CMakeLists: take the default architecture from the target CPU
+
+HOST_CPU_STR is the default architecture opkg accepts when no "arch"
+lines are configured. It is set from CMAKE_HOST_SYSTEM_PROCESSOR, which
+is the CPU of the build machine, so a cross-compiled opkg gets the wrong
+default and libopkg differs depending on the machine it was built on.
+
+Use CMAKE_SYSTEM_PROCESSOR, which CMake sets for native builds and the
+toolchain file sets when cross-compiling, and stop with an error if a
+cross build doesn't set it.
+
+Fixes Bugzilla: #15784
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/218]
+
+Suggested-by: Alex Stewart <alex.stewart@emerson.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ CMakeLists.txt | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e6deba8..7da091d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -45,8 +45,11 @@ option(WITH_GPGME "Enable signature checking with gpgme" ON)
+ set(DATADIR "/share" CACHE STRING "datadir")
+ set(SYSCONFDIR "/etc" CACHE STRING "sysconfdir")
+ set(VARDIR "/var" CACHE STRING "vardir")
+-# This was ported from autoconf (it used to be "host_cpu"), but it should be target_cpu: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15784
+-set(HOST_CPU_STR ${CMAKE_HOST_SYSTEM_PROCESSOR} CACHE STRING "Host CPU architecture")
++# Default architecture: the CPU opkg runs on, not the build machine
++if(CMAKE_CROSSCOMPILING AND NOT CMAKE_SYSTEM_PROCESSOR)
++    message(FATAL_ERROR "Cross-compiling requires CMAKE_SYSTEM_PROCESSOR")
++endif()
++set(HOST_CPU_STR "${CMAKE_SYSTEM_PROCESSOR}" CACHE STRING "Default package architecture")
+ 
+ configure_file(config.h.in config.h)
+ configure_file(libopkg.pc.in libopkg.pc @ONLY)
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.10.0.bb b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
index 0631868a30c..8563c85780c 100644
--- a/meta/recipes-devtools/opkg/opkg_0.10.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0002-config.h.in-add-missing-WITH_SHA256-define.patch \
+           file://0003-CMakeLists-take-the-default-architecture-from-the-ta.patch \
            file://run-ptest \
            "
 

