Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F60C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 09:06:35 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27294.1785143188663106637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 02:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=IsN3Hj/q;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=n0rd2LxpWjYfSzHmqxkLFuE6SpTxR43bym0vBKFhms0=; b=IsN3Hj/qXSH47HvpoBonEpQeUD
	VCnY6qQOr9rNSJVhHljC7EgXmEgCNwKk3t0KsnQHKVCsPHKXE19nwGr2gLoeolX9/EvuOC2Cj44m7
	ujiON0Jzd+GIjDXfD1jOiRlBIbH0QCIj9zbFDS7DL5HsKpBo7Ftdv9JkjUcw7WdY6UhVVQxabUNSV
	crTwxvW5UovYs/BxDUhdVvGT003AnJ1gehHy9L4iOK74nXlqLRY2uSR07Aex36s+1yxbXuOY8Bwkb
	Xk+EBGUIGT7AYB0sJ4ef2Xbb5f5zP/4gr+1Lq6pv4VkSSCxa6nmfzstVKc9x/ULZmA41OQwt+gON6
	S0ZsGNEg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1woHI2-000AR7-19;
	Mon, 27 Jul 2026 11:06:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1woHI2-000A13-2B;
	Mon, 27 Jul 2026 11:06:26 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/3] kernel-fit-image: reintroduce option to replace kernel image
Date: Mon, 27 Jul 2026 11:06:00 +0200
Message-ID: <20260727090601.489155-3-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727090601.489155-1-nora.schiffer@ew.tq-group.com>
References: <20260727090601.489155-1-nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28074/Mon Jul 27 08:25:14 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 09:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242071

