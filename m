Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EE2C7EE26
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 17:26:45 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.1279.1684776402133031852
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 10:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pzNCWnii;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-96f6e83e12fso551340566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 10:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684776400; x=1687368400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oA61auFlG2c9HtJY8ylwLtxxPOk92Nqhn77gfHhChjM=;
        b=pzNCWniijw4eFVlXez9OY6cvts4OpkxHRSPCRzLfF0/eewEI7q42+VkxuparWF/Tt+
         naUzWJzDwHQGRxljJ2xwVWT5r0TlCyhPSul1jSbbbId8uU+rrGGzunESRoEtsnERHykT
         tmsZTNAQV0vh/tsHuIvS7dJzFy94fzOKr49c2i4p5K12gaIkjQl25c1DX3KmRAiwDl2M
         z4S6Jvx2xEw8QfQNuOOqruTwHNgf5lBjn9SWrE8xz2Nez5+HG13qIfDdg9eUvAaTBDCx
         YFmXyAgaL8IjtK2Ml1wztw11kThpeHa7e7Ou+jxxy/UEkX9f+0nWDeGHuXYtkyoFTqbk
         xbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684776400; x=1687368400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oA61auFlG2c9HtJY8ylwLtxxPOk92Nqhn77gfHhChjM=;
        b=IlT1gzay/Gl4tJtvKWTZoGZnNMdUdlkITKuiC7Wy45kpCDy+KRTT3v1AcTliLc14uM
         UzqVKz5YKjvE++5iEbLWS1vW4vb8YAm+kQVQc5GwVZt66TczliZyUJsinL8B2frPww6E
         Tc7uu+hJ1lbGBnyQzSdyB1GafyPkxM6X+xvEsE9otbSPE9JBlgBYJKOUOl2+SaOXIJLd
         PPiQb/83BVk9nTD3jklZ+JqctcyDjFqDMPGlktQk4QBIiTYSleAVGPnb7gK4ZTjeXsbp
         tmngj8fWMtepZJdulntn6QA+Bn83HR7tNoLIIL0MsiKEuoSdzFCxTpz3nYR2osVi8kIk
         TYtg==
X-Gm-Message-State: AC+VfDz8/7GHlYJg4KVrWNUd6DmMFVV+wYUHJs80oImLOWZHBJLh/XDi
	gnlBRh1BZTRrDaqh8nrchFGhcretou0=
X-Google-Smtp-Source: ACHHUZ5SF31qr9ABPMCvO3whXksv0I5Z6T/RGQA7LVexU5ByTp+RGABYRHGJ9TGaaUl9C3OseILvfQ==
X-Received: by 2002:a17:907:a42b:b0:96f:9cea:a346 with SMTP id sg43-20020a170907a42b00b0096f9ceaa346mr6511964ejc.1.1684776400180;
        Mon, 22 May 2023 10:26:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c9-20020aa7c989000000b0050b2f588db6sm3124350edt.16.2023.05.22.10.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 10:26:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 8/8] valgrind: update 3.20.0 -> 3.21.0
Date: Mon, 22 May 2023 19:25:03 +0200
Message-Id: <20230522172503.1651374-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230522172503.1651374-1-alex@linutronix.de>
References: <20230522172503.1651374-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 17:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181608

