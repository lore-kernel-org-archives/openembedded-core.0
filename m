Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A768C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 09:58:29 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.10953.1635415107662965176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 02:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pJSEMo9F;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id x7so455862pfh.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 02:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AmmWAIkMBaivzqwCYi4q7blXFGYrQRGFJM8r6HbMQBA=;
        b=pJSEMo9F86jHdNOvg6jMytkKJYg4LoE+XLY6W9xxdV4WUYl3OClv0BO8Te+I6rV+Ic
         4RwmfIkKnAchwu4MPU+CWG6Udg/ZOkJ6aGXQOPesjweULheZcsRQ/976bfANFAfyr43k
         ubxeNYtvuN0UPG6hKhbJMhvhBYVkQjiaxEQjXI4WPpEhnHUEyooYxeW8yMkbG4pn9X61
         Loxn/eeRgS/HlHgBj5SVDrwDjHRU4BtlKG5Ljsd1/KnrswachzHz/sCq932JEH+rwdR4
         /xjRwNsrwudeMOT7iuCbI5PACzuA43plpkBzn/Qef+/MkiYwVSOvUEzxdNnztAyPet2Y
         7D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AmmWAIkMBaivzqwCYi4q7blXFGYrQRGFJM8r6HbMQBA=;
        b=Xr4aWJ4pxuTwKhPS/+8SYwtNKCpvCc9L1SmmrfjzoF59lIgC/P/HZacwt12iP+JUKx
         ALfHlonWR19juwrAyvGdX7k4X4NK+o5It5Q44nok1BOO5QkkdThqo0NoDz/Uk7vhHBFg
         MILLTFzm9foO9r+ZOxZp68LysgVzvWVZwmzvVXSeN5QkuWYYjCr8vzXXA8Sd2oCDH7x9
         /OChjaJPo36Mw/taVK6Iq+5vbltmesztcpZFI/bdin2IYTTlOJLs8nqobqjwfAcCX23z
         kjsez+DDT+tXAsh44HaqomywG7cCy8nUuNU5VoW114fhEBosgk4u1zpVfeoZgxfB/ZGE
         0hsA==
X-Gm-Message-State: AOAM533hk4ApQ1lp6MzO0hqSPbPpVPXKoydEBgaQOsXkHCJzLpVpS17x
	aOcO8SEiQaDw0BQm0w77MMgcTZIpRdOZ+g==
X-Google-Smtp-Source: 
 ABdhPJx8YuTXvKPOYch75pzSPheJeTLhzOzx5nLhAJyr+5zuYSTQwyjAzlPeYnhdLWKIn+HWoR9nQw==
X-Received: by 2002:aa7:8718:0:b0:47b:f2ca:2e59 with SMTP id
 b24-20020aa78718000000b0047bf2ca2e59mr3265946pfo.21.1635415106797;
        Thu, 28 Oct 2021 02:58:26 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 mm7sm1798608pjb.4.2021.10.28.02.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 02:58:26 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH v2] binutils: Fix CVE-2021-3530
Date: Thu, 28 Oct 2021 02:58:14 -0700
Message-Id: <20211028095814.171717-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 09:58:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157582

CVE: CVE-2015-3530
Upstream-Status: Backport[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=25162c795b1a2becf936bb3581d86a307ea491eb]
Upstream-Status: Backport[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=999566402e3]

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 .../binutils/binutils-2.36.inc                |   2 +
 .../binutils/0017-CVE-2021-3530.patch         | 102 ++++++++++++++++++
 .../binutils/0018-CVE-2021-3530.patch         |  64 +++++++++++
 3 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2021-3530.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2021-3530.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
