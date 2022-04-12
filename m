Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Khem Raj" <raj.khem@gmail.com>
Subject: [PATCH 2/3] xserver-xorg: Fix build with gcc12
Date: Mon, 11 Apr 2022 17:39:16 -0700
Message-Id: <20220412003917.3593854-2-raj.khem@gmail.com>
In-Reply-To: <20220412003917.3593854-1-raj.khem@gmail.com>
References: <20220412003917.3593854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>

backport patch to silence new array-bounds warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-render-Fix-build-with-gcc-12.patch   | 90 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.3.bb       |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
new file mode 100644
index 00000000000..df9332fae7e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
@@ -0,0 +1,90 @@
+From 12041ad0610f1345d6b9994c32943fd4dd01f65d Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Thu, 20 Jan 2022 10:20:38 +0100
+Subject: [PATCH] render: Fix build with gcc 12
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The xserver fails to compile with the latest gcc 12:
+
+ render/picture.c: In function ‘CreateSolidPicture’:
+ render/picture.c:874:26: error: array subscript ‘union _SourcePict[0]’ is partly outside array bounds of ‘unsigned char[16]’ [-Werror=array-bounds]
+  874 |     pPicture->pSourcePict->type = SourcePictTypeSolidFill;
+      |                          ^~
+ render/picture.c:868:45: note: object of size 16 allocated by ‘malloc’
+  868 |     pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictSolidFill));
+      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ render/picture.c: In function ‘CreateLinearGradientPicture’:
+ render/picture.c:906:26: error: array subscript ‘union _SourcePict[0]’ is partly outside array bounds of ‘unsigned char[32]’ [-Werror=array-bounds]
+  906 |     pPicture->pSourcePict->linear.type = SourcePictTypeLinear;
+      |                          ^~
+ render/picture.c:899:45: note: object of size 32 allocated by ‘malloc’
+  899 |     pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictLinearGradient));
+      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ render/picture.c: In function ‘CreateConicalGradientPicture’:
+ render/picture.c:989:26: error: array subscript ‘union _SourcePict[0]’ is partly outside array bounds of ‘unsigned char[32]’ [-Werror=array-bounds]
+  989 |     pPicture->pSourcePict->conical.type = SourcePictTypeConical;
+      |                          ^~
+ render/picture.c:982:45: note: object of size 32 allocated by ‘malloc’
+  982 |     pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictConicalGradient));
+      |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ cc1: some warnings being treated as errors
+ ninja: build stopped: subcommand failed.
+
+This is because gcc 12 has become stricter and raises a warning now.
+
+Fix the warning/error by allocating enough memory to store the union
+struct.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/c6b0dcb82d4db07a2f32c09a8c09c85a5f57248e]
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Michel Dänzer <mdaenzer@redhat.com>
+Closes: https://gitlab.freedesktop.org/xorg/xserver/-/issues/1256
+---
+ render/picture.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/render/picture.c b/render/picture.c
+index afa0d25..2be4b19 100644
+--- a/render/picture.c
++++ b/render/picture.c
+@@ -865,7 +865,7 @@ CreateSolidPicture(Picture pid, xRenderColor * color, int *error)
+     }
+ 
+     pPicture->id = pid;
+-    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictSolidFill));
++    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(SourcePict));
+     if (!pPicture->pSourcePict) {
+         *error = BadAlloc;
+         free(pPicture);
+@@ -896,7 +896,7 @@ CreateLinearGradientPicture(Picture pid, xPointFixed * p1, xPointFixed * p2,
+     }
+ 
+     pPicture->id = pid;
+-    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictLinearGradient));
++    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(SourcePict));
+     if (!pPicture->pSourcePict) {
+         *error = BadAlloc;
+         free(pPicture);
+@@ -936,7 +936,7 @@ CreateRadialGradientPicture(Picture pid, xPointFixed * inner,
+     }
+ 
+     pPicture->id = pid;
+-    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictRadialGradient));
++    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(SourcePict));
+     if (!pPicture->pSourcePict) {
+         *error = BadAlloc;
+         free(pPicture);
+@@ -979,7 +979,7 @@ CreateConicalGradientPicture(Picture pid, xPointFixed * center, xFixed angle,
+     }
+ 
+     pPicture->id = pid;
+-    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(PictConicalGradient));
++    pPicture->pSourcePict = (SourcePictPtr) malloc(sizeof(SourcePict));
+     if (!pPicture->pSourcePict) {
+         *error = BadAlloc;
+         free(pPicture);
+-- 
+2.35.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
index 3e076ecca7d..1f53ab5177d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
@@ -2,6 +2,7 @@ require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+            file://0001-render-Fix-build-with-gcc-12.patch \
             "
 SRC_URI[sha256sum] = "61d6aad5b6b47a116b960bd7f0cba4ee7e6da95d6bb0b127bde75d7d1acdebe5"
 
-- 
2.35.1

