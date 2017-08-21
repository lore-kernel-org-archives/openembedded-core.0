Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12FA478358
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:00:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7L80jJ0008149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 01:00:46 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 01:00:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 01:00:41 -0700
Message-ID: <3fe1bcb6c788483eace461d0ab5416dfe23238d8.1503302375.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503302375.git.liezhi.yang@windriver.com>
References: <cover.1503302375.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] strace: 4.17 -> 4.18
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Aug 2017 08:00:45 -0000
Content-Type: text/plain

- Updated update-gawk-paths.patch.
- Updated Makefile-ptest.patch
- Removed 0008-replace-struct-ucontext-with-ucontext_t.patch which is already in
  the source.
- The LIC_FILES_CHKSUM is changed because the years have been updated,
  the contents are the same.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...8-replace-struct-ucontext-with-ucontext_t.patch | 31 ------------
 .../strace/strace/Makefile-ptest.patch             |  2 +-
 .../strace/strace/update-gawk-paths.patch          | 58 +++++++++++-----------
 .../strace/{strace_4.17.bb => strace_4.18.bb}      |  7 ++-
 4 files changed, 33 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
 rename meta/recipes-devtools/strace/{strace_4.17.bb => strace_4.18.bb} (83%)

diff --git a/meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch b/meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
deleted file mode 100644
index 1985d81..0000000
--- a/meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 07f71a12cb88919c6113284fc43bf4967e5e2bc1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 28 Jun 2017 11:36:57 -0700
-Subject: [PATCH 8/8] replace struct ucontext with ucontext_t
-
-glibc >= 2.26 has dropped the tag struct ucontext
-from ucontext_t type
-
-Upstream-Status: Submitted
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- linux/arm/arch_sigreturn.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/linux/arm/arch_sigreturn.c b/linux/arm/arch_sigreturn.c
-index b60dad8..a2b7100 100644
---- a/linux/arm/arch_sigreturn.c
-+++ b/linux/arm/arch_sigreturn.c
-@@ -9,7 +9,7 @@ arch_sigreturn(struct tcb *tcp)
- #ifdef AARCH64
- 		tcp->currpers == 0 ?
- 			(*aarch64_sp_ptr + SIZEOF_STRUCT_SIGINFO +
--			 offsetof(struct ucontext, uc_sigmask)) :
-+			 offsetof(ucontext_t, uc_sigmask)) :
- #endif
- 			(*arm_sp_ptr +
- 			 OFFSETOF_STRUCT_UCONTEXT_UC_SIGMASK);
--- 
-2.13.2
-
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 07ea0b3..97bcc90 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -51,7 +51,7 @@ index 5aa7f89..a55a355 100644
 +		install $(srcdir)/$$file $(DESTDIR)/$(TESTDIR); \
 +		sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
 +	done
-+	for i in net net-fd scm_rights-fd sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
++	for i in net scm_rights-fd rt_sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
 -- 
 2.13.2
 
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index 94ee53c..f6ffa8e 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -12,20 +12,20 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
- mpers.awk                | 2 +-
- tests-m32/caps.awk       | 2 +-
- tests-m32/match.awk      | 2 +-
- tests-m32/sigaction.awk  | 2 +-
- tests-mx32/caps.awk      | 2 +-
- tests-mx32/match.awk     | 2 +-
- tests-mx32/sigaction.awk | 2 +-
- tests/caps.awk           | 2 +-
- tests/match.awk          | 2 +-
- tests/sigaction.awk      | 2 +-
+ mpers.awk                   | 2 +-
+ tests-m32/caps.awk          | 2 +-
+ tests-m32/match.awk         | 2 +-
+ tests-m32/rt_sigaction.awk  | 2 +-
+ tests-mx32/caps.awk         | 2 +-
+ tests-mx32/match.awk        | 2 +-
+ tests-mx32/rt_sigaction.awk | 2 +-
+ tests/caps.awk              | 2 +-
+ tests/match.awk             | 2 +-
+ tests/rt_sigaction.awk      | 2 +-
  10 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/mpers.awk b/mpers.awk
-index 99248c5..ff10520 100644
+index fe54763..b5238a8 100644
 --- a/mpers.awk
 +++ b/mpers.awk
 @@ -1,4 +1,4 @@
