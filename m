Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 41FD06FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 09:58:45 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id AC73938AC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 11:51:59 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 11:51:43 +0200
Message-Id: <1460713909-5823-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1460713909-5823-1-git-send-email-dv@pseudoterminal.org>
References: <1460713909-5823-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 2/8] gstreamer1.0: upgrade to version 1.8.0
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
X-List-Received-Date: Fri, 15 Apr 2016 09:58:48 -0000

The gst-inspect patch no longer applies, and according to upstream, is
not needed.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  2 ++
 .../0001-Fix-crash-with-gst-inspect.patch          | 28 ----------------------
 ...gstreamer1.0_1.6.3.bb => gstreamer1.0_1.8.0.bb} |  5 ++--
 .../gstreamer/gstreamer1.0_git.bb                  |  5 ----
 4 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.6.3.bb => gstreamer1.0_1.8.0.bb} (62%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 10b4668..86ac10c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -24,6 +24,8 @@ PACKAGECONFIG[check] = "--enable-check,--disable-check"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
+PACKAGECONFIG[gst-tracer-hooks] = "--enable-gst-tracer-hooks,--disable-gst-tracer-hooks,"
+PACKAGECONFIG[trace-historic] = "--enable-trace,--disable-trace,"
 
 EXTRA_OECONF = " \
     --disable-dependency-tracking \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
deleted file mode 100644
index 94f5cc5..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6b26f3dbf9bf577d71534ab7410de66d06e46ba2 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Sat, 6 Apr 2013 23:52:11 +0200
-Subject: [PATCH] Fix crash with gst-inspect Chris Lord <chris@openedhand.com>
-
-Upstream-Status: Pending
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- tools/gst-inspect.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/gst-inspect.c b/tools/gst-inspect.c
-index 23b7c44..b79b02e 100644
---- a/tools/gst-inspect.c
-+++ b/tools/gst-inspect.c
-@@ -1556,7 +1556,7 @@ main (int argc, char *argv[])
-   g_option_context_add_main_entries (ctx, options, GETTEXT_PACKAGE);
-   g_option_context_add_group (ctx, gst_init_get_option_group ());
-   if (!g_option_context_parse (ctx, &argc, &argv, &err)) {
--    g_printerr ("Error initializing: %s\n", err->message);
-+    g_printerr ("Error initializing: %s\n", err ? err->message : "(null)");
-     return -1;
-   }
-   g_option_context_free (ctx);
--- 
-1.8.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.0.bb
similarity index 62%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.0.bb
index ba1b83b..7de0832 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.0.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-    file://0001-Fix-crash-with-gst-inspect.patch \
 "
 
-SRC_URI[md5sum] = "b4cdeb2b9cb20dd6ac022a4f417eae0d"
-SRC_URI[sha256sum] = "22f9568d67b87cf700a111f381144bd37cb93790a77e4e331db01fe854a37f24"
+SRC_URI[md5sum] = "6846d7289ec323c38c49b818171e955a"
+SRC_URI[sha256sum] = "947a314a212b5d94985d89b43440dbe66b696e12bbdf9a2f78967b98d74abedc"
 
 S = "${WORKDIR}/gstreamer-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index 7715bb2..f04fc6e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -20,11 +20,6 @@ SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
-# The option to configure tracer hooks was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gstreamer/commit/?id=e5ca47236e4df4683707f0bcf99181a937d358d5
-PACKAGECONFIG[gst-tracer-hooks] = "--enable-gst-tracer-hooks,--disable-gst-tracer-hooks,"
-PACKAGECONFIG[trace-historic] = "--enable-trace,--disable-trace,"
-
 do_configure_prepend() {
 	${S}/autogen.sh --noconfigure
 }
-- 
2.5.0


