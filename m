Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TvpGK-0003iJ-Fp
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 14:12:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0HCuivQ012715
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 04:56:44 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 17 Jan 2013 04:56:44 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2013 20:56:37 +0800
Message-ID: <720b0398453c9072a2b21ff15c71c30e61dc6e76.1358427029.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358427029.git.hongxu.jia@windriver.com>
References: <cover.1358427029.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] gtk-icon-cache.bbclass:fix support postrm at image creation time
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
X-List-Received-Date: Thu, 17 Jan 2013 13:12:43 -0000
Content-Type: text/plain

When use postrm on the build machine, it installs the hook in intercept-scripts
directory and exit 0, the hook will be later invoked and it will properly call
gtk-update-icon-cache.

[YOCTO #3633]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/gtk-icon-cache.bbclass |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 7c7dd78..d5fdcd5 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -32,6 +32,24 @@ done
 }
 
 gtk_icon_cache_postrm() {
+if [ "x$D" != "x" ]; then
+    if [ ! -f $INTERCEPT_DIR/update_icon_cache ]; then
+        cat << "EOF" > $INTERCEPT_DIR/update_icon_cache
+#!/bin/sh
+
+# update native pixbuf loaders
+gdk-pixbuf-query-loaders --update-cache
+
+for icondir in $D/usr/share/icons/*/ ; do
+    if [ -d $icondir ] ; then
+        gtk-update-icon-cache -fqt  $icondir
+    fi
+done
+EOF
+    fi
+    exit 0
+fi
+
 for icondir in /usr/share/icons/* ; do
     if [ -d $icondir ] ; then
         gtk-update-icon-cache -qt  $icondir
-- 
1.7.10.4



