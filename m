Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtEll-0000tT-Tr
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:45:22 +0100
Received: by mail-pz0-f47.google.com with SMTP id n34so83755dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=VZGSkd8CLCm/RCF/HjcOwSCwQjhDr1Au6F9KQd7Zl2o=;
	b=PhRHVP16aZSzU5a1bz9FIJmLP0pKCyWLB1LrIq33kssGT7mLmgS22Gsri/v3Orm8am
	uBJ9uIMrtBa8tduDzLCbe/TkX2/Y1PAR4yUQA/M0Si6OIp86thAegxZ+QR8TU0M82ODR
	LFqCfSwzbLlhECkK/NU0jAUwIRxQHivujnNe4=
Received: by 10.68.240.235 with SMTP id wd11mr16005646pbc.119.1328258246719;
	Fri, 03 Feb 2012 00:37:26 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm11478262pbc.5.2012.02.03.00.37.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:37:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:14 -0800
Message-Id: <dcf14e4fc890b13b17f685d14c3967ed350f6c52.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
References: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
Subject: [PATCH 09/14] image.bbclass, kernel.bbclass: Use kmod-native instead of module-init-tools-cross
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2012 08:45:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image.bbclass  |    2 +-
 meta/classes/kernel.bbclass |    9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3034725..adb9b39 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -173,7 +173,7 @@ fakeroot do_rootfs () {
 		KERNEL_VERSION=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion`
 
 		mkdir -p ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VERSION
-		${TARGET_PREFIX}depmod -a -b ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/System.map-$KERNEL_VERSION $KERNEL_VERSION
+		depmod -a -b ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/System.map-$KERNEL_VERSION $KERNEL_VERSION
 	fi
 
 	${IMAGE_PREPROCESS_COMMAND}
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ec5d65e..be54f8e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
@@ -259,7 +259,7 @@ if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
 	mkdir -p $D/lib/modules/${KERNEL_VERSION}
 fi
 if [ -n "$D" ]; then
-	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
+	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
 	depmod -a
 fi
@@ -267,7 +267,7 @@ fi
 
 pkg_postinst_modules () {
 if [ -n "$D" ]; then
-	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
+	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
 	depmod -a
 	update-modules || true
@@ -339,9 +339,8 @@ python populate_packages_prepend () {
 		if m:
 			kernelver_stripped = m.group(1)
 		path = d.getVar("PATH", 1)
-		host_prefix = d.getVar("HOST_PREFIX", 1) or ""
 
-		cmd = "PATH=\"%s\" %sdepmod -n -a -r -b %s -F %s/boot/System.map-%s %s" % (path, host_prefix, dvar, dvar, kernelver, kernelver_stripped)
+		cmd = "PATH=\"%s\" depmod -n -a -b %s -F %s/boot/System.map-%s %s" % (path, dvar, dvar, kernelver, kernelver_stripped)
 		f = os.popen(cmd, 'r')
 
 		deps = {}
-- 
1.7.5.4



