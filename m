Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RNjdA-0007hj-T7
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 12:14:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA8B7xfF014969
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 03:07:59 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 8 Nov 2011 03:07:59 -0800
Message-ID: <7fe88fd604911f096a522deafaaeda3a93f5f966.1320750179.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1320750179.git.xiaofeng.yan@windriver.com>
References: <cover.1320750179.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 8 Nov 2011 18:51:08 +0800
Date: Tue, 8 Nov 2011 19:16:00 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] pango: Fix bug 1674
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
X-List-Received-Date: Tue, 08 Nov 2011 11:14:24 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #1674]
Support to compile pango based on directfb besides x11.
Add pango-modules because it is needed by gtk+-directfb.
If no pango-modules,  then missing codes will appear on screen when running gtk-demo.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/pango/pango.inc |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index a8e99e2..9237626 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -18,6 +18,11 @@ RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-ba
 
 inherit gnome
 
+# Create a pango-modules package
+ALLOW_EMPTY_${BPN}-modules = "1"
+PACKAGES += "${BPN}-modules"
+RRECOMMENDS_${BPN}-modules =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("pango-module") != -1])}"
+
 EXTRA_AUTORECONF = ""
 
 # seems to go wrong with default cflags
@@ -26,16 +31,17 @@ FULL_OPTIMIZATION_arm = "-O2"
 EXTRA_OECONF = "--disable-glibtest \
 		--enable-explicit-deps=no \
 	        --disable-debug \
-		${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
+		${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)} \
+                ${@base_contains('DISTRO_FEATURES', 'directfb', '--with-x=no', '--with-x=yes', d)}"
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.6.0"
 
 postinst_prologue() {
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
+    if [ "x$D" != "x" ]; then
+	exit 1
+    fi
+    [ ! -d "/etc/pango" ] && mkdir -p /etc/pango/
 }
 
 python populate_packages_prepend () {
-- 
1.7.0.4



