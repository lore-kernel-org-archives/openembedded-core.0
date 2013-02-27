Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1UAWdK-0003Qu-5V
	for Openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 03:20:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1R24CFm028288
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 18:04:12 -0800 (PST)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Tue, 26 Feb 2013 18:04:11 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 20:04:06 -0600
Message-ID: <1361930646-10689-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] syslinux.bbclass: Add a default serial console option and real boot menu support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 02:20:42 -0000
Content-Type: text/plain

The previous syslinux menu code did not support using both a serial
and vga console, but this has worked for years in syslinux so there is
no reason not to take advantage of it.  The previous menu looked like:

-------------------------------------------------------
Linux Boot Menu
The following targets are available on this image:

             boot: None
             install: None
-------------------------------------------------------

This commit makes it look something more like a traditional grub menu
on both the serial console and vga console as well as providing the
option to continue on using either the serial or vga console with the
correct kernel arguments.

You can see the screen shots attached to the bugzilla.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3944

[ YOCTO #3944 ]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/syslinux.bbclass |  128 ++++++++++++++++-------------------------
 1 files changed, 49 insertions(+), 79 deletions(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index c4596bf..c6a5a15 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -11,15 +11,17 @@
 # ${LABELS} - a list of targets for the automatic config
 # ${APPEND} - an override list of append strings for each label
 # ${SYSLINUX_OPTS} - additional options to add to the syslinux file ';' delimited
+# ${SYSLINUX_SPLASH} - A background for the vga boot menu if using the boot menu
+# ${SYSLINUX_SERIAL} - Set an alternate serial port or turn off serial with empty string
 
 do_bootimg[depends] += "syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot"
 
 SYSLINUXCFG  = "${S}/syslinux.cfg"
-SYSLINUXMENU = "${S}/menu"
 
 ISOLINUXDIR = "/isolinux"
 SYSLINUXDIR = "/"
+SYSLINUX_SERIAL ?= "0 115200"
 ISO_BOOTIMG = "isolinux/isolinux.bin"
 ISO_BOOTCAT = "isolinux/boot.cat"
 MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
@@ -34,82 +36,34 @@ syslinux_populate() {
 
 	# Install the config files
 	install -m 0644 ${SYSLINUXCFG} ${DEST}${BOOTDIR}/${CFGNAME}
-	if [ -f ${SYSLINUXMENU} ]; then
-		install -m 0644 ${SYSLINUXMENU} ${DEST}${BOOTDIR}
-	fi
 }
 
 syslinux_iso_populate() {
 	syslinux_populate ${ISODIR} ${ISOLINUXDIR} isolinux.cfg
 	install -m 0644 ${STAGING_LIBDIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
+	if [ x${AUTO_SYSLINUXMENU} = x1 ] ; then
+		install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 ${ISODIR}${ISOLINUXDIR}/vesamenu.c32
+		if [ x${SYSLINUX_SPLASH} != x ] ; then
+			install -m 0644 ${SYSLINUX_SPLASH} ${ISODIR}${ISOLINUXDIR}/splash.lss
+		fi
+	fi
 }
 
 syslinux_hddimg_populate() {
 	syslinux_populate ${HDDDIR} ${SYSLINUXDIR} syslinux.cfg
 	install -m 0444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}${SYSLINUXDIR}/ldlinux.sys
+	if [ x${AUTO_SYSLINUXMENU} = x1 ] ; then
+		install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
+		if [ x${SYSLINUX_SPLASH} != x ] ; then
+			install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR}${SYSLINUXDIR}/splash.lss
+		fi
+	fi
 }
 
 syslinux_hddimg_install() {
 	syslinux ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
 }
 
-python build_syslinux_menu () {
-    import copy
-    import sys
-
-    workdir = d.getVar('WORKDIR', True)
-    if not workdir:
-        bb.error("WORKDIR is not defined")
-        return
-        
-    labels = d.getVar('LABELS', True)
-    if not labels:
-        bb.debug(1, "LABELS not defined, nothing to do")
-        return
-    
-    if labels == []:
-        bb.debug(1, "No labels, nothing to do")
-        return
-
-    cfile = d.getVar('SYSLINUXMENU', True)
-    if not cfile:
-        raise bb.build.FuncFailed('Unable to read SYSLINUXMENU')
-
-    try:
-        cfgfile = file(cfile, 'w')
-    except OSError:
-        raise bb.build.funcFailed('Unable to open %s' % (cfile))
-
-    # Beep the speaker and Clear the screen
-    cfgfile.write('\x07\x0C')
-
-    # The title should be configurable
-    cfgfile.write('Linux Boot Menu\n')
-    cfgfile.write('The following targets are available on this image:\n')
-    cfgfile.write('\n')
-
-    for label in labels.split():
-        from copy import deepcopy
-        localdata = deepcopy(d)
-
-        overrides = localdata.getVar('OVERRIDES')
-        if not overrides:
-            raise bb.build.FuncFailed('OVERRIDES not defined')
-        overrides = localdata.expand(overrides)
-    
-        localdata.setVar('OVERRIDES', label + ':' + overrides)
-        bb.data.update_data(localdata)
-
-        usage = localdata.getVar('USAGE', True)
-        cfgfile.write('  \x0F\x30\x3E%16s\x0F\x30\x37: ' % (label))
-        cfgfile.write('%s\n' % (usage))
-
-        del localdata
-
-    cfgfile.write('\n')
-    cfgfile.close()
-}
-
 python build_syslinux_cfg () {
     import copy
     import sys
@@ -146,7 +100,16 @@ python build_syslinux_cfg () {
             cfgfile.write('%s\n' % opt)
 
     cfgfile.write('ALLOWOPTIONS 1\n');
-    cfgfile.write('DEFAULT %s\n' % (labels.split()[0]))
+    syslinux_serial = d.getVar('SYSLINUX_SERIAL', True)
+    if syslinux_serial:
+        cfgfile.write('SERIAL %s\n' % syslinux_serial)
+
+    menu = d.getVar('AUTO_SYSLINUXMENU', True)
+
+    if menu and syslinux_serial:
+        cfgfile.write('DEFAULT Graphics console %s\n' % (labels.split()[0]))
+    else:
+        cfgfile.write('DEFAULT %s\n' % (labels.split()[0]))
 
     timeout = d.getVar('SYSLINUX_TIMEOUT', True)
 
@@ -161,14 +124,13 @@ python build_syslinux_cfg () {
     else:
         cfgfile.write('PROMPT 1\n')
 
-    menu = d.getVar('AUTO_SYSLINUXMENU', True)
-
-    # This is ugly.  My bad.
-
     if menu:
-        bb.build.exec_func('build_syslinux_menu', d)
-        mfile = d.getVar('SYSLINUXMENU', True)
-        cfgfile.write('DISPLAY %s\n' % (mfile.split('/')[-1]) )
+        cfgfile.write('ui vesamenu.c32\n')
+        cfgfile.write('menu title Select kernel options and boot kernel\n')
+        cfgfile.write('menu tabmsg Press [Tab] to edit, [Return] to select\n')
+        splash = d.getVar('SYSLINUX_SPLASH', True)
+        if splash:
+            cfgfile.write('menu background splash.lss\n')
     
     for label in labels.split():
         localdata = bb.data.createCopy(d)
@@ -176,24 +138,32 @@ python build_syslinux_cfg () {
         overrides = localdata.getVar('OVERRIDES', True)
         if not overrides:
             raise bb.build.FuncFailed('OVERRIDES not defined')
-    
+
         localdata.setVar('OVERRIDES', label + ':' + overrides)
         bb.data.update_data(localdata)
     
-        cfgfile.write('LABEL %s\nKERNEL /vmlinuz\n' % (label))
+        btypes = [ [ "", "console=tty0" ] ]
+        if menu and syslinux_serial:
+            btypes = [ [ "Graphics console ", " console=tty0" ],
+                [ "Serial console ",  " console=ttyS0,115200" ] ]
+
+        for btype in btypes:
+            cfgfile.write('LABEL %s%s\nKERNEL /vmlinuz\n' % (btype[0], label))
 
-        append = localdata.getVar('APPEND', True)
-        initrd = localdata.getVar('INITRD', True)
+            append = localdata.getVar('APPEND', True)
+            initrd = localdata.getVar('INITRD', True)
 
-        if append:
-            cfgfile.write('APPEND ')
+            if append:
+                cfgfile.write('APPEND ')
 
-            if initrd:
-                cfgfile.write('initrd=/initrd ')
+                if initrd:
+                    cfgfile.write('initrd=/initrd ')
 
-            cfgfile.write('LABEL=%s '% (label))
+                cfgfile.write('LABEL=%s '% (label))
 
-            cfgfile.write('%s\n' % (append))
+                cfgfile.write('%s %s\n' % (append, btype[1]))
+            else:
+                cfgfile.write('APPEND %s\n' % btype[1])
 
     cfgfile.close()
 }
-- 
1.7.1



