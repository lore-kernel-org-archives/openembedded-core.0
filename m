Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDD8EED60C
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:22:05 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.23118.1694791325481184926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SYhzK0mP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-565e395e7a6so1422352a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694791324; x=1695396124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJnPkxzdbrjUOx8CrAiCGI6EW0Lcd7bcdsztJS5TdgY=;
        b=SYhzK0mPorS1kGZOFXTB/Bc3E7PWtHixYSM1gWv5VoO+k41SFyBbH+up17cd8WrsXA
         5D7PZxd8ZqcT23NU5/TmZBc9UIgVjqs6L4gXCkk3epTo7BOj58SKrlEjhYztq6g204PP
         ANkglifpvo7wkRNjJMg3NoQ5ZlTUMCG/6jX+DAGYP8T4BHoET4XUfTJ4xFYvAuHS8EcX
         ih3SnaK/BJvz+Ul4hY7Lz7skn5T1zVrmvaW6a4QUdlTeOnqSL5UzN+S34+sVdmGpSKnB
         BsEyDf/JZMeqzF4kNLS2QHFsXtWGeRcgFMhi41i1AWIraswFX2M5/Y3Y90eUHFR85955
         dwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791324; x=1695396124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJnPkxzdbrjUOx8CrAiCGI6EW0Lcd7bcdsztJS5TdgY=;
        b=a4Eiks1QAuYRuScqaq2GD11s2JIEH0h5jMt3n5HCVwUZ9LrsnbcSOiGQbQKEqHyh82
         21Tde7oNa/wyLthaTEPVst4FfBnuHoTv6zxeqW9xE7QKE9htMiaRXZ9vAcKMFmcuM/vz
         Ax2VHJPpPUm7L6zr/zVIaUkg0beDTzFbv9McCNh2dQ6Kg1X027nQXniATqZ3OQSd2nJs
         44gcH92tDpjj4tnRGEjYJgxNAdQNxRcBlunSy+gI/ngiFGiuV7oOpE08RVw7jN4azwJF
         XjwHkHZ3a3C3Gb/qeZLBZiZXu0NINIsFanbu3R3qXXnGTDYIcOpN5LzwS5fjktG5pkUA
         rMOA==
X-Gm-Message-State: AOJu0Yw8n2BS+pgy/bz7ORGO9Czh7fv9EWRwqepTOqnZ+FIJdEAqYRu2
	bXlUzn4r5INtSSsbJgw4HdqiCUdPMo2ZveKpXAs=
X-Google-Smtp-Source: AGHT+IHdxZKy1S3R2pjtadVhqAhT9k5o55dCcgwUt2rQLQ3scZMxXMD72A21bKLMl8eXRaNdvbyssg==
X-Received: by 2002:a17:90a:fe17:b0:26b:5ba4:4948 with SMTP id ck23-20020a17090afe1700b0026b5ba44948mr1798021pjb.12.1694791324448;
        Fri, 15 Sep 2023 08:22:04 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090ae29500b002749ae93778sm1375398pjz.23.2023.09.15.08.22.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:22:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 3/8] gdb: Fix CVE-2023-39128
Date: Fri, 15 Sep 2023 05:21:41 -1000
Message-Id: <173d7ab67f14fc6d8b5d46e1c1de39d20965d6e9.1694790288.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694790288.git.steve@sakoman.com>
References: <cover.1694790288.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187671

From: Siddharth Doshi <sdoshi@mvista.com>

Note: The Fix needs to be pushed in gdb rather than bintuils-gdb as we are
disabling gdb in binutils configure.

Upstream-Status: Backport from [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=033bc52bb6190393c8eed80925fa78cc35b40c6d]
CVE: CVE-2023-39128
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


