Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SxOWy-00071K-6P
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 22:31:32 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2012 13:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193014127"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2012 13:19:50 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2012 23:19:39 +0300
Message-Id: <b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344022584.git.laurentiu.palcu@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1344022584.git.laurentiu.palcu@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Fri, 03 Aug 2012 20:31:32 -0000

This will improve first boot time because building the icon cache is
done on host, with more processing power than the target.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass |   10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 01fb2f3..2d82c54 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,18 +1,12 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
-DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']}"
+DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+-native"
 
-# This could run on the host as icon cache files are architecture independent,
-# but there is no gtk-update-icon-cache built natively.
 gtk_icon_cache_postinst() {
-if [ "x$D" != "x" ]; then
-        exit 1
-fi
-
 # Update the pixbuf loaders in case they haven't been registered yet
 GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
 
-for icondir in /usr/share/icons/* ; do
+for icondir in $D/usr/share/icons/* ; do
     if [ -d $icondir ] ; then
         gtk-update-icon-cache -fqt  $icondir
     fi
-- 
1.7.9.5



