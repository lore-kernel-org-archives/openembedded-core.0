Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWNp-00059S-69
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:32:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2011 23:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="682838300"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2011 23:29:31 -0700
Message-Id: <4293b36a2a54d68bdef73d2b057b2ab8ef95c6ec.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 20:18:30 +0200
Date: Fri, 22 Apr 2011 23:29:31 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 36/37] librsvg 2.32.1: fix postinst script
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
X-List-Received-Date: Sat, 23 Apr 2011 06:32:00 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

The symptom:

root@pandaboard-core:~# sh /var/lib/opkg/info/librsvg-2-gtk.postinst
g_module_open() failed for /home/root/--update-cache: /home/root/--update-cache.so: cannot open shared object file: No such file or directory
root@pandaboard-core:~#

the gdk-pixbuf-query-loaders app doesn't support arguments, only .so names, so remove --update-cache

Also being fixed:

* loader libdir
* redirect output to /etc/gtk-2.0/gdk-pixbuf.loaders

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index ea9456d..56c8800 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/utils"
 DEPENDS = "gtk+ libcroco cairo libxml2 popt"
 
-PR = "r0"
+PR = "r2"
 
 inherit autotools pkgconfig gnome
 
@@ -43,6 +43,12 @@ if [ "x$D" != "x" ]; then
   exit 1
 fi
 
-test -x ${bindir}/gdk-pixbuf-query-loaders && { GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache ; }
+if [ -d ${libdir}/gtk-2.0/2.10.0/loaders ] ; then
+	export GDK_PIXBUF_MODULEDIR=${libdir}/gtk-2.0/2.10.0/loaders
+else
+	export GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
+fi
+
+test -x ${bindir}/gdk-pixbuf-query-loaders && gdk-pixbuf-query-loaders > ${sysconfdir}/gtk-2.0/gdk-pixbuf.loaders
 test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q ${datadir}/icons/hicolor
 }
-- 
1.7.1.1



