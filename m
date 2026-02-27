Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2C9104891D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 23:38:15 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109807.1772235493696324615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 15:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=A2FlKGkn;
 dkim=pass header.i=@valla.it header.s=default header.b=lyz68bde;
 spf=pass (domain: valla.it, ip: 185.56.87.0, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com; s=arckey; t=1772235493;
	 b=DfKyLueshN7wOZ3ywP1ooGYMMDxf3C1j1nsn2A39zEC9dD0NMLea1cl0twEBbJ4FvPFMniPWpj
	  B7aRHZdwkjWgLsaLEkhqPeuOm1rdgDzvUDYCvVAyIdoyASZRFeF616Kz2WkeIh2dKh6rMDo4xB
	  q7y78eJR+7Jecob15ldWs5D76oMCkoyllXzFoy8wq+4NqiMiXfoKsgRUW9wLOv20WQO3ba7eI2
	  gGpVcxquxmqRz7q6YZaYzbnqdimq6jDgiLrO3vuRMF9E6lAEL2W8mI1EvAwW0rkYomo7UfiTkr
	  LGZ/RwHxcfXJuiIAsYcSZe5Jgq+KAOuVu7d0K+TOwTom8w==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com; s=arckey; t=1772235493;
	bh=WGrZH+jp6Nom15WwxriE4gh6YFE3+XRYToykPJp8zG0=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=LwVbve9kD2gkzAdEGBFCQpb/BynCjQ4Mq6XRDAbuAcEJK91JHAUwevdw9zgGChfRtZEH8dGznb
	  nbfznQXaG5Wrwcy2QAZzBJT+vBu1K7wWkHvBzh7vNu6v9fJuqdR+azvion4/OkriPcerObVZwc
	  YiD1RzfIFMk2DgGMzbV10xz9+cbiR5gjoIsnafC60coQBlVLRwbJxB2JYaXgMSUHf6atwxqlVI
	  r3IrpasrtxlbUgWqQ9zBWd4W4qQs8loF7rTM6G9hrYLCVibJ6zNDnvwiQZM6XUopjaRqrMYjav
	  aAJu0xFMv6XVHj60ehAPnTV5yTVzoRmtI0Q9F5CY/O+qqQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=jdhJxApO1j934busCtVTlc7tGMKOIdsrEA30JePT+Vs=; b=A2FlKGknLQZw8Sf1VovBTLUIQR
	UgkXx0oIxrucWg8aCVGMgsOtmayB6bJtN2YDWYnTvt2dF+T6XRCgiDdO6ISl7PPMOp3lUL/GKkLrL
	XUT0YPx6wMV6NFNVx+FwjzyA3MF+Cl3op/f06TPQ+KJvtP0pJXgvRO2FwXam9FCPnr4o=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-75sj.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vw7PN-00000006grz-1uiO
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Feb 2026 23:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=jdhJxApO1j934busCtVTlc7tGMKOIdsrEA30JePT+Vs=; b=lyz68bdeMg8ehZN2JgmdfjCf6W
	B4uG2mSTjeRuVbCOZ0W592jrS6Yy4ICG3D9nwrrH2tbBE9/Jev5+M7enfN/7JYKiuLTwH/AEBjZf3
	9SKzgKYCX//aosCVbc1kDtn264v4n6/w08wYYNAeUbt3nE6+xrN0R7BW8dxWWVqWFnms=;
Received: from [82.57.88.19] (port=63008 helo=[192.168.178.65])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vw7PG-000000003u2-0lyt;
	Fri, 27 Feb 2026 23:38:02 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sat, 28 Feb 2026 00:37:30 +0100
Subject: [PATCH 2/2] kernel-fit-image: support arbitrary loadables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-fit_loadables-v1-2-3027ec37930d@valla.it>
References: <20260228-fit_loadables-v1-0-3027ec37930d@valla.it>
In-Reply-To: <20260228-fit_loadables-v1-0-3027ec37930d@valla.it>
To: openembedded-core@lists.openembedded.org, 
 Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Francesco Valla <francesco@valla.it>, Usama Arif <usama.arif@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14219; i=francesco@valla.it;
 h=from:subject:message-id; bh=WGrZH+jp6Nom15WwxriE4gh6YFE3+XRYToykPJp8zG0=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmLtG5Y8B/j+WWz+fFmo02emhccuKu+atkkPVguvFf2j
 8P7tcxLO0pZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJeKxi+MP5PpbPt0aiePry
 bfMXppo+nflQvrP/valwR7u60jcRHx5Ghuu813v47545MU8t8H/M+10zmGaKTldmLMrqYw/e7SV
 zmxcA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 7bec4f3bc13dbbc37bd185433ad29610
X-AntiAbuse: ID - 7bec4f3bc13dbbc37bd185433ad29610
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vw7PN-00000006grz-1uiO-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 23:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232118

Allow a user to insert additional, arbitrary loadables in a FIT image.
The loadables can be specified through the FIT_LOADABLES variable as
a list, with parameters defined by flags on dedicated FIT_LOADABLE_*
variables; they will be included in all configurations.

Sensible defaults will be used for some parameters (type, compression,
description, arch, os) if the corresponding flag is not set, while
others (load address and entry point) will be omitted in the final FIT
image.

As an example, the following configuration can be specified to add as
loadables a TF-A BL31 firmware and a (compressed) TEE firmware, to be
loaded respectively at 0x204E0000 and 0x96000000:

  FIT_LOADABLES = "atf tee"

  FIT_LOADABLE_FILENAME[atf] = "bl31.bin"
  FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
  FIT_LOADABLE_ARCH[atf] = "arm64"
  FIT_LOADABLE_OS[atf] = "arm-trusted-firmware"
  FIT_LOADABLE_LOADADDRESS[atf] = "0x204E0000"

  FIT_LOADABLE_FILENAME[tee] = "tee.bin.gz"
  FIT_LOADABLE_COMPRESSSION[tee] = "gzip"
  FIT_LOADABLE_TYPE[tee] = "tee"
  FIT_LOADABLE_OS[tee] = "tee"
  FIT_LOADABLE_LOADADDRESS[tee] = "0x21000000"

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 33 +++++++++++++++++++
 meta/conf/image-fitimage.conf                | 18 +++++++++++
 meta/lib/oe/fitimage.py                      | 30 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/fitimage.py     | 47 ++++++++++++++++++++++++++++
 4 files changed, 128 insertions(+)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 4880027b210196d25f83d7e683c37bd5e66575d3..48ccdcf4a9d97a1854446521fd4ed8a020153e87 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -139,6 +139,39 @@ python do_compile() {
         if not found:
             bb.fatal("Could not find a valid initramfs type for %s, the supported types are: %s" % (d.getVar('INITRAMFS_IMAGE_NAME'), d.getVar('FIT_SUPPORTED_INITRAMFS_FSTYPES')))
 
+    #
+    # Prepare loadables sections
+    #
+    for loadable in d.getVar('FIT_LOADABLES').split():
+        loadable_file = d.getVarFlag('FIT_LOADABLE_FILENAME', loadable)
+        if not loadable_file:
+            bb.fatal("File for loadable %s not specified through FIT_LOADABLE_FILENAME[%s]" % (loadable, loadable))
+
+        loadable_loadaddress = d.getVarFlag('FIT_LOADABLE_LOADADDRESS', loadable)
+        if not loadable_loadaddress:
+            bb.fatal("Load address for loadable %s not specified through FIT_LOADABLE_LOADADDRESS[%s]" % (loadable, loadable))
+
+        # Optional parameters
+        loadable_description = d.getVarFlag('FIT_LOADABLE_DESCRIPTION', loadable) or ("%s loadable" % loadable)
+        loadable_compression = d.getVarFlag('FIT_LOADABLE_COMPRESSION', loadable)
+        loadable_type = d.getVarFlag('FIT_LOADABLE_TYPE', loadable)
+        loadable_arch = d.getVarFlag('FIT_LOADABLE_ARCH', loadable)
+        loadable_os = d.getVarFlag('FIT_LOADABLE_OS', loadable)
+        loadable_entrypoint = d.getVarFlag('FIT_LOADABLE_ENTRYPOINT', loadable)
+
+        # Check if loadable artifact exists
+        loadable_path = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), loadable_file)
+        if not os.path.exists(loadable_path):
+            bb.fatal("File for loadable %s not found at %s" % (loadable, loadable_path))
+
+        root_node.fitimage_emit_section_loadable(loadable,
+                                                 loadable_path, loadable_type,
+                                                 loadable_description,
+                                                 loadable_compression,
+                                                 loadable_arch, loadable_os,
+                                                 loadable_loadaddress,
+                                                 loadable_entrypoint)
+
     # Generate the configuration section
     root_node.fitimage_emit_section_config(d.getVar("FIT_CONF_DEFAULT_DTB"), d.getVar("FIT_CONF_MAPPINGS"))
 
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 4e7ea2750edba9614e52f983cbc41386e1acf395..2fdb816d556c786dcc2c14cb149446eaddc2ff4b 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -80,3 +80,21 @@ FIT_ADDRESS_CELLS ?= "1"
 # Machine configurations needing such a script file should include it in the
 # SRC_URI of the kernel recipe and set the FIT_UBOOT_ENV parameter.
 FIT_UBOOT_ENV ?= ""
