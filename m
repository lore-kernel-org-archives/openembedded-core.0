Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36941796DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 16:31:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w86GV53m003667
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 09:31:06 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 09:31:05 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 6 Sep 2018 23:52:27 +0800
Message-ID: <9f1abff78caf5b1467ccfa64124c7c6a693f2341.1536248856.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1536248856.git.kai.kang@windriver.com>
References: <cover.1536248856.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] update_gtk_immodules_cache: update for multilib
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
X-List-Received-Date: Thu, 06 Sep 2018 16:31:05 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

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
index 558bc485ad..14ed8d812c 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -90,6 +90,10 @@ do_install () {
 	install -m 0644 ${S}/gtk/gtkfilesystemmodel.h    ${D}${includedir}/gtk-2.0/gtk/
 
 	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-2.0
+
+    # duplicate gtk-query-immodules for post install script update_gtk_immodules_cache
+    mkdir -p ${D}${libexecdir}
+    ln ${D}${bindir}/gtk-query-immodules-2.0 ${D}${libexecdir}/${MLPREFIX}gtk-query-immodules-2.0
 }
 
 SYSROOT_PREPROCESS_FUNCS += "gtk_sysroot_preprocess"
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 420ead2ca2..6331a4323c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -53,6 +53,10 @@ PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,way
 
 do_install_append() {
 	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
+
+    # duplicate gtk-query-immodules for post install script update_gtk_immodules_cache
+    mkdir -p ${D}${libexecdir}
+    ln ${D}${bindir}/gtk-query-immodules-3.0 ${D}${libexecdir}/${MLPREFIX}gtk-query-immodules-3.0
 }
 
 PACKAGES =+ "${PN}-demo"
diff --git a/scripts/postinst-intercepts/update_gtk_immodules_cache b/scripts/postinst-intercepts/update_gtk_immodules_cache
index d85d3622c2..395516971e 100644
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
2.18.0


