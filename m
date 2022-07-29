Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 11/29] xserver-xorg: update 21.1.3 -> 21.1.4
Date: Fri, 29 Jul 2022 04:46:27 -1000
Message-Id: <75503a13cb2a2266f311477a605389bbac7676e2.1659105705.git.steve@sakoman.com>
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

Security update

CVE fixed in this release:

CVE-2022-2319/ZDI-CAN-16062: X.Org Server ProcXkbSetGeometry Out-Of-Bounds Access
CVE-2022-2320/ZDI-CAN-16070: X.Org Server ProcXkbSetDeviceInfo Out-Of-Bounds Access

Changes:

present: Check for NULL to prevent crash
rootless: Dead code removal (ROOTLESS_REDISPLAY_DELAY is already defined)
X11Application: Ensure TIS operations are done on the main thread
os/connection: Improve abstraction for launchd secure sockets
xquartz: Create a separate category for organizing user preferences
xquartz pbproxy: Adopt NSUserDefaults+XQuartzDefaults for preferences
xquartz: Fold spaces related preferences into NSUserDefaults+XQuartzDefaults
XQuartz: Ensure scroll events are delivered to a single window (not both X11 and AppKit)
meson: Bump requirement to meson-0.50.0
xquartz: Update Sparkle configuration to use SUPublicEDKey
xquartz: Update copyright for 2022
meson: Provide options to set CFBundleVersion and CFBundleVersionString in XQuartz
Revert "meson: Bump requirement to meson-0.50.0"
xquartz: Update autotools-based builds of XQuartz to account for recent changes
print_edid: Fix a format string error
xf86-input-inputtest: Fix build on systems without SOCK_NONBLOCK
tests: Fix build failure from missing micmap.c
meson: Support building Xnest and Xorg on darwin
XQuartz: Build the bundle trampoline when using meson
XQuartz: Add TCC reason keys to Info.plist
xquartz: Use correct defines when building to support Sparkle updates
xquartz: Fix a possible crash when editing the Application menu due to mutaing immutable arrays
XQuartz: Improve type safety for X11Controller's application menu editor
xquartz: Add missing files to distribution tarball
render: Fix build with gcc 12
xkb: switch to array index loops to moving pointers
xkb: swap XkbSetDeviceInfo and XkbSetDeviceInfoCheck
xkb: add request length validation for XkbSetGeometry
Revert "os: Try to discover the current seat with the XDG_SEAT var first"
dix: Correctly save replayed event into GrabInfoRec
dix: Don't send touch end to clients that do async grab without touches
xfree86: Fix event data alignment in inputtest driver
xkb: fix XkbSetMap when changing a keysym without changing a keytype

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d683f2a1fbe65b52d82f55a2e38aa75fc105a338)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

