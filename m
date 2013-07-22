Return-Path: <andre.draszik@linaro.org>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 77243608CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 14:02:32 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id s1so3646503qcw.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 07:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=v1Osk9JjpNW+Dle5gFSJq+tBkNf1q6s5RN3kW0/WxzU=;
	b=RoSth1uhxOowRAhU7UyHCe4CffIPZPg6M9Ok7sfiqRwuEiyFMnH5lUzzIV91FLMqXw
	C0ph/mmsDtWmhkOhurXJ4DqyEREg0VWWGSj7hS4N4KaLSRTC8l9UfqadZIxBLeqUzopj
	VpGAploSJNzDaIvxhIoFSFHAd5exkoIfzvtD8TLsfbrzPA7RTVTqr9Di+u5DF96K0QS/
	kDDX9JSAHlrMD1aMXQ5HOqOysAOTm/Ipw+93uxT9f8dsvWF8VyshCCE+Krk/mzH9o0no
	4nVG2Dj0abGuVvwXR8aFPJ8qE+OHxCLKreLdaxlp2QlHXl2E5kM/+Zm4up9pFw4e1qVR
	fu2g==
X-Received: by 10.49.12.145 with SMTP id y17mr32729444qeb.7.1374501752775;
	Mon, 22 Jul 2013 07:02:32 -0700 (PDT)
Received: from bril0118.bri.st.com (git.linaro.org. [54.235.93.228])
	by mx.google.com with ESMTPSA id g4sm18429454qez.0.2013.07.22.07.02.30
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 07:02:32 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2013 15:02:26 +0100
Message-Id: <1374501746-23540-1-git-send-email-andre.draszik@linaro.org>
X-Mailer: git-send-email 1.8.2
In-Reply-To: <CAPaOLoJa1UjGaPqVeSmJavm0rMzNoFE6+KzfDO3ALOjRJeJ3Hg@mail.gmail.com>
References: <CAPaOLoJa1UjGaPqVeSmJavm0rMzNoFE6+KzfDO3ALOjRJeJ3Hg@mail.gmail.com>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQkD8xHXozybcUcIce0jmbTlvD2/24PqpdMp6OpmiVu+CPH373UVeQixS6+8pcVkd61TLbw3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-dtb: allow to build dtb using support from kernel
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
X-List-Received-Date: Mon, 22 Jul 2013 14:02:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, OE is unable to use the linux kernel's built-in
support to generate a device tree blob (dtb). This is an
issue for device tree source (dts) files that need to be run
through CPP (dtsp).

The kernel build system has built-in support for device tree
source files that /include/ additional files and it also
supports the source file to be pre-processed using CPP.

This commits lets OE use kbuild if $KERNEL_DEVICETREE points
to file(s) that are located in arch/${ARCH}/boot/dts/, e.g.
KERNEL_DEVICETREE = "<machine>.dts". In this case, no
dependency is added on dtc-native, as that is not needed any
more.

The previous way of handling dts files, i.e. compilation via
the stand-alone dtc-native, is still supported - it is triggered
by specifying the full path to the dts file, as before, e.g.
KERNEL_DEVICETREE = "arch/${ARCH}/boot/dts/<machine>.dts"

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 75 +++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 7747718..75b8b76 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -1,28 +1,66 @@
+inherit kernel-arch
+
 # Support for device tree generation
 FILES_kernel-devicetree = "/boot/devicetree*"
 KERNEL_DEVICETREE_FLAGS ?= "-R 8 -p 0x3000"
 
 python __anonymous () {
+    from os import path
+
     devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
     if devicetree:
-        depends = d.getVar("DEPENDS", True)
-        d.setVar("DEPENDS", "%s dtc-native" % depends)
+        S = d.getVar("S", True)
+        for DTS_FILE in devicetree.split():
+            DTS_FILE = S + "/" + DTS_FILE
+            if os.path.exists(DTS_FILE):
+                # full path given, use dtc-native
+                print "old style KERNEL_DEVICETREE, adding depend on dtc-native"
+                depends = d.getVar("DEPENDS", True)
+                d.setVar("DEPENDS", "%s dtc-native" % depends)
+            else:
+                # new style - it's just a file name, under arch/${ARCH}/boot/dts
+                # we don't need dtc-native, as we use the kernel's compiler
+                print "new style KERNEL_DEVICETREE"
         packages = d.getVar("PACKAGES", True)
         d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
 }
 
-do_install_append() {
+do_compile_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
 		for DTS_FILE in ${KERNEL_DEVICETREE}; do
 			if [ ! -f ${DTS_FILE} ]; then
-				echo "Warning: ${DTS_FILE} is not available!"
-				continue
+				if [ ! -f arch/${ARCH}/boot/dts/${DTS_FILE} ]; then
+					echo "Warning: ${DTS_FILE} is not available!"
+					continue
+				fi
+
+				# standard build using kbuild
+				echo "Info: standard kbuild for device tree blob"
+				DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+
+				unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+				oe_runmake ${DTS_BASE_NAME}.dtb CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 			fi
+		done
+	fi
+}
+
+do_install_append() {
+	if test -n "${KERNEL_DEVICETREE}"; then
+		for DTS_FILE in ${KERNEL_DEVICETREE}; do
 			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
-			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-			dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
-			install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
+			if [ ! -f ${DTS_FILE} ]; then
+				if [ ! -f arch/${ARCH}/boot/dts/${DTS_FILE} ]; then
+					echo "Warning: ${DTS_FILE} is not available!"
+					continue
+				fi
+
+				install -m 0644 arch/${ARCH}/boot/${DTS_BASE_NAME}.dtb ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
+				continue
+			fi
+			dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME}.dtb ${DTS_FILE}
+			install -m 0644 ${DTS_BASE_NAME}.dtb ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
 		done
 	fi
 }
@@ -30,15 +68,28 @@ do_install_append() {
 do_deploy_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
 		for DTS_FILE in ${KERNEL_DEVICETREE}; do
+			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
 			if [ ! -f ${DTS_FILE} ]; then
-				echo "Warning: ${DTS_FILE} is not available!"
-				continue
+				if [ ! -f arch/${ARCH}/boot/dts/${DTS_FILE} ]; then
+					echo "Warning: ${DTS_FILE} is not available!"
+					continue
+				fi
+
+				# standard build using kbuild
+				echo "Info: standard kbuild for device tree blob"
 			fi
-			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+
 			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+
 			install -d ${DEPLOYDIR}
-			install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR}/${DTB_NAME}.dtb
+
+			if [ -f arch/${ARCH}/boot/dts/${DTS_FILE} ]; then
+				install -m 0644 ${B}/arch/${ARCH}/boot/${DTS_BASE_NAME}.dtb ${DEPLOYDIR}/${DTB_NAME}.dtb
+			else
+				install -m 0644 ${B}/${DTS_BASE_NAME}.dtb ${DEPLOYDIR}/${DTB_NAME}.dtb
+			fi
+
 			cd ${DEPLOYDIR}
 			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
 			cd -
-- 
1.8.2


