Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A33C433EF
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 19:33:52 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web09.37896.1643657629676996416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 11:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=WdRF6yY/;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172,
 mailfrom: crg7475@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JndXV1f63z9sQX
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 20:33:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1643657625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1s75qefEDMqmEpAdDSEuCJ0xNsnKhq9akSzCdTD5C0s=;
	b=WdRF6yY/K69pkdW9wXxoztL6nYLDvxEl/+1+lmLIzr/UXxVOYfE4c7htBzOGe64da3GggD
	XE9561ko7uzu5xgeQaN5d0PbiViOHBeKQ06UowLz7TFeikF+WNsjfjbRxXtlPMpiOIscJ2
	UVs99dOXkRCVUX5Fa1KkGil/OlOC0bBOkyMbqPK+FhIhBiljRW1tscXwCyECMOhgZuml3f
	STyrDsFbq976TeEzqAwfGhbfTk8UedOAu8Xcjx68RKcSD/oGllTwqL7SdC0S0oTAi1WhdZ
	iatrVWTh1yZCukvSSJ3xDlp8HdLyxJrMIEwDYyQMzfKNuKyV4c49JwfdcwgUZQ==
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libxml2: Backport python3-lxml workaround patch
Date: Mon, 31 Jan 2022 20:33:37 +0100
Message-Id: <20220131193337.243960-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 19:33:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161135

This is a workaround for the following issue that affects python3-lxml:

https://gitlab.gnome.org/GNOME/libxml2/-/issues/255

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../0002-Work-around-lxml-API-abuse.patch     | 213 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.12.bb    |   1 +
 2 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0002-Work-around-lxm=
l-API-abuse.patch

