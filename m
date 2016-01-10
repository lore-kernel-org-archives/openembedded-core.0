Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 363677422C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:31:14 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n128so2203433pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=MhdKXRWAxv6JWeEHfBZALYmm3FHGaeyjOYI50g10Vrs=;
	b=UBm1mEPomjAYuuKTSykSMXb9MFip9rcaViJElS+BNXEZDZvC2JbU2p7mx2SgD/M1dR
	XT0bMtRpjPJRJA/lo83ytfeWLm6LcDm8feB2PP1WyP/lHtli+XDhQ3/HyokY+bLHNVoH
	fm8boARkWex3e6az8Od2jTd/kvWEsYvP/COI94WLh74kx7GtABgRhUEk4EimGnosna/H
	T5PMLe5FS/7qWgEc9btEmkUfPd2ydSQdq8KHjYvVv1LmgzkooP9Reiz/5K3RYzlOaNUN
	c57zVnEqLUmfXCXAgxWKX8mDBnQMaZGIpRlKF7fip49cjb7bX1nejzbHp8LxcrRH2FWI
	fVtA==
X-Received: by 10.98.74.194 with SMTP id c63mr15655456pfj.25.1452385875284;
	Sat, 09 Jan 2016 16:31:15 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q89sm13692159pfa.70.2016.01.09.16.31.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:31:10 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 16B27FCC848; Sat,  9 Jan 2016 16:30:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:39 -0800
Message-Id: <19b190bb5b79296fcfead0b50389fba6381c33fa.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 13/20] libxml2: CVE-2015-7942
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:14 -0000

From: Sona Sarmadi <sona.sarmadi@enea.com>

Fixes heap-based buffer overflow in xmlParseConditionalSections().

Upstream patch:
https://git.gnome.org/browse/libxml2/commit/
?id=9b8512337d14c8ddf662fcb98b0135f225a1c489

Upstream bug:
https://bugzilla.gnome.org/show_bug.cgi?id=756456

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Tudor Florea <tudor.florea@enea.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


