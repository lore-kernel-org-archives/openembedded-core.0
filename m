Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3B54B6B25F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 22:39:37 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1WVqIN-00029Z-3O from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Apr 2014 15:39:39 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 3 Apr 2014 15:39:38 -0700
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com ([134.86.97.83]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 3 Apr 2014 15:39:38 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Apr 2014 18:39:32 -0400
Message-Id: <1396564772-783-2-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1396564772-783-1-git-send-email-drew_moseley@mentor.com>
References: <1396564772-783-1-git-send-email-drew_moseley@mentor.com>
X-OriginalArrivalTime: 03 Apr 2014 22:39:38.0988 (UTC)
	FILETIME=[98D172C0:01CF4F8D]
Subject: [PATCH 2/2] busybox: Specify '-nostdlib' when linking to a .o file.
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
X-List-Received-Date: Thu, 03 Apr 2014 22:39:42 -0000

Ensure that linking to the built-in.a file uses the 'nostlib'
option.  Submitted to busybox mailing list here:

    http://lists.busybox.net/pipermail/busybox/2014-March/080730.html

This has been accepted into upstream busybox so it will not be needed
for future versions.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 ...m-Specify-nostldlib-when-linking-to-.o-fi.patch |   40 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.22.1.bb        |    1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch b/meta/recipes-core/busybox/busybox/0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch
new file mode 100644
index 0000000..3da38bb
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch
@@ -0,0 +1,40 @@
+From 28389e59701c2408e87e886c358f8e1766c677f7 Mon Sep 17 00:00:00 2001
+From: Drew Moseley <drew_moseley@mentor.com>
+Date: Sat, 29 Mar 2014 11:13:16 -0400
+Subject: [PATCH] build system: Specify '-nostldlib' when linking to .o files.
+
+For certain cross build scenarios the LD variable is overridden
+to use the gcc executive to ensure all the target tuning parameters
+are used.  In these cases, the executive errors out as shown below
+but since this step is only linking to a .o file the standard libs
+are not needed.
+
+    $ make LD=gcc applets/built-in.o
+      LD      applets/built-in.o
+    /usr/bin/ld: cannot find -lgcc_s
+    /usr/bin/ld: cannot find -lgcc_s
+    collect2: ld returned 1 exit status
+    make[1]: *** [applets/built-in.o] Error 1
+    make: *** [applets_dir] Error 2
+
+Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
+---
+ scripts/Makefile.build |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/Makefile.build b/scripts/Makefile.build
+index 5685b5b..eba69f6 100644
+--- a/scripts/Makefile.build
++++ b/scripts/Makefile.build
+@@ -256,7 +256,7 @@ ifdef builtin-target
+ quiet_cmd_link_o_target = LD      $@
+ # If the list of objects to link is empty, just create an empty built-in.o
+ cmd_link_o_target = $(if $(strip $(obj-y)),\
+-		$(LD) $(ld_flags) -r -o $@ $(filter $(obj-y), $^),\
++		$(LD) -nostdlib $(ld_flags) -r -o $@ $(filter $(obj-y), $^),\
+ 		rm -f $@; $(AR) rcs $@)
+ 
+ $(builtin-target): $(obj-y) FORCE
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index ffc9435..782752c 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://inetd.conf \
            file://inetd \
            file://login-utilities.cfg \
+           file://0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch \
 "
 
 SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
-- 
1.7.9.5


