Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4946FEF5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 13:14:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z133so10228420wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SXuToKubfPdfua7SWlFEhXVPyIdBKE6J1JXA30jnOFQ=;
	b=h875nelHYL0ILoCG5qMojz68K/Ivs/rqgoCN+dCiTGiZATizTlUa50tsZmenWjeUBU
	1qaUD7pQFl46Mew8OA05SVif06wnDEIb07CLeVY2sMncvQSdZLKKc4PwDZHqxE0IDBJO
	uYCEZMC8P7FXUudjpIbrgqSYoXM0k03XvAA8meexjNqDk/92gQcDtkn24xWgacfE5pjI
	/eM48LEbA+mgC+GGF408P7omXVlKacEMpjDyu82LTghW39t1DFLwxqnjs64gvn39cBhF
	4X51ONwBRhWwTaK+UkSOKuV26rKh5NgLeor7QFOE7RPpCKR5x770qA/yOmpjTRK0e0WK
	xX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SXuToKubfPdfua7SWlFEhXVPyIdBKE6J1JXA30jnOFQ=;
	b=FUTq6DkoGYdtF5PF4wIphEHKRw5zDhdLUEFJy0E6Jo8YAiTnnypZ+rMM8vhDhDZcZZ
	l9BjE/ehXm2AEE+nP3/gffEasvd/lDzs9JUJr3tyDcmq/sn5jFMbWCKGfZjCxUatoGbx
	Ckdlh9huXgeLYXSzIClQfDQlGMvViVjFakrxFCLVXDrDJwOTdG06TWSMMKMdh4IZhS8D
	H5/OBN7m7YurWzkz+lwpZmh+u9zt8eVShRMTQlOrJXpoNObi28aQc/0cuWglXYyItKHw
	BKRrM1Aif+drLw9T5pPRWg/WCBHdc1AJ12hDhblMYY1/7rYUTVqSq3jkKYQ1nF5y90Rx
	aVQQ==
X-Gm-Message-State: AFeK/H3UvbZHlGnx6xXZTDh9kgKnGQOlAIyka+4WAHCHnFEIfOiPHvYFFR3Lykyz1Npezw==
X-Received: by 10.28.226.215 with SMTP id z206mr5822940wmg.92.1489929245612;
	Sun, 19 Mar 2017 06:14:05 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162])
	by smtp.gmail.com with ESMTPSA id 36sm1114616wrk.15.2017.03.19.06.14.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Mar 2017 06:14:05 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Mar 2017 14:13:35 +0100
Message-Id: <1489929217-24568-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489929217-24568-1-git-send-email-liu.ming50@gmail.com>
References: <1489929217-24568-1-git-send-email-liu.ming50@gmail.com>
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 2/4] kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
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
X-List-Received-Date: Sun, 19 Mar 2017 13:14:05 -0000

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
index 6905a9b..1a4335c 100644
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


