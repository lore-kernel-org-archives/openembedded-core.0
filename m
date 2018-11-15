Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Nov 2018 12:08:01 UTC
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
	by mail.openembedded.org (Postfix) with ESMTP id 262A96C15A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 12:08:00 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id NGJsgEoeBd3rWNGJtg6GJp; Thu, 15 Nov 2018 12:00:30 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Uv9Nyd4B c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=JHtHm7312UAA:10 a=-An2I_7KAAAA:8 a=7LQkRfUbqhO7TbarXp0A:9
	a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gNGJr-0004Vm-3r; Thu, 15 Nov 2018 12:00:23 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 12:00:16 +0000
Message-Id: <20181115120016.29814-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
X-CMAE-Envelope: MS4wfGQRktgH3X26lITbiD0PAEc59VSkEc3TNyloOJgfCmx/dPi1Wgms+Bs8OsFc9DPfUp4HEWgasNDb4ZUhkbaWHGyFy5xLLUGuHtg+U5ZU0AGqFwcgt5M1
	S9G92WxiBF3Fw0MtQSdfcKrhLp/Hzrb5mEY2YWsWHf8FTVrtFFg1gbT5
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] glibc: Package AArch64 dynamic loader symlink correctly with usrmerge
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
X-List-Received-Date: Thu, 15 Nov 2018 12:08:01 -0000

When using usrmerge, the compatibility dynamic loader symlink created in
do_install_append_aarch64 ends up in /usr/lib rather than /lib. This means
that the path added to libc_baselibs needs to be altered to match.

It's also necessary to tweak do_poststash_install_cleanup to not fail when
the symlink exists. I'm not entirely sure that the fix I've applied here is
the best one, but it does appear to work.

Compile-tested with:
 MACHINE = "qemuarm64"
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
 require conf/multilib.conf

and:
 MACHINE = "qemuarm64"
 without multilib

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a98ae1a29c..582ccbd751 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -15,7 +15,7 @@ RPROVIDES_glibc-thread-db = "eglibc-thread-db"
 RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
 libc_baselibs = "${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
-libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
+libc_baselibs_append_aarch64 = " ${nonarch_base_libdir}/ld-linux-aarch64*.so.1"
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
@@ -206,7 +206,7 @@ do_poststash_install_cleanup () {
 	rm -rf ${D}${libdir}/gconv
 	rm -rf ${D}/${localedir}
 	rm -rf ${D}${datadir}/locale
-	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
+	if [ "${libdir}" != "${exec_prefix}/lib" -a "${libdir}" != "${exec_prefix}/lib64" ]; then
 		if [ -d ${D}${exec_prefix}/lib ]; then
 			# error out if directory isn't empty
 			# this dir should only contain locale dir
-- 
2.11.0


