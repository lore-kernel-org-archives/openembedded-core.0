Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 27A2971AFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 00:55:32 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u132so350662wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 17:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m+MDGqMGsQQgxDkwbZ4Y81EL1EfckHlj7G8H28Psgv8=;
	b=Jhi/PacpCWXTbiA5mTfDMRjbfTvOMqgX6bRocmPEbJC+q4OaD84Wkfqfth61Xfkj6R
	0K9LjPlw9IDAlRKAA8WaW95Nndw59JmD7Zu+RDlCighrZJReSc16vroQNmVN39cgVmWD
	AJO/kjPGPf+VGAySTiC0oxA4KeDYKF0ipaKM6lJJf/8ElTJFjzFJyhIuSQTcHlJgkdfQ
	KqTtZ/ljjldA7KJCW35wSQdyNX+ZfTz1bnHzKzwm4NNB6Ar+bjt+cTg9jSHsdy3/p2Ry
	M1kN00T65AUNqujzzO/3DFDfpvpmUfzTVsNb2VcOTyP6nCFkBkzmUPhok2/65xVUpLHJ
	s9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m+MDGqMGsQQgxDkwbZ4Y81EL1EfckHlj7G8H28Psgv8=;
	b=f0kiI0zRMlpL2SV6nMmcqlkFY3j4e/pSdeCW3ffoz5lWmpeU+TmJSOft1J5YqsC1un
	bjDTr6Tm0yPmeUIpPTwjw9PUec57iWuAr2NFMSVXttz2duakRxGkXc6AfyBntC9GC+U4
	d9sr2HAKeA7oJN/LtfjVglPJCiiYSOoFq6hpIYfygts+BQSc0sGaNWviwxS0P6UDTi51
	2iZ/g2irw525ZHUYpY7siRJ0DQoCYuRtUOxdR3r2ltbKwlWY7ufbsccGmanR5FV+fF4l
	GicqscqX1JNipIKoU2mnD6ARPCC+O+5nYhd9JjT+TkBB6x7JtCDxOp8QnvnDC4TaykPY
	VdZg==
X-Gm-Message-State: AFeK/H08Z6C3IcL9zzRyhF4aekoOF4leRbuzqkD3hfCMdw047tUvp64bgpNhb05EO71lFw==
X-Received: by 10.28.60.65 with SMTP id j62mr254967wma.73.1490057733854;
	Mon, 20 Mar 2017 17:55:33 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([223.104.101.84])
	by smtp.gmail.com with ESMTPSA id 10sm8882258wrz.44.2017.03.20.17.55.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 17:55:33 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 01:55:01 +0100
Message-Id: <1490057703-12819-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
References: <1490057703-12819-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 3/5] kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
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
X-List-Received-Date: Tue, 21 Mar 2017 00:55:33 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

There is a mess after KERNEL_IMAGETYPES was introduced in commit 849b67b2:
[ kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time ]

There are two packages both providing vmlinux image if 'vmlinux' is set in
KERNEL_IMAGETYPES, they are kernel-vmlinux and kernel-image-vmlinux, to
let them to be able to coexist, kernel-image-vmlinux was set to empty
allowable, but its postinst/postrm scripts still remain trying to install/rm
a update-alternatives link to /boot/vmlinux-${KERNEL_VERSION_NAME} but that
file is actually being provided by the other package kernel-vmlinux.

Fixed this mess by appending vmlinux to KERNEL_IMAGETYPES and process it
in anonymous python function. It would not change the original behavior,
all the generated packages would be same with before except that the
ALLOW_EMPTY variable, it is removed in this patch.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel.bbclass | 47 +++++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8feb2c1..425f6cb 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -14,6 +14,7 @@ OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
 
+KERNEL_IMAGETYPES_append = " vmlinux"
 KERNEL_IMAGETYPE ?= "zImage"
 INITRAMFS_IMAGE ?= ""
 INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
@@ -35,38 +36,33 @@ python __anonymous () {
     import re
 
     # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
-    type = d.getVar('KERNEL_IMAGETYPE') or ""
-    alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
-    types = d.getVar('KERNEL_IMAGETYPES') or ""
-    if type not in types.split():
-        types = (type + ' ' + types).strip()
-    if alttype not in types.split():
-        types = (alttype + ' ' + types).strip()
+    types = set((d.getVar('KERNEL_IMAGETYPES') or "").split())
+    types.add(d.getVar('KERNEL_IMAGETYPE') or "")
+    types.add(d.getVar('KERNEL_ALT_IMAGETYPE') or "")
+    types = ' '.join(sorted(types)).strip()
     d.setVar('KERNEL_IMAGETYPES', types)
-
-    typeformake = re.sub(r'\.gz', '', types)
-    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
+    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', re.sub(r'\.gz', '', types))
 
     for type in types.split():
-        typelower = type.lower()
         imagedest = d.getVar('KERNEL_IMAGEDEST')
+        if type == "vmlinux":
+            typelower = type.lower()
+        else:
+            typelower = "image-%s" % type.lower()
 
-        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
-
-        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
-
-        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
-
-        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' + typelower + '-${KERNEL_VERSION_PKG_NAME}')
+        d.appendVar('PACKAGES', ' kernel-%s' % typelower)
+        if type != 'vmlinux' or d.getVar('KERNEL_IMAGETYPE') == 'vmlinux':
+            d.appendVar('RDEPENDS_kernel-image', ' kernel-%s' % typelower)
 
-        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
+        d.setVar('FILES_kernel-%s' % typelower, '/%s/%s-${KERNEL_VERSION_NAME}' % (imagedest, type))
+        d.setVar('PKG_kernel-%s' % typelower, 'kernel-%s-${KERNEL_VERSION_PKG_NAME}' % typelower)
 
         priority = d.getVar('KERNEL_PRIORITY')
-        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
-        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
+        postinst = '#!/bin/sh\nupdate-alternatives --install /%s/%s %s %s-${KERNEL_VERSION_NAME} %s || true\n' % (imagedest, type, type, type, priority)
+        d.setVar('pkg_postinst_kernel-%s' % typelower, postinst)
 
-        postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
-        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
+        postrm = '#!/bin/sh\nupdate-alternatives --remove %s %s-${KERNEL_VERSION_NAME} || true\n' % (type, type)
+        d.setVar('pkg_postrm_kernel-%s' % typelower, postrm)
 
     image = d.getVar('INITRAMFS_IMAGE')
     if image:
@@ -319,7 +315,6 @@ kernel_do_install() {
 	done
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
-	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
@@ -484,19 +479,17 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
-PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
+PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-modules"
 FILES_${PN} = ""
 FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = ""
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
-FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
 FILES_kernel-modules = ""
 RDEPENDS_kernel = "kernel-base"
 # Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
 RDEPENDS_kernel-base ?= "kernel-image"
 PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
-RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', 'kernel-vmlinux', '', d)}"
 PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
 RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel = "1"
-- 
2.7.4


