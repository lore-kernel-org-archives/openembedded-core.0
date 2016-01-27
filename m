Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 254DE76BD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 23:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0RNTc7b023310; Wed, 27 Jan 2016 23:29:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M5CxuyHFUOSX; Wed, 27 Jan 2016 23:29:38 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0RNTaKJ023305
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 Jan 2016 23:29:37 GMT
Message-ID: <1453937376.10340.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jan 2016 23:29:36 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Witt, Randy E" <randy.e.witt@intel.com>
Subject: [PATCH] gtk-icon-utils-native: Drop problematic dependency
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
X-List-Received-Date: Wed, 27 Jan 2016 23:29:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The setscene [depends] support is nasty with hidden side effects, in
particular hardcoding that the items mentioned basically always get
installed from sstate. Installing librsvg-native ends up pulling
in qemu-native and all kinds of things we don't want.

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=e384d9ba0c4a3335575a766a82ed79201d794b11
was meant to resolve the reasons this dependency was present and
I suspect I simply forgot to remove it at the time. Remove it now
for much better sstate usage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.6.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.6.bb
index 7882bb4..d4a169a 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.6.bb
@@ -58,6 +58,3 @@ do_install() {
 	create_wrapper ${D}/${bindir}/gtk-encode-symbolic-svg \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
 }
-
-# Prevent bitbake from optimizing away the native librsvg sysroot population
-do_populate_sysroot_setscene[depends] += "librsvg-native:do_populate_sysroot_setscene"



