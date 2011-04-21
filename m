Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCsvM-0008V5-Bd
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 14:23:56 +0200
Received: by wwb17 with SMTP id 17so1706059wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 05:21:32 -0700 (PDT)
Received: by 10.227.197.148 with SMTP id ek20mr9232896wbb.203.1303388492305;
	Thu, 21 Apr 2011 05:21:32 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h11sm1161444wbc.9.2011.04.21.05.21.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 05:21:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 14:21:25 +0200
Message-Id: <1303388485-25698-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] librsvg 2.32.1: fix postinst script
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
X-List-Received-Date: Thu, 21 Apr 2011 12:23:56 -0000

The symptom:

root@pandaboard-core:~# sh /var/lib/opkg/info/librsvg-2-gtk.postinst
g_module_open() failed for /home/root/--update-cache: /home/root/--update-cache.so: cannot open shared object file: No such file or directory
root@pandaboard-core:~#

the gdk-pixbuf-query-loaders app doesn't support arguments, only .so names, so remove --update-cache

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index ea9456d..08ac01d 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/utils"
 DEPENDS = "gtk+ libcroco cairo libxml2 popt"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools pkgconfig gnome
 
@@ -43,6 +43,6 @@ if [ "x$D" != "x" ]; then
   exit 1
 fi
 
-test -x ${bindir}/gdk-pixbuf-query-loaders && { GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache ; }
+test -x ${bindir}/gdk-pixbuf-query-loaders && { GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders ; }
 test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q ${datadir}/icons/hicolor
 }
-- 
1.6.6.1



