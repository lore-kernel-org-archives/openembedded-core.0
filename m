Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id AC002731CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:13:16 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id c7so20738186itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RQ8bwL+8dE5/3eqjWcgeEd6mObrf2vj9ClR9S679XKw=;
	b=AYKjW/a+TjOyWNjudOC2fEVRzM4+MtPSmqbhN65/6VIsCtHIL0rD4A12gQxuY7FFrL
	N0NPhxXPAzqo+5rnu8P/R6Wdv9h/p1e7rQwyxbv13hYXmpAeM8TRgPzJqQnRpHhdnauX
	sVh7f/GukRY16auNrISZVIbpUuWKX3dMmBW5XWkyxCje9TIhaNKjkZJF7fM42OflhDFU
	67eY9kJq0c5UNOvgaqI4TwTXc8/Mz84TMbS3Y8nibnIswAWtPsG2ltGiomzN8AJqxwos
	CP+gnwl6NiTkS2xz/M3n/2irxIBMuXYpChaJa2wZqI8Bh0I8RW86Rma/2oxlTCLd8xnq
	xDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RQ8bwL+8dE5/3eqjWcgeEd6mObrf2vj9ClR9S679XKw=;
	b=dOM4ulT56I1dDFYlaShzRyL448wJQlgrpST/rskruN8OLt31rtMr02eaIJVHmxLDut
	nUt+LDATD4ksrzBAaMA5kB+uY3vF9+AGGx2vxbLRj3/7c2BVxdNYTFrEt4mP7xZ0ksdb
	L/yAnvKGN2gmRB8V+4xXtWOk4ptaLZ5lhpE1RkjFfKl6REgla93A4uAMRhha3XuyIqVV
	fiJpRVDORE2gS9O8ZBEc0IjLDpeneKCNAcMydxdDsrqX9fACEwJZfKdULrlvOMsTG5eT
	Ni4qsxBw0/8SAJ1QQ/8wRAGnm70RL1oAt9bGsiVLqahyVokZ6Ls9lb12GS24A0pqcf4T
	YjIQ==
X-Gm-Message-State: AIkVDXJfqbUUuVr24pVCr6DKUvbW1himIaC/10bVzIVhImPpmndCMPtBHJrZNM+wRUiylGNT
X-Received: by 10.36.92.4 with SMTP id q4mr3763694itb.89.1484921597216;
	Fri, 20 Jan 2017 06:13:17 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id k6sm4573464ioe.1.2017.01.20.06.13.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:13:15 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:12:36 +0100
Message-Id: <9d68428a1d2b7234a1a7ea6057e3b027e454db61.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 05/12] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Fri, 20 Jan 2017 14:13:16 -0000

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
 meta/recipes-core/ovmf/ovmf_git.bb | 42 ++++++++++++++++++++++---------
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
git-series 0.9.1

