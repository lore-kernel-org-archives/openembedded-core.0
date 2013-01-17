Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TvpGO-0003iP-77
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 14:12:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0HCumnn006576
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 04:56:49 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 17 Jan 2013 04:56:48 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2013 20:56:40 +0800
Message-ID: <e32c29fce3b22061311ae40aa9e9456af3dd64ee.1358427029.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358427029.git.hongxu.jia@windriver.com>
References: <cover.1358427029.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gtk-immodules-cache.bbclass:fix support postrm at image creation time
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
X-List-Received-Date: Thu, 17 Jan 2013 13:12:43 -0000
Content-Type: text/plain

Let postrm use the same logic as the postinst to run on both build machine
and target

[YOCTO #3633]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/gtk-immodules-cache.bbclass |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 9ffb03b..a8855af 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -31,7 +31,18 @@ fi
 
 gtk_immodule_cache_postrm() {
 if [ "x$D" != "x" ]; then
-    exit 1
+    for maj_ver in 2 3; do
+        if [ -x $D${bindir}/gtk-query-immodules-$maj_ver.0 ]; then
+            IMFILES=$(ls $D${libdir}/gtk-$maj_ver.0/*/immodules/*.so)
+            ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-$maj_ver.0')} \
+                $IMFILES > $D/etc/gtk-$maj_ver.0/gtk.immodules 2>/dev/null &&
+                sed -i -e "s:$D::" $D/etc/gtk-$maj_ver.0/gtk.immodules
+
+            [ $? -ne 0 ] && exit 1
+        fi
+    done
+
+    exit 0
 fi
 if [ ! -z `which gtk-query-immodules-2.0` ]; then
     gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
-- 
1.7.10.4



