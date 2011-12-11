Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIO-0003rn-B5
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:55:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045461"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:48:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:46 -0800
Message-Id: <b2682d3089a9d46b537d0b588f914c5206fefef0.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/26] libacpi: Use the cross strip instead of host strip
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Dec 2011 22:55:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

to avoid this build error on x32:

| strip: Unable to recognise the format of the input file `test-libacpi'
| make: *** [test-libacpi] Error 1
| ERROR: oe_runmake failed

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../use_correct_strip_in_cross_environment.patch   |   23 ++++++++++++++++++++
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |    5 ++-
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch

diff --git a/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch b/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
new file mode 100644
index 0000000..c9ad668
--- /dev/null
+++ b/meta/recipes-bsp/libacpi/files/use_correct_strip_in_cross_environment.patch
@@ -0,0 +1,23 @@
+UpstreamStatus: Pending
+
+Used the cross strip instead of host strip to avoid this build error:
+
+| strip: Unable to recognise the format of the input file `test-libacpi'
+| make: *** [test-libacpi] Error 1
+| ERROR: oe_runmake failed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/07
+
+Index: libacpi-0.2/Makefile
+===================================================================
+--- libacpi-0.2.orig/Makefile
++++ libacpi-0.2/Makefile
+@@ -39,7 +39,7 @@ libacpi.so: ${OBJ}
+ test-libacpi: ${OBJ_test}
+ 	@echo LD $@
+ 	@${CC} -o $@ ${OBJ_test} ${LDFLAGS}
+-	@strip $@
++	@${STRIP} $@
+ 
+ install: all
+ 	@echo installing header to ${DESTDIR}${PREFIX}/include
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index 82fe8f8..2d98fae 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -5,11 +5,12 @@ SECTION = "base"
 HOMEPAGE = "http://www.ngolde.de/libacpi.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fec17f82f16630adf2dfb7d2a46f21c5"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 	   file://makefile-fix.patch \
-	   file://libacpi_fix_for_x32.patch "
+	   file://libacpi_fix_for_x32.patch \
+	   file://use_correct_strip_in_cross_environment.patch"
 
 SRC_URI[md5sum] = "05b53dd7bead66dda35fec502b91066c"
 SRC_URI[sha256sum] = "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29"
-- 
1.7.6.4