@@ -35,7 +35,7 @@ index 99248c5..ff10520 100644
  # Copyright (c) 2015 Elvira Khabirova <lineprinter0@gmail.com>
  # Copyright (c) 2015-2016 Dmitry V. Levin <ldv@altlinux.org>
 diff --git a/tests-m32/caps.awk b/tests-m32/caps.awk
-index 67003ac..a66f1f0 100644
+index c6e31ef..5efc6cc 100644
 --- a/tests-m32/caps.awk
 +++ b/tests-m32/caps.awk
 @@ -1,4 +1,4 @@
@@ -54,18 +54,18 @@ index abfbae9..f2740bf 100644
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
  # All rights reserved.
-diff --git a/tests-m32/sigaction.awk b/tests-m32/sigaction.awk
-index 5c6b6d0..3e14464 100644
---- a/tests-m32/sigaction.awk
-+++ b/tests-m32/sigaction.awk
+diff --git a/tests-m32/rt_sigaction.awk b/tests-m32/rt_sigaction.awk
+index 9c3a9ed..8414243 100644
+--- a/tests-m32/rt_sigaction.awk
++++ b/tests-m32/rt_sigaction.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
- # All rights reserved.
+ # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
 diff --git a/tests-mx32/caps.awk b/tests-mx32/caps.awk
-index 67003ac..a66f1f0 100644
+index c6e31ef..5efc6cc 100644
 --- a/tests-mx32/caps.awk
 +++ b/tests-mx32/caps.awk
 @@ -1,4 +1,4 @@
@@ -84,18 +84,18 @@ index abfbae9..f2740bf 100644
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
  # All rights reserved.
-diff --git a/tests-mx32/sigaction.awk b/tests-mx32/sigaction.awk
-index 5c6b6d0..3e14464 100644
---- a/tests-mx32/sigaction.awk
-+++ b/tests-mx32/sigaction.awk
+diff --git a/tests-mx32/rt_sigaction.awk b/tests-mx32/rt_sigaction.awk
+index 9c3a9ed..8414243 100644
+--- a/tests-mx32/rt_sigaction.awk
++++ b/tests-mx32/rt_sigaction.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
- # All rights reserved.
+ # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
 diff --git a/tests/caps.awk b/tests/caps.awk
-index 67003ac..a66f1f0 100644
+index c6e31ef..5efc6cc 100644
 --- a/tests/caps.awk
 +++ b/tests/caps.awk
 @@ -1,4 +1,4 @@
@@ -114,13 +114,13 @@ index abfbae9..f2740bf 100644
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
  # All rights reserved.
-diff --git a/tests/sigaction.awk b/tests/sigaction.awk
-index 5c6b6d0..3e14464 100644
---- a/tests/sigaction.awk
-+++ b/tests/sigaction.awk
+diff --git a/tests/rt_sigaction.awk b/tests/rt_sigaction.awk
+index 9c3a9ed..8414243 100644
+--- a/tests/rt_sigaction.awk
++++ b/tests/rt_sigaction.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
- # All rights reserved.
+ # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
diff --git a/meta/recipes-devtools/strace/strace_4.17.bb b/meta/recipes-devtools/strace/strace_4.18.bb
similarity index 83%
rename from meta/recipes-devtools/strace/strace_4.17.bb
rename to meta/recipes-devtools/strace/strace_4.18.bb
index 72fa994..bbb82a9 100644
--- a/meta/recipes-devtools/strace/strace_4.17.bb
+++ b/meta/recipes-devtools/strace/strace_4.18.bb
@@ -2,7 +2,7 @@ SUMMARY = "System call tracing tool"
 HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=488acb3aaaf5d14a2e1a852d13668a70"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f132b4d2adfccc63da4139a609367711"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://disable-git-version-gen.patch \
@@ -13,11 +13,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
-           file://0008-replace-struct-ucontext-with-ucontext_t.patch \
            "
 
-SRC_URI[md5sum] = "8d7eb10eba68bad83a269197e634b626"
-SRC_URI[sha256sum] = "81f35b085fbb3cfa806eb521a8522ac3406deaccfe121ce35064bad268237419"
+SRC_URI[md5sum] = "3579b3266bb096cebaefbe2cdb1a3a78"
+SRC_URI[sha256sum] = "89ad887c1e6226bdbca8da31d589cadea4be0744b142eb47b768086c937fca08"
 
 inherit autotools ptest bluetooth
 
-- 
2.10.2


