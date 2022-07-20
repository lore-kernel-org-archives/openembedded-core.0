Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 22/51] xserver-xorg: update 21.1.3 -> 21.1.4
Date: Wed, 20 Jul 2022 10:44:13 +0200
Message-Id: <20220720084442.2940187-22-alex@linutronix.de>
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-render-Fix-build-with-gcc-12.patch   | 90 -------------------
 ...-xorg_21.1.3.bb => xserver-xorg_21.1.4.bb} |  7 +-
 2 files changed, 3 insertions(+), 94 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.3.bb => xserver-xorg_21.1.4.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
deleted file mode 100644
index df9332fae7..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 12041ad0610f1345d6b9994c32943fd4dd01f65d Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Thu, 20 Jan 2022 10:20:38 +0100
-Subject: [PATCH] render: Fix build with gcc 12
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The xserver fails to compile with the latest gcc 12:
-
- render/picture.c: In function ‘CreateSolidPicture’:
- render/picture.c:874:26: error: array subscript ‘union _SourcePict[0]’ is partly outside array bounds of ‘unsigned char[16]’ [-Werror=array-bounds]
-  874 |     pPicture->pSourcePict->type = SourcePictTypeSolidFill;
-      |                          ^~
- render/picture.c:868:45: note: object of size 16 allocated by ‘malloc’
-  868 |     pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictSolidFill));
-      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- render/picture.c: In function ‘CreateLinearGradientPicture’:
- render/picture.c:906:26: error: array subscript ‘union _SourcePict[0]’ is partly outside array bounds of ‘unsigned char[32]’ [-Werror=array-bounds]
-  906 |     pPicture->pSourcePict->linear.type = SourcePictTypeLinear;
-      |                          ^~
- render/picture.c:899:45: note: object of size 32 allocated by ‘malloc’
-  899 |     pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictLinearGradient));
-      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- render/picture.c: In function ‘CreateConicalGradientPicture’:
- render/picture.c:989:26: error: array subscript ‘union _SourcePict[0]’ is partly outside array bounds of ‘unsigned char[32]’ [-Werror=array-bounds]
-  989 |     pPicture->pSourcePict->conical.type = SourcePictTypeConical;
-      |                          ^~
- render/picture.c:982:45: note: object of size 32 allocated by ‘malloc’
-  982 |     pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictConicalGradient));
-      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- cc1: some warnings being treated as errors
- ninja: build stopped: subcommand failed.
-
-This is because gcc 12 has become stricter and raises a warning now.
-
-Fix the warning/error by allocating enough memory to store the union
-struct.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/c6b0dcb82d4db07a2f32c09a8c09c85a5f57248e]
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Acked-by: Michel Dänzer <mdaenzer@redhat.com>
-Closes: https://gitlab.freedesktop.org/xorg/xserver/-/issues/1256
----
- render/picture.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/render/picture.c b/render/picture.c
-index afa0d25..2be4b19 100644
---- a/render/picture.c
-+++ b/render/picture.c
-@@ -865,7 +865,7 @@ CreateSolidPicture(Picture pid, xRenderColor * color, int *error)
-     }
- 
-     pPicture->id = pid;
--    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictSolidFill));
-+    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(SourcePict));
-     if (!pPicture->pSourcePict) {
-         *error = BadAlloc;
-         free(pPicture);
-@@ -896,7 +896,7 @@ CreateLinearGradientPicture(Picture pid, xPointFixed * p1, xPointFixed * p2,
-     }
- 
-     pPicture->id = pid;
--    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictLinearGradient));
-+    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(SourcePict));
-     if (!pPicture->pSourcePict) {
-         *error = BadAlloc;
-         free(pPicture);
-@@ -936,7 +936,7 @@ CreateRadialGradientPicture(Picture pid, xPointFixed * inner,
-     }
- 
-     pPicture->id = pid;
--    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictRadialGradient));
-+    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(SourcePict));
-     if (!pPicture->pSourcePict) {
-         *error = BadAlloc;
-         free(pPicture);
-@@ -979,7 +979,7 @@ CreateConicalGradientPicture(Picture pid, xPointFixed * center, xFixed angle,
-     }
- 
-     pPicture->id = pid;
--    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictConicalGradient));
-+    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(SourcePict));
-     if (!pPicture->pSourcePict) {
-         *error = BadAlloc;
-         free(pPicture);
--- 
-2.35.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
index 1f53ab5177..b9cbc9989e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
@@ -1,10 +1,9 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-            file://0001-render-Fix-build-with-gcc-12.patch \
-            "
-SRC_URI[sha256sum] = "61d6aad5b6b47a116b960bd7f0cba4ee7e6da95d6bb0b127bde75d7d1acdebe5"
+           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+           "
+SRC_URI[sha256sum] = "5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd2471fc3cbee1c587"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.30.2

