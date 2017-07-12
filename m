Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43FB4781E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 10:15:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6CAFafH021558
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 03:15:37 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 03:15:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2017 03:15:30 -0700
Message-ID: <7a4d76d26f422134f3d674dc47ea6bf134242094.1499854502.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1499854502.git.liezhi.yang@windriver.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] gnu-efi: 3.0.5 -> 3.0.6
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
X-List-Received-Date: Wed, 12 Jul 2017 10:15:35 -0000
Content-Type: text/plain

* Update parallel-make-archives.patch, the patch for lib/Makefile is
  already in the source.
* Remove 0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch, the
  source uses a similar way to fix it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...plicit-fall-through-so-Wextra-will-work-i.patch | 34 ----------------------
 .../gnu-efi/gnu-efi/parallel-make-archives.patch   | 30 +++++--------------
 .../gnu-efi/{gnu-efi_3.0.5.bb => gnu-efi_3.0.6.bb} |  5 ++--
 3 files changed, 9 insertions(+), 60 deletions(-)
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
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
index e5b47c1..5404051 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
@@ -13,30 +13,14 @@ for details.
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 Signed-off-by: Darren Hart <dvhart@linux.intel.com>
 ---
----
- gnuefi/Makefile |    3 ++-
- lib/Makefile    |    3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
+ gnuefi/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
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
2.10.2


