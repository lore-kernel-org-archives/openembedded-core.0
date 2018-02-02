Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20E6971951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 03:22:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w123MpSt020116
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 19:22:51 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 1 Feb 2018 19:22:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 11:23:24 +0800
Message-ID: <c7cc6297a17fd8287d6a2333a60ce4ea62916b6e.1517541572.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517541572.git.liezhi.yang@windriver.com>
References: <cover.1517541572.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] qemuboot.bbclass: qemuboot.conf -> qemuboot.json
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
X-List-Received-Date: Fri, 02 Feb 2018 03:22:50 -0000
Content-Type: text/plain

The qemuboot.conf uses configparser which can't suport upper case as key, and
json is more clearer than configparser and is widely used in oe-core, so use
qemuboot.json to replace qemuboot.conf.

[YOCTO #12503]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/qemuboot.bbclass | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 15a9e63..7c46a85 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -67,7 +67,7 @@ QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?= "/dev/sd"
 
-# Create qemuboot.conf
+# Create qemuboot.json
 addtask do_write_qemuboot_conf after do_rootfs before do_image
 IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
 
@@ -81,14 +81,13 @@ def qemuboot_vars(d):
 do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
 do_write_qemuboot_conf[vardepsexclude] += "TOPDIR"
 python do_write_qemuboot_conf() {
-    import configparser
+    import json
 
-    qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_NAME'))
-    qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
+    qemuboot = "%s/%s.qemuboot.json" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_NAME'))
+    qemuboot_link = "%s/%s.qemuboot.json" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
     finalpath = d.getVar("DEPLOY_DIR_IMAGE")
     topdir = d.getVar('TOPDIR')
-    cf = configparser.ConfigParser()
-    cf.add_section('config_bsp')
+    qb_dict = {}
     for k in sorted(qemuboot_vars(d)):
         # qemu-helper-native sysroot is not removed by rm_work and
         # contains all tools required by runqemu
@@ -101,7 +100,7 @@ python do_write_qemuboot_conf() {
         # and still run them
         if val.startswith(topdir):
             val = os.path.relpath(val, finalpath)
-        cf.set('config_bsp', k, '%s' % val)
+        qb_dict[k] = val
 
     # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a symlink
     # to the kernel file, which hinders relocatability of the qb conf.
@@ -111,11 +110,11 @@ python do_write_qemuboot_conf() {
     # we only want to write out relative paths so that we can relocate images
     # and still run them
     kernel = os.path.relpath(kernel, finalpath)
-    cf.set('config_bsp', 'QB_DEFAULT_KERNEL', kernel)
+    qb_dict['QB_DEFAULT_KERNEL'] = kernel
 
     bb.utils.mkdirhier(os.path.dirname(qemuboot))
     with open(qemuboot, 'w') as f:
-        cf.write(f)
+        json.dump(qb_dict, f, indent=4, sort_keys=True)
 
     if qemuboot_link != qemuboot:
         if os.path.lexists(qemuboot_link):
-- 
2.7.4


