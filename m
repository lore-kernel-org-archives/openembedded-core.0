Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.8298.1620998113174333306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 06:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14EDFC19031839
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 06:15:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 14 May 2021 06:15:12 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Fri, 14 May 2021 06:15:12 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21862)
	id 1B3E0201E0; Fri, 14 May 2021 09:15:12 -0400 (EDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [hardknott][PATCH 3/3] libxml2: fix CVE-2021-3537
Date: Fri, 14 May 2021 09:14:50 -0400
Message-ID: <20210514131450.25445-3-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210514131450.25445-1-tony.tascioglu@windriver.com>
References: <20210514131450.25445-1-tony.tascioglu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Parsing specially crafted Mixed Content while parsing XML data may
lead to invalid data structure being created, as errors were not
propagated. This could lead to several NULL Pointer Dereference when
post-validating documents parsed in recovery mode.

CVE: CVE-2021-3537
Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/babe75030c7f64a37826bb3342317134568bef61]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../libxml/libxml2/CVE-2021-3537.patch        | 49 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch
new file mode 100644
index 0000000000..defbe7867b
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch
@@ -0,0 +1,49 @@
+From 5ae9c39401f679648301efa6d2d35e09cc376462 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 1 May 2021 16:53:33 +0200
+Subject: [PATCH 3/3] Propagate error in xmlParseElementChildrenContentDeclPriv
+
+Check return value of recursive calls to
+xmlParseElementChildrenContentDeclPriv and return immediately in case
+of errors. Otherwise, struct xmlElementContent could contain unexpected
+null pointers, leading to a null deref when post-validating documents
+which aren't well-formed and parsed in recovery mode.
+
+Fixes #243.
+
+CVE: CVE-2021-3537
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/babe75030c7f64a37826bb3342317134568bef61]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ parser.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index a34bb6cd..bbcff39f 100644
+--- a/parser.c
++++ b/parser.c
+@@ -6195,6 +6195,8 @@ xmlParseElementChildrenContentDeclPriv(xmlParserCtxtPtr ctxt, int inputchk,
+ 	SKIP_BLANKS;
+         cur = ret = xmlParseElementChildrenContentDeclPriv(ctxt, inputid,
+                                                            depth + 1);
++        if (cur == NULL)
++            return(NULL);
+ 	SKIP_BLANKS;
+ 	GROW;
+     } else {
+@@ -6328,6 +6330,11 @@ xmlParseElementChildrenContentDeclPriv(xmlParserCtxtPtr ctxt, int inputchk,
+ 	    SKIP_BLANKS;
+ 	    last = xmlParseElementChildrenContentDeclPriv(ctxt, inputid,
+                                                           depth + 1);
++            if (last == NULL) {
++		if (ret != NULL)
++		    xmlFreeDocElementContent(ctxt->myDoc, ret);
++		return(NULL);
++            }
+ 	    SKIP_BLANKS;
+ 	} else {
+ 	    elem = xmlParseName(ctxt);
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 6f1229c2d0..b850164285 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://fix-python39.patch \
            file://CVE-2021-3517.patch \
            file://CVE-2021-3516.patch \
+           file://CVE-2021-3537.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.29.2

