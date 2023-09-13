Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1057EDEC65
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:31:06 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.13485.1694615466222083254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jaPw4zdS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68fcb4dc8a9so2901708b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694615465; x=1695220265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9aGT/7/825a42mBt42OGNZeJrEjSeiRVz2jM12wDR4=;
        b=jaPw4zdSAK/PGt25+Pts5CMbWEvIYsGNHQXoAIJKTZTDhIMVskaTQcW2VCciooAtNx
         T+0pdp4KECo0q1c2p9hwCsvB4uCtxsTBOr+eCq3WRdzgdX+lxHmZ+s7Aw9da4JCgG9Jb
         fX3xf/d17M7dstj8OYjs4hFcwKPgMCWwD/Oy6ZoPcL8ZyTSKa5FqtdxN3k9GJ5cru76s
         JAe91zLu0ls3TE55U1dg6XGJNDU2awobgzcVeY3Dms75pGIEtNR7T1pCpVU3Cyinu/qO
         ZRp3Ny/COD03BeJUDVlIyKAks8g4HQsrsuAILDOO1YE2bZ8n3UGby31CSf+XYxFEweDg
         zOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615465; x=1695220265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9aGT/7/825a42mBt42OGNZeJrEjSeiRVz2jM12wDR4=;
        b=U/Yet9UarV5w4xMz82Hu7TGQINha9KHa3gYmfH6st4lUgfTPhVxaiKpL+Z6hL3N5QL
         HEfuSNL3iWAKW2gI3rpyQbX9mot+RNYAXkdey1RSbnCSMaz3IBl8y5yTKTuan0d/QXDZ
         VPZjuoePPUEDTIUvwibBRFmLCE2OR972JgX+RYDzciwTb/GwQPFZQoybBJttahmNeF3p
         m2oD98aOA0H1DRg+o3fGXHvhTz3CiHI/1M9srs4e5JtuEGVArsmik+A7M9KKaIiaL3nl
         6u+426+lMsRlV+57/zQzGvsobM97uj3QFWZ85q9+Lf4J5rzWUDVHeubYX4/TVLJ6jeRT
         VR1A==
X-Gm-Message-State: AOJu0Yz+6dWlIACnssioIuZI0YnMhZybMJGyEl0Ozv7xVxb+psVjXE6i
	WzcvD0km9WMZAdjGzSK85ViHAjVNiBxdM0jd3VA=
X-Google-Smtp-Source: AGHT+IEboRO6lI6J9zltFVmgtS4azDUBZwEAC2aMV9gfSVCOSp/DyDsi1lXeHO/QZFAlhUVtLS+JlQ==
X-Received: by 2002:a05:6a00:39a5:b0:68f:c261:ddfe with SMTP id fi37-20020a056a0039a500b0068fc261ddfemr2818702pfb.28.1694615464760;
        Wed, 13 Sep 2023 07:31:04 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00686ec858fb0sm9185796pfm.190.2023.09.13.07.31.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:31:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] gdb: Fix CVE-2023-39128
Date: Wed, 13 Sep 2023 04:30:39 -1000
Message-Id: <1a19a101cecc578aac84e365a361b76f129fe655.1694613269.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613269.git.steve@sakoman.com>
References: <cover.1694613269.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187602

From: Siddharth Doshi <sdoshi@mvista.com>

Note: The Fix needs to be pushed in gdb rather than bintuils-gdb as we are
disabling gdb in binutils configure.

Upstream-Status: Backport from [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=033bc52bb6190393c8eed80925fa78cc35b40c6d]
CVE: CVE-2023-39128
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


