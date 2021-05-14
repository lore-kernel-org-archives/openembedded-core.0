Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.8296.1620998109122389787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 06:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14EDF7sg031833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 06:15:08 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 14 May 2021 06:15:07 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Fri, 14 May 2021 06:15:07 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21862)
	id D78F6201E0; Fri, 14 May 2021 09:15:06 -0400 (EDT)
From: tony.tascioglu@windriver.com
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [hardknott][PATCH 1/3] libxml2: fix CVE-2021-3517
Date: Fri, 14 May 2021 09:14:48 -0400
Message-ID: <20210514131450.25445-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes heap-based buffer overflow in xmlEncodeEntitiesInternal() in entities.c

CVE: CVE-2021-3517
Upstream-status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../libxml/libxml2/CVE-2021-3517.patch        | 54 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
new file mode 100644
index 0000000000..b6204f655a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
@@ -0,0 +1,54 @@
+From df3de1376585f7a273d70023f92a530395957324 Mon Sep 17 00:00:00 2001
+From: Joel Hockey <joel.hockey@gmail.com>
+Date: Sun, 16 Aug 2020 17:19:35 -0700
+Subject: [PATCH 1/3] Validate UTF8 in xmlEncodeEntities
+
+Code is currently assuming UTF-8 without validating. Truncated UTF-8
+input can cause out-of-bounds array access.
+
+Adds further checks to partial fix in 50f06b3e.
+
+Fixes #178
+
+CVE: CVE-2021-3517
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ entities.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/entities.c b/entities.c
+index d575e9d1..7cdbc4de 100644
+--- a/entities.c
++++ b/entities.c
+@@ -666,11 +666,25 @@ xmlEncodeEntitiesInternal(xmlDocPtr doc, const xmlChar *input, int attr) {
+ 	    } else {
+ 		/*
+ 		 * We assume we have UTF-8 input.
++		 * It must match either:
++		 *   110xxxxx 10xxxxxx
++		 *   1110xxxx 10xxxxxx 10xxxxxx
++		 *   11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
++		 * That is:
++		 *   cur[0] is 11xxxxxx
++		 *   cur[1] is 10xxxxxx
++		 *   cur[2] is 10xxxxxx if cur[0] is 111xxxxx
++		 *   cur[3] is 10xxxxxx if cur[0] is 1111xxxx
++		 *   cur[0] is not 11111xxx
+ 		 */
+ 		char buf[11], *ptr;
+ 		int val = 0, l = 1;
+ 
+-		if (*cur < 0xC0) {
++		if (((cur[0] & 0xC0) != 0xC0) ||
++		    ((cur[1] & 0xC0) != 0x80) ||
++		    (((cur[0] & 0xE0) == 0xE0) && ((cur[2] & 0xC0) != 0x80)) ||
++		    (((cur[0] & 0xF0) == 0xF0) && ((cur[3] & 0xC0) != 0x80)) ||
++		    (((cur[0] & 0xF8) == 0xF8))) {
+ 		    xmlEntitiesErr(XML_CHECK_NOT_UTF8,
+ 			    "xmlEncodeEntities: input not UTF-8");
+ 		    if (doc != NULL)
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 07ae68610c..ad612379b3 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2019-20388.patch \
            file://CVE-2020-24977.patch \
            file://fix-python39.patch \
+           file://CVE-2021-3517.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.29.2

