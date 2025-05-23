Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB38C5B548
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:42:29 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.44667.1747993340793958109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=XfZrkGYX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202505230942196f1c735305e83934e1-7xxldo@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202505230942196f1c735305e83934e1
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 May 2025 11:42:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kuwAMjO3ZY9JU50KpAnKREYhPTbBRDCnVFtuQ2D5PdQ=;
 b=XfZrkGYXzWL+h82ByFnlX8D6NCh7NEJADSuWPzuZdjv/KY7YjCK2Dds30Cu6necFjYrzOJ
 p3UPS1lOsYn5k6OHWSYoI7SR2/R+hDYtP0sGOIMOG3k+4LmURfMWD5PwGeyLkN+wQUPCGZhw
 0MI7TtzHvOrZFXSBYxrBDH2juer2klXr4pjyQbcd+ooljHIcDC2xUJZ2/juYOODnbLjXfTiq
 hDavH2SlRhsxEJ7qe7SMA36H1YsqgCNmjaOzseM5f6X/+yNnH1a4zUV6MoLIz8WnpP6+S4hp
 WDBG2tOeR/Ax0SCLf020bhpoezw+nyGqj8U47Vxl94iy/cmfL/d20/4g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 08/17] kernel-fit-image.bbclass: add a new FIT image implementation
Date: Fri, 23 May 2025 11:41:09 +0200
Message-ID: <20250523094152.727177-9-adrian.freihofer@siemens.com>
In-Reply-To: <20250523094152.727177-1-adrian.freihofer@siemens.com>
References: <20250523094152.727177-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217193

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The new recipe linux-yocto-fitimage.bb and the new
kernel-fit-image.bbclass are intended to become successors of the
kernel-fitimage.bbclass.

Instead of injecting the FIT image related build steps into the kernel
recipe, the new recipe takes the kernel artifacts from the kernel recipe
and creates the FIT image as an independent task.

This solves some basic problems:
* sstate does not work well when a fitImage contains an initramfs. The
  kernel is rebuilt from scratch if the build runs from an empty TMPDIR.
* A fitImage kernel is not available as a package, but all other kernel
  image types are.
* The task dependencies in the kernel are very complex and difficult to
  debug if something goes wrong. As a separate, downstream recipe, this
  is now much easier.

The recipe takes the kernel artifacts from the deploy folder. There was
also a test implementation passing the kernel artifacts via sysroot
directory. This requires changes on the kernel.bbclass to make it
copying the artifacts also to the sysroot directory while the same
artifacts are already in the sstate-cached deploy directory.

