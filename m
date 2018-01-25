Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8D9A786BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 10:33:44 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id t79so9161491lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 02:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qbkzb/Z3ckOelB1h2DsqBcyp+QvyiUiPXQfryD7QGL4=;
	b=i5bxPTxVGp/H1alxmBwfs+t+QuCoRVgPiRTDQ+1VaxWxbKkrPtcQqOItd1ovrzoiRj
	euhs/46/HfZCjb5tNkbl59G0H3gGfvf3rTrM2zgagMW+JAmb5k0cSY/isynOu+iy1m8V
	OyjmO2398aFQlB7j7EK1CInGK/SRFj418kS5uI1kEYXwCrYHhpD03CG87r64IESd18Lr
	EB+6Ebz/y0t7QvzkGaQ9Lf6TFfwN3I3oDPKx/sMsBzowj2tydm8IMKAltAJ70i7iO/uE
	SkRqiG1iHoJYoK+ltLTqwuYUle3LLfVBq+O1Kj/T441g1XEGDNl/azHmwW3UEfxW7+bf
	p+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qbkzb/Z3ckOelB1h2DsqBcyp+QvyiUiPXQfryD7QGL4=;
	b=EU5Rugm+GC0N6xW1K9VEl1NH1bN1V4VRIHMpkYJFAGHhdttEiCfOD3gCayYcX9hWJ3
	CRGPRKsr1nBhLRVMVYXEh3Vexk2mfXBt6qOM+L2f4ryyql6vvU+lu4NP+TGbmhJ87r4n
	SiHgoCQMuPcmb8V+sej8cdBzSPtmOw3/9u6Yh8I5UsZN3YseA9D+Ylyblftni2lG8dzS
	sewShY03rxMNnWMl49sXM3c0kvgoS6xxoch1hO9zbR37m+bZj8gohtlpZOJf203ANLvJ
	hpwC8sp6RshNg+/i5walLz8DDWYs94zlAZ/aW+a1hD6YiAqdCVnPdwIGIaQ7KlqC2TEX
	F4YQ==
X-Gm-Message-State: AKwxytdSIz/zfrKvRvcVH/uSHF7AUBeN0yzHp42E+l9uKwTTwI8HdQT+
	jYcAzlrnctKtBpi8LHmuIHPHOIx4Ucg=
X-Google-Smtp-Source: AH8x225UInRz40S6gs6VylNcJSSb42S68t0yjExuKJ+1/b4310Jl4MDSWTZzcYtrX51UnHJY4xwRWQ==
X-Received: by 10.25.212.68 with SMTP id l65mr5314038lfg.5.1516876425172;
	Thu, 25 Jan 2018 02:33:45 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	11sm444246ljx.58.2018.01.25.02.33.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jan 2018 02:33:44 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 11:33:36 +0100
Message-Id: <1516876416-13748-2-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516876416-13748-1-git-send-email-kristian.amlie@northern.tech>
References: <e4d7ba56-e92f-9322-6e37-be08bcab8ad8@linux.intel.com>
	<1516876416-13748-1-git-send-email-kristian.amlie@northern.tech>
Subject: [PATCH v7] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Thu, 25 Jan 2018 10:33:44 -0000

This is a direct followup from the earlier 6602392db3d39 commit in
wic. It works more or less the same way: The variable specifies a list
of directories relative to the root of the rootfs, and these
directories will be excluded from the resulting rootfs image. If an
entry ends with a slash, only the contents are omitted, not the
directory itself.

Since the intended use of the variable is to exclude certain
directories from the rootfs, and then include said directories in
other partitions, it is not natural for this variable to be respected
for image creators that create multi partition images. These can turn
the feature off locally by defining:

  do_image_myfs[respect_exclude_path] = "0"

