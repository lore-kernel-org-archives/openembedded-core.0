Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20102C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 20:46:01 +0000 (UTC)
Received: from a11-70.smtp-out.amazonses.com (a11-70.smtp-out.amazonses.com [54.240.11.70])
 by mx.groups.io with SMTP id smtpd.web10.5425.1676839554705735786
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 12:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=Jtn2Xknd;
 spf=pass (domain: amazonses.com, ip: 54.240.11.70, mailfrom: 010001866b6d0a7c-d5d7db67-d8a0-421b-bdda-e1b7130bbaae-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676839553;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=cU1xLdWjwm9OQlM6A3utBqQh7aKBOAK4OdSLY6WjkZ0=;
	b=Jtn2XknddpZA0Ay2eI6IfVVgez2OeNp4c/N07XpsJ8xTPC6R8tOeUS3lDz8+Bwm8
	SfdHs6rU3YsQZMU1PPHZ98pdbaEcSsm2W15REHGQ2Z82JNmUS68XqFlhP2ER4rXNbwf
	G7esUH35FTbJku7b6kLP8YN0XmW+BzAWz26PgVUs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676839553;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=cU1xLdWjwm9OQlM6A3utBqQh7aKBOAK4OdSLY6WjkZ0=;
	b=TGdAQgJRpGcla8sRJwYgOp6Jlgt50s3Gxvy381xb0bDTakBM+UkAWtutcRRvQpw9
	Blzv/kC6wD3OP7emPfFCakIbQlLGvPo3lEpc1y4BLGQB13SVGOVT0VBDtU+mvZOrMr3
	IklX4narfGxPWwnp0L8GwJbG760xZtSHyklH2DUs=
Subject: Re: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml recipe
 to use docbook.org packages rather than hacked up debian package
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?Alexander_Kanavin?= <alex.kanavin@gmail.com>
Cc: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Feb 2023 20:45:53 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <CANNYZj8kF=W8LBP7zyyYRrJiPUkxcaXqxc87PBiQCBXu1ksNTA@mail.gmail.com>
References: <20230219112522.3391653-2-rich@richelberger.com> 
 <20230219112522.3391653-1-rich@richelberger.com> 
 <01000186696bfbd6-6ba3a526-b53d-4775-94cf-0b29b19f44dc-000000@email.amazonses.com> 
 <747cdeab-f37e-6bd2-ea9d-3038d94372a1@richelberger.com> 
 <CANNYZj_PtQ4yVdy1XspGKKAmZE4Mgfmm8D+5gf6D8mGMrc36ng@mail.gmail.com> 
 <010001866a8456a4-0d51027d-5588-4b3e-af46-9e09b84cfe2f-000000@email.amazonses.com> 
 <1e455822-8e68-5e30-72b8-c4c1d18acb48@richelberger.com> 
 <CANNYZj8ejnyhpF9UBaHr6=CVZNxVNxjjQmpdxkut9oH0i33AjQ@mail.gmail.com> 
 <010001866ae9a28c-9050cb24-ba3f-4a9b-b8c5-a00bc936efbf-000000@email.amazonses.com> 
 <17454DD71A4E7B0B.32742@lists.openembedded.org> 
 <2b4a87bc-d5ca-800f-852f-414070ed31ff@richelberger.com> 
 <CANNYZj9+6uQjy=5+rWfYBBmzfwJQHB4YNWH3-DAEunB+mdrinw@mail.gmail.com> 
 <010001866b5c73fa-530eb0cc-1137-4ccf-8ee7-aff4434b46ea-000000@email.amazonses.com> 
 <CANNYZj8kF=W8LBP7zyyYRrJiPUkxcaXqxc87PBiQCBXu1ksNTA@mail.gmail.com> 
 <eba0a002-efcb-3bde-e46d-d88c07bc9b2c@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRFTceYTVX42QQdWyqJeuPsKmTgAAAJI5AAlad9wADM79pwAPsApoABNZtUMAE5LD4w==
Thread-Topic: [OE-core] [PATCH] [YOCTO #13270] Refactor the docbook-xml
 recipe to use docbook.org packages rather than hacked up debian package
X-Wm-Sent-Timestamp: 1676839551
Message-ID: <010001866b6d0a7c-d5d7db67-d8a0-421b-bdda-e1b7130bbaae-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.19-54.240.11.70
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 20:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177385

I think doing this is out of scope of the bugfix. The latest-version=20=0D=
=0Acheck was not a constraint in the prior version.=0D=0A=0D=0AI suggest =
that we get the bug fixed and file another workitem for this=20=0D=0Apart=
icular ask.=0D=0A=0D=0AOn 2/19/23 15:39, Alexander Kanavin wrote:=0D=0A> =
412 can be specifically excluded as a 'bogus' version, examples exist=0D=0A=
> in oe-core.=0D=0A>=0D=0A> Version checks are used for manual upgrades t=
oo, as maintainers want=0D=0A> to be notified there's a new version, even=
 if autoupgrade can't handle=0D=0A> it. We just need to know if there's a=
 4.x release newer than 4.5, and=0D=0A> that can be covered by the check.=
=0D=0A>=0D=0A> Alex=0D=0A>=0D=0A> On Sun, 19 Feb 2023 at 21:27, Richard E=
lberger <rich@richelberger.com> wrote:=0D=0A>> I have been working on it,=
 but after a while I realized that this=0D=0A>> version upgrade will not =
work anyway - even for 4.x=0D=0A>>=0D=0A>> The reason is they have a fold=
er named "412" which is actually 4.1.2=0D=0A>> which I we probably still =
need to have in.=0D=0A>>=0D=0A>> Even though the tool cannot find 5.2 it =
still exits zero ... but still,=0D=0A>> it thinks that 412 > 5.2=0D=0A>>=0D=
=0A>> I see one of two things a/ do not autoupgrade and somehow mark for=0D=
=0A>> manual cyclical update b/ somehow apply a map capability=0D=0A>>=0D=
=0A>> Also given that multiple versions must be delivered in the same ver=
sion=0D=0A>> I don't think that this falls under typical autoupgrade scen=
ario.=0D=0A>>=0D=0A>> What are your thoughts=3F=0D=0A>>=0D=0A>> On 2/19/2=
3 13:54, Alexander Kanavin wrote:=0D=0A>>> If the check goes over https:/=
/docbook.org/xml/ I guess you can set=0D=0A>>> the regex to 4.x versions =
only, as the recipe name itself pins it to=0D=0A>>> 4.x. I'm not sure we'=
re even going to need 5.x, ever.=0D=0A>>> You can grep for UPSTREAM_CHECK=
_REGEX in core for examples.=0D=0A>>>=0D=0A>>> Alex=0D=0A>>>=0D=0A>>> On =
Sun, 19 Feb 2023 at 19:40, Alexander Kanavin via=0D=0A>>> lists.openembed=
ded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>=0D=0A>>> wrote:=
=0D=0A>>>> It helps if you provide devtool's output. I think it's possibl=
e to=0D=0A>>>> exclude rc versions from the check with UPSTREAM_CHECK_REG=
EX.=0D=0A>>>>=0D=0A>>>> Alex=0D=0A>>>>=0D=0A>>>> On Sun, 19 Feb 2023 at 1=
9:22, Richard Elberger <rich@richelberger.com> wrote:=0D=0A>>>>> I tried =
`devtool latest-version` and it failed on one version - 5.2 -=0D=0A>>>>> =
because it's still in RC.=0D=0A>>>>>=0D=0A>>>>> Note that there are massi=
ve breaking changes between Docbook 4x and 5x.=0D=0A>>>>> Given the defec=
t I'm fixing is to change the upstream source - and not=0D=0A>>>>> refact=
or the entire recipe - I believe the scope should keep to that and=0D=0A>=
>>>> another defect filed for future versions. Please confirm this is=0D=0A=
>>>>> reasonable.=0D=0A>>>>>=0D=0A>>>>> I did the other beatification cha=
nges per style guide and will resubmit=0D=0A>>>>> once I get confirmation=
=2E=0D=0A>>>>>=0D=0A>>>>> On 2/19/23 12:31, Alexander Kanavin wrote:=0D=0A=
>>>>>> On Sun, 19 Feb 2023 at 17:31, Richard Elberger <rich@richelberger.=
com> wrote:=0D=0A>>>>>>=0D=0A>>>>>>> For multiple assignment: the reason =
is maintainability. The supported=0D=0A>>>>>>> versions will change over =
time.=0D=0A>>>>>> You can still place them in a newline-separated single =
assignment,=0D=0A>>>>>> which is a lot more readable as the list of fetch=
ed items is then in a=0D=0A>>>>>> single location in the recipe.=0D=0A>>>=
>>> This is how all recipes in oe-core are structured.=0D=0A>>>>>>=0D=0A>=
>>>>>> Please confirm if there are any other appreciations I must cover -=
 I was=0D=0A>>>>>>> unaware of this one and would like to batch them. If =
the appreciations=0D=0A>>>>>>> are listed on a wiki please school me abou=
t that.=0D=0A>>>>>> For now I do not have any others. I'd like to see a v=
2 first, as v1=0D=0A>>>>>> makes it hard to understand how the final reci=
pe looks like with the=0D=0A>>>>>> multiple SRC_URI approach. We used to =
have a bot that points out=0D=0A>>>>>> common issues but it's unmaintaine=
d and falled into disrepair.=0D=0A>>>>>>=0D=0A>>>>>> There are numerous p=
ages on the wiki collecting style and message tips:=0D=0A>>>>>> https://w=
ww.openembedded.org/wiki/Styleguide=0D=0A>>>>>> https://www.openembedded.=
org/wiki/Commit_Patch_Message_Guidelines=0D=0A>>>>>> https://www.openembe=
dded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded=0D=0A>>>>>>=0D=0A>>>>=
>> Alex=0D=0A>>>>>>=0D=0A>>>>>>> On 2/19/23 10:52, Alexander Kanavin wrot=
e:=0D=0A>>>>>>>> Can you please set SRC_URI with a single assignment; the=
re is no=0D=0A>>>>>>>> reason to +=3D it multiple times.=0D=0A>>>>>>>>=0D=
=0A>>>>>>>> Verifying that 'devtool latest-version works' would be also a=
ppreciated.=0D=0A>>>>>>>>=0D=0A>>>>>>>> Alex=0D=0A>>>>>>>>=0D=0A>>>>>>>> =
On Sun, 19 Feb 2023 at 12:25, Richard Elberger <rich@richelberger.com> wr=
ote:=0D=0A>>>>>>>>> ---=0D=0A>>>>>>>>>      .../docbook-xml/docbook-xml-d=
td4_4.5.bb       | 74 ++++++++++++-------=0D=0A>>>>>>>>>      1 file chan=
ged, 49 insertions(+), 25 deletions(-)=0D=0A>>>>>>>>>=0D=0A>>>>>>>>> diff=
 --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta=
/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A>>>>>>>>> inde=
x 2bec1442af..71aa8c14ec 100644=0D=0A>>>>>>>>> --- a/meta/recipes-devtool=
s/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A>>>>>>>>> +++ b/meta/recipes-d=
evtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A>>>>>>>>> @@ -1,30 +1,54=
 @@=0D=0A>>>>>>>>>      SUMMARY =3D "Document type definitions for verifi=
cation of XML data files"=0D=0A>>>>>>>>>      DESCRIPTION =3D "Document t=
ype definitions for verification of XML data \=0D=0A>>>>>>>>> -files agai=
nst the DocBook rule set, it ships with the latest DocBook 4.5 \=0D=0A>>>=
>>>>>> -XML DTD, as well as a selected set of legacy DTDs for use with ol=
der \=0D=0A>>>>>>>>> -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"=0D=
=0A>>>>>>>>> -HOMEPAGE =3D "http://www.docbook.org/xml/"=0D=0A>>>>>>>>> +=
files against the DocBook rule set."=0D=0A>>>>>>>>> +HOMEPAGE =3D "https:=
//docbook.org"=0D=0A>>>>>>>>>=0D=0A>>>>>>>>> -LICENSE =3D "OASIS"=0D=0A>>=
>>>>>>> -LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608=
985dd5f7f215e669e7639a0b1d2e"=0D=0A>>>>>>>>> +inherit allarch=0D=0A>>>>>>=
>>> +BBCLASSEXTEND =3D "native"=0D=0A>>>>>>>>>=0D=0A>>>>>>>>> -# Note: th=
e upstream sources are not distributed with a license file.=0D=0A>>>>>>>>=
> -# LICENSE-OASIS is included as a "patch" to workaround this. When=0D=0A=
>>>>>>>>> -# upgrading this recipe, please verify whether this is still n=
eeded.=0D=0A>>>>>>>>> -SRC_URI =3D "http://snapshot.debian.org/archive/de=
bian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.=
gz \=0D=0A>>>>>>>>> -           file://LICENSE-OASIS \=0D=0A>>>>>>>>> -  =
         file://docbook-xml-update-catalog.xml.patch \=0D=0A>>>>>>>>> -"=0D=
=0A>>>>>>>>> +# To support apps with xml schema backward compatibility, w=
e must=0D=0A>>>>>>>>> +# install a set of schemas. Install the latest bas=
ed on PV and then=0D=0A>>>>>>>>> +# name any specific versions as require=
d. TODO: Figure out a mechanism=0D=0A>>>>>>>>> +# to filter exactly which=
 versions are necessary, if that's even=0D=0A>>>>>>>>> +# possible.=0D=0A=
>>>>>>>>> +#=0D=0A>>>>>>>>> +# DocBook.org lists available packages at ht=
tps://docbook.org/xml/=0D=0A>>>>>>>>> +#=0D=0A>>>>>>>>> +# These packages=
 are available as source but it requires the ability=0D=0A>>>>>>>>> +# to=
 use the Gradle build system to do so. It might be safer to use=0D=0A>>>>=
>>>>> +# the source tree which would also enable proper SBOM generation=0D=
=0A>>>>>>>>> +# through the bitbake build system. https://github.com/docb=
ook/docbook=0D=0A>>>>>>>>> +#=0D=0A>>>>>>>>>=0D=0A>>>>>>>>> -SRC_URI[md5s=
um] =3D "487b4d44e15cffb1f4048af23f98208e"=0D=0A>>>>>>>>> -SRC_URI[sha256=
sum] =3D "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44=
f"=0D=0A>>>>>>>>> +S =3D "${WORKDIR}"=0D=0A>>>>>>>>>=0D=0A>>>>>>>>> -UPST=
REAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/d/docbook-xml/"=0D=0A>>>>>>>>> =
+SRC_URI +=3D "https://docbook.org/xml/4.1.2/docbkx412.zip;name=3Dpayload=
412;subdir=3Ddocbook-xml-4.1.2"=0D=0A>>>>>>>>> +SRC_URI[payload412.md5sum=
] =3D "900d7609fb7e6d78901b357e4acfbc17"=0D=0A>>>>>>>>> +SRC_URI[payload4=
12.sha256sum] =3D "30f0644064e0ea71751438251940b1431f46acada814a062870f48=
6c772e7772"=0D=0A>>>>>>>>>=0D=0A>>>>>>>>> -S =3D "${WORKDIR}/docbook-xml-=
4.5.c31424"=0D=0A>>>>>>>>> +SRC_URI +=3D "https://docbook.org/xml/4.2/doc=
book-xml-4.2.zip;name=3Dpayload42;subdir=3Ddocbook-xml-4.2"=0D=0A>>>>>>>>=
> +SRC_URI[payload42.md5sum] =3D "73fe50dfe74ca631c1602f558ed8961f"=0D=0A=
>>>>>>>>> +SRC_URI[payload42.sha256sum] =3D "acc4601e4f97a196076b7e64b368=
d9248b07c7abf26b34a02cca40eeebe60fa2"=0D=0A>>>>>>>>>=0D=0A>>>>>>>>> -inhe=
rit allarch=0D=0A>>>>>>>>> -BBCLASSEXTEND =3D "native"=0D=0A>>>>>>>>> +SR=
C_URI +=3D "https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=3Dpayloa=
d43;subdir=3Ddocbook-xml-4.3"=0D=0A>>>>>>>>> +SRC_URI[payload43.md5sum] =3D=
 "ab200202b9e136a144db1e0864c45074"=0D=0A>>>>>>>>> +SRC_URI[payload43.sha=
256sum] =3D "23068a94ea6fd484b004c5a73ec36a66aa47ea8f0d6b62cc1695931f5c14=
3464"=0D=0A>>>>>>>>> +=0D=0A>>>>>>>>> +SRC_URI +=3D "https://docbook.org/=
xml/4.4/docbook-xml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-xml-4.4"=0D=
=0A>>>>>>>>> +SRC_URI[payload44.md5sum] =3D "cbb04e9a700955d88c50962ef22c=
1634"=0D=0A>>>>>>>>> +SRC_URI[payload44.sha256sum] =3D "02f159eb88c4254d9=
5e831c51c144b1863b216d909b5ff45743a1ce6f5273090"=0D=0A>>>>>>>>> +=0D=0A>>=
>>>>>>> +SRC_URI +=3D "https://docbook.org/xml/${PV}/docbook-xml-${PV}.zi=
p;name=3DpayloadPV;subdir=3Ddocbook-xml-${PV}"=0D=0A>>>>>>>>> +SRC_URI[pa=
yloadPV.md5sum] =3D "03083e288e87a7e829e437358da7ef9e"=0D=0A>>>>>>>>> +SR=
C_URI[payloadPV.sha256sum] =3D "4e4e037a2b83c98c6c94818390d4bdd3f6e10f6ec=
62dd79188594e26190dc7b4"=0D=0A>>>>>>>>> +=0D=0A>>>>>>>>> +# The upstream =
sources are not distributed with a license file.=0D=0A>>>>>>>>> +# LICENS=
E-OASIS is included as a "patch" to workaround this. When=0D=0A>>>>>>>>> =
+# upgrading this recipe, please verify whether this is still needed.=0D=0A=
>>>>>>>>> +=0D=0A>>>>>>>>> +LICENSE =3D "OASIS"=0D=0A>>>>>>>>> +LIC_FILES=
_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e7=
639a0b1d2e"=0D=0A>>>>>>>>> +SRC_URI +=3D "file://LICENSE-OASIS"=0D=0A>>>>=
>>>>>=0D=0A>>>>>>>>>      do_configure (){=0D=0A>>>>>>>>>          :=0D=0A=
>>>>>>>>> @@ -34,19 +58,19 @@ do_compile (){=0D=0A>>>>>>>>>          :=0D=
=0A>>>>>>>>>      }=0D=0A>>>>>>>>>=0D=0A>>>>>>>>> +inherit xmlcatalog=0D=0A=
>>>>>>>>> +=0D=0A>>>>>>>>>      do_install () {=0D=0A>>>>>>>>>          i=
nstall -d ${D}${sysconfdir}/xml/=0D=0A>>>>>>>>>          xmlcatalog --cre=
ate --noout ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A>>>>>>>>>=0D=0A>>>=
>>>>>> -    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A>>>>>>>>=
> +    for DTDVERSION in 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A>>>>>>>>>        =
      DEST=3D${datadir}/xml/docbook/schema/dtd/$DTDVERSION=0D=0A>>>>>>>>>=
              install -d -m 755 ${D}$DEST=0D=0A>>>>>>>>> -        cp -v -=
R docbook-$DTDVERSION/* ${D}$DEST=0D=0A>>>>>>>>> -        xmlcatalog --ve=
rbose --noout --add nextCatalog unused file://$DEST/catalog.xml ${D}${sys=
confdir}/xml/docbook-xml.xml=0D=0A>>>>>>>>> +        cp -v -R docbook-xml=
-$DTDVERSION/* ${D}$DEST=0D=0A>>>>>>>>> +        xmlcatalog --verbose --n=
oout --add nextCatalog unused \=0D=0A>>>>>>>>> +          file://$DEST/ca=
talog.xml ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A>>>>>>>>>          d=
one=0D=0A>>>>>>>>>      }=0D=0A>>>>>>>>>=0D=0A>>>>>>>>> -XMLCATALOGS =3D =
"${sysconfdir}/xml/docbook-xml.xml"=0D=0A>>>>>>>>> -inherit xmlcatalog=0D=
=0A>>>>>>>>> -=0D=0A>>>>>>>>>      FILES:${PN} =3D "${datadir}/* ${syscon=
fdir}/xml/docbook-xml.xml"=0D=0A>>>>>>>>> --=0D=0A>>>>>>>>> 2.34.1=0D=0A>=
>>>>>>>>=0D=0A>>>>>>>>>=0D=0A>>>>>>>>>=0D=0A>>>>>>>>>=0D=0A>>>>>>>>>=0D=0A=
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0D=0A>>>> Links: You r=
eceive all messages sent to this group.=0D=0A>>>> View/Reply Online (#177=
342): https://lists.openembedded.org/g/openembedded-core/message/177342=0D=
=0A>>>> Mute This Topic: https://lists.openembedded.org/mt/97064586/16864=
89=0D=0A>>>> Group Owner: openembedded-core+owner@lists.openembedded.org=0D=
=0A>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/u=
nsub [alex.kanavin@gmail.com]=0D=0A>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=0D=0A>>>>=0D=0A

