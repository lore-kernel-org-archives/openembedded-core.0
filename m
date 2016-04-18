Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD1DA60745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 12:46:52 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u3ICkrLh004319 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 07:46:53 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016041807463748-21744 ;
	Mon, 18 Apr 2016 07:46:37 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2016 15:46:22 +0300
Message-Id: <1460983582-15284-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.8.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/18/2016 07:46:37 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/18/2016 07:46:37 AM,
	Serialize complete at 04/18/2016 07:46:37 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-18_06:, , signatures=0
Subject: [PATCH] wic: isoimage-isohybrid: implement grubefi menu logic
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
X-List-Received-Date: Mon, 18 Apr 2016 12:46:55 -0000

Right now isoimage-isohybrid creates a single boot menu entry "boot"
and passes it the arguments supplied with "--append". There is logic
for creating custom grub menus, but it is sadly not used. "boot" is
hardcoded.

This change makes isoimage use the wic bootloader "--menu" argument to
create its menus. The syntax used for menu specification was chosen so
it does not conflict with the kernel parameter syntax (you can pass
custom kernel arguments from the generated grub menu entries, like for
example silent booting, thread affinity etc.).

The "--menu" argument syntax is as following. The argument supplies a
collection of menu entry names and kernel parameters. Menu name entries
can contain any ASCII character except | or : which are separators.
Kernel parameters obey the syntax defined by the kernel documentation.
| is the menu separator and : is the separator between the menu names
and parameters.

Example for use in wks files:
  --menu "Menu Name:firstarg,secondard|Menu Name 2:anotherarg,otherarg"

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 35 ++++++++++++++++------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index bc99283..4b0b035 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -101,23 +101,40 @@ class IsoImagePlugin(SourcePlugin):
             splashline = ""
 
         bootloader = creator.ks.bootloader
+        kernel = "/bzImage"
+        default_options = bootloader.append
+        default_menu_to_boot = "Default boot"
+        grub_menus = ""
+
+        # menu separators are '|', custom boot args separated by ':', ex.
+        # --menu "Menu Name:firstarg,secondard|Menu Name 2:anotherarg,otherarg"
+        for menu in bootloader.menus.split('|'):
+            menu_list = menu.split(":")
+            menu_name = menu_list[0]
+            grub_menu_options = ""
+
+            if (len(menu_list) > 1):
+                menu_params = menu_list[1]
+                for param in menu_params.split(','):
+                    if param.lower() == "default":
+                        default_menu_to_boot = menu_name
+                    else: grub_menu_options += " " + param
+
+            grub_menus += "menuentry '%s' {\n" % menu_name
+            grub_menus += "linux %s rootwait %s %s\n" % \
+                (kernel, default_options, grub_menu_options)
+            grub_menus += "initrd /initrd \n"
+            grub_menus += "}\n"
 
         grubefi_conf = ""
         grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
         grubefi_conf += "--parity=no --stop=1\n"
-        grubefi_conf += "default=boot\n"
+        grubefi_conf += "default=%s\n" % default_menu_to_boot
         grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
         grubefi_conf += "\n"
         grubefi_conf += "search --set=root --label %s " % part.label
         grubefi_conf += "\n"
-        grubefi_conf += "menuentry 'boot'{\n"
-
-        kernel = "/bzImage"
-
-        grubefi_conf += "linux %s rootwait %s\n" \
-            % (kernel, bootloader.append)
-        grubefi_conf += "initrd /initrd \n"
-        grubefi_conf += "}\n"
+        grubefi_conf += grub_menus
 
         if splashline:
             grubefi_conf += "%s\n" % splashline
-- 
2.8.0


