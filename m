Return-Path: <sanjanasanju1608@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE60FEE7FEA
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 12:41:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.37984.1694176893098791111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 05:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QLpFBbQZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: sanjanasanju1608@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c09673b006so15297945ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 05:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694176892; x=1694781692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3tPd/+0AJXB8/gLnVgpsbPO2V95mLqE9B1bKa6RW1QY=;
        b=QLpFBbQZJvkwJH3SfnWja/jvBSOWjBc+GvN9kZgafDwb95pqaayTnhRkW5uhRylORw
         l/kUjijZt/L+gj7+ePggvR+VXB57+42WFI37Z32oYdQQEK/kg1MP/xmM4pTTVXr+5gCV
         OCKiCMzY9HuqX1ReUBWQcmAcQEE9AcrGda2iCTQr9N4xffbI9BlbiuHyyQhFythxc/4R
         7f1lVCnDxLLeuiGAcVTrCE+f6CMESHSjXSyoEn3yGVtqm9l9yT/2rMqsLBtb7c12IcPA
         57My4Fo+ECSacgbOcorP97AOyPfNVNpX5ZwUe5BBmHKmO4ad6sW13FanNsu/rGGpnCI8
         Xzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694176892; x=1694781692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tPd/+0AJXB8/gLnVgpsbPO2V95mLqE9B1bKa6RW1QY=;
        b=CIJ7SlfOPa1KoZCL4kLk/v7AgPrdcaRg6HweiKNoAKBLH0t8gVFubmYzSmGcTnxBlk
         Do18D/wdS8W82TjV1R3Kk1x2dn44f0F8DKJSlINlTDctaBrS9mCRQpsyT6gefiY6I29X
         MZRPtYknta1lCblypSPKVXluLoFpsBiodNWJ1qa7kWM/uCKPKRcbXiB/xHhem3IHkDtu
         yuC3lWRMVSW0AVsMpgDDmsg1jKaDdR81bDGrgU7QD/tYpiFpLJsy0IQB0cq5n2GeAsDl
         u/2P5ZElxNs2mX0HNF/qib+X0WpRp2IoelADcGDHIr+BK9OQRwW/El1Bsx/o4oKfINBd
         A4AQ==
X-Gm-Message-State: AOJu0YxevEWXMx539WfouYjmw++qECzU4TbzoWN7NTi0TIobBGE0vfcM
	u3zrkNnJS2JxFgfOujHAp63FSu6hywr3y4rL
X-Google-Smtp-Source: AGHT+IGLNH8pwQVpiw6dis6kvX/z35WU2JmPYM5o61hnrEIXEPcwQgsYdGx6UQVGfKtwJkHNtDYw7w==
X-Received: by 2002:a17:902:c081:b0:1b8:6850:c3c4 with SMTP id j1-20020a170902c08100b001b86850c3c4mr2428710pld.22.1694176892153;
        Fri, 08 Sep 2023 05:41:32 -0700 (PDT)
Received: from bft01.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709028f8700b001b9be3b94d3sm1481743plo.140.2023.09.08.05.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 05:41:31 -0700 (PDT)
From: Sanjana <sanjanasanju1608@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com,
	Sanjana <sanjanasanju1608@gmail.com>
Subject: [mickledore][PATCH] binutils: Fix CVE-2023-39128
Date: Fri,  8 Sep 2023 18:11:09 +0530
Message-Id: <20230908124109.70317-1-sanjanasanju1608@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 12:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187416

Avoid buffer overflow in ada_decode.

Signed-off-by: Sanjana <sanjanasanju1608@gmail.com>
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


