Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.4962.1614438967581110447
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Feb 2021 07:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C6FVBZ/6;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id j12so8231264pfj.12
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 07:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0c5PEAwZmV3HCt1y+sFedArM1ZP3SHBXlnymVZWE7GM=;
        b=C6FVBZ/69V7SqpZPpXCk25Kn55LTkRxU41/qUHBkhYM0BRH64WKeu/5H+0C4aopDa3
         SWrUimrFHZ0bElXV3XCJ4bU5+BSklEnbnmh7s1KOM7CbChWDi9w+5O7uaimusned1Qhg
         pMgNvXbdXaOxw9fCV125eAKzBi1ezKkF+W+ervSHv5rWMDUR1S78DE9uBVSCS7wjqDIE
         oVCeA1EGr9HnW6yIboGEG5lbUtbyKHA1wjUj18MMxhaDeA5DFoEEQ/EBF7RjiXIs+dDB
         D0StFPzxbRcw1hXkNpfbnHEj6qSW8tqFWvRY3YlBouPnknEgYXuwP8LO2oTUnMl8R3Pu
         r3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0c5PEAwZmV3HCt1y+sFedArM1ZP3SHBXlnymVZWE7GM=;
        b=ccFPdMIOBv7YhZ/bapnk5gN55j/ylsk/aWiN7jHERM6ZFwIxCDejAaLppBm7lzhom+
         ohIsZrg1Dj9W6hcIOH0dAljQmraRV2ruxMeL7alURpSXLv9e/5L4ZxR4g28Zd/qUvOkF
         Ed52sVqtTd1u5hW6GtS15qSFD7Mjfm78bXtLvCk0bKf1THtK4brD8n46zPmSD/NJ5PfB
         9wulLKGjv/86IVPnHlbgpC1T1LcvvleHP4O4dy1n05nqWUX/uu2EMmOIwnwQO7DWqdXw
         sXBpGmjb6AIS2fHNwrcIG5GC/sjAP05rx4QOhfJYmlx8egP+MRn4wQdyRLvxfpQICisK
         FLkA==
X-Gm-Message-State: AOAM5330QyIqoxCp2HYK45AK77aMdsqgYWefEs8nhkuyYHE7Se0n00Pf
	lY0cAJsR1AgQd4h8RYL25nYrBgQ0MEaDkg==
X-Google-Smtp-Source: ABdhPJyysVjmelzx4BxRvFJSAo48GzJqb+n6Aw/nscXGYRvlvf1UWZ1AkWBtjt+CcbpJctpGBd/46g==
X-Received: by 2002:a63:304:: with SMTP id 4mr5545662pgd.280.1614438966382;
        Sat, 27 Feb 2021 07:16:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id c18sm11114941pgm.88.2021.02.27.07.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 07:16:05 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] kea: Fix configure test error with gcc11
Date: Sat, 27 Feb 2021 07:16:03 -0800
Message-Id: <20210227151603.157153-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the test program fails to compile, configure thinks compiler is
not having thread support and bails out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update limits.h patch to fix .c files instead

 ...01-ax_cpp11.m4-Include-memory-header.patch | 24 +++++++++++++
 .../kea/files/0001-include-limits.h.patch     | 35 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_1.8.2.bb    |  2 ++
 3 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0001-include-limits.h.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch b/meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch
new file mode 100644
index 0000000000..4978cae87c
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-ax_cpp11.m4-Include-memory-header.patch
@@ -0,0 +1,24 @@
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
+--- a/m4macros/ax_cpp11.m4
++++ b/m4macros/ax_cpp11.m4
+@@ -182,6 +182,7 @@ for retry in "none" "--std=c++11" "--std
+ 	AC_COMPILE_IFELSE(
+ 		[AC_LANG_PROGRAM(
+ 			[#include <thread>
++			 #include <memory>
+ 			 std::shared_ptr<std::thread> th;],
+ 			[th.reset(new std::thread([[]]() { return; }));
+ 			 th->join();])],
diff --git a/meta/recipes-connectivity/kea/files/0001-include-limits.h.patch b/meta/recipes-connectivity/kea/files/0001-include-limits.h.patch
new file mode 100644
index 0000000000..3856b3d523
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-include-limits.h.patch
@@ -0,0 +1,35 @@
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
+--- a/src/lib/database/backend_selector.cc
++++ b/src/lib/database/backend_selector.cc
+@@ -6,7 +6,7 @@
+ 
+ #include <database/backend_selector.h>
+ #include <exceptions/exceptions.h>
+-#include <climits>
++#include <limits>
+ #include <sstream>
+ 
+ using namespace isc::data;
+--- a/src/lib/dhcpsrv/subnet_id.h
++++ b/src/lib/dhcpsrv/subnet_id.h
+@@ -10,6 +10,7 @@
+ #include <exceptions/exceptions.h>
+ #include <stdint.h>
+ #include <typeinfo>
++#include <limits>
+ 
+ namespace isc {
+ namespace dhcp {
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