Drop patches merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-drd-tests-Include-missing-cstdint.patch | 34 ----------
 ...efine-__THROW-if-not-already-defined.patch | 32 ---------
 ...inux-seg_override.c-add-missing-incl.patch | 30 ++++++++
 ...ck-x86-Define-__THROW-if-not-defined.patch | 32 ---------
 ...de-Replace-__modify_ldt-with-syscall.patch | 68 -------------------
 ...est-wrapper-to-support-PTEST-formats.patch | 52 +++++++-------
 .../valgrind/valgrind/fixed-perl-path.patch   | 38 ++---------
 ...{valgrind_3.20.0.bb => valgrind_3.21.0.bb} | 14 +---
 8 files changed, 65 insertions(+), 235 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-Include-missing-cstdint.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-memcheck-x86-Define-__THROW-if-not-defined.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.20.0.bb => valgrind_3.21.0.bb} (92%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-Include-missing-cstdint.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-Include-missing-cstdint.patch
deleted file mode 100644
index fbee24a5389..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-drd-tests-Include-missing-cstdint.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 687d9fb9e3de832379680e9d5268331011c92afa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 26 Jan 2023 08:53:26 -0800
-Subject: [PATCH] drd/tests: Include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer
-transitively included [1]. Explicitly include it for uint{32,64}_t.
-
-Fixes
-tsan_thread_wrappers_pthread.h:91:9: error: 'int64_t' does not name a type
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=464859]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- drd/tests/tsan_thread_wrappers_pthread.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drd/tests/tsan_thread_wrappers_pthread.h b/drd/tests/tsan_thread_wrappers_pthread.h
-index f15e6ad..4cc8062 100644
---- a/drd/tests/tsan_thread_wrappers_pthread.h
-+++ b/drd/tests/tsan_thread_wrappers_pthread.h
-@@ -55,6 +55,7 @@
- #define NO_TLS
- #endif
- 
-+#include <cstdint>
- #include <string>
- using namespace std;
- 
--- 
-2.39.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch
deleted file mode 100644
index a48d7db070f..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3409dc35c15bb14c8a525239806322648e079ab1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Jul 2017 17:12:43 -0700
-Subject: [PATCH 1/3] memcheck/arm64: Define __THROW if not already defined
-
-Helps compiling with musl where __THROW is not available
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- memcheck/tests/arm64-linux/scalar.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/memcheck/tests/arm64-linux/scalar.h b/memcheck/tests/arm64-linux/scalar.h
-index 9008816..8ef050f 100644
---- a/memcheck/tests/arm64-linux/scalar.h
-+++ b/memcheck/tests/arm64-linux/scalar.h
-@@ -12,6 +12,10 @@
- #include <sys/types.h>
- #include <sys/mman.h>
- 
-+#ifndef __THROW
-+#define __THROW
-+#endif
-+
- // Since we use vki_unistd.h, we can't include <unistd.h>.  So we have to
- // declare this ourselves.
- extern long int syscall (long int __sysno, ...) __THROW;
--- 
-2.13.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
new file mode 100644
index 00000000000..5e36c28523e
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
@@ -0,0 +1,30 @@
+From 978d9ed7f857f2cdcd2a8632f3c2feb56b99c825 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 8 May 2023 11:56:35 +0200
+Subject: [PATCH] none/tests/x86-linux/seg_override.c: add missing include for
+ musl builds
+
+Otherwise SYS_modify_ldt is undefined.
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=382034]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ none/tests/x86-linux/seg_override.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-linux/seg_override.c
+index ca8fbfe..4ef4394 100644
+--- a/none/tests/x86-linux/seg_override.c
++++ b/none/tests/x86-linux/seg_override.c
+@@ -3,6 +3,10 @@
+ #include <errno.h>
+ #include <string.h>
+ #include "../../../config.h"
++#if defined(MUSL_LIBC)
++#include <syscall.h>
++#include <unistd.h>
++#endif
+ 
+ 
+ /* Stuff from Wine. */
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-memcheck-x86-Define-__THROW-if-not-defined.patch b/meta/recipes-devtools/valgrind/valgrind/0002-memcheck-x86-Define-__THROW-if-not-defined.patch
deleted file mode 100644
index 5433472291e..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0002-memcheck-x86-Define-__THROW-if-not-defined.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 67d199dbdcbb3feff5f8928f87725fc64c0307d7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Jul 2017 17:36:42 -0700
-Subject: [PATCH 2/3] memcheck/x86: Define __THROW if not defined
-
-musl does not have __THROW, therefore make it null
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- memcheck/tests/x86-linux/scalar.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/memcheck/tests/x86-linux/scalar.h b/memcheck/tests/x86-linux/scalar.h
-index ef28b03..52f742e 100644
---- a/memcheck/tests/x86-linux/scalar.h
-+++ b/memcheck/tests/x86-linux/scalar.h
-@@ -11,6 +11,10 @@
- #include <sys/types.h>
- #include <sys/mman.h>
- 
-+#ifndef __THROW
-+#define __THROW
-+#endif
-+
- // Since we use vki_unistd.h, we can't include <unistd.h>.  So we have to
- // declare this ourselves.
- extern long int syscall (long int __sysno, ...) __THROW;
--- 
-2.13.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch b/meta/recipes-devtools/valgrind/valgrind/0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch
deleted file mode 100644
index fa1344c8539..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From d103475875858ab8a2e6b53ce178bb2f63883d4c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Jul 2017 17:37:56 -0700
-Subject: [PATCH 3/3] tests/seg_override: Replace __modify_ldt() with syscall()
-
-__modify_ldt() is specific to glibc, replacing it with syscall()
-makes it more portable.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- none/tests/x86-linux/seg_override.c | 15 ++++++---------
- 1 file changed, 6 insertions(+), 9 deletions(-)
-
-diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-linux/seg_override.c
-index b7619c9..c89874b 100644
---- a/none/tests/x86-linux/seg_override.c
-+++ b/none/tests/x86-linux/seg_override.c
-@@ -2,6 +2,8 @@
- #include <stdio.h>
- #include <errno.h>
- #include <string.h>
-+#include <unistd.h>
-+#include <syscall.h>
- 
- /* Stuff from Wine. */
- 
-@@ -52,14 +54,11 @@ inline static unsigned int wine_ldt_get_limit( const LDT_ENTRY *ent )
- /* our copy of the ldt */
- LDT_ENTRY ldt_copy[8192];
- 
--/* System call to set LDT entry.  */
--//extern int __modify_ldt (int, struct modify_ldt_ldt_s *, size_t);
--extern int __modify_ldt (int, void *, size_t);
--
- void print_ldt ( void )
- {
-    int res;
--   res = __modify_ldt( 0, ldt_copy, 8192*sizeof(LDT_ENTRY) );
-+   /* System call to set LDT entry.  */
-+   res = syscall(SYS_modify_ldt, 0, ldt_copy, 8192*sizeof(LDT_ENTRY) );
-    printf("got %d bytes\n", res );   
-    perror("error is");
- }
-@@ -83,9 +82,6 @@ struct modify_ldt_ldt_s
-   unsigned int empty:25;
- };
- 
--/* System call to set LDT entry.  */
--//extern int __modify_ldt (int, struct modify_ldt_ldt_s *, size_t);
--
- void set_ldt1 ( void* base )
- {
-   int stat;
-@@ -102,7 +98,8 @@ void set_ldt1 ( void* base )
-   ldt_entry.read_exec_only = 0;
-   ldt_entry.limit_in_pages = 0;
-   ldt_entry.seg_not_present = 0;
--  stat = __modify_ldt (1, &ldt_entry, sizeof (ldt_entry));
-+  /* System call to set LDT entry.  */
-+  stat = syscall(SYS_modify_ldt, 1, &ldt_entry, sizeof (ldt_entry));
-   printf("stat = %d\n", stat);
- }
- 
--- 
-2.13.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
index a3637ea846e..fea3b00f62e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
@@ -1,7 +1,7 @@
-From f49f27f1bc67d07440b0ac9a7d767a8ea1589bfe Mon Sep 17 00:00:00 2001
+From e244a72c6f8803550f37e81f72bbae039651013b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 15 Dec 2015 15:50:44 +0200
-Subject: [PATCH 5/5] Modify vg_test wrapper to support PTEST formats
+Subject: [PATCH] Modify vg_test wrapper to support PTEST formats
 
 Change the valgrind regression test script vg_regtest to
 support the yocto ptest stdout reporting format.  The commit adds
