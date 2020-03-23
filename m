Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1004.1585000241304854689
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 14:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02NLoe5h003610
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 14:50:41 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 23 Mar 2020
 14:50:40 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 9BE38900563;
 Mon, 23 Mar 2020 14:50:40 -0700 (PDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] libpng: Fix CVE-2019-6129
Date: Mon, 23 Mar 2020 14:50:34 -0700
Message-ID: <20200323215034.144217-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fix memory leak in png_create_info_struct.

Upstream-Status: Submitted [https://github.com/glennrp/libpng/pull/293]
CVE: CVE-2019-6129

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../libpng/0001-Repair-of-CVE-2019-6129.patch | 28 +++++++++++++++++++
 .../libpng/libpng_1.6.37.bb                   |  5 +++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129.patch

diff --git a/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129.patch b/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129.patch
new file mode 100644
index 0000000000..641e771c17
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129.patch
@@ -0,0 +1,28 @@
+From c8205147753e6684accb73d79f932d0c028fcc80 Mon Sep 17 00:00:00 2001
+From: tangyaofang <tangyaofang6666@163.com>
+Date: Mon, 10 Jun 2019 11:30:15 +0800
+Subject: [PATCH] Repair of CVE-2019-6129
+
+CVE: CVE-2019-6129
+Upstream-Status: Submitted [https://github.com/glennrp/libpng/pull/293]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ contrib/tools/pngcp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/contrib/tools/pngcp.c b/contrib/tools/pngcp.c
+index 16d4e7f4d..a02d5b7ff 100644
+--- a/contrib/tools/pngcp.c
++++ b/contrib/tools/pngcp.c
+@@ -506,7 +506,7 @@ static void
+ display_clean_read(struct display *dp)
+ {
+    if (dp->read_pp != NULL)
+-      png_destroy_read_struct(&dp->read_pp, NULL, NULL);
++      png_destroy_read_struct(&dp->read_pp, (dp->ip!=NULL ? &dp->ip : NULL), NULL);
+ 
+    if (dp->fp != NULL)
+    {
+-- 
+2.20.1
+
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 8c53d11642..f33b942cd7 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -7,7 +7,10 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
+           file://0001-Repair-of-CVE-2019-6129.patch \
+          "
+
 SRC_URI[md5sum] = "015e8e15db1eecde5f2eb9eb5b6e59e9"
 SRC_URI[sha256sum] = "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
 
-- 
2.24.1