+
+# Allow user to insert additional loadable images.
+# For each loadable, a number of parameters can be defined through additional
+# variable flags.
+# Example:
+#   FIT_LOADABLES = "atf"
+#   FIT_LOADABLE_FILENAME[atf] = "bl31.bin"
+#   FIT_LOADABLE_COMPRESSSION[atf] = "none"
+#   FIT_LOADABLE_DESCRIPTION[atf] = "TF-A firmware image"
+#   FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
+#   FIT_LOADABLE_ARCH[atf] = "arm64"
+#   FIT_LOADABLE_OS[atf] = "arm-trusted-firmware"
+#   FIT_LOADABLE_LOADADDRESS[atf] = "0x204E0000"
+#   FIT_LOADABLE_ENTRYPOINT[atf] = "0x204E0000"
+# Sensible defalts will be used for some parameters (compression, description,
+# arch, os) if the corresponding flag is not set, while others (load address
+# and entry point) will be omitted in the final FIT.
+FIT_LOADABLES ?= ""
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 8bf83c0a57823f640c4c0fbc145874561c9b374f..881d0eae0ab0ec427a87031c7d57608673db193b 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -195,6 +195,7 @@ class ItsNodeRootKernel(ItsNode):
         self._ramdisk = None
         self._bootscr = None
         self._setup = None
