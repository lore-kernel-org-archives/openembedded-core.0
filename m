Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RbU6S-0008UW-Qe
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 10:29:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBG9MLUf021626
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 01:22:21 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 16 Dec 2011 01:22:21 -0800
Message-ID: <c9f8045453a17a283f497712b73403f525aee760.1324025415.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1324025415.git.xiaofeng.yan@windriver.com>
References: <cover.1324025415.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 16 Dec 2011 16:28:41 +0800
Date: Fri, 16 Dec 2011 17:15:55 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] xserver-kdrive: update to 1.11.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Dec 2011 09:29:21 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

update to 1.11.2

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../xserver-kdrive-1.11.2/disable-apm.patch        |   22 ++
 .../xserver-kdrive-1.11.2/extra-kmodes.patch       |   82 ++++++
 .../xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch |   57 ++++
 .../fix-newer-xorg-headers.patch                   |   13 +
 .../hide-cursor-and-ppm-root.patch                 |  298 ++++++++++++++++++++
 .../keyboard-resume-workaround.patch               |   26 ++
 .../xserver-kdrive-1.11.2/no-serial-probing.patch  |   16 +
 .../xorg-xserver/xserver-kdrive_1.11.2.bb          |   26 ++
 8 files changed, 540 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/disable-apm.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/extra-kmodes.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fix-newer-xorg-headers.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/hide-cursor-and-ppm-root.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/keyboard-resume-workaround.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/no-serial-probing.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.2.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/disable-apm.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/disable-apm.patch
