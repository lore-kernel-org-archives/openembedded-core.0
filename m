Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C1EE6D3BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 05:59:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V5xJ1e008780
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 22:59:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 22:59:18 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Oct 2013 14:00:13 +0800
Message-ID: <e6324814743c8e82e240e313501cfcb93b16b366.1383188560.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383188560.git.Qi.Chen@windriver.com>
References: <cover.1383188560.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] jpeg: enable postinst to run at rootfs time successfully
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
X-List-Received-Date: Thu, 31 Oct 2013 05:59:17 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

---
 meta/recipes-core/jpeg/jpeg_8d.bb |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/jpeg/jpeg_8d.bb b/meta/recipes-core/jpeg/jpeg_8d.bb
index eba5bf4..ad4fa51 100644
--- a/meta/recipes-core/jpeg/jpeg_8d.bb
+++ b/meta/recipes-core/jpeg/jpeg_8d.bb
@@ -45,12 +45,8 @@ FILES_jpeg-tools = 	"${bindir}/*"
 BBCLASSEXTEND = "native"
 
 pkg_postinst_${PN}_linuxstdbase () {
-    if [ "$D" = "" ]; then
-        if [ ! -e ${libdir}/libjpeg.so.62 ]; then
-            JPEG=`find ${libdir} -type f -name libjpeg.so.\*.\*.\*`
-            ln -sf `basename $JPEG` ${libdir}/libjpeg.so.62
-        fi
-    else
-        exit 1
+    if [ ! -e $D${libdir}/libjpeg.so.62 ]; then
+        JPEG=`find $D${libdir} -type f -name libjpeg.so.\*.\*.\*`
+        ln -sf `basename $JPEG` $D${libdir}/libjpeg.so.62
     fi
 }
-- 
1.7.9.5


