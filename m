Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 51EB460762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 09:18:11 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u3K9Hx0F015911; Wed, 20 Apr 2016 04:17:59 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016042004174124-109437 ;
	Wed, 20 Apr 2016 04:17:41 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 12:17:32 +0300
Message-Id: <1461143852-2263-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.8.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/20/2016 04:17:41 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/20/2016 04:17:41 AM,
	Serialize complete at 04/20/2016 04:17:41 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-20_06:, , signatures=0
Subject: [PATCH] wic: isoimage-isohybrid: add grubefi configfile support
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
X-List-Received-Date: Wed, 20 Apr 2016 09:18:13 -0000

The latest wic kickstart refactoring introduced a bootloader option
"--configfile" which lets wks' specify a custom grub.cfg for use
while booting. This is very useful for creating stuff like boot menus.

This change lets isoimage-isohybrid use --configfile; if this option is
not specified in a wks, it generates a default cfg as before.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 59 ++++++++++++++--------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index bc99283..37d2fc2 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -27,6 +27,7 @@ import glob
 
 from wic import msger
 from wic.pluginbase import SourcePlugin
+from wic.utils.misc import get_custom_config
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 
 class IsoImagePlugin(SourcePlugin):
@@ -94,33 +95,47 @@ class IsoImagePlugin(SourcePlugin):
         """
         Create loader-specific (grub-efi) config
         """
-        splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
-        if os.path.exists(splash):
-            splashline = "menu background splash.jpg"
-        else:
-            splashline = ""
+        configfile = creator.ks.bootloader.configfile
+        custom_cfg = None
+        if configfile:
+            custom_cfg = get_custom_config(configfile)
+            if custom_cfg:
+                # Use a custom configuration for grub
+                grubefi_conf = custom_cfg
+                msger.debug("Using custom configuration file "
+                        "%s for grub.cfg" % configfile)
+            else:
+                msger.error("configfile is specified but failed to "
+                        "get it from %s." % configfile)
 
-        bootloader = creator.ks.bootloader
+        if not custom_cfg:
+            splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
+            if os.path.exists(splash):
+                splashline = "menu background splash.jpg"
+            else:
+                splashline = ""
 
-        grubefi_conf = ""
-        grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
-        grubefi_conf += "--parity=no --stop=1\n"
-        grubefi_conf += "default=boot\n"
-        grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
-        grubefi_conf += "\n"
-        grubefi_conf += "search --set=root --label %s " % part.label
-        grubefi_conf += "\n"
-        grubefi_conf += "menuentry 'boot'{\n"
+            bootloader = creator.ks.bootloader
 
-        kernel = "/bzImage"
+            grubefi_conf = ""
+            grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
+            grubefi_conf += "--parity=no --stop=1\n"
+            grubefi_conf += "default=boot\n"
+            grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
+            grubefi_conf += "\n"
+            grubefi_conf += "search --set=root --label %s " % part.label
+            grubefi_conf += "\n"
+            grubefi_conf += "menuentry 'boot'{\n"
 
-        grubefi_conf += "linux %s rootwait %s\n" \
-            % (kernel, bootloader.append)
-        grubefi_conf += "initrd /initrd \n"
-        grubefi_conf += "}\n"
+            kernel = "/bzImage"
 
-        if splashline:
-            grubefi_conf += "%s\n" % splashline
+            grubefi_conf += "linux %s rootwait %s\n" \
+                            % (kernel, bootloader.append)
+            grubefi_conf += "initrd /initrd \n"
+            grubefi_conf += "}\n"
+
+            if splashline:
+                grubefi_conf += "%s\n" % splashline
 
         msger.debug("Writing grubefi config %s/EFI/BOOT/grub.cfg" \
                         % cr_workdir)
-- 
2.8.0


