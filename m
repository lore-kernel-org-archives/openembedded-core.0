Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E65CA0EC9
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 06:19:54 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.19117.1694499588545101383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 23:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SXhbuHvM;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c364fb8a4cso47790295ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 23:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1694499587; x=1695104387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o2at2MwbX5EIcWGv2j+c2pKBj2tfAgPYzu+mDhGtGJU=;
        b=SXhbuHvMfibi33E4++qy8vOZUqjQQcv1Iv8vpw8WWGmJTp3+z7oD20RQUosQdopCbp
         pvT+v6AifvSV/6Ta1rDoiFfx2cm2Y5kPytTwHad5rbMAm+sOQQ4hhIcyLqZgXR+OWOiU
         6sYUhlHkrtcFB6mExTyGbgcahEozOaEB9nbcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694499587; x=1695104387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2at2MwbX5EIcWGv2j+c2pKBj2tfAgPYzu+mDhGtGJU=;
        b=i3sMMERetMK8r3Q2jMc6JaZ1h4w7Dn/Y2gRYrWsBJcRAH4Dt/NAJzvfgUwAMW5qNBD
         kMhOgO3hNjj9G7hdns5kNj/upm9RfxSwGqTpIglFYjk19cCr9K4GQC8S6ONO23D00UX1
         6h3TFeJewHWdF1Q5LTuIlU6IUXE5LWtlM/5sDH6QZe/SOzsgxeq7n146arLet+eWL90l
         TmtXNQit9JoGFBQwh7aqL2ndL1fq5twdeeilhVKQvvatv3e7C3Tm2A+BwabiwREP3y8h
         Wz7Hh1uuVqcYEVNaKbPRMB9CSwYtnkYSVB1GNLC5F6PtFWvuJt2cJ+tT3NJaiGm4ziwi
         RMJw==
X-Gm-Message-State: AOJu0Yw+EIBgUoeV7+Sbeht311TIB2MJzlndmRz2TQPaEasKKAUIWA0P
	dWGbKpPWDNcGcoXy8pc16wSP+j3eu468DVu9Erk=
X-Google-Smtp-Source: AGHT+IFXQUrRsFdYwoKC3B7ewf7m4hL91Nwbpz+vKrXE9p+3FDMxf3cSEc8moTvS9IczgFIb9rPEsQ==
X-Received: by 2002:a17:902:e5cc:b0:1c1:f6d1:3118 with SMTP id u12-20020a170902e5cc00b001c1f6d13118mr18312945plf.27.1694499587423;
        Mon, 11 Sep 2023 23:19:47 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([117.228.82.185])
        by smtp.gmail.com with ESMTPSA id l20-20020a170903005400b001bb892a7a67sm7596246pla.1.2023.09.11.23.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 23:19:47 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH] gdb: Fix CVE-2023-39128
Date: Tue, 12 Sep 2023 11:49:37 +0530
Message-Id: <20230912061937.17154-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187498

From: Siddharth Doshi <sdoshi@mvista.com>

Note: The Fix needs to be pushed in gdb rather than bintuils-gdb as we are
disabling gdb in binutils configure.

Upstream-Status: Backport from [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=033bc52bb6190393c8eed80925fa78cc35b40c6d]
CVE: CVE-2023-39128
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-devtools/gdb/gdb-9.1.inc         |  1 +
 .../gdb/gdb/0012-CVE-2023-39128.patch         | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39128.patch

diff --git a/meta/recipes-devtools/gdb/gdb-9.1.inc b/meta/recipes-devtools/gdb/gdb-9.1.inc
index d019e6b384..212c554cf1 100644
--- a/meta/recipes-devtools/gdb/gdb-9.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-9.1.inc
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-resolve-restrict-keyword-conflict.patch \
            file://0010-Fix-invalid-sigprocmask-call.patch \
            file://0011-gdbserver-ctrl-c-handling.patch \
+           file://0012-CVE-2023-39128.patch \
            "
 SRC_URI[md5sum] = "f7e9f6236c425097d9e5f18a6ac40655"
 SRC_URI[sha256sum] = "699e0ec832fdd2f21c8266171ea5bf44024bd05164fdf064e4d10cc4cf0d1737"
diff --git a/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39128.patch b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39128.patch
new file mode 100644
index 0000000000..6445455bde
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39128.patch
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
+index 0c2d4fc..40852b6 100644
+--- a/gdb/ada-lang.c
++++ b/gdb/ada-lang.c
+@@ -56,6 +56,7 @@
+ #include "cli/cli-utils.h"
+ #include "gdbsupport/function-view.h"
+ #include "gdbsupport/byte-vector.h"
++#include "gdbsupport/selftest.h"
+ #include <algorithm>
+ 
+ /* Define whether or not the C operator '/' truncates towards zero for
+@@ -1184,7 +1185,7 @@ ada_decode (const char *encoded)
+         i -= 1;
+       if (i > 1 && encoded[i] == '_' && encoded[i - 1] == '_')
+         len0 = i - 1;
+-      else if (encoded[i] == '$')
++      else if (i >= 0 && encoded[i] == '$')
+         len0 = i;
+     }
+ 
+@@ -1350,6 +1351,18 @@ Suppress:
+ 
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
+@@ -14345,4 +14358,8 @@ DWARF attribute."),
+   gdb::observers::new_objfile.attach (ada_new_objfile_observer);
+   gdb::observers::free_objfile.attach (ada_free_objfile_observer);
+   gdb::observers::inferior_exit.attach (ada_inferior_exit);
++
++#ifdef GDB_SELF_TEST
++  selftests::register_test ("ada-decode", ada_decode_tests);
++#endif
+ }
+-- 
+2.24.4
+
-- 
2.34.1


