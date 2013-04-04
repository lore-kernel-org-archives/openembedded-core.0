Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNfuq-0007nF-Qm
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 10:53:09 +0200
Received: by mail-da0-f50.google.com with SMTP id t1so1021668dae.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 01:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=xDB3FjipTqDYR5gMm3/XaIuB9V4l63AsBbRTbvmqLSk=;
	b=LNq7PXpsJFxvj5D6uHbCaZDr6ikOgRv19PPM8dNuyam3U0P4bnzasMGvtFfCuBSIBb
	SuDsNt99OJhl7ti7RdNZm+SL/SLWqMISSCHboeQsHvtrLnrm3pOQ/xApt5uJfs0JgEk7
	KsZTGzx5VXmFaS74PNKOi4BW3UDO2gBwXE50lneJywRik2O7gQc1Z46OZk/V+/0S+Np+
	gELTOBtmJPSdXanYVcjzJCVjSlO0V50O5eX8LN0TsFeBhn7xFVYmqYBzlgpvx6zcZJiN
	PvWYkzu9rV7t7sffkL49WYJ6zjS2GeEZGHhkUekbH0SiqyEVDjz0+3RHXeaRpYOgo4ua
	Tr/Q==
X-Received: by 10.66.220.197 with SMTP id py5mr8262186pac.86.1365064502660;
	Thu, 04 Apr 2013 01:35:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fk10sm1169068pac.19.2013.04.04.01.34.59
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 01:35:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 10:35:00 +0200
Message-Id: <1365064501-15679-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH 1/2] qemu: Add 2 patches to fix build with texinfo-5
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
X-List-Received-Date: Thu, 04 Apr 2013 08:53:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...x-texinfo-table-markup-in-qemu-options.hx.patch | 213 +++++++++++++++++++++
 ...x-generating-qemu-doc.html-with-texinfo-5.patch |  54 ++++++
 meta/recipes-devtools/qemu/qemu.inc                |   2 +
 3 files changed, 269 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
 create mode 100644 meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch

