Return-Path: <california.l.sullivan@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA2477FA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 00:47:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 17:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="107163934"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 11 Jul 2017 17:47:31 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 17:47:29 -0700
Message-Id: <20170712004729.29999-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.4
Cc: saul.wold@intel.com
Subject: [PATCH] gnu-efi: Upgrade package to 3.0.6 and refresh patches
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
X-List-Received-Date: Wed, 12 Jul 2017 00:47:31 -0000

Version 3.0.6 fixes a failure when using the pxe headers and allows us
to drop the explicit fall through patch as it was fixed upstream.

Other patches were rebased on top of the new version.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 ...plicit-fall-through-so-Wextra-will-work-i.patch | 34 --------------
 .../gnu-efi/gnu-efi/gcc46-compatibility.patch      | 24 ++++++++--
 .../gnu-efi/gnu-efi/parallel-make-archives.patch   | 54 ++++++++++++----------
 .../gnu-efi/{gnu-efi_3.0.5.bb => gnu-efi_3.0.6.bb} |  5 +-
 4 files changed, 51 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.5.bb => gnu-efi_3.0.6.bb} (92%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch
deleted file mode 100644
index d0aeb2d..0000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 676a8a9001f06808b4dbe0a545d76b5d9a8ebf48 Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Thu, 2 Feb 2017 13:51:27 -0500
-Subject: [PATCH] Mark our explicit fall through so -Wextra will work in gcc 7
-
-gcc 7 introduces detection of fall-through behavior in switch/case
-statements, and will warn if -Wimplicit-fallthrough is present and there
-is no comment stating that the fall-through is intentional.  This is
-also triggered by -Wextra, as it enables -Wimplicit-fallthrough=1.
-
-This patch adds the comment in the one place we use fall-through.
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
----
-Upstream-Status: Pending
-
- lib/print.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/print.c b/lib/print.c
-index b8a9d38..cb732f0 100644
---- a/lib/print.c
-+++ b/lib/print.c
-@@ -1131,6 +1131,7 @@ Returns:
-             case 'X':
-                 Item.Width = Item.Long ? 16 : 8;
-                 Item.Pad = '0';
-+		/* falls through */
-             case 'x':
-                 ValueToHex (
-                     Item.Scratch,
--- 
-2.12.2
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
index 0ce6d7b..69efd34 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
@@ -1,3 +1,8 @@
+From 8d16ae374c5d4d9fac45c002605a66cfb8c08be5 Mon Sep 17 00:00:00 2001
+From: Steve Langasek <steve.langasek@ubuntu.com>
+Date: Wed, 9 Sep 2015 08:26:06 +0000
+Subject: [PATCH 3/3] gnu-efi, syslinux: Support gcc < 4.7
+
 don't break with old compilers and -DGNU_EFI_USE_MS_ABI
 It's entirely legitimate to request GNU_EFI_USE_MS_ABI even if the current
 compiler doesn't support it, and gnu-efi should transparently fall back to
@@ -6,16 +11,25 @@ checking, but at least it will still compile.
 
 Author: Steve Langasek <steve.langasek@ubuntu.com>
 Upstream-Status: Pending
-Index: gnu-efi-3.0.3/inc/x86_64/efibind.h
-===================================================================
---- gnu-efi-3.0.3.orig/inc/x86_64/efibind.h
-+++ gnu-efi-3.0.3/inc/x86_64/efibind.h
+[Rebased for 3.0.6]
+Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
+---
+ inc/x86_64/efibind.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/inc/x86_64/efibind.h b/inc/x86_64/efibind.h
+index 4309f9f..02c0af1 100644
+--- a/inc/x86_64/efibind.h
++++ b/inc/x86_64/efibind.h
 @@ -25,8 +25,6 @@ Revision History
  #if defined(GNU_EFI_USE_MS_ABI)
-     #if defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7))
+     #if (defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7)))||(defined(__clang__) && (__clang_major__ > 3 || (__clang_major__ == 3 && __clang_minor__ >= 2)))
          #define HAVE_USE_MS_ABI 1
 -    #else
 -        #error Compiler is too old for GNU_EFI_USE_MS_ABI
      #endif
  #endif
  
+-- 
+2.9.4
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
index e5b47c1..0110260 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
@@ -1,4 +1,7 @@
-Fix parallel make failure for archives
+From 16865de66db33ca70872199e70d93efccecc8575 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Sun, 9 Mar 2014 15:22:15 +0200
+Subject: [PATCH 1/3] Fix parallel make failure for archives
 
 Upstream-Status: Pending
 
@@ -12,31 +15,18 @@ for details.
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+[Rebased for 3.0.6]
+Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
 ---
----
- gnuefi/Makefile |    3 ++-
- lib/Makefile    |    3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
+ gnuefi/Makefile | 3 ++-
+ lib/Makefile    | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
 
-Index: gnu-efi-3.0/lib/Makefile
-===================================================================
---- gnu-efi-3.0.orig/lib/Makefile
-+++ gnu-efi-3.0/lib/Makefile
-@@ -66,7 +66,8 @@ all: libsubdirs libefi.a
- libsubdirs:
- 	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
- 
--libefi.a: $(patsubst %,libefi.a(%),$(OBJS))
-+libefi.a: $(OBJS)
-+	$(AR) rv $@ $(OBJS)
- 
- clean:
- 	rm -f libefi.a *~ $(OBJS) */*.o
-Index: gnu-efi-3.0/gnuefi/Makefile
-===================================================================
---- gnu-efi-3.0.orig/gnuefi/Makefile
-+++ gnu-efi-3.0/gnuefi/Makefile
-@@ -51,7 +51,8 @@ TARGETS	= crt0-efi-$(ARCH).o libgnuefi.a
+diff --git a/gnuefi/Makefile b/gnuefi/Makefile
+index 2a61699..148106e 100644
+--- a/gnuefi/Makefile
++++ b/gnuefi/Makefile
+@@ -54,7 +54,8 @@ TARGETS	= crt0-efi-$(ARCH).o libgnuefi.a
  
  all:	$(TARGETS)
  
@@ -46,3 +36,19 @@ Index: gnu-efi-3.0/gnuefi/Makefile
  
  clean:
  	rm -f $(TARGETS) *~ *.o $(OBJS)
+diff --git a/lib/Makefile b/lib/Makefile
+index b8d1ce7..6ef8107 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -75,7 +75,7 @@ libsubdirs:
+ 	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
+ 
+ libefi.a: $(OBJS)
+-	$(AR) rv -U $@ $^
++	$(AR) rv $@ $(OBJS)
+ 
+ clean:
+ 	rm -f libefi.a *~ $(OBJS) */*.o
+-- 
+2.9.4
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.6.bb
similarity index 92%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.6.bb
index 7346737..2a60717 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.6.bb
@@ -16,11 +16,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
            file://gcc46-compatibility.patch \
-           file://0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch \
            "
 
-SRC_URI[md5sum] = "1f719c9c135778aa6b087b89a1cc2423"
-SRC_URI[sha256sum] = "bd8fcd5914f18fc0e4ba948ab03b00013e528504f529c60739b748f6ef130b22"
+SRC_URI[md5sum] = "46f633758a8a37db9fd6909fe270c26b"
+SRC_URI[sha256sum] = "21515902d80fbea23328a61d70d3d51a47204abd1507ebfa27550a7b9bf22c91"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.9.4


