Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RuplU-0004oQ-JJ
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:27:40 +0100
Received: by qadz30 with SMTP id z30so3227473qad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 10:19:37 -0800 (PST)
Received: by 10.229.76.9 with SMTP id a9mr9698745qck.76.1328638777735;
	Tue, 07 Feb 2012 10:19:37 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id o8sm29353121qan.11.2012.02.07.10.19.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 10:19:37 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 20:19:30 +0200
Message-Id: <1328638770-31141-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/1] nspr: Integrate version 4.8.9
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
X-List-Received-Date: Tue, 07 Feb 2012 18:27:40 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
---
 meta/recipes-support/nspr/files/nspr.pc.in |   11 ++++++++
 meta/recipes-support/nspr/nspr_4.8.9.bb    |   36 ++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/nspr/files/nspr.pc.in
 create mode 100644 meta/recipes-support/nspr/nspr_4.8.9.bb

diff --git a/meta/recipes-support/nspr/files/nspr.pc.in b/meta/recipes-support/nspr/files/nspr.pc.in
new file mode 100644
index 0000000..bbb7b5a
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
index 0000000..9ae5c70
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
1.7.5.4



