Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SMYn4-0002ST-3A
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 07:59:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3O5oJ1A002609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 22:50:19 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 23 Apr 2012 22:50:18 -0700
Message-ID: <fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1335245655.git.xiaofeng.yan@windriver.com>
References: <cover.1335245655.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 24 Apr 2012 11:17:59 +0800
Date: Tue, 24 Apr 2012 13:50:19 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Tue, 24 Apr 2012 05:59:55 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

LSB Test Suite complain "no library libgdk_pixbuf_xlib-2.0.so.0" \
because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
For passing lsb test I add PACKAGECONFIG support to the recipe and \
have poky-lsb turn on the poky-lsb distro for this recipe.

[YOCTO #2284]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index e31f717..33627a3 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -28,9 +28,10 @@ LIBV = "2.10.0"
 EXTRA_OECONF = "\
   --without-libtiff \
   --with-libpng \
-  --without-x11 \
   --disable-introspection \
 "
+PACKAGECONFIG ??= "${@base_contains('DISTRO', 'poky-lsb', 'poky-lsb', '', d)}"
+PACKAGECONFIG[poky-lsb] = "--with-x11,--without-x11,,"
 
 FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
 	${libdir}/lib*.so.*"
-- 
1.7.0.4



