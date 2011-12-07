Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RYDVj-0004yd-NM
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 10:09:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB7936IA010512
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2011 01:03:06 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 7 Dec 2011 01:03:06 -0800
Message-ID: <7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323246565.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323246565.git.xiaofeng.yan@windriver.com>
References: <cover.1323246565.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 7 Dec 2011 14:08:32 +0800
Date: Wed, 7 Dec 2011 16:58:27 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Wed, 07 Dec 2011 09:09:57 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

gtk run over x11 at current OE-core. If gtk want to run over directfb, then \
the configuration related to x11 should be disabled and directfb should be enabled.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 1d8f4a6..0319916 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -9,9 +9,16 @@ LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SECTION = "libs"
-DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
-           gtk-doc-native docbook-utils-native libxrandr libgcrypt \
-           libxdamage libxrender libxcomposite cairo gdk-pixbuf"
+
+X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
+DEPENDS = "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native \
+ libgcrypt cairo gdk-pixbuf"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+ ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+
+PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
+PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
 
 inherit autotools pkgconfig
 
-- 
1.7.0.4



