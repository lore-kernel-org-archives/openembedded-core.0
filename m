Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.4103.1618475603858054047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 01:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13F8XM50030146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 01:33:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 15 Apr 2021 01:33:22 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 15 Apr 2021 01:33:21 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] groff: not ship /usr/bin/grap2graph
Date: Thu, 15 Apr 2021 16:33:20 +0800
Message-ID: <20210415083320.21266-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

grap2graph which converts a GRAP diagram into a cropped image fails
to run as below:
 $ grap2graph
 /usr/bin/grap2graph: line 89: convert: command not found
 /usr/bin/grap2graph: warning: falling back to old '-crop 0x0' trim method
 /usr/bin/grap2graph: line 104: convert: command not found
 /usr/bin/grap2graph: line 103: grap: command not found

Considering we don't often need to convert a GRAP diagram into
a cropped image and the recipe ImageMagick which provides convert
command is in meta-oe layer, so don't ship the related files to
avoid the confusion about the above run time error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/groff/groff_1.22.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index 983cb9aea6..f0e9eb6a8a 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.22.4.bb
@@ -62,6 +62,10 @@ do_install_append() {
 	rm -rf ${D}${bindir}/glilypond
 	rm -rf ${D}${libdir}/groff/glilypond
 	rm -rf ${D}${mandir}/man1/glilypond*
+
+	# not ship /usr/bin/grap2graph and its releated man files
+	rm -rf ${D}${bindir}/grap2graph
+	rm -rf ${D}${mandir}/man1/grap2graph*
 }
 
 do_install_append_class-native() {
-- 
2.29.2

