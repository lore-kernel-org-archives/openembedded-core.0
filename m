Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC4E78F72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 12:03:17 +0000 (UTC)
IronPort-SDR: jjX0uPV+j0c3/VUD61dcTEBbkWjnrEKhfOcIMkNFW/pxGaxp/vUs9Ke/L+N5vPjGs4o7PNQiZO
	azVfonqeV1a1B3fFA9XAZE6i5+0jNQdzzRJVV0QNbR2a1iVqWJfCXYW80DXPV58LvZpEtU5PbP
	u5eSRxX//ud/ygpW/r+6KKSNHihjAQTFNRs17I+lJCLquTVGw3Nzg0bHYgs7cdrE4a3ry9VGiI
	YOZ9upuXMUaIzH+iJIVVIhXaBw2JN5oYsP4j5q5Esqnn5Kmyidiehy7FYFTlVfuE7syOljwHWd
	BIQ=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; d="scan'208,217";a="3935657"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: fdk17 <fdk17@ftml.net>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [meson][PATCH] meson: Allow for llvm-native tools to
	be	used
Thread-Index: AQHVuxpeRzmGlCqj10qPmyuvi0ABiqfN4z2A
Date: Fri, 27 Dec 2019 12:03:17 +0000
Message-ID: <54a01022886647f9baa8608f8a6af5b1@XBOX03.axis.com>
References: <1758bd87-e492-46bc-8aaa-514e802c5030@www.fastmail.com>
In-Reply-To: <1758bd87-e492-46bc-8aaa-514e802c5030@www.fastmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [meson][PATCH] meson: Allow for llvm-native tools to be	used
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
X-List-Received-Date: Fri, 27 Dec 2019 12:03:18 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_54a01022886647f9baa8608f8a6af5b1XBOX03axiscom_"

--_000_54a01022886647f9baa8608f8a6af5b1XBOX03axiscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If we're adding a --native-file, shouldn't it always be specified, regardle=
ss of --cross-file?
Also, it looks as most of what is currently done in override_native_tools()=
 and meson_do_configure_prepend_class-native() could be moved to the native=
-file (the exception seems to be the unsetting of CPPFLAGS, CFLAGS, CXXFLAG=
S and LDFLAGS).

//Peter

From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> On Behalf Of fdk17
Sent: den 25 december 2019 12:49
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [meson][PATCH] meson: Allow for llvm-native tools to be =
used

I created a bbappend to build the LLVM recipe so that all the libraries wer=
e available for use on the host.
These libraries are then used by a host/sdk tool to prepare binary files fo=
r use by an application on the target.
When building our tool using meson it wasn't able to find the Yocto built L=
LLVM libraries.
This fixes the issue so meson uses the correct llvm-config tool.

Author: Fred Baksik <fred.baksik@mrcy.com<mailto:fred.baksik@mrcy.com>>
Date:   Tue Dec 24 20:38:47 2019 -0500

    meson: Allow for llvm-native tools to be used

    Signed-off-by: Fred Baksik <fred.baksik@mrcy.com<mailto:fred.baksik@mrc=
y.com>>

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index e1a13bbbf7..b5cd2ee8c4 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -33,6 +33,7 @@ EXTRA_OEMESON_append =3D " ${PACKAGECONFIG_CONFARGS}"
 MESON_CROSS_FILE =3D ""
 MESON_CROSS_FILE_class-target =3D "--cross-file ${WORKDIR}/meson.cross"
 MESON_CROSS_FILE_class-nativesdk =3D "--cross-file ${WORKDIR}/meson.cross"
+MESON_CROSS_FILE_class-native =3D "--native-file ${WORKDIR}/meson.native"

 def meson_array(var, d):
     items =3D d.getVar(var).split()
@@ -110,6 +111,14 @@ endian =3D '${@meson_endian('TARGET', d)}'
 EOF
 }

+do_write_config_class-native() {
+    # This needs to be Py to split the args into single-element lists
+    cat >${WORKDIR}/meson.native <<EOF
+[binaries]
+llvm-config =3D 'llvm-config${LLVMVERSION}'
+EOF
+}
+
 CONFIGURE_FILES =3D "meson.build"

 meson_do_configure() {

--_000_54a01022886647f9baa8608f8a6af5b1XBOX03axiscom_
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
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-priority:1;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"SV" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">If we&#8217;re adding a --native-file, shouldn&#8217;t =
it always be specified, regardless of --cross-file?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">Also, it looks as most of what is currently done in ove=
rride_native_tools() and meson_do_configure_prepend_class-native() could be=
 moved to the native-file (the exception
 seems to be the unsetting of CPPFLAGS, CFLAGS, CXXFLAGS and LDFLAGS).<o:p>=
</o:p></span></p>
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
<b>On Behalf Of </b>fdk17<br>
<b>Sent:</b> den 25 december 2019 12:49<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> [OE-core] [meson][PATCH] meson: Allow for llvm-native tools=
 to be used<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">I created a bbappend to build the LLVM recipe so tha=
t all the libraries were available for use on the host.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">These libraries are then used by a host/sdk tool to =
prepare binary files for use by an application on the target.<o:p></o:p></p=
>
</div>
<div>
<p class=3D"MsoNormal">When building our tool using meson it wasn't able to=
 find the Yocto built LLLVM libraries.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">This fixes the issue so meson uses the correct llvm-=
config tool.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Author: Fred Baksik &lt;<a href=3D"mailto:fred.baksi=
k@mrcy.com">fred.baksik@mrcy.com</a>&gt;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Date:&nbsp;&nbsp; Tue Dec 24 20:38:47 2019 -0500<o:p=
></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; meson: Allow for llvm-native tool=
s to be used<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Signed-off-by: Fred Baksik &lt;<a=
 href=3D"mailto:fred.baksik@mrcy.com">fred.baksik@mrcy.com</a>&gt;<o:p></o:=
p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">diff --git a/meta/classes/meson.bbclass b/meta/class=
es/meson.bbclass<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">index e1a13bbbf7..b5cd2ee8c4 100644<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">--- a/meta/classes/meson.bbclass<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta/classes/meson.bbclass<o:p></o=
:p></p>
</div>
<div>
<p class=3D"MsoNormal">@@ -33,6 &#43;33,7 @@ EXTRA_OEMESON_append =3D &quot=
; ${PACKAGECONFIG_CONFARGS}&quot;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;MESON_CROSS_FILE =3D &quot;&quot;<o:p></o:p></=
p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;MESON_CROSS_FILE_class-target =3D &quot;--cros=
s-file ${WORKDIR}/meson.cross&quot;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;MESON_CROSS_FILE_class-nativesdk =3D &quot;--c=
ross-file ${WORKDIR}/meson.cross&quot;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;MESON_CROSS_FILE_class-native =3D &quot;--nativ=
e-file ${WORKDIR}/meson.native&quot;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;def meson_array(var, d):<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; items =3D d.getVar(var).spl=
it()<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">@@ -110,6 &#43;111,14 @@ endian =3D '${@meson_endian=
('TARGET', d)}'<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;EOF<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;}<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;do_write_config_class-native() {<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; # This needs to be Py to spl=
it the args into single-element lists<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; cat &gt;${WORKDIR}/meson.nat=
ive &lt;&lt;EOF<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;[binaries]<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;llvm-config =3D 'llvm-config${LLVMVERSION}'<o:p=
></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;EOF<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;CONFIGURE_FILES =3D &quot;meson.build&quot;<o:=
p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;meson_do_configure() {<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_54a01022886647f9baa8608f8a6af5b1XBOX03axiscom_--
