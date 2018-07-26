Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E363078C0D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 13:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 09EE41858F;
	Thu, 26 Jul 2018 15:16:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id LfdY3iWYe5vr; Thu, 26 Jul 2018 15:16:02 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C449A1858A;
	Thu, 26 Jul 2018 15:16:02 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 823F91E088;
	Thu, 26 Jul 2018 15:16:02 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75CDA1E083;
	Thu, 26 Jul 2018 15:16:02 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 26 Jul 2018 15:16:02 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 68AC41CBC;
	Thu, 26 Jul 2018 15:16:02 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 26 Jul 2018 15:16:02 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 26 Jul 2018 15:16:02 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jonathan Haigh <Jonathan.Haigh@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core] INCOMPATIBLE_LICENSE mechanism
Thread-Index: AQHUH2P1ipMkerX65UWFRjBAEJC/rqSWocT7gArf4mA=
Date: Thu, 26 Jul 2018 13:16:02 +0000
Message-ID: <d7450c2b26f644358476ea6ec27717b6@XBOX02.axis.com>
References: <DB5PR08MB0888CF3B2340E729DD3B946193520@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<DB5PR08MB0888B7FFDFD5AA67F818105E93520@DB5PR08MB0888.eurprd08.prod.outlook.com>
In-Reply-To: <DB5PR08MB0888B7FFDFD5AA67F818105E93520@DB5PR08MB0888.eurprd08.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>
Subject: Re: INCOMPATIBLE_LICENSE mechanism
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
X-List-Received-Date: Thu, 26 Jul 2018 13:16:05 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_d7450c2b26f644358476ea6ec27717b6XBOX02axiscom_"

--_000_d7450c2b26f644358476ea6ec27717b6XBOX02axiscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is related to a similar problem we are seeing with the use of "or" for=
 licenses. We use the archiver.bbclass to export all open source code we us=
e. However, for recipes that specify multiple licenses using "or", we would=
 like to specify the one under which we are using the code. E.g., if the LI=
CENSE is "GPL-2.0 | Proprietary", we would like to treat the code as "Propr=
ietary", but when it comes to the archiver.bbclass, even if we have told it=
 to ignore packages with Proprietary licenses, it will include the package =
due to the alternative GPL-2.0 license.

The idea we have is to allow to specify a USED_LICENSE (e.g., in a bbappend=
 or a separate configuration file), which should take the actually used lic=
ense. This should be verified to be one of the allowed licenses specified i=
n LICENSE (in case LICENSE changes and no longer allows the chosen license)=
, and after that, LICENSE should be treated as if this was the value it had=
 been given. This does, however,  not take into account the use of the same=
 package in multiple images with different licensing requirements (we only =
build one image so that is not a problem for us).

//Peter

From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> On Behalf Of Jonathan Haigh
Sent: den 19 juli 2018 17:08
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>
Subject: [OE-core] [oe-core] INCOMPATIBLE_LICENSE mechanism

 Hi,



I have some questions, comments and suggestions about the INCOMPATIBLE_LICE=
NSE mechanism:



1. If I specify licenseX in INCOMPATIBLE_LICENSE then I get an error when b=
uilding a recipe with a package (packageA) that just RRECOMMENDS a package =
(packageB) with licenceX, even if I add packageB to BAD_RECOMMENDATIONS_pn-=
packageA. Am I correct in thinking that this behaviour is unintentional?



2. When checking whether a license expression is compatible with INCOMPATIB=
LE_LICENSE, the code takes into account "or" operands in the license expres=
sion, such that if licenseX is in INCOMPATIBLE_LICENSE but licenseY isn't, =
and a package's license expression is "licenseX | licenseY" then the licens=
e will be deemed okay even though licenseX is incompatible. I don't think t=
his consideration of "or" operands is valid. Consider the case where:

  *   packageA has license expression "LGPLv3 | GPLv2;
  *   packageB has license expression "MIT";
  *   packageB dynamically links with packageA;
  *   INCOMPATIBLE_LICENSE =3D "LGPL-3.0".

PackageB mustn't be using packageA under the terms of the GPLv2 because the=
 resulting combination would have to be GPLv2, not MIT, to comply with the =
terms of the GPLv2. PackageB must therefore be using packageA under the ter=
ms of the LGPLv3, but LGPL-3.0 is in INCOMPATIBLE_LICENSE, so the combinati=
on should be rejected.



Actually keeping track of how licenses of packages and their dependents int=
eract might be too much work, too messy, or require too much legal knowledg=
e, so I suggest this special treatment of "or" operands in license expressi=
ons is removed. Another approach might be to allow packages explicitly decl=
are the licenses under which they are using their rdependencies. That would=
n't work nicely with the implicit RDEPENDS addition mechanism though.



3. If I understand correctly, INCOMPATIBLE_LICENSE doesn't let me have diff=
erent license policies for packages that go into different images. It would=
 be useful to be able to specify INCOMPATIBLE_LICENSE in an image recipe to=
 prevent just that image containing packages/recipes with incompatible lice=
