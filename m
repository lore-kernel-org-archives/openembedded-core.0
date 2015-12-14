Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3C0DD73173
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:24:21 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Dec 2015 13:24:09 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2015 13:24:09 +0100
Message-ID: <1450095853-48305-2-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450095853-48305-1-git-send-email-sona.sarmadi@enea.com>
References: <1450095853-48305-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH][dizzy 2/6] libxml2: CVE-2015-7942
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
X-List-Received-Date: Mon, 14 Dec 2015 12:24:22 -0000
Content-Type: text/plain

Fixes heap-based buffer overflow in xmlParseConditionalSections().

Upstream patch:
https://git.gnome.org/browse/libxml2/commit/
?id=9b8512337d14c8ddf662fcb98b0135f225a1c489

Upstream bug:
https://bugzilla.gnome.org/show_bug.cgi?id=756456

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 .../libxml/libxml2/CVE-2015-7942.patch             | 58 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 840a8eb..15a2421 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -23,6 +23,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://libxml2-CVE-2014-3660.patch \
            file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
+           file://CVE-2015-7942.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
new file mode 100644
index 0000000..738ae94
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
@@ -0,0 +1,58 @@
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
+Fixes CVE-2015-7942.
+Upstream-Status: Backport
+
+Upstream patch:
+https://git.gnome.org/browse/libxml2/commit/
+?id=9b8512337d14c8ddf662fcb98b0135f225a1c489
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ parser.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index bbe97eb..fe603ac 100644
+--- a/parser.c
++++ b/parser.c
+@@ -6770,6 +6770,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
+ 	SKIP_BLANKS;
+ 	if (RAW != '[') {
+ 	    xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
++	    xmlStopParser(ctxt);
++	    return;
+ 	} else {
+ 	    if (ctxt->input->id != id) {
+ 		xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
+@@ -6830,6 +6832,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
+ 	SKIP_BLANKS;
+ 	if (RAW != '[') {
+ 	    xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
++	    xmlStopParser(ctxt);
++	    return;
+ 	} else {
+ 	    if (ctxt->input->id != id) {
+ 		xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
+@@ -6885,6 +6889,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
+ 
+     } else {
+ 	xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID_KEYWORD, NULL);
++	xmlStopParser(ctxt);
++	return;
+     }
+ 
+     if (RAW == 0)
+-- 
+cgit v0.11.2
+
-- 
1.9.1


