Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 765E77236B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 13:58:11 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XtzaG-0004rF-67 from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Nov 2014 05:58:12 -0800
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.9]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0181.006; Thu, 27 Nov 2014 13:58:11 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "MacDonald, Joe" <Joe_MacDonald@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libxml2: fix CVE-2014-3660
Thread-Index: AQHP7I6CTHz+T5EQD0m8e28UZcp/hJx0t02AgAADvVA=
Date: Thu, 27 Nov 2014 13:58:10 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994E75615E9@EU-MBX-01.mgc.mentorg.com>
References: <1413827481-11123-1-git-send-email-joe_macdonald@mentor.com> 
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [PATCH] libxml2: fix CVE-2014-3660
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
X-List-Received-Date: Thu, 27 Nov 2014 13:58:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the false alarm. It was included in master but not in dizzy branc=
h. Kindly include in that branch as well. Thanks.

Noor

-----Original Message-----
From: Ahsan, Noor=20
Sent: Thursday, November 27, 2014 6:45 PM
To: 'Joe MacDonald'; openembedded-core@lists.openembedded.org
Subject: RE: [OE-core] [PATCH] libxml2: fix CVE-2014-3660

Hello,

We sent out this patch but we haven't received any feedback not it was incl=
uded. Kindly include this in dizzy branch.

Thanks.

Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
Sent: Monday, October 20, 2014 10:51 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] libxml2: fix CVE-2014-3660

It was discovered that the patch for CVE-2014-0191 for libxml2 is incomplet=
e.  It is still possible to have libxml2 incorrectly perform entity substit=
uton even when the application using libxml2 explicitly disables the featur=
e.  This can allow a remote denial-of-service attack on systems with libxml=
2 prior to 2.9.2.

References:
    http://www.openwall.com/lists/oss-security/2014/10/17/7
    https://www.ncsc.nl/actueel/nieuwsberichten/kwetsbaarheid-ontdekt-in-li=
bxml2.html

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta/recipes-core/libxml/libxml2.inc               |   1 +
 .../libxml/libxml2/libxml2-CVE-2014-3660.patch     | 147 +++++++++++++++++=
++++
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.=
patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxm=
l/libxml2.inc
index bcf9a62..c729c19 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -21,6 +21,7 @@ SRC_URI =3D "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.=
gz;name=3Dlibtar \
            file://libxml2-CVE-2014-0191-fix.patch \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
+           file://libxml2-CVE-2014-3660.patch \
           "
=20
 BINCONFIG =3D "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch b=