nses. This would be useful e.g. to have a GPLv3-free production image but a=
llow GPLv3 packages in a debug image.



4. From the code in license.bbclass, it looks like when writing the rootfs =
and image manifest files, the intended behaviour is to modify the license e=
xpressions of packages/recipes by removing incompatible "or" branches (whic=
h seems a little odd, especially given #2). However, this is not the actual=
 behaviour of the code when run with Python3. From write_license_files() in=
 license.bbclass:

    bad_licenses =3D (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
    bad_licenses =3D map(lambda l: canonical_license(d, l), bad_licenses)
    bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)

expand_wildcard_licenses() expects a list, but in Python3 map() returns som=
e sort of iterator, which causes expand_wildcard_licenses() to return an em=
pty list. This can be fixed by wrapping the call to map() in a call to list=
(). I'll send a patch for this.


I have a bbclass that adds license checking at the rootfs/image stage and d=
oesn't take into account the "or" operands in license expressions, but I th=
ink it would be better to change/extend the functionality of the INCOMPATIB=
LE_LICENSE mechanism. Do the oe-core maintainers here agree with the follow=
ing approach?

  *   Don't fail a build if a package just RRECOMMENDs another package with=
 an incompatible license, only fail if the package is actually built.
  *   Don't take "or" operands into account when checking for incompatible =
licenses.
  *   Add functionality to allow INCOMPATIBLE_LICENSE to just apply to pack=
ages/recipes that go into a particular image.
  *   Don't modify package/recipe license expressions in the manifest files=
.
If so, I'd like to contribute patches to do this. I'm not at all familiar w=
ith how the RRECOMMENDS mechanism works though, so some guidance on that pa=
rt would be useful.

Thanks for all the work being done on OE, it is much appreciated.

Jonathan
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_d7450c2b26f644358476ea6ec27717b6XBOX02axiscom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1061832347;
	mso-list-template-ids:-50672074;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1636445573;
	mso-list-template-ids:-239069944;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"SV" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">This is related to a similar problem we are seeing with=
 the use of &#8220;or&#8221; for licenses. We use the archiver.bbclass to e=
xport all open source code we use. However, for recipes
 that specify multiple licenses using &#8220;or&#8221;, we would like to sp=
ecify the one under which we are using the code. E.g., if the LICENSE is &#=
8220;GPL-2.0 | Proprietary&#8221;, we would like to treat the code as &#822=
0;Proprietary&#8221;, but when it comes to the archiver.bbclass, even
 if we have told it to ignore packages with Proprietary licenses, it will i=
nclude the package due to the alternative GPL-2.0 license.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">The idea we have is to allow to specify a USED_LICENSE =
(e.g., in a bbappend or a separate configuration file), which should take t=
he actually used license. This should
 be verified to be one of the allowed licenses specified in LICENSE (in cas=
e LICENSE changes and no longer allows the chosen license), and after that,=
 LICENSE should be treated as if this was the value it had been given. This=
 does, however, &nbsp;not take into account
 the use of the same package in multiple images with different licensing re=
quirements (we only build one image so that is not a problem for us).<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">//Peter<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> openembedded-core-bounces@lists.openembedded.org &lt;openembedd=
ed-core-bounces@lists.openembedded.org&gt;
<b>On Behalf Of </b>Jonathan Haigh<br>
<b>Sent:</b> den 19 juli 2018 17:08<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Cc:</b> Jeremy Johnson &lt;Jeremy.Johnson@arm.com&gt;<br>
<b>Subject:</b> [OE-core] [oe-core] INCOMPATIBLE_LICENSE mechanism<o:p></o:=
p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"divtagdefaultwrapper">
<div>
<div id=3D"divRplyFwdMsg">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;H=
i, <o:p></o:p></span></p>
</div>
</div>
<div>
<div id=3D"x_divtagdefaultwrapper">
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">I have some questions, comm=
ents and suggestions about the INCOMPATIBLE_LICENSE mechanism:<o:p></o:p></=
span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">1. If I specify licenseX in=
 INCOMPATIBLE_LICENSE then I get an error when building a recipe with a pac=
kage (packageA) that just RRECOMMENDS a package (packageB) with licenceX, e=
ven if I add packageB to BAD_RECOMMENDATIONS_pn-packageA.
 Am I correct in thinking that this behaviour is unintentional?<o:p></o:p><=
/span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">2. When checking whether a =
license expression is compatible with INCOMPATIBLE_LICENSE, the code takes =
into account &quot;or&quot; operands in the license expression, such that i=
f licenseX is in INCOMPATIBLE_LICENSE but licenseY
 isn't, and a package's license expression is &quot;licenseX | licenseY&quo=
t; then the license will be deemed okay even though licenseX is incompatibl=
e. I don't think this consideration of &quot;or&quot; operands is valid. Co=
nsider the case where:<o:p></o:p></span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto;mso-list:l1 level1 lfo1">
<span style=3D"font-size:12.0pt">packageA has license expression &quot;LGPL=
v3 | GPLv2;<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:bl=
ack;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l1 level1 l=
fo1">
<span style=3D"font-size:12.0pt">packageB has license expression &quot;MIT&=
quot;;<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;m=
so-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l1 level1 lfo1">
<span style=3D"font-size:12.0pt">packageB dynamically links with packageA;<=
o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-marg=
in-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l1 level1 lfo1">
<span style=3D"font-size:12.0pt">INCOMPATIBLE_LICENSE =3D &quot;LGPL-3.0&qu=
ot;.<o:p></o:p></span></li></ul>
<p><span style=3D"font-size:12.0pt;color:black">PackageB mustn't be using p=
ackageA under the terms of the GPLv2 because the resulting combination woul=
d have to be GPLv2, not MIT, to comply with the terms of the GPLv2. Package=
B must therefore be using packageA
 under the terms of the LGPLv3, but LGPL-3.0 is in INCOMPATIBLE_LICENSE, so=
 the combination should be rejected.<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">Actually keeping track of h=
ow licenses of packages and their dependents interact might be too much wor=
k, too messy, or require too much legal knowledge, so I suggest this specia=
l treatment of &quot;or&quot; operands in license
 expressions is removed. Another approach might be to allow packages explic=
itly declare the licenses under which they are using their rdependencies. T=
hat wouldn't work nicely with the implicit RDEPENDS addition mechanism thou=
gh.<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">3. If I understand correctl=
y, INCOMPATIBLE_LICENSE doesn't let me have different license policies for =
packages that go into different images. It would be useful to be able to sp=
ecify INCOMPATIBLE_LICENSE in an image
 recipe to prevent just that image containing packages/recipes with incompa=
tible licenses. This would be useful e.g. to have a GPLv3-free production i=
mage but allow GPLv3 packages in a debug image.<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">4. From the code in license=
.bbclass, it looks like when writing the rootfs and image manifest files, t=
he intended behaviour is to modify the license expressions of packages/reci=
pes by removing incompatible &quot;or&quot;
 branches (which seems a little odd, especially given #2). However, this is=
 not the actual behaviour of the code when run with Python3. From write_lic=
ense_files() in license.bbclass:<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp; bad_licenses =3D (d.getVar(&quot;INCOMPATIBLE_LICENSE&quot;) or=
 &quot;&quot;).split()<br>
&nbsp;&nbsp;&nbsp; bad_licenses =3D map(lambda l: canonical_license(d, l), =
bad_licenses)<br>
&nbsp;&nbsp;&nbsp; bad_licenses =3D expand_wildcard_licenses(d, bad_license=
s)<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">expand_=
wildcard_licenses() expects a list, but in Python3 map() returns some sort =
of iterator, which causes expand_wildcard_licenses() to return an empty lis=
t. This can be fixed by wrapping the
 call to map() in a call to list(). I'll send a patch for this.<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">I have =
a bbclass that adds license checking at the rootfs/image stage and doesn't =
take into account the &quot;or&quot; operands in license expressions, but I=
 think it would be better to change/extend the
 functionality of the INCOMPATIBLE_LICENSE mechanism. Do the oe-core mainta=
iners here agree with the following approach?<o:p></o:p></span></p>
</div>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto;mso-list:l0 level1 lfo2">
<span style=3D"font-size:12.0pt">Don't fail a build if a package just RRECO=
MMENDs another package with an incompatible license, only fail if the packa=
ge is actually built.<o:p></o:p></span></li><li class=3D"MsoNormal" style=
=3D"color:black;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list=
:l0 level1 lfo2">
<span style=3D"font-size:12.0pt">Don't take &quot;or&quot; operands into ac=
count when checking for incompatible licenses.<o:p></o:p></span></li><li cl=
ass=3D"MsoNormal" style=3D"color:black;mso-margin-top-alt:auto;mso-margin-b=
ottom-alt:auto;mso-list:l0 level1 lfo2">
<span style=3D"font-size:12.0pt">Add functionality to allow INCOMPATIBLE_LI=
CENSE to just apply to packages/recipes that go into a particular image.<o:=
p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-margin=
-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l0 level1 lfo2">
<span style=3D"font-size:12.0pt">Don't modify package/recipe license expres=
sions in the manifest files.
<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">If so, =
I'd like to contribute patches to do this. I'm not at all familiar with how=
 the RRECOMMENDS mechanism works though, so some guidance on that part woul=
d be useful.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Thanks =
for all the work being done on OE, it is much appreciated.<o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Jonatha=
n<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal">IMPORTANT NOTICE: The contents of this email and any=
 attachments are confidential and may also be privileged. If you are not th=
e intended recipient, please notify the sender immediately and do not discl=
ose the contents to any other person,
 use it for any purpose, or store or copy the information in any medium. Th=
ank you.
<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_d7450c2b26f644358476ea6ec27717b6XBOX02axiscom_--
