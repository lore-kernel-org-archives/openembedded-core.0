Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC4AE6816A
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:27:25 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9087.1771324038434125130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hi02BeMs;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-895071c5527so54945536d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 02:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771324037; x=1771928837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NAegeWmi7+NF3HNfurdCS+9mvyiHZfs6WiTSPda3Bo=;
        b=Hi02BeMsnO9l/EoC9dHNtZt5YlFCXuxcuq1Zuhq3Sw1sfBNBK871L16zkLQ+zuR3mM
         ySh0JKC0S7LBplfciwH5OnHhhTFPKCL0FRau+jXgh+x0vseqWgeuNRaaCYf/bS9x4LZh
         YHisyAkvI6O70fSYRndGUk0yEjOqihBKoJ8cGvlHdcijFG0bTaBsFC3uZLM9sm0d+/2k
         vAhGH1//CNTGoeAwrwnTR2lAfgwWXESNBZfD5WNYVOd2/t84hz40ctaTe+bN2MGlF3vA
         tKxFhJcanuGx/zduIZP93PsZu4dd5ZsY7BXY0/ODM1asQXzBmysE79LzBs1mQamjaiTx
         3y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324037; x=1771928837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9NAegeWmi7+NF3HNfurdCS+9mvyiHZfs6WiTSPda3Bo=;
        b=LNLQxWcPydFFMG4EAWWziBuERpOhQQ72zT3P3JljEElNsqNIY26j9SXZ95RtbQWaMv
         ZJZlI48I967Hk/znagfpAmxw+jlNwXZlgpZlFzleZmI/h4hN+0RUcVo+8t6OJjqYPxlM
         B/6OS/NGqGZLQ6XqUNaYwsimuUJeja+e13meACZQKC6qQ9aOjcxxgAHFFQTVb8iiEAIP
         93QexxaSt5NNex9qkV2PZzXKEyWVu2wWbZ43ApVm6WRL/n0FWaH0UqDYIz9dBMvO6K/I
         qSU8Colf0l5ZkYFGIh2DOnrdw5ZonMw1YGELaLPUsLmc0IFKmcCr+lNHrqzTaujFWQH3
         dCzw==
X-Gm-Message-State: AOJu0YwZYSs7dNRzjWpSY+3lVSt5Cbb4J+fjM9TW0Cka8Cys9tAdXXE+
	/h6vT+OD/dLY1Da2TstlwVsCN6Y5IpIGh1PzAuwK93kc4pJJ7ozWhsx2TtrJb0bqYFM=
X-Gm-Gg: AZuq6aJN/LmHEAZ5oGCDPifxovj0zHAvIiAxz3Kcth2lDbteVl6csrZ7qKrZfkXjy4+
	ZTZBuB8IQ9rss7SW6Pk5GfMrXP5wqgBz44LndAwJ33hdPD+j3sai2GTosCw5H45kJxMCOMz8Cyn
	4un0ddCB2ddh1quc/ppOoJ+MSLcZ1GJmiaSh5cNUikjmuymLajX1Q1hZclw+qJUTOruarreOJcC
	uEaM1P0Vg8TwpiPw0fDseEI9x1jAJ1/ykMdh00dscqlhKe3cTe0iPZadDMLWi0Pl3RDu5VIcK36
	To+yIuDxoSJTfmPxxP1B0hQ8c67rla8W2Bv7LUc8Ttm0Jj+8G1mUI0b0uov5RVZou52MY4f4mba
	jvrMY+cd1Up0QvUlMe+RYf+DZ90w6NIwjxVQDJIbxoGHz6hOXtJP2kVm4YuJdUcGXuQ2nI8JUVv
	d7c9Ia0AN1xCS83PEUUjP8WtYcND4dReAooYzpDmfa8Asz0OsQXwTW/YjCWB4tdXH5XQ==
X-Received: by 2002:a05:6214:1303:b0:894:6ff2:191c with SMTP id 6a1803df08f44-89740466e1bmr146412046d6.33.1771324036649;
        Tue, 17 Feb 2026 02:27:16 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc7bbcdsm159026506d6.9.2026.02.17.02.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:27:15 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [PATCH v4 2/2] ufs image class: add
Date: Tue, 17 Feb 2026 05:27:07 -0500
Message-ID: <20260217102707.2542807-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260217102707.2542807-1-twoerner@gmail.com>
References: <20260217102707.2542807-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 10:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231240

Add an image class and wks file that demonstrates generating a wic image
with a 4096-byte sector size.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes from v3:
- update the partition table format from mbr (msdos) to gpt

changes from v2:
- tested more scenarios and made sure to fix the warning from v1 in
  every case

changes from v1:
- add Mark as a co-creator (sorry for missing this the first time!)
- provide a fix for the following warning:
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
index 000000000000..9a984f084289
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
+IMAGE_CMD:wic.ufs () {
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
+USING_WIC_UFS = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic.ufs ' + ' '.join('wic.ufs.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
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
index 000000000000..dfd2f3854890
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/mkdisk-ufs.wks
@@ -0,0 +1,5 @@
+bootloader --ptable gpt
+
+part /boot --source rootfs --fstype=vfat --label boot --change-directory boot/
+part /     --source rootfs --fstype=ext4 --label root --exclude-path boot/
+part swap                  --fstype=swap --label swap --size 1M
-- 
2.51.0