A similar feature was added in commit 9c8ef2119949 ("kernel-fit-image:
control kernel section with FIT_LINUX_BIN") and subsequently reverted in
commit 6eae261b6f52 ("Revert "kernel-fit-image: control kernel section
with FIT_LINUX_BIN"") due to its incomplete implementation and lack of
tests. Reintroduce an improved version:

- The FIT_LINUX_BIN variable (which had been left unused) is renamed to
  FIT_KERNEL_FILENAME. It can now actually be used to select a different
  file from DEPLOY_DIR_IMAGE. The file will be compressed using
  FIT_KERNEL_COMP_ALG, rather than than letting the kernel recipe handle
  this through kernel-fit-extra-artifacts.bbclass.
- Alternatively, FIT_KERNEL_FILENAME_COMPRESSED can be used to select a
  pre-compressed file from DEPLOY_DIR_IMAGE. In this case,
  FIT_KERNEL_COMP_ALG only controls the "compression" field of the
  generated FIT image.
- To avoid breaking backwards compatibility,
  FIT_KERNEL_FILENAME_COMPRESSED defaults to "linux.bin". As a special
  case, the compression algorithm will be read from "linux_comp" for
  linux.bin.
- Add tests.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 53 +++++++++--
 meta/conf/image-fitimage.conf                | 24 ++++-
 meta/lib/oeqa/selftest/cases/fitimage.py     | 96 +++++++++++++++++++-
 3 files changed, 159 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 3ace09ef5c..4ace6871f8 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -64,6 +64,7 @@ def apply_dtbvendored(d,dtb):
 
 python do_compile() {
     import shutil
+    import subprocess
     import oe.fitimage
 
     itsfile = "fit-image.its"
@@ -88,12 +89,52 @@ python do_compile() {
     )
 
     # Prepare a kernel image section.
-    shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), "linux.bin")
-    with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_f:
-        linux_comp = linux_comp_f.read()
-    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
-        d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
-        d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
+    kernel = d.getVar('FIT_KERNEL_FILENAME')
+    kernel_compressed = d.getVar('FIT_KERNEL_FILENAME_COMPRESSED')
+    kernel_comp_alg = d.getVar('FIT_KERNEL_COMP_ALG')
+
+    COMP_ALGS = {
+        'gzip': ['gzip', '-9', '--stdout'],
+        'lzo': ['lzop', '-9', '--stdout'],
+        'lzma': ['xz', '--format=lzma', '-f', '-6', '--stdout'],
+    }
+
+    if kernel and kernel_comp_alg == 'none':
+        kernel_compressed = kernel
+        kernel = None
+    elif not kernel and kernel_compressed == 'linux.bin':
+        # Backwards compatibility
+        bb.warn('FIT_KERNEL_FILENAME_COMPRESSED = "linux.bin" is deprecated. Set FIT_KERNEL_FILENAME or FIT_KERNEL_FILENAME_COMPRESSED explicitly.')
+        with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_f:
+            kernel_comp_alg = linux_comp_f.read()
+
+    if kernel:
+        kernel_path = os.path.join(kernel_deploydir, kernel)
+        kernel_name = os.path.basename(kernel) + '.compressed'
+
+        try:
+            cmd = COMP_ALGS[kernel_comp_alg] + [kernel_path]
+        except KeyError:
+            bb.fatal(f"Unknown algorithm {kernel_comp_alg} in FIT_KERNEL_COMP_ALG.")
+
+        with open(kernel_name, 'wb') as f:
+            try:
+                subprocess.run(cmd, check=True, stdout=f, stderr=subprocess.PIPE)
+            except subprocess.CalledProcessError as e:
+                bb.fatal(f"Command '{' '.join(cmd)}' failed with return code {e.returncode}\nstderr: {e.stderr.decode()}")
+
+    elif kernel_compressed:
+        kernel_path = os.path.join(kernel_deploydir, kernel_compressed)
+        kernel_name = os.path.basename(kernel_compressed)
+        shutil.copyfile(kernel_path, kernel_name)
+
+    # FIT_KERNEL_FILENAME or FIT_KERNEL_FILENAME_COMPRESSED was set
+    if kernel_name:
+        root_node.fitimage_emit_section_kernel("kernel-1", kernel_name, kernel_comp_alg,
+                                               d.getVar('UBOOT_LOADADDRESS'),
+                                               d.getVar('UBOOT_ENTRYPOINT'),
+                                               d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'),
+                                               d.getVar("UBOOT_ENTRYSYMBOL"))
 
     # Prepare a DTB image section
     kernel_devicetree = d.getVar('KERNEL_DEVICETREE')
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index abb17186a5..f7b1ffdfd5 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -41,12 +41,28 @@ FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst
 # to load a kernel with EFI stub as an EFI application.
 FIT_OS ?= "linux"
 
-# Allow user to support special use cases where the kernel binary is
-# not included in the FIT image itself.
+# Select the binary included as kernel image in the FIT image.
+# This allows the user to support special use cases where the kernel binary is
+# not included in the FIT image itself or a different image is used as kernel.
 # This is particularly useful for UKI-based setups, where the kernel
 # and initramfs are bundled into a Unified Kernel Image (UKI), and
-# DTBs are provided separately in a FIT image.
-FIT_LINUX_BIN ?= "linux.bin"
+# DTBs are provided separately in a FIT image, as well as providing the option
+# to include an EFI application as the kernel.
+#
+# Will be compressed using FIT_KERNEL_COMP_ALG. See also
+# FIT_KERNEL_FILENAME_COMPRESSED.
+FIT_KERNEL_FILENAME ?= ""
+
+# Precompressed kernel image. FIT_KERNEL_COMP_ALG is used to fill the
+# "compression" property in the FIT image, so it must match the used
+# compression algorithm. As a special case, if FIT_KERNEL_FILENAME_COMPRESSED
+# is set to "linux.bin", the compression algorithm is read from the "linux_comp"
+# file instead for backwards compatiblity; this behavior is deprecated.
+#
+# If both FIT_KERNEL_FILENAME and FIT_KERNEL_FILENAME_COMPRESSED are set,
+# FIT_KERNEL_FILENAME takes precedence. Unset both to generate a FIT image
+# without kernel section.
+FIT_KERNEL_FILENAME_COMPRESSED ?= "linux.bin"
 
 # fitImage kernel compression algorithm
 FIT_KERNEL_COMP_ALG ?= "gzip"
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 451878aafd..5d54059b54 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -677,6 +677,8 @@ class KernelFitImageBase(FitImageTestCase):
             'FIT_DESC',
             'FIT_HASH_ALG',
             'FIT_KERNEL_COMP_ALG',
