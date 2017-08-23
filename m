Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB8F78208
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 11:44:09 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id d17so6226633lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 04:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Vy7N+n0JECDnH4M9Ysa0pxoxYKOeaYDCY9iFl+KTbNM=;
	b=MEMb5yldk9wNqhnPo4WIVQMYsFjFBnQnA4MkPcL5IsHo8hMnyF4wc43CfiKTw5ryYr
	nc8RHf2EtNy7+Q3456hpGjgALL0+8nL28JkBfScvO271G0jP0uH8uLqZPP3jtKkpBxU3
	MoaeeFw85Ht0YxVUs1sYEjzIRpvBjgA/grbtkNB9eG6jQuryxDwf3bPrm891uQrMmpAX
	g5MjvoNkkUR1vfLDGyIX57FCHtm1bQu1SGtilMN81Aw5O9HmaqP/YpvMEfjBfoY80hgi
	kf3SNJdk9PyaK1PPMRuLlZIS+RVD5HelcwCYhLNjflmr5IBrFG66UbR/4knnEwEltjFo
	rvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Vy7N+n0JECDnH4M9Ysa0pxoxYKOeaYDCY9iFl+KTbNM=;
	b=f5igW4U0HqR9a41ldrAoRidkQk4UrCy/wIHYE6xG3qGHgmQ0gieEhYmV5s/6XfMKoS
	9rVGhL306ysOKmnY5fGei+Kk1Ls+52RmXzq/LtZQkPymwBtriJrUn3klfoycCT9Z27n+
	VszM0104Vo+KPzBPNh1bfYN6g2mXJCZI6BllwQjdKb4pQrleaed0WbhymwgxJfj+2rLZ
	HfAGEwR+HqkYJoz8xFWXnn2ODBdHOjbHQZKoSxchBn6wji+nH1p8c0MAN3zQQS33RV9s
	/oG9NLjruQTIVuKnQTldqbVwWzJ05knZgzd6JA9BGKVo5eQlt7Cavi8h68KhpgfFt8FW
	/57Q==
X-Gm-Message-State: AHYfb5g2y3XuiaA0BrCQOjyBDnn3NY0CTt3gSbRwnWhE95DErC90FTN5
	mAO3v1WTbAfQEz/rJFg9xA==
X-Received: by 10.46.64.131 with SMTP id r3mr844085lje.20.1503488650324;
	Wed, 23 Aug 2017 04:44:10 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	h13sm230686lfl.5.2017.08.23.04.44.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Aug 2017 04:44:09 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 13:44:06 +0200
Message-Id: <1503488646-1439-2-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497880906-18170-2-git-send-email-kristian.amlie@mender.io>
References: <1497880906-18170-2-git-send-email-kristian.amlie@mender.io>
Subject: [PATCH v4] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 23 Aug 2017 11:44:10 -0000

From: Kristian Amlie <kristian.amlie@mender.io>

This is a direct followup from the earlier f6a064d969f414 commit in
wic. It works more or less the same way: The variable specifies a list
of directories relative to the root of the rootfs, and these
directories will be excluded from the resulting rootfs image. If an
entry ends with a slash, only the contents are omitted, not the
directory itself.

Since the intended use of the variable is to exclude certain
directories from the rootfs, and then include said directories in
other partitions, it is not natural for this variable to be respected
for image creators that create multi partition images. Therefore the
default is to ignore the variable, and image creators that create
single root filesystems need to set

  do_image_myfs[respect_exclude_path] = "1"

in order to honor it. Specifically, "wic" and "multiubi" have not
received this variable flag, while others have.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 documentation/ref-manual/ref-variables.xml | 35 +++++++++++++
 meta/classes/image.bbclass                 | 83 +++++++++++++++++++++++++++++-
 meta/classes/image_types.bbclass           | 13 +++++
 3 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index ff8f4e7..a4f2de5 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -6043,6 +6043,41 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-IMAGE_ROOTFS_EXCLUDE_PATH'><glossterm>IMAGE_ROOTFS_EXCLUDE_PATH</glossterm>
