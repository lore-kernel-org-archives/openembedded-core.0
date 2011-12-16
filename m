Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RbgVQ-0002pI-1A
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 23:43:56 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 529A72FF5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 17:36:51 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 14:36:27 -0800
Message-Id: <aa8568a8b9ecc4765860ac25fed6f42585de5986.1324074313.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324074313.git.scott.a.garman@intel.com>
References: <cover.1324074313.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1324074313.git.scott.a.garman@intel.com>
References: <cover.1324074313.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 529A72FF5F.5B8F7
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/8] libcap: move library to base_libdir
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
X-List-Received-Date: Fri, 16 Dec 2011 22:43:56 -0000

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
1.7.5.4



