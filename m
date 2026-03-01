Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267E3FD0079
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 21:17:29 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146515.1772399838237829913
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 13:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=bq5yWO5O;
 dkim=pass header.i=@valla.it header.s=default header.b=bOp/7TWU;
 spf=pass (domain: valla.it, ip: 185.56.87.0, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-32w3.prod.antispam.mailspamprotection.com; s=arckey; t=1772399838;
	 b=RytGTV50aRUFBKaVlUSZYDy0BdTGi5j3bAv7s49CuoK9OhHxAaLk5FyZzfc1G3Sta8/g/ApSTq
	  gsLGyX2ie2nknTHAMPeeqlhixSLtkV8o5yPFHfwP4HPODWAFAoeYLHyUxPXBcL0PCVwAed8zjD
	  4d1udxpDleR42lAYV9ukzDZDes7n/mmOcJGh8XhP5rM6QWBe+uj9SBTa5aDEUASyrXP98i0yrM
	  OGlCP+0v1E4icq+2o3M7/R/VZzzf7WV9cIZUnMhhpCx5M23kg1/wJJOQB2idw+gdG+csPYEqnx
	  f3of4V4m6jfFyKmdZQhvcKyh54/Miv83XrFPJk0J58KUpQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-32w3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-32w3.prod.antispam.mailspamprotection.com; s=arckey; t=1772399838;
	bh=+cZZKgyGaUPoEQqScoWx1jOl2Nq5wZ1n4A42KiJqbeg=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=i2TrYjj6LBvxvVzKTi79UH/wRwQFx8pdTucM+mx7KkMVDzvF42TtusEhkM1ggXueV7BEQeGLAB
	  YMi6HHeWVKqFuYqvw2NiIw2rgOVMcepu4YSNXomW4V6ya4orScP6oRn7bCjwH3VVOBxBKl4exw
	  euXnl0pJGhPHyInlSzX4vxwKFh9/awa5xiXhCOz2+zbuQZbJKsSP480aLPBESext/JMz0FDHub
	  ddAWgfT6XKoDuaKeklkmJmqi0Mf1s50MhY+YJzCsZCO3yTkvtsa4bMjIOJIQsXLIOo6BaSPEJ7
	  SVNXxFLIjNhwFk6KVhE4G14gNd2j/QHIT0CxXkNjF6IyMw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=a1DiuOK1bPLvShfxQdzzPt1jXkMTTIzSjBE4xeZxTf8=; b=bq5yWO5OuYFAsV2pkwhACK6JPp
	jq4hrL5d5T5Vy5TIvXVqimKhmnCts+vFycBbkVzSZ/teGDhg41OzDGlPLv1ZXb60bEqz9+IQn5A8t
	MYN10nIHOw/Qm1tIYl6V/mO0f9zHhSuL+2Ddh+/0N9SbLZiLvZiXAld4zcZCY9YRK+MI=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-32w3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vwoA5-00000000JRi-2NzQ
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Mar 2026 21:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=a1DiuOK1bPLvShfxQdzzPt1jXkMTTIzSjBE4xeZxTf8=; b=bOp/7TWU+RJkhSCzpDHSsU9xK1
	vn9gYyXdKB48VEDd2tz70bfoJkIhoSbbwYAc1b3CniZWCqdehJ02bi4MWnoPrsgbYSApvdrazj53D
	zQgSqxZymaL5/9/Yf/j2nqEnWMMi4lYQPeywWl72dWABcSgCXYHOKxB3YrRZRxNO+myE=;
Received: from [82.57.88.19] (port=62694 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vwo9z-00000000NGw-24m4;
	Sun, 01 Mar 2026 21:17:07 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 01 Mar 2026 22:17:03 +0100
Subject: [PATCH v2] kernel-fit-image: support arbitrary loadables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-fit_loadables-v2-1-2cf4cdf36a91@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQrCMBCF4auUWRtJJ2CsK+8hRabtxA6EVpIQl
 JK7GwtuXP4P3rdB5CAc4dJsEDhLlHWpgYcGxpmWByuZagNqPGlEq5yku19posFzVK3rzNCNlqx
 DqJ9nYCev3bv1tWeJaQ3vnc/td/1J5z8pt0oro9HyaGxn9HTN5D0dJUFfSvkAHz5EVakAAAA=
X-Change-ID: 20260227-fit_loadables-1f93b9c7a7f2
To: openembedded-core@lists.openembedded.org, 
 Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Francesco Valla <francesco@valla.it>, Usama Arif <usama.arif@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18333; i=francesco@valla.it;
 h=from:subject:message-id; bh=+cZZKgyGaUPoEQqScoWx1jOl2Nq5wZ1n4A42KiJqbeg=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJlL1lw+f5BRa0+rwNdjEpPuT57orbfP8d3Htvh1Gv58/
 S+Udv2W6ShlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmEj+TkWFv6KTD6Rf62mK3
 W03LkunL7T5fz7g5hpHFZM7bJfbMk9kZ/lcEpk4/2PSZYc/czMXTDj9oV35Q/vBcnon4csFZxT/
 05ZgB
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
X-SGantispam-id: da5697ebe6b2ab215453f3dfbc0e6ed9
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vwoA5-00000000JRi-2NzQ-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-32w3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 21:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232145

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
Hello,

(sending this shortly after the v1 because that one had a wrong approach
to testing - sorry for the noise)

this patchset adds the possibility to include arbitrary loadables in a
kernel FIT image and to define all associated parameters (description,
compression, type, arch, os, load address and entry address) through
variables.

The idea behind the proposal is to be able to generate FIT images for
complex boot flows, in which components beyond the Linux kernel, its FDT
and an initramfs need to be loaded before the aforementioned Linux
kernel is up and running.

As an example, the setup propose by Marek Vasut in [1] (boot of the
kernel through OP-TEE, with both components being loaded from a single
FIT by U-Boot) could be simply obtained with:

  FIT_LOADABLES = "tee"
  FIT_LOADABLE_DESCRIPTION[tee] = "OP-TEE"
  FIT_LOADABLE_TYPE[tee] = "tee"
  FIT_LOADABLE_ARCH = "arm"
  FIT_LOADABLE_OS[tee] = "tee"
  FIT_LOADABLE_LOADADDRESS[tee] = "0xde000000"
  FIT_LOADABLE_ENTRYPOINT[tee] = "0xde000000"

while a more complex flow I'm experimenting on (boot of the OP-TEE and
the kernel through TF-A on the i.MX93, with all components being loaded
from a single FIT by U-Boot SPL after verification) as:

  FIT_LOADABLES = "atf tee"

  FIT_LOADABLE_FILENAME[atf] = "bl31-imx93.bin-optee"
  FIT_LOADABLE_DESCRIPTION[atf] = "TF-A Firmware"
  FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
  FIT_LOADABLE_OS[atf] = "arm-trusted-firmware"
  FIT_LOADABLE_LOADADDRESS[atf] = "0x204E0000"

  FIT_LOADABLE_FILENAME[tee] = "tee.bin"
  FIT_LOADABLE_DESCRIPTION[tee] = "OP-TEE"
  FIT_LOADABLE_TYPE[tee] = "tee"
  FIT_LOADABLE_OS[tee] = "tee"
  FIT_LOADABLE_LOADADDRESS[tee] = "0x96000000"

Being inside the FIT image, and part of all configurations, the
loadables can be in this way hashed and (optionally) signed and/or
encrypted with the same flow and key(s) already in place for the kernel.

The generated FIT image is compatible with the U-Boot FIT "full" boot
flow, which loads any component part of the "loadables" group after the
kernel, the fdt and the initramfs.

Regards,
Francesco Valla

[1] https://embedded-recipes.org/2025/images/slides/er-2025-vasut.pdf
---
Changes in v2:
- Added check over direct use of FIT_LOADABLE_* variables.
- Dropped patch for "relaxed" check of FIT nodes, superseeded by a new
  test approach (similar to the one used by uboot-config.bbclass).
- Link to v1: https://lore.kernel.org/r/20260228-fit_loadables-v1-0-3027ec37930d@valla.it
---
 meta/classes-recipe/kernel-fit-image.bbclass | 48 +++++++++++++++++++++++++
 meta/conf/image-fitimage.conf                | 18 ++++++++++
 meta/lib/oe/fitimage.py                      | 30 ++++++++++++++++
 meta/lib/oeqa/selftest/cases/fitimage.py     | 52 ++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 4880027b210196d25f83d7e683c37bd5e66575d3..367bc9bcfd3a4cd237e466269fa143941a02031a 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -28,6 +28,21 @@ python () {
     if providerdtb:
         d.appendVarFlag('do_compile', 'depends', ' virtual/dtb:do_populate_sysroot')
         d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
+
+    # Parse loadables config
+    loadables = d.getVar('FIT_LOADABLES')
+    if loadables:
+        # Check that the loadables configuration variables are not set directly
+        # directly, then assign them a synthetic value for testability purposes
+        for v in ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
+                  'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
+                  'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
+                  'FIT_LOADABLE_OS', 'FIT_LOADABLE_TYPE']:
+            if d.getVar(v):
+                raise bb.parse.SkipRecipe("You cannot use %s as a variable, you can only set flags." % v)
+
+            synt_value = " ? ".join([ d.getVarFlag(v, loadable) or "" for loadable in loadables.split() ])
+            d.setVar(v, synt_value)
 }
 
 do_configure[noexec] = "1"
