Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 892067890D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651953"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:12 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:52 +0200
Message-Id: <20180309185614.31113-14-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 14/36] qemu: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../qemu/qemu/apic-fixup-fallthrough-to-PIC.patch  | 15 ++++++--------
 .../recipes-devtools/qemu/qemu/disable-grabs.patch | 23 ++++++++++------------
 2 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch
index 9bbbc6f76da..d6a3522edaa 100644
--- a/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch
@@ -28,12 +28,12 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index 45887d99..c5ae4087 100644
---- a/hw/intc/apic.c
-+++ b/hw/intc/apic.c
-@@ -587,7 +587,7 @@ int apic_accept_pic_intr(DeviceState *dev)
-     APICCommonState *s = APIC_COMMON(dev);
+Index: qemu-2.11.1/hw/intc/apic.c
+===================================================================
+--- qemu-2.11.1.orig/hw/intc/apic.c
++++ qemu-2.11.1/hw/intc/apic.c
+@@ -591,7 +591,7 @@ int apic_accept_pic_intr(DeviceState *de
+     APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
 -    if (!s)
@@ -41,6 +41,3 @@ index 45887d99..c5ae4087 100644
          return -1;
  
      lvt0 = s->lvt[APIC_LVT_LINT0];
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
index 123833f8248..77117890f48 100644
--- a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
+++ b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
@@ -24,11 +24,11 @@ Signed-off-by: Eric Bénard <eric@eukrea.com>
  ui/sdl.c | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
 
-diff --git a/ui/sdl.c b/ui/sdl.c
-index 39a42d6..9b8abe5 100644
---- a/ui/sdl.c
-+++ b/ui/sdl.c
-@@ -59,6 +59,10 @@ static SDL_Cursor *guest_sprite = NULL;
+Index: qemu-2.11.1/ui/sdl.c
+===================================================================
+--- qemu-2.11.1.orig/ui/sdl.c
++++ qemu-2.11.1/ui/sdl.c
+@@ -63,6 +63,10 @@ static SDL_PixelFormat host_format;
  static int scaling_active = 0;
  static Notifier mouse_mode_notifier;
  static int idle_counter;
@@ -37,10 +37,10 @@ index 39a42d6..9b8abe5 100644
 +#endif
 +static doing_grabs = True;
  
- static void sdl_update(DisplayChangeListener *dcl,
-                        int x, int y, int w, int h)
-@@ -384,14 +388,16 @@ static void sdl_grab_start(void)
-             }
+ #define SDL_REFRESH_INTERVAL_BUSY 10
+ #define SDL_MAX_IDLE_COUNT (2 * GUI_REFRESH_INTERVAL_DEFAULT \
+@@ -431,14 +435,16 @@ static void sdl_grab_start(void)
+         }
      } else
          sdl_hide_cursor();
 -    SDL_WM_GrabInput(SDL_GRAB_ON);
@@ -58,7 +58,7 @@ index 39a42d6..9b8abe5 100644
      gui_grab = 0;
      sdl_show_cursor();
      sdl_update_caption();
-@@ -909,6 +915,8 @@ void sdl_display_init(DisplayState *ds, int full_screen, int no_frame)
+@@ -986,6 +992,8 @@ void sdl_display_init(DisplayState *ds,
       * This requires SDL >= 1.2.14. */
      setenv("SDL_DISABLE_LOCK_KEYS", "1", 1);
  
@@ -67,6 +67,3 @@ index 39a42d6..9b8abe5 100644
      flags = SDL_INIT_VIDEO | SDL_INIT_NOPARACHUTE;
      if (SDL_Init (flags)) {
          fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
--- 
-1.8.3.1
-
-- 
2.16.1


