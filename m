Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F14373CF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 08:57:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7H8vYki018232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 17 Aug 2016 01:57:35 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 17 Aug 2016 01:57:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 17 Aug 2016 04:57:30 -0400
Message-ID: <37744ba23f946edf7d28dfbd4dc814c4856e10f8.1471424152.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1471424152.git.hongxu.jia@windriver.com>
References: <cover.1471424152.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub: fix load module all_video failed
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
X-List-Received-Date: Wed, 17 Aug 2016 08:57:35 -0000
Content-Type: text/plain

While using oe-core toolchain to strip grub module 'all_video.mod',
it stripped symbol table:
--------------
root@localhost:~# objdump -t all_video.mod

all_video.mod:     file format elf64-x86-64

SYMBOL TABLE:
no symbols
--------------

It caused grub to load module all_video failed.
(This module will be loaded by defalut which configed in grub.cfg)
--------------
grub> insmod all_video
error: no symbol table.
--------------

Tweak strip option to keep symbol .module_license could workaround
the issue.
--------------
root@localhost:~# objdump -t all_video.mod

all_video.mod:     file format elf64-x86-64

SYMBOL TABLE:
0000000000000000 l    d  .text  0000000000000000 .text
0000000000000000 l    d  .data  0000000000000000 .data
0000000000000000 l    d  .module_license        0000000000000000 .module_license
0000000000000000 l    d  .bss   0000000000000000 .bss
0000000000000000 l    d  .moddeps       0000000000000000 .moddeps
0000000000000000 l    d  .modname       0000000000000000 .modname
--------------

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-explicitly-keeps-symbole-.module_license.patch | 61 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch

diff --git a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
new file mode 100644
index 0000000..935c472
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
@@ -0,0 +1,61 @@
+From 7461a3de38b66edbe2f5593f9bdab9f2704d32bc Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Aug 2016 04:06:34 -0400
+Subject: [PATCH] grub module explicitly keeps symbole .module_license
+
+While using oe-core toolchain to strip grub module 'all_video.mod',
+it stripped symbol table:
+--------------
+root@localhost:~# objdump -t all_video.mod
+
+all_video.mod:     file format elf64-x86-64
+
+SYMBOL TABLE:
+no symbols
+--------------
+
+It caused grub to load module all_video failed.
+--------------
+grub> insmod all_video
+error: no symbol table.
+--------------
+
+Tweak strip option to keep symbol .module_license could workaround
+the issue.
+--------------
+root@localhost:~# objdump -t all_video.mod
+
+all_video.mod:     file format elf64-x86-64
+
+SYMBOL TABLE:
+0000000000000000 l    d  .text  0000000000000000 .text
+0000000000000000 l    d  .data  0000000000000000 .data
+0000000000000000 l    d  .module_license        0000000000000000 .module_license
+0000000000000000 l    d  .bss   0000000000000000 .bss
+0000000000000000 l    d  .moddeps       0000000000000000 .moddeps
+0000000000000000 l    d  .modname       0000000000000000 .modname
+--------------
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ grub-core/genmod.sh.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/genmod.sh.in b/grub-core/genmod.sh.in
+index 76df0bb..39a9cfc 100644
+--- a/grub-core/genmod.sh.in
++++ b/grub-core/genmod.sh.in
+@@ -59,7 +59,7 @@ if test x@TARGET_APPLE_CC@ != x1; then
+ 	if test x@platform@ != xemu; then
+ 	    @STRIP@ --strip-unneeded \
+ 		-K grub_mod_init -K grub_mod_fini \
+-		-K _grub_mod_init -K _grub_mod_fini \
++		-K _grub_mod_init -K _grub_mod_fini -K .module_license \
+ 		-R .note.gnu.gold-version -R .note.GNU-stack \
+ 		-R .note -R .comment $tmpfile || exit 1
+ 	fi
+-- 
+2.8.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index d77a0d4..b10f633 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -12,6 +12,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
+           file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://grub-2.00-fpmath-sse-387-fix.patch \
            file://check-if-liblzma-is-disabled.patch \
            file://fix-issue-with-flex-2.5.37.patch \
-- 
2.8.1


