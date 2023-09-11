Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08119EE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 07:30:18 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.53280.1694417412208411338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 00:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jpFbRjXX;
 spf=pass (domain: mvista.com, ip: 209.85.210.47, mailfrom: sdoshi@mvista.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6b9a2416b1cso3006586a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 00:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1694417411; x=1695022211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7JkJ35vYJ5QT2/Njcjg7qT3P53aYaLv5LytchP/53M=;
        b=jpFbRjXXF0G+j5kaPQRPuQOmYmxcRkGJePKIyN2GiGAeWymIGpIGD2FjYpuP2dDH3L
         RupCaGxuWsiAv2vF6l0jSp1PMq4zpZYUTgnrjw2xLiXLlAPKuFSJspE4Gpd0Z1z5OJGy
         DyKlpKgBVAKRvY2x0MMBVt23oyuyxEeiEo5EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694417411; x=1695022211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7JkJ35vYJ5QT2/Njcjg7qT3P53aYaLv5LytchP/53M=;
        b=EaVCF+dt390LLMmD/Sw7TSvJ5kj/+mP6mMwUC8VS3vVh/oKoLRvZzcWGYe9HEGa9fW
         jqUT6FxfHwk+1WeVD+++7ZCdLrV/SIiY4YVl48l6dia2la4z2g2ztMQ5o2wpRt06mNZh
         8rQ7r9KPmVI8YBeSWoWwkHwK6NVzy6jciTmqB/N1z0JzUMWCzh1K98YvLhIqahuLLddU
         9aWcQRWR40rx68McQxy7H8U9nUoURyFHA/fNyrUuk4yEw+S+jjHevZ1t7AUEceLvVm9n
         RHou9+ZNClVHINtAWRtUDWppHx5QdXAYGpJYOWIntopxN9ym3rw4RTaR0rwf20UaHa9Y
         sx5Q==
X-Gm-Message-State: AOJu0YwFbF0tEYL06WNJjLqPsbeLGHtjqa4KERjh6sXd7jsuCgH+7BcM
	EDni8N9gmO2pduykLHDeD925wJoXIDwQBgF7e4Q=
X-Google-Smtp-Source: AGHT+IFvACKOSHoVqYQ/4XgiK0F6r70WRXxMKJQlADSGcBrfTKJwKaNev5rytmqe7vV2GX81dnJ8gQ==
X-Received: by 2002:a05:6830:22d9:b0:6b9:c51c:f4d5 with SMTP id q25-20020a05683022d900b006b9c51cf4d5mr10099549otc.10.1694417411056;
        Mon, 11 Sep 2023 00:30:11 -0700 (PDT)
Received: from localhost.localdomain ([157.32.70.97])
        by smtp.gmail.com with ESMTPSA id y26-20020aa7855a000000b006879493aca0sm1095759pfn.26.2023.09.11.00.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 00:30:10 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] gdb: Fix CVE-2023-39128
Date: Mon, 11 Sep 2023 13:00:01 +0530
Message-Id: <20230911073001.9042-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 07:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187482

From: Siddharth Doshi <sdoshi@mvista.com>

Note: The Fix needs to be pushed in gdb rather than bintuils-gdb as we are
disabling gdb in binutils configure.

Upstream-Status: Backport from [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=033bc52bb6190393c8eed80925fa78cc35b40c6d]
CVE: CVE-2023-39128
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/0011-CVE-2023-39128.patch         | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0011-CVE-2023-39128.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 649ee28727..099bd2d8f5 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -14,5 +14,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0008-resolve-restrict-keyword-conflict.patch \
            file://0009-Fix-invalid-sigprocmask-call.patch \
            file://0010-gdbserver-ctrl-c-handling.patch \
+           file://0011-CVE-2023-39128.patch \
            "
 SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0011-CVE-2023-39128.patch b/meta/recipes-devtools/gdb/gdb/0011-CVE-2023-39128.patch
new file mode 100644
index 0000000000..53b49cb21d
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0011-CVE-2023-39128.patch
@@ -0,0 +1,75 @@
+From 033bc52bb6190393c8eed80925fa78cc35b40c6d Mon Sep 17 00:00:00 2001
+From: Tom Tromey <tromey@adacore.com>
+Date: Wed, 16 Aug 2023 11:29:19 -0600
+Subject: [PATCH] Avoid buffer overflow in ada_decode
+
+A bug report pointed out a buffer overflow in ada_decode, which Keith
+helpfully analyzed.  ada_decode had a logic error when the input was
+all digits.  While this isn't valid -- and would probably only appear
+in fuzzer tests -- it still should be handled properly.
+
+This patch adds a missing bounds check.  Tested with the self-tests in
+an asan build.
+
+Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=30639
+Reviewed-by: Keith Seitz <keiths@redhat.com>
+
+Upstream-Status: Backport from [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=033bc52bb6190393c8eed80925fa78cc35b40c6d]   
+CVE: CVE-2023-39128
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ gdb/ada-lang.c | 19 ++++++++++++++++++-
+ 1 file changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/gdb/ada-lang.c b/gdb/ada-lang.c
+index 70a2b44..f682302 100644
+--- a/gdb/ada-lang.c
++++ b/gdb/ada-lang.c
+@@ -57,6 +57,7 @@
+ #include "cli/cli-utils.h"
+ #include "gdbsupport/function-view.h"
+ #include "gdbsupport/byte-vector.h"
++#include "gdbsupport/selftest.h"
+ #include <algorithm>
+ #include "ada-exp.h"
+ 
+@@ -1057,7 +1058,7 @@ ada_decode (const char *encoded, bool wrap)
+ 	i -= 1;
+       if (i > 1 && encoded[i] == '_' && encoded[i - 1] == '_')
+ 	len0 = i - 1;
+-      else if (encoded[i] == '$')
++      else if (i >= 0 && encoded[i] == '$')
+ 	len0 = i;
+     }
+ 
+@@ -1225,6 +1226,18 @@ ada_decode (const char *encoded, bool wrap)
+   return decoded;
+ }
+ 
++#ifdef GDB_SELF_TEST
++
++static void
++ada_decode_tests ()
++{
++  /* This isn't valid, but used to cause a crash.  PR gdb/30639.  The
++     result does not really matter very much.  */
++  SELF_CHECK (ada_decode ("44") == "44");
++}
++
++#endif
++
+ /* Table for keeping permanent unique copies of decoded names.  Once
+    allocated, names in this table are never released.  While this is a
+    storage leak, it should not be significant unless there are massive
+@@ -13497,4 +13510,8 @@ DWARF attribute."),
+   gdb::observers::new_objfile.attach (ada_new_objfile_observer, "ada-lang");
+   gdb::observers::free_objfile.attach (ada_free_objfile_observer, "ada-lang");
+   gdb::observers::inferior_exit.attach (ada_inferior_exit, "ada-lang");
++
++#ifdef GDB_SELF_TEST
++  selftests::register_test ("ada-decode", ada_decode_tests);
++#endif
+ }
+-- 
+2.35.7
+
-- 
2.34.1


