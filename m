Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361C0C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 11:12:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10715.1636542757078251469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 03:12:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93EC2101E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 03:12:36 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23D8F3F718
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 03:12:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta: use ln -rs instead of lnr
Date: Wed, 10 Nov 2021 11:12:34 +0000
Message-Id: <20211110111234.2187460-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 11:12:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158063

lnr is a script in oe-core that creates relative symlinks, with the same
behaviour as `ln --relative --symlink`.  It was added back in 2014[1] as
not all of the supported host distributions at the time shipped
coreutils 8.16, the first release with --relative.

However the oldest coreutils release in the supported distributions is
now 8.22 in CentOS 7, so lnr can be deprecated and users switched to ln.

[1] 6ae3b85eaffd1b0b6914422e8de7c1230723157d

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/image.bbclass                             | 10 +++++-----
 meta/classes/populate_sdk_ext.bbclass                  |  4 ++--
 meta/recipes-core/glibc/glibc-package.inc              |  4 ++--
 .../images/build-appliance-image_15.0.0.bb             |  2 +-
 meta/recipes-core/musl/gcompat_git.bb                  |  2 +-
 meta/recipes-core/musl/musl_git.bb                     |  2 +-
 meta/recipes-core/ncurses/ncurses.inc                  |  4 ++--
 meta/recipes-core/os-release/os-release.bb             |  2 +-
 meta/recipes-devtools/dnf/dnf_4.10.0.bb                |  4 ++--
 meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb         |  2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb       |  2 +-
 meta/recipes-kernel/kmod/kmod_git.bb                   |  4 ++--
 meta/recipes-kernel/linux/kernel-devsrc.bb             |  2 +-
 13 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2fa69a40d1..6c759fdf70 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -622,20 +622,20 @@ deltask do_package_write_rpm
 create_merged_usr_symlinks() {
     root=3D"$1"
     install -d $root${base_bindir} $root${base_sbindir} $root${base_libd=
ir}
-    lnr $root${base_bindir} $root/bin
-    lnr $root${base_sbindir} $root/sbin
-    lnr $root${base_libdir} $root/${baselib}
+    ln -rs $root${base_bindir} $root/bin
+    ln -rs $root${base_sbindir} $root/sbin
+    ln -rs $root${base_libdir} $root/${baselib}
=20
     if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
        install -d $root${nonarch_base_libdir}
-       lnr $root${nonarch_base_libdir} $root/lib
+       ln -rs $root${nonarch_base_libdir} $root/lib
     fi
=20
     # create base links for multilibs
     multi_libdirs=3D"${@d.getVar('MULTILIB_VARIANTS')}"
     for d in $multi_libdirs; do
         install -d $root${exec_prefix}/$d
-        lnr $root${exec_prefix}/$d $root/$d
+        ln -rs $root${exec_prefix}/$d $root/$d
     done
 }