index 9d770db5a8..7d0824e060 100644
--- a/meta/recipes-devtools/binutils/binutils-2.36.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
@@ -44,5 +44,7 @@ SRC_URI = "\
      file://0001-CVE-2021-20197.patch \
      file://0002-CVE-2021-20197.patch \
      file://0003-CVE-2021-20197.patch \
+     file://0017-CVE-2021-3530.patch \
+     file://0018-CVE-2021-3530.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2021-3530.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2021-3530.patch
new file mode 100644
index 0000000000..3eba99132b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2021-3530.patch
@@ -0,0 +1,102 @@
+From 25162c795b1a2becf936bb3581d86a307ea491eb Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 15 Jul 2021 16:51:56 +0100
+Subject: [PATCH] Fix a stack exhaustion problem in the Rust demangling code in
+ the libiberty library.
+
+	PR 99935
+	* rust-demangle.c: Add recursion limit.
+
+CVE: CVE-2015-3530
+Upstream-Status: Backport[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=25162c795b1a2becf936bb3581d86a307ea491eb]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ libiberty/ChangeLog       |  5 +++++
+ libiberty/rust-demangle.c | 31 +++++++++++++++++++++++++------
+ 2 files changed, 30 insertions(+), 6 deletions(-)
+
+diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
+index bc1b35b97c4..8e39fd28eba 100644
+--- a/libiberty/ChangeLog
++++ b/libiberty/ChangeLog
+@@ -1,3 +1,8 @@
++2021-07-15  Nick Clifton  <nickc@redhat.com>
++
++	PR 99935
++	* rust-demangle.c: Add recursion limit.
++
+ 2021-01-04  Martin Liska  <mliska@suse.cz>
+ 
+ 	* strverscmp.c: Convert to utf8 from iso8859.
+diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
+index 449941b56dc..df09b7b8fdd 100644
+--- a/libiberty/rust-demangle.c
++++ b/libiberty/rust-demangle.c
+@@ -74,6 +74,12 @@ struct rust_demangler
+   /* Rust mangling version, with legacy mangling being -1. */
+   int version;
+ 
++  /* Recursion depth.  */
++  uint recursion;
++  /* Maximum number of times demangle_path may be called recursively.  */
++#define RUST_MAX_RECURSION_COUNT  1024
++#define RUST_NO_RECURSION_LIMIT   ((uint) -1)
++
+   uint64_t bound_lifetime_depth;
+ };
+ 
+@@ -671,6 +677,15 @@ demangle_path (struct rust_demangler *rd
+   if (rdm->errored)
+     return;
+ 
++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    {
++      ++ rdm->recursion;
++      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
++	/* FIXME: There ought to be a way to report
++	   that the recursion limit has been reached.  */
++	goto fail_return;
++    }
++
+   switch (tag = next (rdm))
+     {
+     case 'C':
+@@ -688,10 +703,7 @@ demangle_path (struct rust_demangler *rd
+     case 'N':
+       ns = next (rdm);
+       if (!ISLOWER (ns) && !ISUPPER (ns))
+-        {
+-          rdm->errored = 1;
+-          return;
+-        }
++	goto fail_return;
+ 
+       demangle_path (rdm, in_value);
+ 
+@@ -776,9 +788,15 @@ demangle_path (struct rust_demangler *rd
+         }
+       break;
+     default:
+-      rdm->errored = 1;
+-      return;
++      goto fail_return;
+     }
++  goto pass_return;
++
++ fail_return:
++  rdm->errored = 1;
++ pass_return:
++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    -- rdm->recursion;
+ }
+ 
+ static void
+@@ -1317,6 +1335,7 @@ rust_demangle_callback (const char *mang
+   rdm.skipping_printing = 0;
+   rdm.verbose = (options & DMGL_VERBOSE) != 0;
+   rdm.version = 0;
++  rdm.recursion = (options & DMGL_NO_RECURSE_LIMIT) ? RUST_NO_RECURSION_LIMIT : 0;
+   rdm.bound_lifetime_depth = 0;
+ 
+   /* Rust symbols always start with _R (v0) or _ZN (legacy). */
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2021-3530.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2021-3530.patch
new file mode 100644
index 0000000000..857ac5b3d0
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2021-3530.patch
@@ -0,0 +1,64 @@
+From 999566402e3d7c69032bbf47e28b44fc0926fe62 Mon Sep 17 00:00:00 2001
+From: Christopher Wellons <wellons@nullprogram.com>
+Date: Sun, 18 Jul 2021 16:57:19 -0400
+Subject: [PATCH] Change "uint" to "unsigned"
+
+This fixes a defect introduced in 25162c795. The "uint" type has not
+been explicitly defined here on mingw, causing compilation to fail.
+
+On linux we have this in /usr/include/sys/types.h
+
+/* Old compatibility names for C types.  */
+typedef unsigned long int ulong;
+typedef unsigned short int ushort;
+typedef unsigned int uint;
+
+So it's easy to see how such bugs can creep in.
+
+	* rust-demangle.c (struct rust_demangler): Change type of
+	"recursion" to unsigned.
+	(RUST_NO_RECURSION_LIMIT): Similarly in cast.
+
+CVE: CVE-2015-3530
+Upstream-Status: Backport[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=999566402e3]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ libiberty/ChangeLog       | 6 ++++++
+ libiberty/rust-demangle.c | 4 ++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
+index 8e39fd28eba..3f749455f05 100644
+--- a/libiberty/ChangeLog
++++ b/libiberty/ChangeLog
+@@ -1,3 +1,9 @@
++2021-07-19  Christopher Wellons  <wellons@nullprogram.com>
++
++	* rust-demangle.c (struct rust_demangler): Change type of
++	"recursion" to unsigned.
++	(RUST_NO_RECURSION_LIMIT): Similarly in cast.
++
+ 2021-07-15  Nick Clifton  <nickc@redhat.com>
+ 
+ 	PR 99935
+diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
+index df09b7b8fdd..ac1eb8eb02c 100644
+--- a/libiberty/rust-demangle.c
++++ b/libiberty/rust-demangle.c
+@@ -75,10 +75,10 @@ struct rust_demangler
+   int version;
+ 
+   /* Recursion depth.  */
+-  uint recursion;
++  unsigned recursion;
+   /* Maximum number of times demangle_path may be called recursively.  */
+ #define RUST_MAX_RECURSION_COUNT  1024
+-#define RUST_NO_RECURSION_LIMIT   ((uint) -1)
++#define RUST_NO_RECURSION_LIMIT   ((unsigned) -1)
+ 
+   uint64_t bound_lifetime_depth;
+ };
+-- 
+2.27.0
+
-- 
2.31.1