+            'FIT_KERNEL_FILENAME',
+            'FIT_KERNEL_FILENAME_COMPRESSED',
             'FIT_LOADABLES',
             'FIT_LOADABLE_ENTRYPOINT',
             'FIT_LOADABLE_LOADADDRESS',
@@ -909,17 +911,39 @@ class KernelFitImageBase(FitImageTestCase):
         uboot_rd_loadaddress = bb_vars.get('UBOOT_RD_LOADADDRESS')
         uboot_rd_entrypoint = bb_vars.get('UBOOT_RD_ENTRYPOINT')
 
+        kernel_filename = bb_vars.get('FIT_KERNEL_FILENAME')
+        kernel_filename_compressed = bb_vars.get('FIT_KERNEL_FILENAME_COMPRESSED')
+        kernel_comp_alg = bb_vars['FIT_KERNEL_COMP_ALG']
+
+        if kernel_filename:
+            kernel_name = os.path.basename(kernel_filename)
+            if kernel_comp_alg != 'none':
+                kernel_name += '.compressed'
+        elif kernel_filename_compressed:
+            kernel_name = os.path.basename(kernel_filename_compressed)
+
         its_field_check = [
             'description = "%s";' % bb_vars['FIT_DESC'],
             'description = "Linux kernel";',
             'type = "' + str(bb_vars['UBOOT_MKIMAGE_KERNEL_TYPE']) + '";',
-            # 'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";', defined based on files in TMPDIR, not ideal...
-            'data = /incbin/("linux.bin");',
+        ]
+
+        # Compression test skipped for deprecated linux.bin handling, as that
+        # would be based on files in TMPDIR
+        if kernel_filename or kernel_filename_compressed != 'linux.bin':
+            its_field_check.append('compression = "%s";' % kernel_comp_alg)
+
+        if kernel_name:
+            its_field_check.append('data = /incbin/("%s");' % kernel_name)
+
+        # Field order of its_field_check and the generated ITS must match
+        its_field_check += [
             'arch = "' + str(bb_vars['UBOOT_ARCH']) + '";',
             'os = "%s";' % bb_vars['FIT_OS'],
             'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
             'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
         ]
+
         if initramfs_image and initramfs_image_bundle != "1":
             its_field_check.append('type = "ramdisk";')
             if uboot_rd_loadaddress:
@@ -1272,6 +1296,23 @@ PREFERRED_PROVIDER_virtual/dtb = "test-dtbs-as-ext"
         self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
