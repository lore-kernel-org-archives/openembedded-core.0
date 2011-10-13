Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJbz-00043l-Kv
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:38:07 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yRJrwwP1FpiphCX1BOT9875Swg3XNibOTUsLuQWN1OE=;
	b=DqlhBSsep8gZI7r1IouQ7DbQJexWenUq5Iz7NWajA2cktee19dpnhsMJa5sW0xIYC2
	Pk8H6PQS8S+dWxAxiKorZQ+V99u7b+GDgD+FfjJeVwYvedgJr8DEu4JrpqEhsNpnE4PW
	/g73QrCLXEIhyFSxE5Fbsd5JlBWrLJ/78rZzs=
Received: by 10.204.133.71 with SMTP id e7mr2404294bkt.50.1318505546147;
	Thu, 13 Oct 2011 04:32:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm3279682bkw.5.2011.10.13.04.32.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:32:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:31 +0200
Message-Id: <68623a9b9e77eda71aa6c6921cb1c486f8a5101f.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 13/20] mesa-dri: move shared options to mesa-dri.inc
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
X-List-Received-Date: Thu, 13 Oct 2011 11:42:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri.inc     |   20 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb |   22 ++--------------------
 meta/recipes-graphics/mesa/mesa-dri_git.bb  |   19 +------------------
 3 files changed, 23 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri.inc

diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
new file mode 100644
index 0000000..603438e
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -0,0 +1,20 @@
+PROTO_DEPS += "dri2proto"
+LIB_DEPS += "libdrm expat"
+
+# most of our targets do not have DRI so will use mesa-xlib
+DEFAULT_PREFERENCE = "-1"
+
+EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers"
+
+python populate_packages_prepend() {
+	import os.path
+
+	dri_drivers_root = os.path.join(bb.data.getVar('libdir', d, 1), "dri")
+
+	do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
+}
+
+PACKAGES_DYNAMIC = "mesa-dri-driver-*"
+
+FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
+
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index 8ab1941..2cb2e05 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -1,28 +1,10 @@
 include mesa-common.inc
 include mesa-${PV}.inc
-
-PROTO_DEPS += "dri2proto"
-LIB_DEPS += "libdrm expat"
-
+include mesa-dri.inc
 PR = "${INC_PR}.0"
 
-# most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
-
 LEAD_SONAME = "libGL.so.1"
 
-EXTRA_OECONF += "--with-driver=dri --disable-egl -with-dri-drivers=swrast,i915,i965 --without-gallium-drivers"
-
-python populate_packages_prepend() {
-	import os.path
-
-	dri_drivers_root = os.path.join(bb.data.getVar('libdir', d, 1), "dri")
-
-	do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
-}
+EXTRA_OECONF += "--with-dri-drivers=swrast,i915,i965"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-
-PACKAGES_DYNAMIC = "mesa-dri-driver-*"
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 10ebd1c..aaa3073 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -1,4 +1,5 @@
 include mesa-common.inc
+include mesa-dri.inc
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://cross2.patch \
@@ -6,26 +7,16 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
 #           file://mesa-DRI2Swapbuffer.patch "
 S = "${WORKDIR}/git"
 
-PROTO_DEPS += "dri2proto"
-LIB_DEPS += "libdrm expat"
-
 SRCREV = "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
 PV = "7.7+git${SRCPV}"
 PR = "${INC_PR}.0"
 
-# most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
-
 PACKAGES =+ "${PN}-xprogs"
-PACKAGES_DYNAMIC = "mesa-dri-driver-*"
 
-FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
 
 LEAD_SONAME = "libGL.so.1"
 
-EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium"
-
 do_configure_prepend () {
     cp ${WORKDIR}/matypes.h ${S}/src/mesa/x86
     touch ${S}/src/mesa/x86/matypes.h
@@ -44,12 +35,4 @@ do_install_append () {
     install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
 }
 
-python populate_packages_prepend() {
-	import os.path
-
-	dri_drivers_root = os.path.join(bb.data.getVar('libdir', d, 1), "dri")
-
-	do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
-}
-
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-- 
1.7.7