+        self._loadables = []
 
     def _sanitize_sign_config(self):
         if self._sign_enable:
@@ -396,6 +397,29 @@ class ItsNodeRootKernel(ItsNode):
         )
         self._ramdisk = ramdisk_node
 
+    def fitimage_emit_section_loadable(self, name, filepath, type=None, description=None, compression=None, arch=None, os=None, load=None, entry=None):
+        """Emit one fitImage ITS loadable section"""
+        opt_props = {
+            "data": '/incbin/("' + filepath + '")',
+            "arch": arch if arch is not None else self._arch,
+            "os": os if os is not None else "linux",
+        }
+
+        if load:
+            opt_props["load"] = f"<{load}>"
+        if entry:
+            opt_props["entry"] = f"<{entry}>"
+
+        loadable_node = self.its_add_node_image(
+            name,
+            description if description is not None else name,
+            type if type is not None else "firmware",
+            compression if compression is not None else "none",
+            opt_props
+        )
+
+        self._loadables.append(loadable_node)
+
     def _fitimage_emit_one_section_config(self, conf_node_name, dtb=None):
         """Emit the fitImage ITS configuration section"""
         opt_props = {}
@@ -434,6 +458,12 @@ class ItsNodeRootKernel(ItsNode):
             if self._sign_enable:
                 sign_entries.append("setup")
 
+        if len(self._loadables) > 0:
+            conf_desc.append("loadables")
+            opt_props["loadables"] = [ loadable.name for loadable in self._loadables ]
+            if self._sign_enable:
+                sign_entries.append("loadables")
+
         # First added configuration is the default configuration
         default_flag = "0"
         if len(self.configurations.sub_nodes) == 0:
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 2aff5c84c8fa10c43ccf008859fdb7c4958bfbe7..8151c13d26216c9e83e6f082c0ff5379d8a01b34 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -203,6 +203,15 @@ class FitImageTestCase(OESelftestTestCase):
             dtb_symlinks.append("am335x-bonegreen-ext-alias.dtb")
         return (all_dtbs, dtb_symlinks)
 
