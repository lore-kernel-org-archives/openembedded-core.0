Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A403E77D86
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 09:47:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v379lNcX012313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Apr 2017 02:47:23 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Apr 2017 02:47:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Apr 2017 02:47:14 -0700
Message-ID: <af3b44b2cc2be0771d70599286fa55d6ec3629bf.1491557671.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491557671.git.liezhi.yang@windriver.com>
References: <cover.1491557671.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] qemuboot.bbclass: add two vars for use by runqemu
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
X-List-Received-Date: Fri, 07 Apr 2017 09:47:21 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add STAGING_DIR_TUNCTL_NATIVE and STAGING_DIR_QEMU_BINDIR_NATIVE so that
runqemu could find 'tunctl' and 'qemu-xxx' binaries to run correctly.

[YOCTO #11266]
[YOCTO #11193]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/qemuboot.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 2870388dfb..ac52ef295e 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -70,12 +70,15 @@ QB_DRIVE_TYPE ?= "/dev/sd"
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
 IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
+STAGING_DIR_TUNCTL_NATIVE = "${STAGING_DIR}-components/${BUILD_ARCH}/qemu-helper-native"
+STAGING_DIR_QEMU_BINDIR_NATIVE = "${STAGING_DIR}-components/${BUILD_ARCH}/qemu-native/usr/bin"
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
                 'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
                 'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
-                'STAGING_DIR_HOST']
+                'STAGING_DIR_HOST', 'STAGING_DIR_TUNCTL_NATIVE',
+                'STAGING_DIR_QEMU_BINDIR_NATIVE']
     return build_vars + [k for k in d.keys() if k.startswith('QB_')]
 
 do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
-- 
2.11.0.rc2.dirty


