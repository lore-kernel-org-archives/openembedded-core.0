Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJcW-00043l-0T
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:38:40 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=g0pdZTGH7PGVXiNEFNOv2cI4W+yexS2/K3/dg/wlb5Y=;
	b=mEb3gz5ChDQg5qUEEaWlmRQr4QlTxv9a6qq/Qe64ot0gHpS9VHw1AR3VgI3QJcp3B6
	ia+KMmByaHiYfVmibwrN2BgGuMsRde/+0R31J/sF2RR7Og1ZjD4WX5zn3IEWHcuCYnzQ
	+m5SX1C52YKNmo49IqB7ggF6yUCGglZELXuvA=
Received: by 10.204.138.216 with SMTP id b24mr2368772bku.68.1318505578153;
	Thu, 13 Oct 2011 04:32:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s12sm3284051bkt.4.2011.10.13.04.32.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:32:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:35 +0200
Message-Id: <c2e967a084472198dc4883d2c70b079cc719e2ba.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 17/20] mesa-git: move shared parts from mesa-dri_git to mesa-git.inc and add mesa-xlib_git
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
X-List-Received-Date: Thu, 13 Oct 2011 11:42:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri_git.bb  |   32 +--------------------------
 meta/recipes-graphics/mesa/mesa-git.inc     |   30 +++++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-xlib_git.bb |    4 +++
 3 files changed, 35 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-git.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_git.bb

diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 6a7ab76..7ba3117 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -1,34 +1,4 @@
 include mesa-common.inc
+include mesa-git.inc
 include mesa-dri.inc
-
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://cross2.patch \
-           file://matypes.h"
-#           file://mesa-DRI2Swapbuffer.patch "
-S = "${WORKDIR}/git"
-
-SRCREV = "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
-PV = "7.7+git${SRCPV}"
 PR = "${INC_PR}.0"
-
-PACKAGES =+ "${PN}-xprogs"
-
-FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
-
-do_configure_prepend () {
-    cp ${WORKDIR}/matypes.h ${S}/src/mesa/x86
-    touch ${S}/src/mesa/x86/matypes.h
-}
-
-do_compile () {
-	oe_runmake clean
-	oe_runmake -C src/glsl CC='${BUILD_CC}' CFLAGS=""
-	mv ${S}/src/glsl/apps/compile ${S}/host_compile
-	oe_runmake clean
-	oe_runmake GLSL_CL="${S}/host_compile"
-}
-
-do_install_append () {
-    install -d ${D}/usr/bin
-    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
-}
diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
new file mode 100644
index 0000000..2f27ef1
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -0,0 +1,30 @@
+SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
+           file://cross2.patch \
+           file://matypes.h"
+#           file://mesa-DRI2Swapbuffer.patch "
+S = "${WORKDIR}/git"
+
+SRCREV = "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
+PV = "7.7+git${SRCPV}"
+
+PACKAGES =+ "${PN}-xprogs"
+
+FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
+
+do_configure_prepend () {
+    cp ${WORKDIR}/matypes.h ${S}/src/mesa/x86
+    touch ${S}/src/mesa/x86/matypes.h
+}
+
+do_compile () {
+	oe_runmake clean
+	oe_runmake -C src/glsl CC='${BUILD_CC}' CFLAGS=""
+	mv ${S}/src/glsl/apps/compile ${S}/host_compile
+	oe_runmake clean
+	oe_runmake GLSL_CL="${S}/host_compile"
+}
+
+do_install_append () {
+    install -d ${D}/usr/bin
+    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
+}
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_git.bb b/meta/recipes-graphics/mesa/mesa-xlib_git.bb
new file mode 100644
index 0000000..7f827a7
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-xlib_git.bb
@@ -0,0 +1,4 @@
+include mesa-common.inc
+include mesa-git.inc
+include mesa-xlib.inc
+PR = "${INC_PR}.0"
-- 
1.7.7



