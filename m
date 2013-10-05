Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 02D42621CD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 10:11:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 9810CA632A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:11:21 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 12:11:19 +0200
Message-Id: <1380967879-2902-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] qemu: fix nativesdk build without x11
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
X-List-Received-Date: Sat, 05 Oct 2013 10:11:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

when x11 is not defined in DISTRO_FEATURES, there are no x11 headers
so True is not defined leading to :
| ui/sdl.c:62:8: warning: type defaults to 'int' in declaration of 'doing_grabs' [-Wimplicit-int]
|  static doing_grabs = True;
|         ^
| ui/sdl.c:62:22: error: 'True' undeclared here (not in a function)
|  static doing_grabs = True;
|                       ^

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/recipes-devtools/qemu/files/disable-grabs.patch | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/files/disable-grabs.patch b/meta/recipes-devtools/qemu/files/disable-grabs.patch
index 99ad00b..41726b1 100644
--- a/meta/recipes-devtools/qemu/files/disable-grabs.patch
+++ b/meta/recipes-devtools/qemu/files/disable-grabs.patch
@@ -13,30 +13,33 @@ the current grabbing behaviour for everyone else.
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-
 From 4b1988ecb01a178269ec0513a75f2ec620c7ef6a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 18 Sep 2013 14:04:54 +0100
 Subject: [PATCH] sdl.c: allow user to disable pointer grabs
 
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Eric Bénard <eric@eukrea.com>
 ---
- ui/sdl.c |    9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
+ ui/sdl.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/ui/sdl.c b/ui/sdl.c
-index 39a42d6..6095aa6 100644
+index 39a42d6..9b8abe5 100644
 --- a/ui/sdl.c
 +++ b/ui/sdl.c
-@@ -59,6 +59,7 @@ static SDL_Cursor *guest_sprite = NULL;
+@@ -59,6 +59,10 @@ static SDL_Cursor *guest_sprite = NULL;
  static SDL_PixelFormat host_format;
  static int scaling_active = 0;
  static Notifier mouse_mode_notifier;
++#ifndef True
++#define True 1
++#endif
 +static doing_grabs = True;
  
  static void sdl_update(DisplayChangeListener *dcl,
                         int x, int y, int w, int h)
-@@ -384,14 +385,16 @@ static void sdl_grab_start(void)
+@@ -384,14 +388,16 @@ static void sdl_grab_start(void)
              SDL_WarpMouse(guest_x, guest_y);
      } else
          sdl_hide_cursor();
@@ -55,7 +58,7 @@ index 39a42d6..6095aa6 100644
      gui_grab = 0;
      sdl_show_cursor();
      sdl_update_caption();
-@@ -909,6 +912,8 @@ void sdl_display_init(DisplayState *ds,
+@@ -909,6 +915,8 @@ void sdl_display_init(DisplayState *ds, int full_screen, int no_frame)
       * This requires SDL >= 1.2.14. */
      setenv("SDL_DISABLE_LOCK_KEYS", "1", 1);
  
@@ -65,5 +68,5 @@ index 39a42d6..6095aa6 100644
      if (SDL_Init (flags)) {
          fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
 -- 
-1.7.10.4
+1.8.3.1
 
-- 
1.8.3.1


