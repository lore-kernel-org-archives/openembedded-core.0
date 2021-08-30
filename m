Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.1312.1630349290752790322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 11:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ASlWugYJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so133683wme.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 11:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fdJXp24qlP7yTNPCJ2e0fmdZalzGqY8jrSTYg0wWtr8=;
        b=ASlWugYJCJF8CTWDRL8FJnjnFPXDaJjCgUJht/o2mXFUx0YuuRQjVFZlUFH2i+yOih
         pAmNFlNYfHBZHgO9fikx/2qVyyJms/w7nlh7+DcIDgQty0FeB+pd2WP8FlicxqYR1WJI
         +DTk7anr5S7OVHdJcAMNT0be1eE16llypJ3LjnXqUjTwRubtGl9CY1y0/SUwTA9XXsd0
         6btH3SeoGQRb4W+nfXBP+tfxUgx7zOzMUcydAJjTxpAPvyklxpOrIN31C+X8SNY2ulc8
         29iua1+xghT0URrdeUATi9zTa/C4N8pGDXlqoBhpcPX7wf84CzLjQeQA9MGRce1Kghrk
         dz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdJXp24qlP7yTNPCJ2e0fmdZalzGqY8jrSTYg0wWtr8=;
        b=Sp567r0dFJVcVAGGcWkl6JgET0mo4ppCk8hiC5pmWciKO+FnOq92QmoaycRhjU3l0e
         49DKbWKni1t0vtSwg9WaL5OJmIo47N5uZ65IbZ8+ohg39MpiDoBWEckyXbn/Wa7GXzTJ
         sDV/yvQ+6mpweOfHkLATHM1q3kkTJFaXHa33eVT9PtM88GVfdULvNQNcqzHOvAbgkz7v
         uBJatFfx2J4mxh6uwYDrSWDzvYRyATyYoUpWHiN/YJ31rSZxBBLjcXEQX0CCeyS4rSkr
         Jal12DDLvMXkL2kP1OKyUG7jiZbsoQnhvKlP0Qf8kJvJWKg7g934M7DlxmoiEgcOOzoD
         schw==
X-Gm-Message-State: AOAM5325BMU23CqsOXcuqPJrvXa5X2WFliTdTOV9rQS3TUHep7vWXmXc
	UPn+gOL1kdh9aTwby/ks/i7vRCaoQxX7dw==
X-Google-Smtp-Source: ABdhPJyg3RieKG6GJSsV/01XkyJKkq1/Wsz4TP+ExaNaMjRUsZ9NkvMz2mi3BtflFFJyGzQzUMyZfQ==
X-Received: by 2002:a05:600c:2101:: with SMTP id u1mr452493wml.45.1630349289076;
        Mon, 30 Aug 2021 11:48:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id e2sm18141487wrq.56.2021.08.30.11.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:48:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 3/7] rpm: update 4.16.1.3 -> 4.17.0
Date: Mon, 30 Aug 2021 20:47:56 +0200
Message-Id: <20210830184800.954770-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830184800.954770-1-alex.kanavin@gmail.com>
References: <20210830184800.954770-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flagship features are migration from bdb to sqlite and zstd support,
both are enabled and taken into use. The relationship and upstream preference
between sqlite and ndb formats isn't quite clear.

Lua is now a hard dependency.

Added packageconfig option for r/o support for bdb (that doesn't need bdb
itself), but not enabled it as upstream marks it EXPERIMENTAL in capital
letters.

Drop sed adjustment for a file that is not anymore installed.

Adjust oeqa test to check for sqlite database instead of bdb.

Drop
0001-Fix-build-with-musl-C-library.patch (nss support removed upstream)
0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
(difficult to undersand and rebase; obsolete with the move to zstd)
0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
(upstream made the same change)

Portions of 0001-tools-Add-error.h-for-non-glibc-case.patch dropped
(upstream moved the files to a separate component).

Added 0001-docs-do-not-build-manpages-requires-pandoc.patch to avoid
pandoc dependency.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py            |  6 +-
 ...lib-rpm-as-the-installation-path-for.patch | 14 ++--
 .../0001-Fix-build-with-musl-C-library.patch  | 22 -------
 ...o-not-build-manpages-requires-pandoc.patch | 26 ++++++++
 ...rict-virtual-memory-usage-if-limit-s.patch | 65 -------------------
 ...tools-Add-error.h-for-non-glibc-case.patch | 59 ++---------------
 ...hat-ELF-binaries-are-executable-to-b.patch | 33 ----------
 .../rpm/{rpm_4.16.1.3.bb => rpm_4.17.0.bb}    | 21 +++---
 8 files changed, 52 insertions(+), 194 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
 rename meta/recipes-devtools/rpm/{rpm_4.16.1.3.bb => rpm_4.17.0.bb} (91%)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 7a9d62c003..a4339116bf 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -116,12 +116,12 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
         Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
