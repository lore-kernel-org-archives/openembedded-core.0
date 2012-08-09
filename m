Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1SzIhb-0000Qo-Rn
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 04:42:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q792UYWQ022052
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 19:30:35 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 8 Aug 2012 19:30:34 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Aug 2012 10:30:30 +0800
Message-ID: <fe6bc6ae795704c38559f30e7feb9b694363ab49.1344479229.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1344479229.git.jackie.huang@windriver.com>
References: <cover.1344479229.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Thu, 09 Aug 2012 02:42:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

If gtk+ is added to core-image-minimal, postinstall script failed on boot:

Running postinst /etc/rpm-postinsts/104...
gtk-update-icon-cache: No theme index file.
ERROR: postinst /etc/rpm-postinsts/104 failed.

This patch fixed the postinstall script to check for the icon
file first and not run the gtk-update-icon-cache if no icon
is installed.

[YOCTO #2905]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index 484fb12..159bdae 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
 SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
 SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
 
-PR = "r4"
+PR = "r5"
 
 inherit autotools pkgconfig gettext
 
@@ -62,7 +62,13 @@ fi
 
 GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixbuf-query-loaders --update-cache
 
-test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q ${datadir}/icons/hicolor
+if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
+    for icondir in /usr/share/icons/*; do
+        if [ -d ${icondir} ]; then
+            gtk-update-icon-cache -q ${icondir}
+        fi
+    done
+fi
 }
 
 PACKAGES_DYNAMIC += "gdk-pixbuf-loader-*"
-- 
1.7.4



