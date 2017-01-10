Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 352EB71B13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:07:42 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id r185so51338069ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=djqCuLBuH7QOxzQhYZm63gE1zjfcurCWxsbvAqZI+OY=;
	b=cPXIXDqtUS6yVor6BoNkahn7pAbf+nnlfZ7s7/FIcNE2TxNRKQ5VGTCtVWmlP2aaaX
	T+EDWZlONYw4oQTWu/nmlF5AuELRIVfXymUfxZfGeIFgsyZoq9JxtP+3ch2WjKErKdA1
	UNHBOtYOWpV6Ot/iVXWF1yM+/PelXsIBEVB2T/TsH3iyvsfHJbXXEofAGTvau+SBJqJU
	FZVCgN9W88eU8Hkwrg2l6u3JJC2IsYNYziFJZXzTa6RJrki26c/ZcArCiJvWfr58f8gy
	tnAylDjUpBnnDj+tnX5f6Lq6NotaY4AU1lfYLtvru9pyogvJV+9wnZOBR/MZ1W2+YXjQ
	pteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=djqCuLBuH7QOxzQhYZm63gE1zjfcurCWxsbvAqZI+OY=;
	b=ZbCpfhQ71DP1FawSxJzLAI5v2HuVaQE1cb24O+0bV8yl2Jk8wGt0TIt9SVF9cUZsm6
	jLS8WcPTjTZvZ7bx4eNIBIq0/oaI4aMxQZASoKKVDrGAKZTERqbazHXQWYzRLT2Dx3GU
	LkZBs3BkxZAmy1Y31/j5bstO6uz8NCQNL4LVA4uHvDrAuVNFmR0dc8yfhVub5l+Tat0o
	t+sMzPcQQtGDPjTDlQCPAT2ekqEqXJG0HU60CvoDBeV42ztzGO73Yw3MoSYWb1GcqMjY
	1sn2uY5+Uv06+oCA+Kp00BaH2hOA4SC7y3obWYFty/JIViPQupHV3vdw0mow6FMvq8zA
	9QnA==
X-Gm-Message-State: AIkVDXIKYarrnqfMmBPZrLG9HuQcA3BFcvXP+UM95/d0yAWTUdaub0/EufCIE5bJgl120AaF
X-Received: by 10.36.250.201 with SMTP id v192mr3979202ith.43.1484064462779;
	Tue, 10 Jan 2017 08:07:42 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56084.dip0.t-ipconnect.de.
	[87.165.96.132]) by smtp.gmail.com with ESMTPSA id
	m196sm1391971iom.14.2017.01.10.08.07.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 08:07:41 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 17:07:20 +0100
Message-Id: <a02253796dc02f6a2aafad6cbd350439656a07cc.1484063948.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484063948.git.patrick.ohly@intel.com>
References: <cover.1484063948.git.patrick.ohly@intel.com>
Subject: [PATCH v2 04/11] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Tue, 10 Jan 2017 16:07:42 -0000

When used with '-drive if=pflash', qemu will store UEFI variables
inside the firmware image file. That is unexpected for a file located in
the sysroot, which should be read-only, while it is normal for image
files in the deploy/images directory. Therefore that directory is a
better place for use with runqemu.

The name was chose so that "runqemu ovmf" can be used as shorthand for
"runqemu <full path>/ovmf.qcow2" by treating "ovmf" as the base name
of the BIOS file. "ovmf.secboot.qcow2" is meant to be used for the
Secure Boot enabled firmware.

qcow2 is used because it is needed for "savevm" snapshots of a virtual
machine.

With code and variables stored in the same ovmf.qcow2 it is not
possible to update the firmware code without also overwriting the
variables. For users who care about persistent variables, the code and
variables are also provided as separate files, in ovmf.code.qcow2 and
ovmf.vars.qcow2.

The traditional usage of ovmf via the qemu bios parameter is no longer
supported and therefore it is not necessary to create a "bios.bin"
file in the target sysroot.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 42 ++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 13b583b..895ed6c 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -12,11 +12,13 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 
 SRCREV="4575a602ca6072ee9d04150b38bfb143cbff8588"
 
+inherit deploy
+
 PARALLEL_MAKE = ""
 
 S = "${WORKDIR}/git"
 
-DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native"
+DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native qemu-native"
 
 DEPENDS_class-target="ovmf-native"
 
@@ -97,9 +99,22 @@ do_compile_class-target() {
         OVMF_ARCH="IA32"
     fi
 
+    # ${WORKDIR}/ovmf is a well-known location where do_install and
+    # do_deploy will be able to find the files.
+    rm -rf ${WORKDIR}/ovmf
+    mkdir ${WORKDIR}/ovmf
+    OVMF_DIR_SUFFIX="X64"
+    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
+        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
+    fi
     FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
-    echo FIXED_GCCVER is ${FIXED_GCCVER}
+    bbnote FIXED_GCCVER is ${FIXED_GCCVER}
+    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
+
     ${S}/OvmfPkg/build.sh -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
+    ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.fd
+    ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.code.fd
+    ln ${build_dir}/FV/OVMF_VARS.fd ${WORKDIR}/ovmf/ovmf.vars.fd
 }
 
 do_install_class-native() {
@@ -108,16 +123,21 @@ do_install_class-native() {
 }
 
 do_install_class-target() {
-    OVMF_DIR_SUFFIX="X64"
-    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
-        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
-    fi
-    install -d ${D}${datadir}/ovmf
+}
 
-    FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
-    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
-    install -m 0755 ${build_dir}/FV/OVMF.fd \
-	${D}${datadir}/ovmf/bios.bin
+do_deploy() {
+}
+do_deploy[cleandirs] = "${DEPLOYDIR}"
+do_deploy_class-target() {
+    # For use with "runqemu ovmf".
+    for i in \
+        ovmf \
+        ovmf.code \
+        ovmf.vars \
+        ; do
+        qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/$i.fd ${DEPLOYDIR}/$i.qcow2
+    done
 }
+addtask do_deploy after do_compile before do_build
 
 BBCLASSEXTEND = "native"
-- 
2.1.4


