Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CCECE7E828
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 07:53:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5K7rEps009003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 00:53:14 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 00:53:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2019 16:15:26 +0800
Message-ID: <b7589dd06670ead7a2ca7e8c7301b289e2543249.1561018476.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561018476.git.liezhi.yang@windriver.com>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gtk-icon-cache.bbclass: Depends on gtk+3
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
X-List-Received-Date: Thu, 20 Jun 2019 07:53:14 -0000
Content-Type: text/plain

The gtk-update-icon-cache and gdk-pixbuf-query-loaders are provided by gtk+3.

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


