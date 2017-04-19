Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A4ACC71C72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 19:46:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2017 12:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,222,1488873600"; d="scan'208";a="76410982"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga002.jf.intel.com with ESMTP; 19 Apr 2017 12:46:16 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 12:49:04 -0700
Message-Id: <d82c57b76da9eb71b7713e22c72f46190a01b28c.1492631156.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1492631156.git.brian.avery@intel.com>
References: <cover.1492631156.git.brian.avery@intel.com>
Subject: [PATCH 3/3] qemuboot.bbclass: save relative paths in conf file
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
X-List-Received-Date: Wed, 19 Apr 2017 19:46:15 -0000

This saves relative paths in the qemuboot.conf file instead of absolute
paths. This is to allow the images and kernels to be relocated and still
have the testimage and runqemu work.

[YOCTO #11375]

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta/classes/qemuboot.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index cc5314e..86b3060 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -84,6 +84,7 @@ python do_write_qemuboot_conf() {
 
     qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_NAME'))
     qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
+    topdir="%s/"%(d.getVar('TOPDIR')).replace("//","/")
     cf = configparser.ConfigParser()
     cf.add_section('config_bsp')
     for k in qemuboot_vars(d):
@@ -94,6 +95,9 @@ python do_write_qemuboot_conf() {
                                'qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/')
         else:
             val = d.getVar(k)
+        # we only want to write out relative paths so that we can relocate images
+        # and still run them
+        val=val.replace(topdir,"")
         cf.set('config_bsp', k, '%s' % val)
 
     # QB_DEFAULT_KERNEL's value of KERNEL_IMAGETYPE is the name of a symlink
@@ -101,6 +105,9 @@ python do_write_qemuboot_conf() {
     # Read the link and replace it with the full filename of the target.
     kernel_link = os.path.join(d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('QB_DEFAULT_KERNEL'))
     kernel = os.path.realpath(kernel_link)
+    # we only want to write out relative paths so that we can relocate images
+    # and still run them
+    kernel=kernel.replace(topdir,"")
     cf.set('config_bsp', 'QB_DEFAULT_KERNEL', kernel)
 
     bb.utils.mkdirhier(os.path.dirname(qemuboot))
-- 
1.9.1


