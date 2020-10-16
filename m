Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.23165.1602873034855216300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 11:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W3TY3h6f;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id a200so1959409pfa.10
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 11:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=spJtdIn/eejuim8z2NXWdNbhPqW82AUFP0ONj2MDbQw=;
        b=W3TY3h6fKY5zsOpUdhZeBsIuvaEyzIeRBDJw2yP+dFOLPMLDXDn4GJLWAkGqRsTe1h
         eifFnrO3F2KlJ4Tx+gfpcWKiHJvsaA6t4wug7EDA/PmWWoBf6DGD/nWObl1RqxM4lOUM
         Tgj67aYNbvwDkGIRJBPksSbJrUUbPaTxzORyQyHKa631c+cbMf0hotWds85Ev8lhyPci
         J8bK2beDpXJm+ja8UjRD7uBCBSVoz1orJkY2K7AQMTcGWQ5IE2jP22Hqvi4Yo9Xq2Vev
         c4wF2gFFweUtzXYlJp+ZKQCqj+6SFDyarPa571Gaq0BEj5Wc6Ern1j0aE/KujN/j3jod
         p4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=spJtdIn/eejuim8z2NXWdNbhPqW82AUFP0ONj2MDbQw=;
        b=g2Esk9zdGLQtXadr4K16hMjRpKmGMvhc7TLeVgxLtgYMhTKCr3Cf3+VNsVnd0m3gqX
         zzIFF0S+e2Yj880BegDt+96n4pM9p0eKXqmc/NV7N/778uUyYdkU13AHUJTK8QYJg4rf
         3sv0AVyMD05eAG/szBcWQsP0y3+1GPDYbaYNUDsUYQZ1lubY8DRr+LGXEYqbwWpI4rDn
         H6EmQGC8Xu9M+JBbFBDl3I+z+pcgAuKcByY1ANJ05F1Oc/1Cm6B1Bblcs9j178wP08MU
         otVOQiyCRERv1e+9Gy4Cuk4LM+yqLUfvzXjqmVnbZHUx+mcAWYQavSF5s94H0Z8HIW8L
         D0dQ==
X-Gm-Message-State: AOAM533k1A7ao/Q80/J5f3b9KNJIAepk5MjiqJqdychnpoWdzmwR3heA
	66T5AITt9iNXVmTc6Hc1iqlZkqE7vXvT/g==
X-Google-Smtp-Source: ABdhPJzlGFfkK4CAT/e7rwhZLucFlNYbVTnYp8kltP58mDt4Qy35wfKWvDQNVDEO2K0chjxMBWRzZg==
X-Received: by 2002:a63:531d:: with SMTP id h29mr3871818pgb.301.1602873034057;
        Fri, 16 Oct 2020 11:30:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id g1sm3552209pjs.30.2020.10.16.11.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:30:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] mesa: Fix build on 32bit arches supporting 64bit time_t only
Date: Fri, 16 Oct 2020 11:30:23 -0700
Message-Id: <20201016183023.3020816-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016183023.3020816-1-raj.khem@gmail.com>
References: <20201016183023.3020816-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../mesa-20.1.8/src/util/futex.h:47:19: error: use of undeclared identifier 'SYS_futex'; did you mean 'sys_futex'?
   return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
                  ^~~~~~~~~
                  sys_futex

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fine-__NR_futex-if-it-does-not-exist.patch | 31 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
new file mode 100644
index 0000000000..8bedbac669
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
@@ -0,0 +1,31 @@
+From 8973e297f2f9b17498b9dc0e37a19481d4bb7df9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Oct 2020 11:03:47 -0700
+Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
+
+__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
+they only have 64bit variant of time_t. Glibc defines SYS_futex interface based on
+__NR_futex, since this is used in applications, such applications start
+to fail to build for these newer architectures. This patch defines a
+fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
+working
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/futex.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+--- a/src/util/futex.h
++++ b/src/util/futex.h
+@@ -34,6 +34,10 @@
+ #include <sys/syscall.h>
+ #include <sys/time.h>
+ 
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++# define SYS_futex SYS_futex_time64
++#endif
++
+ static inline long sys_futex(void *addr1, int op, int val1, const struct timespec *timeout, void *addr2, int val3)
+ {
+    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index dd4619a06b..9fc62e95e1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,6 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
            file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
 SRC_URI[sha256sum] = "df21351494f7caaec5a3ccc16f14f15512e98d2ecde178bba1d134edc899b961"
-- 
2.28.0

