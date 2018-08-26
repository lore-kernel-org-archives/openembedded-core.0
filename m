Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDB47793F8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 13:06:39 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w7QD6dEP002656;
	Sun, 26 Aug 2018 06:06:39 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Sun, 26 Aug 2018 06:06:39 -0700
From: Kai Kang <kai.kang@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun, 26 Aug 2018 06:06:29 -0700
Message-Id: <83275801095fc92101ece399fe3b274705f03e0b.1535288685.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1535288685.git.kai.kang@windriver.com>
References: <cover.1535288685.git.kai.kang@windriver.com>
In-Reply-To: <cover.1535288685.git.kai.kang@windriver.com>
References: <cover.1535288685.git.kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] update_gtk_immodules_cache: update for multilib
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
X-List-Received-Date: Sun, 26 Aug 2018 13:06:40 -0000

Postinstall script update_gtk_immodules_cache calls
${bindir}/gtk-query-immodules-${version}. When multilib is enabled, both
packages foo and lib32-foo call ${bindir}/gtk-query-immodules-${version}
and one of them will fail to run obviously.

Duplicate install files gtk-query-immodules-${version} to ${libexecdir}
with ${MLPREFIX}. And update update_gtk_immodules_cache calls proper
binary.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc                       | 4 ++++
 meta/recipes-gnome/gtk+/gtk+3.inc                      | 4 ++++
 scripts/postinst-intercepts/update_gtk_immodules_cache | 8 ++++----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 558bc485adc..b8f0abb49e1 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -90,6 +90,10 @@ do_install () {
 	install -m 0644 ${S}/gtk/gtkfilesystemmodel.h    ${D}${includedir}/gtk-2.0/gtk/
 
 	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-2.0
+
+    # duplicate gtk-query-immodules for post install script update_gtk_immodules_cache
+    mkdir -p ${D}${libexecdir}
+    cp ${D}${bindir}/gtk-query-immodules-2.0 ${D}${libexecdir}/${MLPREFIX}gtk-query-immodules-2.0
 }
 
 SYSROOT_PREPROCESS_FUNCS += "gtk_sysroot_preprocess"
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 420ead2ca2e..d8242ad5fc0 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -53,6 +53,10 @@ PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,way
 
 do_install_append() {
 	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
+
+    # duplicate gtk-query-immodules for post install script update_gtk_immodules_cache
+    mkdir -p ${D}${libexecdir}
+    cp ${D}${bindir}/gtk-query-immodules-3.0 ${D}${libexecdir}/${MLPREFIX}gtk-query-immodules-3.0
 }
 
 PACKAGES =+ "${PN}-demo"
diff --git a/scripts/postinst-intercepts/update_gtk_immodules_cache b/scripts/postinst-intercepts/update_gtk_immodules_cache
index d85d3622c21..395516971e9 100644
--- a/scripts/postinst-intercepts/update_gtk_immodules_cache
+++ b/scripts/postinst-intercepts/update_gtk_immodules_cache
@@ -2,14 +2,14 @@
 
 set -e
 
-if [ -x $D${bindir}/gtk-query-immodules-2.0 ]; then
-    PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D/${bindir}/gtk-query-immodules-2.0 \
+if [ -x $D${libexecdir}/${binprefix}gtk-query-immodules-2.0 ]; then
+    PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}gtk-query-immodules-2.0 \
         > $D${libdir}/gtk-2.0/2.10.0/immodules.cache &&
         sed -i -e "s:$D::" $D${libdir}/gtk-2.0/2.10.0/immodules.cache
         chown root:root $D${libdir}/gtk-2.0/2.10.0/immodules.cache
 fi
-if [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
-    PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D/${bindir}/gtk-query-immodules-3.0 \
+if [ -x $D${libexecdir}/${binprefix}gtk-query-immodules-3.0 ]; then
+    PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}gtk-query-immodules-3.0 \
         > $D${libdir}/gtk-3.0/3.0.0/immodules.cache &&
         sed -i -e "s:$D::" $D${libdir}/gtk-3.0/3.0.0/immodules.cache
         chown root:root $D${libdir}/gtk-3.0/3.0.0/immodules.cache
-- 
2.11.0


