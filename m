Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 324 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Nov 2019 20:55:13 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9A27FA17
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:55:13 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id BA04EBE483A; Thu,  7 Nov 2019 21:49:47 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 21:49:41 +0100
Message-Id: <20191107204943.17467-1-obi@opendreambox.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] glibc: move ldconfig to its own package
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
X-List-Received-Date: Thu, 07 Nov 2019 20:55:13 -0000

Only recommend its installation, if it's enabled in distro features.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index d7037c5cce..9dd5a0d403 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,6 +1,6 @@
 INHIBIT_SYSROOT_STRIP = "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ldconfig"
 
 # The ld.so in this glibc supports the GNU_HASH
 RPROVIDES_${PN} = "eglibc rtld(GNU_HASH)"
@@ -23,7 +23,9 @@ ARCH_DYNAMIC_LOADER_aarch64 = "ld-linux-${TARGET_ARCH}.so.1"
 libc_baselibs_append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', '', '', '${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}', d)}"
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
-FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
+FILES_${PN} = "${libc_baselibs} ${libexecdir}/*"
+RRECOMMENDS_${PN} = "${@bb.utils.filter('DISTRO_FEATURES', 'ldconfig', d)}"
+FILES_ldconfig = "${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
 FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
@@ -107,11 +109,6 @@ do_install_append () {
 }
 
 do_install_append_class-target() {
-	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', 'true', 'false', d)}; then
-		# The distro doesn't want these files so let's not install them
-		rm -f ${D}${sysconfdir}/ld.so.conf
-		rm -f ${D}${base_sbindir}/ldconfig
-	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/nscd 755 root root -" \
-- 
2.17.1


