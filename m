Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC2-0004tn-Vz
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652352"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:10 -0800
Message-Id: <3fab285c7431ca609296746af3f4bdfb3ffe37a1.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/25] nspr: Integrate version 4.8.9
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:55 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
---
 meta/recipes-support/nspr/files/nspr.pc.in |   11 ++++++++
 meta/recipes-support/nspr/nspr_4.8.9.bb    |   37 ++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/nspr/files/nspr.pc.in
 create mode 100644 meta/recipes-support/nspr/nspr_4.8.9.bb

diff --git a/meta/recipes-support/nspr/files/nspr.pc.in b/meta/recipes-support/nspr/files/nspr.pc.in
new file mode 100644
index 0000000..e7af08d
--- /dev/null
+++ b/meta/recipes-support/nspr/files/nspr.pc.in
@@ -0,0 +1,11 @@
+os_libs=-lpthread -ldl
+prefix=OEPREFIX
+exec_prefix=OEEXECPREFIX
+libdir=OELIBDIR
+includedir=OEINCDIR
+
+Name: NSPR
+Description: The Netscape Portable Runtime
+Version: 4.8.9
+Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
+Cflags:
diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-support/nspr/nspr_4.8.9.bb
new file mode 100644
index 0000000..da324fc
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Netscape Portable Runtime Library"
+HOMEPAGE =  "http://www.mozilla.org/projects/nspr/"
+LICENSE = "GPL-2.0 | MPL-1.1 | LGPL-2.1"
+LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=40;md5=99d4d7d68bbc4bc60ebf8c15ed295f28 \
+                    file://Makefile.in;beginline=4;endline=38;md5=c2b512182a334e1bfa1edc4d1c84a298 "
+SECTION = "libs/network"
+
+PR = "r0"
+
+SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz"
+
+SRC_URI += "file://nspr.pc.in "
+
+SRC_URI[md5sum] = "60770d45dc08c0f181b22cdfce5be3e8"
+SRC_URI[sha256sum] = "ff43c7c819e72f03bb908e7652c5d5f59a5d31ee86c333e692650207103d1cce"
+
+S = "${WORKDIR}/nspr-${PV}/mozilla/nsprpub"
+
+inherit autotools
+
+do_configure() {
+	oe_runconf
+}
+
+do_compile_prepend() {
+	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX" LDFLAGS="" CC=gcc -C config export
+}
+
+do_install_append() {
+    install -D ${WORKDIR}/nspr.pc.in ${D}${libdir}/pkgconfig/nspr.pc
+    sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
+    sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nspr.pc
+    sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nspr.pc
+    sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
+}
+
+
-- 
1.7.6.5



