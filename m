Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 53AB171AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:09:28 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 16 Jan 2017 08:09:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,239,1477983600"; d="scan'208";a="54487690"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 16 Jan 2017 08:09:20 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 71AB16A4006;
	Mon, 16 Jan 2017 08:08:24 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 17:46:30 +0200
Message-Id: <068f02c808ec1e5aee3735143960d2b7ad1d0ae3.1484581112.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484581112.git.ed.bartosh@linux.intel.com>
References: <cover.1484581112.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 01/14] image-wic: move wic-related code to image-wic
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
X-List-Received-Date: Mon, 16 Jan 2017 16:09:29 -0000

There is a lot of wic code in image.bbclass and image_types.bbclass
Having all code in one place should make it more readable and easier
to maintain.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-wic.bbclass   | 113 +++++++++++++++++++++++++++++++++++++++
 meta/classes/image.bbclass       |  25 +--------
 meta/classes/image_types.bbclass |  89 ------------------------------
 3 files changed, 115 insertions(+), 112 deletions(-)
 create mode 100644 meta/classes/image-wic.bbclass

diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-wic.bbclass
new file mode 100644
index 0000000..bf94e2d
--- /dev/null
+++ b/meta/classes/image-wic.bbclass
@@ -0,0 +1,113 @@
+WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
+WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
+WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
+WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARCH_PATH}') or ''}"
+
+# The WICVARS variable is used to define list of bitbake variables used in wic code
+# variables from this list is written to <image>.env file
+WICVARS ?= "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS WORKDIR"
+
+def wks_search(files, search_path):
+    for f in files:
+        if os.path.isabs(f):
+            if os.path.exists(f):
+                return f
+        else:
+            searched = bb.utils.which(search_path, f)
+            if searched:
+                return searched
+
+WIC_CREATE_EXTRA_ARGS ?= ""
+
+IMAGE_CMD_wic () {
+	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
+	wks="${WKS_FULL_PATH}"
+	if [ -z "$wks" ]; then
+		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
+	fi
+
+	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
+	mv "$out/build/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
+	rm -rf "$out/"
+}
+IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
+
+# Rebuild when the wks file or vars in WICVARS change
+USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
+WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
+do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
+
+python () {
+    if d.getVar('USING_WIC') and 'do_bootimg' in d:
+        bb.build.addtask('do_image_wic', '', 'do_bootimg', d)
+}
+
+python do_write_wks_template () {
+    """Write out expanded template contents to WKS_FULL_PATH."""
+    import re
+
+    template_body = d.getVar('_WKS_TEMPLATE')
+
+    # Remove any remnant variable references left behind by the expansion
+    # due to undefined variables
+    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
+    while True:
+        new_body = re.sub(expand_var_regexp, '', template_body)
+        if new_body == template_body:
+            break
+        else:
+            template_body = new_body
+
+    wks_file = d.getVar('WKS_FULL_PATH')
+    with open(wks_file, 'w') as f:
+        f.write(template_body)
+}
+
+python () {
+    if d.getVar('USING_WIC'):
+        wks_file_u = d.getVar('WKS_FULL_PATH', False)
+        wks_file = d.expand(wks_file_u)
+        base, ext = os.path.splitext(wks_file)
+        if ext == '.in' and os.path.exists(wks_file):
+            wks_out_file = os.path.join(d.getVar('WORKDIR'), os.path.basename(base))
+            d.setVar('WKS_FULL_PATH', wks_out_file)
+            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
+            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
+
+            try:
+                with open(wks_file, 'r') as f:
+                    body = f.read()
+            except (IOError, OSError) as exc:
+                pass
+            else:
+                # Previously, I used expandWithRefs to get the dependency list
+                # and add it to WICVARS, but there's no point re-parsing the
+                # file in process_wks_template as well, so just put it in
+                # a variable and let the metadata deal with the deps.
+                d.setVar('_WKS_TEMPLATE', body)
+                bb.build.addtask('do_write_wks_template', 'do_image_wic', None, d)
+}
+
+
+#
+# Write environment variables used by wic
+# to tmp/sysroots/<machine>/imgdata/<image>.env
+#
+python do_rootfs_wicenv () {
+    wicvars = d.getVar('WICVARS')
+    if not wicvars:
+        return
+
+    stdir = d.getVar('STAGING_DIR_TARGET')
+    outdir = os.path.join(stdir, 'imgdata')
+    bb.utils.mkdirhier(outdir)
+    basename = d.getVar('IMAGE_BASENAME')
+    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
+        for var in wicvars.split():
+            value = d.getVar(var)
+            if value:
+                envf.write('%s="%s"\n' % (var, value.strip()))
+}
+addtask do_rootfs_wicenv after do_image before do_image_wic
+do_rootfs_wicenv[vardeps] += "${WICVARS}"
+do_rootfs_wicenv[prefuncs] = 'set_image_size'
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 04fd5f9..0deef54 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -189,6 +189,8 @@ python () {
 IMAGE_CLASSES += "image_types"
 inherit ${IMAGE_CLASSES}
 
+inherit image-wic
+
 IMAGE_POSTPROCESS_COMMAND ?= ""
 
 # some default locales
@@ -329,29 +331,6 @@ fakeroot python do_image_qa () {
 }
 addtask do_image_qa after do_image_complete before do_build
 
-#
-# Write environment variables used by wic
-# to tmp/sysroots/<machine>/imgdata/<image>.env
-#
-python do_rootfs_wicenv () {
-    wicvars = d.getVar('WICVARS')
-    if not wicvars:
-        return
-
-    stdir = d.getVar('STAGING_DIR_TARGET')
-    outdir = os.path.join(stdir, 'imgdata')
-    bb.utils.mkdirhier(outdir)
-    basename = d.getVar('IMAGE_BASENAME')
-    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
-        for var in wicvars.split():
-            value = d.getVar(var)
-            if value:
-                envf.write('%s="%s"\n' % (var, value.strip()))
-}
-addtask do_rootfs_wicenv after do_image before do_image_wic
-do_rootfs_wicenv[vardeps] += "${WICVARS}"
-do_rootfs_wicenv[prefuncs] = 'set_image_size'
-
 def setup_debugfs_variables(d):
     d.appendVar('IMAGE_ROOTFS', '-dbg')
     d.appendVar('IMAGE_LINK_NAME', '-dbg')
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8f04849..4f81d1a 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -184,92 +184,6 @@ IMAGE_CMD_ubi () {
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
 
-WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
-WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
-WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
-WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARCH_PATH}') or ''}"
-
-def wks_search(files, search_path):
-    for f in files:
-        if os.path.isabs(f):
-            if os.path.exists(f):
-                return f
-        else:
-            searched = bb.utils.which(search_path, f)
-            if searched:
-                return searched
-
-WIC_CREATE_EXTRA_ARGS ?= ""
-
-IMAGE_CMD_wic () {
-	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
-	wks="${WKS_FULL_PATH}"
-	if [ -z "$wks" ]; then
-		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
-	fi
-
-	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
-	mv "$out/build/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
-	rm -rf "$out/"
-}
-IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
-
-# Rebuild when the wks file or vars in WICVARS change
-USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
-WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
-do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
-
-python () {
-    if d.getVar('USING_WIC') and 'do_bootimg' in d:
-        bb.build.addtask('do_image_wic', '', 'do_bootimg', d)
-}
-
-python do_write_wks_template () {
-    """Write out expanded template contents to WKS_FULL_PATH."""
-    import re
-
-    template_body = d.getVar('_WKS_TEMPLATE')
-
-    # Remove any remnant variable references left behind by the expansion
-    # due to undefined variables
-    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
-    while True:
-        new_body = re.sub(expand_var_regexp, '', template_body)
-        if new_body == template_body:
-            break
-        else:
-            template_body = new_body
-
-    wks_file = d.getVar('WKS_FULL_PATH')
-    with open(wks_file, 'w') as f:
-        f.write(template_body)
-}
-
-python () {
-    if d.getVar('USING_WIC'):
-        wks_file_u = d.getVar('WKS_FULL_PATH', False)
-        wks_file = d.expand(wks_file_u)
-        base, ext = os.path.splitext(wks_file)
-        if ext == '.in' and os.path.exists(wks_file):
-            wks_out_file = os.path.join(d.getVar('WORKDIR'), os.path.basename(base))
-            d.setVar('WKS_FULL_PATH', wks_out_file)
-            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
-            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
-
-            try:
-                with open(wks_file, 'r') as f:
-                    body = f.read()
-            except (IOError, OSError) as exc:
-                pass
-            else:
-                # Previously, I used expandWithRefs to get the dependency list
-                # and add it to WICVARS, but there's no point re-parsing the
-                # file in process_wks_template as well, so just put it in
-                # a variable and let the metadata deal with the deps.
-                d.setVar('_WKS_TEMPLATE', body)
-                bb.build.addtask('do_write_wks_template', 'do_image_wic', None, d)
-}
-
 EXTRA_IMAGECMD = ""
 
 inherit siteinfo
@@ -367,6 +281,3 @@ IMAGE_EXTENSION_live = "hddimg iso"
 # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
 
-# The WICVARS variable is used to define list of bitbake variables used in wic code
-# variables from this list is written to <image>.env file
-WICVARS ?= "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
-- 
2.1.4


