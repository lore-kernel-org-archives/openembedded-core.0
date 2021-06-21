Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [116.202.209.171])
 by mx.groups.io with SMTP id smtpd.web08.47787.1624284701559864913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 07:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@fancydomain.eu header.s=mail header.b=J5Oo/yTD;
 spf=pass (domain: fancydomain.eu, ip: 116.202.209.171, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1624284699;
	bh=GYE5cwNe6TjHXH/O67ztXUKWnQxBnvsv4gQnvHbI25A=;
	h=From:To:Cc:Subject;
	b=J5Oo/yTDCelPmq7Oy6LarNsQsMeNnjLokX1uLFtVurZfOY1Gliu92CgtvBlcYtMoC
	 o6klhqwJYTO24mUxZQB1eX9K30GyCvFoGxh5U/lVUnYPZQ/a9gQgIv8jCK5F4/bUu0
	 8drRwiPVTqKiF4YwtjitgnzQdleJX7QvPQjij5Fwyw1868Bbc2xNtqHbBhIJ/ZGIW8
	 ok14OerbxIr0RoBXna0IVySnygWR5Sh1bjPND+NXi+j4qgw3LflPF5CFsiZWnvAgvM
	 oQpqOKW887Pz9NMFIECq3WwF/zgN1NX5iPUaj5Dch6oRI2DRwX/uIHRZcmKNcyvNh1
	 qibogV1Y1LqOQ==
To: openembedded-core@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [oe-core][dunfell][PATCH] libxml2: Fix CVE-2021-3518
Date: Mon, 21 Jun 2021 16:10:45 +0200
Message-Id: <20210621141045.256726-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There's a flaw in libxml2 in versions before 2.9.11. An attacker who is a=
ble to submit a crafted file to be processed by an application linked wit=
h libxml2 could trigger a use-after-free. The greatest impact from this f=
law is to confidentiality, integrity, and availability.

Upstream-Status: Backport [from fedora:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1954243]

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../libxml/libxml2/CVE-2021-3518.patch        | 108 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch b/meta/=
recipes-core/libxml/libxml2/CVE-2021-3518.patch
new file mode 100644
index 0000000000..c22cccf1b1
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch
@@ -0,0 +1,108 @@
+From ac82a514e16eb81b4506e2cba1a1ee45b9f025b5 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 10 Jun 2020 16:34:52 +0200
+Subject: [PATCH 1/2] Don't recurse into xi:include children in
+ xmlXIncludeDoProcess
+
+Otherwise, nested xi:include nodes might result in a use-after-free
+if XML_PARSE_NOXINCNODE is specified.
+
+Found with libFuzzer and ASan.
+
+The upstream patch 752e5f71d7cea2ca5a7e7c0b8f72ed04ce654be4 has been mod=
ified,
+as to avoid unnecessary modifications to fallback files.
+
+Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
+---
+ xinclude.c | 24 ++++++++++--------------
+ 1 file changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/xinclude.c b/xinclude.c
+index ba850fa5..f260c1a7 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -2392,21 +2392,19 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xm=
lDocPtr doc, xmlNodePtr tree) {
+      * First phase: lookup the elements in the document
+      */
+     cur =3D tree;
+-    if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1)
+-	xmlXIncludePreProcessNode(ctxt, cur);
+     while ((cur !=3D NULL) && (cur !=3D tree->parent)) {
+ 	/* TODO: need to work on entities -> stack */
+-	if ((cur->children !=3D NULL) &&
+-	    (cur->children->type !=3D XML_ENTITY_DECL) &&
+-	    (cur->children->type !=3D XML_XINCLUDE_START) &&
+-	    (cur->children->type !=3D XML_XINCLUDE_END)) {
+-	    cur =3D cur->children;
+-	    if (xmlXIncludeTestNode(ctxt, cur))
+-		xmlXIncludePreProcessNode(ctxt, cur);
+-	} else if (cur->next !=3D NULL) {
++        if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1) {
++            xmlXIncludePreProcessNode(ctxt, cur);
++        } else if ((cur->children !=3D NULL) &&
++                   (cur->children->type !=3D XML_ENTITY_DECL) &&
++                   (cur->children->type !=3D XML_XINCLUDE_START) &&
++                   (cur->children->type !=3D XML_XINCLUDE_END)) {
++            cur =3D cur->children;
++            continue;
++        }
++	if (cur->next !=3D NULL) {
+ 	    cur =3D cur->next;
+-	    if (xmlXIncludeTestNode(ctxt, cur))
+-		xmlXIncludePreProcessNode(ctxt, cur);
+ 	} else {
+ 	    if (cur =3D=3D tree)
+ 	        break;
+@@ -2416,8 +2414,6 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xmlD=
ocPtr doc, xmlNodePtr tree) {
+ 		    break; /* do */
+ 		if (cur->next !=3D NULL) {
+ 		    cur =3D cur->next;
+-		    if (xmlXIncludeTestNode(ctxt, cur))
+-			xmlXIncludePreProcessNode(ctxt, cur);
+ 		    break; /* do */
+ 		}
+ 	    } while (cur !=3D NULL);
+--=20
+2.32.0
+
+
+From 3ad5ac1e39e3cd42f838c1cd27ffd4e9b79e6121 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 22 Apr 2021 19:26:28 +0200
+Subject: [PATCH 2/2] Fix user-after-free with `xmllint --xinclude --drop=
dtd`
+
+The --dropdtd option can leave dangling pointers in entity reference
+nodes. Make sure to skip these nodes when processing XIncludes.
+
+This also avoids scanning entity declarations and even modifying
+them inadvertently during XInclude processing.
+
+Move from a block list to an allow list approach to avoid descending
+into other node types that can't contain elements.
+
+Fixes #237.
+
+Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
+---
+ xinclude.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/xinclude.c b/xinclude.c
+index f260c1a7..d7648529 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -2397,9 +2397,8 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xmlD=
ocPtr doc, xmlNodePtr tree) {
+         if (xmlXIncludeTestNode(ctxt, cur) =3D=3D 1) {
+             xmlXIncludePreProcessNode(ctxt, cur);
+         } else if ((cur->children !=3D NULL) &&
+-                   (cur->children->type !=3D XML_ENTITY_DECL) &&
+-                   (cur->children->type !=3D XML_XINCLUDE_START) &&
+-                   (cur->children->type !=3D XML_XINCLUDE_END)) {
++                   ((cur->type =3D=3D XML_DOCUMENT_NODE) ||
++                    (cur->type =3D=3D XML_ELEMENT_NODE))) {
+             cur =3D cur->children;
+             continue;
+         }
+--=20
+2.32.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-co=
re/libxml/libxml2_2.9.10.bb
index 4ebfb9e556..04d32ade69 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-${P=
V}.tar.gz;name=3Dlibtar \
            file://CVE-2020-7595.patch \
            file://CVE-2019-20388.patch \
            file://CVE-2020-24977.patch \
+           file://CVE-2021-3518.patch \
            "
=20
 SRC_URI[libtar.md5sum] =3D "10942a1dc23137a8aa07f0639cbfece5"
--=20
2.32.0

