Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5C4EF77307
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 19:01:30 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cHbHX-0006W9-Mo from Noor_Ahsan@mentor.com ;
	Thu, 15 Dec 2016 11:01:32 -0800
Received: from svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) by
	svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Thu, 15 Dec 2016 19:01:28 +0000
Received: from svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce]) by
	svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce%22]) with
	mapi id 15.00.1210.000; Thu, 15 Dec 2016 19:01:28 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Yi Zhao <yi.zhao@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libxml2: Security fix CVE-2016-5131
Thread-Index: AQHSSV/2sgIh42bqeEmg8mlAt8aGNKEJeGIg
Date: Thu, 15 Dec 2016 19:01:28 +0000
Message-ID: <94d3b02ec5424fbabf5efbe2b48d7615@svr-ies-mbx-01.mgc.mentorg.com>
References: <1480326940-7571-1-git-send-email-yi.zhao@windriver.com>
In-Reply-To: <1480326940-7571-1-git-send-email-yi.zhao@windriver.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH] libxml2: Security fix CVE-2016-5131
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
X-List-Received-Date: Thu, 15 Dec 2016 19:01:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can we have this patch merged on morty branch?

Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Yi Zhao
Sent: Monday, November 28, 2016 2:56 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] libxml2: Security fix CVE-2016-5131

CVE-2016-5131 libxml2: Use-after-free vulnerability in libxml2 through 2.9.=
4, as used in Google Chrome before 52.0.2743.82, allows remote attackers to=
 cause a denial of service or possibly have unspecified other impact via ve=
ctors related to the XPointer range-to function.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2016-5131

