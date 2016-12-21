Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id B94E2772CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:11:43 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id p42so204908209ioo.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 05:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZIEBMfCgbj5oH9X14jDeN3jNgPv8bbpf679dfMXSs5c=;
	b=HwWM+bVWHdBMUPz8uobxwWE9T9vqUwtkSjzWtax6r47/IT9CLqwpIhhzO5Jf5tLYci
	eDgiZGjuZe+vugwr6cOZdOktv4hrcJl0dvk9uDpIpdFOtvLXwH1rNB67FAX+A7JvLqaw
	e/+teEzf75y+u1yF70IFwV6+xR994hHzF3Cn/+rZWChapbJjoG8c6AYovCNOrppumnwM
	vQD5pEBUGvPk1kTnsaPesU1+k/jG2nDj+SmIDo8FwFqO5sFVFfvHi5LsqtPekx2eGqAt
	JPsM7YN3pVpIOH8niL3ptrMuKWn2ttM9oH0WBIPdZy9KbrX5/f2nj9svrszxrr1m3qM0
	3Brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZIEBMfCgbj5oH9X14jDeN3jNgPv8bbpf679dfMXSs5c=;
	b=a3TBK3rs171CD91BaLFYFCITDwzJR31/6G8gbgyDily84+uJbMZ9hwYFP5LO5x0zbQ
	TycXSCuh4NxvmuROStj3Nrs4SCwUtwKC2hYPqseDcnPlZyEfYIw2TjdtAeDr/NSzNujp
	T4/dIImnkXOdunbNVOI7PuSD2bNYAKhV50bCkONfPm42CQk6ReuXWygOme+2oE0BZLYg
	S7gmlOaqgUhPpsRB6Ffj+NxCORfOX8pe7lYdBc3MUuonb7lLehbLfkF0Tw11JBj7ptXe
	7zc1brRAhxyQXflJx5e93fAqZ7slB/LLvd1iJhLnxgy0wHsoav3iRYV8UFlDyizQYNLu
	I+ZA==
X-Gm-Message-State: AIkVDXJtPdX0l0bpoG5lZ+H+ykumfx4Q399jxjk8HkAEpbxgqq2nmGqWshtCMSVePFigu1Fx
X-Received: by 10.107.160.15 with SMTP id j15mr5879691ioe.180.1482325904734;
	Wed, 21 Dec 2016 05:11:44 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F3CB.dip0.t-ipconnect.de.
	[93.232.243.203]) by smtp.gmail.com with ESMTPSA id
	o65sm12103726ioe.15.2016.12.21.05.11.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 05:11:43 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	ricardo.neri@intel.com
Date: Wed, 21 Dec 2016 14:11:25 +0100
Message-Id: <ce57b729e9ac830d808040b7e3ff1fc128475420.1482324587.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
Subject: [PATCH 4/9] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Wed, 21 Dec 2016 13:11:43 -0000

When used with '-drive if=pflash', qemu will store UEFI variables
inside the firmware image file. That is unexpected for a file located in
the sysroot, which should be read-only, while it is normal for image
files in the deploy/images directory. Therefore that directory is a
better place for use with runqemu.

The name was chose so that "runqemu ovmf" can be used as shorthand for
"runqemu <full path>/ovmf.qcow2" by treating "ovmf" as the base name
of the BIOS file. "ovmf_secboot.qcow2" is meant to be used for the
Secure Boot enabled BIOS. qcow2 is used because it is needed for
"savevm" snapshots of a virtual machine.

Alternatively, OVMF_CODE.fd (read-only) and OVMF_VARS.fd (read/write)
could be used. That would then allow updating the firmware of an
existing machine without wiping out the variables set
earlier. Configuring that in qemu would be more complicated, so for
now the simpler approach with combined code and variable store is
used.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 13b583b..d0441d1 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -16,7 +16,7 @@ PARALLEL_MAKE = ""
 
 S = "${WORKDIR}/git"
 
-DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native"
+DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native qemu-native"
 
 DEPENDS_class-target="ovmf-native"
 
@@ -97,9 +97,20 @@ do_compile_class-target() {
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
+    ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.fd
 }
 
 do_install_class-native() {
@@ -108,16 +119,18 @@ do_install_class-native() {
 }
 
 do_install_class-target() {
-    OVMF_DIR_SUFFIX="X64"
-    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
-        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
-    fi
+    # Traditional location.
     install -d ${D}${datadir}/ovmf
+    install -m 0755 ${WORKDIR}/ovmf/OVMF.fd ${D}${datadir}/ovmf/bios.bin
+}
 
-    FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
-    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
-    install -m 0755 ${build_dir}/FV/OVMF.fd \
-	${D}${datadir}/ovmf/bios.bin
+inherit deploy
+do_deploy() {
+}
+do_deploy_class-target() {
+    # For use with "runqemu ovmf".
+    qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/OVMF.fd ${DEPLOYDIR}/ovmf.qcow2
 }
+addtask do_deploy after do_compile before do_build
 
 BBCLASSEXTEND = "native"
-- 
2.1.4


