Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TvjoI-0006Xt-BN
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 08:22:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0H77Rri029831
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 23:07:27 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 16 Jan 2013 23:07:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2013 15:07:19 +0800
Message-ID: <4dc1347ed4057656a542263878aeeadf768dd2e9.1358406049.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358406049.git.hongxu.jia@windriver.com>
References: <cover.1358406049.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Thu, 17 Jan 2013 07:22:51 -0000
Content-Type: text/plain

The gtk_icon_cache_postrm failed at image creation time because ${D} is not
assigned as the prefix of icondir.

[YOCTO #3633]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/gtk-icon-cache.bbclass |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 7c7dd78..4499782 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -32,6 +32,15 @@ done
 }
 
 gtk_icon_cache_postrm() {
+if [ "$D" != "" ]; then
+    for icondir in $D/usr/share/icons/* ; do
+        if [ -d $icondir ] ; then
+            gtk-update-icon-cache -qt  $icondir
+        fi
+    done
+    exit 0
+fi
+
 for icondir in /usr/share/icons/* ; do
     if [ -d $icondir ] ; then
         gtk-update-icon-cache -qt  $icondir
-- 
1.7.10.4



