Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7046571AE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:07:48 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id c20so77807622itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I9iDQ49Zwrs9v2wic5YH2RhdmDlNLEO6AWpvfzBBR6g=;
	b=u6+TBeiuDKaoyme/qstYfwC9pFcm9J+jqyrsYgvM/IZg6/yj6WNbNjNHYARSDzRaE/
	jahCL8lR6xv+Gc3rNf0B6O6VvpW7pY5fnH2+q9wGgeVmALGfXjezB9WShGm36G3H9+yM
	Tt+wFySx1eH9pRkZYGUfylSoCkjDU7H7rYHSmRaf1jlH8BaNBnY7Cbs9dFwNDwv4e9tY
	fD4BsB71RdnYIFnQFECH14z6Yhg09YsftNbK9T1oXqKu0VoQg3Ewj5MSHHU/hlbcRvSj
	V4AJsUzl/4iST22d//5GvxwBEcTsggex2vxoYRG+fuiGvprPgiamzQ2DMfmhAAg2CZvb
	w1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I9iDQ49Zwrs9v2wic5YH2RhdmDlNLEO6AWpvfzBBR6g=;
	b=jTgUKSgYo3AWnCs159tnBOY7ppEKvNYzsJJwg0vBazIDB4p9tTRQ69NcQask7iEWUN
	4gCY1coh9ua1zEfGOdqIWvqIsewYz4tP3+ch4lECJQBvelfNCTjJXq6CIv732mB3QnKo
	4LQxjpF+5lSbWXT5qsFIxZl4XNr/c/ucmIQbGm473uUu+eJwOWmI/2YULyFSSv4WPTHq
	T7UuspQ2kiX3uC6F7XF0nKusEoPTfeXHwwQutmdx6t/0hKPF9Pj44t3GkpuNZ6B4KroY
	+DKzlsPIyud9R8V62t/ujz/rLJG9P9+nCgP5cRHY5CdAYs+JK7UcuOsWBLNyfS9hF6co
	MeDQ==
X-Gm-Message-State: AIkVDXJOT23JsOPBR6VdBVbQQf1jslDDhLl+YWSaad/z19uU2eVDg5SzYUf8BApUWugDI0hx
X-Received: by 10.36.156.132 with SMTP id b126mr3647127ite.91.1484064468490;
	Tue, 10 Jan 2017 08:07:48 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56084.dip0.t-ipconnect.de.
	[87.165.96.132]) by smtp.gmail.com with ESMTPSA id
	m196sm1391971iom.14.2017.01.10.08.07.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 08:07:47 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 17:07:22 +0100
Message-Id: <ebad7d0d2703ab14ebf2c146de22b0a2ca3eb299.1484063948.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484063948.git.patrick.ohly@intel.com>
References: <cover.1484063948.git.patrick.ohly@intel.com>
Subject: [PATCH v2 06/11] ovmf_git.bb: enable Secure Boot
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
X-List-Received-Date: Tue, 10 Jan 2017 16:07:49 -0000

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
 meta/recipes-core/ovmf/ovmf_git.bb | 36 ++++++++++++++++++++++++++++++++++++
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
2.1.4


