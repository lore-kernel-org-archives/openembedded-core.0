Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 57BF26C538
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 21:00:58 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id y0tNgpn2Mx6b6y0tOgSkb7; Sun, 24 Feb 2019 21:00:58 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=T4GiscCQ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=CFTnQlWoA9kA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
	a=XACu5yiIHtAE_pg5KxgA:9
	a=zUWDFFqufPUA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gy0tM-0006zy-3h; Sun, 24 Feb 2019 21:00:56 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Feb 2019 21:00:52 +0000
Message-Id: <20190224210052.8974-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJSM5GdNhKXz6nnRupm76+9niTQkngUJGQt1MgKdpdrVERKnN2/KDZ++YulZ1rI6WSyYqkrcat8RI8TG6GnF5EGaXevIw4SX/zKz0GL9Q88VFhkNEaMd
	ZFxEWtNmr6DC9xZgoZJKKSyWbe52JL8zjNC8u/RMOnV59FKBAyjV+mEn
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] glibc: Install AArch64 loader link correctly for usrmerge+multilib
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
X-List-Received-Date: Sun, 24 Feb 2019 21:00:58 -0000
Content-Transfer-Encoding: 8bit

The AArch64 little-endian ABI requires that the dynamic loader is always
available at /lib/ld-linux-aarch64.so.1. Similarly, the big-endian ABI
requires that the dynamic loader is always available at
/lib/ld-linux-aarch64_be.so.1.

glibc-package.inc contains code that tries to ensure this, but
unfortunately it is defeated by the combination of multilib and usrmerge
because it does not take into account that /lib is the same as /usr/lib
with usrmerge when it adds the loader path to libc_baselibs and when it
attempts to show that /usr/lib is empty in do_poststash_install_cleanup.
This results in the symlink not being included in the package and a build
failure due to rmdir failing.

Richard Purdie also suggested[1] that ${nonarch_base_libdir} should not be
used as a synonym for /lib in this case.

This hopefully-fixed version always sets ARCH_DYNAMIC_LOADER and then uses
${root_prefix}/lib/${ARCH_DYNAMIC_LOADER} to refer to the dynamic loader
which works with both multilib and usrmerge. Since ARCH_DYNAMIC_LOADER is
only non-empty if the symlink is required, the code to create it can move
to do_install_append. Then do_poststash_install_cleanup needs to be taught
that ${exec_prefix}/lib may not be empty if the dynamic loader symlink is
there.

It appears not to be possible to specify the name of the loader via a
variable with an override, since the _aarch64 override is applied even for
_aarch64-be, so I've set the loader name using ${TARGET_ARCH} instead.

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

* big-endian versions of all of the above by also setting
  DEFAULTTUNE = "aarch64_be".
  (building glibc only.)

* x86_64 (real loader in /lib as before)[2]
  MACHINE = "qemux86"

* x86_64 multilib (real loader in /lib64 as before)
  MACHINE="qemux86-64"
  MULTILIBS = "multilib:lib32"
  DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
  require conf/multilib.conf

I also tested leaving an unwanted file in ${exec_prefix}/lib for
do_poststash_install_cleanup to detect, and I believe the detection always
worked correctly.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2018-November/276120.html

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 34 ++++++++++++++---------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 329732f48c..b9259612d4 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -15,7 +15,12 @@ RPROVIDES_glibc-thread-db = "eglibc-thread-db"
 RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
 libc_baselibs = "${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
-libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
+ARCH_DYNAMIC_LOADER = ""
+# The aarch64 ABI says the dynamic linker -must- be
+# /lib/ld-linux-aarch64{,_be}.so.1. With usrmerge, that may mean that
+# we need to install it in /usr/lib.
+ARCH_DYNAMIC_LOADER_aarch64 = "ld-linux-${TARGET_ARCH}.so.1"
+libc_baselibs_append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', '', '', '${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}', d)}"
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
@@ -114,20 +119,20 @@ do_install_append () {
 		echo "d root root 0755 /var/run/nscd none" \
 			> ${D}${sysconfdir}/default/volatiles/98_nscd
 	fi
+
+	# The dynamic loader will have been installed into
+	# ${base_libdir}. However, if that isn't going to end up being
+	# available in the ABI-mandated location, then a symlink must
+        # be created.
+
+	if [ -n "${ARCH_DYNAMIC_LOADER}" -a ! -e "${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
+		install -d ${D}${root_prefix}/lib
+		ln -s ${@oe.path.relative('${root_prefix}/lib', '${base_libdir}')}/${ARCH_DYNAMIC_LOADER} \
+				${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}
+	fi
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
 
@@ -209,12 +214,15 @@ do_poststash_install_cleanup () {
 	rm -rf ${D}/${localedir}
 	rm -rf ${D}${datadir}/locale
 	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
-		if [ -d ${D}${exec_prefix}/lib ]; then
+	    if [ -d "${D}${exec_prefix}/lib" ]; then
+		if [ -z "${ARCH_DYNAMIC_LOADER}" -o \
+		     ! -e "${D}${exec_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
 			# error out if directory isn't empty
 			# this dir should only contain locale dir
 			# which has been deleted in the previous step
 			rmdir ${D}${exec_prefix}/lib
 		fi
+	    fi
 	fi
 }
 addtask do_poststash_install_cleanup after do_stash_locale do_install before do_populate_sysroot do_package
-- 
2.20.1