@@ -25,11 +25,11 @@ Increase time limit to 90 s.
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
- tests/vg_regtest.in | 75 +++++++++++++++++++++++++++++++++++++++--------------
+ tests/vg_regtest.in | 75 +++++++++++++++++++++++++++++++++------------
  1 file changed, 55 insertions(+), 20 deletions(-)
 
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index a441f42..cb05b52 100755
+index ad18800..e4bd8cb 100755
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
 @@ -47,6 +47,7 @@
@@ -49,7 +49,7 @@ index a441f42..cb05b52 100755
       . "   Use EXTRA_REGTEST_OPTS to supply extra args for all tests\n"
       . "\n";
  
-@@ -186,6 +187,7 @@ my $outer_args;
+@@ -187,6 +188,7 @@ my $run_outer_args = "";
  my $valgrind_lib = "$tests_dir/.in_place";
  my $keepunfiltered = 0;
  my $looptillfail = 0;
@@ -57,7 +57,7 @@ index a441f42..cb05b52 100755
  
  # default filter is the one named "filter_stderr" in the test's directory
  my $default_stderr_filter = "filter_stderr";
-@@ -244,6 +246,8 @@ sub process_command_line()
+@@ -245,6 +247,8 @@ sub process_command_line()
                  $keepunfiltered = 1;
              } elsif ($arg =~ /^--loop-till-fail$/) {
                  $looptillfail = 1;
@@ -66,7 +66,7 @@ index a441f42..cb05b52 100755
              } else {
                  die $usage;
              }
