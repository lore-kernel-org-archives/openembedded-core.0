Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7EBC05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 21:38:21 +0000 (UTC)
Received: from a11-122.smtp-out.amazonses.com (a11-122.smtp-out.amazonses.com [54.240.11.122])
 by mx.groups.io with SMTP id smtpd.web11.6604.1676842694937129549
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 13:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=aeSRsLr3;
 spf=pass (domain: amazonses.com, ip: 54.240.11.122, mailfrom: 010001866b9cf531-82d2c73e-d459-4055-93f9-a7c83fcce6f9-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676842694;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=s55fUdTqNzplFbjzIGs4Gnd7+1teVplikPNIHmmMuq4=;
	b=aeSRsLr3Ub2XZwVTyHZsQ3AVqEGtOx5vELVS63pLmOJpdi60+uImORD4Kr/zEJBv
	jAIYEIdMC6QVbII/NYk0bkRPtNzb6rME1gxmwlNAtaGHY46UWWBipCKfQ7PiK8xB1fK
	IIQWC6Y+MPqg3RxwehHUal1v8PdnoO4+vVlNpJUA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676842694;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=s55fUdTqNzplFbjzIGs4Gnd7+1teVplikPNIHmmMuq4=;
	b=AMnBf5GV4KHf2jRMa+PL701tDeQtqFWv+9ZsH8sPYrAqhiYCMwul8AdsGuGdERcq
	8Zvm7DrlVmJIMlEziwbw/tsxMLCV6L7TXuXH3U0vEPpeSDkvfMJy9VVZUX3XhYs99dB
	DH+dVM68RaXXcNbsowZici0i6FrSCzyChOdlHVu8=
Subject: [PATCH 1/2] [YOCTO #13270] Refactor the docbook-xml recipe to use
 docbook.org packages rather than hacked up debian package
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
Date: Sun, 19 Feb 2023 21:38:13 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <20230219213807.3415938-1-rich@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRKp3Rd+89yRvQFycCVf28l/dgw==
Thread-Topic: [PATCH 1/2] [YOCTO #13270] Refactor the docbook-xml recipe to
 use docbook.org packages rather than hacked up debian package
X-Original-Mailer: git-send-email 2.34.1
X-Wm-Sent-Timestamp: 1676842693
Message-ID: <010001866b9cf531-82d2c73e-d459-4055-93f9-a7c83fcce6f9-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.19-54.240.11.122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 21:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177391

---=0D=0A .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 74 ++++++++++++=
-------=0D=0A 1 file changed, 49 insertions(+), 25 deletions(-)=0D=0A=0D=0A=
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/=
meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0Aindex 2bec=
1442af..71aa8c14ec 100644=0D=0A--- a/meta/recipes-devtools/docbook-xml/do=
cbook-xml-dtd4_4.5.bb=0D=0A+++ b/meta/recipes-devtools/docbook-xml/docboo=
k-xml-dtd4_4.5.bb=0D=0A@@ -1,30 +1,54 @@=0D=0A SUMMARY =3D "Document type=
 definitions for verification of XML data files"=0D=0A DESCRIPTION =3D "D=
ocument type definitions for verification of XML data \=0D=0A-files again=
st the DocBook rule set, it ships with the latest DocBook 4.5 \=0D=0A-XML=
 DTD, as well as a selected set of legacy DTDs for use with older \=0D=0A=
-documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"=0D=0A-HOMEPAGE =3D "h=
ttp://www.docbook.org/xml/"=0D=0A+files against the DocBook rule set."=0D=
=0A+HOMEPAGE =3D "https://docbook.org"=0D=0A=20=0D=0A-LICENSE =3D "OASIS"=
=0D=0A-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc60898=
5dd5f7f215e669e7639a0b1d2e"=0D=0A+inherit allarch=0D=0A+BBCLASSEXTEND =3D=
 "native"=0D=0A=20=0D=0A-# Note: the upstream sources are not distributed=
 with a license file.=0D=0A-# LICENSE-OASIS is included as a "patch" to w=
orkaround this. When=0D=0A-# upgrading this recipe, please verify whether=
 this is still needed.=0D=0A-SRC_URI =3D "http://snapshot.debian.org/arch=
ive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.ori=
g.tar.gz \=0D=0A-           file://LICENSE-OASIS \=0D=0A-           file:=
//docbook-xml-update-catalog.xml.patch \=0D=0A-"=0D=0A+# To support apps =
with xml schema backward compatibility, we must=0D=0A+# install a set of =
schemas. Install the latest based on PV and then=0D=0A+# name any specifi=
c versions as required. TODO: Figure out a mechanism=0D=0A+# to filter ex=
actly which versions are necessary, if that's even=0D=0A+# possible.=0D=0A=
+#=0D=0A+# DocBook.org lists available packages at https://docbook.org/xm=
l/=0D=0A+#=0D=0A+# These packages are available as source but it requires=
 the ability=0D=0A+# to use the Gradle build system to do so. It might be=
 safer to use=0D=0A+# the source tree which would also enable proper SBOM=
 generation=0D=0A+# through the bitbake build system. https://github.com/=
docbook/docbook=0D=0A+#=20=0D=0A=20=0D=0A-SRC_URI[md5sum] =3D "487b4d44e1=
5cffb1f4048af23f98208e"=0D=0A-SRC_URI[sha256sum] =3D "b0f8edcf697f5318e63=
dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"=0D=0A+S =3D "${WORKDIR}"=0D=
=0A=20=0D=0A-UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/d/docbook-xml/=
"=0D=0A+SRC_URI +=3D "https://docbook.org/xml/4.1.2/docbkx412.zip;name=3D=
payload412;subdir=3Ddocbook-xml-4.1.2"=0D=0A+SRC_URI[payload412.md5sum] =3D=
 "900d7609fb7e6d78901b357e4acfbc17"=0D=0A+SRC_URI[payload412.sha256sum] =3D=
 "30f0644064e0ea71751438251940b1431f46acada814a062870f486c772e7772"=0D=0A=
=20=0D=0A-S =3D "${WORKDIR}/docbook-xml-4.5.c31424"=0D=0A+SRC_URI +=3D "h=
ttps://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=3Dpayload42;subdir=3D=
docbook-xml-4.2"=0D=0A+SRC_URI[payload42.md5sum] =3D "73fe50dfe74ca631c16=
02f558ed8961f"=0D=0A+SRC_URI[payload42.sha256sum] =3D "acc4601e4f97a19607=
6b7e64b368d9248b07c7abf26b34a02cca40eeebe60fa2"=0D=0A=20=0D=0A-inherit al=
larch=0D=0A-BBCLASSEXTEND =3D "native"=0D=0A+SRC_URI +=3D "https://docboo=
k.org/xml/4.3/docbook-xml-4.3.zip;name=3Dpayload43;subdir=3Ddocbook-xml-4=
=2E3"=0D=0A+SRC_URI[payload43.md5sum] =3D "ab200202b9e136a144db1e0864c450=
74"=0D=0A+SRC_URI[payload43.sha256sum] =3D "23068a94ea6fd484b004c5a73ec36=
a66aa47ea8f0d6b62cc1695931f5c143464"=0D=0A+=0D=0A+SRC_URI +=3D "https://d=
ocbook.org/xml/4.4/docbook-xml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-=
xml-4.4"=0D=0A+SRC_URI[payload44.md5sum] =3D "cbb04e9a700955d88c50962ef22=
c1634"=0D=0A+SRC_URI[payload44.sha256sum] =3D "02f159eb88c4254d95e831c51c=
144b1863b216d909b5ff45743a1ce6f5273090"=0D=0A+=0D=0A+SRC_URI +=3D "https:=
//docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=3DpayloadPV;subdir=3Dd=
ocbook-xml-${PV}"=0D=0A+SRC_URI[payloadPV.md5sum] =3D "03083e288e87a7e829=
e437358da7ef9e"=0D=0A+SRC_URI[payloadPV.sha256sum] =3D "4e4e037a2b83c98c6=
c94818390d4bdd3f6e10f6ec62dd79188594e26190dc7b4"=0D=0A+=0D=0A+# The upstr=
eam sources are not distributed with a license file.=0D=0A+# LICENSE-OASI=
S is included as a "patch" to workaround this. When=0D=0A+# upgrading thi=
s recipe, please verify whether this is still needed.=0D=0A+=0D=0A+LICENS=
E =3D "OASIS"=0D=0A+LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS=
;md5=3Dc608985dd5f7f215e669e7639a0b1d2e"=0D=0A+SRC_URI +=3D "file://LICEN=
SE-OASIS"=0D=0A=20=0D=0A do_configure (){=0D=0A     :=0D=0A@@ -34,19 +58,=
19 @@ do_compile (){=0D=0A     :=0D=0A }=0D=0A=20=0D=0A+inherit xmlcatalo=
g=0D=0A+=0D=0A do_install () {=0D=0A     install -d ${D}${sysconfdir}/xml=
/=0D=0A     xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbook-xml=
=2Exml=0D=0A=20=0D=0A-    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do=
=0D=0A+    for DTDVERSION in 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A         DEST=
=3D${datadir}/xml/docbook/schema/dtd/$DTDVERSION=0D=0A         install -d=
 -m 755 ${D}$DEST=0D=0A-        cp -v -R docbook-$DTDVERSION/* ${D}$DEST=0D=
=0A-        xmlcatalog --verbose --noout --add nextCatalog unused file://=
$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A+        cp =
-v -R docbook-xml-$DTDVERSION/* ${D}$DEST=0D=0A+        xmlcatalog --verb=
ose --noout --add nextCatalog unused \=0D=0A+          file://$DEST/catal=
og.xml ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A     done=0D=0A }=0D=0A=
=20=0D=0A-XMLCATALOGS =3D "${sysconfdir}/xml/docbook-xml.xml"=0D=0A-inher=
it xmlcatalog=0D=0A-=0D=0A FILES:${PN} =3D "${datadir}/* ${sysconfdir}/xm=
l/docbook-xml.xml"=0D=0A--=20=0D=0A2.34.1=0D=0A=0D=0A

