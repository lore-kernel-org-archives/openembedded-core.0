Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id BF7E071A72
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:14 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id CE4CAB88FF9; Tue,  6 Dec 2016 12:49:54 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:46 +0100
Message-Id: <1481024991-5882-29-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 28/33] dpkg: update packages and files to match Debian more closely
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
X-List-Received-Date: Tue, 06 Dec 2016 11:50:15 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 53 +++++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 5e838ed..db37a7b 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -57,20 +57,63 @@ do_install_append () {
 	fi
 }
 
-PACKAGES =+ "start-stop-daemon update-alternatives-dpkg"
+PACKAGES =+ "dpkg-perl dselect libdpkg-perl start-stop-daemon update-alternatives-dpkg"
 
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} run-postinsts perl"
 RDEPENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN} = "start-stop-daemon"
 RRECOMMENDS_${PN}_class-native = ""
+RSUGGESTS_${PN} = "apt"
 
-FILES_start-stop-daemon = "${base_sbindir}/start-stop-daemon"
+RDEPENDS_dpkg-perl = "binutils libdpkg-perl make xz"
+RRECOMMENDS_dpkg-perl = "gnupg gpgv"
+
+RDEPENDS_dselect = "dpkg"
+RSUGGESTS_dselect = "perl"
+
+RDEPENDS_libdpkg-perl = "dpkg libtimedate-perl perl"
+RRECOMMENDS_libdpkg-perl = "xz"
+RSUGGESTS_libdpkg-perl = "binutils gnupg gpgv"
 
-FILES_update-alternatives-dpkg = "${bindir}/update-alternatives ${localstatedir}/lib/dpkg/alternatives ${sysconfdir}/alternatives"
 RPROVIDES_update-alternatives-dpkg = "update-alternatives"
 RCONFLICTS_update-alternatives-dpkg = "update-alternatives"
 
-PACKAGES += "${PN}-perl"
-FILES_${PN}-perl = "${libdir}/perl"
+FILES_dpkg-perl = " \
+    ${bindir}/dpkg-architecture \
+    ${bindir}/dpkg-buildflags \
+    ${bindir}/dpkg-buildpackage \
+    ${bindir}/dpkg-checkbuilddeps \
+    ${bindir}/dpkg-distaddfile \
+    ${bindir}/dpkg-genchanges \
+    ${bindir}/dpkg-gencontrol \
+    ${bindir}/dpkg-gensymbols \
+    ${bindir}/dpkg-mergechangelogs \
+    ${bindir}/dpkg-name \
+    ${bindir}/dpkg-parsechangelog \
+    ${bindir}/dpkg-scanpackages \
+    ${bindir}/dpkg-scansources \
+    ${bindir}/dpkg-shlibdeps \
+    ${bindir}/dpkg-source \
+    ${bindir}/dpkg-vendor \
+    ${datadir}/dpkg/*.mk \
+"
+
+FILES_dselect = "${bindir}/dselect"
+
+FILES_libdpkg-perl = " \
+    ${libdir}/dpkg/parsechangelog \
+    ${libdir}/perl \
+"
+
+FILES_start-stop-daemon = "${base_sbindir}/start-stop-daemon"
+
+FILES_update-alternatives-dpkg = " \
+    ${sysconfdir}/alternatives \
+    ${bindir}/update-alternatives \
+    ${localstatedir}/lib/dpkg/alternatives \
+"
+
+PKG_dpkg-dev = "libdpkg-dev"
+PKG_dpkg-perl = "dpkg-dev"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