-@@ -365,13 +369,28 @@ sub read_vgtest_file($)
+@@ -376,13 +380,28 @@ sub read_vgtest_file($)
  #----------------------------------------------------------------------------
  # Since most of the program time is spent in system() calls, need this to
  # propagate a Ctrl-C enabling us to quit.
@@ -100,7 +100,7 @@ index a441f42..cb05b52 100755
  # if $keepunfiltered, copies $1 to $1.unfiltered.out
  # renames $0 tp $1
  sub filtered_rename($$) 
-@@ -419,23 +438,25 @@ sub do_diffs($$$$)
+@@ -430,23 +449,25 @@ sub do_diffs($$$$)
                  # A match;  remove .out and any previously created .diff files.
                  unlink("$name.$mid.out");
                  unlink(<$name.$mid.diff*>);
@@ -128,7 +128,7 @@ index a441f42..cb05b52 100755
      $vgtest =~ /^(.*)\.vgtest/;
      my $name = $1;
      my $fullname = "$dir/$name"; 
-@@ -454,7 +475,11 @@ sub do_one_test($$)
+@@ -465,7 +486,11 @@ sub do_one_test($$)
          } elsif (256 == $prereq_res) {
              # Nb: weird Perl-ism -- exit code of '1' is seen by Perl as 256...
              # Prereq failed, skip.
@@ -141,7 +141,7 @@ index a441f42..cb05b52 100755
              return;
          } else {
              # Bad prereq; abort.
-@@ -472,7 +497,7 @@ sub do_one_test($$)
+@@ -483,7 +508,7 @@ sub do_one_test($$)
          }
          # If there is a progB, let's start it in background:
          printf("%-16s valgrind $extraopts $vgopts $prog $args (progB: $progB $argsB)\n",
@@ -150,7 +150,7 @@ index a441f42..cb05b52 100755
          # progB.done used to detect child has finished. See below.
          # Note: redirection of stdout and stderr is before $progB to allow argsB
          # to e.g. redirect stdoutB to stderrB
-@@ -488,7 +513,8 @@ sub do_one_test($$)
+@@ -499,7 +524,8 @@ sub do_one_test($$)
                       . "touch progB.done)  &");
          }
      } else {
@@ -160,7 +160,7 @@ index a441f42..cb05b52 100755
      }
  
      # Collect environment variables, if any.
-@@ -529,7 +555,7 @@ sub do_one_test($$)
+@@ -540,7 +566,7 @@ sub do_one_test($$)
      # Find all the .stdout.exp files.  If none, use /dev/null.
      my @stdout_exps = <$name.stdout.exp*>;
      @stdout_exps = ( "/dev/null" ) if (0 == scalar @stdout_exps);
