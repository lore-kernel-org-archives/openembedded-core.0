Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D666C636CC
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 21:38:21 +0000 (UTC)
Received: from a11-77.smtp-out.amazonses.com (a11-77.smtp-out.amazonses.com [54.240.11.77])
 by mx.groups.io with SMTP id smtpd.web10.6573.1676842699210446666
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 13:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=T7BoUxxK;
 spf=pass (domain: amazonses.com, ip: 54.240.11.77, mailfrom: 010001866b9d0634-676dbda8-5f68-4a16-b3f2-5b80d490524a-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676842698;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=pxbQVVJc1JX5u+tr5bUbQlOHv5wdfA1NYvYMacY+OV0=;
	b=T7BoUxxKScZ4/a9M3R2IS09D5WBDsJlFcRvINk1nUBZskOf3Df8V73TSgNgUUMGP
	W1r2zv3RT2wgHRruoQO4cZg4VpvznesWDz6K6TRCCO+Ug84vPvEU4Ivuw7EFv84AB/v
	FnYl+cmA5wVO6Vc+FCbS+BG5WDGTP4LG1BFjgHcc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676842698;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=pxbQVVJc1JX5u+tr5bUbQlOHv5wdfA1NYvYMacY+OV0=;
	b=gm63f3M6cMETI5WEGQ8+bmNf5Lr4G9LhgyUjz7+0P+JurEOJUGXRc8LuKiwlRhZu
	94fRp6QKuTXlLUBhjXk4CSGOSBVtA2Exg3r+zX3VtQQdgXLKQ7UOfWSo4oJ3JZ1nu9u
	CyiyydvIhCFUvWYPgxZa/MSugyeWvOQfa3CiKCLA=
Subject: [PATCH 2/2] [YOCTO #13270] docbook-xml-dtd: refactor for style, add
 version check regex
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
Date: Sun, 19 Feb 2023 21:38:18 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230219213807.3415938-1-rich@richelberger.com>
References: <20230219213807.3415938-1-rich@richelberger.com> 
 <20230219213807.3415938-2-rich@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRKp3Rd+89yRvQFycCVf28l/dgwAAALvo
Thread-Topic: [PATCH 2/2] [YOCTO #13270] docbook-xml-dtd: refactor for style,
 add version check regex
X-Original-Mailer: git-send-email 2.34.1
X-Wm-Sent-Timestamp: 1676842697
Message-ID: <010001866b9d0634-676dbda8-5f68-4a16-b3f2-5b80d490524a-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.19-54.240.11.77
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 21:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177392

Try to keep everything else the same. Added package version filtering=0D=0A=
for devtool upgrade check. 4.0 no longer available on docbook.org so=0D=0A=
removed.=0D=0A=0D=0ASigned-off-by: Richard Elberger <rich@richelberger.co=
m>=0D=0A---=0D=0A .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 37 ++++=
+++++----------=0D=0A 1 file changed, 18 insertions(+), 19 deletions(-)=0D=
=0A=0D=0Adiff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_=
4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0Ai=
ndex 71aa8c14ec..f8a5631d77 100644=0D=0A--- a/meta/recipes-devtools/docbo=
ok-xml/docbook-xml-dtd4_4.5.bb=0D=0A+++ b/meta/recipes-devtools/docbook-x=
ml/docbook-xml-dtd4_4.5.bb=0D=0A@@ -3,8 +3,12 @@ DESCRIPTION =3D "Documen=
t type definitions for verification of XML data \=0D=0A files against the=
 DocBook rule set."=0D=0A HOMEPAGE =3D "https://docbook.org"=0D=0A=20=0D=0A=
-inherit allarch=0D=0A-BBCLASSEXTEND =3D "native"=0D=0A+# The upstream so=
urces are not distributed with a license file.=0D=0A+# LICENSE-OASIS is i=
ncluded as a "patch" to workaround this. When=0D=0A+# upgrading this reci=
pe, please verify whether this is still needed.=0D=0A+=0D=0A+LICENSE =3D =
"OASIS"=0D=0A+LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3D=
c608985dd5f7f215e669e7639a0b1d2e"=0D=0A=20=0D=0A # To support apps with x=
ml schema backward compatibility, we must=0D=0A # install a set of schema=
s. Install the latest based on PV and then=0D=0A@@ -18,37 +22,32 @@ BBCLA=
SSEXTEND =3D "native"=0D=0A # to use the Gradle build system to do so. It=
 might be safer to use=0D=0A # the source tree which would also enable pr=
oper SBOM generation=0D=0A # through the bitbake build system. https://gi=
thub.com/docbook/docbook=0D=0A-#=20=0D=0A+#=0D=0A=20=0D=0A-S =3D "${WORKD=
IR}"=0D=0A+SRC_URI =3D "https://docbook.org/xml/4.1.2/docbkx412.zip;name=3D=
payload412;subdir=3Ddocbook-xml-4.1.2 \=0D=0A+           https://docbook.=
org/xml/4.2/docbook-xml-4.2.zip;name=3Dpayload42;subdir=3Ddocbook-xml-4.2=
 \=0D=0A+           https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=3D=
payload43;subdir=3Ddocbook-xml-4.3 \=0D=0A+           https://docbook.org=
/xml/4.4/docbook-xml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-xml-4.4 \=0D=
=0A+           https://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=3D=
payloadPV;subdir=3Ddocbook-xml-${PV} \=0D=0A+           file://LICENSE-OA=
SIS"=0D=0A=20=0D=0A-SRC_URI +=3D "https://docbook.org/xml/4.1.2/docbkx412=
=2Ezip;name=3Dpayload412;subdir=3Ddocbook-xml-4.1.2"=0D=0A SRC_URI[payloa=
d412.md5sum] =3D "900d7609fb7e6d78901b357e4acfbc17"=0D=0A SRC_URI[payload=
412.sha256sum] =3D "30f0644064e0ea71751438251940b1431f46acada814a062870f4=
86c772e7772"=0D=0A-=0D=0A-SRC_URI +=3D "https://docbook.org/xml/4.2/docbo=
ok-xml-4.2.zip;name=3Dpayload42;subdir=3Ddocbook-xml-4.2"=0D=0A SRC_URI[p=
ayload42.md5sum] =3D "73fe50dfe74ca631c1602f558ed8961f"=0D=0A SRC_URI[pay=
load42.sha256sum] =3D "acc4601e4f97a196076b7e64b368d9248b07c7abf26b34a02c=
ca40eeebe60fa2"=0D=0A-=0D=0A-SRC_URI +=3D "https://docbook.org/xml/4.3/do=
cbook-xml-4.3.zip;name=3Dpayload43;subdir=3Ddocbook-xml-4.3"=0D=0A SRC_UR=
I[payload43.md5sum] =3D "ab200202b9e136a144db1e0864c45074"=0D=0A SRC_URI[=
payload43.sha256sum] =3D "23068a94ea6fd484b004c5a73ec36a66aa47ea8f0d6b62c=
c1695931f5c143464"=0D=0A-=0D=0A-SRC_URI +=3D "https://docbook.org/xml/4.4=
/docbook-xml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-xml-4.4"=0D=0A SRC=
_URI[payload44.md5sum] =3D "cbb04e9a700955d88c50962ef22c1634"=0D=0A SRC_U=
RI[payload44.sha256sum] =3D "02f159eb88c4254d95e831c51c144b1863b216d909b5=
ff45743a1ce6f5273090"=0D=0A-=0D=0A-SRC_URI +=3D "https://docbook.org/xml/=
${PV}/docbook-xml-${PV}.zip;name=3DpayloadPV;subdir=3Ddocbook-xml-${PV}"=0D=
=0A SRC_URI[payloadPV.md5sum] =3D "03083e288e87a7e829e437358da7ef9e"=0D=0A=
 SRC_URI[payloadPV.sha256sum] =3D "4e4e037a2b83c98c6c94818390d4bdd3f6e10f=
6ec62dd79188594e26190dc7b4"=0D=0A=20=0D=0A-# The upstream sources are not=
 distributed with a license file.=0D=0A-# LICENSE-OASIS is included as a =
"patch" to workaround this. When=0D=0A-# upgrading this recipe, please ve=
rify whether this is still needed.=0D=0A=20=0D=0A-LICENSE =3D "OASIS"=0D=0A=
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd5f7=
f215e669e7639a0b1d2e"=0D=0A-SRC_URI +=3D "file://LICENSE-OASIS"=0D=0A+UPS=
TREAM_CHECK_REGEX =3D "docbook-xml-(=3FP<pver>4(\.\d+)).zip"=0D=0A+=0D=0A=
+S =3D "${WORKDIR}"=0D=0A+inherit allarch=0D=0A+BBCLASSEXTEND =3D "native=
"=0D=0A=20=0D=0A do_configure (){=0D=0A     :=0D=0A--=20=0D=0A2.34.1=0D=0A=
=0D=0A

