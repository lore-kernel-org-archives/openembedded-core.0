Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8722E7E63C
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 14:12:23 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.20199.1695737536806037523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 07:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1k6+3U9C;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.49, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-57bd4e4ada6so1692683eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695737535; x=1696342335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jeq/MsmjoO6h74Lml8GEIS/Ac+6YUDKwSYeSJLoSOtQ=;
        b=1k6+3U9C2O82ti7GfmNK+6pWBGRKiTjK5KZm4uiyUo48ZOVUXsDNKIoOdDVWPcVgPm
         umXomHqzJrFK/9SOS48q2mdNTVZbBsIhCRIiXoXgGtanWvr8bWDSjsxwt220NSLk9Mxd
         ocyX23Lqk0dN9GXqzjWQZBfU5JoJwlGoReO0nVU4R4eP9JBHV5jiNOVkZOzPO9Z7/PSL
         QOi/N7mEISEf1EFb1WcRm1ORelMA5a7RJJBNnu8R43w3sfI2F5Auq/3FhmHaPNpaPjDU
         7pIlQU+6Dy8ZXVgqJrA2xrWoFoZ9Ew/e6zHIMrWaWBKdUDCd8UxJ3dxu9s5396lDj7FD
         wDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695737535; x=1696342335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jeq/MsmjoO6h74Lml8GEIS/Ac+6YUDKwSYeSJLoSOtQ=;
        b=mCMsaqSU5NDXkaAe0xQLiAYYzgLiep8TMqlGm2G4NoDoO2ufheh5Ms3OU8vu/c0684
         cdQ7B9Tt49y6IPr/f3/EsOWG0AjI3jV5BjUEMS2nreYiTmlhVqrGOk31+bC68hegKIc0
         oAjEiDRkKf05cmZr9HAkjyQzlzouPQw6f7e3Kn5Cfy8stQdaAUVeaHz+zXgZ01DrJBh+
         SJNpUXHedBRQC9XPJF+Fv9GYWufGzQEHbeFySE6HM+rZLO4T0d48UX4ul3hIUuKSukxU
         zqcnx3SR+mSp796hLr5vwvxKeS9GCFjZwfrCViVweqxljOlowwtuh88saOV92TIEWUGO
         nJKQ==
X-Gm-Message-State: AOJu0YyI0DC4cO+hGDDgduD3y8vbPba97oWqc2ee23V6xbvumdLUOwkE
	0WzeQu+HyHMm63HaO2ZgaaDAH1LsXIbJNR7U/pk=
X-Google-Smtp-Source: AGHT+IHmJ/kohDuNjcAkNqAmZ7LgaY3rJrvuGUNlX95OUbHA1wac7QgGEyYtybP5Kh56oO/lZ9nWjw==
X-Received: by 2002:a05:6358:c1d:b0:143:70a1:afcd with SMTP id f29-20020a0563580c1d00b0014370a1afcdmr13592468rwj.1.1695737535374;
        Tue, 26 Sep 2023 07:12:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm1348861pgc.80.2023.09.26.07.12.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:12:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] gdb: Fix CVE-2023-39128
Date: Tue, 26 Sep 2023 04:12:02 -1000
Message-Id: <c991fdbb63a6de754399ac4fe04288ea66d34c4d.1695737244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695737244.git.steve@sakoman.com>
References: <cover.1695737244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188247

From: Siddharth Doshi <sdoshi@mvista.com>

Note: The Fix needs to be pushed in gdb rather than bintuils-gdb as we are
disabling gdb in binutils configure.

Upstream-Status: Backport from [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=033bc52bb6190393c8eed80925fa78cc35b40c6d]
CVE: CVE-2023-39128
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