+            <info>
+                IMAGE_ROOTFS_EXCLUDE_PATH[doc] = "Specifies paths to omit from the rootfs."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
+                    Specifies paths that should be omitted from the root filesystem, separated by
+                    spaces. The paths must be relative to the root of the filesystem (for example
+                    "usr"). Single root filesystem images will not include the path in the
+                    filesystem, except if the path ends with a slash, then the directory will be
+                    included, but without any content.
+                    <literallayout class='monospaced'>
+     # Omit /usr completely from rootfs.
+     IMAGE_ROOTFS_EXCLUDE_PATH += "<replaceable>usr</replaceable> ..."
+     # Include the directory /usr in rootfs, but not its content.
+     IMAGE_ROOTFS_EXCLUDE_PATH += "<replaceable>usr/</replaceable> ..."
+                    </literallayout>
+                </para>
+                <para>
+                    Image creators that create multi partition images typically do not honor this
+                    variable, and must provide their own method to split the directory
+                    structure. For example, <filename>wic</filename> has
+                    <filename>--exclude-path</filename> and <filename>--rootfs-dir</filename>.
+                </para>
+                <para>
+                    The default for custom image creators is to ignore this variable. Those that
+                    need to honor it must set:
+                    <literallayout class='monospaced'>
+     do_image_<replaceable>custom</replaceable>[respect_exclude_path] = "1"
+                    </literallayout>
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-IMAGE_ROOTFS_EXTRA_SPACE'><glossterm>IMAGE_ROOTFS_EXTRA_SPACE</glossterm>
             <info>
                 IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in the image in Kbytes. By default, this variable is set to '0'."
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3639aa4..e215541 100644
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
@@ -496,8 +497,9 @@ python () {
         d.setVarFlag(task, 'func', '1')
         d.setVarFlag(task, 'fakeroot', '1')
 
-        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
+        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size prepare_excluded_directories')
         d.prependVarFlag(task, 'postfuncs', ' create_symlinks')
+        d.appendVarFlag(task, 'postfuncs', ' cleanup_excluded_directories')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', 'DATETIME DATE')
@@ -506,6 +508,83 @@ python () {
         bb.build.addtask(task, 'do_image_complete', after, d)
 }
 
+python prepare_excluded_directories() {
+    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
+    if not exclude_var:
+        return
+
+    taskname = d.getVar("BB_CURRENTTASK")
+
+    if d.getVarFlag('do_%s' % taskname, 'respect_exclude_path') != '1':
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
+    if d.getVarFlag('do_%s' % taskname, 'respect_exclude_path') != '1':
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
index e0368c7..a063df9 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -62,8 +62,10 @@ ZIP_COMPRESSION_LEVEL ?= "-9"
 
 JFFS2_SUM_EXTRA_ARGS ?= ""
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 ${EXTRA_IMAGECMD}"
+do_image_jffs2[respect_exclude_path] = "1"
 
 IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cramfs ${EXTRA_IMAGECMD}"
+do_image_cramfs[respect_exclude_path] = "1"
 
 oe_mkext234fs () {
 	fstype=$1
@@ -92,6 +94,9 @@ oe_mkext234fs () {
 IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ext3 = "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
+do_image_ext2[respect_exclude_path] = "1"
+do_image_ext3[respect_exclude_path] = "1"
+do_image_ext4[respect_exclude_path] = "1"
 
 MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD_btrfs () {
@@ -103,10 +108,14 @@ IMAGE_CMD_btrfs () {
 	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs count=${size} bs=1024
 	mkfs.btrfs ${EXTRA_IMAGECMD} -r ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.btrfs
 }
+do_image_btrfs[respect_exclude_path] = "1"
 
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
 IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
+do_image_squashfs[respect_exclude_path] = "1"
+do_image_squashfs-xz[respect_exclude_path] = "1"
+do_image_squashfs-lzo[respect_exclude_path] = "1"
 
 # By default, tar from the host is used, which can be quite old. If
 # you need special parameters (like --xattrs) which are only supported
@@ -121,6 +130,7 @@ IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
 IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+do_image_tar[respect_exclude_path] = "1"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
@@ -141,6 +151,7 @@ IMAGE_CMD_cpio () {
 		fi
 	fi
 }
+do_image_cpio[respect_exclude_path] = "1"
 
 ELF_KERNEL ?= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
 ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
@@ -149,6 +160,7 @@ IMAGE_CMD_elf () {
 	test -f ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf && rm -f ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf
 	mkelfImage --kernel=${ELF_KERNEL} --initrd=${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.cpio.gz --output=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
 }
+do_image_elf[respect_exclude_path] = "1"
 
 IMAGE_TYPEDEP_elf = "cpio.gz"
 
@@ -212,6 +224,7 @@ IMAGE_CMD_ubi () {
 }
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
+do_image_ubifs[respect_exclude_path] = "1"
 
 EXTRA_IMAGECMD = ""
 
-- 
2.7.4


