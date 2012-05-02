Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgnA-0000dm-G3
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:08:56 +0200
Received: by mail-pz0-f45.google.com with SMTP id v2so499403dad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QKVj4G7ofk//vqG6uK6qyV6nXD3NGaE9QRNTGL2unZc=;
	b=0BwRs9ErxCwpBTb1yfuduUNHBJNUAGFQ7A/TQgykir9HvbE1OURuxs4qkTgpLdUN/d
	Zn+KTIrOT+3dZP+GqaeEyZ4+Fb4NcIHkFws7BqrDud/nigmVp41uPDRapXQViCRB5LbD
	tBvkhZsps04JP7GNUB1qFmM6mbezZPmp+SrWP0DbZF2pkn+uatlwSoFEB//GITdyRS3p
	CAMTpCl5L5SpaavqLRKNIFq4Dq/BGwG1gsYQu6lwguiBPCuSJTIM3TmtmKA8ql8U0Nij
	t3HQm1jcdJLVE7zHAN0aVzZXDPfSu8XBr9U+UqZQ1gtwsIfwT/SLmUJsPd+IkuKPtKOz
	ypJQ==
Received: by 10.68.190.197 with SMTP id gs5mr835751pbc.87.1335992353750;
	Wed, 02 May 2012 13:59:13 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id vl10sm2960290pbc.37.2012.05.02.13.59.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:59:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:58:14 -0700
Message-Id: <e856f0509fbd6ab1682f7ebabc4a1188d458d6e5.1335992192.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <907b74f1035fcd569920630c6fc68751cfb8ca14.1335992192.git.raj.khem@gmail.com>
References: <907b74f1035fcd569920630c6fc68751cfb8ca14.1335992192.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335992192.git.raj.khem@gmail.com>
References: <cover.1335992192.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] image.bbclass, kernel.bbclass: Use kmod-native instead of module-init-tools-cross
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
X-List-Received-Date: Wed, 02 May 2012 21:08:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image.bbclass  |    2 +-
 meta/classes/kernel.bbclass |    7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 907c59b..4610731 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -178,7 +178,7 @@ fakeroot do_rootfs () {
 		KERNEL_VERSION=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion`
 
 		mkdir -p ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VERSION
-		${TARGET_PREFIX}depmod -a -b ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/System.map-$KERNEL_VERSION $KERNEL_VERSION
+		depmod -a -b ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/System.map-$KERNEL_VERSION $KERNEL_VERSION
 	fi
 
 	${IMAGE_PREPROCESS_COMMAND}
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 139bad9..6334510 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
@@ -269,7 +269,7 @@ if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
 	mkdir -p $D/lib/modules/${KERNEL_VERSION}
 fi
 if [ -n "$D" ]; then
-	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
+	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
 	depmod -a
 fi
@@ -347,9 +347,8 @@ python populate_packages_prepend () {
 		if m:
 			kernelver_stripped = m.group(1)
 		path = d.getVar("PATH", True)
-		host_prefix = d.getVar("HOST_PREFIX", True) or ""
 
-		cmd = "PATH=\"%s\" %sdepmod -n -a -r -b %s -F %s/boot/System.map-%s %s" % (path, host_prefix, dvar, dvar, kernelver, kernelver_stripped)
+		cmd = "PATH=\"%s\" depmod -n -a -b %s -F %s/boot/System.map-%s %s" % (path, dvar, dvar, kernelver, kernelver_stripped)
 		f = os.popen(cmd, 'r')
 
 		deps = {}
-- 
1.7.5.4



