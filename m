Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83505D70DF2
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:14:53 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1704.1766088888314790029
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=RwEkEDiq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20251218201445c33759d4f400020733-m97h_g@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251218201445c33759d4f400020733
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Dec 2025 21:14:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=rznMewXY9nTLKLJSvL0/KkIzoQ1f6qunTsIU8d/niqE=;
 b=RwEkEDiqUBMyTUS1BSUWHPGrdYla/Z5T34vER028QtiSzZ+MNEXI3mvp+JYRgcG9rBf108
 i51BbCn47JPY+WBOnmEj/ZANvOZy3DCLB8Ad0Chgc2Fwq0oPl6Gjb72szo7L3HwpEBDvpg6h
 aRGdI91BDAPJzEv1UiYKGq0JWAt7MXe9ZhHJs8jJ0Ya9CjVZvbqeTHrbuGqBRt3d9TET0ags
 i0V+HwrC1W7xb0YO/mJiBHI7ZLuLsE0nuR2drSa18brIRQgbQMLiNRK9nOQBrb5R7ebzbpnt
 8Kqatj8LZx2LLmkMTZ4/C6DeqPvLbLpQ7HzmQ8lUGviUr5KLMpFHEqhg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] kernel-fitimage: Add FIT_CONF_MAPPINGS for flexible DTB configuration
Date: Thu, 18 Dec 2025 21:14:03 +0100
Message-ID: <20251218201432.1608259-2-adrian.freihofer@siemens.com>
In-Reply-To: <20251218201432.1608259-1-adrian.freihofer@siemens.com>
References: <20251218201432.1608259-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228142

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Having a 1-1 mapping between DTB names and configuration nodes names in
FIT images does not always work. Make this a bit more flexible by
allowing users to specify mappings to rename configuration nodes or add
extra configuration nodes for existing DTBs.

The new FIT_CONF_MAPPINGS variable accepts a space-separated list of
mapping commands:

- dtb-conf:DTB_NAME:NEW_NAME
    Renames the configuration node for a specific DTB.

- dtb-extra-conf:DTB_NAME:EXTRA_NAME
    Creates an additional configuration node for an existing DTB.

Example usage:
    FIT_CONF_MAPPINGS = "\
        dtb-extra-conf:am335x-bonegreen:bonegreen \
        dtb-conf:am335x-boneblack:bbblack"

This generates three configuration nodes from two DTBs:
am335x-bonegreen, bonegreen (extra), and bbblack (renamed).

The implementation validates all mappings and ensures they match
existing DTBs, failing with clear error messages for invalid or unused
mappings.

Also removes leftover debug warning that was printing DTB configuration
details during FIT image generation.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass |  2 +-
 meta/conf/image-fitimage.conf                | 12 +++++
 meta/lib/oe/fitimage.py                      | 57 ++++++++++++++++++--
 3 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index fd0d21ceee..ec8e861d7f 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -139,7 +139,7 @@ python do_compile() {
             bb.fatal("Could not find a valid initramfs type for %s, the supported types are: %s" % (d.getVar('INITRAMFS_IMAGE_NAME'), d.getVar('FIT_SUPPORTED_INITRAMFS_FSTYPES')))
 
     # Generate the configuration section
-    root_node.fitimage_emit_section_config(d.getVar("FIT_CONF_DEFAULT_DTB"))
+    root_node.fitimage_emit_section_config(d.getVar("FIT_CONF_DEFAULT_DTB"), d.getVar("FIT_CONF_MAPPINGS"))
 
     # Write the its file
     root_node.write_its_file(itsfile)
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..b183e64319 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -47,6 +47,18 @@ FIT_LINUX_BIN ?= "linux.bin"
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= ""
 
+# Allow user to specify DTB configuration node mappings.
+# The format is a space-separated list of mappings. Supported mapping types are:
+# dtb-conf:DTB_NAME:NEW_NAME         - Rename the configuration node for a DTB
+# dtb-extra-conf:DTB_NAME:EXTRA_NAME - Add an additional configuration node for a DTB
+# Example:
+#   FIT_CONF_MAPPINGS = "\
+#     dtb-extra-conf:am335x-bonegreen:bonegreen \
+#     dtb-conf:am335x-boneblack:bbblack"
+# Two DTBs (am335x-bonegreen and am335x-boneblack) result in three
+# configuration nodes: am335x-bonegreen, bonegreen, bbblack
+FIT_CONF_MAPPINGS ?= ""
+
 # length of address in number of <u32> cells
 # ex: 1 32bits address, 2 64bits address
 FIT_ADDRESS_CELLS ?= "1"
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index f303799155..4798088259 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -331,7 +331,6 @@ class ItsNodeRootKernel(ItsNode):
         dtb_id = os.path.basename(dtb_path)
         dtb_alias_node = ItsNodeDtbAlias("fdt-" + dtb_id, dtb_alias_id, compatible)
         self._dtb_alias.append(dtb_alias_node)
-        bb.warn(f"compatible: {compatible}, dtb_alias_id: {dtb_alias_id}, dtb_id: {dtb_id}, dtb_path: {dtb_path}")
 
     def fitimage_emit_section_boot_script(self, bootscr_id, bootscr_path):
         """Emit the fitImage ITS u-boot script section"""
@@ -462,15 +461,63 @@ class ItsNodeRootKernel(ItsNode):
                 }
             )
 