Patch from:
https://git.gnome.org/browse/libxml2/commit/?id=3D9ab01a277d71f54d3143c2cf3=
33c5c2e9aaedd9e

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libxml/libxml2/libxml2-CVE-2016-5131.patch     | 180 +++++++++++++++++=
++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.=
patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch b=
/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
new file mode 100644
index 0000000..9d47d02
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
@@ -0,0 +1,180 @@
+From 9ab01a277d71f54d3143c2cf333c5c2e9aaedd9e Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 28 Jun 2016 14:22:23 +0200
+Subject: [PATCH] Fix XPointer paths beginning with range-to
+
+The old code would invoke the broken xmlXPtrRangeToFunction. range-to=20
+isn't really a function but a special kind of location step. Remove=20
+this function and always handle range-to in the XPath code.
+
+The old xmlXPtrRangeToFunction could also be abused to trigger a=20
+use-after-free error with the potential for remote code execution.
+
+Found with afl-fuzz.
+
+Fixes CVE-2016-5131.
+
+CVE: CVE-2016-5131
+Upstream-Status: Backport
+https://git.gnome.org/browse/libxml2/commit/?id=3D9ab01a277d71f54d3143c2c
+f333c5c2e9aaedd9e
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ result/XPath/xptr/vidbase | 13 ++++++++
+ test/XPath/xptr/vidbase   |  1 +
+ xpath.c                   |  7 ++++-
+ xpointer.c                | 76 ++++--------------------------------------=
-----
+ 4 files changed, 26 insertions(+), 71 deletions(-)
+
+diff --git a/result/XPath/xptr/vidbase b/result/XPath/xptr/vidbase=20
+index 8b9e92d..f19193e 100644
+--- a/result/XPath/xptr/vidbase
++++ b/result/XPath/xptr/vidbase
+@@ -17,3 +17,16 @@ Object is a Location Set:
+   To node
+     ELEMENT p
+=20
++
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++Expression: xpointer(range-to(id('chapter2')))
++Object is a Location Set:
++1 :   Object is a range :
++  From node
++     /
++  To node
++    ELEMENT chapter
++      ATTRIBUTE id
++        TEXT
++          content=3Dchapter2
++
+diff --git a/test/XPath/xptr/vidbase b/test/XPath/xptr/vidbase index=20
+b146383..884b106 100644
+--- a/test/XPath/xptr/vidbase
++++ b/test/XPath/xptr/vidbase
+@@ -1,2 +1,3 @@
+ xpointer(id('chapter1')/p)
+ xpointer(id('chapter1')/p[1]/range-to(following-sibling::p[2]))
++xpointer(range-to(id('chapter2')))
+diff --git a/xpath.c b/xpath.c
+index d992841..5a01b1b 100644
+--- a/xpath.c
++++ b/xpath.c
+@@ -10691,13 +10691,18 @@ xmlXPathCompPathExpr(xmlXPathParserContextPtr ct=
xt) {
+ 		    lc =3D 1;
+ 		    break;
+ 		} else if ((NXT(len) =3D=3D '(')) {
+-		    /* Note Type or Function */
++		    /* Node Type or Function */
+ 		    if (xmlXPathIsNodeType(name)) {
+ #ifdef DEBUG_STEP
+ 		        xmlGenericError(xmlGenericErrorContext,
+ 				"PathExpr: Type search\n");
+ #endif
+ 			lc =3D 1;
++#ifdef LIBXML_XPTR_ENABLED
++                    } else if (ctxt->xptr &&
++                               xmlStrEqual(name, BAD_CAST "range-to")) {
++                        lc =3D 1;
++#endif
+ 		    } else {
+ #ifdef DEBUG_STEP
+ 		        xmlGenericError(xmlGenericErrorContext,
+diff --git a/xpointer.c b/xpointer.c
+index 676c510..d74174a 100644
+--- a/xpointer.c
++++ b/xpointer.c
+@@ -1332,8 +1332,6 @@ xmlXPtrNewContext(xmlDocPtr doc, xmlNodePtr here, xm=
lNodePtr origin) {
+     ret->here =3D here;
+     ret->origin =3D origin;
+=20
+-    xmlXPathRegisterFunc(ret, (xmlChar *)"range-to",
+-	                 xmlXPtrRangeToFunction);
+     xmlXPathRegisterFunc(ret, (xmlChar *)"range",
+ 	                 xmlXPtrRangeFunction);
+     xmlXPathRegisterFunc(ret, (xmlChar *)"range-inside", @@ -2243,76=20
++2241,14 @@ xmlXPtrRangeInsideFunction(xmlXPathParserContextPtr ctxt,=20
+int nargs) {
+  * @nargs:  the number of args
+  *
+  * Implement the range-to() XPointer function
++ *
++ * Obsolete. range-to is not a real function but a special type of=20
++ location
++ * step which is handled in xpath.c.
+  */
+ void
+-xmlXPtrRangeToFunction(xmlXPathParserContextPtr ctxt, int nargs) {
+-    xmlXPathObjectPtr range;
+-    const xmlChar *cur;
+-    xmlXPathObjectPtr res, obj;
+-    xmlXPathObjectPtr tmp;
+-    xmlLocationSetPtr newset =3D NULL;
+-    xmlNodeSetPtr oldset;
+-    int i;
+-
+-    if (ctxt =3D=3D NULL) return;
+-    CHECK_ARITY(1);
+-    /*
+-     * Save the expression pointer since we will have to evaluate
+-     * it multiple times. Initialize the new set.
+-     */
+-    CHECK_TYPE(XPATH_NODESET);
+-    obj =3D valuePop(ctxt);
+-    oldset =3D obj->nodesetval;
+-    ctxt->context->node =3D NULL;
+-
+-    cur =3D ctxt->cur;
+-    newset =3D xmlXPtrLocationSetCreate(NULL);
+-
+-    for (i =3D 0; i < oldset->nodeNr; i++) {
+-	ctxt->cur =3D cur;
+-
+-	/*
+-	 * Run the evaluation with a node list made of a single item
+-	 * in the nodeset.
+-	 */
+-	ctxt->context->node =3D oldset->nodeTab[i];
+-	tmp =3D xmlXPathNewNodeSet(ctxt->context->node);
+-	valuePush(ctxt, tmp);
+-
+-	xmlXPathEvalExpr(ctxt);
+-	CHECK_ERROR;
+-
+-	/*
+-	 * The result of the evaluation need to be tested to
+-	 * decided whether the filter succeeded or not
+-	 */
+-	res =3D valuePop(ctxt);
+-	range =3D xmlXPtrNewRangeNodeObject(oldset->nodeTab[i], res);
+-	if (range !=3D NULL) {
+-	    xmlXPtrLocationSetAdd(newset, range);
+-	}
+-
+-	/*
+-	 * Cleanup
+-	 */
+-	if (res !=3D NULL)
+-	    xmlXPathFreeObject(res);
+-	if (ctxt->value =3D=3D tmp) {
+-	    res =3D valuePop(ctxt);
+-	    xmlXPathFreeObject(res);
+-	}
+-
+-	ctxt->context->node =3D NULL;
+-    }
+-
+-    /*
+-     * The result is used as the new evaluation set.
+-     */
+-    xmlXPathFreeObject(obj);
+-    ctxt->context->node =3D NULL;
+-    ctxt->context->contextSize =3D -1;
+-    ctxt->context->proximityPosition =3D -1;
+-    valuePush(ctxt, xmlXPtrWrapLocationSet(newset));
++xmlXPtrRangeToFunction(xmlXPathParserContextPtr ctxt,
++                       int nargs ATTRIBUTE_UNUSED) {
++    XP_ERROR(XPATH_EXPR_ERROR);
+ }
+=20
+ /**
+--
+2.7.4
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/=
libxml/libxml2_2.9.4.bb
index 59874be..1fed90b 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.=
gz;name=3Dlibtar \
            file://run-ptest \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
+           file://libxml2-CVE-2016-5131.patch \
           "
=20
 SRC_URI[libtar.md5sum] =3D "ae249165c173b1ff386ee8ad676815f5"
--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

