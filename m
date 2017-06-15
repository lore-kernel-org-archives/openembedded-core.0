Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6F15678392
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 09:45:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 15 Jun 2017 02:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="1160782382"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2017 02:45:48 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D3F3B5803BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 02:45:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 12:44:03 +0300
Message-Id: <91cd467286296d9dfa61658553dae6bc8fd8d0bc.1497519337.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497519337.git.ed.bartosh@linux.intel.com>
References: <cover.1497519337.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v5 4/6] grub-efi: fixed default value of GRUB_ROOT
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
X-List-Received-Date: Thu, 15 Jun 2017 09:45:48 -0000

Currently GRUB_ROOT assigned a value of literal "${ROOT}" by default
if ROOT variable is not set. This causes kernel commandline to
look like this: "linux /vmlinuz LABEL=boot {ROOT}"

Used weak assignments of ROOT and GRUB_ROOT variables to make
sure GRUB_ROOT is "" by default.

Allowed empty GRUB_ROOT to be able to use only APPEND variable
for both EFI bootloaders (systemd-boot and grub-efi).

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/grub-efi.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index bacbeb4..b55ac96 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -27,7 +27,8 @@ GRUB_TIMEOUT ?= "10"
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
 
 EFIDIR = "/EFI/BOOT"
-GRUB_ROOT ?= "${ROOT}"
+ROOT ??= ""
+GRUB_ROOT ??= "${ROOT}"
 APPEND ?= ""
 
 # Need UUID utility code.
@@ -121,8 +122,6 @@ python build_efi_cfg() {
         cfgfile.write('timeout=50\n')
 
     root = d.getVar('GRUB_ROOT')
-    if not root:
-        bb.fatal('GRUB_ROOT not defined')
 
     if gfxserial == "1":
         btypes = [ [ " graphics console", "" ],
@@ -146,7 +145,8 @@ python build_efi_cfg() {
                 lb = "install-efi"
             cfgfile.write('linux /vmlinuz LABEL=%s' % (lb))
 
-            cfgfile.write(' %s' % replace_rootfs_uuid(d, root))
+            if root:
+                cfgfile.write(' %s' % replace_rootfs_uuid(d, root))
 
             append = localdata.getVar('APPEND')
             initrd = localdata.getVar('INITRD')
-- 
2.1.4


