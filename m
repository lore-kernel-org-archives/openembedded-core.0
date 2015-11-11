Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id E4CD8771A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 22:21:49 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so42861009pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 14:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RmRuJC6SDn+BztYj9onM6Xnqi6oKgZfjJ/eet6xgPQU=;
	b=NHbayKyXg8tLvILjqkeUZG3eOTMuz7TzZx00NAQYYMqZ2xO520m/XTT2np6L7GOAmR
	OkWTZCtYvIzp8cDZnjXdEK2ndVpKjA+4dPaaaApyJ5QsyolKZT7yTFpEcMZyA0KnyAJt
	gfaKudSHOhCin6aLciR+mOABjGKCMkUuecDR7VImc6Kbh114H1Fyh5UQ9t6RudoNG3K2
	0It+jWlaiWrKyMxO0P98oIj7KVQxWOZEnn00NIYFEnTtOlZUrXKTO64iRaSOT+xeEhg5
	JjsUSRkbuuzC2x++rKQSdUKhrKx9BDMUkntGPGjHB5ZS3uebPyW8dnDrkbBTabANQN0I
	jutw==
X-Received: by 10.68.130.69 with SMTP id oc5mr17765046pbb.140.1447280509706;
	Wed, 11 Nov 2015 14:21:49 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id j5sm641257pbq.74.2015.11.11.14.21.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 14:21:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 14:21:46 -0800
Message-Id: <1447280506-25885-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][jethro][fido][PATCH] libxml2: fix CVE-2015-7942 and CVE-2015-8035
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
X-List-Received-Date: Wed, 11 Nov 2015 22:21:53 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7942 libxml2: heap-based buffer overflow in xmlParseConditionalSections()
CVE-2015-8035 libxml2: DoS when parsing specially crafted XML document if XZ support is enabled

[YOCTO #8641]

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  2 +
 .../libxml/libxml2/CVE-2015-7942.patch             | 55 ++++++++++++++++++++++
 .../libxml/libxml2/CVE-2015-8035.patch             | 41 ++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 1c3c37d..6ada401 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -21,6 +21,8 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://configure.ac-fix-cross-compiling-warning.patch \
            file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
+           file://CVE-2015-7942.patch \
+           file://CVE-2015-8035.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
new file mode 100644
index 0000000..12d5ea3
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
@@ -0,0 +1,55 @@
+libxml2: CVE-2015-7942
+
+From 9b8512337d14c8ddf662fcb98b0135f225a1c489 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Mon, 23 Feb 2015 11:29:20 +0800
+Subject: Cleanup conditional section error handling
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=744980
+
+The error handling of Conditional Section also need to be
+straightened as the structure of the document can't be
+guessed on a failure there and it's better to stop parsing
+as further errors are likely to be irrelevant.
+
+Upstream Status: Backport
+https://git.gnome.org/browse/libxml2/patch/?id=9b8512337d14c8ddf662fcb98b0135f225a1c489
+
+[YOCTO #8641]
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: libxml2-2.9.2/parser.c
+===================================================================
+--- libxml2-2.9.2.orig/parser.c
++++ libxml2-2.9.2/parser.c
+@@ -6783,6 +6783,8 @@ xmlParseConditionalSections(xmlParserCtx
+ 	SKIP_BLANKS;
+ 	if (RAW != '[') {
+ 	    xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
++	    xmlStopParser(ctxt);
++	    return;
+ 	} else {
+ 	    if (ctxt->input->id != id) {
+ 		xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
+@@ -6843,6 +6845,8 @@ xmlParseConditionalSections(xmlParserCtx
+ 	SKIP_BLANKS;
+ 	if (RAW != '[') {
+ 	    xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
++	    xmlStopParser(ctxt);
++	    return;
+ 	} else {
+ 	    if (ctxt->input->id != id) {
+ 		xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
+@@ -6898,6 +6902,8 @@ xmlParseConditionalSections(xmlParserCtx
+ 
+     } else {
+ 	xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID_KEYWORD, NULL);
++	xmlStopParser(ctxt);
++	return;
+     }
+ 
+     if (RAW == 0)
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
new file mode 100644
index 0000000..7d71bb7
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
@@ -0,0 +1,41 @@
+libxml2: CVE-2015-8035
+
+From f0709e3ca8f8947f2d91ed34e92e38a4c23eae63 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Tue, 3 Nov 2015 15:31:25 +0800
+Subject: CVE-2015-8035 Fix XZ compression support loop
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=757466
+DoS when parsing specially crafted XML document if XZ support
+is compiled in (which wasn't the case for 2.9.2 and master since
+Nov 2013, fixed in next commit !)
+
+Upstream Status: Backport
+https://git.gnome.org/browse/libxml2/patch/?id=f0709e3ca8f8947f2d91ed34e92e38a4c23eae63
+
+[YOCTO #8641]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ xzlib.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/xzlib.c b/xzlib.c
+index 0dcb9f4..1fab546 100644
+--- a/xzlib.c
++++ b/xzlib.c
+@@ -581,6 +581,10 @@ xz_decomp(xz_statep state)
+             xz_error(state, LZMA_DATA_ERROR, "compressed data error");
+             return -1;
+         }
++        if (ret == LZMA_PROG_ERROR) {
++            xz_error(state, LZMA_PROG_ERROR, "compression error");
++            return -1;
++        }
+     } while (strm->avail_out && ret != LZMA_STREAM_END);
+ 
+     /* update available output and crc check value */
+-- 
+cgit v0.11.2
+
-- 
2.3.5


