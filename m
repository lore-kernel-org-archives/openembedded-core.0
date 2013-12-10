Return-Path: <kirgene@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 084FD61566
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 17:19:09 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id eo20so2911758lab.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aucw+9ESq/bX75Ws6/6HW2tQx9MIb0rmV+eV9sx7/ZQ=;
	b=vTBslTsIfk+4GdhIs4v/t6PpT3EKFGRrWxy6JPPnYEA0pqJOR1a+FjZfFqnCLWrUc1
	vmKAhKj8VJ1SG82AtuROqv88kNytqYZ8+ndFaMwS/Lvjp5Zb2/F+7fgx8YNPKTgSOw5E
	T2Tfhio8jXXgDb7SOEzNoj5sMVjn/UM1Gtk1xyUXqLoVYbbAcwVU1ajqZcns/eRerAIQ
	fc+0Nk8XWHVL5aAa4w+a8tia6mqo7ytpfbsmP7bk0tVt+DWMj3E8sZuXsxhXpLEBYgrD
	FyQlO0G21z094CaBSWuj+2d5kGEHzgpgmRlVyon0+3opEN/V90/JoA2RK2PdYcYOSJca
	7Olg==
X-Received: by 10.152.121.105 with SMTP id lj9mr8815165lab.6.1386695948858;
	Tue, 10 Dec 2013 09:19:08 -0800 (PST)
Received: from ubuntu.datv.net ([194.44.215.255])
	by mx.google.com with ESMTPSA id m5sm23022860laj.4.2013.12.10.09.19.07
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Dec 2013 09:19:08 -0800 (PST)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2013 19:18:04 +0200
Message-Id: <1386695884-27586-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH] psplash: add support for systems without mmap support.
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
X-List-Received-Date: Tue, 10 Dec 2013 17:19:11 -0000

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 ...-support-for-systems-without-mmap-support.patch | 133 +++++++++++++++++++++
 meta/recipes-core/psplash/psplash_git.bb           |   3 +-
 2 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/psplash/files/0001-Add-support-for-systems-without-mmap-support.patch

diff --git a/meta/recipes-core/psplash/files/0001-Add-support-for-systems-without-mmap-support.patch b/meta/recipes-core/psplash/files/0001-Add-support-for-systems-without-mmap-support.patch
new file mode 100644
index 0000000..76b21f5
--- /dev/null
+++ b/meta/recipes-core/psplash/files/0001-Add-support-for-systems-without-mmap-support.patch
@@ -0,0 +1,133 @@
+Add support for systems without mmap support.
+
+Patch adds support to display splash image on systems
+where mmap syscall is not available or is not working properly.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
+---
+ psplash-fb.c |   24 +++++++++++++++++++++---
+ psplash-fb.h |    4 ++++
+ psplash.c    |    6 ++++++
+ 3 files changed, 31 insertions(+), 3 deletions(-)
+
+diff --git a/psplash-fb.c b/psplash-fb.c
+index 71740cd..17893ab 100644
+--- a/psplash-fb.c
++++ b/psplash-fb.c
+@@ -19,12 +19,21 @@
+ void
+ psplash_fb_destroy (PSplashFB *fb)
+ {
++  if (fb->alloc == 1)
++      free(fb->base);
+   if (fb->fd >= 0)
+     close (fb->fd);
+ 
+   free(fb);
+ }
+ 
++void
++psplash_fb_flush (PSplashFB *fb)
++{
++  if (fb->alloc == 1)
++      pwrite(fb->fd, fb->base, fb->stride * fb->height, 0);
++}
++
+ static int
+ attempt_to_change_pixel_format (PSplashFB *fb,
+                                 struct fb_var_screeninfo *fb_var)
+@@ -119,6 +128,7 @@ psplash_fb_new (int angle)
+   memset (fb, 0, sizeof(PSplashFB));
+ 
+   fb->fd = -1;
++  fb->alloc = -1;
+ 
+   if ((fb->fd = open (fbdev, O_RDWR)) < 0)
+     {
+@@ -194,17 +204,25 @@ psplash_fb_new (int angle)
+   DBG("width: %i, height: %i, bpp: %i, stride: %i",
+       fb->width, fb->height, fb->bpp, fb->stride);
+ 
++  size_t size = fb->stride * fb->height;
++
+   fb->base = (char *) mmap ((caddr_t) NULL,
+ 			    /*fb_fix.smem_len */
+-			    fb->stride * fb->height,
++			    size,
+ 			    PROT_READ|PROT_WRITE,
+ 			    MAP_SHARED,
+ 			    fb->fd, 0);
+ 
+   if (fb->base == (char *)-1)
+     {
+-      perror("Error cannot mmap framebuffer ");
+-      goto fail;
++      fprintf(stdout, "Error cannot mmap framebuffer. Using malloc instead.\n");
++	  fb->base = (char*)malloc(size);
++      if (!fb->base)
++        {
++          perror("Error cannot allocate memory.");
++          goto fail;
++        }
++      fb->alloc = 1;
+     }
+ 
+   off = (unsigned long) fb_fix.smem_start % (unsigned long) getpagesize();
+diff --git a/psplash-fb.h b/psplash-fb.h
+index ef5b39e..0dbc5ea 100644
+--- a/psplash-fb.h
++++ b/psplash-fb.h
+@@ -48,6 +48,7 @@ typedef struct PSplashFB
+   int            green_length;
+   int            blue_offset;
+   int            blue_length;
++  int            alloc;
+ }
+ PSplashFB;
+ 
+@@ -57,6 +58,9 @@ psplash_fb_destroy (PSplashFB *fb);
+ PSplashFB*
+ psplash_fb_new (int angle);
+ 
++void
++psplash_fb_flush (PSplashFB *fb);
++
+ inline void
+ psplash_fb_plot_pixel (PSplashFB    *fb, 
+ 		       int          x, 
+diff --git a/psplash.c b/psplash.c
+index 09cf0d0..524d37d 100644
+--- a/psplash.c
++++ b/psplash.c
+@@ -57,6 +57,8 @@ psplash_draw_msg (PSplashFB *fb, const char *msg)
+ 			PSPLASH_TEXT_COLOR,
+ 			&radeon_font,
+ 			msg);
++
++  psplash_fb_flush (fb);
+ }
+ 
+ void
+@@ -90,6 +92,8 @@ psplash_draw_progress (PSplashFB *fb, int value)
+ 			    PSPLASH_BAR_COLOR);
+     }
+ 
++  psplash_fb_flush (fb);
++
+   DBG("value: %i, width: %i, barwidth :%i\n", value, 
+ 		width, barwidth);
+ }
+@@ -289,6 +293,8 @@ main (int argc, char** argv)
+ 
+   psplash_draw_msg (fb, MSG);
+ 
++  psplash_fb_flush (fb);
++
+   psplash_main (fb, pipe_fd, 0);
+ 
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 1cab296..91c3fef 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85b
 
 SRCREV = "afd4e228c606a9998feae44a3fed4474803240b7"
 PV = "0.1+git${SRCPV}"
-PR = "r15"
+PR = "r16"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
+           file://0001-Add-support-for-systems-without-mmap-support.patch \
            file://psplash-init \
            ${SPLASH_IMAGES}"
 
-- 
1.8.1.2


