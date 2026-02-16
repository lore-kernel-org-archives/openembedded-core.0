Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EB3E63F24
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 01:33:38 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10898.1771205615600463582
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 17:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pb9IiSNj;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-50697d6a69cso15477041cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 17:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771205614; x=1771810414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+Dq5d0XDZ3qYEuo5NwytuoK6wKg3vK1wbC5CQAOTfs=;
        b=Pb9IiSNj5Epjwo/vqMUqNhGh8rTbniLBmTNVHql5mDiYAwtqM4nIYpHuU+UlOzcV8l
         4fTPErqXPC5A3NLnNGsdLxqKIoV5HT85WegSvpqOhzaOqgJ4Bs+kdLMrWMOOMSBs2qbU
         bB4oAhWWDQE3fcskiN4kfYXdDQwK5t2rvbuChFaqZpeO1GdIl6ocuu6t3odnXqiMsCHt
         ecsLdXI1aTZ0eRzxZ+daGvaYNVbUy8waOdqW9SlTMzS+1I/cUn3EQbCZqiAI3vnwN3cM
         0eplTiFcqFeXvXsqDxn1j7nlGr3lIzyc023vj26xrs48PmRqvgYCLT2UylqcmavS/Fvd
         iOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771205614; x=1771810414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+Dq5d0XDZ3qYEuo5NwytuoK6wKg3vK1wbC5CQAOTfs=;
        b=T3MhxvgyVpGng5fIxYS+2jewgmqYK3jZfODcZ5OS6wVuiJeH1iDMnx6CqAY4YcqKOx
         hqiUzhTVHOGEgI304D4W9W6Zpz4Nm5WRQ8YUQXAMJ+4GeTE3tBKN0CrBJUUX+0KZ1nPy
         YgSHOnTHXkpg1CZ8ly0AsWUikLYw2wAW/g8pw9WPg9mT4Q1fVmbbFd2s4MJBfXbpYGwj
         2i0qwXbZPef+re3sRQKN5I2zXy3LU8j7sr9honBnC3FLwtbHkPMwjVnsqO6WkL2WUsaB
         3k6jFejUGvHaLBmX0nwHUUPrFkr+ppWoNMKHxlLZhKlB++sNt22WaJFa8d4xwoISCl5V
         7FQA==
X-Gm-Message-State: AOJu0YwKb+vc8Llev0TwwB1+zWIg+hdo1UNKh+3DAVrQ25FjwTKEbLFa
	p8l+m0SPgBpGcfwjAgLFoPK4NBtfmIo5CQORXWWYXJrzzSu6GHx2m7/LlIB5oUJazhM=
X-Gm-Gg: AZuq6aKrMItJRVMv8+9/2dR+RBAYdKv15nlBaoFOY4rHCRiRuEGzAsf3NN/+WM2yZkZ
	A1XUxbxDB8mazRmDcPw+WYWqkX6lQe41rWq39wHOQAnXYN9TtdWcIK/3NcANp8qt6Mum0LTUmg1
	nr48tq6M1QsDrZwzVXik7e7w1TD/HaaAe50TlbTwj1OMONvTj5bBL7XZKCnDBcSHS+z690/ImdZ
	H6yPvyvM00Cgvt4RN66Y6GCWHQ5yZxpkgRbAnpPk16/tlYBOiABE6e1qxW3LAUO6PvV8AVsTvme
	j1R1qMFv1NAIc+nrmo0AHi63Wo0aEcj1SB0ZCL0Y3T2lrCFJpPh/eBTs1GZTNgRGyxul83hFnzR
	fSNvZTJ1BxOONc/pPLeix5YlcPoZEBcBHjqG9NujEtcwGlB0DUohMFdkGLck/qFjUeuoTFSDyGq
	gaJwVBVq8QrXXFAviTQMMyVHYG9ZV1xBEENPQ8gss9b7jbD3R/r98uPf5aB2+pj4eD5w==
