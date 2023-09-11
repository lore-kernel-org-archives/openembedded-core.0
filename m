Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D29EE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 07:26:58 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.53251.1694417216426190987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 00:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CmOFxF/k;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso32684555ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 00:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1694417215; x=1695022015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUgKtUmNPPd3fNyJp/+tFpif06DxwpKHdf4XejmFdN4=;
        b=CmOFxF/kARzDzmbuPATkJ78uGIslwjI1OhwcjkxhH2gbl2BpcXevo7KP32gdcm7SqF
         M305T+7+OgkUQ3DecIdAF/D7dC0ZZYIuiwrS/7T6qHPo3EsM3MEubf/bO0ngRfvOkNNn
         e21S80dTBrZKGcBU1DPgI0Q9lQ0H23v7QCngU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694417215; x=1695022015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUgKtUmNPPd3fNyJp/+tFpif06DxwpKHdf4XejmFdN4=;
        b=aJVGYND0Xib2UOaIr8bICqSzVH9T3oxJkNgby0HkEQc7Nt4svgSoORkgpBT0WF+u9h
         eum7RsQfuNQA1aXhW6OqOet4AREbDkFPol1z3JB65DIh6ciyaPvDAoRMzk5qwpIE8Lke
         Ty0FfDNkfrNpeEHRwCxG0GdvPmctcjHdJtyjJBkG56yAz9YVSaH590hgPnut/lMe09r0
         dQviWZjZg7GsvHvJLa13y6+XAwe+2FtzQDzaAprJAXteeHGBsMp20iPbZdGwlIPLnIHa
         o3Gqo0cC5GXrt5/2fkST/jHYaHZ1gwrQofH4myzdM1xeYbzrFl59lsByjrDLAkR+Gpc7
         D5Fg==
X-Gm-Message-State: AOJu0YxJqTy29UfDi85AoE7YIR0HqYzUZegINRTdF/X6HaFuwhQJEzww
	kjv2MzGEGjEUyrZpUHcYPo8zn+KBegczboAvnlM=
X-Google-Smtp-Source: AGHT+IFP5oRyhC7O6fcm42G0yNDqo1zy375JyWv7Z2xCxcgoQLUJFKRxcbCoQ7HFY764U+sibKSGiA==
X-Received: by 2002:a17:902:8202:b0:1bf:6ad7:2286 with SMTP id x2-20020a170902820200b001bf6ad72286mr6846150pln.43.1694417215392;
        Mon, 11 Sep 2023 00:26:55 -0700 (PDT)
Received: from localhost.localdomain ([157.32.70.97])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902eb0c00b001bf574dd1fesm5671467plb.141.2023.09.11.00.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 00:26:55 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][mickledore][PATCH] gdb: Fix CVE-2023-39128
Date: Mon, 11 Sep 2023 12:56:46 +0530
Message-Id: <20230911072646.8890-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 07:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187479

From: Siddharth Doshi <sdoshi@mvista.com>

Note: The Fix needs to be pushed in gdb rather than bintuils-gdb as we are
disabling gdb in binutils configure.

Upstream-Status: Backport from [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=033bc52bb6190393c8eed80925fa78cc35b40c6d]
CVE: CVE-2023-39128
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/0009-CVE-2023-39128.patch         | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0009-CVE-2023-39128.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index e986b1a1f9..2437a96ae7 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0007-Fix-invalid-sigprocmask-call.patch \
            file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://add-missing-ldflags.patch \
+           file://0009-CVE-2023-39128.patch \
            "
 SRC_URI[sha256sum] = "fd5bebb7be1833abdb6e023c2f498a354498281df9d05523d8915babeb893f0a"
 
diff --git a/meta/recipes-devtools/gdb/gdb/0009-CVE-2023-39128.patch b/meta/recipes-devtools/gdb/gdb/0009-CVE-2023-39128.patch
new file mode 100644
index 0000000000..88e39eaa59
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0009-CVE-2023-39128.patch
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
+index 40f8591..06ac46b 100644
+--- a/gdb/ada-lang.c
++++ b/gdb/ada-lang.c
+@@ -57,6 +57,7 @@
+ #include "cli/cli-utils.h"
+ #include "gdbsupport/function-view.h"
+ #include "gdbsupport/byte-vector.h"
++#include "gdbsupport/selftest.h"
+ #include <algorithm>
+ #include "ada-exp.h"
+ #include "charset.h"
+@@ -1388,7 +1389,7 @@ ada_decode (const char *encoded, bool wrap, bool operators)
+ 	i -= 1;
+       if (i > 1 && encoded[i] == '_' && encoded[i - 1] == '_')
+ 	len0 = i - 1;
+-      else if (encoded[i] == '$')
++      else if (i >= 0 && encoded[i] == '$')
+ 	len0 = i;
+     }
+ 
+@@ -1585,6 +1586,18 @@ ada_decode (const char *encoded, bool wrap, bool operators)
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
+@@ -14084,4 +14097,8 @@ DWARF attribute."),
+   gdb::observers::new_objfile.attach (ada_new_objfile_observer, "ada-lang");
+   gdb::observers::free_objfile.attach (ada_free_objfile_observer, "ada-lang");
+   gdb::observers::inferior_exit.attach (ada_inferior_exit, "ada-lang");
++
++#ifdef GDB_SELF_TEST
++  selftests::register_test ("ada-decode", ada_decode_tests);
++#endif
+ }
+-- 
+2.25.1
+
-- 
2.34.1