Specifically, "wic" and "multiubi" come with the feature disabled.

Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
---
 meta/classes/image.bbclass           | 84 +++++++++++++++++++++++++++++++++++-
 meta/classes/image_types.bbclass     |  1 +
 meta/classes/image_types_wic.bbclass |  1 +
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4531aa2..849a19c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -117,7 +117,8 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS',
+                 'IMAGE_ROOTFS_EXCLUDE_PATH']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
@@ -508,8 +509,9 @@ python () {
         d.setVarFlag(task, 'func', '1')
         d.setVarFlag(task, 'fakeroot', '1')
 
-        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
+        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size prepare_excluded_directories')
         d.prependVarFlag(task, 'postfuncs', ' create_symlinks')
+        d.appendVarFlag(task, 'postfuncs', ' cleanup_excluded_directories')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', 'DATETIME DATE ' + ' '.join(vardepsexclude))
@@ -518,6 +520,84 @@ python () {
         bb.build.addtask(task, 'do_image_complete', after, d)
 }
 
+python prepare_excluded_directories() {
+    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
+    if not exclude_var:
+        return
+
+    taskname = d.getVar("BB_CURRENTTASK")
+
+    if d.getVarFlag('do_%s' % taskname, 'respect_exclude_path') == '0':
+        bb.debug(1, "'IMAGE_ROOTFS_EXCLUDE_PATH' is set but 'respect_exclude_path' variable flag is 0 for this image type, so ignoring it")
+        return
+
+    import shutil
+    from oe.path import copyhardlinktree
+
+    exclude_list = exclude_var.split()
+
+    rootfs_orig = d.getVar('IMAGE_ROOTFS')
+    # We need a new rootfs directory we can delete files from. Copy to
+    # workdir.
+    new_rootfs = os.path.realpath(os.path.join(d.getVar("WORKDIR"), "rootfs.%s" % taskname))
+
+    if os.path.lexists(new_rootfs):
+        shutil.rmtree(os.path.join(new_rootfs))
+
+    copyhardlinktree(rootfs_orig, new_rootfs)
+
+    for orig_path in exclude_list:
+        path = orig_path
+        if os.path.isabs(path):
+            bb.fatal("IMAGE_ROOTFS_EXCLUDE_PATH: Must be relative: %s" % orig_path)
+
+        full_path = os.path.realpath(os.path.join(new_rootfs, path))
+
+        # Disallow climbing outside of parent directory using '..',
+        # because doing so could be quite disastrous (we will delete the
+        # directory).
+        if not full_path.startswith(new_rootfs):
+            bb.fatal("'%s' points to a path outside the rootfs" % orig_path)
+
+        if path.endswith(os.sep):
+            # Delete content only.
+            for entry in os.listdir(full_path):
+                full_entry = os.path.join(full_path, entry)
+                if os.path.isdir(full_entry) and not os.path.islink(full_entry):
+                    shutil.rmtree(full_entry)
+                else:
+                    os.remove(full_entry)
+        else:
+            # Delete whole directory.
+            shutil.rmtree(full_path)
+
+    # Save old value for cleanup later.
+    d.setVar('IMAGE_ROOTFS_ORIG', rootfs_orig)
+    d.setVar('IMAGE_ROOTFS', new_rootfs)
+}
+
+python cleanup_excluded_directories() {
+    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
+    if not exclude_var:
+        return
+
+    taskname = d.getVar("BB_CURRENTTASK")
+
+    if d.getVarFlag('do_%s' % taskname, 'respect_exclude_path') == '0':
+        return
+
+    import shutil
+
+    rootfs_dirs_excluded = d.getVar('IMAGE_ROOTFS')
+    rootfs_orig = d.getVar('IMAGE_ROOTFS_ORIG')
+    # This should never happen, since we should have set it to a different
+    # directory in the prepare function.
+    assert rootfs_dirs_excluded != rootfs_orig
+
+    shutil.rmtree(rootfs_dirs_excluded)
+    d.setVar('IMAGE_ROOTFS', rootfs_orig)
+}
+
 #
 # Compute the rootfs size
 #
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index c736f92..8cd8fd5 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -201,6 +201,7 @@ IMAGE_CMD_multiubi () {
 		multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}"
 	done
 }
+do_image_multiubi[respect_exclude_path] = "0"
 
 IMAGE_CMD_ubi () {
 	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index dcf620c..452d7f3 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -34,6 +34,7 @@ IMAGE_CMD_wic () {
 	rm -rf "$out/"
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
+do_image_wic[respect_exclude_path] = "0"
 
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
-- 
2.7.4