The long story about this issue is here:
[YOCTO #12912]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass  | 184 +++++++
 meta/classes/multilib.bbclass                 |   1 +
 meta/lib/oe/fitimage.py                       | 463 ++++++++++++++++++
 .../linux/linux-yocto-fitimage_6.12.bb        |  13 +
 4 files changed, 661 insertions(+)
 create mode 100644 meta/classes-recipe/kernel-fit-image.bbclass
 create mode 100644 meta/lib/oe/fitimage.py
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-fitimage_6.12.bb

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
new file mode 100644
index 00000000000..67c717f88d5
--- /dev/null
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -0,0 +1,184 @@
+
+inherit kernel-arch kernel-artifact-names uboot-config deploy
+require conf/image-fitimage.conf
+
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS += "\
+    u-boot-tools-native dtc-native \
+    ${@'kernel-signing-keys-native' if d.getVar('FIT_GENERATE_KEYS') == '1' else ''} \
+"
+
+python () {
+    image = d.getVar('INITRAMFS_IMAGE')
+    if image and d.getVar('INITRAMFS_IMAGE_BUNDLE') != '1':
+        if d.getVar('INITRAMFS_MULTICONFIG'):
+            mc = d.getVar('BB_CURRENT_MC')
+            d.appendVarFlag('do_compile', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
+        else:
+            d.appendVarFlag('do_compile', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+
+    #check if there are any dtb providers
+    providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
+    if providerdtb:
+        d.appendVarFlag('do_compile', 'depends', ' virtual/dtb:do_populate_sysroot')
+        d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
+}
+
+do_configure[noexec] = "1"
+
+UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
+KERNEL_IMAGEDEST ?= "/boot"
+
+python do_compile() {
+    import shutil
+    import oe.fitimage
+
+    itsfile = "fit-image.its"
+    fitname = "fitImage"
+    kernel_deploydir = d.getVar('DEPLOY_DIR_IMAGE')
+    kernel_deploysubdir = d.getVar('KERNEL_DEPLOYSUBDIR')
+    if kernel_deploysubdir:
+        kernel_deploydir = os.path.join(kernel_deploydir, kernel_deploysubdir)
+
+    # Collect all the its nodes before the its file is generated and mkimage gets executed
+    root_node = oe.fitimage.ItsNodeRootKernel(
+        d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
+        d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CONF_PREFIX"),
+        oe.types.boolean(d.getVar('UBOOT_SIGN_ENABLE')), d.getVar("UBOOT_SIGN_KEYDIR"),
+        d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
+        d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
+        d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_PAD_ALG'),
+        d.getVar('UBOOT_SIGN_KEYNAME'),
+        oe.types.boolean(d.getVar('FIT_SIGN_INDIVIDUAL')), d.getVar('UBOOT_SIGN_IMG_KEYNAME')
+    )
+
+    # Prepare a kernel image section.
+    shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), "linux.bin")
+    with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_f:
+        linux_comp = linux_comp_f.read()
+    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
+        d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
+        d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
+
+    # Prepare a DTB image section
+    kernel_devicetree = d.getVar('KERNEL_DEVICETREE')
+    external_kernel_devicetree = d.getVar("EXTERNAL_KERNEL_DEVICETREE")
+    if kernel_devicetree:
+        for dtb in kernel_devicetree.split():
+            dtb_name = os.path.basename(dtb)
+
+            # Skip DTB if it's also provided in EXTERNAL_KERNEL_DEVICETREE directory
+            if external_kernel_devicetree:
+                ext_dtb_path = os.path.join(external_kernel_devicetree, dtb_name)
+                if os.path.exists(ext_dtb_path) and os.path.getsize(ext_dtb_path) > 0:
+                    continue
+
+            # Copy the dtb or dtbo file into the FIT image assembly directory
+            shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
+            root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+
+    if external_kernel_devicetree:
+        # iterate over all .dtb and .dtbo files in the external kernel devicetree directory
+        # and copy them to the FIT image assembly directory
+        for dtb_name in os.listdir(external_kernel_devicetree):
+            if dtb_name.endswith('.dtb') or dtb_name.endswith('.dtbo'):
+                dtb_path = os.path.join(external_kernel_devicetree, dtb_name)
+
+                # Also skip if a symlink. We'll later have each config section point at it
+                if oe.fitimage.symlink_points_below(dtb_name, external_kernel_devicetree):
+                    continue
+
+                shutil.copyfile(dtb_path, dtb_name)
+                root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
+                    d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+
+    # Prepare a u-boot script section
+    fit_uboot_env = d.getVar("FIT_UBOOT_ENV")
+    if fit_uboot_env:
+        root_node.fitimage_emit_section_boot_script("bootscr-"+fit_uboot_env , fit_uboot_env)
+
+    # Prepare a setup section (For x86)
+    setup_bin_path = os.path.join(kernel_deploydir, "setup.bin")
+    if os.path.exists(setup_bin_path):
+        shutil.copyfile(setup_bin_path, "setup.bin")
+        root_node.fitimage_emit_section_setup("setup-1", "setup.bin")
+
+    # Prepare a ramdisk section.
+    initramfs_image = d.getVar('INITRAMFS_IMAGE')
+    if initramfs_image and d.getVar("INITRAMFS_IMAGE_BUNDLE") != '1':
+        # Find and use the first initramfs image archive type we find
+        found = False
+        for img in d.getVar("FIT_SUPPORTED_INITRAMFS_FSTYPES").split():
+            initramfs_path = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), "%s.%s" % (d.getVar('INITRAMFS_IMAGE_NAME'), img))
+            if os.path.exists(initramfs_path):
+                bb.note("Found initramfs image: " + initramfs_path)
+                found = True
+                root_node.fitimage_emit_section_ramdisk("ramdisk-1", initramfs_path,
+                    initramfs_image,
+                    d.getVar("UBOOT_RD_LOADADDRESS"),
+                    d.getVar("UBOOT_RD_ENTRYPOINT"))
+                break
+            else:
+                bb.note("Did not find initramfs image: " + initramfs_path)
+
+        if not found:
+            bb.fatal("Could not find a valid initramfs type for %s, the supported types are: %s" % (d.getVar('INITRAMFS_IMAGE_NAME'), d.getVar('FIT_SUPPORTED_INITRAMFS_FSTYPES')))
+
+    # Generate the configuration section
+    root_node.fitimage_emit_section_config()
+
+    # Write the its file
+    root_node.write_its_file(itsfile)
+
+    # Assemble the FIT image
+    root_node.run_mkimage_assemble(itsfile, fitname)
+
+    # Sign the FIT image if required
+    root_node.run_mkimage_sign(fitname)
+}
+do_compile[depends] += "virtual/kernel:do_deploy"
+
+do_install() {
+    install -d "${D}/${KERNEL_IMAGEDEST}"
+    install -m 0644 "${B}/fitImage" "${D}/${KERNEL_IMAGEDEST}/fitImage"
+}
+
+FILES:${PN} = "${KERNEL_IMAGEDEST}"
+
+
+do_deploy() {
+    deploy_dir="${DEPLOYDIR}"
+    if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
+        deploy_dir="${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
+    fi
+    install -d "$deploy_dir"
+    install -m 0644 "${B}/fitImage" "$deploy_dir/fitImage"
+    install -m 0644 "${B}/fit-image.its" "$deploy_dir/fit-image.its"
+
+    if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+        ln -snf fit-image.its "$deploy_dir/fitImage-its-${KERNEL_FIT_NAME}.its"
+        if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+            ln -snf fit-image.its "$deploy_dir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
+        fi
+    fi
+
+    if [ -n "${INITRAMFS_IMAGE}" ]; then
+        ln -snf fit-image-its "$deploy_dir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
+        if [ -n "${KERNEL_FIT_LINK_NAME}" ]; then
+            ln -snf fit-image.its "$deploy_dir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+        fi
+
+        if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+            ln -snf fitImage "$deploy_dir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
+            if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+                ln -snf fitImage "$deploy_dir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+            fi
+        fi
+    fi
+}
+addtask deploy after do_compile before do_build
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index a4151658a62..b959bbd93c0 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -21,6 +21,7 @@ python multilib_virtclass_handler () {
     bpn = d.getVar("BPN")
     if ("virtual/kernel" in provides
             or bb.data.inherits_class('module-base', d)
+            or bb.data.inherits_class('kernel-fit-image', d)
             or bpn in non_ml_recipes):
         raise bb.parse.SkipRecipe("We shouldn't have multilib variants for %s" % bpn)
 
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
new file mode 100644
index 00000000000..735c09b151d
--- /dev/null
+++ b/meta/lib/oe/fitimage.py
@@ -0,0 +1,463 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# This file contains common functions for the fitimage generation
+
+import os
+import shlex
+import subprocess
+import bb
+
+from oeqa.utils.commands import runCmd
+
+class ItsNode:
+    INDENT_SIZE = 8
+
+    def __init__(self, name, parent_node, sub_nodes=None, properties=None):
+        self.name = name
+        self.parent_node = parent_node
+
+        self.sub_nodes = []
+        if sub_nodes:
+            self.sub_nodes = sub_nodes
+
+        self.properties = {}
+        if properties:
+            self.properties = properties
+
+        if parent_node:
+            parent_node.add_sub_node(self)
+
+    def add_sub_node(self, sub_node):
+        self.sub_nodes.append(sub_node)
+
+    def add_property(self, key, value):
+        self.properties[key] = value
+
+    def emit(self, f, indent):
+        indent_str_name = " " * indent
+        indent_str_props = " " * (indent + self.INDENT_SIZE)
+        f.write("%s%s {\n" % (indent_str_name, self.name))
+        for key, value in self.properties.items():
+            bb.debug(1, "key: %s, value: %s" % (key, str(value)))
+            # Single integer: <0x12ab>
+            if isinstance(value, int):
+                f.write(indent_str_props + key + ' = <0x%x>;\n' % value)
+            # list of strings: "string1", "string2" or integers: <0x12ab 0x34cd>
+            elif isinstance(value, list):
+                if len(value) == 0:
+                    f.write(indent_str_props + key + ' = "";\n')
+                elif isinstance(value[0], int):
+                    list_entries = ' '.join('0x%x' % entry for entry in value)
+                    f.write(indent_str_props + key + ' = <%s>;\n' % list_entries)
+                else:
+                    list_entries = ', '.join('"%s"' % entry for entry in value)
+                    f.write(indent_str_props + key + ' = %s;\n' % list_entries)
+            elif isinstance(value, str):
+                # path: /incbin/("path/to/file")
+                if key in ["data"] and value.startswith('/incbin/('):
+                    f.write(indent_str_props + key + ' = %s;\n' % value)
+                # Integers which are already string formatted
+                elif value.startswith("<") and value.endswith(">"):
+                    f.write(indent_str_props + key + ' = %s;\n' % value)
+                else:
+                    f.write(indent_str_props + key + ' = "%s";\n' % value)
+            else:
+                bb.fatal("%s has unexpexted data type." % str(value))
+        for sub_node in self.sub_nodes:
+            sub_node.emit(f, indent + self.INDENT_SIZE)
+        f.write(indent_str_name + '};\n')
+
+class ItsNodeImages(ItsNode):
+    def __init__(self, parent_node):
+        super().__init__("images", parent_node)
+
+class ItsNodeConfigurations(ItsNode):
+    def __init__(self, parent_node):
+        super().__init__("configurations", parent_node)
+
+class ItsNodeHash(ItsNode):
+    def __init__(self, name, parent_node, algo, opt_props=None):
+        properties = {
+            "algo": algo
+        }
+        if opt_props:
+            properties.update(opt_props)
+        super().__init__(name, parent_node, None, properties)
+
+class ItsImageSignature(ItsNode):
+    def __init__(self, name, parent_node, algo, keyname, opt_props=None):
+        properties = {
+            "algo": algo,
+            "key-name-hint": keyname
+        }
+        if opt_props:
+            properties.update(opt_props)
+        super().__init__(name, parent_node, None, properties)
+
+class ItsNodeImage(ItsNode):
+    def __init__(self, name, parent_node, description, type, compression, sub_nodes=None, opt_props=None):
+        properties = {
+            "description": description,
+            "type": type,
+            "compression": compression,
+        }
+        if opt_props:
+            properties.update(opt_props)
+        super().__init__(name, parent_node, sub_nodes, properties)
+
+class ItsNodeConfigurationSignature(ItsNode):
+    def __init__(self, name, parent_node, algo, keyname, opt_props=None):
+        properties = {
+            "algo": algo,
+            "key-name-hint": keyname
+        }
+        if opt_props:
+            properties.update(opt_props)
+        super().__init__(name, parent_node, None, properties)
+
+class ItsNodeConfiguration(ItsNode):
+    def __init__(self, name, parent_node, description, sub_nodes=None, opt_props=None):
+        properties = {
+            "description": description,
+        }
+        if opt_props:
+            properties.update(opt_props)
+        super().__init__(name, parent_node, sub_nodes, properties)
+
+class ItsNodeRootKernel(ItsNode):
+    """Create FIT images for the kernel
+
+    Currently only a single kernel (no less or more) can be added to the FIT
+    image along with 0 or more device trees and 0 or 1 ramdisk.
+
+    If a device tree included in the FIT image, the default configuration is the
+    firt DTB. If there is no dtb present than the default configuation the kernel.
+    """
+    def __init__(self, description, address_cells, host_prefix, arch, conf_prefix,
+                 sign_enable=False, sign_keydir=None,
+                 mkimage=None, mkimage_dtcopts=None,
+                 mkimage_sign=None, mkimage_sign_args=None,
+                 hash_algo=None, sign_algo=None, pad_algo=None,
+                 sign_keyname_conf=None,
+                 sign_individual=False, sign_keyname_img=None):
+        props = {
+            "description": description,
+            "#address-cells": f"<{address_cells}>"
+        }
+        super().__init__("/", None, None, props)
+        self.images = ItsNodeImages(self)
+        self.configurations = ItsNodeConfigurations(self)
+
+        self._host_prefix = host_prefix
+        self._arch = arch
+        self._conf_prefix = conf_prefix
+
+        # Signature related properties
+        self._sign_enable = sign_enable
+        self._sign_keydir = sign_keydir
+        self._mkimage = mkimage
+        self._mkimage_dtcopts = mkimage_dtcopts
+        self._mkimage_sign = mkimage_sign
+        self._mkimage_sign_args = mkimage_sign_args
+        self._hash_algo = hash_algo
+        self._sign_algo = sign_algo
+        self._pad_algo = pad_algo
+        self._sign_keyname_conf = sign_keyname_conf
+        self._sign_individual = sign_individual
+        self._sign_keyname_img = sign_keyname_img
+        self._sanitize_sign_config()
+
+        self._dtbs = []
+        self._kernel = None
+        self._ramdisk = None
+        self._bootscr = None
+        self._setup = None
+
+    def _sanitize_sign_config(self):
+        if self._sign_enable:
+            if not self._hash_algo:
+                bb.fatal("FIT image signing is enabled but no hash algorithm is provided.")
+            if not self._sign_algo:
+                bb.fatal("FIT image signing is enabled but no signature algorithm is provided.")
+            if not self._pad_algo:
+                bb.fatal("FIT image signing is enabled but no padding algorithm is provided.")
+            if not self._sign_keyname_conf:
+                bb.fatal("FIT image signing is enabled but no configuration key name is provided.")
+            if self._sign_individual and not self._sign_keyname_img:
+                bb.fatal("FIT image signing is enabled for individual images but no image key name is provided.")
+
+    def write_its_file(self, itsfile):
+        with open(itsfile, 'w') as f:
+            f.write("/dts-v1/;\n\n")
+            self.emit(f, 0)
+
+    def its_add_node_image(self, image_id, description, image_type, compression, opt_props):
+        image_node = ItsNodeImage(
+            image_id,
+            self.images,
+            description,
+            image_type,
+            compression,
+            opt_props=opt_props
+        )
+        if self._hash_algo:
+            ItsNodeHash(
+                "hash-1",
+                image_node,
+                self._hash_algo
+            )
+        if self._sign_individual:
+            ItsImageSignature(
+                "signature-1",
+                image_node,
+                f"{self._hash_algo},{self._sign_algo}",
+                self._sign_keyname_img
+            )
+        return image_node
+
+    def fitimage_emit_section_kernel(self, kernel_id, kernel_path, compression,
+        load, entrypoint, mkimage_kernel_type, entrysymbol=None):
+        """Emit the fitImage ITS kernel section"""
+        if self._kernel:
+            bb.fatal("Kernel section already exists in the ITS file.")
+        if entrysymbol:
+            result = subprocess.run([self._host_prefix + "nm", "vmlinux"], capture_output=True, text=True)
+            for line in result.stdout.splitlines():
+                parts = line.split()
+                if len(parts) == 3 and parts[2] == entrysymbol:
+                    entrypoint = "<0x%s>" % parts[0]
+                    break
+        kernel_node = self.its_add_node_image(
+            kernel_id,
+            "Linux kernel",
+            mkimage_kernel_type,
+            compression,
+            {
+                "data": '/incbin/("' + kernel_path + '")',
+                "arch": self._arch,
+                "os": "linux",
+                "load": f"<{load}>",
+                "entry": f"<{entrypoint}>"
+            }
+        )
+        self._kernel = kernel_node
+
+    def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None, dtbo_loadaddress=None):
+        """Emit the fitImage ITS DTB section"""
+        load=None
+        dtb_ext = os.path.splitext(dtb_path)[1]
+        if dtb_ext == ".dtbo":
+            if dtbo_loadaddress:
+                load = dtbo_loadaddress
+        elif dtb_loadaddress:
+            load = dtb_loadaddress
+
+        opt_props = {
+            "data": '/incbin/("' + dtb_path + '")',
+            "arch": self._arch
+        }
+        if load:
+            opt_props["load"] = f"<{load}>"
+
+        dtb_node = self.its_add_node_image(
+            "fdt-" + dtb_id,
+            "Flattened Device Tree blob",
+            "flat_dt",
+            "none",
+            opt_props
+        )
+        self._dtbs.append(dtb_node)
+
+    def fitimage_emit_section_boot_script(self, bootscr_id, bootscr_path):
+        """Emit the fitImage ITS u-boot script section"""
+        if self._bootscr:
+            bb.fatal("U-boot script section already exists in the ITS file.")
+        bootscr_node = self.its_add_node_image(
+            bootscr_id,
+            "U-boot script",
+            "script",
+            "none",
+            {
+                "data": '/incbin/("' + bootscr_path + '")',
+                "arch": self._arch,
+                "type": "script"
+            }
+        )
+        self._bootscr = bootscr_node
+
+    def fitimage_emit_section_setup(self, setup_id, setup_path):
+        """Emit the fitImage ITS setup section"""
+        if self._setup:
+            bb.fatal("Setup section already exists in the ITS file.")
+        load = "<0x00090000>"
+        entry = "<0x00090000>"
+        setup_node = self.its_add_node_image(
+            setup_id,
+            "Linux setup.bin",
+            "x86_setup",
+            "none",
+            {
+                "data": '/incbin/("' + setup_path + '")',
+                "arch": self._arch,
+                "os": "linux",
+                "load": load,
+                "entry": entry
+            }
+        )
+        self._setup = setup_node
+
+    def fitimage_emit_section_ramdisk(self, ramdisk_id, ramdisk_path, description="ramdisk", load=None, entry=None):
+        """Emit the fitImage ITS ramdisk section"""
+        if self._ramdisk:
+            bb.fatal("Ramdisk section already exists in the ITS file.")
+        opt_props = {
+            "data": '/incbin/("' + ramdisk_path + '")',
+            "type": "ramdisk",
+            "arch": self._arch,
+            "os": "linux"
+        }
+        if load:
+            opt_props["load"] = f"<{load}>"
+        if entry:
+            opt_props["entry"] = f"<{entry}>"
+
+        ramdisk_node = self.its_add_node_image(
+            ramdisk_id,
+            description,
+            "ramdisk",
+            "none",
+            opt_props
+        )
+        self._ramdisk = ramdisk_node
+
+    def _fitimage_emit_one_section_config(self, conf_node_name, dtb=None):
+        """Emit the fitImage ITS configuration section"""
+        opt_props = {}
+        conf_desc = []
+        sign_entries = []
+
+        if self._kernel:
+            conf_desc.append("Linux kernel")
+            opt_props["kernel"] = self._kernel.name
+            if self._sign_enable:
+                sign_entries.append("kernel")
+
+        if dtb:
+            conf_desc.append("FDT blob")
+            opt_props["fdt"] = dtb.name
+            if self._sign_enable:
+                sign_entries.append("fdt")
+
+        if self._ramdisk:
+            conf_desc.append("ramdisk")
+            opt_props["ramdisk"] = self._ramdisk.name
+            if self._sign_enable:
+                sign_entries.append("ramdisk")
+
+        if self._bootscr:
+            conf_desc.append("u-boot script")
+            opt_props["bootscr"] = self._bootscr.name
+            if self._sign_enable:
+                sign_entries.append("bootscr")
+
+        if self._setup:
+            conf_desc.append("setup")
+            opt_props["setup"] = self._setup.name
+            if self._sign_enable:
+                sign_entries.append("setup")
+
+        # First added configuration is the default configuration
+        default_flag = "0"
+        if len(self.configurations.sub_nodes) == 0:
+            default_flag = "1"
+
+        conf_node = ItsNodeConfiguration(
+            conf_node_name,
+            self.configurations,
+            f"{default_flag} {', '.join(conf_desc)}",
+            opt_props=opt_props
+        )
+        if self._hash_algo:
+            ItsNodeHash(
+                "hash-1",
+                conf_node,
+                self._hash_algo
+            )
+        if self._sign_enable:
+            ItsNodeConfigurationSignature(
+                "signature-1",
+                conf_node,
+                f"{self._hash_algo},{self._sign_algo}",
+                self._sign_keyname_conf,
+                opt_props={
+                    "padding": self._pad_algo,
+                    "sign-images": sign_entries
+                }
+            )
+
+    def fitimage_emit_section_config(self):
+        if self._dtbs:
+            for dtb in self._dtbs:
+                self._fitimage_emit_one_section_config('conf-' + dtb.name.lstrip("fdt-"), dtb)
+        else:
+            self._fitimage_emit_one_section_config("conf-1")
+        self.configurations.add_property('default', self.configurations.sub_nodes[0].name)
+
+    def run_mkimage_assemble(self, itsfile, fitfile):
+        cmd = [
+            self._mkimage,
+            '-f', itsfile,
+            fitfile
+        ]
+        if self._mkimage_dtcopts:
+            cmd.insert(1, '-D')
+            cmd.insert(2, self._mkimage_dtcopts)
+        try:
+            subprocess.run(cmd, check=True, capture_output=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal(f"Command '{' '.join(cmd)}' failed with return code {e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}\nitsflile: {os.path.abspath(itsfile)}")
+
+    def run_mkimage_sign(self, fitfile):
+        if not self._sign_enable:
+            bb.debug(1, "FIT image signing is disabled. Skipping signing.")
+            return
+
+        # Some sanity checks because mkimage exits with 0 also without needed keys
+        sign_key_path = os.path.join(self._sign_keydir, self._sign_keyname_conf)
+        if not os.path.exists(sign_key_path + '.key') or not os.path.exists(sign_key_path + '.crt'):
+            bb.fatal("%s.key or .crt does not exist" % sign_key_path)
+        if self._sign_individual:
+            sign_key_img_path = os.path.join(self._sign_keydir, self._sign_keyname_img)
+            if not os.path.exists(sign_key_img_path + '.key') or not os.path.exists(sign_key_img_path + '.crt'):
+                bb.fatal("%s.key or .crt does not exist" % sign_key_img_path)
+
+        cmd = [
+            self._mkimage_sign,
+            '-F',
+            '-k', self._sign_keydir,
+            '-r', fitfile
+        ]
+        if self._mkimage_dtcopts:
+            cmd.extend(['-D', self._mkimage_dtcopts])
+        if self._mkimage_sign_args:
+            cmd.extend(shlex.split(self._mkimage_sign_args))
+        try:
+            subprocess.run(cmd, check=True, capture_output=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal(f"Command '{' '.join(cmd)}' failed with return code {e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}")
+
+
+def symlink_points_below(file_or_symlink, expected_parent_dir):
+    """returns symlink destination if it points below directory"""
+    file_path = os.path.join(expected_parent_dir, file_or_symlink)
+    if not os.path.islink(file_path):
+        return None
+
+    realpath = os.path.relpath(os.path.realpath(file_path), expected_parent_dir)
+    if realpath.startswith(".."):
+        return None
+
+    return realpath
diff --git a/meta/recipes-kernel/linux/linux-yocto-fitimage_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-fitimage_6.12.bb
new file mode 100644
index 00000000000..d5efc60737e
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-fitimage_6.12.bb
@@ -0,0 +1,13 @@
+SUMMARY = "The Linux kernel as a FIT image (optionally with initramfs)"
+SECTION = "kernel"
+
+# If an initramfs is included in the FIT image more licenses apply.
+# But also the kernel uses more than one license (see Documentation/process/license-rules.rst)
+LICENSE = "GPL-2.0-with-Linux-syscall-note"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-with-Linux-syscall-note;md5=0bad96c422c41c3a94009dcfe1bff992"
+
+LINUX_VERSION ?= "6.12.23"
+
+PV = "${LINUX_VERSION}+git"
+
+inherit kernel-fit-image
-- 
2.49.0


