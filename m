Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 77437772C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:11:49 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id 75so78680976ite.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 05:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lbs/vqhj2czx+E3EUPe5dDq22qE0SgFYSp9N8Rp6Wv0=;
	b=ckLvNQnB9la/xj6/Uu237dJtvmpQrifhS8YPvWGzx2XcDEt7bBXpS08azWo+LKSVEF
	urZobwfUMIyUA/GCSYoawb3hTy1zrpo21uMgyihy8IJTk5StLRA8MqSYSO6PxBj4fkG9
	LKNdHTkjM24HpmimaQQxtwFPxz90zNI8jNBKSeeJ2GeN0u+HtXVBYm4vt7SFLNMtD679
	bo89ms8KxP5oWol/p8cW4oJzwsS9U0vQ4RsZeUIOtHmprL4rLQGpkd9CgYFRQeMm1jgV
	pztIa/2hkz41xngB7OLSEEGlRUC3AAsHH6Knv5Ar6HpYEQARRhAX8ubBqR+hp5AcTDEm
	ezUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lbs/vqhj2czx+E3EUPe5dDq22qE0SgFYSp9N8Rp6Wv0=;
	b=nUKafjVOrK9UyFcNkU4KPwNaEWU578BmORvr/h7DxQc3VtHoVoksYxSfT0b/gcTzfv
	AcgloMJjNDqcuWoz14wWs7Rk7x5F/HXc23EZ6cADQWGJgPQcxDRZmTZRFoNmOEN4vEuR
	a/iJHnzOfUwLm5ap+AUiw7FvbkVLO5Zzz36ALztR2BKNj2W6NbqqEyNfx35BpYNK9GJV
	u8XrAtMc8sSwtdTpohH4KnpMP2ddtqH23p+OhXArtd3QyyCHZiavUIY9FgwJZAy9by9p
	BU+6SuCnDKcchUbt/uJmswc6e87X+tvLh+azglrZ3rt3UltAHpqfQEuCxhb/8Pf/CUs7
	b6vw==
X-Gm-Message-State: AIkVDXLIpC6aDaWM1GEHBCw3uqlF+9mWc1q39VUEwxnHJHloFrgOxZT2zZK8dLTnbcQJjObV
X-Received: by 10.36.68.130 with SMTP id o124mr7441737ita.62.1482325910408;
	Wed, 21 Dec 2016 05:11:50 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F3CB.dip0.t-ipconnect.de.
	[93.232.243.203]) by smtp.gmail.com with ESMTPSA id
	o65sm12103726ioe.15.2016.12.21.05.11.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 05:11:49 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	ricardo.neri@intel.com
Date: Wed, 21 Dec 2016 14:11:27 +0100
Message-Id: <12e72d8f27d856bcc2007ca5226a693a68fe2ae0.1482324587.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
Subject: [PATCH 6/9] ovmf_git.bb: enable Secure Boot
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
X-List-Received-Date: Wed, 21 Dec 2016 13:11:49 -0000

The recipe now compiles OVMF twice, once without Secure Boot, once
with. This is the same approach as in
https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/edk2.spec

The results are "ovmf.qcow2" and "ovmf.secboot.qcow2" in the
image deploy directory, so
  runqemu <machine> <image> ovmf.secboot
will boot with Secure Boot enabled.

In contrast to Fedora, no attempt is made to strip potentially patent
encumbered algorithms out of the OpenSSL archive. OVMF does not use
the ones considered problematic for Fedora, so this shouldn't be a
problem.

Fixes: luv-yocto/#38

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 67e65b8..c4eedf0 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "OVMF - UEFI firmware for Qemu and KVM"
 HOMEPAGE = "http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=OVMF"
-LICENSE = "BSD"
+LICENSE = "BSD & OpenSSL"
 LIC_FILES_CHKSUM = "file://OvmfPkg/License.txt;md5=343dc88e82ff33d042074f62050c3496"
 
 SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
@@ -10,7 +10,13 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
         "
 
+SRC_URI_append_class-target = " \
+	http://www.openssl.org/source/openssl-1.0.2j.tar.gz;name=openssl;subdir=${S}/CryptoPkg/Library/OpensslLib \
+"
+
 SRCREV="4575a602ca6072ee9d04150b38bfb143cbff8588"
+SRC_URI[openssl.md5sum] = "96322138f0b69e61b7212bc53d5e912b"
+SRC_URI[openssl.sha256sum] = "e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"
 
 PARALLEL_MAKE_class-native = ""
 
@@ -30,6 +36,10 @@ BUILD_OPTIMIZATION="-pipe"
 # OVMF supports IA only, although it could conceivably support ARM someday.
 COMPATIBLE_HOST='(i.86|x86_64).*'
 
+# Additional build flags for OVMF with Secure Boot.
+# Fedora also uses "-D SMM_REQUIRE -D EXCLUDE_SHELL_FROM_FD".
+OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE"
+
 do_patch_append_class-native() {
     bb.build.exec_func('do_fix_iasl', d)
     bb.build.exec_func('do_fix_toolchain', d)
@@ -110,8 +120,22 @@ do_compile_class-target() {
     bbnote FIXED_GCCVER is ${FIXED_GCCVER}
     build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
 
+    bbnote "Building without Secure Boot."
+    rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
     ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
     ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.fd
+
+    # See CryptoPkg/Library/OpensslLib/Patch-HOWTO.txt and
+    # https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/ for
+    # building with Secure Boot enabled.
+    bbnote "Building with Secure Boot."
+    rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
+    if ! [ -f ${S}/CryptoPkg/Library/OpensslLib/openssl-*/edk2-patch-applied ]; then
+        ( cd ${S}/CryptoPkg/Library/OpensslLib/openssl-* && patch -p1 <$(echo ../EDKII_openssl-*.patch) && touch edk2-patch-applied )
+    fi
+    ( cd ${S}/CryptoPkg/Library/OpensslLib/ && ./Install.sh )
+    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${OVMF_SECURE_BOOT_FLAGS}
+    ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.secboot.fd
 }
 
 do_install_class-native() {
@@ -131,6 +155,7 @@ do_deploy() {
 do_deploy_class-target() {
     # For use with "runqemu ovmf".
     qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/OVMF.fd ${DEPLOYDIR}/ovmf.qcow2
+    qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/OVMF.secboot.fd ${DEPLOYDIR}/ovmf.secboot.qcow2
 }
 addtask do_deploy after do_compile before do_build
 
-- 
2.1.4