@@ -139,6 +154,39 @@ python do_compile() {
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
+        loadable_arch = d.getVarFlag('FIT_LOADABLE_ARCH', loadable)
+        loadable_compression = d.getVarFlag('FIT_LOADABLE_COMPRESSION', loadable)
+        loadable_description = d.getVarFlag('FIT_LOADABLE_DESCRIPTION', loadable) or ("%s loadable" % loadable)
+        loadable_entrypoint = d.getVarFlag('FIT_LOADABLE_ENTRYPOINT', loadable)
+        loadable_os = d.getVarFlag('FIT_LOADABLE_OS', loadable)
+        loadable_type = d.getVarFlag('FIT_LOADABLE_TYPE', loadable)
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
index 0f2d9d17dbe6a452261566a1421cc41d10809399..3541c07520a8ee3f212471430792c31334d54278 100644
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
@@ -417,6 +426,9 @@ class KernelFitImageBase(FitImageTestCase):
             'FIT_DESC',
             'FIT_HASH_ALG',
             'FIT_KERNEL_COMP_ALG',
+            'FIT_LOADABLES',
+            'FIT_LOADABLE_ENTRYPOINT',
+            'FIT_LOADABLE_LOADADDRESS',
             'FIT_SIGN_ALG',
             'FIT_SIGN_INDIVIDUAL',
             'FIT_UBOOT_ENV',
@@ -520,6 +532,7 @@ class KernelFitImageBase(FitImageTestCase):
         fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
         initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
+        loadables = FitImageTestCase._get_loadables(bb_vars)
         uboot_sign_enable = bb_vars.get('UBOOT_SIGN_ENABLE')
 
         # image nodes
@@ -544,6 +557,9 @@ class KernelFitImageBase(FitImageTestCase):
         else:
             not_images.append('ramdisk-1')
 
+        if loadables:
+            images += loadables
+
         # configuration nodes (one per DTB, symlink, and mappings)
         configurations = []
         if dtb_files:
@@ -694,6 +710,7 @@ class KernelFitImageBase(FitImageTestCase):
         fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
         initramfs_image_bundle = bb_vars['INITRAMFS_IMAGE_BUNDLE']
+        loadables = FitImageTestCase._get_loadables(bb_vars)
         uboot_sign_enable = bb_vars['UBOOT_SIGN_ENABLE']
         uboot_sign_img_keyname = bb_vars['UBOOT_SIGN_IMG_KEYNAME']
         uboot_sign_keyname = bb_vars['UBOOT_SIGN_KEYNAME']
@@ -721,6 +738,13 @@ class KernelFitImageBase(FitImageTestCase):
                 "Load Address": bb_vars['UBOOT_RD_LOADADDRESS'],
                 "Entry Point": bb_vars['UBOOT_RD_ENTRYPOINT']
             }