X-Received: by 2002:ac8:5fc6:0:b0:501:4703:3b6a with SMTP id d75a77b69052e-506a8259d2cmr121209651cf.9.1771205613799;
        Sun, 15 Feb 2026 17:33:33 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684bc39e6sm133146631cf.31.2026.02.15.17.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 17:33:33 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [PATCH v2 2/2] ufs image class: add
Date: Sun, 15 Feb 2026 20:33:24 -0500
Message-ID: <20260216013324.735425-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216013324.735425-1-twoerner@gmail.com>
References: <20260216013324.735425-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 01:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231173

Add an image class and wks file that demonstrates generating a wic image
with a 4096-byte sector size.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes from v1:
- add Mark as co-creator
- fix the following warning when ufs image is *not* requested:
	WARNING: core-image-minimal-1.0-r0 do_image_wic_ufs: Function do_image_wic_ufs doesn't exist
---
 meta/classes-recipe/image.bbclass           |   2 +-
 meta/classes-recipe/image_types_ufs.bbclass | 221 ++++++++++++++++++++
 scripts/lib/wic/canned-wks/mkdisk-ufs.wks   |   5 +
 3 files changed, 227 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes-recipe/image_types_ufs.bbclass
 create mode 100644 scripts/lib/wic/canned-wks/mkdisk-ufs.wks

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 53f1a9dc45b0..97465836c14a 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -18,7 +18,7 @@ inherit populate_sdk_base
 IMGCLASSES += "${@['', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
 IMGCLASSES += "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso hddimg', 'image-live', '', d)}"
 IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-container', '', d)}"
-IMGCLASSES += "image_types_wic"
+IMGCLASSES += "image_types_wic image_types_ufs"
 IMGCLASSES += "rootfs-postcommands"
 IMGCLASSES += "image-postinst-intercepts"
 IMGCLASSES += "overlayfs-etc"
