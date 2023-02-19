Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01860C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 18:22:29 +0000 (UTC)
Received: from a48-179.smtp-out.amazonses.com (a48-179.smtp-out.amazonses.com [54.240.48.179])
 by mx.groups.io with SMTP id smtpd.web10.2424.1676830942863074118
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 10:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=HQvYpzrh;
 spf=pass (domain: amazonses.com, ip: 54.240.48.179, mailfrom: 010001866ae9a28c-9050cb24-ba3f-4a9b-b8c5-a00bc936efbf-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676830942;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=O3v5U2FpXkQmV/0J3aqNCwDr+hVB02Dt9qzpvMusGMk=;
	b=HQvYpzrhb5IAcSJanzzxgyiX9UxDGPttM8DYYFNPOkTqKpAFpY/59ChIF3DJvmuD
	A5Ba0q0MZMHxMW1a5kXhsfoaXyvwPTtH78CGS+zQtCY+TrJXmjGMfO8lro08KvXiqx2
	U37iBn+pbZWDFHs4++gS24TRFbcIKh5eT1C/teBs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676830942;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=O3v5U2FpXkQmV/0J3aqNCwDr+hVB02Dt9qzpvMusGMk=;
	b=CPVtrXH21QY6NDhN4GIs9Mxt+UU9T0Z50rpI5rlWWwf6v4Z+JBLoKzazCe9ceo6w
	xx0sZAPs9Fk7/bJ5ZsBjtQ5yiEaK08T1A7MS2wvptIqD8JngA1YADa0EChWllmYbcTN
	d8OIZOjIFINJ50TiKNv2R1hSBeheXixrGwnQuivw=
Subject: Re: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml recipe
 to use docbook.org packages rather than hacked up debian package
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?Alexander_Kanavin?= <alex.kanavin@gmail.com>
Cc: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Feb 2023 18:22:21 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <CANNYZj8ejnyhpF9UBaHr6=CVZNxVNxjjQmpdxkut9oH0i33AjQ@mail.gmail.com>
References: <20230219112522.3391653-2-rich@richelberger.com> 
 <20230219112522.3391653-1-rich@richelberger.com> 
 <01000186696bfbd6-6ba3a526-b53d-4775-94cf-0b29b19f44dc-000000@email.amazonses.com> 
 <747cdeab-f37e-6bd2-ea9d-3038d94372a1@richelberger.com> 
 <CANNYZj_PtQ4yVdy1XspGKKAmZE4Mgfmm8D+5gf6D8mGMrc36ng@mail.gmail.com> 
 <010001866a8456a4-0d51027d-5588-4b3e-af46-9e09b84cfe2f-000000@email.amazonses.com> 
 <CANNYZj8ejnyhpF9UBaHr6=CVZNxVNxjjQmpdxkut9oH0i33AjQ@mail.gmail.com> 
 <1e455822-8e68-5e30-72b8-c4c1d18acb48@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRFTceYTVX42QQdWyqJeuPsKmTgAAAJI5AAlad9wADM79pwAOj5wG
Thread-Topic: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml
 recipe to use docbook.org packages rather than hacked up debian package
X-Wm-Sent-Timestamp: 1676830940
Message-ID: <010001866ae9a28c-9050cb24-ba3f-4a9b-b8c5-a00bc936efbf-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.19-54.240.48.179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 18:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177338

I tried `devtool latest-version` and it failed on one version - 5.2 -=20=0D=
=0Abecause it's still in RC.=0D=0A=0D=0ANote that there are massive break=
ing changes between Docbook 4x and 5x.=20=0D=0AGiven the defect I'm fixin=
g is to change the upstream source - and not=20=0D=0Arefactor the entire =
recipe - I believe the scope should keep to that and=20=0D=0Aanother defe=
ct filed for future versions. Please confirm this is=20=0D=0Areasonable.=0D=
=0A=0D=0AI did the other beatification changes per style guide and will r=
esubmit=20=0D=0Aonce I get confirmation.=0D=0A=0D=0AOn 2/19/23 12:31, Ale=
xander Kanavin wrote:=0D=0A> On Sun, 19 Feb 2023 at 17:31, Richard Elberg=
er <rich@richelberger.com> wrote:=0D=0A>=0D=0A>> For multiple assignment:=
 the reason is maintainability. The supported=0D=0A>> versions will chang=
e over time.=0D=0A> You can still place them in a newline-separated singl=
e assignment,=0D=0A> which is a lot more readable as the list of fetched =
items is then in a=0D=0A> single location in the recipe.=0D=0A> This is h=
ow all recipes in oe-core are structured.=0D=0A>=0D=0A>> Please confirm i=
f there are any other appreciations I must cover - I was=0D=0A>> unaware =
of this one and would like to batch them. If the appreciations=0D=0A>> ar=
e listed on a wiki please school me about that.=0D=0A> For now I do not h=
ave any others. I'd like to see a v2 first, as v1=0D=0A> makes it hard to=
 understand how the final recipe looks like with the=0D=0A> multiple SRC_=
URI approach. We used to have a bot that points out=0D=0A> common issues =
but it's unmaintained and falled into disrepair.=0D=0A>=0D=0A> There are =
numerous pages on the wiki collecting style and message tips:=0D=0A> http=
s://www.openembedded.org/wiki/Styleguide=0D=0A> https://www.openembedded.=
org/wiki/Commit_Patch_Message_Guidelines=0D=0A> https://www.openembedded.=
org/wiki/How_to_submit_a_patch_to_OpenEmbedded=0D=0A>=0D=0A> Alex=0D=0A>=0D=
=0A>> On 2/19/23 10:52, Alexander Kanavin wrote:=0D=0A>>> Can you please =
set SRC_URI with a single assignment; there is no=0D=0A>>> reason to +=3D=
 it multiple times.=0D=0A>>>=0D=0A>>> Verifying that 'devtool latest-vers=
ion works' would be also appreciated.=0D=0A>>>=0D=0A>>> Alex=0D=0A>>>=0D=0A=
>>> On Sun, 19 Feb 2023 at 12:25, Richard Elberger <rich@richelberger.com=
> wrote:=0D=0A>>>> ---=0D=0A>>>>    .../docbook-xml/docbook-xml-dtd4_4.5.=
bb       | 74 ++++++++++++-------=0D=0A>>>>    1 file changed, 49 inserti=
ons(+), 25 deletions(-)=0D=0A>>>>=0D=0A>>>> diff --git a/meta/recipes-dev=
tools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook=
-xml/docbook-xml-dtd4_4.5.bb=0D=0A>>>> index 2bec1442af..71aa8c14ec 10064=
4=0D=0A>>>> --- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.=
bb=0D=0A>>>> +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5=
=2Ebb=0D=0A>>>> @@ -1,30 +1,54 @@=0D=0A>>>>    SUMMARY =3D "Document type=
 definitions for verification of XML data files"=0D=0A>>>>    DESCRIPTION=
 =3D "Document type definitions for verification of XML data \=0D=0A>>>> =
-files against the DocBook rule set, it ships with the latest DocBook 4.5=
 \=0D=0A>>>> -XML DTD, as well as a selected set of legacy DTDs for use w=
ith older \=0D=0A>>>> -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"=
=0D=0A>>>> -HOMEPAGE =3D "http://www.docbook.org/xml/"=0D=0A>>>> +files a=
gainst the DocBook rule set."=0D=0A>>>> +HOMEPAGE =3D "https://docbook.or=
g"=0D=0A>>>>=0D=0A>>>> -LICENSE =3D "OASIS"=0D=0A>>>> -LIC_FILES_CHKSUM =3D=
 "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e7639a0b1d2e"=
=0D=0A>>>> +inherit allarch=0D=0A>>>> +BBCLASSEXTEND =3D "native"=0D=0A>>=
>>=0D=0A>>>> -# Note: the upstream sources are not distributed with a lic=
ense file.=0D=0A>>>> -# LICENSE-OASIS is included as a "patch" to workaro=
und this. When=0D=0A>>>> -# upgrading this recipe, please verify whether =
this is still needed.=0D=0A>>>> -SRC_URI =3D "http://snapshot.debian.org/=
archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}=
=2Eorig.tar.gz \=0D=0A>>>> -           file://LICENSE-OASIS \=0D=0A>>>> -=
           file://docbook-xml-update-catalog.xml.patch \=0D=0A>>>> -"=0D=0A=