+    @staticmethod
+    def _get_loadables(bb_vars):
+        """Return a list of loadable names"""
+        loadables = []
+        var_loadables = bb_vars.get('FIT_LOADABLES')
+        if var_loadables:
+            loadables += var_loadables.split()
+        return loadables
+
     def _is_req_dict_in_dict(self, found_dict, req_dict):
         """
         Check if all key-value pairs in the required dictionary are present in the found dictionary.
@@ -418,6 +427,7 @@ class KernelFitImageBase(FitImageTestCase):
             'FIT_DESC',
             'FIT_HASH_ALG',
             'FIT_KERNEL_COMP_ALG',
+            'FIT_LOADABLES',
             'FIT_SIGN_ALG',
             'FIT_SIGN_INDIVIDUAL',
             'FIT_UBOOT_ENV',
@@ -521,6 +531,7 @@ class KernelFitImageBase(FitImageTestCase):
         fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
         initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
+        loadables = FitImageTestCase._get_loadables(bb_vars)
         uboot_sign_enable = bb_vars.get('UBOOT_SIGN_ENABLE')
 
         # image nodes
@@ -545,6 +556,9 @@ class KernelFitImageBase(FitImageTestCase):
         else:
             not_images.append('ramdisk-1')
 
+        if loadables:
+            images += loadables
+
         # configuration nodes (one per DTB, symlink, and mappings)
         configurations = []
         if dtb_files:
@@ -695,6 +709,7 @@ class KernelFitImageBase(FitImageTestCase):
         fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
         initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
+        loadables = FitImageTestCase._get_loadables(bb_vars)
         uboot_sign_enable = bb_vars['UBOOT_SIGN_ENABLE']
         uboot_sign_img_keyname = bb_vars['UBOOT_SIGN_IMG_KEYNAME']
         uboot_sign_keyname = bb_vars['UBOOT_SIGN_KEYNAME']
@@ -722,6 +737,10 @@ class KernelFitImageBase(FitImageTestCase):
                 "Load Address": bb_vars['UBOOT_RD_LOADADDRESS'],
                 "Entry Point": bb_vars['UBOOT_RD_ENTRYPOINT']
             }
+        # Create one section per loadable (do not check the value of "Type" as
+        # flags extraction is not supported for bb_vars)
+        for loadable in loadables:
+            req_sections[loadable] = { "Type": None }
         # Create a configuration section for each DTB
         if dtb_files:
             for dtb in dtb_files + dtb_symlinks:
@@ -741,6 +760,8 @@ class KernelFitImageBase(FitImageTestCase):
                     }
                 if initramfs_image and initramfs_image_bundle != "1":
                     req_sections[conf_name]['Init Ramdisk'] = "ramdisk-1"
+                if loadables:
+                    req_sections[conf_name]['Loadables'] = ",".join(loadables)
         else:
             conf_name = bb_vars['FIT_CONF_PREFIX'] +  '1'
             req_sections[conf_name] = {
@@ -748,6 +769,8 @@ class KernelFitImageBase(FitImageTestCase):
             }
             if initramfs_image and initramfs_image_bundle != "1":
                 req_sections[conf_name]['Init Ramdisk'] = "ramdisk-1"
+            if loadables:
+                req_sections[conf_name]['Loadables'] = ",".join(loadables)
 
         # Add signing related properties if needed
         if uboot_sign_enable == "1":
@@ -832,6 +855,8 @@ class KernelFitImageRecipeTests(KernelFitImageBase):
                      in the Image Tree Source. Not all the fields are tested,
                      only the key fields that wont vary between different
                      architectures.
+                     3. The type value of each loadable is as expected in the
+                     Image Tree Source.
         Product:     oe-core
         Author:      Usama Arif <usama.arif@arm.com>
         """
@@ -849,6 +874,14 @@ UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
 FIT_DESC = "A model description"
 FIT_CONF_PREFIX = "foo-"
+# Use the linux.bin kernel image as loadable file to avoid building other components
+FIT_LOADABLES = "loadable1 loadable2"
+FIT_LOADABLE_FILENAME[loadable1] = "linux.bin"
+FIT_LOADABLE_LOADADDRESS[loadable1] = "0x86000000"
+FIT_LOADABLE_TYPE[loadable1] = "firmware"
+FIT_LOADABLE_FILENAME[loadable2] = "linux.bin"
+FIT_LOADABLE_LOADADDRESS[loadable2] = "0x87000000"
+FIT_LOADABLE_TYPE[loadable2] = "firmware"
 """
         config = self._config_add_kernel_classes(config)
         self.write_config(config)
@@ -1123,6 +1156,7 @@ class FitImagePyTests(KernelFitImageBase):
             'FIT_KEY_GENRSA_ARGS': "-F4",
             'FIT_KEY_REQ_ARGS': "-batch -new",
             'FIT_KEY_SIGN_PKCS': "-x509",
+            'FIT_LOADABLES': "",
             'FIT_LINUX_BIN': "linux.bin",
             'FIT_PAD_ALG': "pkcs-1.5",
             'FIT_SIGN_ALG': "rsa2048",
@@ -1198,6 +1232,12 @@ class FitImagePyTests(KernelFitImageBase):
                 "core-image-minimal-initramfs",
                 bb_vars.get("UBOOT_RD_LOADADDRESS"), bb_vars.get("UBOOT_RD_ENTRYPOINT"))
 
+        loadables = FitImageTestCase._get_loadables(bb_vars)
+        for loadable in loadables:
+            root_node.fitimage_emit_section_loadable(loadable,
+                "a-dir/loadable-%s" % loadable,
+                "loadable-type")
+
         root_node.fitimage_emit_section_config(bb_vars['FIT_CONF_DEFAULT_DTB'], bb_vars.get('FIT_CONF_MAPPINGS'))
         root_node.write_its_file(fitimage_its_path)
 
@@ -1254,6 +1294,13 @@ class FitImagePyTests(KernelFitImageBase):
         with self.assertRaises(BBHandledException):
             self._test_fitimage_py(bb_vars_overrides)
 
+    def test_fitimage_py_conf_loadables(self):
+        """Test FIT_LOADABLES basic functionality"""
+        bb_vars_overrides = {
+            'FIT_LOADABLES': "my-loadable",
+        }
+        self._test_fitimage_py(bb_vars_overrides)
+
 
 class UBootFitImageTests(FitImageTestCase):
     """Test cases for the uboot-sign bbclass"""

-- 
2.53.0


