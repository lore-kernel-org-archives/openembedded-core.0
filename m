Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 839836D1E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 18:36:34 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so859900eek.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 10:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=MxD/Xhi4YmmLpdsxvlsVAAzDQqNYOO81DxN1BQUc+Ws=;
	b=ySTTXbi5ICjavJa3hrMmJP7QkeINCPlNE4+mqeMAzlrT2I3NI7+VKDsDlNAEEg+SpH
	aL29Eli4wyM6aYzROH31swkhZup0tBTEPEWlGq268QjwZVHm21OPi2Fw8pxBKqoa90fB
	ah9EstK6nE2oeH+2pG9Hwxx9Rx1JK/Nxe/rmunBKkjII3Ojbu02wjvYUYWm29r4Sa3vk
	lIRE1+u+8fZjuAOla7yt7hKnn32EP/JYZdjZzldvfYp7GUECCT+SqggH4A3H1bN74Q8W
	rvJnKKjSCiM6S9rxPeUDskUWKbF2wv2AKI7QPIqa5jEycyZzHu70LhPWSpr83N5tLTmD
	B7bw==
X-Received: by 10.15.52.73 with SMTP id o49mr47640838eew.60.1389206195167;
	Wed, 08 Jan 2014 10:36:35 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z42sm191928419eeo.17.2014.01.08.10.36.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 10:36:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 19:36:37 +0100
Message-Id: <04e87d4649894b064ca86c70c4391553bedbd350.1389206129.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389206129.git.Martin.Jansa@gmail.com>
References: <cover.1389206129.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1389206129.git.Martin.Jansa@gmail.com>
References: <cover.1389206129.git.Martin.Jansa@gmail.com>
Subject: [dora][PATCH 4/4] kernel.bbclass: Stop bundle_initramfs thwarting sstate cache and fix race
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
X-List-Received-Date: Wed, 08 Jan 2014 18:36:34 -0000

From: Mike Crowe <mac@mcrowe.com>

The new do_bundle_initramfs task introduced in
609d5a9ab9e58bb1c2bcc2145399fbc8b701b85a defeats using the sstate
cache. The kernel is resurrected from the sstate cache but ends up being
built again since do_bundle_initramfs depends on do_compile.

The task is no longer nostamp to avoid causing unnecessary rebuilds. The
sstate checksum stamps should know when to rebuild.

The task now runs before do_deploy and part of the work has been moved to
do_deploy where it now writes to ${DEPLOYDIR} rather than
${DEPLOY_DIR_IMAGE} so that the files end up in sstate.

The task can also race against do_install since both call into the kernel
build system. This is fixed by making do_bundle_initramfs run after
do_install (which therefore also fixes the problem that
3baa63b4d588c3262254528b406ede265dd117bf was addressing.)

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1374e68..e639bd5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -134,25 +134,14 @@ do_bundle_initramfs () {
 		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
 		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
 		echo "${B}/${KERNEL_OUTPUT}.initramfs"
-		cd ${B}
-		# Update deploy directory
-		if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
-			echo "Copying deploy kernel-initramfs image and setting up links..."
-			initramfs_base_name=${INITRAMFS_BASE_NAME}
-			initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
-			install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOY_DIR_IMAGE}/${initramfs_base_name}.bin
-			cd ${DEPLOY_DIR_IMAGE}
-			ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
-		fi
 	fi
 }
-do_bundle_initramfs[nostamp] = "1"
 
 python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_compile before do_build
+addtask bundle_initramfs after do_install before do_deploy
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
@@ -464,6 +453,17 @@ kernel_do_deploy() {
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+
+	cd ${B}
+	# Update deploy directory
+	if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
+		echo "Copying deploy kernel-initramfs image and setting up links..."
+		initramfs_base_name=${INITRAMFS_BASE_NAME}
+		initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
+		install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
+		cd ${DEPLOYDIR}
+		ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
+	fi
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 do_deploy[prefuncs] += "package_get_auto_pr"
-- 
1.8.5.2


