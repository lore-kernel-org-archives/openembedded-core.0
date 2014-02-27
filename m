Return-Path: <alexandru.sardan@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe002.messaging.microsoft.com [216.32.180.12])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE476E89C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 12:17:47 +0000 (UTC)
Received: from mail39-va3-R.bigfish.com (10.7.14.250) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.22; Thu, 27 Feb 2014 12:17:47 +0000
Received: from mail39-va3 (localhost [127.0.0.1])	by mail39-va3-R.bigfish.com
	(Postfix) with ESMTP id 12384C0246	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 12:17:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 11
X-BigFish: VS11(z52aesze0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch1155h)
Received: from mail39-va3 (localhost.localdomain [127.0.0.1]) by mail39-va3
	(MessageSwitch) id 139350346518095_17890;
	Thu, 27 Feb 2014 12:17:45 +0000 (UTC)
Received: from VA3EHSMHS022.bigfish.com (unknown [10.7.14.239])	by
	mail39-va3.bigfish.com (Postfix) with ESMTP id D956C260171;
	Thu, 27 Feb 2014 12:17:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS022.bigfish.com
	(10.7.99.32) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 27 Feb 2014 12:17:39 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 27 Feb 2014 12:17:39 +0000
Received: from fsr-ub1264-102.ea.freescale.net
	(fsr-ub1264-102.ea.freescale.net [10.171.74.5])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s1RCHbTr011985;
	Thu, 27 Feb 2014 05:17:38 -0700
From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Feb 2014 14:17:35 +0200
Message-ID: <1393503455-17642-1-git-send-email-alexandru.sardan@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] gcc: Enable SPE & AltiVec generation on powepc*linux target.
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
X-List-Received-Date: Thu, 27 Feb 2014 12:17:50 -0000
Content-Type: text/plain

[ADT bug #5761] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=5761

Also this patch adds symlinks to libgcc such that a GCC configured
by passing the target parameter without LIBCEXTENSION and ABIEXTENSION
specifiers to find the correct startup files from a libgcc configured
with these variables.

Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
 ...AltiVec-generation-on-powepc-linux-target.patch |   42 ++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc.inc               |   24 ++++++++++-
 3 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index fdd0c12..f5e583d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -69,6 +69,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0046-libatomic-deptracking.patch \
 	   file://0047-repomembug.patch \
 	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
+	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \ 
 	  "
 SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
 SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
new file mode 100644
index 0000000..b98f8ff
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
@@ -0,0 +1,42 @@
+From 9e0e19eac2562f73858602fe26e2044eb8b20c47 Mon Sep 17 00:00:00 2001
+From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
+Date: Wed, 5 Feb 2014 16:52:31 +0200
+Subject: [PATCH] Enable SPE & AltiVec generation on powepc*linux target
+
+When is configured with --target=powerpc-linux, the resulting GCC will 
+not be able to generate code for SPE targets (e500v1/v2).
+GCC configured with --target=powerpc-linuxspe will not be able to
+generate AltiVec instructions (for e6500).
+This patch modifies the configured file such that SPE or AltiVec code
+can be generated when gcc is configured with --target=powerpc-linux.
+The ABI and speciffic instructions can be selected through the
+"-mabi=spe or -mabi=altivec" and the "-mspe or -maltivec" parameters.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
+---
+ gcc/config.gcc |    7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config.gcc b/gcc/config.gcc
+index cb7a94e..d392c2b 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -2068,7 +2068,12 @@ powerpc-*-rtems*)
+ 	tmake_file="rs6000/t-fprules rs6000/t-rtems t-rtems rs6000/t-ppccomm"
+ 	;;
+ powerpc*-*-linux*)
+-	tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h"
++	case ${target} in
++	    powerpc*-*-linux*spe* | powerpc*-*-linux*altivec*)
++		tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h" ;;
++	    *)
++		tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h rs6000/linuxaltivec.h rs6000/linuxspe.h rs6000/e500.h" ;;
++	esac
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-ppccomm"
+ 	case ${target} in
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index fe98238..b185660 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -17,7 +17,8 @@ FILES_${PN}-dev = " \
   ${libdir}/${TARGET_SYS}/${BINV}/32 \
   ${libdir}/${TARGET_SYS}/${BINV}/x32 \
   ${libdir}/${TARGET_SYS}/${BINV}/n32 \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcc* \
+  ${@base_conditional('TARGET_SYS_NO_EXTENSION', '${TARGET_SYS}', '', '${libdir}/${TARGET_SYS_NO_EXTENSION}', d)}"
 FILES_libgcov-dev = " \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
   "
@@ -141,3 +142,24 @@ python do_multilib_install() {
             os.unlink(dest)
         os.symlink(src, dest)
 }
+
+addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
+python do_extra_symlinks() {
+    targetsysnoext = d.getVar('TARGET_SYS_NO_EXTENSION', True)
+
+    if targetsysnoext != d.getVar('TARGET_SYS', True):
+        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + targetsysnoext
+        src = d.getVar('TARGET_SYS', True)
+        if not os.path.lexists(dest):
+            os.symlink(src, dest)
+}
+
+python () {
+    targetsysnoext = d.getVar('TARGET_SYS', True)
+
+    for suffix in [d.getVar('ABIEXTENSION', True), d.getVar('LIBCEXTENSION', True)]:
+        if suffix and targetsysnoext.endswith(suffix):
+            targetsysnoext = targetsysnoext[:-len(suffix)]
+
+    d.setVar('TARGET_SYS_NO_EXTENSION', targetsysnoext)
+}
-- 
1.7.9.5



