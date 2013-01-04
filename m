Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Tr9QE-0001n6-QK
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 16:43:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jan 2013 07:26:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,411,1355126400"; d="scan'208";a="239962251"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 04 Jan 2013 07:26:45 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2013 17:29:54 +0200
Message-Id: <1357313394-28894-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] oprofile: updated to 0.9.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 15:43:14 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc          |    3 +-
 .../oprofile/oprofile/fix-bfd-include.patch        |   66 --------------------
 .../recipes-kernel/oprofile/oprofile/opstart.patch |   29 ++++-----
 meta/recipes-kernel/oprofile/oprofile_0.9.7.bb     |   11 ----
 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb     |   11 ++++
 5 files changed, 27 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/fix-bfd-include.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile_0.9.7.bb
 create mode 100644 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 23ddb14..9bbd2ef 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -19,12 +19,11 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-INC_PR = "r2"
+INC_PR = "r0"
 
 SRC_URI = "file://opstart.patch \
            file://oprofile-no-query-modules.patch \
            file://oprofile-root.patch \
-           file://fix-bfd-include.patch \
            file://acinclude.m4"
 
 inherit autotools
diff --git a/meta/recipes-kernel/oprofile/oprofile/fix-bfd-include.patch b/meta/recipes-kernel/oprofile/oprofile/fix-bfd-include.patch
deleted file mode 100644
index 944320f..0000000
--- a/meta/recipes-kernel/oprofile/oprofile/fix-bfd-include.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-bfd.h now wants to include autotools generated config.h for reasoning read
-http://sourceware.org/bugzilla/show_bug.cgi?id=14243
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: oprofile-0.9.7/libutil++/bfd_support.h
-===================================================================
---- oprofile-0.9.7.orig/libutil++/bfd_support.h	2011-07-04 19:25:04.000000000 -0700
-+++ oprofile-0.9.7/libutil++/bfd_support.h	2012-12-02 10:51:23.518784249 -0800
-@@ -11,6 +11,7 @@
- #ifndef BFD_SUPPORT_H
- #define BFD_SUPPORT_H
- 
-+#include "config.h"
- #include "utility.h"
- #include "op_types.h"
- #include "locate_images.h"
-Index: oprofile-0.9.7/libopagent/opagent.c
-===================================================================
---- oprofile-0.9.7.orig/libopagent/opagent.c	2011-07-04 19:25:04.000000000 -0700
-+++ oprofile-0.9.7/libopagent/opagent.c	2012-12-02 10:58:10.954804150 -0800
-@@ -50,6 +50,7 @@
-  *   See libopagent/Makefile.am for more information.
-  *******************************************************************/
- 
-+#include "config.h"
- #include <stdio.h>
- #include <errno.h>
- #include <string.h>
-Index: oprofile-0.9.7/libpp/symbol.h
-===================================================================
---- oprofile-0.9.7.orig/libpp/symbol.h	2011-07-04 19:25:04.000000000 -0700
-+++ oprofile-0.9.7/libpp/symbol.h	2012-12-02 10:59:59.434809273 -0800
-@@ -18,6 +18,7 @@
- #include "format_flags.h"
- #include "op_types.h"
- 
-+#include "config.h"
- #include <bfd.h>
- #include <stdint.h>
- 
-Index: oprofile-0.9.7/opjitconv/debug_line.c
-===================================================================
---- oprofile-0.9.7.orig/opjitconv/debug_line.c	2011-07-04 19:25:04.000000000 -0700
-+++ oprofile-0.9.7/opjitconv/debug_line.c	2012-12-02 11:02:26.046816339 -0800
-@@ -8,6 +8,7 @@
-  * @author Philippe Elie
-  */
- 
-+#include "config.h"
- #include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
-Index: oprofile-0.9.7/opjitconv/opjitconv.h
-===================================================================
---- oprofile-0.9.7.orig/opjitconv/opjitconv.h	2011-07-04 19:25:04.000000000 -0700
-+++ oprofile-0.9.7/opjitconv/opjitconv.h	2012-12-02 11:01:25.558813373 -0800
-@@ -26,6 +26,7 @@
- #define OP_JIT_CONV_ALREADY_DONE 5
- #define OP_JIT_CONV_TMPDIR_NOT_REMOVED 6
- 
-+#include "config.h"
- #include <bfd.h>
- #include <stddef.h>
- #include <sys/stat.h>
diff --git a/meta/recipes-kernel/oprofile/oprofile/opstart.patch b/meta/recipes-kernel/oprofile/oprofile/opstart.patch
index c588deb..0b181b10 100644
--- a/meta/recipes-kernel/oprofile/oprofile/opstart.patch
+++ b/meta/recipes-kernel/oprofile/oprofile/opstart.patch
@@ -1,17 +1,18 @@
-Upstream-Status: Pending
-
-Index: oprofile/utils/Makefile.am
-===================================================================
---- oprofile.orig/utils/Makefile.am	2005-03-31 18:20:41.000000000 +0100
-+++ oprofile/utils/Makefile.am	2008-07-02 15:14:07.000000000 +0100
-@@ -3,8 +3,15 @@
+diff --git a/utils/Makefile.am b/utils/Makefile.am
+index d34b060..dff15f9 100644
+--- oprofile.orig/utils/Makefile.am
++++ oprofile/utils/Makefile.am
+@@ -7,7 +7,7 @@ AM_LDFLAGS = @OP_LDFLAGS@
  
  LIBS=@POPT_LIBS@ @LIBERTY_LIBS@
  
