Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FEDC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 13:49:47 +0000 (UTC)
Received: from a11-127.smtp-out.amazonses.com (a11-127.smtp-out.amazonses.com [54.240.11.127])
 by mx.groups.io with SMTP id smtpd.web11.9144.1677073781575702006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 05:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=J4L+71/1;
 spf=pass (domain: amazonses.com, ip: 54.240.11.127, mailfrom: 0100018679630f6c-73495791-c342-49dd-8686-28447f180ae3-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1677073780;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=CExTSd2cp6HW11m9rLHJvojxDCVtOVDnXuyfY4Dohno=;
	b=J4L+71/1ubSCQt4dy9/2us6mDChEvgm6exgkGzg86dyu25qlri6iSC3qkUO/7YC7
	r7vMSp8QGnez+WnJSZZdfhyxSM9DvWSl8lnYHzTkmiiyoffs6yTiOKIwM/vsdkjYpe0
	M+osHv5cxGoXpcmRvyIy7X/+7MPzI3aezKZaKQpc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1677073780;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=CExTSd2cp6HW11m9rLHJvojxDCVtOVDnXuyfY4Dohno=;
	b=JZghorxVx7oqPbplBj9VqzN6PBHl4wqME8rLPFsIs5AKCQZNQn4F+DEeqDrsUGjq
	0B7GAlnSIpRvWhMza5zBEXebvFoY9VjHd3k+9oHl5ke1+c30MTSoqO1ZpCwUYH/aqz9
	RIPA3ILKBAEQulgdsuFdiIn5p/+ew9sy3sYydwVw=
Subject: [PATCH] docbook-xml: Switch from debian packages to upstream docbook
 sources
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
Date: Wed, 22 Feb 2023 13:49:40 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <20230222134932.260932-1-rich@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRsSBfl5J2XBRTK+UlXpt6TFZ1Q==
Thread-Topic: [PATCH] docbook-xml: Switch from debian packages to upstream
 docbook sources
X-Original-Mailer: git-send-email 2.34.1
X-Wm-Sent-Timestamp: 1677073779
Message-ID: <0100018679630f6c-73495791-c342-49dd-8686-28447f180ae3-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.22-54.240.11.127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 13:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177570

This patch changes the docbook-xml distribution package source from=0D=0A=
debian to docbook which aligns the recipe with the source=0D=0Aoriginator=
=2E Other changes made to the recipe include:=0D=0A=0D=0AThis patch resol=
ves [YOCTO #13270].=0D=0A=0D=0A- removal of version 4.0 given docbook no =
longer distributes version=0D=0A  4.0=0D=0A- simplification of the header=
 description.=0D=0A- inline comments to communicate the rationale behind =
gathering=0D=0A  multiple versions and LICENSE file handling.=0D=0A- mino=
r ordering changes to align with styling conventions and better=0D=0A  co=
ntext to better communicate use=0D=0A- Added commend about magic XMLCATAL=
OGS variable. This variable and=0D=0A  subsequent inherit might be better=
 placed in recipes that depend on=0D=0A  docbook-xml but leave it for now=
 to not cause a patch landslide.=0D=0A- Modify the related docbook-xml pa=
tch to remove docbook-xml-4.0 since=0D=0A  it is no longer provided.=0D=0A=
- Put BBCLASSEXTEND to end of recipe per RP note on convention=0D=0A=0D=0A=
Signed-off-by: Richard Elberger <rich@richelberger.com>=0D=0A---=0D=0A ..=
=2E/docbook-xml-update-catalog.xml.patch      | 89 +------------------=0D=
=0A .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 60 +++++++++----=0D=0A=
 2 files changed, 43 insertions(+), 106 deletions(-)=0D=0A=0D=0Adiff --gi=
t a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update=
-catalog.xml.patch b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/d=
ocbook-xml-update-catalog.xml.patch=0D=0Aindex c1385631d7..1f3364900c 100=
644=0D=0A--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook=
-xml-update-catalog.xml.patch=0D=0A+++ b/meta/recipes-devtools/docbook-xm=
l/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch=0D=0A@@ -1,97 +1,=
12 @@=0D=0A+21/3/2023: modified to remove 4.0=0D=0A+=0D=0A docbook-xml: u=
pdate catalog.xml=0D=0A=20=0D=0A Refer Ubuntu 13.04 to update catalog.xml=
=0D=0A=20=0D=0A Upstream-Status: Inappropriate [docbook 4.x development h=
as ceased, docbook 5 is entirely different]=0D=0A Signed-off-by: Hongxu J=
ia <hongxu.jia@windriver.com>=0D=0A----=0D=0A- docbook-4.0/catalog.xml   =
| 72 +++++++++++++++++++++++++++++++++++++++++++++++=0D=0A- docbook-4.1.2=
/catalog.xml | 66 +++++++++++++++++++++++++++++++++++++++++++=0D=0A- docb=
ook-4.2/catalog.xml   | 69 ++++++---------------------------------------=0D=
=0A- docbook-4.3/catalog.xml   | 72 ++++++++-----------------------------=
----------=0D=0A- docbook-4.4/catalog.xml   | 63 ++----------------------=
-----------------=0D=0A- docbook-4.5/catalog.xml   | 63 ++---------------=
------------------------=0D=0A- 6 files changed, 165 insertions(+), 240 d=
eletions(-)=0D=0A- create mode 100644 docbook-4.0/catalog.xml=0D=0A- crea=
te mode 100644 docbook-4.1.2/catalog.xml=0D=0A=20=0D=0A-diff --git a/docb=
ook-4.0/catalog.xml b/docbook-4.0/catalog.xml=0D=0A-new file mode 100644=0D=
=0A---- /dev/null=0D=0A-+++ b/docbook-4.0/catalog.xml=0D=0A-@@ -0,0 +1,72=
 @@=0D=0A-+<=3Fxml version=3D'1.0'=3F>=0D=0A-+<!DOCTYPE catalog PUBLIC "-=
//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"=20=0D=0A-+    "http:=
//www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">=0D=0A-+=0D=
=0A-+<catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog">=0D=0A=
-+=0D=0A-+<!-- ..........................................................=
=2E........... -->=0D=0A-+<!-- XML Catalog data for DocBook XML V4.0.....=
=2E......................... -->=0D=0A-+<!-- File catalog.xml ...........=
=2E......................................... -->=0D=0A-+=0D=0A-+<!-- Plea=
se direct all questions, bug reports, or suggestions for=0D=0A-+     chan=
ges to the docbook@lists.oasis-open.org mailing list. For more=0D=0A-+   =
  information, see http://www.oasis-open.org/.=0D=0A-+  -->=0D=0A-+=0D=0A=
-+<!-- This is the catalog data file for DocBook V4.0. It is provided as=0D=
=0A-+     a convenience in building your own catalog files. You need not =
use=0D=0A-+     the filenames listed here, and need not use the filename =
method of=0D=0A-+     identifying storage objects at all.  See the docume=
ntation for=0D=0A-+     detailed information on the files associated with=
 the DocBook DTD.=0D=0A-+     See XML Catalogs at http://www.oasis-open.o=
rg/committees/entity/ for=0D=0A-+     detailed information on supplying a=
nd using catalog data.=0D=0A-+  -->=0D=0A-+=0D=0A-+<!-- .................=
=2E.................................................... -->=0D=0A-+<!-- D=
ocBook driver file .................................................. -->=
=0D=0A-+=0D=0A-+<public publicId=3D"-//Norman Walsh//DTD DocBk XML V4.0//=
EN"=0D=0A-+        uri=3D"docbookx.dtd"/>=0D=0A-+=0D=0A-+<!-- Other ways =
to refer to DocBook XML v4.0............................... -->=0D=0A-+<p=
ublic publicId=3D"-//Norman Walsh//DTD DocBook XML V4.0//EN"=0D=0A-+     =
   uri=3D"docbookx.dtd"/>=0D=0A-+=0D=0A-+<system systemId=3D"http://www.o=
asis-open.org/docbook/xml/4.0/docbookx.dtd"=0D=0A-+        uri=3D"docbook=
x.dtd"/>=0D=0A-+=0D=0A-+<!-- ............................................=
=2E......................... -->=0D=0A-+<!-- DocBook modules ............=
=2E......................................... -->=0D=0A-+=0D=0A-+<public p=
ublicId=3D"-//Norman Walsh//ENTITIES DocBook XML Notations V4.0//EN"=0D=0A=
-+        uri=3D"dbnotnx.mod"/>=0D=0A-+=0D=0A-+<public publicId=3D"-//Nor=
man Walsh//ENTITIES DocBook XML Character Entities V4.0//EN"=0D=0A-+     =
   uri=3D"dbcentx.mod"/>=0D=0A-+=0D=0A-+<public publicId=3D"-//Norman Wal=
sh//ELEMENTS DocBook XML Information Pool V4.0//EN"=0D=0A-+        uri=3D=
"dbpoolx.mod"/>=0D=0A-+=0D=0A-+<public publicId=3D"-//Norman Walsh//ELEME=
NTS DocBook XML Document Hierarchy V4.0//EN"=0D=0A-+        uri=3D"dbhier=
x.mod"/>=0D=0A-+=0D=0A-+<public publicId=3D"-//Norman Walsh//ENTITIES Doc=
Book XML Additional General Entities V4.0//EN"=0D=0A-+        uri=3D"dbge=
nent.mod"/>=0D=0A-+=0D=0A-+<public publicId=3D"-//Norman Walsh//DTD CALS =
Table Model XML V4.0//EN"=0D=0A-+        uri=3D"calstblx.dtd"/>=0D=0A-+=0D=
=0A-+<!-- UNOFFICIAL conversion of the exchange table model to XML, based=
 on the OASIS Exchange -->=0D=0A-+<!--    Table Model PUBLIC "-//SGML Ope=
n//DTD Exchange Table Model 19960430//EN"           -->=0D=0A-+<public pu=
blicId=3D"-//Normal Walsh//Exchange Table Model 19960430 XML V4.0//EN"=0D=
=0A-+        uri=3D"soextblx.dtd"/>=0D=0A-+=0D=0A-+<!-- the following FPI=
 is declared for the DTD inside the DTD, but we'll -->=0D=0A-+<!-- use th=
e version from the latest DocBook=0D=0A-+<public publicId=3D"-//OASIS//DT=
D XML Exchange Table Model 19990315//EN"=0D=0A-+        uri=3D"soextblx.d=
td"/> -->=0D=0A-+=0D=0A-+<!-- End of catalog data for DocBook XML V4.0 ..=
=2E.......................... -->=0D=0A-+<!-- ...........................=
=2E.......................................... -->=0D=0A-+=0D=0A-+</catalo=
g>=0D=0A diff --git a/docbook-4.1.2/catalog.xml b/docbook-4.1.2/catalog.x=
ml=0D=0A new file mode 100644=0D=0A --- /dev/null=0D=0Adiff --git a/meta/=
recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devto=
ols/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0Aindex 2bec1442af..e4b4201b1f=
 100644=0D=0A--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5=
=2Ebb=0D=0A+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.b=
b=0D=0A@@ -1,30 +1,47 @@=0D=0A SUMMARY =3D "Document type definitions for=
 verification of XML data files"=0D=0A DESCRIPTION =3D "Document type def=
initions for verification of XML data \=0D=0A-files against the DocBook r=
ule set, it ships with the latest DocBook 4.5 \=0D=0A-XML DTD, as well as=
 a selected set of legacy DTDs for use with older \=0D=0A-documents, incl=
uding 4.0, 4.1.2, 4.2, 4.3 and 4.4"=0D=0A-HOMEPAGE =3D "http://www.docboo=
k.org/xml/"=0D=0A+files against the DocBook rule set."=0D=0A+HOMEPAGE =3D=
 "https://docbook.org"=0D=0A+=0D=0A+# The upstream sources are not distri=
buted with a license file.=0D=0A+# LICENSE-OASIS is included as a "patch"=
 to workaround this. When=0D=0A+# upgrading this recipe, please verify wh=
ether this is still needed.=0D=0A=20=0D=0A LICENSE =3D "OASIS"=0D=0A LIC_=
FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e=
669e7639a0b1d2e"=0D=0A=20=0D=0A-# Note: the upstream sources are not dist=
ributed with a license file.=0D=0A-# LICENSE-OASIS is included as a "patc=
h" to workaround this. When=0D=0A-# upgrading this recipe, please verify =
whether this is still needed.=0D=0A-SRC_URI =3D "http://snapshot.debian.o=
rg/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${=
PV}.orig.tar.gz \=0D=0A-           file://LICENSE-OASIS \=0D=0A-         =
  file://docbook-xml-update-catalog.xml.patch \=0D=0A-"=0D=0A+# To suppor=
t apps with xml schema backward compatibility, we must=0D=0A+# install a =
set of schemas. Install the latest based on PV and then=0D=0A+# name any =
specific versions as required. TODO: Figure out a mechanism=0D=0A+# to fi=
lter exactly which versions are necessary, if that's even=0D=0A+# possibl=
e.=0D=0A+#=0D=0A+# DocBook.org lists available release packages at https:=
//docbook.org/xml/.=0D=0A+#=0D=0A+# The release packages relate docbook s=
ource at=0D=0A+# https://github.com/docbook/docbook but building them req=
uires the=0D=0A+# Gradle build system. In future, it might be safer to us=
e the source=0D=0A+# tree which would also enable proper SBOM generation =
through the=0D=0A+# bitbake build system.=0D=0A+#=0D=0A=20=0D=0A-SRC_URI[=
md5sum] =3D "487b4d44e15cffb1f4048af23f98208e"=0D=0A-SRC_URI[sha256sum] =3D=
 "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"=0D=0A=
+SRC_URI =3D "https://docbook.org/xml/4.1.2/docbkx412.zip;name=3Dpayload4=
12;subdir=3Ddocbook-4.1.2 \=0D=0A+           https://docbook.org/xml/4.2/=
docbook-xml-4.2.zip;name=3Dpayload42;subdir=3Ddocbook-4.2 \=0D=0A+       =
    https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=3Dpayload43;subd=
ir=3Ddocbook-4.3 \=0D=0A+           https://docbook.org/xml/4.4/docbook-x=
ml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-4.4 \=0D=0A+           https=
://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=3DpayloadPV;subdir=3D=
docbook-${PV} \=0D=0A+           file://docbook-xml-update-catalog.xml.pa=
tch \=0D=0A+           file://LICENSE-OASIS"=0D=0A=20=0D=0A-UPSTREAM_CHEC=
K_URI =3D "${DEBIAN_MIRROR}/main/d/docbook-xml/"=0D=0A+SRC_URI[payload412=
=2Esha256sum] =3D "30f0644064e0ea71751438251940b1431f46acada814a062870f48=
6c772e7772"=0D=0A+SRC_URI[payload42.sha256sum] =3D "acc4601e4f97a196076b7=
e64b368d9248b07c7abf26b34a02cca40eeebe60fa2"=0D=0A+SRC_URI[payload43.sha2=
56sum] =3D "23068a94ea6fd484b004c5a73ec36a66aa47ea8f0d6b62cc1695931f5c143=
464"=0D=0A+SRC_URI[payload44.sha256sum] =3D "02f159eb88c4254d95e831c51c14=
4b1863b216d909b5ff45743a1ce6f5273090"=0D=0A+SRC_URI[payloadPV.sha256sum] =
=3D "4e4e037a2b83c98c6c94818390d4bdd3f6e10f6ec62dd79188594e26190dc7b4"=0D=
=0A=20=0D=0A-S =3D "${WORKDIR}/docbook-xml-4.5.c31424"=0D=0A+UPSTREAM_CHE=
CK_REGEX =3D "docbook-xml-(=3FP<pver>4(\.\d+)).zip"=0D=0A=20=0D=0A-inheri=
t allarch=0D=0A-BBCLASSEXTEND =3D "native"=0D=0A+S =3D "${WORKDIR}"=0D=0A=
=20=0D=0A do_configure (){=0D=0A     :=0D=0A@@ -38,15 +55,20 @@ do_instal=
l () {=0D=0A     install -d ${D}${sysconfdir}/xml/=0D=0A     xmlcatalog -=
-create --noout ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A=20=0D=0A-    =
for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A+    for DTDVERSION =
in 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A         DEST=3D${datadir}/xml/docbook/=
schema/dtd/$DTDVERSION=0D=0A         install -d -m 755 ${D}$DEST=0D=0A   =
      cp -v -R docbook-$DTDVERSION/* ${D}$DEST=0D=0A-        xmlcatalog -=
-verbose --noout --add nextCatalog unused file://$DEST/catalog.xml ${D}${=
sysconfdir}/xml/docbook-xml.xml=0D=0A+        xmlcatalog --verbose --noou=
t --add nextCatalog unused \=0D=0A+          file://$DEST/catalog.xml ${D=
}${sysconfdir}/xml/docbook-xml.xml=0D=0A     done=0D=0A }=0D=0A=20=0D=0A+=
# Magic environment variable is required for downstream recipe processing=
=0D=0A XMLCATALOGS =3D "${sysconfdir}/xml/docbook-xml.xml"=0D=0A inherit =
xmlcatalog=0D=0A=20=0D=0A FILES:${PN} =3D "${datadir}/* ${sysconfdir}/xml=
/docbook-xml.xml"=0D=0A+=0D=0A+inherit allarch=0D=0A+BBCLASSEXTEND =3D "n=
ative"=0D=0A--=20=0D=0A2.34.1=0D=0A=0D=0A