new file mode 100644
index 0000000..e1d5622
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/disable-apm.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+--- xorg-server-1.11.1.901/hw/kdrive/linux/linux.c	2011-07-15 21:26:40.000000000 +0800
++++ xorg-server-1.11.1.901/hw/kdrive/linux/linux.c.new	2011-10-24 16:15:12.000000000 +0800
+@@ -251,6 +251,7 @@
+     /*
+      * Open the APM driver
+      */
++    /*
+     LinuxApmFd = open ("/dev/apm_bios", 2);
+     if (LinuxApmFd < 0 && errno == ENOENT)
+ 	LinuxApmFd = open ("/dev/misc/apm_bios", 2);
+@@ -261,6 +262,7 @@
+ 	RegisterBlockAndWakeupHandlers (LinuxApmBlock, LinuxApmWakeup, 0);
+ 	AddEnabledDevice (LinuxApmFd);
+     }
++    */
+ 
+     /*
+      * now get the VT
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/extra-kmodes.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/extra-kmodes.patch
new file mode 100644
index 0000000..40298d0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/extra-kmodes.patch
@@ -0,0 +1,82 @@
+Add some extra video modes and change the default to VGA.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+--- xorg-server-1.11.1.901/hw/kdrive/src/kmode.c	2011-03-02 12:09:32.000000000 +0800
++++ xorg-server-1.11.1.901/hw/kdrive/src/kmode.c.new	2011-10-24 15:58:43.000000000 +0800
+@@ -29,6 +29,29 @@
+ const KdMonitorTiming  kdMonitorTimings[] = {
+     /*	H	V	Hz	KHz */
+ 		/*  FP	    BP	    BLANK   POLARITY */
++       /* Treo 650 */
++
++    {   320,   320,    64,     16256,
++                   17,     12,     32,     KdSyncNegative,
++                   1,      11,     14,     KdSyncNegative,
++    },
++    
++    {   320,   320,    64,         0,
++                   0,      0,      0,     KdSyncNegative,
++                   0,      0,      0,     KdSyncNegative,
++    },
++       
++       /* LifeDrive/T3/TX modes */
++
++    {   320,   480,    64,     16256,
++                   17,     12,     32,     KdSyncNegative,
++                   1,      11,     14,     KdSyncNegative,
++    },
++    
++    {   480,   320,    64,         0,
++                   0,      0,      0,     KdSyncNegative,
++                   0,      0,      0,     KdSyncNegative,
++    },
+ 
+     /* IPAQ modeline:
+      *
+@@ -39,6 +62,12 @@
+ 	            1,      11,     14,     KdSyncNegative,
+     },
+ 
++    {   240,   320,    64,         0,
++                   0,      0,      0,     KdSyncNegative,
++                   0,      0,      0,     KdSyncNegative,
++    },
++
++
+     /* Other VESA modes */
+     {	640,	350,	85,	31500,			    /* VESA */
+ 		    32,	    96,	    192,    KdSyncPositive, /* 26.413 */
+@@ -74,11 +103,18 @@
+ 		    16,	    120,    176,    KdSyncNegative, /* 37.861 */
+ 		    1,	    20,	    24,	    KdSyncNegative, /* 72.809 */
+     },
+-    {	640,	480,	60,	25175,			    /* VESA */
++    /* DEFAULT */
++#define MONITOR_TIMING_DEFAULT 13
++ 
++   {	640,	480,	60,	25175,			    /* VESA */
+ 		   16,	    48,	    160,    KdSyncNegative, /* 31.469 */
+ 		   10,	    33,	    45,	    KdSyncNegative, /* 59.940 */
+-    },
++   },
+ 
++   {   480,    640,    60,     0,                      /* VESA */
++               0,      0,     0,    KdSyncNegative, /* 31.469 */
++               0,      0,     0,     KdSyncNegative, /* 59.940 */
++   },
+     /* 800x600 modes */
+     {	800,	600,	85,	56250,			    /* VESA */
+ 		    32,	    152,    248,    KdSyncPositive, /* 53.674 */
+@@ -88,8 +124,7 @@
+ 		    16,	    160,    256,    KdSyncPositive, /* 46.875 */
+ 		    1,	    21,	    25,	    KdSyncPositive, /* 75.000 */
+     },
+-    /* DEFAULT */
+-#define MONITOR_TIMING_DEFAULT	9
++    
+     {	800,	600,	72,	50000,			    /* VESA */
+ 		    56,	    64,	    240,    KdSyncPositive, /* 48.077 */
+ 		    37,	    23,	    66,	    KdSyncPositive, /* 72.188 */
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch
new file mode 100644
index 0000000..7f4998e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+Index: xorg-server-1.11.1.901/hw/kdrive/fbdev/fbdev.c
+===================================================================
+--- xorg-server-1.11.1.901/hw/kdrive/fbdev/fbdev.c	2011-10-25 14:48:04.000000000 +0800
++++ xorg-server-1.11.1.901/hw/kdrive/fbdev/fbdev.c	2011-10-25 14:50:16.000000000 +0800
+@@ -485,6 +485,7 @@
+     KdScreenInfo	*screen = pScreenPriv->screen;
+     FbdevScrPriv	*scrpriv = screen->driver;
+     Bool		wasEnabled = pScreenPriv->enabled;
++    FbdevPriv          *priv = screen->card->driver;
+     FbdevScrPriv	oldscr;
+     int			oldwidth;
+     int			oldheight;
+@@ -517,6 +518,41 @@
+      * Set new configuration
+      */
+ 
++    if (newwidth != oldwidth || newheight != oldheight)
++    {
++       struct fb_var_screeninfo var;
++       int k;
++
++       k = ioctl (priv->fd, FBIOGET_VSCREENINFO, &var);
++
++       if (k < 0)
++       {
++           ErrorF("Error with framebuffer ioctl FBIOGET_VSCREENINFO: %s", strerror (errno));
++           return FALSE;
++       }
++
++       var.xres = newwidth;
++       var.yres = newheight;
++       var.activate = FB_ACTIVATE_NOW;
++
++       k = ioctl (priv->fd, FBIOPUT_VSCREENINFO, &var);
++
++       if (k >= 0)
++       {
++           if ((k=ioctl(priv->fd, FBIOGET_FSCREENINFO, &priv->fix)) < 0)
++           {
++               perror("Error with framebuffer ioctl FIOGET_FSCREENINFO");
++               close (priv->fd);
++               return FALSE;
++           }
++           if ((k=ioctl(priv->fd, FBIOGET_VSCREENINFO, &priv->var)) < 0) {
++               perror("Error  framebuffer ioctl FIOGET_VSCREENINFO");
++               close (priv->fd);
++               return FALSE;
++           }
++       }
++    }
++
+     scrpriv->randr = KdAddRotation (screen->randr, randr);
+ 
+     fbdevUnmapFramebuffer (screen);
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fix-newer-xorg-headers.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fix-newer-xorg-headers.patch
new file mode 100644
index 0000000..18781b3
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fix-newer-xorg-headers.patch
@@ -0,0 +1,13 @@
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+--- xorg-server-1.11.1.901/render/glyphstr.h	2011-03-02 12:09:33.000000000 +0800
++++ xorg-server-1.11.1.901/render/glyphstr.h.new	2011-10-24 16:19:32.000000000 +0800
+@@ -25,6 +25,7 @@
+ #ifndef _GLYPHSTR_H_
+ #define _GLYPHSTR_H_
+ 
++#include <X11/X.h>
+ #include <X11/extensions/renderproto.h>
+ #include "picture.h"
+ #include "screenint.h"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/hide-cursor-and-ppm-root.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/hide-cursor-and-ppm-root.patch
new file mode 100644
index 0000000..37e0efe
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/hide-cursor-and-ppm-root.patch
@@ -0,0 +1,298 @@
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+Index: xorg-server-1.11.1.901/dix/window.c
+===================================================================
+--- xorg-server-1.11.1.901/dix/window.c	2011-07-15 21:26:40.000000000 +0800
++++ xorg-server-1.11.1.901/dix/window.c.new	2011-10-25 13:57:50.000000000 +0800
+@@ -182,10 +182,123 @@
+ 
+ #define SubStrSend(pWin,pParent) (StrSend(pWin) || SubSend(pParent))
+ 
++char* RootPPM = NULL;
++
+ #ifdef COMPOSITE
+ static const char *overlay_win_name = "<composite overlay>";
+ #endif
+ 
++static int
++get_int(FILE *fp)
++{
++  int c = 0;
++
++  while ((c = getc(fp)) != EOF)
++    {
++      if (isspace(c))
++       continue;
++
++      if (c == '#')
++       while (c = getc(fp))
++         if (c == EOF)
++           return 0;
++         else if (c == '\n')
++           break;
++
++      if (isdigit(c)) 
++       {
++         int val = c - '0';
++         while ((c = getc(fp)) && isdigit(c))
++           val = (val * 10) + (c - '0');
++         return val;
++       }
++    }
++
++  return 0;
++}
++
++static unsigned char*
++ppm_load (const char* path, int depth, int *width, int *height)
++{
++  FILE *fp;
++  int   max, n = 0, w, h, i, j, bytes_per_line;
++  unsigned char *data, *res, h1, h2;
++
++  if (depth < 16 || depth > 32)
++    return NULL;
++
++  if (depth > 16)
++    depth = 32;
++
++  fp = fopen (path, "r");
++  if (fp == NULL)
++    return FALSE;
++
++  h1 = getc(fp);
++  h2 = getc(fp);
++
++  /* magic is 'P6' for raw ppm */
++  if (h1 != 'P' && h2 != '6')
++      goto fail;
++
++  w = get_int(fp);
++  h = get_int(fp);
++
++  if (w == 0 || h == 0)
++    goto fail;
++
++  max = get_int(fp);
++
++  if (max != 255)
++      goto fail;
++
++  bytes_per_line = ((w * depth + 31) >> 5) << 2;
++
++  res = data = malloc(bytes_per_line * h);
++
++  for (i=0; i<h; i++)
++    {
++      for (j=0; j<w; j++)
++       {
++         unsigned char buf[3];
++         fread(buf, 1, 3, fp);
++         
++         switch (depth)
++           {
++           case 24:
++           case 32:
++             *data     = buf[2];
++             *(data+1) = buf[1];
++             *(data+2) = buf[0];
++             data += 4;
++             break;
++           case 16:
++           default:
++             *(unsigned short*)data
++               = ((buf[0] >> 3) << 11) | ((buf[1] >> 2) << 5) | (buf[2] >> 3);
++             data += 2;
++             break;
++           }
++       }
++      data += (bytes_per_line - (w*(depth>>3)));
++    }
++
++  data = res;
++
++  *width  = w;
++  *height = h;
++
++  fclose(fp);
++
++  return res;
++
++ fail:
++  fclose(fp);
++  return NULL;
++}
++
++
++
+ static const char *
+ get_window_name(WindowPtr pWin)
+ {
+@@ -409,6 +522,35 @@
+     int len = BitmapBytePad(sizeof(long));
+     unsigned char *from, *to;
+     int i, j;
++    if (RootPPM != NULL)
++      {
++       int            w, h;
++       unsigned char *data;
++
++       if ((data = ppm_load (RootPPM, pScreen->rootDepth, &w, &h)) != NULL)
++         {
++           pWin->background.pixmap 
++             = (*pScreen->CreatePixmap)(pScreen, w, h, pScreen->rootDepth, 0);
++
++           pWin->backgroundState = BackgroundPixmap;
++           pGC = GetScratchGC(pScreen->rootDepth, pScreen);
++           if (!pWin->background.pixmap || !pGC)
++             FatalError("could not create root tile");
++
++           ValidateGC((DrawablePtr)pWin->background.pixmap, pGC);
++
++           (*pGC->ops->PutImage)((DrawablePtr)pWin->background.pixmap, 
++                                 pGC, 
++                                 pScreen->rootDepth,
++                                 0, 0, w, h, 0, ZPixmap, (char *)data);
++           FreeScratchGC(pGC);
++           
++           free(data);
++           return;
++         }
++       else
++         ErrorF("Unable to load root window image.");
++      }
+ 
+     pWin->background.pixmap = (*pScreen->CreatePixmap)(pScreen, 4, 4,
+ 						    pScreen->rootDepth, 0);
+
+Index: xorg-server-1.11.1.901/hw/kdrive/src/kdrive.c
+===================================================================
+--- xorg-server-1.11.1.901/hw/kdrive/src/kdrive.c	2011-08-01 07:44:54.000000000 +0800
++++ xorg-server-1.11.1.901/hw/kdrive/src/kdrive.c.new	2011-10-25 14:04:38.000000000 +0800
+@@ -60,6 +60,9 @@
+     { 32, 32 }
+ };
+ 
++int 
++ProcXFixesHideCursor (ClientPtr client) ;
++
+ #define NUM_KD_DEPTHS (sizeof (kdDepths) / sizeof (kdDepths[0]))
+ 
+ #define KD_DEFAULT_BUTTONS 5
+@@ -90,6 +93,9 @@
+  */
+ 
+ KdOsFuncs	*kdOsFuncs;
++extern Bool CursorInitiallyHidden; /* See Xfixes cursor.c */
++extern char* RootPPM;             /* dix/window.c */
++
+ 
+ void
+ KdDisableScreen (ScreenPtr pScreen)
+@@ -454,6 +460,9 @@
+     ErrorF("-switchCmd       Command to execute on vt switch\n");
+     ErrorF("-zap             Terminate server on Ctrl+Alt+Backspace\n");
+     ErrorF("vtxx             Use virtual terminal xx instead of the next available\n");
++    ErrorF("-hide-cursor     Start with cursor hidden\n");
++    ErrorF("-root-ppm [path] Specify ppm file to use as root window background.\n");
++
+ }
+ 
+ int
+@@ -517,6 +526,20 @@
+ 	kdSoftCursor = TRUE;
+ 	return 1;
+     }
++    if (!strcmp (argv[i], "-hide-cursor"))
++    {
++      CursorInitiallyHidden = TRUE;
++      return 1;
++    }
++    if (!strcmp (argv[i], "-root-ppm"))
++    {
++      if ((i+1) < argc)
++       RootPPM =  argv[i+1];
++      else
++       UseMsg ();
++      return 2;
++    }
++
+     if (!strcmp (argv[i], "-videoTest"))
+     {
+ 	kdVideoTest = TRUE;
+
+Index: xorg-server-1.11.1.901/xfixes/cursor.c
+===================================================================
+--- xorg-server-1.11.1.901/xfixes/cursor.c	2011-07-15 21:26:40.000000000 +0800
++++ xorg-server-1.11.1.901/xfixes/cursor.c.new	2011-10-25 14:13:09.000000000 +0800
+@@ -60,6 +60,7 @@
+ static RESTYPE		CursorClientType;
+ static RESTYPE		CursorHideCountType;
+ static RESTYPE		CursorWindowType;
++static Bool             CursorGloballyHidden;
+ RESTYPE			PointerBarrierType;
+ static CursorPtr	CursorCurrent[MAXDEVICES];
+ 
+@@ -68,6 +69,8 @@
+ 
+ static void deleteCursorHideCountsForScreen (ScreenPtr pScreen);
+ 
++Bool CursorInitiallyHidden = FALSE;
++
+ #define VERIFY_CURSOR(pCursor, cursor, client, access)			\
+     do {								\
+ 	int err;							\
+@@ -160,7 +163,7 @@
+     if (ConnectionInfo)
+ 	CursorVisible = EnableCursor;
+ 
+-    if (cs->pCursorHideCounts != NULL || !CursorVisible) {
++    if (cs->pCursorHideCounts != NULL || !CursorVisible || CursorGloballyHidden) {
+ 	ret = (*pScreen->DisplayCursor) (pDev, pScreen, NullCursor);
+     } else {
+ 	ret = (*pScreen->DisplayCursor) (pDev, pScreen, pCursor);
+@@ -896,6 +899,13 @@
+ 	return ret;
+     }
+ 
++    /* Is cursor set to be initially hidden ?, if so reset this 
++     * flag as now visibility assumed under control of client.
++    */
++    if (CursorGloballyHidden)
++      CursorGloballyHidden = FALSE;
++
++
+     /* 
+      * Has client hidden the cursor before on this screen? 
+      * If so, just increment the count. 
+@@ -959,9 +969,19 @@
+ 	return rc;
+     }
+ 
++    /* X was started with cursor hidden, therefore just reset our flag
++     * (returning to normal client control) and cause cursor to now be
++     * shown.
++    */
++    if (CursorGloballyHidden == TRUE)
++      {
++       CursorGloballyHidden = FALSE;
++       return (client->noClientException);
++      }
++
+     /* 
+      * Has client hidden the cursor on this screen?
+-     * If not, generate an error.
++     * If so, generate an error.
+      */
+     pChc = findCursorHideCount(client, pWin->drawable.pScreen);
+     if (pChc == NULL) {
+@@ -1426,6 +1446,8 @@
+ {
+     int	i;
+ 
++    CursorGloballyHidden = CursorInitiallyHidden;
++    
+     if (party_like_its_1989)
+ 	CursorVisible = EnableCursor;
+     
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/keyboard-resume-workaround.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/keyboard-resume-workaround.patch
new file mode 100644
index 0000000..bdf22ba
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/keyboard-resume-workaround.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+--- xorg-server-1.11.1.901/hw/kdrive/linux/keyboard.c	2011-10-24 16:44:10.000000000 +0800
++++ xorg-server-1.11.1.901/hw/kdrive/linux/keyboard.c.new	2011-10-24 16:41:27.000000000 +0800
+@@ -486,6 +486,8 @@
+     ki->minScanCode = minKeyCode;
+     ki->maxScanCode = maxKeyCode;
+ #endif
++    ki->minScanCode = 0;
++    ki->maxScanCode = NR_KEYS;
+ }
+ 
+ /*
+@@ -707,11 +709,6 @@
+     cfsetispeed(&nTty, 9600);
+     cfsetospeed(&nTty, 9600);
+     tcsetattr(fd, TCSANOW, &nTty);
+-    /*
+-     * Flush any pending keystrokes
+-     */
+-    while ((n = read (fd, buf, sizeof (buf))) > 0)
+-	;
+     KdRegisterFd (fd, LinuxKeyboardRead, ki);
+     return Success;
+ }
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/no-serial-probing.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/no-serial-probing.patch
new file mode 100644
index 0000000..dbc2bf8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/no-serial-probing.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+--- xorg-server-1.11.1.901/hw/kdrive/linux/mouse.c	2011-10-24 16:33:08.000000000 +0800
++++ xorg-server-1.11.1.901/hw/kdrive/linux/mouse.c.new	2011-10-24 16:23:23.000000000 +0800
+@@ -924,8 +924,10 @@
+     "/dev/mouse",
+     "/dev/psaux",
+     "/dev/adbmouse",
++#ifdef BREAK_MY_SERIAL_CONSOLE
+     "/dev/ttyS0",
+     "/dev/ttyS1",
++#endif
+ };
+ 
+ #define NUM_DEFAULT_MOUSE    (sizeof (kdefaultMouse) / sizeof (kdefaultMouse[0]))
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.2.bb
new file mode 100644
index 0000000..43c4113
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.2.bb
@@ -0,0 +1,26 @@
+require xserver-kdrive.inc
+
+DEPENDS += "libxkbfile libxcalibrate font-util pixman"
+
+RDEPENDS_${PN} += "xkeyboard-config"
+
+EXTRA_OECONF += "--disable-glx --enable-unit-tests=no  --enable-kdrive-kbd=yes --enable-kdrive-evdev=yes --enable-config-udev=yes"
+
+PE = "1"
+PR = "r0"
+
+LIC_FILES_CHKSUM  = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
+
+SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
+		file://extra-kmodes.patch \
+		file://disable-apm.patch \
+		file://no-serial-probing.patch \
+		file://keyboard-resume-workaround.patch \
+		file://hide-cursor-and-ppm-root.patch \
+		file://fbdev_xrandr_ioctl.patch \
+		file://fix-newer-xorg-headers.patch"
+	
+SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
+SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
+
+S = "${WORKDIR}/xorg-server-${PV}"
-- 
1.7.0.4



