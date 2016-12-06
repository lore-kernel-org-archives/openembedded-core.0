Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 671336059F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:12 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 8ED17B8B288; Tue,  6 Dec 2016 12:49:54 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:43 +0100
Message-Id: <1481024991-5882-26-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 25/33] dpkg: clean-up packaging of start-stop-daemon
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
X-List-Received-Date: Tue, 06 Dec 2016 11:50:12 -0000

Dpkg-start-stop is not an intuitive name. Just call the package
start-stop-daemon. Don't rdepend on it, because it might be empty.

Install start-stop-daemon to /sbin to match Debian and busybox.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 2eabc30..be8c253 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -32,7 +32,7 @@ PACKAGECONFIG[xz] = "--with-liblzma,--without-liblzma,xz"
 
 DPKG_DEB_COMPRESSOR ?= "${@bb.utils.contains('PACKAGECONFIG', 'xz', 'xz', 'gzip', d)}"
 
-EXTRA_OECONF += "--with-dpkg-deb-compressor=${DPKG_DEB_COMPRESSOR}"
+EXTRA_OECONF += "--sbindir=${base_sbindir} --with-dpkg-deb-compressor=${DPKG_DEB_COMPRESSOR}"
 
 EXTRA_OECONF += "TAR=tar"
 EXTRA_OECONF_append_class-target = " DEB_HOST_ARCH=${DPKG_ARCH}"
@@ -65,10 +65,14 @@ do_install_append () {
 	fi
 }
 
-PACKAGES =+ "update-alternatives-dpkg"
+PACKAGES =+ "start-stop-daemon update-alternatives-dpkg"
 
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} run-postinsts perl"
 RDEPENDS_${PN}_class-native = ""
+RRECOMMENDS_${PN} = "start-stop-daemon"
+RRECOMMENDS_${PN}_class-native = ""
+
+FILES_start-stop-daemon = "${base_sbindir}/start-stop-daemon"
 
 FILES_update-alternatives-dpkg = "${bindir}/update-alternatives ${localstatedir}/lib/dpkg/alternatives ${sysconfdir}/alternatives"
 RPROVIDES_update-alternatives-dpkg = "update-alternatives"
@@ -77,14 +81,4 @@ RCONFLICTS_update-alternatives-dpkg = "update-alternatives"
 PACKAGES += "${PN}-perl"
 FILES_${PN}-perl = "${libdir}/perl"
 
-# Split out start-stop-daemon to its own package.  Note that it
-# is installed in a different directory than the one used for
-# the bitbake version.
-#
-PACKAGES =+ "${PN}-start-stop"
-FILES_${PN}-start-stop = "${sbindir}/start-stop-daemon"
-
-RDEPENDS_${PN} += "${PN}-start-stop"
-
-
 BBCLASSEXTEND = "native"
-- 
2.7.4