-        db_files_cmd = 'ls /var/lib/rpm/__db.*'
+        db_files_cmd = 'ls /var/lib/rpm/rpmdb.sqlite*'
         check_log_cmd = "grep RPM /var/log/messages | wc -l"
 
-        # Make sure that some database files are under /var/lib/rpm as '__db.xxx'
+        # Make sure that some database files are under /var/lib/rpm as 'rpmdb.sqlite'
         status, output = self.target.run(db_files_cmd)
-        msg =  'Failed to find database files under /var/lib/rpm/ as __db.xxx'
+        msg =  'Failed to find database files under /var/lib/rpm/ as rpmdb.sqlite'
         self.assertEqual(0, status, msg=msg)
 
         self.tc.target.copyTo(self.test_file, self.dst)
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index d8fcc16729..6d236ac400 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,4 +1,4 @@
-From 7b2dd83d8fcd06af8e583b53da79ed0033793d46 Mon Sep 17 00:00:00 2001
+From 8d013fe154a162305f76141151baf767dd04b598 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index fe35a90fa..b2faec6f3 100644
+index eb7d6941b..10a889b5d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -966,7 +966,7 @@ else
+@@ -871,7 +871,7 @@ else
      usrprefix=$prefix
  fi
  
@@ -27,10 +27,10 @@ index fe35a90fa..b2faec6f3 100644
  
  AC_SUBST(OBJDUMP)
 diff --git a/macros.in b/macros.in
-index 35c8cf9df..9d8b2825c 100644
+index a1f795e5f..689e784ef 100644
 --- a/macros.in
 +++ b/macros.in
-@@ -996,7 +996,7 @@ package or when debugging this package.\
+@@ -933,7 +933,7 @@ package or when debugging this package.\
  %_sharedstatedir	%{_prefix}/com
  %_localstatedir		%{_prefix}/var
  %_lib			lib
@@ -40,7 +40,7 @@ index 35c8cf9df..9d8b2825c 100644
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
 diff --git a/rpm.am b/rpm.am
-index 8e1dc2184..3d889ec86 100644
+index 7b57f433b..9bbb9ee96 100644
 --- a/rpm.am
 +++ b/rpm.am
 @@ -1,10 +1,10 @@
