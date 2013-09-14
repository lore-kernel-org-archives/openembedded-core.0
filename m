Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC766C75E
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 00:09:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8E09Elo021442
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 17:09:14 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 13 Sep 2013 17:09:13 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 19:09:02 -0500
Message-ID: <1379117343-29877-7-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [v2 PATCH 6/7] grub-efi.bbclass: Add serial and graphics menu options
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
X-List-Received-Date: Sat, 14 Sep 2013 00:09:12 -0000
Content-Type: text/plain

The syslinux.bbclass already has support for automatically generated
serial and graphics menu choices.  This patch adds the same concept to
the grub-efi menu.  That makes it possible to generate a single image
which can boot on a PCBIOS or EFI firmware with consistent looking
boot options.

[YOCTO #4100]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/grub-efi.bbclass |   41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index c21babb..ffbcf4c 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -9,6 +9,7 @@
 # External variables
 # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
+# ${GRUB_GFXSERIAL} - set this to 1 to have graphics and serial in the boot menu
 # ${LABELS} - a list of targets for the automatic config
 # ${APPEND} - an override list of append strings for each label
 # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
@@ -16,6 +17,7 @@
 
 do_bootimg[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
 
+GRUB_SERIAL ?= "console=ttyS0,115200"
 GRUBCFG = "${S}/grub.cfg"
 GRUB_TIMEOUT ?= "10"
 #FIXME: build this from the machine config
@@ -63,6 +65,8 @@ python build_grub_cfg() {
         bb.error("WORKDIR not defined, unable to package")
         return
 
+    gfxserial = d.getVar('GRUB_GFXSERIAL', True) or ""
+
     labels = d.getVar('LABELS', True)
     if not labels:
         bb.debug(1, "LABELS not defined, nothing to do")
@@ -96,6 +100,12 @@ python build_grub_cfg() {
     else:
         cfgfile.write('timeout=50\n')
 
+    if gfxserial == "1":
+        btypes = [ [ " graphics console", "console=tty0" ],
+            [ " serial console", d.getVar('GRUB_SERIAL', True) or "" ] ]
+    else:
+        btypes = [ [ "", "" ] ]
+
     for label in labels.split():
         localdata = d.createCopy()
 
@@ -103,24 +113,27 @@ python build_grub_cfg() {
         if not overrides:
             raise bb.build.FuncFailed('OVERRIDES not defined')
 
-        localdata.setVar('OVERRIDES', label + ':' + overrides)
-        bb.data.update_data(localdata)
+        for btype in btypes:
+            localdata.setVar('OVERRIDES', label + ':' + overrides)
+            bb.data.update_data(localdata)
 
-        cfgfile.write('\nmenuentry \'%s\'{\n' % (label))
-        if label == "install":
-            label = "install-efi"
-        cfgfile.write('linux /vmlinuz LABEL=%s' % (label))
+            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (label, btype[0]))
+            lb = label
+            if label == "install":
+                lb = "install-efi"
+            cfgfile.write('linux /vmlinuz LABEL=%s' % (lb))
 
-        append = localdata.getVar('APPEND', True)
-        initrd = localdata.getVar('INITRD', True)
+            append = localdata.getVar('APPEND', True)
+            initrd = localdata.getVar('INITRD', True)
 
-        if append:
-            cfgfile.write('%s' % (append))
-        cfgfile.write('\n')
+            if append:
+                cfgfile.write('%s' % (append))
+            cfgfile.write(' %s' % btype[1])
+            cfgfile.write('\n')
 
-        if initrd:
-            cfgfile.write('initrd /initrd')
-        cfgfile.write('\n}\n')
+            if initrd:
+                cfgfile.write('initrd /initrd')
+            cfgfile.write('\n}\n')
 
     cfgfile.close()
 }
-- 
1.7.9.5