diff --git a/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch b/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
new file mode 100644
index 0000000..9435cfe
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
@@ -0,0 +1,213 @@
+From 9a7146ca91c04d05af36684d8b3ca79c1254abc2 Mon Sep 17 00:00:00 2001
+From: Markus Armbruster <armbru@redhat.com>
+Date: Wed, 13 Feb 2013 19:49:40 +0100
+Subject: [PATCH 1/2] doc: Fix texinfo @table markup in qemu-options.hx
+
+End tables before headings, start new ones afterwards.  Fixes
+incorrect indentation of headings "File system options" and "Virtual
+File system pass-through options" in manual page and qemu-doc.
+
+Normalize markup some to increase chances it survives future edits.
+
+Upstream-Status: Backport
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Markus Armbruster <armbru@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-id: 1360781383-28635-5-git-send-email-armbru@redhat.com
+Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
+---
+ qemu-options.hx | 56 +++++++++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 37 insertions(+), 19 deletions(-)
+
+diff --git a/qemu-options.hx b/qemu-options.hx
+index 9d7131a..54bd92a 100644
+--- a/qemu-options.hx
++++ b/qemu-options.hx
+@@ -537,13 +537,15 @@ STEXI
+ @end table
+ ETEXI
+ 
+-DEF("usb", 0, QEMU_OPTION_usb,
+-    "-usb            enable the USB driver (will be the default soon)\n",
+-    QEMU_ARCH_ALL)
+ STEXI
+ USB options:
+ @table @option
++ETEXI
+ 
++DEF("usb", 0, QEMU_OPTION_usb,
++    "-usb            enable the USB driver (will be the default soon)\n",
++    QEMU_ARCH_ALL)
++STEXI
+ @item -usb
+ @findex -usb
+ Enable the USB driver (will be the default soon)
+@@ -610,9 +612,15 @@ possible drivers and properties, use @code{-device help} and
+ @code{-device @var{driver},help}.
+ ETEXI
+ 
++STEXI
++@end table
++ETEXI
+ DEFHEADING()
+ 
+ DEFHEADING(File system options:)
++STEXI
++@table @option
++ETEXI
+ 
+ DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,
+     "-fsdev fsdriver,id=id[,path=path,][security_model={mapped-xattr|mapped-file|passthrough|none}]\n"
+@@ -676,9 +684,15 @@ Specifies the tag name to be used by the guest to mount this export point
+ 
+ ETEXI
+ 
++STEXI
++@end table
++ETEXI
+ DEFHEADING()
+ 
+ DEFHEADING(Virtual File system pass-through options:)
++STEXI
++@table @option
++ETEXI
+ 
+ DEF("virtfs", HAS_ARG, QEMU_OPTION_virtfs,
+     "-virtfs local,path=path,mount_tag=tag,security_model=[mapped-xattr|mapped-file|passthrough|none]\n"
+@@ -769,11 +783,9 @@ ETEXI
+ STEXI
+ @end table
+ ETEXI
+-
+ DEFHEADING()
+ 
+ DEFHEADING(Display options:)
+-
+ STEXI
+ @table @option
+ ETEXI
+@@ -1215,7 +1227,6 @@ ETEXI
+ STEXI
+ @end table
+ ETEXI
+-
+ ARCHHEADING(, QEMU_ARCH_I386)
+ 
+ ARCHHEADING(i386 target only:, QEMU_ARCH_I386)
+@@ -1301,10 +1312,10 @@ Specify SMBIOS type 0 fields
+ Specify SMBIOS type 1 fields
+ ETEXI
+ 
+-DEFHEADING()
+ STEXI
+ @end table
+ ETEXI
++DEFHEADING()
+ 
+ DEFHEADING(Network options:)
+ STEXI
+@@ -1718,13 +1729,19 @@ libpcap, so it can be analyzed with tools such as tcpdump or Wireshark.
+ Indicate that no network devices should be configured. It is used to
+ override the default configuration (@option{-net nic -net user}) which
+ is activated if no @option{-net} options are provided.
++ETEXI
+ 
++STEXI
+ @end table
+ ETEXI
+-
+ DEFHEADING()
+ 
+ DEFHEADING(Character device options:)
++STEXI
++
++The general form of a character device option is:
++@table @option
++ETEXI
+ 
+ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
+     "-chardev null,id=id[,mux=on|off]\n"
+@@ -1766,10 +1783,6 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
+ )
+ 
+ STEXI
+-
+-The general form of a character device option is:
+-@table @option
+-
+ @item -chardev @var{backend} ,id=@var{id} [,mux=on|off] [,@var{options}]
+ @findex -chardev
+ Backend is one of:
+@@ -1990,14 +2003,15 @@ Connect to a spice virtual machine channel, such as vdiport.
+ 
+ Connect to a spice port, allowing a Spice client to handle the traffic
+ identified by a name (preferably a fqdn).
++ETEXI
+ 
++STEXI
+ @end table
+ ETEXI
+-
+ DEFHEADING()
+ 
+-STEXI
+ DEFHEADING(Device URL Syntax:)
++STEXI
+ 
+ In addition to using normal file images for the emulated storage devices,
+ QEMU can also use networked resources such as iSCSI devices. These are
+@@ -2113,10 +2127,16 @@ qemu-system-x86_84 --drive file=gluster://192.0.2.1/testvol/a.img
+ @end example
+ 
+ See also @url{http://www.gluster.org}.
++ETEXI
++
++STEXI
+ @end table
+ ETEXI
+ 
+ DEFHEADING(Bluetooth(R) options:)
++STEXI
++@table @option
++ETEXI
+ 
+ DEF("bt", HAS_ARG, QEMU_OPTION_bt, \
+     "-bt hci,null    dumb bluetooth HCI - doesn't respond to commands\n" \
+@@ -2130,8 +2150,6 @@ DEF("bt", HAS_ARG, QEMU_OPTION_bt, \
+     "                emulate a bluetooth device 'dev' in scatternet 'n'\n",
+     QEMU_ARCH_ALL)
+ STEXI
+-@table @option
+-
+ @item -bt hci[...]
+ @findex -bt
+ Defines the function of the corresponding Bluetooth HCI.  -bt options
+@@ -2183,9 +2201,11 @@ currently:
+ @item keyboard
+ Virtual wireless keyboard implementing the HIDP bluetooth profile.
+ @end table
+-@end table
+ ETEXI
+ 
++STEXI
++@end table
++ETEXI
+ DEFHEADING()
+ 
+ DEFHEADING(Linux/Multiboot boot specific:)
+@@ -2242,11 +2262,9 @@ ETEXI
+ STEXI
+ @end table
+ ETEXI
+-
+ DEFHEADING()
+ 
+ DEFHEADING(Debug/Expert options:)
+-
+ STEXI
+ @table @option
+ ETEXI
+-- 
+1.8.1.5
+
diff --git a/meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch b/meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
new file mode 100644
index 0000000..cabbf0e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
@@ -0,0 +1,54 @@
+From f983d4978e1c49ee936ad52bf2de0c531420f5f8 Mon Sep 17 00:00:00 2001
+From: Cole Robinson <crobinso@redhat.com>
+Date: Wed, 20 Feb 2013 07:20:31 +0000
+Subject: [PATCH 2/2] docs: Fix generating qemu-doc.html with texinfo 5
+
+LC_ALL=C makeinfo --no-headers --no-split --number-sections --html qemu-doc.texi -o qemu-doc.html
+./qemu-options.texi:1521: unknown command `list'
+./qemu-options.texi:1521: table requires an argument: the formatter for @item
+./qemu-options.texi:1521: warning: @table has text but no @item
+
+Upstream-Status: Pending
+http://patchwork.ozlabs.org/patch/222131/
+
+CC: qemu-stable@nongnu.org
+Signed-off-by: Cole Robinson <crobinso@redhat.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Reviewed-by: Markus Armbruster <armbru@redhat.com>
+---
+ qemu-options.hx | 19 +++++++------------
+ 1 file changed, 7 insertions(+), 12 deletions(-)
+
+diff --git a/qemu-options.hx b/qemu-options.hx
+index 54bd92a..5d2d9b8 100644
+--- a/qemu-options.hx
++++ b/qemu-options.hx
+@@ -2089,18 +2089,13 @@ QEMU supports using either local sheepdog devices or remote networked
+ devices.
+ 
+ Syntax for specifying a sheepdog device
+-@table @list
+-``sheepdog:<vdiname>''
+-
+-``sheepdog:<vdiname>:<snapid>''
+-
+-``sheepdog:<vdiname>:<tag>''
+-
+-``sheepdog:<host>:<port>:<vdiname>''
+-
+-``sheepdog:<host>:<port>:<vdiname>:<snapid>''
+-
+-``sheepdog:<host>:<port>:<vdiname>:<tag>''
++@table @code
++@item sheepdog:<vdiname>
++@item sheepdog:<vdiname>:<snapid>
++@item sheepdog:<vdiname>:<tag>
++@item sheepdog:<host>:<port>:<vdiname>
++@item sheepdog:<host>:<port>:<vdiname>:<snapid>
++@item sheepdog:<host>:<port>:<vdiname>:<tag>
+ @end table
+ 
+ Example
+-- 
+1.8.1.5
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1b5b569..9a55707 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,6 +26,8 @@ SRC_URI = "\
     file://larger_default_ram_size.patch \
     file://arm-bgr.patch \
     file://Revert-vmware_vga-Add-back-some-info-in-local-state-.patch \
+    file://0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch \
+    file://0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch \
     "
 
 SRC_URI_append_class-nativesdk = "\
-- 
1.8.1.5