>>>> +# To support apps with xml schema backward compatibility, we must=0D=
=0A>>>> +# install a set of schemas. Install the latest based on PV and t=
hen=0D=0A>>>> +# name any specific versions as required. TODO: Figure out=
 a mechanism=0D=0A>>>> +# to filter exactly which versions are necessary,=
 if that's even=0D=0A>>>> +# possible.=0D=0A>>>> +#=0D=0A>>>> +# DocBook.=
org lists available packages at https://docbook.org/xml/=0D=0A>>>> +#=0D=0A=
>>>> +# These packages are available as source but it requires the abilit=
y=0D=0A>>>> +# to use the Gradle build system to do so. It might be safer=
 to use=0D=0A>>>> +# the source tree which would also enable proper SBOM =
generation=0D=0A>>>> +# through the bitbake build system. https://github.=
com/docbook/docbook=0D=0A>>>> +#=0D=0A>>>>=0D=0A>>>> -SRC_URI[md5sum] =3D=
 "487b4d44e15cffb1f4048af23f98208e"=0D=0A>>>> -SRC_URI[sha256sum] =3D "b0=
f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"=0D=0A>>>>=
 +S =3D "${WORKDIR}"=0D=0A>>>>=0D=0A>>>> -UPSTREAM_CHECK_URI =3D "${DEBIA=
