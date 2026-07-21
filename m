Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6D5C44532
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:09:02 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23751.1784642932476123433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=jTre822Z;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eysP1dj0HjFpICd2xC/OWeBODD6PtQjrwC1EzYDp7s4=; b=jTre822Z84BFdpyP0MJsW85dC6
	kALhBTsP5I0Zud4yqfZp6wI+H7SpKvOq1WwSfH576g9sOaMIsc9QCfIU3tz/nzB6PtcSTUvs5IFLc
	foQNFv3RwAs32b8qF4FCdcbIdUNTLzAMMzWtVs//THNRTXJTxMrnty10dF7fkL7B5fmYuBuSF9BrK
	JX/x19yC0OMopK1JioPPfLois/FJf1h8SISGloUEl7vqApjXbhK1HtohBCZH8ppSeQ/CF6iHzSObj
	agFncEx4e0T0EXwBgNys6pX3mwZWgvKp3KSZ5TTda5kY7ltl+EIBrUiTLExxORYZcL/Nb799fOIAO
	khg8ukCw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmB9O-000Hna-2E;
	Tue, 21 Jul 2026 16:08:50 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmB9O-000GRg-02;
	Tue, 21 Jul 2026 16:08:50 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 3/3] kernel-fit-image: introduce FIT_OS variable to override 'os' field
Date: Tue, 21 Jul 2026 16:08:08 +0200
Message-ID: <cc74b230a2f430ed44ee59f4ac883a5fe0330220.1784642607.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784642607.git.nora.schiffer@ew.tq-group.com>
References: <cover.1784642607.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28067/Tue Jul 21 08:23:56 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241530

