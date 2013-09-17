Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C691B6C8C3
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 13:32:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8HDWVq8006701
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2013 06:32:31 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 17 Sep 2013 06:32:31 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 17 Sep 2013 08:32:16 -0500
Message-ID: <1379424738-16798-8-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
References: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [v3 PATCH 7/9] syslinux.bbclass: Fix hard coding of console=tty*
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
X-List-Received-Date: Tue, 17 Sep 2013 13:32:30 -0000
Content-Type: text/plain

The SYSLINUX_SERIAL variable was hard coded and occasionally needs to
be different for the kernel argument vs the syslinux argument.

In the auto-generated boot mode console=tty0 was hard coded, and this
is not needed at all, and causes problems in some cases if a end user
wanted to change the console=... via the kernel boot argument APPEND
mechanism.  The default can be forced with SYSLINUX_DEFAULT_CONSOLE
for systems that need a special specification to enable the frame
buffer instead of a serial port.

[YOCTO #3944]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/syslinux.bbclass |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 223e4dc..91b9731 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -12,7 +12,9 @@
 # ${APPEND} - an override list of append strings for each label
 # ${SYSLINUX_OPTS} - additional options to add to the syslinux file ';' delimited
 # ${SYSLINUX_SPLASH} - A background for the vga boot menu if using the boot menu
+# ${SYSLINUX_DEFAULT_CONSOLE} - set to "console=ttyX" to change kernel boot default console
 # ${SYSLINUX_SERIAL} - Set an alternate serial port or turn off serial with empty string
+# ${SYSLINUX_SERIAL_TTY} - Set alternate console=tty... kernel boot argument
 
 do_bootimg[depends] += "syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot"
@@ -21,7 +23,11 @@ SYSLINUXCFG  = "${S}/syslinux.cfg"
 
 ISOLINUXDIR = "/isolinux"
 SYSLINUXDIR = "/"
+# The kernel has an internal default console, which you can override with
+# a console=...some_tty...
+SYSLINUX_DEFAULT_CONSOLE ?= ""
 SYSLINUX_SERIAL ?= "0 115200"
+SYSLINUX_SERIAL_TTY ?= "ttyS0,115200"
 ISO_BOOTIMG = "isolinux/isolinux.bin"
 ISO_BOOTCAT = "isolinux/boot.cat"
 MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
@@ -102,6 +108,8 @@ python build_syslinux_cfg () {
             cfgfile.write('%s\n' % opt)
 
     cfgfile.write('ALLOWOPTIONS 1\n');
+    syslinux_default_console = d.getVar('SYSLINUX_DEFAULT_CONSOLE', True)
+    syslinux_serial_tty = d.getVar('SYSLINUX_SERIAL_TTY', True)
     syslinux_serial = d.getVar('SYSLINUX_SERIAL', True)
     if syslinux_serial:
         cfgfile.write('SERIAL %s\n' % syslinux_serial)
@@ -144,10 +152,10 @@ python build_syslinux_cfg () {
         localdata.setVar('OVERRIDES', label + ':' + overrides)
         bb.data.update_data(localdata)
     
-        btypes = [ [ "", "console=tty0" ] ]
+        btypes = [ [ "", syslinux_default_console ] ]
         if menu and syslinux_serial:
-            btypes = [ [ "Graphics console ", " console=tty0" ],
-                [ "Serial console ",  " console=ttyS0,115200" ] ]
+            btypes = [ [ "Graphics console ", syslinux_default_console  ],
+                [ "Serial console ", syslinux_serial_tty ] ]
 
         for btype in btypes:
             cfgfile.write('LABEL %s%s\nKERNEL /vmlinuz\n' % (btype[0], label))
-- 
1.7.9.5


