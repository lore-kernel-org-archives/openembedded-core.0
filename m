Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 554817C137
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 16:49:57 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id i00Lg7FPgx6b6i00MgoPdz; Fri, 11 Jan 2019 16:49:58 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=T4GiscCQ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=3JhidrIBZZsA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
	a=_20moNcF6KyCXaphWfgA:9
	a=zUWDFFqufPUA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gi00K-0002iB-BN; Fri, 11 Jan 2019 16:49:56 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2019 16:49:51 +0000
Message-Id: <20190111164951.8329-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLuBrqDiSoJHXGFOPIp4UtUvV3gkYzATbDOMo7fMaCyCKSw+6z7OBM/rCmBK55PPQLBkEo0y7UzWAtFttLQ041SR+HU3oYnAgHBrLgYQ5JV+mfZCvg2l
	ygtudyv4dp4HiGhPPaRCc5rjF5qV42vrMxFGRYQb0n0gG6oKznNWm7um
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCHv2] glibc: Separate out AArch64 multilib loader symlink creation
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
X-List-Received-Date: Fri, 11 Jan 2019 16:49:58 -0000
Content-Transfer-Encoding: 8bit

Until now, glibc was responsible for creating an AArch64 dynamic loader
symlink if required for ABI compatibility.

Unfortunately, using multilib with AArch64 caused the rmdir in
glibc-package.inc:do_poststash_install_cleanup to fail because that task
did not expect to find the dynamic loader symlink in /lib.

Also, although glibc-package.inc:do_install_append_aarch64 made use of
${nonarch_base_libdir} to create the dynamic loader symlink in a way that
was compatible with usrmerge, it unfortunately explicitly added only /lib
to libc_baselibs, so the symlink was not packaged correctly when using
usrmerge.

Attempting to fix both of these problems within glibc-package.inc in
various ways created a bit of a mess. It seemed much simpler to invent a
new package for the symlink and have glibc RDEPEND on that package if
required.

Richard Purdie suggested[1] that ${nonarch_base_libdir} should not be used
in this way. I've switched to using ${root_prefix}/lib which continues to
work both with and without usrmerge.

Unfortunately, it appears not to be possible to specify the name of the
loader via a variable with an override, since the _aarch64 override is
applied even for _aarch64-be.

Build-tested and inspected core-image-minimal rootfs with:

* AArch64 no multilib (real loader in correct place)
 MACHINE = "qemuarm64"

* AArch64 multilib (symlink in correct place)
 MACHINE = "qemuarm64"
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
 require conf/multilib.conf

* AArch64 usrmerge (real loader in correct place)
 DISTRO_FEATURES += "usrmerge"
 MACHINE = "qemuarm64"

* AArch64 multilib usrmerge (symlink in correct place)
 DISTRO_FEATURES += "usrmerge"
 MACHINE = "qemuarm64"
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
 require conf/multilib.conf

* AArch64 big-endian multilib usrmerge (symlink in correct place)
 DEFAULTTUNE = "aarch64_be"
 DISTRO_FEATURES += "usrmerge"
 MACHINE = "qemuarm64"
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
 require conf/multilib.conf

* x86 (real loader in correct place)
 MACHINE = "qemux86"

[1] http://lists.openembedded.org/pipermail/openembedded-core/2018-November/276120.html

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 .../glibc/glibc-loader-symlink.bb             | 27 +++++++++++++++++++
 meta/recipes-core/glibc/glibc-package.inc     | 20 +++++---------
 2 files changed, 34 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc-loader-symlink.bb

diff --git a/meta/recipes-core/glibc/glibc-loader-symlink.bb b/meta/recipes-core/glibc/glibc-loader-symlink.bb
new file mode 100644
index 0000000000..737d23f0d1
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc-loader-symlink.bb
@@ -0,0 +1,27 @@
+# On AArch64, at least glibc will RDEPEND on this recipe in order to
+# ensure that the dynamic loader is available in the ABI-mandated
+# location when that location differs from where glibc installed it.
+# This happens when multilib is enabled.
+
+SUMMARY = "AArch64 compatibility symlink when using multilib"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INSANE_SKIP_${PN}_append_aarch64 = " libdir"
+FILES_${PN} = "${root_prefix}/lib"
+
+do_install_aarch64() {
+    if [ "${base_libdir}" != "${root_prefix}/lib" ]; then
+        # The aarch64 ABI says the dynamic linker -must- be /lib/ld-linux-aarch64[_be].so.1
+        install -d ${D}${root_prefix}/lib
+        if [ "${ARMPKGARCH}" = "aarch64" ]; then
+            ln -s ${@oe.path.relative('${root_prefix}/lib', '${base_libdir}')}/ld-linux-aarch64.so.1 \
+                  ${D}${root_prefix}/lib/ld-linux-aarch64.so.1
+        elif [ "${ARMPKGARCH}" = "aarch64_be" ]; then
+            ln -s ${@oe.path.relative('${root_prefix}/lib', '${base_libdir}')}/ld-linux-aarch64_be.so.1 \
+                  ${D}${root_prefix}/lib/ld-linux-aarch64_be.so.1
+        else
+            false
+        fi
+    fi
+}
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a98ae1a29c..9c3f5bc355 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -15,8 +15,6 @@ RPROVIDES_glibc-thread-db = "eglibc-thread-db"
 RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
 libc_baselibs = "${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
-libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
-INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
 FILES_ldd = "${bindir}/ldd"
@@ -44,6 +42,13 @@ FILES_glibc-thread-db = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthre
 RPROVIDES_${PN}-dev += "libc-dev"
 RPROVIDES_${PN}-staticdev += "libc-staticdev"
 
+# For AArch64 at least, we need to ensure that the dynamic loader is
+# available by the ABI-mandated path in /lib. This will always be true
+# if ${base_libdir} is /lib (or perhaps /usr/lib when usrmerge is
+# enabled), but we need to depend on glibc-loader-symlink to provide
+# it otherwise.
+RDEPENDS_${PN}_aarch64 = "${@oe.utils.conditional('base_libdir', '${root_prefix}/lib', '', 'glibc-loader-symlink', d)}"
+
 SUMMARY_sln = "The static ln"
 DESCRIPTION_sln = "Similar to the 'ln' utility, but statically linked.  sln is useful to make symbolic links to dynamic libraries if the dynamic linking system, for some reason, is not functional."
 SUMMARY_nscd = "Name service cache daemon"
@@ -115,17 +120,6 @@ do_install_append () {
 }
 
 do_install_append_aarch64 () {
-	if [ "${base_libdir}" != "${nonarch_base_libdir}" ]; then
-		# The aarch64 ABI says the dynamic linker -must- be /lib/ld-linux-aarch64[_be].so.1
-		install -d ${D}${nonarch_base_libdir}
-		if [ -e ${D}${base_libdir}/ld-linux-aarch64.so.1 ]; then
-			ln -s ${@oe.path.relative('${nonarch_base_libdir}', '${base_libdir}')}/ld-linux-aarch64.so.1 \
-				${D}${nonarch_base_libdir}/ld-linux-aarch64.so.1
-		elif [ -e ${D}${base_libdir}/ld-linux-aarch64_be.so.1 ]; then
-			ln -s ${@oe.path.relative('${nonarch_base_libdir}', '${base_libdir}')}/ld-linux-aarch64_be.so.1 \
-				${D}${nonarch_base_libdir}/ld-linux-aarch64_be.so.1
-		fi
-	fi
 	do_install_armmultilib
 }
 
-- 
2.20.1


