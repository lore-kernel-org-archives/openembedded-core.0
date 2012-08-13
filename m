Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T105J-0001rl-V5
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:13:54 +0200
Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 12:01:58 -0700
Received: by wibhq12 with SMTP id hq12so3256225wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 12:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=tkMdHwaOvkV7YBdO37xdO1xRO5pi5JU3tJZwtk9HGW4=;
	b=gkwcdNwKFgJLrayhgRfG2AFalrZg9ir89XRJ/QkGs0s3nQqSceJN3quimmDsb8EKlY
	STEVtPxZhlcfyMmGdw1ALay5gW5uFu8efw9PcQt83GfuZvP2eqoRv7Pws0+YkpBcKCcW
	pfuAH7X+uRKCg+bLCXDAPcvuljPdSpCp0xVC5luluPN+d9vq4x0nXfLZmRmodis6J7Pp
	vDHJwNeJtnwdObKVDCvK85ZXfceBhaOyzQCW5SBRpxsKX3aAZMT8eLTGR7R3MKvBXO3F
	v9ZGvc6edm8qA0tSbNZI9T0FBc3w+mq6Nsklbq4NtXB3vo3noNNVzWW+A/GEFAhywjhj
	oFLQ==
Received: by 10.180.100.131 with SMTP id ey3mr20732960wib.15.1344884517010;
	Mon, 13 Aug 2012 12:01:57 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm26044104wix.5.2012.08.13.12.01.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 12:01:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 20:01:22 +0100
Message-Id: <a88832e2bcd92db5c763c534a543875bc008054f.1344884443.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1344884443.git.ross.burton@intel.com>
References: <cover.1344884443.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884443.git.ross.burton@intel.com>
References: <cover.1344884443.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQln5xafhRTiuDbQJGM8UqmugLiljQhppuPimZ7crH0cozSoxW+xYLj9sWiguhp43wNqxo6Y
Subject: [PATCH 1/2] owl-video: patches pushed upstream, so bump srcrev
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
X-List-Received-Date: Mon, 13 Aug 2012 19:13:54 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../owl-video/gtk_multithread_safe.patch           |   40 --------------------
 .../owl-video-widget/owl-video/make-382.patch      |   17 ---------
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    8 ++--
 3 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/make-382.patch

diff --git a/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch b/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
deleted file mode 100644
index 437f72b..0000000
--- a/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Use gdk_threads_enter/gdk_threads_leave to ensure gtk multithread safe
-
-If the video player tries to play an unknown type file, it will enter
-the error_cb() function, which is called in another thread.
-Use gdk_threads_enter/gdk_threads_leave to ensure the safe of gtk
-multi-thread operation.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Pending
-
-diff -ruN video-orig/src/video.c video/src/video.c
---- video-orig/src/video.c	2010-10-15 16:07:26.522346398 +0800
-+++ video/src/video.c	2010-10-15 16:25:51.780296717 +0800
-@@ -96,6 +96,7 @@
- {
-         GtkWidget *dialog;
- 
-+        gdk_threads_enter();
-         dialog = gtk_message_dialog_new (data->window,
-                                          GTK_DIALOG_NO_SEPARATOR,
-                                          GTK_MESSAGE_ERROR,
-@@ -103,6 +104,7 @@
-                                          error->message);
-         gtk_dialog_run (GTK_DIALOG (dialog));
-         gtk_widget_destroy (dialog);
-+        gdk_threads_leave();
- }
- 
- /**
-@@ -606,7 +608,9 @@
-         
-         gtk_widget_show_all (GTK_WIDGET (data->window));
- 
-+        gdk_threads_enter();
-         gtk_main ();
-+        gdk_threads_leave();
- 
-         /**
-          * Cleanup.
diff --git a/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch b/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch
deleted file mode 100644
index d219c31..0000000
--- a/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Make 3.82 is much stricter and demands tabs. Obey.
-
-JL - 15/12/10
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: video/Makefile.am
-===================================================================
---- video.orig/Makefile.am
-+++ video/Makefile.am
-@@ -4,5 +4,5 @@ SUBDIRS = src
- MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp intltool-extract intltool-merge intltool-update install-sh ltmain.sh Makefile.in missing
- 
- snapshot:
--        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
-+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
- 
diff --git a/meta/recipes-sato/owl-video-widget/owl-video_git.bb b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
index bc63273..ae08383 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video_git.bb
+++ b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
@@ -8,22 +8,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ac14b7ca45afea5af040da54db270eb0 \
 SECTION = "x11"
 DEPENDS = "libowl-av"
 
-SRCREV = "f133472318970796fae1ea3e98ac062156768baf"
+SRCREV = "07ab48f331a5e6e0d169e4892c7eb1fc22dc0b9d"
 PV = "0.1+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://gtk_multithread_safe.patch \
            file://owl-video-widget.png \
            file://stock_media-play.png \
            file://stock_volume-0.png \
            file://stock_volume-min.png \
            file://stock_volume-med.png \
            file://stock_volume-max.png \
-           file://owl-video-widget.desktop \
-	   file://make-382.patch"
+           file://owl-video-widget.desktop"
 
 inherit autotools pkgconfig
 
-- 
1.7.10



