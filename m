Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9B7C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:46:24 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.80717.1674755177724379597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 09:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qFQPX/Xt;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id j5so2226522pjn.5
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 09:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ogZHK0XinLP/lfMy1TzKiZr91/0cCXbSVXeqLti0kkw=;
        b=qFQPX/Xt//OT3aDvJK2MCS772VQYsipui9WpEbhn0XWsG4sU6S/dwxlZ+W4xRmM7Iv
         RmLBYDIqr90CfbRiL405FmD+U36BdQsAgk+32IpjHjZXnw2QLWpGFaNs+iubB6V/dQJS
         gNoiWsmt6SIRhxM1Xi+W3Sk1twTTIQlqyJpFPhpWhH3LSeW4cAzsitSp6D8rys7oVcba
         WZhZ6k1n15RCD6YvdACTsW5BIxSJQuafikvP0aL+bDQtsrYR5Nt+iODbWK1vnkQfLKVR
         WENLLcIBrGKCv54e5avRl1TmLGU/nj+XxpleqCcIm2nu8CXapKO9mAe09CI4QsDBYSEM
         +YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogZHK0XinLP/lfMy1TzKiZr91/0cCXbSVXeqLti0kkw=;
        b=boMCYkLFD4cPlLn4XBkjgipVVJAzT+P53G4n5gm5lSkaVJYt8goUelebKnnxYjOi3j
         6KEfWvgjdSlmYS/HUfvXGka+lhw463LdySVfauvcBpHQVjHmV/ZRDnD+in8JtB0uhEx3
         jc4HCAHp2QQJD+pZKd+ICaOmR8dnDcMByAwmM6f+TepA5MFCa7AblMKmB5j0cE01E/9D
         bWMt1WFxxRvE8iG6hb17P6LGs3pX15X1CS0DQqrqYxy+EQ+aSIoqt19CQkb67rNGpNV0
         CC6ZVcVWpL1b7ji0lrgb/ivEQ9DfH7Ui3mcHyDBml7nWrnKd6XXalI5wj5fRdWjitHeQ
         m3zQ==
X-Gm-Message-State: AO0yUKXl4uFTiZrzSt/P622/XZkrziAHEFNEGkIZ0BuHrLpv7lLSV24E
	V+nMEFMPxXJglzczo+9HgrB8g5bsUn0f8Q==
X-Google-Smtp-Source: AK7set84iv5zL92A/AwqciAa//k3JQ3TyE71hDonEL+tWih9lDigW8GPlCTu5eXimcDJNKFjxhZjlg==
X-Received: by 2002:a17:902:d2c2:b0:196:3596:4a29 with SMTP id n2-20020a170902d2c200b0019635964a29mr6352383plc.21.1674755176595;
        Thu, 26 Jan 2023 09:46:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ja15-20020a170902efcf00b001929dff50a9sm1273299plb.87.2023.01.26.09.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:46:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] valgrind: Include missing <cstdint>
Date: Thu, 26 Jan 2023 09:46:13 -0800
Message-Id: <20230126174614.2427414-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 17:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176415

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-drd-tests-Include-missing-cstdint.patch | 34 +++++++++++++++++++
 .../valgrind/valgrind_3.20.0.bb               |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-Include-missing-cstdint.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-Include-missing-cstdint.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-Include-missing-cstdint.patch
new file mode 100644
index 0000000000..fbee24a538
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-Include-missing-cstdint.patch
@@ -0,0 +1,34 @@
+From 687d9fb9e3de832379680e9d5268331011c92afa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 08:53:26 -0800
+Subject: [PATCH] drd/tests: Include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer
+transitively included [1]. Explicitly include it for uint{32,64}_t.
+
+Fixes
+tsan_thread_wrappers_pthread.h:91:9: error: 'int64_t' does not name a type
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=464859]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ drd/tests/tsan_thread_wrappers_pthread.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drd/tests/tsan_thread_wrappers_pthread.h b/drd/tests/tsan_thread_wrappers_pthread.h
+index f15e6ad..4cc8062 100644
+--- a/drd/tests/tsan_thread_wrappers_pthread.h
++++ b/drd/tests/tsan_thread_wrappers_pthread.h
+@@ -55,6 +55,7 @@
+ #define NO_TLS
+ #endif
+ 
++#include <cstdint>
+ #include <string>
+ using namespace std;
+ 
+-- 
+2.39.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
index 1e1f0ccdd3..701dbf3833 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
+           file://0001-drd-tests-Include-missing-cstdint.patch \
            "
 SRC_URI[sha256sum] = "8536c031dbe078d342f121fa881a9ecd205cb5a78e639005ad570011bdb9f3c6"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.39.1


