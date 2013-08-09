Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 14DFD6B5CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:59:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Aug 2013 01:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,844,1367996400"; d="scan'208";a="279808027"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Aug 2013 01:59:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 09:59:31 +0100
Message-Id: <2db87529704491705f7288abb2ec787f90bcb3c1.1376038140.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] x264: add from meta-oe, update and tweak
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
X-List-Received-Date: Fri, 09 Aug 2013 08:59:41 -0000

This is required by the default configuration of libav being brought over
from meta-oe. Changes from the meta-oe recipe:

* Update to the latest revision from the stable branch (upstream does
  not seem to provide stable releases.)
* Add LICENSE_FLAGS = "commercial"
* Enable PIC to fix text relocation warnings and disable warning for
  i586 (since PIC can't be used there)
* Make SUMMARY value slightly shorter
* Indent SRC_URI properly

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../don-t-default-to-cortex-a9-with-neon.patch     | 20 +++++++++
 meta/recipes-multimedia/x264/x264_git.bb           | 52 ++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
 create mode 100644 meta/recipes-multimedia/x264/x264_git.bb

diff --git a/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch b/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
new file mode 100644
index 0000000..b844d88
--- /dev/null
+++ b/meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
@@ -0,0 +1,20 @@
+-march flag is not in CFLAGS so this will always default to -mcpu=cortex-a8
+-mfpu=neon.
+
+Upstream-Status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: git/configure
+===================================================================
+--- git.orig/configure	2013-02-10 16:26:40.666343682 +0200
++++ git/configure	2013-02-10 16:27:49.198341677 +0200
+@@ -703,9 +703,6 @@
+ fi
+
+ if [ $asm = auto -a $ARCH = ARM ] ; then
+-    # set flags so neon is built by default
+-    echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu)' || CFLAGS="$CFLAGS -mcpu=cortex-a8 -mfpu=neon"
+-
+     if  cc_check '' '' '__asm__("rev ip, ip");' ; then      define HAVE_ARMV6
+         cc_check '' '' '__asm__("movt r0, #0");'         && define HAVE_ARMV6T2
+         cc_check '' '' '__asm__("vadd.i16 q0, q0, q0");' && define HAVE_NEON
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
new file mode 100644
index 0000000..6c6e9a5
--- /dev/null
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -0,0 +1,52 @@
+SUMMARY = "A free software library and application for encoding video streams into the H.264/MPEG-4 AVC format"
+HOMEPAGE = "http://www.videolan.org/developers/x264.html"
+
+LICENSE = "GPLv2"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "yasm-native"
+
+SRC_URI = "git://git.videolan.org/x264.git \
+           file://don-t-default-to-cortex-a9-with-neon.patch \
+           "
+
+SRCREV = "585324fee380109acd9986388f857f413a60b896"
+
+PV = "r2265+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit lib_package pkgconfig
+
+X264_DISABLE_ASM = ""
+X264_DISABLE_ASM_armv4 = "--disable-asm"
+X264_DISABLE_ASM_armv5 = "--disable-asm"
+
+EXTRA_OECONF = '--prefix=${prefix} \
+                --host=${HOST_SYS} \
+                --cross-prefix=${TARGET_PREFIX} \
+                --sysroot=${STAGING_DIR_TARGET} \
+                --enable-shared \
+                --enable-static \
+                --disable-lavf \
+                --disable-swscale \
+		--enable-pic \
+                ${X264_DISABLE_ASM} \
+               '
+
+do_configure() {
+    ./configure ${EXTRA_OECONF}
+}
+
+# Get rid of -e
+EXTRA_OEMAKE = ""
+AS = "${TARGET_PREFIX}gcc"
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+# PIC can't be enabled for 32-bit x86
+INSANE_SKIP_${PN}_append_i586 = " textrel"
+
-- 
1.8.1.2