@@ -169,7 +169,7 @@ index a441f42..cb05b52 100755
  
      # Filter stderr
      $stderr_filter_args = $name if (! defined $stderr_filter_args);
-@@ -538,7 +564,7 @@ sub do_one_test($$)
+@@ -549,7 +575,7 @@ sub do_one_test($$)
      # Find all the .stderr.exp files.  At least one must exist.
      my @stderr_exps = <$name.stderr.exp*>;
      (0 != scalar @stderr_exps) or die "Could not find `$name.stderr.exp*'\n";
@@ -178,7 +178,7 @@ index a441f42..cb05b52 100755
  
      if (defined $progB) {
          # wait for the child to be finished
-@@ -562,7 +588,7 @@ sub do_one_test($$)
+@@ -573,7 +599,7 @@ sub do_one_test($$)
          # Find all the .stdoutB.exp files.  If none, use /dev/null.
          my @stdoutB_exps = <$name.stdoutB.exp*>;
          @stdoutB_exps = ( "/dev/null" ) if (0 == scalar @stdoutB_exps);
@@ -187,7 +187,7 @@ index a441f42..cb05b52 100755
          
          # Filter stderr
          $stderrB_filter_args = $name if (! defined $stderrB_filter_args);
-@@ -571,7 +597,7 @@ sub do_one_test($$)
+@@ -582,7 +608,7 @@ sub do_one_test($$)
          # Find all the .stderrB.exp files.  At least one must exist.
          my @stderrB_exps = <$name.stderrB.exp*>;
          (0 != scalar @stderrB_exps) or die "Could not find `$name.stderrB.exp*'\n";
@@ -196,7 +196,7 @@ index a441f42..cb05b52 100755
      }
  
      # Maybe do post-test check
-@@ -583,7 +609,7 @@ sub do_one_test($$)
+@@ -594,7 +620,7 @@ sub do_one_test($$)
  	    # Find all the .post.exp files.  If none, use /dev/null.
  	    my @post_exps = <$name.post.exp*>;
  	    @post_exps = ( "/dev/null" ) if (0 == scalar @post_exps);
@@ -205,7 +205,7 @@ index a441f42..cb05b52 100755
  	}
      }
   
-@@ -592,6 +618,13 @@ sub do_one_test($$)
+@@ -603,6 +629,13 @@ sub do_one_test($$)
              print("(cleanup operation failed: $cleanup)\n");
      }
  
@@ -219,25 +219,25 @@ index a441f42..cb05b52 100755
      $num_tests_done++;
  }
  
-@@ -631,7 +664,7 @@ sub test_one_dir($$)
-     my $found_tests = (0 != (grep { $_ =~ /\.vgtest$/ } @fs));
+@@ -643,7 +676,7 @@ sub test_one_dir($$)
  
+     my $tests_start_time = time;
      if ($found_tests) {
 -        print "-- Running  tests in $full_dir $dashes\n";
 +        print "-- Running  tests in $full_dir $dashes\n" if ($yoctoptest == 0);
      }
      foreach my $f (@fs) {
          if (-d $f) {
-@@ -641,7 +674,7 @@ sub test_one_dir($$)
-         }
-     }
-     if ($found_tests) {
--        print "-- Finished tests in $full_dir $dashes\n";
+@@ -657,7 +690,7 @@ sub test_one_dir($$)
+         my $end_time = "(in $tests_cost_time sec)";
+         my $end_dashes = "-" x (50 - (length $full_dir)
+                                    - (length $end_time) - 1);
+-        print "-- Finished tests in $full_dir $end_time $end_dashes\n";
 +        print "-- Finished tests in $full_dir $dashes\n" if ($yoctoptest == 0);
      }
  
      chdir("..");
-@@ -667,10 +700,12 @@ sub summarise_results
+@@ -683,10 +716,12 @@ sub summarise_results
             $num_failures{"stdout"},   plural($num_failures{"stdout"}),
             $num_failures{"stderrB"},  plural($num_failures{"stderrB"}),
             $num_failures{"stdoutB"},  plural($num_failures{"stdoutB"}),