--bin_PROGRAMS = ophelp
-+bin_PROGRAMS = ophelp opstart
+-bin_PROGRAMS = ophelp op-check-perfevents
++bin_PROGRAMS = ophelp op-check-perfevents opstart
  dist_bin_SCRIPTS = opcontrol
  
+ op_check_perfevents_SOURCES = op_perf_events_checker.c
+@@ -15,3 +15,10 @@ op_check_perfevents_CPPFLAGS = ${AM_CFLAGS} @PERF_EVENT_FLAGS@
+ 
  ophelp_SOURCES = ophelp.c
  ophelp_LDADD = ../libop/libop.a ../libutil/libutil.a
 +
@@ -19,8 +20,8 @@ Index: oprofile/utils/Makefile.am
 +
 +install-exec-local:
 +	cd $(DESTDIR)/$(bindir) && \
-+		rm -f opstop && \
-+		$(LN_S) opstart opstop
++	rm -f opstop && \
++	$(LN_S) opstart opstop
 Index: oprofile/utils/opstart.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
@@ -136,10 +137,10 @@ Index: oprofile/utils/opstart.c
 +	return 0;
 +}
 +
-Index: oprofile/configure.in
+Index: oprofile/configure.ac
 ===================================================================
---- oprofile.orig/configure.in	2008-07-02 15:13:58.000000000 +0100
-+++ oprofile/configure.in	2008-07-02 15:17:37.000000000 +0100
+--- oprofile.orig/configure.ac	2008-07-02 15:13:58.000000000 +0100
++++ oprofile/configure.ac	2008-07-02 15:17:37.000000000 +0100
 @@ -16,6 +16,7 @@
  AM_CONFIG_HEADER(config.h)
  
diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.7.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.7.bb
deleted file mode 100644
index d7e1511..0000000
--- a/meta/recipes-kernel/oprofile/oprofile_0.9.7.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require oprofile.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "8b5d1d9b65f84420bcc3234777ad3be3"
-SRC_URI[sha256sum] = "cb5b507d5dea058d223fcad3cec8ff9638a4163106afd66d176798bbd973d527"
-
-S = "${WORKDIR}/oprofile-${PV}"
-
diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
new file mode 100644
index 0000000..939c1ba
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
@@ -0,0 +1,11 @@
+require oprofile.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6d127023af1dd1cf24e15411229f3cc8"
+SRC_URI[sha256sum] = "ab45900fa1a23e5d5badf3c0a55f26c17efe6e184efcf00b371433751fa761bc"
+
+S = "${WORKDIR}/oprofile-${PV}"
+
-- 
1.7.10.4



