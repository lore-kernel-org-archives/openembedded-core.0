Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 25FCF77242
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 19:05:11 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cHbL6-0007Yo-O0 from Noor_Ahsan@mentor.com ;
	Thu, 15 Dec 2016 11:05:13 -0800
Received: from svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) by
	SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Thu, 15 Dec 2016 19:05:09 +0000
Received: from svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce]) by
	svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce%22]) with
	mapi id 15.00.1210.000; Thu, 15 Dec 2016 19:05:08 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Andrej Valek <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/3] libxml2: fix CVE-2016-4658 Disallow
	namespace	nodes in XPointer points and ranges
Thread-Index: AQHSVHvEzeiqurQv/0eV65eKDOcR3qEJYz9A
Date: Thu, 15 Dec 2016 19:05:08 +0000
Message-ID: <c5a2e55512d944e0855c7dd2658ad256@svr-ies-mbx-01.mgc.mentorg.com>
References: <1481548821-15878-1-git-send-email-andrej.valek@siemens.com>
	<1481548821-15878-2-git-send-email-andrej.valek@siemens.com>
In-Reply-To: <1481548821-15878-2-git-send-email-andrej.valek@siemens.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] libxml2: fix CVE-2016-4658 Disallow namespace	nodes in XPointer points and ranges
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
X-List-Received-Date: Thu, 15 Dec 2016 19:05:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can we merge this on morty branch as well?

Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Andrej Valek
Sent: Monday, December 12, 2016 6:20 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 2/3] libxml2: fix CVE-2016-4658 Disallow namespac=
e nodes in XPointer points and ranges

Namespace nodes must be copied to avoid use-after-free errors.
But they don't necessarily have a physical representation in a document, so=
 simply disallow them in XPointer ranges.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../libxml/libxml2/libxml2-CVE-2016-4658.patch     | 269 +++++++++++++++++=
++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   1 +
 2 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.=
patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch b=
/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
new file mode 100644
index 0000000..5412e8c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
@@ -0,0 +1,269 @@
+libxml2-2.9.4: Fix CVE-2016-4658
+
+[No upstream tracking] --=20
+https://bugzilla.redhat.com/show_bug.cgi?id=3DCVE-2016-4658
+
+xpointer: Disallow namespace nodes in XPointer points and ranges
+
+Namespace nodes must be copied to avoid use-after-free errors.
+But they don't necessarily have a physical representation in a=20
+document, so simply disallow them in XPointer ranges.
+
+Upstream-Status: Backported
+ -=20
+[https://git.gnome.org/browse/libxml2/commit/?id=3Dc1d1f7121194036608bf55
+5f08d3062a36fd344b]
+ -=20
+[https://git.gnome.org/browse/libxml2/commit/?id=3D3f8a91036d338e51c059d5
+4397a42d645f019c65]
+CVE: CVE-2016-4658
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+diff --git a/xpointer.c b/xpointer.c
+index 676c510..911680d 100644
+--- a/xpointer.c
++++ b/xpointer.c
+@@ -320,6 +320,45 @@ xmlXPtrRangesEqual(xmlXPathObjectPtr range1,=20
+xmlXPathObjectPtr range2) {  }
+=20
+ /**
++ * xmlXPtrNewRangeInternal:
++ * @start:  the starting node
++ * @startindex:  the start index
++ * @end:  the ending point
++ * @endindex:  the ending index
++ *
++ * Internal function to create a new xmlXPathObjectPtr of type range
++ *
++ * Returns the newly created object.
++ */
++static xmlXPathObjectPtr
++xmlXPtrNewRangeInternal(xmlNodePtr start, int startindex,
++                        xmlNodePtr end, int endindex) {
++    xmlXPathObjectPtr ret;
++
++    /*
++     * Namespace nodes must be copied (see xmlXPathNodeSetDupNs).
++     * Disallow them for now.
++     */
++    if ((start !=3D NULL) && (start->type =3D=3D XML_NAMESPACE_DECL))
++	return(NULL);
++    if ((end !=3D NULL) && (end->type =3D=3D XML_NAMESPACE_DECL))
++	return(NULL);
++
++    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
++    if (ret =3D=3D NULL) {
++        xmlXPtrErrMemory("allocating range");
++	return(NULL);
++    }
++    memset(ret, 0, sizeof(xmlXPathObject));
++    ret->type =3D XPATH_RANGE;
++    ret->user =3D start;
++    ret->index =3D startindex;
++    ret->user2 =3D end;
++    ret->index2 =3D endindex;
++    return(ret);
++}
++
++/**
+  * xmlXPtrNewRange:
+  * @start:  the starting node
+  * @startindex:  the start index
+@@ -344,17 +383,7 @@ xmlXPtrNewRange(xmlNodePtr start, int startindex,
+     if (endindex < 0)
+ 	return(NULL);
+=20
+-    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
+-    if (ret =3D=3D NULL) {
+-        xmlXPtrErrMemory("allocating range");
+-	return(NULL);
+-    }
+-    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
+-    ret->type =3D XPATH_RANGE;
+-    ret->user =3D start;
+-    ret->index =3D startindex;
+-    ret->user2 =3D end;
+-    ret->index2 =3D endindex;
++    ret =3D xmlXPtrNewRangeInternal(start, startindex, end, endindex);
+     xmlXPtrRangeCheckOrder(ret);
+     return(ret);
+ }
+@@ -381,17 +410,8 @@ xmlXPtrNewRangePoints(xmlXPathObjectPtr start, xmlXPa=
thObjectPtr end) {
+     if (end->type !=3D XPATH_POINT)
+ 	return(NULL);
+=20
+-    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
+-    if (ret =3D=3D NULL) {
+-        xmlXPtrErrMemory("allocating range");
+-	return(NULL);
+-    }
+-    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
+-    ret->type =3D XPATH_RANGE;
+-    ret->user =3D start->user;
+-    ret->index =3D start->index;
+-    ret->user2 =3D end->user;
+-    ret->index2 =3D end->index;
++    ret =3D xmlXPtrNewRangeInternal(start->user, start->index, end->user,
++				  end->index);
+     xmlXPtrRangeCheckOrder(ret);
+     return(ret);
+ }
+@@ -416,17 +436,7 @@ xmlXPtrNewRangePointNode(xmlXPathObjectPtr start, xml=
NodePtr end) {
+     if (start->type !=3D XPATH_POINT)
+ 	return(NULL);
+=20
+-    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
+-    if (ret =3D=3D NULL) {
+-        xmlXPtrErrMemory("allocating range");
+-	return(NULL);
+-    }
+-    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
+-    ret->type =3D XPATH_RANGE;
+-    ret->user =3D start->user;
+-    ret->index =3D start->index;
+-    ret->user2 =3D end;
+-    ret->index2 =3D -1;
++    ret =3D xmlXPtrNewRangeInternal(start->user, start->index, end, -1);
+     xmlXPtrRangeCheckOrder(ret);
+     return(ret);
+ }
+@@ -453,17 +463,7 @@ xmlXPtrNewRangeNodePoint(xmlNodePtr start, xmlXPathOb=
jectPtr end) {
+     if (end->type !=3D XPATH_POINT)
+ 	return(NULL);
+=20
+-    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
+-    if (ret =3D=3D NULL) {
+-        xmlXPtrErrMemory("allocating range");
+-	return(NULL);
+-    }
+-    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
+-    ret->type =3D XPATH_RANGE;
+-    ret->user =3D start;
+-    ret->index =3D -1;
+-    ret->user2 =3D end->user;
+-    ret->index2 =3D end->index;
++    ret =3D xmlXPtrNewRangeInternal(start, -1, end->user, end->index);
+     xmlXPtrRangeCheckOrder(ret);
+     return(ret);
+ }
+@@ -486,17 +486,7 @@ xmlXPtrNewRangeNodes(xmlNodePtr start, xmlNodePtr end=
) {
+     if (end =3D=3D NULL)
+ 	return(NULL);
+=20
+-    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
+-    if (ret =3D=3D NULL) {
+-        xmlXPtrErrMemory("allocating range");
+-	return(NULL);
+-    }
+-    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
+-    ret->type =3D XPATH_RANGE;
+-    ret->user =3D start;
+-    ret->index =3D -1;
+-    ret->user2 =3D end;
+-    ret->index2 =3D -1;
++    ret =3D xmlXPtrNewRangeInternal(start, -1, end, -1);
+     xmlXPtrRangeCheckOrder(ret);
+     return(ret);
+ }
+@@ -516,17 +506,7 @@ xmlXPtrNewCollapsedRange(xmlNodePtr start) {
+     if (start =3D=3D NULL)
+ 	return(NULL);
+=20
+-    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
+-    if (ret =3D=3D NULL) {
+-        xmlXPtrErrMemory("allocating range");
+-	return(NULL);
+-    }
+-    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
+-    ret->type =3D XPATH_RANGE;
+-    ret->user =3D start;
+-    ret->index =3D -1;
+-    ret->user2 =3D NULL;
+-    ret->index2 =3D -1;
++    ret =3D xmlXPtrNewRangeInternal(start, -1, NULL, -1);
+     return(ret);
+ }
+=20
+@@ -541,6 +521,8 @@ xmlXPtrNewCollapsedRange(xmlNodePtr start) {
+  */
+ xmlXPathObjectPtr
+ xmlXPtrNewRangeNodeObject(xmlNodePtr start, xmlXPathObjectPtr end) {
++    xmlNodePtr endNode;
++    int endIndex;
+     xmlXPathObjectPtr ret;
+=20
+     if (start =3D=3D NULL)
+@@ -549,7 +531,12 @@ xmlXPtrNewRangeNodeObject(xmlNodePtr start, xmlXPathO=
bjectPtr end) {
+ 	return(NULL);
+     switch (end->type) {
+ 	case XPATH_POINT:
++	    endNode =3D end->user;
++	    endIndex =3D end->index;
++	    break;
+ 	case XPATH_RANGE:
++	    endNode =3D end->user2;
++	    endIndex =3D end->index2;
+ 	    break;
+ 	case XPATH_NODESET:
+ 	    /*
+@@ -557,39 +544,15 @@ xmlXPtrNewRangeNodeObject(xmlNodePtr start, xmlXPath=
ObjectPtr end) {
+ 	     */
+ 	    if (end->nodesetval->nodeNr <=3D 0)
+ 		return(NULL);
++	    endNode =3D end->nodesetval->nodeTab[end->nodesetval->nodeNr - 1];
++	    endIndex =3D -1;
+ 	    break;
+ 	default:
+ 	    /* TODO */
+ 	    return(NULL);
+     }
+=20
+-    ret =3D (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
+-    if (ret =3D=3D NULL) {
+-        xmlXPtrErrMemory("allocating range");
+-	return(NULL);
+-    }
+-    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
+-    ret->type =3D XPATH_RANGE;
+-    ret->user =3D start;
+-    ret->index =3D -1;
+-    switch (end->type) {
+-	case XPATH_POINT:
+-	    ret->user2 =3D end->user;
+-	    ret->index2 =3D end->index;
+-	    break;
+-	case XPATH_RANGE:
+-	    ret->user2 =3D end->user2;
+-	    ret->index2 =3D end->index2;
+-	    break;
+-	case XPATH_NODESET: {
+-	    ret->user2 =3D end->nodesetval->nodeTab[end->nodesetval->nodeNr - 1]=
;
+-	    ret->index2 =3D -1;
+-	    break;
+-	}
+-	default:
+-	    STRANGE
+-	    return(NULL);
+-    }
++    ret =3D xmlXPtrNewRangeInternal(start, -1, endNode, endIndex);
+     xmlXPtrRangeCheckOrder(ret);
+     return(ret);
+ }
+@@ -1835,8 +1798,8 @@ xmlXPtrStartPointFunction(xmlXPathParserContextPtr c=
txt, int nargs) {
+ 		case XPATH_RANGE: {
+ 		    xmlNodePtr node =3D tmp->user;
+ 		    if (node !=3D NULL) {
+-			if (node->type =3D=3D XML_ATTRIBUTE_NODE) {
+-			    /* TODO: Namespace Nodes ??? */
++			if ((node->type =3D=3D XML_ATTRIBUTE_NODE) ||
++			     (node->type =3D=3D XML_NAMESPACE_DECL)) {
+ 			    xmlXPathFreeObject(obj);
+ 			    xmlXPtrFreeLocationSet(newset);
+ 			    XP_ERROR(XPTR_SYNTAX_ERROR);
+@@ -1931,8 +1894,8 @@ xmlXPtrEndPointFunction(xmlXPathParserContextPtr ctx=
t, int nargs) {
+ 		case XPATH_RANGE: {
+ 		    xmlNodePtr node =3D tmp->user2;
+ 		    if (node !=3D NULL) {
+-			if (node->type =3D=3D XML_ATTRIBUTE_NODE) {
+-			    /* TODO: Namespace Nodes ??? */
++			if ((node->type =3D=3D XML_ATTRIBUTE_NODE) ||
++			     (node->type =3D=3D XML_NAMESPACE_DECL)) {
+ 			    xmlXPathFreeObject(obj);
+ 			    xmlXPtrFreeLocationSet(newset);
+ 			    XP_ERROR(XPTR_SYNTAX_ERROR);
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/=
libxml/libxml2_2.9.4.bb
index 66a8940..a1d1e9e 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.=
gz;name=3Dlibtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://libxml2-fix_node_comparison.patch \
            file://libxml2-CVE-2016-5131.patch \
+           file://libxml2-CVE-2016-4658.patch \
           "
=20
 SRC_URI[libtar.md5sum] =3D "ae249165c173b1ff386ee8ad676815f5"
--
2.1.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

