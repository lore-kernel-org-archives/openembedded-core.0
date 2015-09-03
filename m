Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0B07701F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 18:42:23 +0000 (UTC)
Received: by igbut12 with SMTP id ut12so47499112igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HDkQUYX/W5n+vdzflyeuqSOvdSnT/3e6KK88FWeZy4o=;
	b=V3NZITjEmbGEeQnEgZELgd8mRMpla70LBKjeeITvcOu1bqkH1I1cYQkNsADg6lz4Nj
	nYTn2e6BCvR/myeDjuOvYBf010lnEfYD9bLgWyrS7vPknSgOoPEwYYPxjO0J+UtigyjQ
	Y86v3kq74fzwxcLZMULbM+9Vo80iu/+nYSMHKw8g4wAsr2aABkR+eso69lIuoCg8Afsh
	76ro0PjHr/DI1VIAX7JchzFdWPH2AOA/o/A/7cSU/xTLflnYhtkHjHOg9cYy24y5HHpC
	6xALcEsy/ZHuxXIWpcFlxjYgRvq7+60H1N/432KssfGMOPrTYYaN+mzBcEEVd5U9P2ei
	fCow==
X-Gm-Message-State: ALoCoQkw8nQGJWpGHlsy1pPooPgdNtIe9uuwipQ9k0YtFNBlpagrBTb3p4Dqmi6eIUw0yCc1MI3o
X-Received: by 10.50.138.69 with SMTP id qo5mr6928313igb.33.1441305743246;
	Thu, 03 Sep 2015 11:42:23 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5686C.dip0.t-ipconnect.de.
	[87.165.104.108])
	by smtp.gmail.com with ESMTPSA id cr1sm166136igb.15.2015.09.03.11.42.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Sep 2015 11:42:22 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 20:42:32 +0200
Message-Id: <b664a0bd89adb278777fa7384a6f1355a75cd3ea.1441305437.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
References: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441305437.git.patrick.ohly@intel.com>
References: <cover.1441305437.git.patrick.ohly@intel.com>
Subject: [PATCH 7/8] boot loader: support root=UUID
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
X-List-Received-Date: Thu, 03 Sep 2015 18:42:23 -0000

As mentioned when introducing the VM images
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=7374), the
resulting images only work when the image is mounted as a disk that
results in the hard-coded path (/dev/sda in the current
default). Using the file system UUID to find the rootfs is more
flexible.

To enable this for boot-direct.bbclass and thus image-vm.bbclass (aka
FSTYPEs vdi/vmdk/qcow2), set SYSLINUX_ROOT =
"root=UUID=<<uuid-of-rootfs>>". The rootfs image must use an ext file
system.

The special string will get replaced in the APPEND line with the
actual UUID when the boot loader (grub-efi, syslinux or gummiboot)
writes the boot loader configuration files. At that time, the rootfs
image has already been created and its UUID can be extracted using
"tune2fs -l", which also should be available because the
e2fsprogs-native tools were needed to create the image in the first
place.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/fs-uuid.bbclass   | 24 ++++++++++++++++++++++++
 meta/classes/grub-efi.bbclass  |  4 ++++
 meta/classes/gummiboot.bbclass |  4 ++++
 meta/classes/syslinux.bbclass  |  5 ++++-
 4 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/fs-uuid.bbclass

diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
new file mode 100644
index 0000000..bd2613c
--- /dev/null
+++ b/meta/classes/fs-uuid.bbclass
@@ -0,0 +1,24 @@
+# Extract UUID from ${ROOTFS}, which must have been built
+# by the time that this function gets called. Only works
+# on ext file systems and depends on tune2fs.
+def get_rootfs_uuid(d):
+    import subprocess
+    rootfs = d.getVar('ROOTFS', True)
+    output = subprocess.check_output(['tune2fs', '-l', rootfs])
+    for line in output.split('\n'):
+        if line.startswith('Filesystem UUID:'):
+            uuid = line.split()[-1]
+            bb.note('UUID of %s: %s' % (rootfs, uuid))
+            return uuid
+    bb.fatal('Could not determine filesystem UUID of %s' % rootfs)
+
+# Replace the special <<uuid-of-rootfs>> inside a string (like the
+# root= APPEND string in a syslinux.cfg or gummiboot entry) with the
+# actual UUID of the rootfs. Does nothing if the special string
+# is not used.
+def replace_rootfs_uuid(d, string):
+    UUID_PLACEHOLDER = '<<uuid-of-rootfs>>'
+    if UUID_PLACEHOLDER in string:
+        uuid = get_rootfs_uuid(d)
+        string = string.replace(UUID_PLACEHOLDER, uuid)
+    return string
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 6d58d48..4ddc2bb 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -26,6 +26,9 @@ GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
 
 EFIDIR = "/EFI/BOOT"
 
+# Need UUID utility code.
+inherit fs-uuid
+
 efi_populate() {
 	# DEST must be the root of the image so that EFIDIR is not
 	# nested under a top level directory.
@@ -129,6 +132,7 @@ python build_efi_cfg() {
             initrd = localdata.getVar('INITRD', True)
 
             if append:
+                append = replace_rootfs_uuid(d, append)
                 cfgfile.write('%s' % (append))
             cfgfile.write(' %s' % btype[1])
             cfgfile.write('\n')
diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbclass
index dae1977..3d9c08b 100644
--- a/meta/classes/gummiboot.bbclass
+++ b/meta/classes/gummiboot.bbclass
@@ -15,6 +15,9 @@ GUMMIBOOT_CFG ?= "${S}/loader.conf"
 GUMMIBOOT_ENTRIES ?= ""
 GUMMIBOOT_TIMEOUT ?= "10"
 
+# Need UUID utility code.
+inherit fs-uuid
+
 efi_populate() {
         DEST=$1
 
@@ -108,6 +111,7 @@ python build_efi_cfg() {
             lb = "install-efi"
         entrycfg.write('options LABEL=%s ' % lb)
         if append:
+            append = replace_rootfs_uuid(d, append)
             entrycfg.write('%s' % append)
         entrycfg.write('\n')
         entrycfg.close()
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index d6498d9..44ef9a9 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -34,6 +34,9 @@ ISO_BOOTCAT = "isolinux/boot.cat"
 MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
 APPEND_prepend = " ${SYSLINUX_ROOT} "
 
+# Need UUID utility code.
+inherit fs-uuid
+
 syslinux_populate() {
 	DEST=$1
 	BOOTDIR=$2
@@ -177,7 +180,7 @@ python build_syslinux_cfg () {
                     cfgfile.write('initrd=/initrd ')
 
                 cfgfile.write('LABEL=%s '% (label))
-
+                append = replace_rootfs_uuid(d, append)
                 cfgfile.write('%s %s\n' % (append, btype[1]))
             else:
                 cfgfile.write('APPEND %s\n' % btype[1])
-- 
2.1.4