+        # Create one section per loadable
+        for index,loadable in enumerate(loadables):
+            loadaddress = bb_vars['FIT_LOADABLE_LOADADDRESS'].split("?")[index].strip()
+            req_sections[loadable] = { "Load Address": loadaddress }
+            entrypoint = bb_vars['FIT_LOADABLE_ENTRYPOINT'].split("?")[index].strip()
+            if entrypoint:
+                req_sections[loadable]['Entry Point'] = entrypoint
         # Create a configuration section for each DTB
         if dtb_files:
             for dtb in dtb_files + dtb_symlinks:
@@ -740,6 +764,8 @@ class KernelFitImageBase(FitImageTestCase):
                     }
                 if initramfs_image and initramfs_image_bundle != "1":
                     req_sections[conf_name]['Init Ramdisk'] = "ramdisk-1"
+                if loadables:
+                    req_sections[conf_name]['Loadables'] = ",".join(loadables)
         else:
             conf_name = bb_vars['FIT_CONF_PREFIX'] +  '1'
             req_sections[conf_name] = {
@@ -747,6 +773,8 @@ class KernelFitImageBase(FitImageTestCase):
             }
             if initramfs_image and initramfs_image_bundle != "1":
                 req_sections[conf_name]['Init Ramdisk'] = "ramdisk-1"
+            if loadables:
+                req_sections[conf_name]['Loadables'] = ",".join(loadables)
 
         # Add signing related properties if needed
         if uboot_sign_enable == "1":
@@ -831,6 +859,8 @@ class KernelFitImageRecipeTests(KernelFitImageBase):
                      in the Image Tree Source. Not all the fields are tested,
                      only the key fields that wont vary between different
                      architectures.
+                     3. The load address and (if defined) entrypoint address
+                     of each loadable are as expected in the Image Tree Source.
         Product:     oe-core
         Author:      Usama Arif <usama.arif@arm.com>
         """
@@ -848,6 +878,14 @@ UBOOT_LOADADDRESS = "0x80080000"
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
@@ -1122,6 +1160,7 @@ class FitImagePyTests(KernelFitImageBase):
             'FIT_KEY_GENRSA_ARGS': "-F4",
             'FIT_KEY_REQ_ARGS': "-batch -new",
             'FIT_KEY_SIGN_PKCS': "-x509",
+            'FIT_LOADABLES': "",
             'FIT_LINUX_BIN': "linux.bin",
             'FIT_PAD_ALG': "pkcs-1.5",
             'FIT_SIGN_ALG': "rsa2048",
@@ -1197,6 +1236,12 @@ class FitImagePyTests(KernelFitImageBase):
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
 
@@ -1253,6 +1298,13 @@ class FitImagePyTests(KernelFitImageBase):
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

---
base-commit: be8cdcf13a658e9e81ff2f7b71d1c8c37a920ce7
change-id: 20260227-fit_loadables-1f93b9c7a7f2

Best regards,
-- 
Francesco Valla <francesco@valla.it>


