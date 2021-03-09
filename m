Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.14791.1615319401262781956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 11:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eHKLsRpY;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id dx17so31122302ejb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 11:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z76E/EHF8Q1dMhTO6J0r/4j0T6uIzwv22E15Ex5cCvI=;
        b=eHKLsRpYy4xKhNDKOt/gSCHl5k9oA3fpco/vSLQ3MVWAFLrC7dMCLLIjfBgKq50uqu
         +7erQQC+07WaOErIl43n4By0b9G/GcxsoUi++HUnkirgynWAUKvAOu19JnTehlyklZ1n
         WXI4egQa7HMz6QivETlVB6tWDo44zo3ZE3NTHGXCdXdyZdzV9sCLNCaXtf5VaDi8D0vQ
         +TeDJzSAryWQTsA0QUK/N6b5gd7ashxPGPqy1PHMPCPe2QRzH0FelmJy4hHEQx60hYGt
         b0yMc5YKCxL2LzMmBWe+6qU3u9cjf8Pa+ndvRWTVzh/5wEHNkhK3sjJY6MIP5qrKD7Jh
         C6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z76E/EHF8Q1dMhTO6J0r/4j0T6uIzwv22E15Ex5cCvI=;
        b=ZHUJ11RThDxOtHhdC230WAs+bQST0l/P35srpVrq3wBE1ALpizs8Ngnsqfgo9KsNXt
         RnZLRAFgBzC9eqYziGwSCSDrjFf+RNXf96inbga8S6wWf7GkN2mvXPKSa7vLnz0qqUc7
         WqAAJxnvjdfoVcLxcncv8RLibw5qeCjjCsP0ei7oGbEtEopYfqxQHkyzENmM/by6b6ab
         1x8oAbB0clsVQBz6y8kyIaewbdR5esLBrsjZohRoCGJDgAvx7REHpnojEfCgjN4jJO8l
         vPf9BtanvcoHabpYSruNDoERG28smi9RypSbl24/PNoMFBpN6TJXi+NTx/yXDNccIgl3
         6FEw==
X-Gm-Message-State: AOAM5309XCxjkSqEBpzowbeiQuilPNkgIdXJoRHQr38U7Ai5QBxaeekc
	5v6ba49TLuscVdcCe2iqAk2+cwk7mZwzzQ==
X-Google-Smtp-Source: ABdhPJyDrL2o0ZisE2a9GH3IzzVwrLP0C5KslUONjschcPxNgmReZJxYlMyMh8pBQYMRQc3wTmMBag==
X-Received: by 2002:a17:906:acb:: with SMTP id z11mr22395866ejf.193.1615319394528;
        Tue, 09 Mar 2021 11:49:54 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id la15sm8732863ejb.46.2021.03.09.11.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 11:49:54 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] libdnf: replace a musl fix with a better one
Date: Tue,  9 Mar 2021 20:49:30 +0100
Message-Id: <20210309194930.215614-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...avoid-the-use-of-non-portable-__WORD.patch | 31 +++++++++++++++++++
 ...h-include-the-correct-header-on-musl.patch | 31 -------------------
 meta/recipes-devtools/libdnf/libdnf_0.58.0.bb |  2 +-
 3 files changed, 32 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch
new file mode 100644
index 0000000000..f8d256e011
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch
@@ -0,0 +1,31 @@
+From 8aa5402393fabaf4fff51be3af4868e8dfab6da7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 9 Mar 2021 19:30:42 +0000
+Subject: [PATCH] libdnf/config.h: avoid the use of non-portable __WORDSIZE
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1159]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libdnf/config.h | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/libdnf/config.h b/libdnf/config.h
+index 16121f6f..2925923e 100644
+--- a/libdnf/config.h
++++ b/libdnf/config.h
+@@ -18,12 +18,10 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
+-#include <bits/wordsize.h>
++#include <limits.h>
+ 
+-#if __WORDSIZE == 32
+-#include "config-32.h"
+-#elif __WORDSIZE == 64
++#if (ULONG_MAX == 0xffffffffffffffff)
+ #include "config-64.h"
+ #else
+-#error "Unknown word size"
++#include "config-32.h"
+ #endif
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch
deleted file mode 100644
index 734521bb3f..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8cc7ada0161a7af38351d1e70516975402f3c5c5 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 26 Feb 2021 18:37:41 +0000
-Subject: [PATCH] libdnf/config.h: include the correct header on musl
-
-Problem reported at https://github.com/rpm-software-management/libdnf/issues/1146,
-but this patch isn't quite the fix.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- libdnf/config.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libdnf/config.h b/libdnf/config.h
-index 16121f6f..51623ce4 100644
---- a/libdnf/config.h
-+++ b/libdnf/config.h
-@@ -18,7 +18,12 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-+#include <features.h>
-+#ifdef __GLIBC__
- #include <bits/wordsize.h>
-+#else
-+#include <bits/reg.h>
-+#endif
- 
- #if __WORDSIZE == 32
- #include "config-32.h"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
index eea410af4c..dbe68d5a15 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-Add-WITH_TESTS-option.patch \
            file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
            file://enable_test_data_dir_set.patch \
-           file://0001-libdnf-config.h-include-the-correct-header-on-musl.patch \
+           file://0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch \
            "
 
 SRCREV = "85278894f21bc1957dc47a2a09ddacf59bc3cda8"
-- 
2.29.2

