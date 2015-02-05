Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id B3F5372A6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:20 +0000 (UTC)
Received: by pdbfl12 with SMTP id fl12so8538921pdb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=M08Nr7tCHvmCH4MweJwy+kIUjtfg7S2+IRt3GPRAOj0=;
	b=cYph7FJx/M4jushUrjM06ILd2CoRa++ZVRTkkfjY0UzaIvS4wZmKE5D+pJNZsuwQbN
	m/15NCuvxDokpJ1VeF3IZiVB+Tkapi6Us6iTR/Jc9YOofUtdQEEKcW1T/iH3ht7mD37l
	0bd0M7dgDgTIk9976UExQIPJ6TnJYIG/q75y9eYs35m/RefdoXr8RTpsneLNqdTOB+e2
	xoBjbMfw8DcPvvRAlKNIbammP0+7B73K7+fSHMjEnHJyufDf8ysKs1Q2WcLm+9/p2uAX
	x5yAXApQ0utmSOEy6l0sCMub8yb/AM/n2chjhCBTQXkZrEzNsDJPTNkN1FGrTBvxtcK7
	7lmw==
X-Received: by 10.68.143.193 with SMTP id sg1mr6709061pbb.63.1423152261748;
	Thu, 05 Feb 2015 08:04:21 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:12 -0800
Message-Id: <e4f208ce61d90ff42127e006ae44d58103abcb3f.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 04/61] libxml2: Backport fix for CVE introduced entity issues
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:24 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE fix introduced problems with entity issues, we observed this
when building the Yocto Docs in particular. Backport the fix from
upstream so we can build our docs correctly.

[YOCTO #7134]

(From OE-Core rev: af501bd51f9a86edd34e0405bc32dabe21312229)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch | 30 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.1.bb          |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch

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
diff --git a/meta/recipes-core/libxml/libxml2_2.9.1.bb b/meta/recipes-core/libxml/libxml2_2.9.1.bb
index 0b6ac5d..e087324 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.1.bb
@@ -1,6 +1,7 @@
 require libxml2.inc
 
-SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar"
+SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
+            file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch"
 
 SRC_URI[libtar.md5sum] = "9c0cfef285d5c4a5c80d00904ddab380"
 SRC_URI[libtar.sha256sum] = "fd3c64cb66f2c4ea27e934d275904d92cec494a8e8405613780cbc8a71680fdb"
-- 
1.9.1