/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
new file mode 100644
index 0000000..b9621c9
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
@@ -0,0 +1,147 @@
+From be2a7edaf289c5da74a4f9ed3a0b6c733e775230 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Thu, 16 Oct 2014 13:59:47 +0800
+Subject: Fix for CVE-2014-3660
+
+Issues related to the billion laugh entity expansion which happened to=20
+escape the initial set of fixes
+
+Upstream-status: Backport
+Reference:=20
+https://git.gnome.org/browse/libxml2/commit/?id=3Dbe2a7edaf289c5da74a4f9e
+d3a0b6c733e775230&context=3D3&ignorews=3D0&ss=3D0
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+
+diff --git a/parser.c b/parser.c
+index f51e8d2..1d93967 100644
+--- a/parser.c
++++ b/parser.c
+@@ -130,6 +130,29 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t si=
ze,
+         return (0);
+     if (ctxt->lastError.code =3D=3D XML_ERR_ENTITY_LOOP)
+         return (1);
++
++    /*
++     * This may look absurd but is needed to detect
++     * entities problems
++     */
++    if ((ent !=3D NULL) && (ent->etype !=3D XML_INTERNAL_PREDEFINED_ENTIT=
Y) &&
++	(ent->content !=3D NULL) && (ent->checked =3D=3D 0)) {
++	unsigned long oldnbent =3D ctxt->nbentities;
++	xmlChar *rep;
++
++	ent->checked =3D 1;
++
++	rep =3D xmlStringDecodeEntities(ctxt, ent->content,
++				  XML_SUBSTITUTE_REF, 0, 0, 0);
++
++	ent->checked =3D (ctxt->nbentities - oldnbent + 1) * 2;
++	if (rep !=3D NULL) {
++	    if (xmlStrchr(rep, '<'))
++		ent->checked |=3D 1;
++	    xmlFree(rep);
++	    rep =3D NULL;
++	}
++    }
+     if (replacement !=3D 0) {
+ 	if (replacement < XML_MAX_TEXT_LENGTH)
+ 	    return(0);
+@@ -189,9 +212,12 @@ xmlParserEntityCheck(xmlParserCtxtPtr ctxt, size_t si=
ze,
+             return (0);
+     } else {
+         /*
+-         * strange we got no data for checking just return
++         * strange we got no data for checking
+          */
+-        return (0);
++	if (((ctxt->lastError.code !=3D XML_ERR_UNDECLARED_ENTITY) &&
++	     (ctxt->lastError.code !=3D XML_WAR_UNDECLARED_ENTITY)) ||
++	    (ctxt->nbentities <=3D 10000))
++	    return (0);
+     }
+     xmlFatalErr(ctxt, XML_ERR_ENTITY_LOOP, NULL);
+     return (1);
+@@ -2589,6 +2615,7 @@ xmlParserHandlePEReference(xmlParserCtxtPtr ctxt) {
+ 				      name, NULL);
+ 		    ctxt->valid =3D 0;
+ 		}
++		xmlParserEntityCheck(ctxt, 0, NULL, 0);
+ 	    } else if (ctxt->input->free !=3D deallocblankswrapper) {
+ 		    input =3D xmlNewBlanksWrapperInputStream(ctxt, entity);
+ 		    if (xmlPushInput(ctxt, input) < 0) @@ -2759,6 +2786,7 @@=20
+xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int =
len,
+ 	    if ((ctxt->lastError.code =3D=3D XML_ERR_ENTITY_LOOP) ||
+ 	        (ctxt->lastError.code =3D=3D XML_ERR_INTERNAL_ERROR))
+ 	        goto int_error;
++	    xmlParserEntityCheck(ctxt, 0, ent, 0);
+ 	    if (ent !=3D NULL)
+ 	        ctxt->nbentities +=3D ent->checked / 2;
+ 	    if ((ent !=3D NULL) &&
+@@ -2810,6 +2838,7 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, co=
nst xmlChar *str, int len,
+ 	    ent =3D xmlParseStringPEReference(ctxt, &str);
+ 	    if (ctxt->lastError.code =3D=3D XML_ERR_ENTITY_LOOP)
+ 	        goto int_error;
++	    xmlParserEntityCheck(ctxt, 0, ent, 0);
+ 	    if (ent !=3D NULL)
+ 	        ctxt->nbentities +=3D ent->checked / 2;
+ 	    if (ent !=3D NULL) {
+@@ -7312,6 +7341,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
+ 		   (ret !=3D XML_WAR_UNDECLARED_ENTITY)) {
+ 	    xmlFatalErrMsgStr(ctxt, XML_ERR_UNDECLARED_ENTITY,
+ 		     "Entity '%s' failed to parse\n", ent->name);
++	    xmlParserEntityCheck(ctxt, 0, ent, 0);
+ 	} else if (list !=3D NULL) {
+ 	    xmlFreeNodeList(list);
+ 	    list =3D NULL;
+@@ -7418,7 +7448,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
+ 		/*
+ 		 * We are copying here, make sure there is no abuse
+ 		 */
+-		ctxt->sizeentcopy +=3D ent->length;
++		ctxt->sizeentcopy +=3D ent->length + 5;
+ 		if (xmlParserEntityCheck(ctxt, 0, ent, ctxt->sizeentcopy))
+ 		    return;
+=20
+@@ -7466,7 +7496,7 @@ xmlParseReference(xmlParserCtxtPtr ctxt) {
+ 		/*
+ 		 * We are copying here, make sure there is no abuse
+ 		 */
+-		ctxt->sizeentcopy +=3D ent->length;
++		ctxt->sizeentcopy +=3D ent->length + 5;
+ 		if (xmlParserEntityCheck(ctxt, 0, ent, ctxt->sizeentcopy))
+ 		    return;
+=20
+@@ -7652,6 +7682,7 @@ xmlParseEntityRef(xmlParserCtxtPtr ctxt) {
+ 		ctxt->sax->reference(ctxt->userData, name);
+ 	    }
+ 	}
++	xmlParserEntityCheck(ctxt, 0, ent, 0);
+ 	ctxt->valid =3D 0;
+     }
+=20
+@@ -7845,6 +7876,7 @@ xmlParseStringEntityRef(xmlParserCtxtPtr ctxt, const=
 xmlChar ** str) {
+ 			  "Entity '%s' not defined\n",
+ 			  name);
+ 	}
++	xmlParserEntityCheck(ctxt, 0, ent, 0);
+ 	/* TODO ? check regressions ctxt->valid =3D 0; */
+     }
+=20
+@@ -8004,6 +8036,7 @@ xmlParsePEReference(xmlParserCtxtPtr ctxt)
+ 			  name, NULL);
+ 	    ctxt->valid =3D 0;
+ 	}
++	xmlParserEntityCheck(ctxt, 0, NULL, 0);
+     } else {
+ 	/*
+ 	 * Internal checking in case the entity quest barfed @@ -8243,6
++8276,7 @@ xmlParseStringPEReference(xmlParserCtxtPtr ctxt, const=20
++xmlChar **str) {
+ 			  name, NULL);
+ 	    ctxt->valid =3D 0;
+ 	}
++	xmlParserEntityCheck(ctxt, 0, NULL, 0);
+     } else {
+ 	/*
+ 	 * Internal checking in case the entity quest barfed
+--
+cgit v0.10.1
+
--
1.9.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

