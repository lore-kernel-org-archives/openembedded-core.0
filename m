Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0755871637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 09:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0F9bSl4032187 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 09:37:28 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id caFhTiio_5Rl
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 09:37:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0F9bGvw032173
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 09:37:27 GMT
Message-ID: <1421314636.31262.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jan 2015 09:37:16 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libxml2: Backport fix for CVE introduced entity issues
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
X-List-Received-Date: Thu, 15 Jan 2015 09:37:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The CVE fix introduced problems with entity issues, we observed this
when building the Yocto Docs in particular. Backport the fix from
upstream so we can build our docs correctly.

[YOCTO #7134]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch b/meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
new file mode 100644
index 0000000..10a8112
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
@@ -0,0 +1,30 @@
+From 72a46a519ce7326d9a00f0b6a7f2a8e958cd1675 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Thu, 23 Oct 2014 11:35:36 +0800
+Subject: Fix missing entities after CVE-2014-3660 fix
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=738805
+
+The fix for CVE-2014-3660 introduced a regression in some case
+where entity substitution is required and the entity is used
+first in anotther entity referenced from an attribute value
+
+Upstream-Status: Backport
+
+diff --git a/parser.c b/parser.c
+index 67c9dfd..a8d1b67 100644
+--- a/parser.c
++++ b/parser.c
+@@ -7235,7 +7235,8 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
+      * far more secure as the parser will only process data coming from
+      * the document entity by default.
+      */
+-    if ((ent->checked == 0) &&
++    if (((ent->checked == 0) ||
++         ((ent->children == NULL) && (ctxt->options & XML_PARSE_NOENT))) &&
+         ((ent->etype != XML_EXTERNAL_GENERAL_PARSED_ENTITY) ||
+          (ctxt->options & (XML_PARSE_NOENT | XML_PARSE_DTDVALID)))) {
+ 	unsigned long oldnbent = ctxt->nbentities;
+-- 
+cgit v0.10.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.2.bb b/meta/recipes-core/libxml/libxml2_2.9.2.bb
index f0cfa59..1affff1 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.2.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.2.bb
@@ -1,6 +1,7 @@
 require libxml2.inc
 
-SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar"
+SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
+            file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch"
 
 SRC_URI[libtar.md5sum] = "9e6a9aca9d155737868b3dc5fd82f788"
 SRC_URI[libtar.sha256sum] = "5178c30b151d044aefb1b08bf54c3003a0ac55c59c866763997529d60770d5bc"



