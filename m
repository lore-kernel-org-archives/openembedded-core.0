Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 660CC7199D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945703"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:21 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:33:54 +0300
Message-Id: <48338d351b177d89c5614c5ad508e7de55dc8c01.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/50] libpfm4: remove the recipe
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:21 -0000

It was required only by oprofile.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch | 31 ------------------
 .../files/fix-misleading-indentation-error.patch   | 38 ----------------------
 meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb        | 33 -------------------
 3 files changed, 102 deletions(-)
 delete mode 100644 meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch
 delete mode 100644 meta/recipes-kernel/libpfm/files/fix-misleading-indentation-error.patch
 delete mode 100644 meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb

diff --git a/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch b/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch
deleted file mode 100644
index d59a7f7d88c..00000000000
--- a/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 272a8a069a8f5f06a1e5dfa0ef12f5f92984728b Mon Sep 17 00:00:00 2001
-From: Noor <noor_ahsan@mentor.com>
-Date: Wed, 12 Aug 2015 20:54:00 +0500
-Subject: [PATCH] Makefile: Add LDFLAGS variable to SLDFLAGS.
-
-* Add LDFLAGS variable to SLDFLAGS so that extra linker
-  flags can be sent via this variable.
-
-Upstream-Status: Submitted [perfmon2-libpfm4-commits@lists.sourceforge.net]
-
-Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
----
- lib/Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/Makefile b/lib/Makefile
-index 1cc8765..4bd92ef 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -187,7 +187,7 @@ CFLAGS += -DCONFIG_PFMLIB_CELL
- endif
- 
- ifeq ($(SYS),Linux)
--SLDFLAGS=-shared -Wl,-soname -Wl,$(VLIBPFM)
-+SLDFLAGS=$(LDFLAGS) -shared -Wl,-soname -Wl,$(VLIBPFM)
- SLIBPFM=libpfm.so.$(VERSION).$(REVISION).$(AGE)
- VLIBPFM=libpfm.so.$(VERSION)
- SOLIBEXT=so
--- 
-1.7.9.5
-
diff --git a/meta/recipes-kernel/libpfm/files/fix-misleading-indentation-error.patch b/meta/recipes-kernel/libpfm/files/fix-misleading-indentation-error.patch
deleted file mode 100644
index 25d47ef1255..00000000000
--- a/meta/recipes-kernel/libpfm/files/fix-misleading-indentation-error.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Pending
-
-Fix compile error:
-
-| syst_count.c:346:3: error: this 'for' clause does not guard... [-Werror=misleading-indentation] 
-|    for(c=cmin ; c < cmax; c++) 
-|       ^~~ 
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/perf_examples/syst_count.c b/perf_examples/syst_count.c
-index 0d53078..2dfb9b9 100644
---- a/perf_examples/syst_count.c
-+++ b/perf_examples/syst_count.c
-@@ -343,8 +343,9 @@ measure(void)
- 
- 		for (delay = 1 ; delay <= options.delay; delay++) {
- 
--		for(c=cmin ; c < cmax; c++)
--			start_cpu(c);
-+			for(c=cmin ; c < cmax; c++) {
-+				start_cpu(c);
-+			}
- 
- 			if (0) {
- 				tv.tv_sec = 0;
-@@ -353,8 +354,9 @@ measure(void)
- 			} else
- 				sleep(1);
- 
--		for(c=cmin ; c < cmax; c++)
--			stop_cpu(c);
-+			for(c=cmin ; c < cmax; c++) {
-+				stop_cpu(c);
-+			}
- 
- 			for(c = cmin; c < cmax; c++) {
- 				printf("# %'ds -----\n", delay);
diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
deleted file mode 100644
index 4136eac81f7..00000000000
--- a/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Monitoring tools exploiting the performance monitoring events"
-DESCRIPTION = "This package provides a library, called libpfm4 which is used to develop \
-monitoring tools exploiting the performance monitoring events such as those \
-provided by the Performance Monitoring Unit (PMU) of modern processors."
-HOMEPAGE = "http://perfmon2.sourceforge.net/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=144822&atid=759953&source=navbar"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0de488f3bd4424e308e2e399cb99c788"
-
-SECTION = "devel"
-
-COMPATIBLE_HOST = "powerpc64"
-
-SRC_URI = "http://downloads.sourceforge.net/project/perfmon2/${BPN}/libpfm-${PV}.tar.gz \
-           file://0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch \
-           file://fix-misleading-indentation-error.patch \
-          "
-
-SRC_URI[md5sum] = "5077b9022440e4951d96f2d0e73bd487"
-SRC_URI[sha256sum] = "5ab1e5b0472550f9037a8800834f6bc3b927690070f69fac0b67284b4b05fd5f"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
-
-EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LIBDIR=\"${libdir}\" LDCONFIG=\"true\""
-EXTRA_OEMAKE_append_powerpc = " ARCH=\"powerpc\""
-EXTRA_OEMAKE_append_powerpc64 = " ARCH=\"powerpc\" BITMODE=\"64\""
-
-S = "${WORKDIR}/libpfm-${PV}"
-
-do_install () {
-	oe_runmake install
-}
-- 
2.14.1


