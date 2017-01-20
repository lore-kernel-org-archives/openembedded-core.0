Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 158F873180
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:38:35 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id 203so20134060ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oB//aAOSXGxe5Tt3UerMUxGPFOl+WosiEqYVDXunE+E=;
	b=zKGTmcgyRy5eTdhnzEd10rJD8YqpjvbzgQsltGdJ040aXoxopXo4WbR3WRcT1i0QLi
	RjVOSemPRY12XlXrpR8MzkTZ187ObdswhYPLKZvAG+9YoHohxTDRQa0PFGOs8K3/4jrm
	HaSyF2BxElqNDqnM+IxAwFEhQyZZE3fvPb4UuVAV51Ew83i6Dt9+2OQQjlA6cYBfvVZe
	++Yl4Pde1jvW6brJXiniXSEfJZmBbxZSrIXRPN3fqwwccrci7xDWyxeoumSq1Va2QwRL
	W8HfolL3kW3xQM54aWuDyxlxtwiwhT/Qg6FGaLLXazXxRb0Q7mUHVA9YDB4CjyCjLsIV
	O8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=oB//aAOSXGxe5Tt3UerMUxGPFOl+WosiEqYVDXunE+E=;
	b=Utqysz3uUh5nnMEiWZn2079VUkUCrhg31z7bNe3NfqorFS/0yO1nilBFAPNxv7ednd
	9yiuVmC/JTD5sJfa3o+oQyEr9fBczYjoPMKw/uaFoZZyVEzHYfJx3u5ZMZh32rlnfALO
	Urwn/Od+Bq2g54PalGnceFE4lOs6WDqtvlQxDPJJ4cHpv7LBvvKl91wOgmUJGIM+nBDk
	03bvBRbhQeFD7CMswvQJ3V88laoijqVJ2+nlnp7cyOJ+zmAqSMb4yS8VHvSTG41npEY0
	8EZtrDSnzfc0syRtvna+cdLfwrgt/N55VZajLsVDjgoi+wI/AFXeBu//6575ZfmSy7+K
	yfMg==
X-Gm-Message-State: AIkVDXKn4OOJunaYMQibcqYsM0YEo10tPGMepQjp8/lrvPDC4rMUeuAmQ1paftNr3ia+ELf5
X-Received: by 10.107.128.204 with SMTP id k73mr12525227ioi.188.1484919516198; 
	Fri, 20 Jan 2017 05:38:36 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id e24sm1362361itd.6.2017.01.20.05.38.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 05:38:34 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:38:03 +0100
Message-Id: <b3aae36c4e8bc9035b2607e662230ca10c83ddac.1484919259.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 06/12] ovmf_git.bb: enable Secure Boot
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
X-List-Received-Date: Fri, 20 Jan 2017 13:38:36 -0000

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

