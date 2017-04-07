Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F74E77D72
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 08:04:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3784SUS020464
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Apr 2017 01:04:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 7 Apr 2017 01:04:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Apr 2017 16:05:54 +0800
Message-ID: <7299a49474627a414cab3318e88d659fea6a158d.1491551982.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1491551982.git.Qi.Chen@windriver.com>
References: <cover.1491551982.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] qemuboot.bbclass: add two vars for use by runqemu
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
X-List-Received-Date: Fri, 07 Apr 2017 08:04:27 -0000
Content-Type: text/plain

Add STAGING_DIR_TUNCTL_NATIVE and STAGING_DIR_QEMU_BINDIR_NATIVE so that
runqemu could find 'tunctl' and 'qemu-xxx' binaries to run correctly.

[YOCTO #11266]
[YOCTO #11193]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/qemuboot.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 3ca97ca..bd2102b 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -67,12 +67,15 @@ QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
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
1.9.1


