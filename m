Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.8492.1620998110737764018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 06:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14EDFAaZ031836
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 06:15:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 14 May 2021 06:15:10 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Fri, 14 May 2021 06:15:09 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21862)
	id A3466201E0; Fri, 14 May 2021 09:15:09 -0400 (EDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [hardknott][PATCH 2/3] libxml2: fix CVE-2021-3516
Date: Fri, 14 May 2021 09:14:49 -0400
Message-ID: <20210514131450.25445-2-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210514131450.25445-1-tony.tascioglu@windriver.com>
References: <20210514131450.25445-1-tony.tascioglu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes use-after-free in xmlEncodeEntitiesInternal() in entities.c

CVE: CVE-2021-3516
Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1358d157d0bd83be1dfe356a69213df9fac0b539]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../libxml/libxml2/CVE-2021-3516.patch        | 36 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch
new file mode 100644
index 0000000000..287a171924
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3516.patch
@@ -0,0 +1,36 @@
+From b76718876953e11bbd73dc6c9457323fd5aeda2e Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 21 Apr 2021 13:23:27 +0200
+Subject: [PATCH 2/3] Fix use-after-free with `xmllint --html --push`
+
+Call htmlCtxtUseOptions to make sure that names aren't stored in
+dictionaries.
+
+Note that this issue only affects xmllint using the HTML push parser.
+
+Fixes #230.
+
+CVE: CVE-2021-3516
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1358d157d0bd83be1dfe356a69213df9fac0b539]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ xmllint.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xmllint.c b/xmllint.c
+index c0712674..ba66676b 100644
+--- a/xmllint.c
++++ b/xmllint.c
+@@ -2204,7 +2204,7 @@ static void parseAndPrintFile(char *filename, xmlParserCtxtPtr rectxt) {
+             if (res > 0) {
+                 ctxt = htmlCreatePushParserCtxt(NULL, NULL,
+                             chars, res, filename, XML_CHAR_ENCODING_NONE);
+-                xmlCtxtUseOptions(ctxt, options);
++                htmlCtxtUseOptions(ctxt, options);
+                 while ((res = fread(chars, 1, pushsize, f)) > 0) {
+                     htmlParseChunk(ctxt, chars, res, 0);
+                 }
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index ad612379b3..6f1229c2d0 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2020-24977.patch \
            file://fix-python39.patch \
            file://CVE-2021-3517.patch \
+           file://CVE-2021-3516.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.29.2

