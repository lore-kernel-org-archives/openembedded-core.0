Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RujHq-0002R4-TU
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 12:32:39 +0100
Received: by eaal10 with SMTP id l10so1896654eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 03:24:36 -0800 (PST)
Received: by 10.213.9.134 with SMTP id l6mr3444445ebl.52.1328613876700;
	Tue, 07 Feb 2012 03:24:36 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id y12sm72330583eeb.11.2012.02.07.03.24.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 03:24:36 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 13:24:29 +0200
Message-Id: <1328613869-19250-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/3] nspr: Integrate version 4.8.9
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
X-List-Received-Date: Tue, 07 Feb 2012 11:32:39 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
---
 meta/recipes-support/nspr/files/nspr.pc |   11 +++++++++
 meta/recipes-support/nspr/nspr_4.8.9.bb |   36 +++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/nspr/files/nspr.pc
 create mode 100644 meta/recipes-support/nspr/nspr_4.8.9.bb

diff --git a/meta/recipes-support/nspr/files/nspr.pc b/meta/recipes-support/nspr/files/nspr.pc
new file mode 100644
index 0000000..c3aed84
--- /dev/null
+++ b/meta/recipes-support/nspr/files/nspr.pc
@@ -0,0 +1,11 @@
+os_libs=-lpthread -ldl
+prefix=/usr
+exec_prefix=/usr
+libdir=/usr/lib
+includedir=/usr/include
+
+Name: NSPR
+Description: The Netscape Portable Runtime
+Version: 4.8.9
+Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
+Cflags: 
diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-support/nspr/nspr_4.8.9.bb
new file mode 100644
index 0000000..a2fcc64
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Netscape Portable Runtime Library"
+HOMEPAGE =  "http://www.mozilla.org/projects/nspr/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+SECTION = "libs/network"
+
+PR = "r0"
+
+SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz"
+
+SRC_URI += "file://nspr.pc "
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
+    install -D ${WORKDIR}/nspr.pc ${D}${libdir}/pkgconfig/nspr.pc
+}
+
+FILES_${PN} = "/usr/lib/*.so"
+FILES_${PN}-dev = "/usr/bin/* /usr/include/* /usr/share/aclocal/* /usr/lib/pkgconfig/*"
+FILES_${PN}-dbg = "/usr/bin/.debug/* /usr/lib/.debug/* /usr/src/debug/*"
+FILE_${PN}-staticdev= "/usr/lib/*.a"
+
-- 
1.7.5.4



