Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF51F6B8BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:11:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2R8BUxr016880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 01:11:30 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 01:11:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Mar 2014 04:11:23 -0400
Message-ID: <8acc674de6bd8eda29c0ff56773030698490aafa.1395906476.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1395906475.git.liezhi.yang@windriver.com>
References: <cover.1395906475.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] gummiboot: use objcopy from the env
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
X-List-Received-Date: Thu, 27 Mar 2014 08:11:32 -0000
Content-Type: text/plain

Fix the error:
[snip]
| nm -D -u src/efi/gummiboot.so | grep ' U ' && exit 1 || :
| objcopy -j .text -j .sdata -j .data -j .dynamic \
|   -j .dynsym -j .rel -j .rela -j .reloc -j .eh_frame \
|   --target=efi-app-x86_64 src/efi/gummiboot.so gummibootx64.efi
| objcopy: src/efi/gummiboot.so: Invalid bfd target
| make[1]: *** [gummibootx64.efi] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make: *** [all] Error 2
[snip]

It uses the "objcopy" directly, which is not suitable for cross compile.

[YOCTO #6054]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gummiboot/gummiboot/fix-objcopy.patch          |   39 ++++++++++++++++++++
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |    4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch

diff --git a/meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch b/meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
new file mode 100644
index 0000000..2683f83
--- /dev/null
+++ b/meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
@@ -0,0 +1,39 @@
+From 0f7f9e3bb1d0e1b93f3ad8a1d5d7bdd3fbf27494 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 27 Mar 2014 07:20:33 +0000
+Subject: [PATCH] Makefile.am: use objcopy from the env
+
+It uses the "objcopy" directly, which is not suitable for cross compile.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.am | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d224418..dcd95b0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -19,6 +19,8 @@
+ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
+ AM_MAKEFLAGS = --no-print-directory
+ 
++OBJCOPY ?= objcopy
++
+ gummibootlibdir = $(prefix)/lib/gummiboot
+ 
+ AM_CPPFLAGS = -include config.h
+@@ -143,7 +145,7 @@ $(efi_solib): $(efi_objects)
+ .DELETE_ON_ERROR: $(efi_solib)
+ 
+ $(efi_loadername): $(efi_solib)
+-	$(AM_V_GEN) objcopy -j .text -j .sdata -j .data -j .dynamic \
++	$(AM_V_GEN) $(OBJCOPY) -j .text -j .sdata -j .data -j .dynamic \
+ 	  -j .dynsym -j .rel -j .rela -j .reloc -j .eh_frame \
+ 	  --target=efi-app-$(ARCH) $< $@
+ 
+-- 
+1.8.3.4
+
diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
index 61de58c..b0435f5 100644
--- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -11,7 +11,9 @@ inherit deploy
 
 PV = "43+git${SRCPV}"
 SRCREV = "4062c51075ba054d4949c714fe06123f9ad3097d"
-SRC_URI = "git://anongit.freedesktop.org/gummiboot"
+SRC_URI = "git://anongit.freedesktop.org/gummiboot \
+           file://fix-objcopy.patch \
+          "
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
 
-- 
1.7.10.4


