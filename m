Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id E212D75794
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 15:58:39 +0000 (UTC)
Received: by iodv127 with SMTP id v127so110062387iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Wv83qO5FrVJwaRXFQEyCk3EKre8CKBO3f+fYjPKFtI=;
	b=Suopxq2IUaGsTDsd0q6RkgaOB35fZdoxl2mtkEbN9oCo5Gyw91H/6T2F1XrOhNwfpc
	aJ6Mb2vDHeRIPxU7D67dZnx+Z+q96SE8lY4S1YikDTHlxVa16v6V98lXpAXclwYF7PS2
	fjDAs/9IMYLfar7QQkTon0fkifkguJcfYrMNmnPbh3HkMSTM16I9268RqnQkQrIXp5r1
	n9VJbFdfK6REk+J2DTfN8AXkHN1DtvrYBvVGt7EgSadXLSAP+z4KU17obZQ0eqZ+r0Bm
	jmJR5wUIZXMRBYX8JjYhTzXcJwytfhdGmxzB5HwR3skL37Ywkgu/YfZqNt1ApBvGEzt/
	B/Tw==
X-Received: by 10.107.136.69 with SMTP id k66mr9323663iod.111.1440259119939;
	Sat, 22 Aug 2015 08:58:39 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id r8sm8726088ioi.10.2015.08.22.08.58.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Aug 2015 08:58:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Aug 2015 08:58:14 -0700
Message-Id: <1440259095-24566-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
References: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 5/6] psplash: Turn psplash_fb_plot_pixel() into static inline
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
X-List-Received-Date: Sat, 22 Aug 2015 15:58:40 -0000

This function is not used anywhere except psplash-fb.c so make it static
inline function which is portable across compilers

Fixes issues like
psplash-fb.o: In function `psplash_fb_draw_rect':
|
/mnt/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-glibc/work/i586-oe-linux/psplash/0.1+gitAUTOINC+14c8f7b705-r15/git/psplash-fb.c:363:
undefined reference to `psplash_fb_plot_pixel'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Convert-psplash_fb_plot_pixel-to-a-static.patch | 53 ++++++++++++++++++++++
 meta/recipes-core/psplash/psplash_git.bb           |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch

diff --git a/meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch b/meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch
new file mode 100644
index 0000000..93b3c6b
--- /dev/null
+++ b/meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch
@@ -0,0 +1,53 @@
+From 8f5de12cc75bfaa8400adf32f30c015d8f813540 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Aug 2015 07:12:20 -0700
+Subject: [PATCH] psplash-fb: Convert psplash_fb_plot_pixel() to a static
+ inline
+
+This function is not used outside psplash-fb.c and by making it
+static inline we keep the performance and also make it portable across
+multiple compilers and gcc versions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ psplash-fb.c | 2 +-
+ psplash-fb.h | 8 --------
+ 2 files changed, 1 insertion(+), 9 deletions(-)
+
+diff --git a/psplash-fb.c b/psplash-fb.c
+index bd9cd9d..6d235db 100644
+--- a/psplash-fb.c
++++ b/psplash-fb.c
+@@ -260,7 +260,7 @@ psplash_fb_new (int angle)
+ 
+ #define OFFSET(fb,x,y) (((y) * (fb)->stride) + ((x) * ((fb)->bpp >> 3)))
+ 
+-inline void
++static inline void
+ psplash_fb_plot_pixel (PSplashFB    *fb,
+ 		       int          x,
+ 		       int          y,
+diff --git a/psplash-fb.h b/psplash-fb.h
+index 42592ed..c6c3144 100644
+--- a/psplash-fb.h
++++ b/psplash-fb.h
+@@ -57,14 +57,6 @@ psplash_fb_destroy (PSplashFB *fb);
+ PSplashFB*
+ psplash_fb_new (int angle);
+ 
+-inline void
+-psplash_fb_plot_pixel (PSplashFB    *fb, 
+-		       int          x, 
+-		       int          y, 
+-		       uint8        red,
+-		       uint8        green,
+-		       uint8        blue);
+-
+ void
+ psplash_fb_draw_rect (PSplashFB    *fb, 
+ 		      int          x, 
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 7f0dc78..b3b6479 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -10,6 +10,7 @@ PV = "0.1+git${SRCPV}"
 PR = "r15"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
+           file://0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch \
            file://psplash-init \
            ${SPLASH_IMAGES}"
 
-- 
2.1.4