+    def test_fit_image_kernel_filename(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are built
+                     and the Image Tree Source has the correct fields.
+        Expected:    1. fitImage and Image Tree Source can be built
+                     2. Filename and compression are as expected in the ITS
+                     3. Filename is as expected in the fitImage
+        """
+        config = """
+FIT_KERNEL_FILENAME = "${KERNEL_IMAGETYPE}"
+FIT_KERNEL_COMP_ALG = "none"
+"""
+        config = self._config_add_kernel_classes(config)
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
 
     def test_sign_fit_image_configurations(self):
         """
@@ -1506,11 +1547,12 @@ class FitImagePyTests(KernelFitImageBase):
             'FIT_DESC': "Kernel fitImage for a dummy distro",
             'FIT_GENERATE_KEYS': "0",
             'FIT_HASH_ALG': "sha256",
+            'FIT_KERNEL_COMP_ALG': "gzip",
+            'FIT_KERNEL_FILENAME_COMPRESSED': "linux.bin",
             'FIT_KEY_GENRSA_ARGS': "-F4",
             'FIT_KEY_REQ_ARGS': "-batch -new",
             'FIT_KEY_SIGN_PKCS': "-x509",
             'FIT_LOADABLES': "",
-            'FIT_LINUX_BIN': "linux.bin",
             'FIT_OS': "linux",
             'FIT_PAD_ALG': "pkcs-1.5",
             'FIT_SIGN_ALG': "rsa2048",
@@ -1549,6 +1591,19 @@ class FitImagePyTests(KernelFitImageBase):
                 debug_output = "\n".join([f"{key} = {value}" for key, value in bb_vars_overrides.items()])
                 self.logger.debug("bb_vars overrides:\n%s" % debug_output)
 
+        kernel = bb_vars.get('FIT_KERNEL_FILENAME')
+        kernel_compressed = bb_vars.get('FIT_KERNEL_FILENAME_COMPRESSED')
+        kernel_comp_alg = bb_vars.get('FIT_KERNEL_COMP_ALG')
+
+        if kernel and kernel_comp_alg == 'none':
+            kernel_compressed = kernel
+            kernel = None
+
+        if kernel:
+            kernel_name = os.path.basename(kernel) + '.compressed'
+        elif kernel_compressed:
+            kernel_name = os.path.basename(kernel_compressed)
+
         root_node = oe.fitimage.ItsNodeRootKernel(
             bb_vars["FIT_DESC"], bb_vars["FIT_ADDRESS_CELLS"],
             bb_vars['HOST_PREFIX'], bb_vars['UBOOT_ARCH'], bb_vars['FIT_OS'],
@@ -1561,7 +1616,8 @@ class FitImagePyTests(KernelFitImageBase):
             oe.types.boolean(bb_vars['FIT_SIGN_INDIVIDUAL']), bb_vars['UBOOT_SIGN_IMG_KEYNAME']
         )
 
-        root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", "none",
+        root_node.fitimage_emit_section_kernel("kernel-1",
+            kernel_name, kernel_comp_alg,
             bb_vars.get('UBOOT_LOADADDRESS'), bb_vars.get('UBOOT_ENTRYPOINT'),
             bb_vars.get('UBOOT_MKIMAGE_KERNEL_TYPE'), bb_vars.get("UBOOT_ENTRYSYMBOL")
         )
@@ -1651,6 +1707,38 @@ class FitImagePyTests(KernelFitImageBase):
         with self.assertRaises(BBHandledException):
             self._test_fitimage_py(bb_vars_overrides)
 
+    def test_fitimage_py_conf_kernel_filename_compression(self):
+        """Test FIT_KERNEL_FILENAME and FIT_KERNEL_COMP_ALG functionality"""
+        bb_vars_overrides = {
+            'FIT_KERNEL_FILENAME': "path/to/my/Image",
+            'FIT_KERNEL_COMP_ALG': "gzip",
+        }
+        self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_conf_kernel_filename_compression_none(self):
+        """Test FIT_KERNEL_FILENAME and FIT_KERNEL_COMP_ALG functionality"""
+        bb_vars_overrides = {
+            'FIT_KERNEL_FILENAME': "path/to/my/Image",
+            'FIT_KERNEL_COMP_ALG': "none",
+        }
+        self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_conf_kernel_filename_compressed(self):
+        """Test FIT_KERNEL_FILENAME_COMPRESSED functionality"""
+        bb_vars_overrides = {
+            'FIT_KERNEL_FILENAME_COMPRESSED': "path/to/my/Image",
+            'FIT_KERNEL_COMP_ALG': "gzip",
+        }
+        self._test_fitimage_py(bb_vars_overrides)
+
+    def test_fitimage_py_conf_kernel_filename_compressed_none(self):
+        """Test FIT_KERNEL_FILENAME_COMPRESSED functionality"""
+        bb_vars_overrides = {
+            'FIT_KERNEL_FILENAME_COMPRESSED': "path/to/my/Image",
+            'FIT_KERNEL_COMP_ALG': "none",
+        }
+        self._test_fitimage_py(bb_vars_overrides)
+
     def test_fitimage_py_conf_loadables(self):
         """Test FIT_LOADABLES basic functionality"""
         bb_vars_overrides = {
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


