Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 26A86773EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 15:31:07 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id j13so62845814iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eS+zZKxZ1bpbPAGSQbm3TMkOcvHQM6MN9Xw8p3ziUPg=;
	b=Lt2GJKRL6iY5AyAyICYU9U35PG4r7igg75PPOahWd4GsvbCzO/B1Dbmr/gW+sOHd8W
	LWvB5Ey87sjD/lhlMh/ndm3iF8GDi1cA/Ur2PgrYswx8lfK9Mda9Ogu2Qi2VW0/B6Tv+
	5SCjwUKf+CghAtbgb708jTHDVr1sMYazYDvA4h3zH4LOsLIHR6HvaYmI5KVsnmL41Ahf
	TKwrRovj2HwAM5vfIQ38b4JzMUmBlCDUZVkiZMkHvZP8J4fB5j8C49CTY1Box9iej3gH
	wXnOiKJuUTv8OLVgwsQz1vHF34dNIGP9AEhYgQicQ4EPkIQ+DbnBlwW8OTCj5nHAwD9/
	jK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eS+zZKxZ1bpbPAGSQbm3TMkOcvHQM6MN9Xw8p3ziUPg=;
	b=k7DglWYBQAIRXhS1V/T8rL0rpYE6S7M6GfuKWjTl1YBEK92TX9nlCBeJy/fVN5SG2H
	uHtgeSpue8qMArp0OPuEPvAKRTa3E8O42HqhlKZyTCAGSaxFocnXBHicHJFq+WazDq3d
	jCFnZfa+r2VKG5buszIB7VADhLDYwQ4E6BAHkzZwHrI9QBjzxK4cT93r1K8ABCxoR2Xd
	2vX6i2BbxcSbDX7wJhBSJNETQjXxhul8PLfArsz4ikzfrmYwgjlVKeEC8Yqejz+P5+8H
	0qq+kjr/pst60k2gIgh7CHKm26AyQ7wamnbgBRgVnGYN5KZdVmU6s9U8J7F2NDBspljT
	jk5g==
X-Gm-Message-State: AIkVDXJIeHRS9CTYEdZWfPwZDyRLgQip9srEoYeKZNKTCzubArQp6Wg+i4G2lvoKKywn/7pj
X-Received: by 10.107.18.12 with SMTP id a12mr8774277ioj.155.1485531068033;
	Fri, 27 Jan 2017 07:31:08 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DB2E.dip0.t-ipconnect.de.
	[93.232.219.46]) by smtp.gmail.com with ESMTPSA id
	a128sm1542174itg.22.2017.01.27.07.31.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 07:31:06 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 16:30:35 +0100
Message-Id: <1fa869229cd59e7da9a55a5aa69835a20a78832e.1485530988.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
Subject: [PATCH v5 05/12] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Fri, 27 Jan 2017 15:31:08 -0000

When used with '-drive if=pflash', qemu will store UEFI variables
inside the firmware image file. That is unexpected for a file located in
the sysroot, which should be read-only, while it is normal for image
files in the deploy/images directory. Therefore that directory is a
better place for use with runqemu.

The name was chose so that "runqemu ovmf" can be used as shorthand for
"runqemu <full path>/ovmf.qcow2" by treating "ovmf" as the base name
of the firmware file. "ovmf.secboot.qcow2" is meant to be used for the
Secure Boot enabled firmware.

qcow2 is used because it is needed for "savevm" snapshots of a virtual
machine.

With code and variables stored in the same ovmf.qcow2 it is not
possible to update the firmware code without also overwriting the
variables. For users who care about persistent variables, the code and
variables are also provided as separate files, in ovmf.code.qcow2 and
ovmf.vars.qcow2.

The traditional usage of OVMF via the qemu bios parameter ("biosdir"
and/or "biosfilename" in runqemu) is no longer recommended, and
therefore this recipe no longer provides the bios.bin file. Instead,
OVMF is meant to be used as flash drive in qemu. See the "runqemu:
support UEFI with OVMF firmware" patch for details on how to use OVMF
that way.

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

