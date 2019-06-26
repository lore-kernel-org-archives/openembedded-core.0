Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 72D767E6D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 07:16:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5Q7GWRW010416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 00:16:32 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Wed, 26 Jun 2019 00:16:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2019 15:40:23 +0800
Message-ID: <23191288438c369f51eb0496a8b79bdb019769cf.1561534279.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561534279.git.liezhi.yang@windriver.com>
References: <cover.1561534279.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3 3/3] gtk-icon-cache.bbclass: Depends on gtk+3
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
X-List-Received-Date: Wed, 26 Jun 2019 07:16:31 -0000
Content-Type: text/plain

The gtk-update-icon-cache is provided by gtk+3, gdk-pixbuf-query-loaders is
provided by gdk-pixbuf, and gtk+3 depends on gdk-pixbuf, so depends on gtk+3
can fix the problems.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/gtk-icon-cache.bbclass | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 66fe781..4e60fe6 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -4,6 +4,11 @@ DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk
 
 PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
 
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+DEPENDS += "gtk+3"
+
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
@@ -45,10 +50,11 @@ python populate_packages_append () {
         if not os.path.exists(icon_dir):
             continue
 
-        bb.note("adding hicolor-icon-theme dependency to %s" % pkg)
-        rdepends = ' ' + d.getVar('MLPREFIX', False) + "hicolor-icon-theme"
-        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
-    
+        for dep in ('hicolor-icon-theme', 'gtk+3'):
+            bb.note("Adding %s dependency to %s" % (dep, pkg))
+            rdepends = ' ' + d.getVar('MLPREFIX', False) + dep
+            d.appendVar('RDEPENDS_%s' % pkg, rdepends)
+
         bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
         
         postinst = d.getVar('pkg_postinst_%s' % pkg)
-- 
2.7.4


