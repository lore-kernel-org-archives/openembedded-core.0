Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id D4B5B71C70
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:15 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 7FB5BB88DB0; Thu,  8 Dec 2016 22:48:00 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:47 +0100
Message-Id: <1481233677-27298-24-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 23/33] dpkg: use PACKAGECONFIG
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:16 -0000

Keep default dependencies as before. Set default compressor to xz
if selected, gzip otherwise.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 v2: Rebased (conflicted with PATCH v2 01/33)

 meta/recipes-devtools/dpkg/dpkg.inc | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 4fd0f2a..4e39fba 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -1,13 +1,10 @@
 SUMMARY = "Package maintenance system from Debian"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
+DEPENDS = "perl"
+DEPENDS_append_class-native = " bzip2-replacement-native"
 PROVIDES = "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
-DEPENDS = "zlib bzip2 perl ncurses"
-DEPENDS_class-native = "bzip2-replacement-native zlib-native gettext-native perl-native"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
-RDEPENDS_${PN}_class-native = "xz-native"
-
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
 
 inherit autotools gettext perlnative pkgconfig systemd
@@ -27,17 +24,18 @@ PERL_LIBDIR_class-native = "${libdir}/perl-native/perl"
 UA = "update-alternatives"
 UA_native = "${@['', 'update-alternatives'][d.getVar('PREFERRED_PROVIDER_virtual/update-alternatives-native', True) == 'dpkg-native']}"
 
-PACKAGECONFIG ??= "${UA}"
+PACKAGECONFIG ??= "bzip2 gzip start-stop-daemon ${UA}"
+PACKAGECONFIG[bzip2] = "--with-bz2,--without-bz2,bzip2"
+PACKAGECONFIG[dselect] = "--enable-dselect,--disable-dselect,ncurses"
+PACKAGECONFIG[gzip] = "--with-zlib,--without-zlib,zlib"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+PACKAGECONFIG[start-stop-daemon] = "--enable-start-stop-daemon,--disable-start-stop-daemon"
 PACKAGECONFIG[update-alternatives] = "--enable-update-alternatives,--disable-update-alternatives"
+PACKAGECONFIG[xz] = "--with-liblzma,--without-liblzma,xz"
+
+DPKG_DEB_COMPRESSOR ?= "${@bb.utils.contains('PACKAGECONFIG', 'xz', 'xz', 'gzip', d)}"
 
-EXTRA_OECONF = "\
-		--disable-dselect \
-		--enable-start-stop-daemon \
-		--with-zlib \
-		--with-bz2 \
-		--without-liblzma \
-		--without-selinux \
-		"
+EXTRA_OECONF += "--with-dpkg-deb-compressor=${DPKG_DEB_COMPRESSOR}"
 
 EXTRA_OECONF += "TAR=tar"
 EXTRA_OECONF_append_class-target = " DEB_HOST_ARCH=${DPKG_ARCH}"
@@ -71,6 +69,10 @@ do_install_append () {
 }
 
 PACKAGES =+ "update-alternatives-dpkg"
+
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} run-postinsts perl"
+RDEPENDS_${PN}_class-native = ""
+
 FILES_update-alternatives-dpkg = "${bindir}/update-alternatives ${localstatedir}/lib/dpkg/alternatives ${sysconfdir}/alternatives"
 RPROVIDES_update-alternatives-dpkg = "update-alternatives"
 RCONFLICTS_update-alternatives-dpkg = "update-alternatives"
-- 
2.7.4