diff --git a/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-a=
buse.patch b/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-a=
buse.patch
new file mode 100644
index 0000000000..f09ce9707a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.pa=
tch
@@ -0,0 +1,213 @@
+From 85b1792e37b131e7a51af98a37f92472e8de5f3f Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 18 May 2021 20:08:28 +0200
+Subject: [PATCH] Work around lxml API abuse
+
+Make xmlNodeDumpOutput and htmlNodeDumpFormatOutput work with corrupted
+parent pointers. This used to work with the old recursive code but the
+non-recursive rewrite required parent pointers to be set correctly.
+
+Unfortunately, lxml relies on the old behavior and passes subtrees with
+a corrupted structure. Fall back to a recursive function call if an
+invalid parent pointer is detected.
+
+Fixes #255.
+
+Upstream-Status: Backport [85b1792e37b131e7a51af98a37f92472e8de5f3f]
+---
+ HTMLtree.c | 46 ++++++++++++++++++++++++++++------------------
+ xmlsave.c  | 31 +++++++++++++++++++++----------
+ 2 files changed, 49 insertions(+), 28 deletions(-)
+
+diff --git a/HTMLtree.c b/HTMLtree.c
+index 24434d45..bdd639c7 100644
+--- a/HTMLtree.c
++++ b/HTMLtree.c
+@@ -744,7 +744,7 @@ void
+ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
+ 	                 xmlNodePtr cur, const char *encoding ATTRIBUTE_UNUSED=
,
+                          int format) {
+-    xmlNodePtr root;
++    xmlNodePtr root, parent;
+     xmlAttrPtr attr;
+     const htmlElemDesc * info;
+=20
+@@ -755,6 +755,7 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xml=
DocPtr doc,
+     }
+=20
+     root =3D cur;
++    parent =3D cur->parent;
+     while (1) {
+         switch (cur->type) {
+         case XML_HTML_DOCUMENT_NODE:
+@@ -762,13 +763,25 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, x=
mlDocPtr doc,
+             if (((xmlDocPtr) cur)->intSubset !=3D NULL) {
+                 htmlDtdDumpOutput(buf, (xmlDocPtr) cur, NULL);
+             }
+-            if (cur->children !=3D NULL) {
++            /* Always validate cur->parent when descending. */
++            if ((cur->parent =3D=3D parent) && (cur->children !=3D NULL=
)) {
++                parent =3D cur;
+                 cur =3D cur->children;
+                 continue;
+             }
+             break;
+=20
+         case XML_ELEMENT_NODE:
++            /*
++             * Some users like lxml are known to pass nodes with a corr=
upted
++             * tree structure. Fall back to a recursive call to handle =
this
++             * case.
++             */
++            if ((cur->parent !=3D parent) && (cur->children !=3D NULL))=
 {
++                htmlNodeDumpFormatOutput(buf, doc, cur, encoding, forma=
t);
++                break;
++            }
++
+             /*
+              * Get specific HTML info for that node.
+              */
+@@ -817,6 +830,7 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xml=
DocPtr doc,
+                     (cur->name !=3D NULL) &&
+                     (cur->name[0] !=3D 'p')) /* p, pre, param */
+                     xmlOutputBufferWriteString(buf, "\n");
++                parent =3D cur;
+                 cur =3D cur->children;
+                 continue;
+             }
+@@ -825,9 +839,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xml=
DocPtr doc,
+                 (info !=3D NULL) && (!info->isinline)) {
+                 if ((cur->next->type !=3D HTML_TEXT_NODE) &&
+                     (cur->next->type !=3D HTML_ENTITY_REF_NODE) &&
+-                    (cur->parent !=3D NULL) &&
+-                    (cur->parent->name !=3D NULL) &&
+-                    (cur->parent->name[0] !=3D 'p')) /* p, pre, param *=
/
++                    (parent !=3D NULL) &&
++                    (parent->name !=3D NULL) &&
++                    (parent->name[0] !=3D 'p')) /* p, pre, param */
+                     xmlOutputBufferWriteString(buf, "\n");
+             }
+=20
+@@ -842,9 +856,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xml=
DocPtr doc,
+                 break;
+             if (((cur->name =3D=3D (const xmlChar *)xmlStringText) ||
+                  (cur->name !=3D (const xmlChar *)xmlStringTextNoenc)) =
&&
+-                ((cur->parent =3D=3D NULL) ||
+-                 ((xmlStrcasecmp(cur->parent->name, BAD_CAST "script"))=
 &&
+-                  (xmlStrcasecmp(cur->parent->name, BAD_CAST "style")))=
)) {
++                ((parent =3D=3D NULL) ||
++                 ((xmlStrcasecmp(parent->name, BAD_CAST "script")) &&
++                  (xmlStrcasecmp(parent->name, BAD_CAST "style"))))) {
+                 xmlChar *buffer;
+=20
+                 buffer =3D xmlEncodeEntitiesReentrant(doc, cur->content=
);
+@@ -902,13 +916,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xm=
lDocPtr doc,
+                 break;
+             }
+=20
+-            /*
+-             * The parent should never be NULL here but we want to hand=
le
+-             * corrupted documents gracefully.
+-             */
+-            if (cur->parent =3D=3D NULL)
+-                return;
+-            cur =3D cur->parent;
++            cur =3D parent;
++            /* cur->parent was validated when descending. */
++            parent =3D cur->parent;
+=20
+             if ((cur->type =3D=3D XML_HTML_DOCUMENT_NODE) ||
+                 (cur->type =3D=3D XML_DOCUMENT_NODE)) {
+@@ -939,9 +949,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xml=
DocPtr doc,
+                     (cur->next !=3D NULL)) {
+                     if ((cur->next->type !=3D HTML_TEXT_NODE) &&
+                         (cur->next->type !=3D HTML_ENTITY_REF_NODE) &&
+-                        (cur->parent !=3D NULL) &&
+-                        (cur->parent->name !=3D NULL) &&
+-                        (cur->parent->name[0] !=3D 'p')) /* p, pre, par=
am */
++                        (parent !=3D NULL) &&
++                        (parent->name !=3D NULL) &&
++                        (parent->name[0] !=3D 'p')) /* p, pre, param */
+                         xmlOutputBufferWriteString(buf, "\n");
+                 }
+             }
+diff --git a/xmlsave.c b/xmlsave.c
+index 61a40459..aedbd5e7 100644
+--- a/xmlsave.c
++++ b/xmlsave.c
+@@ -847,7 +847,7 @@ htmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlN=
odePtr cur) {
+ static void
+ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
+     int format =3D ctxt->format;
+-    xmlNodePtr tmp, root, unformattedNode =3D NULL;
++    xmlNodePtr tmp, root, unformattedNode =3D NULL, parent;
+     xmlAttrPtr attr;
+     xmlChar *start, *end;
+     xmlOutputBufferPtr buf;
+@@ -856,6 +856,7 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNo=
dePtr cur) {
+     buf =3D ctxt->buf;
+=20
+     root =3D cur;
++    parent =3D cur->parent;
+     while (1) {
+         switch (cur->type) {
+         case XML_DOCUMENT_NODE:
+@@ -868,7 +869,9 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNo=
dePtr cur) {
+             break;
+=20
+         case XML_DOCUMENT_FRAG_NODE:
+-            if (cur->children !=3D NULL) {
++            /* Always validate cur->parent when descending. */
++            if ((cur->parent =3D=3D parent) && (cur->children !=3D NULL=
)) {
++                parent =3D cur;
+                 cur =3D cur->children;
+                 continue;
+             }
+@@ -887,7 +890,18 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlN=
odePtr cur) {
+             break;
+=20
+         case XML_ELEMENT_NODE:
+-	    if ((cur !=3D root) && (ctxt->format =3D=3D 1) && (xmlIndentTreeOu=
tput))
++            /*
++             * Some users like lxml are known to pass nodes with a corr=
upted
++             * tree structure. Fall back to a recursive call to handle =
this
++             * case.
++             */
++            if ((cur->parent !=3D parent) && (cur->children !=3D NULL))=
 {
++                xmlNodeDumpOutputInternal(ctxt, cur);
++                break;
++            }
++
++	    if ((ctxt->level > 0) && (ctxt->format =3D=3D 1) &&
++                (xmlIndentTreeOutput))
+ 		xmlOutputBufferWrite(buf, ctxt->indent_size *
+ 				     (ctxt->level > ctxt->indent_nr ?
+ 				      ctxt->indent_nr : ctxt->level),
+@@ -942,6 +956,7 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNo=
dePtr cur) {
+                 xmlOutputBufferWrite(buf, 1, ">");
+                 if (ctxt->format =3D=3D 1) xmlOutputBufferWrite(buf, 1,=
 "\n");
+                 if (ctxt->level >=3D 0) ctxt->level++;
++                parent =3D cur;
+                 cur =3D cur->children;
+                 continue;
+             }
+@@ -1058,13 +1073,9 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xm=
lNodePtr cur) {
+                 break;
+             }
+=20
+-            /*
+-             * The parent should never be NULL here but we want to hand=
le
+-             * corrupted documents gracefully.
+-             */
+-            if (cur->parent =3D=3D NULL)
+-                return;
+-            cur =3D cur->parent;
++            cur =3D parent;
++            /* cur->parent was validated when descending. */
++            parent =3D cur->parent;
+=20
+             if (cur->type =3D=3D XML_ELEMENT_NODE) {
+                 if (ctxt->level > 0) ctxt->level--;
+--=20
+2.32.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.12.bb b/meta/recipes-co=
re/libxml/libxml2_2.9.12.bb
index c387587dfd..a7939c9713 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.12.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.12.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-${P=
V}.tar.gz;name=3Dlibtar \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enab=
led.patch \
            file://fix-execution-of-ptests.patch \
            file://remove-fuzz-from-ptests.patch \
+           file://0002-Work-around-lxml-API-abuse.patch \
            "
=20
 SRC_URI[libtar.sha256sum] =3D "c8d6681e38c56f172892c85ddc0852e1fd4b53b42=
09e7f4ebf17f7e2eae71d92"
--=20
2.32.0


