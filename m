Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1T4u8T-0000Jm-Kd
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 15:41:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7ODT94A001060
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 06:29:09 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Fri, 24 Aug 2012 06:29:08 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2012 21:29:06 +0800
Message-ID: <df19e69901a7d4757923a441f3023e7f96e37115.1345711916.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1345711916.git.jackie.huang@windriver.com>
References: <cover.1345711916.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gdk-pixbuf: call gtk-update-icon-cache with -t in postinstall script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 13:41:18 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

gtk-update-icon-cache is called for each subdir of ${datadir}/icons,
but there are some themes without an index.theme file such as
xcursor-transparent, so add -t(--ignore-theme-index) option to avoid
errors of gtk-update-icon-cache.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index 159bdae..99f6cb4 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
 SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
 SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
 
-PR = "r5"
+PR = "r6"
 
 inherit autotools pkgconfig gettext
 
@@ -65,7 +65,7 @@ GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixbuf-query-l
 if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
     for icondir in /usr/share/icons/*; do
         if [ -d ${icondir} ]; then
-            gtk-update-icon-cache -q ${icondir}
+            gtk-update-icon-cache -t -q ${icondir}
         fi
     done
 fi
-- 
1.7.4