U-Boot can load an EFI application from a FIT image; this requires
setting the OS to "efi" (usually in combination with type
"kernel_noload"). Doing so is a convenient approach for giving the OS
access to EFI services while preserving other benefits of FIT image boot.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass |  3 ++-
 meta/conf/image-fitimage.conf                |  4 ++++
 meta/lib/oe/fitimage.py                      | 11 ++++++-----
 meta/lib/oeqa/selftest/cases/fitimage.py     | 13 +++++++++++--
 4 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index cfe43a5a30..3ace09ef5c 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -76,7 +76,8 @@ python do_compile() {
     # Collect all the its nodes before the its file is generated and mkimage gets executed
     root_node = oe.fitimage.ItsNodeRootKernel(
         d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
-        d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CONF_PREFIX"),
+        d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'), d.getVar('FIT_OS'),
+        d.getVar("FIT_CONF_PREFIX"),
         oe.types.boolean(d.getVar('FIT_KERNEL_SIGN_ENABLE')), d.getVar("FIT_KERNEL_SIGN_KEYDIR"),
         d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
         d.getVar('FIT_MKIMAGE_EXTRA_OPTS'),
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 2fdb816d55..a06d30e494 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -37,6 +37,10 @@ FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
 
 FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio"
 
+# os field of the kernel and various other images in the FIT image. Set to "efi"
+# to load a kernel with EFI stub as an EFI application.
+FIT_OS ?= "linux"
+
 # Allow user to support special use cases where the kernel binary is
 # not included in the FIT image itself.
 # This is particularly useful for UKI-based setups, where the kernel
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 9cde6cedc4..d4dacdd508 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -153,7 +153,7 @@ class ItsNodeRootKernel(ItsNode):
     If a device tree included in the FIT image, the default configuration is the
     firt DTB. If there is no dtb present than the default configuation the kernel.
     """
-    def __init__(self, description, address_cells, host_prefix, arch, conf_prefix,
+    def __init__(self, description, address_cells, host_prefix, arch, fit_os, conf_prefix,
                  sign_enable=False, sign_keydir=None,
                  mkimage=None, mkimage_dtcopts=None,
                  mkimage_extra_opts=None,
@@ -171,6 +171,7 @@ class ItsNodeRootKernel(ItsNode):
 
         self._host_prefix = host_prefix
         self._arch = arch
+        self._os = fit_os
         self._conf_prefix = conf_prefix
 
         # Signature related properties
@@ -279,7 +280,7 @@ class ItsNodeRootKernel(ItsNode):
         opt_props = {
             "data": '/incbin/("' + kernel_path + '")',
             "arch": self._arch,
-            "os": "linux",
+            "os": self._os,
         }
         if load:
             opt_props["load"] = f"<{load}>"
@@ -370,7 +371,7 @@ class ItsNodeRootKernel(ItsNode):
             {
                 "data": '/incbin/("' + setup_path + '")',
                 "arch": self._arch,
-                "os": "linux",
+                "os": self._os,
                 "load": load,
                 "entry": entry
             }
@@ -385,7 +386,7 @@ class ItsNodeRootKernel(ItsNode):
             "data": '/incbin/("' + ramdisk_path + '")',
             "type": "ramdisk",
             "arch": self._arch,
-            "os": "linux"
+            "os": self._os,
         }
         if load:
             opt_props["load"] = f"<{load}>"
@@ -406,7 +407,7 @@ class ItsNodeRootKernel(ItsNode):
         opt_props = {
             "data": '/incbin/("' + filepath + '")',
             "arch": arch if arch is not None else self._arch,
-            "os": fit_os if fit_os is not None else "linux",
+            "os": fit_os if fit_os is not None else self._os,
         }
 
         if load:
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 9abe1d0c93..b3c54cebed 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -680,6 +680,7 @@ class KernelFitImageBase(FitImageTestCase):
             'FIT_LOADABLES',
             'FIT_LOADABLE_ENTRYPOINT',
             'FIT_LOADABLE_LOADADDRESS',
+            'FIT_OS',
             'FIT_SIGN_ALG',
             'FIT_SIGN_INDIVIDUAL',
             'FIT_UBOOT_ENV',
@@ -915,7 +916,7 @@ class KernelFitImageBase(FitImageTestCase):
             # 'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";', defined based on files in TMPDIR, not ideal...
             'data = /incbin/("linux.bin");',
             'arch = "' + str(bb_vars['UBOOT_ARCH']) + '";',
-            'os = "linux";',
+            'os = "%s";' % bb_vars['FIT_OS'],
             'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
             'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
         ]
@@ -1510,6 +1511,7 @@ class FitImagePyTests(KernelFitImageBase):
             'FIT_KEY_SIGN_PKCS': "-x509",
             'FIT_LOADABLES': "",
             'FIT_LINUX_BIN': "linux.bin",
+            'FIT_OS': "linux",
             'FIT_PAD_ALG': "pkcs-1.5",
             'FIT_SIGN_ALG': "rsa2048",
             'FIT_SIGN_INDIVIDUAL': "0",
@@ -1550,7 +1552,8 @@ class FitImagePyTests(KernelFitImageBase):
 
         root_node = oe.fitimage.ItsNodeRootKernel(
             bb_vars["FIT_DESC"], bb_vars["FIT_ADDRESS_CELLS"],
-            bb_vars['HOST_PREFIX'], bb_vars['UBOOT_ARCH'],  bb_vars["FIT_CONF_PREFIX"],
+            bb_vars['HOST_PREFIX'], bb_vars['UBOOT_ARCH'], bb_vars['FIT_OS'],
+            bb_vars["FIT_CONF_PREFIX"],
             oe.types.boolean(bb_vars['UBOOT_SIGN_ENABLE']), bb_vars["UBOOT_SIGN_KEYDIR"],
             bb_vars["UBOOT_MKIMAGE"], bb_vars["UBOOT_MKIMAGE_DTCOPTS"],
             bb_vars["UBOOT_MKIMAGE_SIGN"], bb_vars["UBOOT_MKIMAGE_SIGN_ARGS"],
@@ -1656,6 +1659,12 @@ class FitImagePyTests(KernelFitImageBase):
         }
         self._test_fitimage_py(bb_vars_overrides)
 
+    def test_fitimage_py_conf_os(self):
+        """Test FIT_OS functionality"""
+        bb_vars_overrides = {
+            'FIT_OS': "efi",
+        }
+        self._test_fitimage_py(bb_vars_overrides)
 
 class UBootFitImageTests(FitImageTestCase):
     """Test cases for the uboot-sign bbclass"""
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


