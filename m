Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.1528.1614411698470177138
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 23:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b91Yls8W;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id b15so7343917pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1DOhXUv+I7fmO5K7WBnLELXRN6tLlcdiTMb0fZCfqg=;
        b=b91Yls8Wu1Xv4uHYpz1vRhw+yigV2DqXSXH19NRKkonSgdo4EUqM+HVGQjbH4hJstd
         QIt+2/a0Kvtx0KvKDzCYRhRJqLXIzqDnFsk26H8mDQbg0LvSSuPl3RKFwAXvNvUPDA7k
         5368A262R4GwmI9+u1vLRSRE3GAkFio0Vxh+ZiycOLyZrQ7lxKpCjwJtcrqogPdZSqdf
         WJ20M0clkJHBy5fE9SD3VirxjM+1nu+MZ4bBr0iOfJrfFz4QPC53TwJWdR5ONKJnQtCS
         tgDbG6hOQ7vW9wCXHAxPooQDu0fMoWiuCbiT1cSWdQSLtdLVAVMnKkkPC4gNrRh/Y3uS
         1fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1DOhXUv+I7fmO5K7WBnLELXRN6tLlcdiTMb0fZCfqg=;
        b=Rer+swK6c0pYP/U9qL3UEmd9z5TXf7FPFD0NonZESqa8kpxh+1m/TkHljNDGRo9gIQ
         jYbXzgt9aqPuQufKqqihjafisgCDrG+UpEItFXGb5gnTuDuuMxM6gMzm8GRvpcYi44XC
         i2WcmrBErM655L6fFwB6jv6RA5sCwdwqRHJqi4+LWs7GcbVuCauwc5udWdmqhwLEf4td
         floHBD1tG58dxd6U9PEPrA+s4JofxYOvw8jQt6rJwpKZJ3WF+Z8VUsT8HStUoa54zLYA
         dO8HiwC2ZRtuz0VvsCnBZ9iBLVh3fRGy/trdxptWgVa4pW48gGO3x35y/iKQPFJLDDnN
         FtqQ==
X-Gm-Message-State: AOAM5308lhHPlaD+aaxt18wwGyGXGCvLlQFblaxw8clbtRqIaF9m4VAp
	qMfn15qRDEB0O3skwhSGi8Ia6Yxj0Rd+mw==
X-Google-Smtp-Source: ABdhPJx3maxMuBm5UpFpFc3Dva3BlCJOf3b4kQHHGUa97psx9PDfhjeamuMKmGZGaQz8j7EdP8RbfQ==
X-Received: by 2002:a17:902:ea12:b029:e3:1b24:414f with SMTP id s18-20020a170902ea12b02900e31b24414fmr6474188plg.13.1614411697630;
        Fri, 26 Feb 2021 23:41:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id z137sm12462003pfc.172.2021.02.26.23.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 23:41:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] kea: Fix configure test error with gcc11
Date: Fri, 26 Feb 2021 23:41:32 -0800
Message-Id: <20210227074132.4029374-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227074132.4029374-1-raj.khem@gmail.com>
References: <20210227074132.4029374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the test program fails to compile, configure thinks compiler is
not having thread support and bails out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-ax_cpp11.m4-Include-memory-header.patch | 29 +++++++++++++++++++
 .../kea/files/0001-include-limits.h.patch     | 29 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_1.8.2.bb    |  2 ++
 3 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0001-include-limits.h.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch b/meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch
new file mode 100644
index 0000000000..f7f98c4d6e
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch
@@ -0,0 +1,29 @@
+From 5314a4815006e3a42f3ce265d1597db700cdb784 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Feb 2021 23:14:20 -0800
+Subject: [PATCH] ax_cpp11.m4: Include <memory> header
+
+This is needed for std::shared_ptr
+GCC-11 throws errors if header is not included
+
+Upstream-Status: Submitted [https://github.com/isc-projects/kea/pull/120]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4macros/ax_cpp11.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4macros/ax_cpp11.m4 b/m4macros/ax_cpp11.m4
+index 6176728..6b14a84 100644
+--- a/m4macros/ax_cpp11.m4
++++ b/m4macros/ax_cpp11.m4
+@@ -182,6 +182,7 @@ for retry in "none" "--std=c++11" "--std=c++0x" "--std=c++1x" "fail"; do
+ 	AC_COMPILE_IFELSE(
+ 		[AC_LANG_PROGRAM(
+ 			[#include <thread>
++			 #include <memory>
+ 			 std::shared_ptr<std::thread> th;],
+ 			[th.reset(new std::thread([[]]() { return; }));
+ 			 th->join();])],
+-- 
+2.30.1
+
diff --git a/meta/recipes-connectivity/kea/files/0001-include-limits.h.patch b/meta/recipes-connectivity/kea/files/0001-include-limits.h.patch
new file mode 100644
index 0000000000..4bb76e2344
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-include-limits.h.patch
@@ -0,0 +1,29 @@
+From 7bca122e15bbe98c7b8da851ef3e1cf9a714afd9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Feb 2021 23:31:15 -0800
+Subject: [PATCH] include limits.h
+
+Fixes build with gcc11
+backend_selector.cc:61:35: error: 'numeric_limits' is not a member of 'std'
+
+Upstream-Status: Submitted [https://github.com/isc-projects/kea/pull/120]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/exceptions/exceptions.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib/exceptions/exceptions.h b/src/lib/exceptions/exceptions.h
+index f5368c8..494ec69 100644
+--- a/src/lib/exceptions/exceptions.h
++++ b/src/lib/exceptions/exceptions.h
+@@ -7,6 +7,7 @@
+ #ifndef EXCEPTIONS_H
+ #define EXCEPTIONS_H 1
+ 
++#include <limits>
+ #include <stdexcept>
+ #include <string>
+ #include <sstream>
+-- 
+2.30.1
+
diff --git a/meta/recipes-connectivity/kea/kea_1.8.2.bb b/meta/recipes-connectivity/kea/kea_1.8.2.bb
index 3dc4f6af70..fe10d90620 100644
--- a/meta/recipes-connectivity/kea/kea_1.8.2.bb
+++ b/meta/recipes-connectivity/kea/kea_1.8.2.bb
@@ -18,6 +18,8 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
+           file://0001-ax_cpp11.m4-Include-memory-header.patch \
+           file://0001-include-limits.h.patch \
            "
 SRC_URI[sha256sum] = "486ca7abedb9d6fdf8e4344ad8688d1171f2ef0f5506d118988aadeae80a1d39"
 
-- 
2.30.1