N_MIRROR}/main/d/docbook-xml/"=0D=0A>>>> +SRC_URI +=3D "https://docbook.o=
rg/xml/4.1.2/docbkx412.zip;name=3Dpayload412;subdir=3Ddocbook-xml-4.1.2"=0D=
=0A>>>> +SRC_URI[payload412.md5sum] =3D "900d7609fb7e6d78901b357e4acfbc17=
"=0D=0A>>>> +SRC_URI[payload412.sha256sum] =3D "30f0644064e0ea71751438251=
940b1431f46acada814a062870f486c772e7772"=0D=0A>>>>=0D=0A>>>> -S =3D "${WO=
RKDIR}/docbook-xml-4.5.c31424"=0D=0A>>>> +SRC_URI +=3D "https://docbook.o=
rg/xml/4.2/docbook-xml-4.2.zip;name=3Dpayload42;subdir=3Ddocbook-xml-4.2"=
=0D=0A>>>> +SRC_URI[payload42.md5sum] =3D "73fe50dfe74ca631c1602f558ed896=
1f"=0D=0A>>>> +SRC_URI[payload42.sha256sum] =3D "acc4601e4f97a196076b7e64=
b368d9248b07c7abf26b34a02cca40eeebe60fa2"=0D=0A>>>>=0D=0A>>>> -inherit al=
larch=0D=0A>>>> -BBCLASSEXTEND =3D "native"=0D=0A>>>> +SRC_URI +=3D "http=
s://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=3Dpayload43;subdir=3Ddoc=
book-xml-4.3"=0D=0A>>>> +SRC_URI[payload43.md5sum] =3D "ab200202b9e136a14=
4db1e0864c45074"=0D=0A>>>> +SRC_URI[payload43.sha256sum] =3D "23068a94ea6=
fd484b004c5a73ec36a66aa47ea8f0d6b62cc1695931f5c143464"=0D=0A>>>> +=0D=0A>=
>>> +SRC_URI +=3D "https://docbook.org/xml/4.4/docbook-xml-4.4.zip;name=3D=
payload44;subdir=3Ddocbook-xml-4.4"=0D=0A>>>> +SRC_URI[payload44.md5sum] =
=3D "cbb04e9a700955d88c50962ef22c1634"=0D=0A>>>> +SRC_URI[payload44.sha25=
6sum] =3D "02f159eb88c4254d95e831c51c144b1863b216d909b5ff45743a1ce6f52730=
90"=0D=0A>>>> +=0D=0A>>>> +SRC_URI +=3D "https://docbook.org/xml/${PV}/do=
cbook-xml-${PV}.zip;name=3DpayloadPV;subdir=3Ddocbook-xml-${PV}"=0D=0A>>>=
> +SRC_URI[payloadPV.md5sum] =3D "03083e288e87a7e829e437358da7ef9e"=0D=0A=
>>>> +SRC_URI[payloadPV.sha256sum] =3D "4e4e037a2b83c98c6c94818390d4bdd3f=
6e10f6ec62dd79188594e26190dc7b4"=0D=0A>>>> +=0D=0A>>>> +# The upstream so=
urces are not distributed with a license file.=0D=0A>>>> +# LICENSE-OASIS=
 is included as a "patch" to workaround this. When=0D=0A>>>> +# upgrading=
 this recipe, please verify whether this is still needed.=0D=0A>>>> +=0D=0A=