@@ -55,4 +55,4 @@ index 8e1dc2184..3d889ec86 100644
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 10:3:1
+ rpm_version_info = 11:0:2
diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
deleted file mode 100644
index b960da6c31..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From d076de030deb9cafd9b2e82be5d506cebdefad0b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 27 Feb 2017 14:43:21 +0200
-Subject: [PATCH 1/9] Fix build with musl C library.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- configure.ac       | 3 ++-
- rpmio/digest_nss.c | 1 +
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
---- a/rpmio/digest_nss.c
-+++ b/rpmio/digest_nss.c
-@@ -1,5 +1,6 @@
- #include "system.h"
- 
-+#include <signal.h>
- #include <pthread.h>
- #include <nss.h>
- #include <sechash.h>
diff --git a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch b/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
new file mode 100644
index 0000000000..ced52d1007
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
@@ -0,0 +1,26 @@
+From 9bf1693092385eba9841614613313010221ca01f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 29 Jun 2021 20:11:26 +0200
+Subject: [PATCH] docs: do not build manpages (requires pandoc)
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ docs/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/docs/Makefile.am b/docs/Makefile.am
+index 5a6bd203a..6257767fd 100644
+--- a/docs/Makefile.am
++++ b/docs/Makefile.am
+@@ -1,7 +1,5 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-SUBDIRS = man
+-
+ EXTRA_DIST =
+ 
+ EXTRA_DIST += \
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
deleted file mode 100644
index 6454785254..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 0066b862bb3a09f39295abd5d972a53ac8dc1555 Mon Sep 17 00:00:00 2001
-From: Peter Bergin <peter@berginkonsult.se>
-Date: Wed, 19 Sep 2018 15:12:31 +0200
-Subject: [PATCH] rpm/rpmio.c: restrict virtual memory usage if limit set
-
-A solution to avoid OOM situation when the virtual memory is restricted
-for a user (ulimit -v). As the lzopen_internal function is run in parallel
-one instance per CPU thread the available virtual memory is limited per
-CPU thread.
-
-Upstream-Status: Pending [merge of multithreading patches to upstream]
-
-Signed-off-by: Peter Bergin <peter@berginkonsult.se>
----
- rpmio/rpmio.c | 34 ++++++++++++++++++++++++++++++++++
- 1 file changed, 34 insertions(+)
-
-diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
-index e051c98..b3c56b6 100644
---- a/rpmio/rpmio.c
-+++ b/rpmio/rpmio.c
-@@ -845,6 +845,40 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
- 		}
- #endif
- 
-+		struct rlimit virtual_memory;
-+		getrlimit(RLIMIT_AS, &virtual_memory);
-+		if (virtual_memory.rlim_cur != RLIM_INFINITY) {
-+			const uint64_t virtual_memlimit = virtual_memory.rlim_cur;
-+			const uint64_t virtual_memlimit_per_cpu_thread =
-+				virtual_memlimit / lzma_cputhreads();
-+			uint64_t memory_usage_virt;
-+			rpmlog(RPMLOG_NOTICE, "XZ: virtual memory restricted to %lu and "
-+			       "per CPU thread %lu\n", virtual_memlimit, virtual_memlimit_per_cpu_thread);
-+			/* keep reducing the number of compression threads until memory
-+			   usage falls below the limit per CPU thread*/
-+			while ((memory_usage_virt = lzma_stream_encoder_mt_memusage(&mt_options)) >
-+			       virtual_memlimit_per_cpu_thread) {
-+				/* If number of threads goes down to zero lzma_stream_encoder will
-+				 * will return UINT64_MAX. We must check here to avoid an infinite loop.
-+				 * If we get into situation that one thread requires more virtual memory
-+				 * than available we set one thread, print error message and try anyway. */
-+				if (--mt_options.threads == 0) {
-+					mt_options.threads = 1;
-+					rpmlog(RPMLOG_WARNING,
-+					       "XZ: Could not adjust number of threads to get below "
-+					       "virtual memory limit %lu. usage %lu\n",
-+					       virtual_memlimit_per_cpu_thread, memory_usage_virt);
-+					break;
-+				}
-+			}
-+			if (threads != (int)mt_options.threads)
-+				rpmlog(RPMLOG_NOTICE,
-+				       "XZ: Adjusted the number of threads from %d to %d to not "
-+				       "exceed the memory usage limit of %lu bytes\n",
-+				       threads, mt_options.threads, virtual_memlimit);
-+
-+		}
-+
- 		ret = lzma_stream_encoder_mt(&lzfile->strm, &mt_options);
- 	    }
- #endif
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
index e78514b814..9783396639 100644
--- a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
+++ b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
@@ -1,4 +1,4 @@
-From b3952bd5e28f2a4d86c7377de239db8fa7237e14 Mon Sep 17 00:00:00 2001
+From 9b9d717f484ec913cdd3804e43489b3dc18bd77c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 31 Oct 2020 22:14:05 -0700
 Subject: [PATCH] tools: Add error.h for non-glibc case
@@ -9,40 +9,15 @@ upstream given that elfutils has been closely tied to glibc
 Upstream-Status: Inappropriate [workaround for musl]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- tools/debugedit.c      |  6 +++++-
- tools/elfdeps.c        |  6 +++++-
- tools/error.h          | 27 +++++++++++++++++++++++++++
- tools/sepdebugcrcfix.c |  6 +++++-
- 4 files changed, 42 insertions(+), 3 deletions(-)
+ tools/elfdeps.c |  6 +++++-
+ tools/error.h   | 27 +++++++++++++++++++++++++++
+ 2 files changed, 32 insertions(+), 1 deletion(-)
  create mode 100644 tools/error.h
 
-diff --git a/tools/debugedit.c b/tools/debugedit.c
-index 9f8dcd0fb..852f46073 100644
---- a/tools/debugedit.c
-+++ b/tools/debugedit.c
-@@ -26,7 +26,6 @@
- #include <byteswap.h>
- #include <endian.h>
- #include <errno.h>
--#include <error.h>
- #include <limits.h>
- #include <string.h>
- #include <stdlib.h>
-@@ -40,6 +39,11 @@
- 
- #include <gelf.h>
- #include <dwarf.h>
-+#ifdef __GLIBC__
-+#include <error.h>
-+#else
-+#include "error.h"
-+#endif
- 
- 
- /* Unfortunately strtab manipulation functions were only officially added
 diff --git a/tools/elfdeps.c b/tools/elfdeps.c
-index 6d9094874..f69e60997 100644
+index d205935bb..3a8945b33 100644
 --- a/tools/elfdeps.c
 +++ b/tools/elfdeps.c
 @@ -5,10 +5,14 @@
@@ -94,25 +69,3 @@ index 000000000..ef06827a0
 +}
 +
 +#endif	/* _ERROR_H_ */
