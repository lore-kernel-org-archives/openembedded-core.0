Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6A86A60721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 09:47:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="1738146"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Dec 2015 17:47:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 664A1409256C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 17:47:07 +0800 (CST)
Received: from localhost.localdomain (10.167.226.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 18 Dec 2015 17:50:22 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Dec 2015 01:08:29 -0800
Message-ID: <1450429709-32736-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.93]
X-yoursite-MailScanner-ID: 664A1409256C.A8EE3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] jpeg: To enable non-JPEG file formats for djpeg/cjpeg command.
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
X-List-Received-Date: Fri, 18 Dec 2015 09:47:29 -0000
Content-Type: text/plain

To fix the error as following when use djpeg/cjpeg command:
Unsupported output file format

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-core/jpeg/jpeg_9a.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/jpeg/jpeg_9a.bb b/meta/recipes-core/jpeg/jpeg_9a.bb
index ea2e65d..092057d 100644
--- a/meta/recipes-core/jpeg/jpeg_9a.bb
+++ b/meta/recipes-core/jpeg/jpeg_9a.bb
@@ -21,6 +21,19 @@ FILES_jpeg-tools = 	"${bindir}/*"
 
 BBCLASSEXTEND = "native"
 
+#To enable non-JPEG(bmp,gif,ppm and targa) file formats for djpeg/cjpeg command
+do_compile_prepend() {
+        echo '#ifdef JPEG_CJPEG_DJPEG '                                   >> jconfig.h
+        echo '#define BMP_SUPPORTED    /* BMP image file format */'       >> jconfig.h
+        echo '#define GIF_SUPPORTED    /* GIF image file format */'       >> jconfig.h
+        echo '#define PPM_SUPPORTED    /* PBMPLUS PPM/PGM image file format */' >> jconfig.h
+        echo '#undef RLE_SUPPORTED     /* Utah RLE image file format */'  >> jconfig.h
+        echo '#define TARGA_SUPPORTED  /* Targa image file format */'     >> jconfig.h
+        echo '#endif /* JPEG_CJPEG_DJPEG */'                              >> jconfig.h
+}
+
+
+
 pkg_postinst_${PN}_linuxstdbase () {
     if [ ! -e $D${libdir}/libjpeg.so.62 ]; then
         JPEG=`find $D${libdir} -type f -name libjpeg.so.\*.\*.\*`
-- 
1.8.4.2




