Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web08.9887.1614349705318832374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dit9Gl26;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177, mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id q9so8169932ilo.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2ZKBX32hblbEicGyFbR7kc5Ut1hADTZqgBqQ3vNHS2I=;
        b=dit9Gl26tp6JhkK/G5TYYYYNorDgMp6VD21zY2s8bA3jabY0IX7QEskYRliHYrHYtY
         lodARv15RjEycCpy+ivvMF12F9BBBcFK7ATy0BzGY5AN/Ts2qRRc/9G8p2y7QrDEJ1VO
         R3+se7pl92jMur6uULtyGU0misGNBZkpcKAQaJud/m7/MSUg03EcgrhsqflB9P8I/7yG
         JbjwLVbDmbrYyLoEU6WOEb8SrfMjqRfiv66qQkRXC6m/Qta7rL09sAiCeLznfPUKSkTO
         acQ8NP7sR4lhTDNuUVeYNSa4UjDBIek4FQpUUktzqblBbo5M2hHPlV/MzVcl+A76kv3M
         WD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ZKBX32hblbEicGyFbR7kc5Ut1hADTZqgBqQ3vNHS2I=;
        b=rKrchoXeVSvZoF3uVg9GCyEJg/0323DroAtZ3UfUnJbk+oRwvzwrvLfWFJVxvqJzOH
         /IUfAoujT/2qu/ntiiXq1gqGi+PvQfUcqUjOJQevfU6DeyC8vrZ/eYEJrNVcj+w2dsvB
         DGE/jy0z+2kJkAAW2+fHYZfaqjmjnAtkAF6V8NbG6Q08zVtg72/3WLiUX18szM2S+TON
         v+9FC7fik8mA4IcKzOCJ/dVCRvOR9mmGEcEmtFu0f9iq235ITGyZjJeCTZ4UR9NTIhXD
         1p5byAWrvJcYGpK54lLohyj/SZkNU6T5o/U/O/+gE1LzNyYq47bO9Akq2rhbe7y6qbwl
         s2XA==
X-Gm-Message-State: AOAM532AewU3hfE4PnJTArrdgL/xW36oXHskpM/HKEDqx2NQ3aoVA3yc
	eX9HZHbk2jLKxwz/Iz3Pu/gJ8tgvNYC7htL9
X-Google-Smtp-Source: ABdhPJyU47kGKHqa89vJSqJk/GJJebTt3LCnB9C25KXRk7IG4vPihvYIPyiibFfbZD0A+eStFc3KLQ==
X-Received: by 2002:a05:6e02:1bad:: with SMTP id n13mr2512420ili.260.1614349703651;
        Fri, 26 Feb 2021 06:28:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.28.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:28:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 40/40] qemu: Backport patch to avoid assertion fails on icache line size
Date: Fri, 26 Feb 2021 04:24:23 -1000
Message-Id: <5ffe0299e0a9acdebb6bd9a542aa5ad5c843ec69.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Due to a bug in glibc 2.33, the value of the icache line size is now
reported as unsupported option. This breaks qemu at runtime with:

cacheinfo.c:182: init_cache_info: Assertion `(isize & (isize - 1)) == 0'
failed.
Aborted (core dumped)

We haven't caught this one yet because we were already on qemu 5.2.0
when we started to play with glibc 2.33 so it was only reproducible on
dunfell.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...fix-crash-when-compiling-with-uClibc.patch | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7a963ad57c..a1a418374f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,6 +28,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-Fix-webkitgtk-builds.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch \
+           file://0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch \
            file://CVE-2019-15890.patch \
            file://CVE-2020-1711.patch \
            file://CVE-2020-7039-1.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
new file mode 100644
index 0000000000..741a4fce0e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
@@ -0,0 +1,48 @@
+From 00b5032eaddb7193f03f0a28b10286244d2e2a7b Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@redhat.com>
+Date: Thu, 17 Oct 2019 09:37:13 -0300
+Subject: [PATCH 1/1] util/cacheinfo: fix crash when compiling with uClibc
+
+uClibc defines _SC_LEVEL1_ICACHE_LINESIZE and _SC_LEVEL1_DCACHE_LINESIZE
+but the corresponding sysconf calls returns -1, which is a valid result,
+meaning that the limit is indeterminate.
+
+Handle this situation using the fallback values instead of crashing due
+to an assertion failure.
+
+Signed-off-by: Carlos Santos <casantos@redhat.com>
+Message-Id: <20191017123713.30192-1-casantos@redhat.com>
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+
+Upstream-status: Backport
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+---
+ util/cacheinfo.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/util/cacheinfo.c b/util/cacheinfo.c
+index ea6f3e99bf..d94dc6adc8 100644
+--- a/util/cacheinfo.c
++++ b/util/cacheinfo.c
+@@ -93,10 +93,16 @@ static void sys_cache_info(int *isize, int *dsize)
+ static void sys_cache_info(int *isize, int *dsize)
+ {
+ # ifdef _SC_LEVEL1_ICACHE_LINESIZE
+-    *isize = sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
++    int tmp_isize = (int) sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
++    if (tmp_isize > 0) {
++        *isize = tmp_isize;
++    }
+ # endif
+ # ifdef _SC_LEVEL1_DCACHE_LINESIZE
+-    *dsize = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
++    int tmp_dsize = (int) sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
++    if (tmp_dsize > 0) {
++        *dsize = tmp_dsize;
++    }
+ # endif
+ }
+ #endif /* sys_cache_info */
+-- 
+2.30.1
+
-- 
2.25.1

