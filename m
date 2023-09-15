Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FF6EED60A
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:22:05 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.23355.1694791322716177280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zf0rN/yi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-26b41112708so1825853a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694791322; x=1695396122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2585Nlcq52xkguRuUc6iILIspYGOP7rn2hzrOPsEXNU=;
        b=zf0rN/yiZaL6Y6m5zouFVeTtRjDV09939cElmyIF//6yowN0P96I53Yl9GQpqKyrjr
         jcWOByD9zZd9R8FNDLT7Qk8PKY+g+Qkm5TrSYW7/fqDyYru+d5eO3qfLFGcIQbWFFd7c
         wgc6bameE9qzc8rGTg6SweFe4kqbOwKdxgJqoJxCPFuSXekq57wVKvgsKW4k7yRMB9zT
         7vUlb9D6TnFbRCliqasWYJcIBVX85LZ4b0Bw/My0yZFvUs20lBi18nnWZSEwsxJobfiV
         ZWsOENONlOpPzgjMeWRmnGbs8hNiKNktmbtQOt2HZVsLMiJIZsVZ6h7d+V5mcs1lDeN1
         k94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791322; x=1695396122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2585Nlcq52xkguRuUc6iILIspYGOP7rn2hzrOPsEXNU=;
        b=QsWnN2ssoyLoYdF+3ioX6M35d2ZihkrtvO5hgLO6LLNLv4uzx4nf5OgkiWBOgF3VIW
         MSg4MzGtRqd/RfTNXcRBPBraqg6UGObJZWgbl77A0+W5pV3Lw7qCVgjy4ueeKkZ9fRSe
         smWM0b9AsIu0a48Ej929DlDx/5jcoqwke78ZP8Gt86zDsZVmIyCwlTsraYOIFENlc+VP
         MeMQ5c5qnibJOIzk/bJBgonISamo+mcVhElFxS+x52TEAMx7NhZdQWE5OXjK+lPZ5Siu
         bCH7iB2kfZ/IxakNDuVwsRNu+ljSv4KDNRSmYGAQoT8sxJn3J/MC2ra/QqosAJMyh9Mt
         N7Gw==
X-Gm-Message-State: AOJu0Yw5iwj+bW0fBSG6pj+vAJARMgCLC80iwI+mcBnr4ikg3ELxFQKh
	yFw8pAkiiVifjw9hsltWABa/s21KawFHXpxSZas=
X-Google-Smtp-Source: AGHT+IGBIYvfCnZ8J8C4syU9sRj7yw6WilOG+BmEHuVqMac6u5VXn8/pXV5GcOg8LDeFuroBTFbT2w==
X-Received: by 2002:a17:90b:3b42:b0:273:cb91:c74f with SMTP id ot2-20020a17090b3b4200b00273cb91c74fmr2035946pjb.8.1694791321726;
        Fri, 15 Sep 2023 08:22:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090ae29500b002749ae93778sm1375398pjz.23.2023.09.15.08.22.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:22:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 2/8] binutils: Fix CVE-2023-39128
Date: Fri, 15 Sep 2023 05:21:40 -1000
Message-Id: <a6587352b4d204134443430b2ddc605f25a5ae3f.1694790288.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694790288.git.steve@sakoman.com>
References: <cover.1694790288.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187670

From: Sanjana <sanjanasanju1608@gmail.com>

Avoid buffer overflow in ada_decode.

Signed-off-by: Sanjana <sanjanasanju1608@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.40.inc                |  1 +
 .../binutils/0017-CVE-2023-39128.patch        | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2023-39128.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index 33e7f4198d..424cfc48fc 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0016-CVE-2023-25586.patch \
      file://0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.patch \
+     file://0017-CVE-2023-39128.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2023-39128.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2023-39128.patch
new file mode 100644
index 0000000000..cd81a52b15
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2023-39128.patch
@@ -0,0 +1,74 @@
+From: Tom Tromey <tromey@adacore.com>
+Date: Wed, 16 Aug 2023 17:29:19 +0000 (-0600)
+Subject: Avoid buffer overflow in ada_decode
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=033bc52bb6190393c8eed80925fa78cc35b40c6d
+
+Avoid buffer overflow in ada_decode
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
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=033bc52bb6190393c8eed80925fa78cc35b40c6d]    
+
+CVE: CVE-2023-39128    
+
+Signed-off-by: Sanjana Venkatesh <Sanjana.Venkatesh@windriver.com>
+
+---
+
+diff --git a/gdb/ada-lang.c b/gdb/ada-lang.c
+index 4a9a6e0f38f..2f934b1e79a 100644
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
+@@ -1377,7 +1378,7 @@ ada_decode (const char *encoded, bool wrap, bool operators)
+ 	i -= 1;
+       if (i > 1 && encoded[i] == '_' && encoded[i - 1] == '_')
+ 	len0 = i - 1;
+-      else if (encoded[i] == '$')
++      else if (i >= 0 && encoded[i] == '$')
+ 	len0 = i;
+     }
+ 
+@@ -1574,6 +1575,18 @@ Suppress:
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
+@@ -13984,4 +13997,8 @@ DWARF attribute."),
+   gdb::observers::new_objfile.attach (ada_new_objfile_observer, "ada-lang");
+   gdb::observers::free_objfile.attach (ada_free_objfile_observer, "ada-lang");
+   gdb::observers::inferior_exit.attach (ada_inferior_exit, "ada-lang");
++
++#ifdef GDB_SELF_TEST
++  selftests::register_test ("ada-decode", ada_decode_tests);
++#endif
+ }
-- 
2.34.1