-diff --git a/tools/sepdebugcrcfix.c b/tools/sepdebugcrcfix.c
-index fba460014..2be9c1fd8 100644
---- a/tools/sepdebugcrcfix.c
-+++ b/tools/sepdebugcrcfix.c
-@@ -29,9 +29,13 @@
- #include <endian.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <error.h>
- #include <libelf.h>
- #include <gelf.h>
-+#ifdef __GLIBC__
-+#include <error.h>
-+#else
-+#include "error.h"
-+#endif
- 
- #ifndef _
- #define _(x) x
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch b/meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
deleted file mode 100644
index 4ac5c38f06..0000000000
--- a/meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5141d50d7b3d3c209a22c53deedb4ceef014401d Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Mon, 15 May 2017 10:21:08 +0200
-Subject: [PATCH 09/15] Do not require that ELF binaries are executable to be
- identifiable
-
-There is nothing that requires, e.g., a DSO to be executable, but it
-is still an ELF binary and should be identified as such.
-
-Upstream probably expects all ELF binaries to be marked as executable,
-but rather than imposing such a limitation for OE, allow any file to
-be identified as an ELF binary regardless of whether it is executable
-or not.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-
----
- fileattrs/elf.attr | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/fileattrs/elf.attr b/fileattrs/elf.attr
-index 5805dd0ee..3516f309d 100644
---- a/fileattrs/elf.attr
-+++ b/fileattrs/elf.attr
-@@ -1,4 +1,3 @@
- %__elf_provides		%{_rpmconfigdir}/elfdeps --provides %{?__filter_GLIBC_PRIVATE:--filter-private}
- %__elf_requires		%{_rpmconfigdir}/elfdeps --requires %{?__filter_GLIBC_PRIVATE:--filter-private}
- %__elf_magic		^(setuid,? )?(setgid,? )?(sticky )?ELF (32|64)-bit.*$
--%__elf_flags		exeonly
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.17.0.bb
similarity index 91%
rename from meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
rename to meta/recipes-devtools/rpm/rpm_4.17.0.bb
index 189da92436..6bb3700a6e 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.17.0.bb
@@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x \
            file://environment.d-rpm.sh \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
@@ -32,22 +32,20 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
            file://0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch \
            file://0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch \
            file://0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch \
-           file://0001-Fix-build-with-musl-C-library.patch \
            file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
-           file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
            file://0001-perl-disable-auto-reqs.patch \
-           file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
            file://0001-tools-Add-error.h-for-non-glibc-case.patch \
+           file://0001-docs-do-not-build-manpages-requires-pandoc.patch \
            "
 
 PE = "1"
-SRCREV = "3659b8a04f5b8bacf6535e0124e7fe23f15286bd"
+SRCREV = "bcb9baf088f895d623755539a7aa0b5d01f475dc"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libgcrypt file popt xz bzip2 elfutils python3"
+DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
 
 inherit autotools gettext pkgconfig python3native
@@ -58,7 +56,7 @@ AUTOTOOLS_AUXDIR = "${S}/build-aux"
 # OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
 EXTRA_AUTORECONF:append = " --exclude=gnu-configize"
 
-EXTRA_OECONF:append = " --without-lua --enable-python --with-crypto=libgcrypt"
+EXTRA_OECONF:append = " --enable-python --with-crypto=libgcrypt"
 EXTRA_OECONF:append:libc-musl = " --disable-nls --disable-openmp"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
@@ -70,15 +68,18 @@ EXTRA_OECONF:append:class-nativesdk = " --sysconfdir=/etc --disable-plugins"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGECONFIG ??= "bdb ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'inhibit', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'inhibit', '', d)} sqlite zstd"
 # The inhibit plugin serves no purpose outside of the target
 PACKAGECONFIG:remove:class-native = "inhibit"
 PACKAGECONFIG:remove:class-nativesdk = "inhibit"
 
-PACKAGECONFIG[bdb] = "--enable-bdb,--disable-bdb,db"
 PACKAGECONFIG[imaevm] = "--with-imaevm,,ima-evm-utils"
 PACKAGECONFIG[inhibit] = "--enable-inhibit-plugin,--disable-inhibit-plugin,dbus"
 PACKAGECONFIG[rpm2archive] = "--with-archive,--without-archive,libarchive"
+PACKAGECONFIG[sqlite] = "--enable-sqlite=yes,--enable-sqlite=no,sqlite3"
+PACKAGECONFIG[ndb] = "--enable-ndb,--disable-ndb"
+PACKAGECONFIG[bdb-ro] = "--enable-bdb-ro,--disable-bdb-ro"
+PACKAGECONFIG[zstd] = "--enable-zstd=yes,--enable-zstd=no,zstd"
 
 ASNEEDED = ""
 
@@ -136,8 +137,6 @@ do_install:append () {
 	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
 	    ${D}/${libdir}/rpm/macros
 
-	sed -i -e 's|/usr/bin/python|${USRBINPATH}/env ${PYTHON_PN}|' \
-	    ${D}${libdir}/rpm/pythondistdeps.py
 }
 
 FILES:${PN} += "${libdir}/rpm-plugins/*.so \
-- 
2.31.1

