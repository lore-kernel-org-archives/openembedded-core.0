Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 47F0660125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 09:22:17 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Zk7Oz-0001Uk-Kq from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Oct 2015 02:22:17 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 8 Oct 2015 10:22:15 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Oct 2015 14:22:13 +0500
Message-ID: <1444296133-2582-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mesa-demos: fix deadlock in sharedtex_mt
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
X-List-Received-Date: Thu, 08 Oct 2015 09:22:19 -0000
Content-Type: text/plain

This patch fixes a deadlock that occurs between the main
thread and rendering threads of the sharedtex_mt demo.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 ...10-sharedtex_mt-fix-rendering-thread-hang.patch | 43 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-rendering-thread-hang.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-rendering-thread-hang.patch b/meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-rendering-thread-hang.patch
new file mode 100644
index 0000000..1aa893b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-rendering-thread-hang.patch
@@ -0,0 +1,43 @@
+From 525fa9ded72d22b53c5eb366f61e2ac1d407a2db Mon Sep 17 00:00:00 2001
+From: Awais Belal <awais_belal@mentor.com>
+Date: Thu, 8 Oct 2015 13:49:31 +0500
+Subject: [PATCH] sharedtex_mt: fix rendering thread hang
+
+XNextEvent is a blocking call which locks up the display mutex
+this causes the rendering threads to hang when they try call
+glXSwapBuffers() as that tries to take the same mutex in
+underlying calls through XCopyArea().
+So we only go to XNextEvent when it has at least one event
+and we wouldn't lock indefinitely.
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+
+Upstream-Status: Submitted
+---
+ src/xdemos/sharedtex_mt.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/xdemos/sharedtex_mt.c b/src/xdemos/sharedtex_mt.c
+index a90903a..1d503c4 100644
+--- a/src/xdemos/sharedtex_mt.c
++++ b/src/xdemos/sharedtex_mt.c
+@@ -420,9 +420,14 @@ Resize(struct window *h, unsigned int width, unsigned int height)
+ static void
+ EventLoop(void)
+ {
++   int i;
++   XEvent event;
+    while (1) {
+-      int i;
+-      XEvent event;
++      /* Do we have an event? */
++      if (XPending(gDpy) == 0) {
++         usleep(10000);
++         continue;
++      }
+       XNextEvent(gDpy, &event);
+       for (i = 0; i < NumWindows; i++) {
+ 	 struct window *h = &Windows[i];
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
index e451642..0094f55 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
     file://0007-Install-few-more-test-programs.patch \
     file://0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch \
     file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \
+    file://0010-sharedtex_mt-fix-rendering-thread-hang.patch \
 "
 SRC_URI[md5sum] = "72613a2c8c013716db02e3ff59d29061"
 SRC_URI[sha256sum] = "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92"
-- 
1.9.1