=20
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populat=
e_sdk_ext.bbclass
index 9187f53f13..ef93b6a826 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -626,7 +626,7 @@ install_tools() {
 	for script in $scripts; do
 		for scriptfn in `find ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath} -maxde=
pth 1 -executable -name "$script"`; do
 			targetscriptfn=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/$=
(basename $scriptfn)"
-			test -e ${targetscriptfn} || lnr ${scriptfn} ${targetscriptfn}
+			test -e ${targetscriptfn} || ln -rs ${scriptfn} ${targetscriptfn}
 		done
 	done
 	# We can't use the same method as above because files in the sysroot wo=
n't exist at this point
@@ -634,7 +634,7 @@ install_tools() {
 	unfsd_path=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/unfsd"
 	if [ "${SDK_INCLUDE_TOOLCHAIN}" =3D "1" -a ! -e $unfsd_path ] ; then
 		binrelpath=3D${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE'), d.g=
etVar('TMPDIR'))}
-		lnr ${SDK_OUTPUT}/${SDKPATH}/tmp/$binrelpath/unfsd $unfsd_path
+		ln -rs ${SDK_OUTPUT}/${SDKPATH}/tmp/$binrelpath/unfsd $unfsd_path
 	fi
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
=20
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
index 571ae7ae09..54e2a08906 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -119,8 +119,8 @@ do_install() {
 		ln -s ${@oe.path.relative('${root_prefix}/lib', '${base_libdir}')}/${A=
RCH_DYNAMIC_LOADER} \
 				${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}
 	fi
-        lnr ${D}${base_libdir}/libpthread.so.0 ${D}${libdir}/libpthread.=
so
-        lnr ${D}${base_libdir}/librt.so.1 ${D}${libdir}/librt.so
+        ln -rs ${D}${base_libdir}/libpthread.so.0 ${D}${libdir}/libpthre=
ad.so
+        ln -rs ${D}${base_libdir}/librt.so.1 ${D}${libdir}/librt.so
 }
=20
 def get_libc_fpu_setting(bb, d):
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/m=
eta/recipes-core/images/build-appliance-image_15.0.0.bb
index 94cafdbbe4..8cac636581 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -87,7 +87,7 @@ fakeroot do_populate_poky_src () {
=20
 	# Load tap/tun at startup
 	rm -f ${IMAGE_ROOTFS}/sbin/iptables
-	lnr ${IMAGE_ROOTFS}/usr/sbin/iptables ${IMAGE_ROOTFS}/sbin/iptables
+	ln -rs ${IMAGE_ROOTFS}/usr/sbin/iptables ${IMAGE_ROOTFS}/sbin/iptables
 	echo "tun" >> ${IMAGE_ROOTFS}/etc/modules
=20
 	# Use Clearlooks GTK+ theme
diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/mu=
sl/gcompat_git.bb
index 6e5cc11d5d..955cc3c010 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -37,7 +37,7 @@ do_install () {
 	oe_runmake install 'DESTDIR=3D${D}'
 	if [ "${SITEINFO_BITS}" =3D "64" ]; then
 		install -d ${D}/lib64
-		lnr ${D}${GLIBC_LDSO} ${D}/lib64/`basename ${GLIBC_LDSO}`
+		ln -rs ${D}${GLIBC_LDSO} ${D}/lib64/`basename ${GLIBC_LDSO}`
 	fi
 }
=20
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
index 03ab0a449f..50daca1eff 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -66,7 +66,7 @@ do_install() {
         echo "${base_libdir}" > ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_AR=
CH}.path
         echo "${libdir}" >> ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.=
path
 	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
-	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
+	ln -rs ${D}${libdir}/libc.so ${D}${bindir}/ldd
 }
=20
 FILES:${PN} +=3D "/lib/ld-musl-${MUSL_LDSO_ARCH}.so.1 ${sysconfdir}/ld-m=
usl-${MUSL_LDSO_ARCH}.path"
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
index 64cce329aa..3f04545465 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -242,10 +242,10 @@ do_install() {
             mv ${D}${libdir}/libtinfo.so.* ${D}${base_libdir}
             rm ${D}${libdir}/libtinfo.so
=20
-            # Use lnr to ensure this is a relative link despite absolute=
 paths
+            # Use ln -rs to ensure this is a relative link despite absol=
ute paths
             # (as we can't know the relationship between base_libdir and=
 libdir).
             # At some point we can rely on coreutils 8.16 which has ln -=
r.
-            lnr ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.=
so
+            ln -rs ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtin=
fo.so
         fi
         if [ -d "${D}${includedir}/ncurses" ]; then
             for f in `find ${D}${includedir}/ncurses -name "*.h"`
diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-co=
re/os-release/os-release.bb
index 38ee4f993b..8847fe30c3 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -47,7 +47,7 @@ do_compile[vardeps] +=3D "${OS_RELEASE_FIELDS}"
 do_install () {
     install -d ${D}${nonarch_libdir} ${D}${sysconfdir}
     install -m 0644 os-release ${D}${nonarch_libdir}/
-    lnr ${D}${nonarch_libdir}/os-release ${D}${sysconfdir}/os-release
+    ln -rs ${D}${nonarch_libdir}/os-release ${D}${sysconfdir}/os-release
 }
=20
 FILES:${PN} +=3D "${nonarch_libdir}/os-release"
diff --git a/meta/recipes-devtools/dnf/dnf_4.10.0.bb b/meta/recipes-devto=
ols/dnf/dnf_4.10.0.bb
index e4432c7f09..cef2c03e4e 100644
--- a/meta/recipes-devtools/dnf/dnf_4.10.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
@@ -63,8 +63,8 @@ RRECOMMENDS:${PN}:class-target +=3D "gnupg"
 # .spec file in dnf source tree does (and then Fedora and dnf documentat=
ion
 # says that dnf binary is plain 'dnf').
 do_install:append() {
-        lnr ${D}/${bindir}/dnf-3 ${D}/${bindir}/dnf
-        lnr ${D}/${bindir}/dnf-automatic-3 ${D}/${bindir}/dnf-automatic
+        ln -rs ${D}/${bindir}/dnf-3 ${D}/${bindir}/dnf
+        ln -rs ${D}/${bindir}/dnf-automatic-3 ${D}/${bindir}/dnf-automat=
ic
 }
=20
 # Direct dnf-native to read rpm configuration from our sysroot, not the =
one it was compiled in
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_1.8.0.bb
index 29cf4a6a94..887e15e28c 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.8.0.bb
@@ -59,7 +59,7 @@ pkgconf_sstate_fixup_esdk () {
    if [ "${BB_CURRENTTASK}" =3D "populate_sysroot_setscene" -a "${WITHIN=
_EXT_SDK}" =3D "1" ] ; then
        pkgconfdir=3D"${SSTATE_INSTDIR}/recipe-sysroot-native/${bindir_na=
tive}"
        mv $pkgconfdir/pkg-config $pkgconfdir/pkg-config.real
-       lnr $pkgconfdir/pkg-config-esdk $pkgconfdir/pkg-config
+       ln -rs $pkgconfdir/pkg-config-esdk $pkgconfdir/pkg-config
        sed -i -e "s|^pkg-config|pkg-config.real|" $pkgconfdir/pkg-config=
-native
    fi
 }
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/reci=
pes-devtools/pkgconfig/pkgconfig_git.bb
index 39b87ec829..c220bafd90 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -67,7 +67,7 @@ pkgconfig_sstate_fixup_esdk () {
 	if [ "${BB_CURRENTTASK}" =3D "populate_sysroot_setscene" -a "${WITHIN_E=
XT_SDK}" =3D "1" ] ; then
 		pkgconfdir=3D"${SSTATE_INSTDIR}/recipe-sysroot-native/${bindir_native}=
"
 		mv $pkgconfdir/pkg-config $pkgconfdir/pkg-config.real
-		lnr $pkgconfdir/pkg-config-esdk $pkgconfdir/pkg-config
+		ln -rs $pkgconfdir/pkg-config-esdk $pkgconfdir/pkg-config
 		sed -i -e "s|^pkg-config|pkg-config.real|" $pkgconfdir/pkg-config-nati=
ve
 	fi
 }
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/k=
mod/kmod_git.bb
index eb5d176ded..9bd66de430 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -19,9 +19,9 @@ do_install:append () {
         install -dm755 ${D}${base_bindir}
         install -dm755 ${D}${base_sbindir}
         # add symlinks to kmod
-        lnr ${D}${base_bindir}/kmod ${D}${base_bindir}/lsmod
+        ln -rs ${D}${base_bindir}/kmod ${D}${base_bindir}/lsmod
         for tool in insmod rmmod depmod modinfo modprobe; do
-                lnr ${D}${base_bindir}/kmod ${D}${base_sbindir}/${tool}
+                ln -rs ${D}${base_bindir}/kmod ${D}${base_sbindir}/${too=
l}
         done
         # configuration directories
         install -dm755 ${D}${nonarch_base_libdir}/depmod.d
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
index f22fac5bd6..4ceb35f0d2 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -48,7 +48,7 @@ do_install() {
     mkdir -p ${D}/usr/src
     (
 	cd ${D}/usr/src
-	lnr ${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
+	ln -rs ${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
     )
=20
     # for on target purposes, we unify build and source
--=20
2.25.1