@@ -253,5 +253,5 @@ index a441f42..cb05b52 100755
      print "\n";
  }
 -- 
-2.6.2
+2.30.2
 
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index db6867f6259..b9804e74516 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From d85cc45e0ddeda68adf594dead715964cb32d0e7 Mon Sep 17 00:00:00 2001
+From beaa5b64c60d501fa9cd59fdc563e5f5bccf6882 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
@@ -17,34 +17,13 @@ a better fix would need:
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
+
 ---
- cachegrind/cg_annotate.in | 2 +-
- cachegrind/cg_diff.in     | 2 +-
- massif/ms_print.in        | 2 +-
- perf/vg_perf.in           | 2 +-
- tests/vg_regtest.in       | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
+ massif/ms_print.in  | 2 +-
+ perf/vg_perf.in     | 2 +-
+ tests/vg_regtest.in | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/cachegrind/cg_annotate.in b/cachegrind/cg_annotate.in
-index fea114b..5e814fd 100644
---- a/cachegrind/cg_annotate.in
-+++ b/cachegrind/cg_annotate.in
-@@ -1,4 +1,4 @@
--#! @PERL@
-+#! /usr/bin/perl
- 
- ##--------------------------------------------------------------------##
- ##--- Cachegrind's annotator.                       cg_annotate.in ---##
-diff --git a/cachegrind/cg_diff.in b/cachegrind/cg_diff.in
-index 9d9258e..d0f0ec7 100755
---- a/cachegrind/cg_diff.in
-+++ b/cachegrind/cg_diff.in
-@@ -1,4 +1,4 @@
--#! @PERL@
-+#! /usr/bin/perl
- 
- ##--------------------------------------------------------------------##
- ##--- Cachegrind's differencer.                         cg_diff.in ---##
 diff --git a/massif/ms_print.in b/massif/ms_print.in
 index a206ce4..df1bc31 100755
 --- a/massif/ms_print.in
@@ -66,7 +45,7 @@ index 90ee1d2..c585096 100644
  ##--- Valgrind performance testing script                  vg_perf ---##
  ##--------------------------------------------------------------------##
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index 0fe6341..1b45eb7 100755
+index 7152765..ad18800 100755
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
 @@ -1,4 +1,4 @@
@@ -75,6 +54,3 @@ index 0fe6341..1b45eb7 100755
  ##--------------------------------------------------------------------##
  ##--- Valgrind regression testing script                vg_regtest ---##
  ##--------------------------------------------------------------------##
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
similarity index 92%
rename from meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
index 4ea173ba803..cf50a2a4386 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
@@ -27,9 +27,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
            file://0002-context-APIs-are-not-available-on-musl.patch \
            file://0003-correct-include-directive-path-for-config.h.patch \
-           file://0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch \
-           file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch \
-           file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch \
            file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
            file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
            file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
@@ -38,9 +35,9 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://s390x_vec_op_t.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
-           file://0001-drd-tests-Include-missing-cstdint.patch \
+           file://0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch \
            "
-SRC_URI[sha256sum] = "8536c031dbe078d342f121fa881a9ecd205cb5a78e639005ad570011bdb9f3c6"
+SRC_URI[sha256sum] = "10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
@@ -207,13 +204,6 @@ do_install_ptest() {
 	\) \
         -exec rm {} \;
 
-    # These files need to be newer so touch them.
-    touch ${D}${PTEST_PATH}/cachegrind/tests/a.c -r ${D}${PTEST_PATH}/cachegrind/tests/cgout-test
-
-    # find *_annotate in ${bindir} for yocto build
-    sed -i s:\.\./\.\./cachegrind/cg_annotate:${bindir}/cg_annotate: ${D}${PTEST_PATH}/cachegrind/tests/ann1.vgtest
-    sed -i s:\.\./\.\./cachegrind/cg_annotate:${bindir}/cg_annotate: ${D}${PTEST_PATH}/cachegrind/tests/ann2.vgtest
-
     sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann1.vgtest
     sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann2.vgtest
 
-- 
2.30.2


