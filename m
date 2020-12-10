Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.14812.1607612539571389137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 07:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 211C91FB
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 07:02:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF7383F68F
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 07:02:13 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] syslinux: rewrite recipe so only target code is x86-specific
Date: Thu, 10 Dec 2020 15:02:09 +0000
Message-Id: <20201210150211.1505531-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently the syslinux recipe set COMPATIBLE_HOST to 32/64-bit x86.
Whilst this makes sense for the target binaries as syslinux is
x86-specific, this also affects the native recipe which should be able
to be built on non-x86 build hosts (for example, arm64 build host,
qemux86 target).

syslinux itself has a somewhat fragile build system but with care it is
possible to build the installer for native/nativesdk, and the bootloader
for target.  Despite claims the documentation to the contrary, not all
of the bootloader is shipped precompiled in the tarball which does
complicate matters.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../syslinux/syslinux_6.04-pre2.bb            | 80 ++++++++++---------
 1 file changed, 43 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/=
recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 3e7eef3a75..c233b3c39f 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -4,10 +4,7 @@ LICENSE =3D "GPLv2+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3 \
                     file://README;beginline=3D35;endline=3D41;md5=3D558f=
2c71cb1fb9ba511ccd4858e48e8a"
=20
-# If you really want to run syslinux, you need mtools.  We just want the
-# ldlinux.* stuff for now, so skip mtools-native
 DEPENDS =3D "nasm-native util-linux e2fsprogs"
-PV =3D "6.04-pre2"
=20
 SRC_URI =3D "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${=
PV}.tar.xz \
            file://syslinux-remove-clean-script.patch \
@@ -27,64 +24,73 @@ SRC_URI =3D "https://www.zytor.com/pub/syslinux/Testi=
ng/6.04/syslinux-${PV}.tar.xz
 SRC_URI[md5sum] =3D "2b31c78f087f99179feb357da312d7ec"
 SRC_URI[sha256sum] =3D "4441a5d593f85bb6e8d578cf6653fb4ec30f9e8f4a2315a3=
d8f2d0a8b3fadf94"
=20
+RECIPE_NO_UPDATE_REASON =3D "6.04-pre3 is broken"
 UPSTREAM_CHECK_URI =3D "https://www.zytor.com/pub/syslinux/"
 UPSTREAM_CHECK_REGEX =3D "syslinux-(?P<pver>.+)\.tar"
 UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
-COMPATIBLE_HOST =3D '(x86_64|i.86).*-(linux|freebsd.*)'
+# We can build the native parts anywhere, but the target has to be x86
+COMPATIBLE_HOST_class-target =3D '(x86_64|i.86).*-(linux|freebsd.*)'
+
 # Don't let the sanity checker trip on the 32 bit real mode BIOS binarie=
s
 INSANE_SKIP_${PN}-misc =3D "arch"
 INSANE_SKIP_${PN}-chain =3D "arch"
=20
+# When building the installer, CC is used to link. When building the boo=
tloader,
+# LD is used. However, these variables assume that GCC is used and break=
 the
+# build, so unset them.
+TARGET_LDFLAGS =3D ""
+SECURITY_LDFLAGS =3D ""
+LDFLAGS_SECTION_REMOVAL =3D ""
+
 EXTRA_OEMAKE =3D " \
 	BINDIR=3D${bindir} SBINDIR=3D${sbindir} LIBDIR=3D${libdir} \
 	DATADIR=3D${datadir} MANDIR=3D${mandir} INCDIR=3D${includedir} \
+	CC=3D"${CC} ${CFLAGS} ${LDFLAGS}" \
+	LD=3D"${LD} ${LDFLAGS}" \
+	OBJDUMP=3D"${OBJDUMP}" \
+	OBJCOPY=3D"${OBJCOPY}" \
+	AR=3D"${AR}" \
+	STRIP=3D"${STRIP}" \
+	NM=3D"${NM}" \
+	RANLIB=3D"${RANLIB}" \
 "
=20
+#
+# Tasks for native/nativesdk which just build the installer.
+#
 do_configure() {
-	# drop win32 targets or build fails
-	sed -e 's,win32/\S*,,g' -i Makefile
-
-	# clean installer executables included in source tarball
-	oe_runmake clean firmware=3D"efi32" EFIINC=3D"${includedir}"
-	# NOTE: There is a temporary work around above to specify
-	#	the efi32 as the firmware else the pre-built bios
-	#	files get erased contrary to the doc/distib.txt
-	#	In the future this should be "bios" and not "efi32".
+	oe_runmake firmware=3D"bios" clean
 }
=20
 do_compile() {
-	# Make sure the recompile is OK.
-	# Though the ${B} should always exist, still check it before find and r=
m.
-	[ -d "${B}" ] && find ${B} -name '.*.d' -type f -exec rm -f {} \;
-
-	# Rebuild only the installer; keep precompiled bootloaders
-	# as per author's request (doc/distrib.txt)
-	oe_runmake CC=3D"${CC} ${CFLAGS}" \
-                   LD=3D"${LD}" LDFLAGS=3D"${LDFLAGS}" \
-                   OBJDUMP=3D"${OBJDUMP}" \
-                   OBJCOPY=3D"${OBJCOPY}" \
-                   AR=3D"${AR}" \
-                   STRIP=3D"${STRIP}" \
-                   NM=3D"${NM}" \
-                   RANLIB=3D"${RANLIB}" \
-                   firmware=3D"bios" installer
+	oe_runmake firmware=3D"bios" installer
 }
=20
 do_install() {
-	oe_runmake CC=3D"${CC} ${CFLAGS}" LD=3D"${LD}" \
-                   OBJDUMP=3D"${OBJDUMP}" \
-                   OBJCOPY=3D"${OBJCOPY}" \
-                   AR=3D"${AR}" \
-                   STRIP=3D"${STRIP}" \
-                   NM=3D"${NM}" \
-                   RANLIB=3D"${RANLIB}" \
-                   firmware=3D"bios" install INSTALLROOT=3D"${D}"
+	install -d ${D}${bindir}
+	install ${B}/bios/mtools/syslinux ${B}/bios/extlinux/extlinux ${D}${bin=
dir}
+}
+
+#
+# Tasks for target which ship the precompiled bootloader and installer
+#
+do_configure_class-target() {
+	# No need to do anything as we're mostly shipping the precompiled binar=
ies
+	:
+}
+
+do_compile_class-target() {
+	# No need to do anything as we're mostly shipping the precompiled binar=
ies
+	:
+}
+
+do_install_class-target() {
+	oe_runmake firmware=3D"bios" install INSTALLROOT=3D"${D}"
=20
 	install -d ${D}${datadir}/syslinux/
 	install -m 644 ${S}/bios/core/ldlinux.sys ${D}${datadir}/syslinux/
 	install -m 644 ${S}/bios/core/ldlinux.bss ${D}${datadir}/syslinux/
-	install -m 755 ${S}/bios/linux/syslinux-nomtools ${D}${bindir}/
 }
=20
 PACKAGES +=3D "${PN}-nomtools ${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}=
-pxelinux ${PN}-isolinux ${PN}-misc"
--=20
2.25.1

