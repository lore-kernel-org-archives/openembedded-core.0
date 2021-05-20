Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1358.1621547563480894611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 14:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14KLqgsV029999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 14:52:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 20 May 2021 14:52:41 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 20 May 2021 14:52:41 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21862)
	id 3F7E42016B; Thu, 20 May 2021 17:52:41 -0400 (EDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [hardknott][PATCH 2/2] libxml2: Fix CVE-2021-3541
Date: Thu, 20 May 2021 17:45:42 -0400
Message-ID: <20210520214541.19922-2-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520214541.19922-1-tony.tascioglu@windriver.com>
References: <20210520214541.19922-1-tony.tascioglu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upstream commit:
This is related to parameter entities expansion and following
the line of the billion laugh attack. Somehow in that path the
counting of parameters was missed and the normal algorithm based
on entities "density" was useless.

CVE: CVE-2021-3541
Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/8598060bacada41a0eb09d95c97744ff4e428f8e]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../libxml/libxml2/CVE-2021-3541.patch        | 73 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch
new file mode 100644
index 0000000000..3b86278ac4
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch
@@ -0,0 +1,73 @@
+From 8598060bacada41a0eb09d95c97744ff4e428f8e Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Thu, 13 May 2021 14:55:12 +0200
+Subject: [PATCH] Patch for security issue CVE-2021-3541
+
+This is relapted to parameter entities expansion and following
+the line of the billion laugh attack. Somehow in that path the
+counting of parameters was missed and the normal algorithm based
+on entities "density" was useless.
+
+CVE: CVE-2021-3541
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/8598060bacada41a0eb09d95c97744ff4e428f8e]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+
+---
+ parser.c | 26 ++++++++++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index f5e5e169..c9312fa4 100644
+--- a/parser.c
++++ b/parser.c
+@@ -140,6 +140,7 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
+                      xmlEntityPtr ent, size_t replacement)
+ {
+     size_t consumed = 0;
++    int i;
+ 
+     if ((ctxt == NULL) || (ctxt->options & XML_PARSE_HUGE))
+         return (0);
+@@ -177,6 +178,28 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t size,
+ 	    rep = NULL;
+ 	}
+     }
++
++    /*
++     * Prevent entity exponential check, not just replacement while
++     * parsing the DTD
++     * The check is potentially costly so do that only once in a thousand
++     */
++    if ((ctxt->instate == XML_PARSER_DTD) && (ctxt->nbentities > 10000) &&
++        (ctxt->nbentities % 1024 == 0)) {
++	for (i = 0;i < ctxt->inputNr;i++) {
++	    consumed += ctxt->inputTab[i]->consumed +
++	               (ctxt->inputTab[i]->cur - ctxt->inputTab[i]->base);
++	}
++	if (ctxt->nbentities > consumed * XML_PARSER_NON_LINEAR) {
++	    xmlFatalErr(ctxt, XML_ERR_ENTITY_LOOP, NULL);
++	    ctxt->instate = XML_PARSER_EOF;
++	    return (1);
++	}
++	consumed = 0;
++    }
++
++
++
+     if (replacement != 0) {
+ 	if (replacement < XML_MAX_TEXT_LENGTH)
+ 	    return(0);
+@@ -7963,6 +7986,9 @@ xmlParsePEReference(xmlParserCtxtPtr ctxt)
+             xmlChar start[4];
+             xmlCharEncoding enc;
+ 
++	    if (xmlParserEntityCheck(ctxt, 0, entity, 0))
++	        return;
++
+ 	    if ((entity->etype == XML_EXTERNAL_PARAMETER_ENTITY) &&
+ 	        ((ctxt->options & XML_PARSE_NOENT) == 0) &&
+ 		((ctxt->options & XML_PARSE_DTDVALID) == 0) &&
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index a9bff74b55..ce4f9a3340 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2021-3518-0001.patch \
            file://CVE-2021-3518-0002.patch \
            file://CVE-2021-3537.patch \
+           file://CVE-2021-3541.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.29.2