diff --git a/meta/classes-recipe/image_types_ufs.bbclass b/meta/classes-recipe/image_types_ufs.bbclass
new file mode 100644
index 000000000000..7b25d873349e
--- /dev/null
+++ b/meta/classes-recipe/image_types_ufs.bbclass
@@ -0,0 +1,221 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# The WICUFSVARS variable is used to define the base list of bitbake variables used in wic code
+# variables from this list are written to <image>.env file
+WICUFSVARS ?= "\
+	APPEND \
+	ASSUME_PROVIDED \
+	BBLAYERS \
+	DEPLOY_DIR_IMAGE \
+	FAKEROOTCMD \
+	HOSTTOOLS_DIR \
+	IMAGE_BASENAME \
+	IMAGE_BOOT_FILES \
+	IMAGE_CLASSES \
+	IMAGE_EFI_BOOT_FILES \
+	IMAGE_EXTRA_PARTITION_FILES \
+	IMAGE_LINK_NAME \
+	IMAGE_ROOTFS \
+	IMGDEPLOYDIR \
+	INITRAMFS_FSTYPES \
+	INITRAMFS_IMAGE \
+	INITRAMFS_IMAGE_BUNDLE \
+	INITRAMFS_LINK_NAME \
+	INITRD \
+	INITRD_LIVE \
+	ISODIR \
+	KERNEL_CONSOLE \
+	KERNEL_IMAGETYPE \
+	MACHINE \
+	PSEUDO_INCLUDE_PATHS \
+	RECIPE_SYSROOT_NATIVE \
+	ROOTFS_SIZE \
+	STAGING_DATADIR \
+	STAGING_DIR \
+	STAGING_DIR_HOST \
+	STAGING_LIBDIR \
+	TARGET_SYS \
+"
+
+inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
+
+WKSUFS_FILE ??= "${WKS_FILE}"
+WKSUFS_FILES ?= "${WKSUFS_FILE} ${IMAGE_BASENAME}.wks"
+WKSUFS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
+WKSUFS_FULL_PATH = "${@wks_search(d.getVar('WKSUFS_FILES').split(), d.getVar('WKSUFS_SEARCH_PATH')) or ''}"
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
+def wks_checksums(files, search_path):
+    ret = ""
+    for f in files:
+        found, hist = bb.utils.which(search_path, f, history=True)
+        ret = ret + " " + " ".join(h + ":False" for h in hist[:-1])
+        if found:
+            ret = ret + " " + found + ":True"
+    return ret
+
+
+WICUFS_CREATE_EXTRA_ARGS ?= "${WIC_CREATE_EXTRA_ARGS}"
+
+IMAGE_CMD:wic_ufs () {
+	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
+	build_wic_ufs="${WORKDIR}/build-wic-ufs"
+	tmp_wic_ufs="${WORKDIR}/tmp-wic-ufs"
+	wks="${WKSUFS_FULL_PATH}"
+	if [ -e "$tmp_wic_ufs" ]; then
+		# Ensure we don't have any junk leftover from a previously interrupted
+		# do_image_wic_ufs execution
+		rm -rf "$tmp_wic_ufs"
+	fi
+	if [ -z "$wks" ]; then
+		bbfatal "No kickstart files from WKSUFS_FILES were found: ${WKSUFS_FILES}. Please set WKSUFS_FILE or WKSUFS_FILES appropriately."
+	fi
+	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --sector-size 4096 --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}-ufs" -o "$build_wic_ufs/" -w "$tmp_wic_ufs" ${WICUFS_CREATE_EXTRA_ARGS}
+
+	# look to see if the user specifies a custom imager
+	IMAGER=direct
+	eval set -- "${WICUFS_CREATE_EXTRA_ARGS} --"
+	while [ 1 ]; do
+		case "$1" in
+			--imager|-i)
+				shift
+				IMAGER=$1
+				;;
+			--)
+				shift
+				break
+				;;
+		esac
+		shift
+	done
+	mv "$build_wic_ufs/$(basename "${wks%.wks}")"*.${IMAGER} "$out.wic.ufs"
+}
+IMAGE_CMD:wic.ufs[vardepsexclude] = "WKSUFS_FULL_PATH WKSUFS_FILES TOPDIR"
+SPDX_IMAGE_PURPOSE:wic.ufs = "diskImage"
+do_image_wic_ufs[cleandirs] = "${WORKDIR}/build-wic-ufs"
+
+# Rebuild when the wks file or vars in WICUFSVARS change
+USING_WIC_UFS = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
+WKSUFS_FILE_CHECKSUM = "${@wks_checksums(d.getVar('WKSUFS_FILES').split(), d.getVar('WKSUFS_SEARCH_PATH')) if '${USING_WIC_UFS}' else ''}"
+do_image_wic_ufs[file-checksums] += "${WKSUFS_FILE_CHECKSUM}"
+do_image_wic_ufs[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
+
+# We ensure all artfacts are deployed (e.g virtual/bootloader)
+do_image_wic_ufs[recrdeptask] += "do_deploy"
+do_image_wic_ufs[deptask] += "do_image_complete"
+
+WKSUFS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
+WKSUFS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
+# Unified kernel images need objcopy
+WKSUFS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
+WKSUFS_FILE_DEPENDS_BOOTLOADERS = ""
+WKSUFS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
+WKSUFS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
+WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot"
+WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot"
+WKSUFS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
+
+WKSUFS_FILE_DEPENDS ??= "${WKSUFS_FILE_DEPENDS_DEFAULT} ${WKSUFS_FILE_DEPENDS_BOOTLOADERS}"
+
+DEPENDS += "${@ '${WKSUFS_FILE_DEPENDS}' if d.getVar('USING_WIC_UFS') else '' }"
+
+python do_write_wksufs_template () {
+    """Write out expanded template contents to WKSUFS_FULL_PATH."""
+    import re
+
+    template_body = d.getVar('_WKSUFS_TEMPLATE')
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
+    wks_file = d.getVar('WKSUFS_FULL_PATH')
+    with open(wks_file, 'w') as f:
+        f.write(template_body)
+    f.close()
+    # Copy the finalized wks file to the deploy directory for later use
+    depdir = d.getVar('IMGDEPLOYDIR')
+    basename = d.getVar('IMAGE_BASENAME') + '-ufs'
+    bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + os.path.basename(wks_file)))
+}
+
+do_flush_pseudodb() {
+	${FAKEROOTENV} ${FAKEROOTCMD} -S
+}
+
+python () {
+    if d.getVar('USING_WIC_UFS'):
+        wksufs_file_u = d.getVar('WKSUFS_FULL_PATH', False)
+        wksufs_file = d.expand(wksufs_file_u)
+        base, ext = os.path.splitext(wksufs_file)
+        if ext == '.in' and os.path.exists(wksufs_file):
+            wksufs_out_file = os.path.join(d.getVar('WORKDIR'), os.path.basename(base))
+            d.setVar('WKSUFS_FULL_PATH', wksufs_out_file)
+            d.setVar('WKSUFS_TEMPLATE_PATH', wksufs_file_u)
+            d.setVar('WKSUFS_FILE_CHECKSUM', '${WKSUFS_TEMPLATE_PATH}:True')
+
+            # We need to re-parse each time the file changes, and bitbake
+            # needs to be told about that explicitly.
+            bb.parse.mark_dependency(d, wksufs_file)
+
+            try:
+                with open(wksufs_file, 'r') as f:
+                    body = f.read()
+            except (IOError, OSError) as exc:
+                pass
+            else:
+                # Previously, I used expandWithRefs to get the dependency list
+                # and add it to WICUFSVARS, but there's no point re-parsing the
+                # file in process_wks_template as well, so just put it in
+                # a variable and let the metadata deal with the deps.
+                d.setVar('_WKSUFS_TEMPLATE', body)
+                bb.build.addtask('do_write_wksufs_template', 'do_image_wic_ufs', 'do_image', d)
+        bb.build.addtask('do_image_wic_ufs', 'do_image_complete', 'do_image_wic', d)
+}
+
+#
+# Write environment variables used by wic
+# to tmp/sysroots/<machine>/imgdata/<image>-ufs.env
+#
+python do_rootfs_wicufsenv () {
+    wicufsvars = d.getVar('WICUFSVARS')
+    if not wicufsvars:
+        return
+
+    stdir = d.getVar('STAGING_DIR')
+    outdir = os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
+    bb.utils.mkdirhier(outdir)
+    basename = d.getVar('IMAGE_BASENAME') + '-ufs'
+    with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
+        for var in wicufsvars.split():
+            value = d.getVar(var)
+            if value:
+                envf.write('%s="%s"\n' % (var, value.strip()))
+    envf.close()
+    # Copy .env file to deploy directory for later use with stand alone wic
+    depdir = d.getVar('IMGDEPLOYDIR')
+    bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
+}
+addtask do_flush_pseudodb after do_rootfs before do_image do_image_qa
+addtask do_rootfs_wicufsenv after do_image before do_image_wic_ufs
+do_rootfs_wicufsenv[vardeps] += "${WICUFSVARS}"
+do_rootfs_wicufsenv[prefuncs] = 'set_image_size'
diff --git a/scripts/lib/wic/canned-wks/mkdisk-ufs.wks b/scripts/lib/wic/canned-wks/mkdisk-ufs.wks
new file mode 100644
index 000000000000..580f0a2045de
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/mkdisk-ufs.wks
@@ -0,0 +1,5 @@
+bootloader --ptable msdos
+
+part /boot --source rootfs --fstype=vfat --label boot --change-directory boot/
+part /     --source rootfs --fstype=ext4 --label root --exclude-path boot/
+part swap                  --fstype=swap --label swap --size 1M
-- 
2.51.0


