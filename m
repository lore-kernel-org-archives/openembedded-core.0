Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 960BC60FE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 16:48:50 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id c11so6876079wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 09:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0BcqZ87SpA4WJ0cIAsCW2VCGYXyEQkaT9kGlaVSJSiU=;
	b=LCQCUoaCOO0lwieDMGhoInGB5j6Qp9Z/UFRWqkdvxuIaZswVz28N81L5PDDKHNM6YP
	SG69WEoannWLTPo1rx1WdjiRisGDvtwAHwCdgXzxf59iBs0EnAbruSYANf2WLar0C7pZ
	socM5LIQEHhButWsRHD3vr8GKuIiy1FHHmgBCuKK8XfwUBJ26blziqIWbZhMW5bMhf3L
	NJ/P6x6/IQ257aTPhjBPe3JG0239j4MSJlFFBvXw5n8EpejKwa6THJcHFE2Qgf2FzQuZ
	DZMi4bMQG65EJt9jtEG9jA7bueK0NhwaR/gv2HyOTCQL+jnD54VDXFu8YTRIkxp9JnYg
	9Wiw==
X-Gm-Message-State: ALoCoQkDFL3S72oi11r03NS5eccLSuDoLiEXzUvAR6HDnaL4cl5ZTUkEfi4+fSXzxMi0uZ9Xhu6v
X-Received: by 10.180.20.42 with SMTP id k10mr7968336wie.0.1379522931124;
	Wed, 18 Sep 2013 09:48:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id mb7sm3648657wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Sep 2013 09:48:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2013 17:48:45 +0100
Message-Id: <1379522926-22817-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] qemu: add option to disable X grabs
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
X-List-Received-Date: Wed, 18 Sep 2013 16:48:51 -0000

When the mouse pointer enters the qemu window it takes a pointer grab. This
doesn't sound too dangerous at first but it turns out that SDL will infinitely
busy-loop if it can't get the grab (e.g. if the screen is locked) and the
average autobuilder setup's X server will have locked the screen a few minutes
after boot.

The result is that on many autobuilders apparently random qemu instances (the
top-most one under the pointer) will hang during boot.

To resolve this add an option (via an environment variable) to never attempt a
grab.  The default behaviour remains to grab so that everyone else doesn't see
any change.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../qemu/files/disable-grabs.patch                 |   69 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc                |    1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/files/disable-grabs.patch

diff --git a/meta/recipes-devtools/qemu/files/disable-grabs.patch b/meta/recipes-devtools/qemu/files/disable-grabs.patch
new file mode 100644
index 0000000..0e82cc8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/disable-grabs.patch
@@ -0,0 +1,69 @@
+When the pointer enters the Qemu window it calls SDL_WM_GrabInput, which calls
+XGrabPointer in a busyloop until it returns GrabSuccess. However if there's already
+a pointer grab (screen is locked, a menu is open) then qemu will hang until the
+grab can be taken.  In the specific case of a headless X server on an autobuilder, once
+the screensaver has kicked in any qemu instance that appears underneath the
+pointer will hang.
+
+I'm not entirely sure why pointer grabs are required (the documentation
+explicitly says it doesn't do grabs when using a tablet, which we are) so wrap
+them in a conditional that can be set by the autobuilder environment, preserving
+the current grabbing behaviour for everyone else.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+
+From 4b1988ecb01a178269ec0513a75f2ec620c7ef6a Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 18 Sep 2013 14:04:54 +0100
+Subject: [PATCH] sdl.c: allow user to disable pointer grabs
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ ui/sdl.c |    9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/ui/sdl.c b/ui/sdl.c
+index 39a42d6..6095aa6 100644
+--- a/ui/sdl.c
++++ b/ui/sdl.c
+@@ -59,6 +59,7 @@ static SDL_Cursor *guest_sprite = NULL;
+ static SDL_PixelFormat host_format;
+ static int scaling_active = 0;
+ static Notifier mouse_mode_notifier;
++static doing_grabs = True;
+ 
+ static void sdl_update(DisplayChangeListener *dcl,
+                        int x, int y, int w, int h)
+@@ -384,14 +385,16 @@ static void sdl_grab_start(void)
+             SDL_WarpMouse(guest_x, guest_y);
+     } else
+         sdl_hide_cursor();
+-    SDL_WM_GrabInput(SDL_GRAB_ON);
++    if (doing_grabs)
++      SDL_WM_GrabInput(SDL_GRAB_ON);
+     gui_grab = 1;
+     sdl_update_caption();
+ }
+ 
+ static void sdl_grab_end(void)
+ {
+-    SDL_WM_GrabInput(SDL_GRAB_OFF);
++    if (doing_grabs)
++      SDL_WM_GrabInput(SDL_GRAB_OFF);
+     gui_grab = 0;
+     sdl_show_cursor();
+     sdl_update_caption();
+@@ -909,7 +912,8 @@ void sdl_display_init(DisplayState *ds, int full_screen, int no_frame)
+      * This requires SDL >= 1.2.14. */
+     setenv("SDL_DISABLE_LOCK_KEYS", "1", 1);
+ 
++    doing_grabs = (getenv("QEMU_DONT_GRAB") == NULL);
++
+     flags = SDL_INIT_VIDEO | SDL_INIT_NOPARACHUTE;
+     if (SDL_Init (flags)) {
+         fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 97e9b7b..1b861d7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -17,6 +17,7 @@ SRC_URI = "\
     file://powerpc_rom.bin \
     file://no-strip.patch \
     file://larger_default_ram_size.patch \
+    file://disable-grabs.patch \
     "
 
 SRC_URI_append_class-nativesdk = "\
-- 
1.7.10.4


