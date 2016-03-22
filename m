Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B82207017D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:48:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2M9mN2n009417
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 02:48:23 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 02:48:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Mar 2016 02:48:20 -0700
Message-ID: <0289a1fa328c5b2929bb169a3bca43bae4e47881.1458640034.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1458640034.git.liezhi.yang@windriver.com>
References: <cover.1458640034.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] grub-efi.bbclass: make it can build vm and live together
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
X-List-Received-Date: Tue, 22 Mar 2016 09:48:25 -0000
Content-Type: text/plain

* Make it can build vm and live (e.g., iso + vmdk) together as we did
  for syslinux.
* GRUBCFG -> GRUB_CFG as other GRUB_FOO vars

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/grub-efi.bbclass |    9 +++++----
 meta/classes/image.bbclass    |    2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 331581d..3d8ff11 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -19,7 +19,8 @@ do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
 do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
 
 GRUB_SERIAL ?= "console=ttyS0,115200"
-GRUBCFG = "${S}/grub.cfg"
+GRUB_CFG_VM = "${S}/grub_vm.cfg"
+GRUB_CFG_LIVE = "${S}/grub_live.cfg"
 GRUB_TIMEOUT ?= "10"
 #FIXME: build this from the machine config
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
@@ -43,7 +44,7 @@ efi_populate() {
 	fi
 	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
 
-	install -m 0644 ${GRUBCFG} ${DEST}${EFIDIR}/grub.cfg
+	install -m 0644 ${GRUB_CFG} ${DEST}${EFIDIR}/grub.cfg
 }
 
 efi_iso_populate() {
@@ -83,9 +84,9 @@ python build_efi_cfg() {
         bb.debug(1, "No labels, nothing to do")
         return
 
-    cfile = d.getVar('GRUBCFG', True)
+    cfile = d.getVar('GRUB_CFG', True)
     if not cfile:
-        raise bb.build.FuncFailed('Unable to read GRUBCFG')
+        raise bb.build.FuncFailed('Unable to read GRUB_CFG')
 
     try:
          cfgfile = file(cfile, 'w')
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 560cc6d..0249f77 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -543,7 +543,7 @@ addtask bundle_initramfs after do_image_complete
 # Some of the vars for vm and live image are conflicted, this function
 # is used for fixing the problem.
 def set_live_vm_vars(d, suffix):
-    vars = ['SYSLINUX_CFG', 'ROOT', 'LABELS', 'INITRD']
+    vars = ['GRUB_CFG', 'SYSLINUX_CFG', 'ROOT', 'LABELS', 'INITRD']
     for var in vars:
         var_with_suffix = var + '_' + suffix
         if d.getVar(var, True):
-- 
1.7.9.5


