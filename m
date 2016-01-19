Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EB0FA6011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 22:05:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 14:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="730631594"
Received: from aganesha-mobl2.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.254.22.203])
	by orsmga003.jf.intel.com with ESMTP; 19 Jan 2016 14:05:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 19 Jan 2016 14:05:11 -0800
Message-Id: <1453241111-3103-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] udev: Add 2 patches to support 4.4 kernel
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
X-List-Received-Date: Tue, 19 Jan 2016 22:05:43 -0000

These 2 patches are needed to build udev with the 4.4 kernel, the first
mtd-probe adds back a stdint.h header that was removed in the kernel's mtd-user.h
header file.

The second adds a check for a new header and sets a Makefile variable
to determine which header to use for the new kernel vs older kernels.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/udev.inc                    |  5 ++-
 ...-Add-stdint.h-as-it-was-removed-from-mtd-.patch | 26 +++++++++++
 ...c-Makefile.am-Check-for-input.h-and-input.patch | 50 ++++++++++++++++++++++
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch
 create mode 100644 meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index c00ed34..93d7369 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -31,7 +31,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://add-install-ptest.patch \
            file://fix_rule-syntax-regex-ptest.patch \
            file://run-ptest \
-           file://init"
+           file://init \
+           file://0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch \
+           file://0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch \
+           "
 
 inherit autotools pkgconfig update-rc.d ptest
 RDEPENDS_${PN}-ptest += "make perl python"
diff --git a/meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch b/meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch
new file mode 100644
index 0000000..439eeac
--- /dev/null
+++ b/meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch
@@ -0,0 +1,26 @@
+From 2935f9b2dfb92c3ce4376a988cd01b624430905b Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Tue, 19 Jan 2016 09:49:56 -0800
+Subject: [PATCH 1/2] mtd_probe.h: Add stdint.h as it was removed from
+ mtd-user.h in the kernel
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ src/mtd_probe/mtd_probe.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/mtd_probe/mtd_probe.h b/src/mtd_probe/mtd_probe.h
+index 2a37ede..49c1918 100644
+--- a/src/mtd_probe/mtd_probe.h
++++ b/src/mtd_probe/mtd_probe.h
+@@ -18,6 +18,7 @@
+  */
+ 
+ #include <mtd/mtd-user.h>
++#include <stdint.h>
+ 
+ /* Full oob structure as written on the flash */
+ struct sm_oob {
+-- 
+2.5.0
+
diff --git a/meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch b/meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch
new file mode 100644
index 0000000..285680f
--- /dev/null
+++ b/meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch
@@ -0,0 +1,50 @@
+From 63ae7ebb0c6177efed46734061fb59c458a47a26 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Tue, 19 Jan 2016 09:49:19 -0800
+Subject: [PATCH 2/2] configure.ac/Makefile.am: Check for input.h and
+ input-event-codes.h
+
+Add INPUT_HEADER to know which header file to use because it changed
+in the 4.4 kernel code.
+
+Set INPUT_HEADER with default linux/input.h if it exists and if the
+newer input-events-codes.h exists from 4.4 use it instead.
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ Makefile.am  | 2 +-
+ configure.ac | 4 +++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2e32e69..04eb194 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -591,7 +591,7 @@ dist_udevkeymapforcerel_DATA = \
+ 	src/keymap/force-release-maps/samsung-other \
+ 	src/keymap/force-release-maps/common-volume-keys
+ 
+-src/keymap/keys.txt: $(INCLUDE_PREFIX)/linux/input.h
++src/keymap/keys.txt: $(INCLUDE_PREFIX)/$(INPUT_HEADER)
+ 	$(AM_V_at)mkdir -p src/keymap
+ 	$(AM_V_GEN)$(AWK) '/^#define.*KEY_[^ ]+[ \t]+[0-9]/ { if ($$2 != "KEY_MAX") { print $$2 } }' < $< | sed 's/^KEY_COFFEE$$/KEY_SCREENLOCK/' > $@
+ 
+diff --git a/configure.ac b/configure.ac
+index 0500313..9674620 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -154,8 +154,10 @@ AS_IF([test "x$enable_keymap" = "xyes"], [
+        if test -z "$GPERF"; then
+               AC_MSG_ERROR([gperf is needed])
+        fi
++       
++       AC_CHECK_HEADER([linux/input.h], [AC_SUBST([INPUT_HEADER], [$(echo 'linux/input.h')])], AC_MSG_ERROR([kernel headers not found]))
++       AC_CHECK_HEADER([linux/input-event-codes.h], [AC_SUBST([INPUT_HEADER], [$(echo 'linux/input-event-codes.h')])], [:])
+ 
+-       AC_CHECK_HEADER([linux/input.h], [:], AC_MSG_ERROR([kernel headers not found]))
+        AC_SUBST([INCLUDE_PREFIX], [$(echo '#include <linux/input.h>' | eval $ac_cpp -E - | sed -n '/linux\/input.h/ {s:.*"\(.*\)/linux/input.h".*:\1:; p; q}')])
+ ])
+ AM_CONDITIONAL([ENABLE_KEYMAP], [test "x$enable_keymap" = "xyes"])
+-- 
+2.5.0
+
-- 
2.5.0