-    def fitimage_emit_section_config(self, default_dtb_image=None):
+    def fitimage_emit_section_config(self, default_dtb_image=None, mappings=None):
         if self._dtbs:
+            dtb_extra_confs = []
+            dtb_confs = {}
+            if mappings:
+                for mapping in mappings.split():
+                    try:
+                        mapping_type, dtb_name, alt_name = mapping.split(':')
+                    except ValueError:
+                        bb.fatal("FIT configuration mapping '%s' is invalid. Expected format: 'mapping_type:dtb_name:alternative_name'" % mapping)
+                    if mapping_type == "dtb-conf":
+                        if dtb_name in dtb_confs:
+                            bb.fatal("FIT configuration mapping 'dtb-conf:%s' specified multiple times" % dtb_name)
+                        dtb_confs[dtb_name] = alt_name
+                    elif mapping_type == "dtb-extra-conf":
+                        dtb_extra_confs.append((dtb_name, alt_name))
+                    else:
+                        bb.fatal("FIT configuration mapping-type '%s' is invalid" % mapping_type)
+
+            # Process regular DTBs
             for dtb in self._dtbs:
                 dtb_name = dtb.name
                 if dtb.name.startswith("fdt-"):
                     dtb_name = dtb.name[len("fdt-"):]
-                self._fitimage_emit_one_section_config(self._conf_prefix + dtb_name, dtb)
-            for dtb in self._dtb_alias:
-                self._fitimage_emit_one_section_config(self._conf_prefix + dtb.alias_name, dtb)
+
+                dtb_renamed = dtb_name
+                if dtb_name in dtb_confs:
+                    dtb_renamed = dtb_confs.pop(dtb_name)
+                self._fitimage_emit_one_section_config(self._conf_prefix + dtb_renamed, dtb)
+
+                # Process extra configurations for this DTB
+                for dtb_extra_name, dtb_extra_alias in dtb_extra_confs[:]:
+                    if dtb_name == dtb_extra_name:
+                        dtb_extra_confs.remove((dtb_extra_name, dtb_extra_alias))
+                        self._fitimage_emit_one_section_config(self._conf_prefix + dtb_extra_alias, dtb)
+
+            # Process external DTB sym-link aliases
+            for dtb_alias in self._dtb_alias:
+                alias_name = dtb_alias.alias_name
+                dtb_renamed = alias_name
+                if alias_name in dtb_confs:
+                    dtb_renamed = dtb_confs.pop(alias_name)
+                self._fitimage_emit_one_section_config(self._conf_prefix + dtb_renamed, dtb_alias)
+
+                # Process extra configurations for this DTB alias
+                for dtb_extra_name, dtb_extra_alias in dtb_extra_confs[:]:
+                    if alias_name == dtb_extra_name:
+                        dtb_extra_confs.remove((dtb_extra_name, dtb_extra_alias))
+                        self._fitimage_emit_one_section_config(self._conf_prefix + dtb_extra_alias, dtb_alias)
+
+            # Verify all mappings were used
+            if dtb_confs or dtb_extra_confs:
+                unused_conf = (
+                    ["dtb-conf:%s:%s" % (name, alt) for name, alt in dtb_confs.items()] +
+                    ["dtb-extra-conf:%s:%s" % (name, alias) for name, alias in dtb_extra_confs]
+                )
+                bb.fatal("FIT configuration mapping(s) not matched with any DTB: %s" % ', '.join(unused_conf))
         else:
             # Currently exactly one kernel is supported.
             self._fitimage_emit_one_section_config(self._conf_prefix + "1")
-- 
2.52.0