>>>> +LICENSE =3D "OASIS"=0D=0A>>>> +LIC_FILES_CHKSUM =3D "file://${WORKD=
IR}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e7639a0b1d2e"=0D=0A>>>> +SRC_=
URI +=3D "file://LICENSE-OASIS"=0D=0A>>>>=0D=0A>>>>    do_configure (){=0D=
=0A>>>>        :=0D=0A>>>> @@ -34,19 +58,19 @@ do_compile (){=0D=0A>>>>  =
      :=0D=0A>>>>    }=0D=0A>>>>=0D=0A>>>> +inherit xmlcatalog=0D=0A>>>> =
+=0D=0A>>>>    do_install () {=0D=0A>>>>        install -d ${D}${sysconfd=
ir}/xml/=0D=0A>>>>        xmlcatalog --create --noout ${D}${sysconfdir}/x=
ml/docbook-xml.xml=0D=0A>>>>=0D=0A>>>> -    for DTDVERSION in 4.0 4.1.2 4=
=2E2 4.3 4.4 4.5; do=0D=0A>>>> +    for DTDVERSION in 4.1.2 4.2 4.3 4.4 4=
=2E5; do=0D=0A>>>>            DEST=3D${datadir}/xml/docbook/schema/dtd/$D=
TDVERSION=0D=0A>>>>            install -d -m 755 ${D}$DEST=0D=0A>>>> -   =
     cp -v -R docbook-$DTDVERSION/* ${D}$DEST=0D=0A>>>> -        xmlcatal=
og --verbose --noout --add nextCatalog unused file://$DEST/catalog.xml ${=
D}${sysconfdir}/xml/docbook-xml.xml=0D=0A>>>> +        cp -v -R docbook-x=
ml-$DTDVERSION/* ${D}$DEST=0D=0A>>>> +        xmlcatalog --verbose --noou=
t --add nextCatalog unused \=0D=0A>>>> +          file://$DEST/catalog.xm=
l ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A>>>>        done=0D=0A>>>>  =
  }=0D=0A>>>>=0D=0A>>>> -XMLCATALOGS =3D "${sysconfdir}/xml/docbook-xml.x=
ml"=0D=0A>>>> -inherit xmlcatalog=0D=0A>>>> -=0D=0A>>>>    FILES:${PN} =3D=
 "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"=0D=0A>>>> --=0D=0A>>>> =
2.34.1=0D=0A>>>>=0D=0A>>>>=0D=0A>>>>=0D=0A>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=0D=0A>>>> Links: You receive all messages sent to this =
group.=0D=0A>>>> View/Reply Online (#177325): https://lists.openembedded.=
org/g/openembedded-core/message/177325=0D=0A>>>> Mute This Topic: https:/=
/lists.openembedded.org/mt/97064586/1686489=0D=0A>>>> Group Owner: openem=
bedded-core+owner@lists.openembedded.org=0D=0A>>>> Unsubscribe: https://l=
ists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]=0D=
=0A>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0D=0A>>>>=0D=0A

