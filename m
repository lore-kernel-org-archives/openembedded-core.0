Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C62B279157
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:47:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7KAlwcu009582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Aug 2018 03:47:58 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 20 Aug 2018 03:47:57 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2018 18:42:24 +0800
Message-ID: <20180820104225.90976-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH 1/2] wic: bootimg-partition: Add support to specify a custom extlinux.conf
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
X-List-Received-Date: Mon, 20 Aug 2018 10:47:59 -0000
Content-Type: text/plain

Add support to specify a custom extlinux.conf via something like:
    bootloader --configfile="extlinux.conf"

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../lib/wic/plugins/source/bootimg-partition.py    | 79 +++++++++++++---------
 1 file changed, 47 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 7d61595d0414..2e9b9f5ed657 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -30,6 +30,7 @@ import re
 from glob import glob
 
 from wic import WicError
+from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
 from wic.misc import exec_cmd, get_bitbake_var
 
@@ -114,38 +115,52 @@ class BootimgPartitionPlugin(SourcePlugin):
         if source_params.get('loader') != "u-boot":
             return
 
-        # The kernel types supported by the sysboot of u-boot
-        kernel_types = ["uImage", "zImage", "Image", "vmlinux", "fitImage"]
-        has_dtb = False
-        fdt_dir = '/'
-        kernel_name = None
-        for task in cls.install_task:
-            src, dst = task
-            # Find the kernel image name
-            for image in kernel_types:
-                if re.match(image, src):
-                    if not kernel_name:
-                        kernel_name = os.path.join('/', dst)
-                    else:
-                        raise WicError('Multi kernel file founded')
-
-            # We suppose that all the dtb are in the same directory
-            if re.search(r'\.dtb', src) and fdt_dir == '/':
-                has_dtb = True
-                fdt_dir = os.path.join(fdt_dir, os.path.dirname(dst))
-
-        if not kernel_name:
-            raise WicError('No kernel file founded')
-
-        # Compose the extlinux.conf
-        extlinux_conf = "default Yocto\n"
-        extlinux_conf += "label Yocto\n"
-        extlinux_conf += "   kernel %s\n" % kernel_name
-        if has_dtb:
-            extlinux_conf += "   fdtdir %s\n" % fdt_dir
-        bootloader = cr.ks.bootloader
-        extlinux_conf += "append root=%s rootwait %s\n" \
-                         % (cr.rootdev, bootloader.append if bootloader.append else '')
+        configfile = cr.ks.bootloader.configfile
+        custom_cfg = None
+        if configfile:
+            custom_cfg = get_custom_config(configfile)
+            if custom_cfg:
+                # Use a custom configuration for extlinux.conf
+                extlinux_conf = custom_cfg
+                logger.debug("Using custom configuration file "
+                             "%s for extlinux.cfg", configfile)
+            else:
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s." % configfile)
+
+        if not custom_cfg:
+            # The kernel types supported by the sysboot of u-boot
+            kernel_types = ["uImage", "zImage", "Image", "vmlinux", "fitImage"]
+            has_dtb = False
+            fdt_dir = '/'
+            kernel_name = None
+            for task in cls.install_task:
+                src, dst = task
+                # Find the kernel image name
+                for image in kernel_types:
+                    if re.match(image, src):
+                        if not kernel_name:
+                            kernel_name = os.path.join('/', dst)
+                        else:
+                            raise WicError('Multi kernel file founded')
+
+                # We suppose that all the dtb are in the same directory
+                if re.search(r'\.dtb', src) and fdt_dir == '/':
+                    has_dtb = True
+                    fdt_dir = os.path.join(fdt_dir, os.path.dirname(dst))
+
+            if not kernel_name:
+                raise WicError('No kernel file founded')
+
+            # Compose the extlinux.conf
+            extlinux_conf = "default Yocto\n"
+            extlinux_conf += "label Yocto\n"
+            extlinux_conf += "   kernel %s\n" % kernel_name
+            if has_dtb:
+                extlinux_conf += "   fdtdir %s\n" % fdt_dir
+            bootloader = cr.ks.bootloader
+            extlinux_conf += "append root=%s rootwait %s\n" \
+                             % (cr.rootdev, bootloader.append if bootloader.append else '')
 
         install_cmd = "install -d %s/extlinux/" % hdddir
         exec_cmd(install_cmd)
-- 
2.14.4


