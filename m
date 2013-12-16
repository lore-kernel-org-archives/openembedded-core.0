Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 33B3D6E47E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 13:15:06 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so1909871eaj.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 05:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yIObkZ7dSsEn2FDp/8e1DIAfrIdE3FMTW8w6kk9UwVg=;
	b=zTFb720ONyleK9EbiGFrVU/Qxbk6hyNZarkMcL129k7DsMFfI+M5RS7JfTQr+PAqu7
	ma9mOL9n1+oG1UPoTZTao7Z8dvY69n3jUBuv6Ekvnrxh4QOe+b3talCoj3Brcd7R7V18
	HhH2a6CyL/ajZKdrnXpsY3lZryRub4J8+CwhT5L12JatAddbofGC2XvJyFqJCF9xY5Q0
	BBIjyHxOQRQHsSBK2crun3wKRy4io1cXEDnAbnp5i762FNv+JLNKWw1Km8rlYQT3+ulI
	M4NSFJKZ/ASCk5eZlBnpFCs9X5R5CFzLWyDpsz7YJv2vGDp0x/nj4fGLFtqQwFep1QwY
	9eeg==
X-Received: by 10.14.9.131 with SMTP id 3mr16816099eet.45.1387199704919;
	Mon, 16 Dec 2013 05:15:04 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z42sm42144745eeo.17.2013.12.16.05.14.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 05:14:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2013 14:15:25 +0100
Message-Id: <1387199725-19052-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] gtk+: Add PACKAGECONFIG for directfb
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
X-List-Received-Date: Mon, 16 Dec 2013 13:15:06 -0000

* building without x11 doesn't work, because it sets default
  gdkbackend to x11 and then requires cairo-xlib to be available
* checking for CAIRO_BACKEND... no
  configure: error: Package requirements (cairo-xlib >= 1.6) were not met:

  No package 'cairo-xlib' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 73d624c..5bf0bfe 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -14,9 +14,13 @@ X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
  cairo gdk-pixbuf"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+"
 
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
+# without --with-gdktarget=directfb it will check for cairo-xlib which isn't available without X11 DISTRO_FEATURE
+PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
 
 inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache
 
-- 
1.8.4.3


