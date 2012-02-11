Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RwCSo-0001CD-PG
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 13:54:04 +0100
Received: by eekd41 with SMTP id d41so1020023eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 04:45:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.213.4.74 with SMTP id 10mr900008ebq.95.1328964352373;
	Sat, 11 Feb 2012 04:45:52 -0800 (PST)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id v51sm34897814eef.2.2012.02.11.04.45.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Feb 2012 04:45:51 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Feb 2012 14:45:46 +0200
Message-Id: <1328964346-15804-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQnvq4N/NEF7slESO8ZH4r+3Sx3Yeaqd3nQ4jDFEeFiYVl81bTSxOXxRQ/OfefaNOu0S+q45
Subject: [PATCH] nspr: Integrate version 4.8.9
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
X-List-Received-Date: Sat, 11 Feb 2012 12:54:04 -0000

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
1.7.5.4



