Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id AB9D7771D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:13:23 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id d9so11170140itc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oB//aAOSXGxe5Tt3UerMUxGPFOl+WosiEqYVDXunE+E=;
	b=MjKeoRco9JsqiCqGGbDLYMLj+8fGDLCDmz2JYmb/KtZjwzSRvYs55hGqlgzFgi7VIP
	3xFn48Sb9fsOdqtSRNdPZc5jTgPH0l1TuXTXnij17Zj3TjddNTbrPsKXfGkMnGpGfA5r
	+lupwN+XaC3ao5l1wsmToRKIqfJbgr65Tg3Q21jUZTCUXYZeRQlU1O6xLyyllyg/6TmY
	k/VpcEm98CuarGAqXYBj1gzZV4XeJsN3JeHz1PNDrgENAj+eqSTKAD7X4i0SUkMsPXZC
	PFmOc3Dw7Tgv3FrUMR/eS9EnVDjRsneQq+gLT715Ji5eQCtNS+Qsv2fYr4TyZxLw1s69
	CXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oB//aAOSXGxe5Tt3UerMUxGPFOl+WosiEqYVDXunE+E=;
	b=gK+Cpt4p6RWm45yC47O+GsqOGLg7UGxaIEmqYVNOhYHWcHB+w6hBclVPw2givekny2
	70EdE2lm3sBS3OzZ+1NtMZK948GsLOVVzJ4Va84Tq8/IFXN6NGo4L/9fnornx8HO5zUo
	dmGwh+ht2DMuUrv7LjfOG+7kjgTyKcFo7K5r4Vn2jRaQpVHG941dVCh2o+V4E92mMAkk
	mQ0pBInN/uk+bYmKrU7CQmcLNFuj4qd/OfmyVW1PdTjGo/bkoPoWDE/yevHIKVAt5Mr5
	5IYn2f6hATRfnGhWVR0A/cam3BYZ07/HFWKPs+/C25a7BR0sLybuTqsl6vieesOb9eM5
	jzDg==
X-Gm-Message-State: AIkVDXK8H8bYU4ZQhGKdjltTDoA7gb5KEpe55yndhdMTB5g/+DDOVzxBCIsL6A7jwBjDrKxi
X-Received: by 10.36.153.197 with SMTP id a188mr3687652ite.5.1484921603529;
	Fri, 20 Jan 2017 06:13:23 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id k6sm4573464ioe.1.2017.01.20.06.13.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:13:22 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:12:38 +0100
Message-Id: <1b008d9bf985062c47e444bbd973e89b48f976fb.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 07/12] ovmf_git.bb: enable Secure Boot
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
X-List-Received-Date: Fri, 20 Jan 2017 14:13:23 -0000

When enabled via PACCKAGECONFIG = "secureboot" (off by default because
of the extra work and license change), the recipe compiles OVMF twice,
once without Secure Boot, once with. This is the same approach as in
https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/edk2.spec

The results are "ovmf.qcow2" and "ovmf.secboot.qcow2" in the
image deploy directory, so
  runqemu <machine> <image> ovmf.secboot
will boot with Secure Boot enabled.

ovmf.secboot.code.qcow2 is provided for those who want separate code
and variable flash drives. The normal ovmf.vars.qcow2 can be used with
it.

In contrast to Fedora, no attempt is made to strip potentially patent
encumbered algorithms out of the OpenSSL archive. OVMF does not use
the ones considered problematic for Fedora, so this shouldn't be a
problem.

Fixes: luv-yocto/#38

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 36 +++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 9989025..bdec6aa 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -1,8 +1,15 @@
 DESCRIPTION = "OVMF - UEFI firmware for Qemu and KVM"
 HOMEPAGE = "http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=OVMF"
 LICENSE = "BSD"
+LICENSE_class-target = "${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'BSD & OpenSSL', 'BSD', d)}"
 LIC_FILES_CHKSUM = "file://OvmfPkg/License.txt;md5=343dc88e82ff33d042074f62050c3496"
 
+# Enabling Secure Boot adds a dependency on OpenSSL and implies
+# compiling OVMF twice, so it is disabled by default. Distros
+# may change that default.
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[secureboot] = ",,,"
+
 SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 	file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch \
 	file://0001-OvmfPkg-Enable-BGRT-in-OVMF.patch \
@@ -10,7 +17,13 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
         "
 
+SRC_URI_append_class-target = " \
+	${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'http://www.openssl.org/source/openssl-1.0.2j.tar.gz;name=openssl;subdir=${S}/CryptoPkg/Library/OpensslLib', '', d)} \
+"
+
 SRCREV="4575a602ca6072ee9d04150b38bfb143cbff8588"
+SRC_URI[openssl.md5sum] = "96322138f0b69e61b7212bc53d5e912b"
+SRC_URI[openssl.sha256sum] = "e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"
 
 inherit deploy
 
@@ -32,6 +45,11 @@ BUILD_OPTIMIZATION="-pipe"
 # OVMF supports IA only, although it could conceivably support ARM someday.
 COMPATIBLE_HOST='(i.86|x86_64).*'
 
+# Additional build flags for OVMF with Secure Boot.
+# Fedora also uses "-D SMM_REQUIRE -D EXCLUDE_SHELL_FROM_FD".
+OVMF_SECURE_BOOT_EXTRA_FLAGS ??= ""
+OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE ${OVMF_SECURE_BOOT_EXTRA_FLAGS}"
+
 do_patch_append_class-native() {
     bb.build.exec_func('do_fix_iasl', d)
     bb.build.exec_func('do_fix_toolchain', d)
@@ -112,10 +130,27 @@ do_compile_class-target() {
     bbnote FIXED_GCCVER is ${FIXED_GCCVER}
     build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
 
+    bbnote "Building without Secure Boot."
+    rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
     ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
     ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.fd
     ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.code.fd
     ln ${build_dir}/FV/OVMF_VARS.fd ${WORKDIR}/ovmf/ovmf.vars.fd
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'true', 'false', d)}; then
+        # See CryptoPkg/Library/OpensslLib/Patch-HOWTO.txt and
+        # https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/ for
+        # building with Secure Boot enabled.
+        bbnote "Building with Secure Boot."
+        rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
+        if ! [ -f ${S}/CryptoPkg/Library/OpensslLib/openssl-*/edk2-patch-applied ]; then
+            ( cd ${S}/CryptoPkg/Library/OpensslLib/openssl-* && patch -p1 <$(echo ../EDKII_openssl-*.patch) && touch edk2-patch-applied )
+        fi
+        ( cd ${S}/CryptoPkg/Library/OpensslLib/ && ./Install.sh )
+        ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${OVMF_SECURE_BOOT_FLAGS}
+        ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.secboot.fd
+        ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.secboot.code.fd
+    fi
 }
 
 do_install_class-native() {
@@ -135,6 +170,7 @@ do_deploy_class-target() {
         ovmf \
         ovmf.code \
         ovmf.vars \
+        ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'ovmf.secboot ovmf.secboot.code', '', d)} \
         ; do
         qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/$i.fd ${DEPLOYDIR}/$i.qcow2
     done
-- 
git-series 0.9.1

