Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigxw-0001EI-Su
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:21 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:30:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663897"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:30:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:30 -0800
Message-Id: <e9a450bd3b519373e02ba235ebf5ce7750dc9767.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/28] libcap: move library to base_libdir
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
X-List-Received-Date: Thu, 05 Jan 2012 06:38:21 -0000

From: Scott Garman <scott.a.garman@intel.com>

ls from coreutils links to libcap, so move the libcap library
from libdir (/usr/lib) to base_libdir (/lib).

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-support/libcap/libcap.inc     |   15 +++++++++++++--
 meta/recipes-support/libcap/libcap_2.22.bb |    2 +-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 184b58a..9418abf 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -21,6 +21,8 @@ do_configure() {
 	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
 }
 
+BUILD_LDFLAGS_virtclass_native += "-Wl,rpath=${base_libdir}"
+
 EXTRA_OEMAKE = " \
   LIBATTR=yes \
   PAM_CAP=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} \
@@ -42,8 +44,17 @@ do_install() {
 	oe_runmake install DESTDIR="${D}" prefix="${prefix}"
 }
 
+do_install_append() {
+	# Move the library to base_libdir
+	install -d ${D}${base_libdir}
+	mv ${D}${libdir}/* ${D}${base_libdir}
+	rmdir ${D}${libdir}
+}
+
+FILES_${PN}-dev += "${base_libdir}/*.so"
+
 # pam files
-FILES_${PN} += "${libdir}/security/*.so"
-FILES_${PN}-dbg += "${libdir}/security/.debug/*.so"
+FILES_${PN} += "${base_libdir}/security/*.so"
+FILES_${PN}-dbg += "${base_libdir}/security/.debug/*.so"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-support/libcap/libcap_2.22.bb
index dd63d9e..be1df54 100644
--- a/meta/recipes-support/libcap/libcap_2.22.bb
+++ b/meta/recipes-support/libcap/libcap_2.22.bb
@@ -1,6 +1,6 @@
 require libcap.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "ce64058bdb3f086ddbfca8ce6c919845"
 SRC_URI[sha256sum] = "73ebbd4877b5f69dd28b72098e510c5b318bc480f8201c4061ac98b78c04050f"
-- 
1.7.6.4



