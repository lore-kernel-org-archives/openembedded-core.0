Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1PxR1m-0007R0-Cx
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 22:34:43 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Mar 2011 13:32:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,292,1297065600"; 
	d="scan'208,217";a="400236538"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by azsmga001.ch.intel.com with ESMTP; 09 Mar 2011 13:32:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Wed, 9 Mar 2011 13:32:00 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Wed, 9 Mar 2011 13:32:00 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Lu Jingdong <jingdong.lu@windriver.com>
Date: Wed, 9 Mar 2011 13:31:40 -0800
Thread-Topic: [PATCH 1/1] gcc-runtime: fix LSB library checks for
	libstdc++.so.6
Thread-Index: AcvePr7nftro5Uw/TKidE8IiaBRrPwAYlSow
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE9431EDA9BD@orsmsx504.amr.corp.intel.com>
References: <cover.1299633840.git.nitin.a.kamble@intel.com>
	<33b26ba051fa171e480bce3a1e4497a619241176.1299633840.git.nitin.a.kamble@intel.com>
	<4D774C36.3090807@windriver.com>
In-Reply-To: <4D774C36.3090807@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-runtime: fix LSB library checks for libstdc++.so.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Mar 2011 21:34:43 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9DA5872FEF993D41B7173F58FCF6BE9431EDA9BDorsmsx504amrcor_"

--_000_9DA5872FEF993D41B7173F58FCF6BE9431EDA9BDorsmsx504amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



From: Lu Jingdong [mailto:jingdong.lu@windriver.com]
Sent: Wednesday, March 09, 2011 1:45 AM
To: Kamble, Nitin A
Cc: poky@yoctoproject.org; openembedded-core@lists.openembedded.org; Khem R=
aj
Subject: Re: [PATCH 1/1] gcc-runtime: fix LSB library checks for libstdc++.=
so.6

On 03/09/2011 09:26 AM, Nitin A Kamble wrote:

 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    3 +++

 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    2 +-

 2 files changed, 4 insertions(+), 1 deletions(-)



diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/rec=
ipes-devtools/gcc/gcc-configure-runtime.inc

index 6cc11e2..2d214af 100644

--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc

+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc

@@ -1,5 +1,8 @@

 require gcc-configure-common.inc



+CXXFLAGS =3D "${@oe_filter_out('-fvisibility-inlines-hidden',

+'${CXXFLAGS}', d)}"

+
I think it should be


CXXFLAGS :=3D "${@oe_filter_out('-fvisibility-inlines-hidden',

'${CXXFLAGS}', d)}"







This is correct. I also saw the bellow error and I have tested with :=3D on=
ly. But missed merging the change back to the commit before pushing.

Sorry about that.



Thanks,

Nitin





otherwise it will give the following error log.

NOTE: Error expanding variable CXXFLAGS####################################=
###########################                                 | ETA:  00:00:0=
0

ERROR: Error parsing xxx.../xxx.bb: variable CXXFLAGS references itself!



It is ok in python, but bitbake/lib/bb/data_smart.py will check it and it w=
ill cause error.

 EXTRA_OECONF_PATHS =3D " \

     --with-local-prefix=3D${STAGING_DIR_TARGET}${prefix} \

     --with-gxx-include-dir=3D${includedir}/c++/ \

diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipes-=
devtools/gcc/gcc-runtime_4.5.1.bb

index 093f9bf..c1e680d 100644

--- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb

+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb

@@ -1,4 +1,4 @@

-PR =3D "r2"

+PR =3D "r3"



 require gcc-${PV}.inc

 require gcc-configure-runtime.inc




--

Lu Jingdong

jingdong.lu@windriver.com<mailto:jingdong.lu@windriver.com>

China, Wind River

--_000_9DA5872FEF993D41B7173F58FCF6BE9431EDA9BDorsmsx504amrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
tt
	{mso-style-priority:99;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	color:black;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>

<body bgcolor=3Dwhite lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DWordSection1>

<p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri",=
"sans-serif";
color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri",=
"sans-serif";
color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<div style=3D'border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt'>

<div>

<div style=3D'border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in'>

<p class=3DMsoNormal><b><span style=3D'font-size:10.0pt;font-family:"Tahoma=
","sans-serif";
color:windowtext'>From:</span></b><span style=3D'font-size:10.0pt;font-fami=
ly:
"Tahoma","sans-serif";color:windowtext'> Lu Jingdong
[mailto:jingdong.lu@windriver.com] <br>
<b>Sent:</b> Wednesday, March 09, 2011 1:45 AM<br>
<b>To:</b> Kamble, Nitin A<br>
<b>Cc:</b> poky@yoctoproject.org; openembedded-core@lists.openembedded.org;
Khem Raj<br>
<b>Subject:</b> Re: [PATCH 1/1] gcc-runtime: fix LSB library checks for
libstdc++.so.6<o:p></o:p></span></p>

</div>

</div>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal><tt><span style=3D'font-size:10.0pt'>On 03/09/2011 09:=
26 AM,
Nitin A Kamble wrote:</span></tt> <o:p></o:p></p>

<pre>&nbsp;.../recipes-devtools/gcc/gcc-configure-runtime.inc |&nbsp;&nbsp;=
&nbsp; 3 +++<o:p></o:p></pre><pre> meta/recipes-devtools/gcc/gcc-runtime_4.=
5.1.bb&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 2 +-<o:p></o:p></pre><pr=
e> 2 files changed, 4 insertions(+), 1 deletions(-)<o:p></o:p></pre><pre><o=
:p>&nbsp;</o:p></pre><pre>diff --git a/meta/recipes-devtools/gcc/gcc-config=
ure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc<o:p><=
/o:p></pre><pre>index 6cc11e2..2d214af 100644<o:p></o:p></pre><pre>--- a/me=
ta/recipes-devtools/gcc/gcc-configure-runtime.inc<o:p></o:p></pre><pre>+++ =
b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc<o:p></o:p></pre><pre>=
@@ -1,5 +1,8 @@<o:p></o:p></pre><pre> require gcc-configure-common.inc<o:p>=
</o:p></pre><pre> <o:p></o:p></pre><pre>+CXXFLAGS =3D &quot;${@oe_filter_ou=
t('-fvisibility-inlines-hidden',<o:p></o:p></pre><pre>+'${CXXFLAGS}', d)}&q=
uot; <o:p></o:p></pre><pre>+<o:p></o:p></pre>

<p class=3DMsoNormal><tt><span style=3D'font-size:10.0pt'>I think it should=
 be </span></tt><br>
<br>
<o:p></o:p></p>

<pre>CXXFLAGS <b>:=3D</b> &quot;${@oe_filter_out('-fvisibility-inlines-hidd=
en',<o:p></o:p></pre><pre>'${CXXFLAGS}', d)}&quot; <o:p></o:p></pre><pre><s=
pan
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></pre><pre><span
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'=
><o:p>&nbsp;</o:p></span></pre><pre><span
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'=
><o:p>&nbsp;</o:p></span></pre><pre><span
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'=
>This is correct. I also saw the bellow error and I have tested with :=3D o=
nly. But missed merging the change back to the commit before pushing.<o:p><=
/o:p></span></pre><pre><span
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'=
>Sorry about that.<o:p></o:p></span></pre><pre><span
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'=
><o:p>&nbsp;</o:p></span></pre><pre><span
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'=
>Thanks,<o:p></o:p></span></pre><pre><span
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'=
>Nitin<o:p></o:p></span></pre><pre><span
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'=
><o:p>&nbsp;</o:p></span></pre><pre><span
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'=
><o:p>&nbsp;</o:p></span></pre><pre>otherwise it will give the following er=
ror log.<o:p></o:p></pre><pre>NOTE: Error expanding variable CXXFLAGS######=
#########################################################&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; | ETA:&nbsp; 00:00:00<o:p></o:p></pre><pre>ERROR: =
Error parsing xxx.../xxx.bb: variable CXXFLAGS references itself!<o:p></o:p=
></pre><pre><o:p>&nbsp;</o:p></pre><pre>It is ok in python, but bitbake/lib=
/bb/data_smart.py will check it and it will cause error.<o:p></o:p></pre>

<blockquote style=3D'margin-top:5.0pt;margin-bottom:5.0pt'><pre>&nbsp;EXTRA=
_OECONF_PATHS =3D &quot; \<o:p></o:p></pre><pre>&nbsp;&nbsp;&nbsp;&nbsp; --=
with-local-prefix=3D${STAGING_DIR_TARGET}${prefix} \<o:p></o:p></pre><pre>&=
nbsp;&nbsp;&nbsp;&nbsp; --with-gxx-include-dir=3D${includedir}/c++/ \<o:p><=
/o:p></pre><pre>diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb=
 b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb<o:p></o:p></pre><pre>inde=
x 093f9bf..c1e680d 100644<o:p></o:p></pre><pre>--- a/meta/recipes-devtools/=
gcc/gcc-runtime_4.5.1.bb<o:p></o:p></pre><pre>+++ b/meta/recipes-devtools/g=
cc/gcc-runtime_4.5.1.bb<o:p></o:p></pre><pre>@@ -1,4 +1,4 @@<o:p></o:p></pr=
e><pre>-PR =3D &quot;r2&quot;<o:p></o:p></pre><pre>+PR =3D &quot;r3&quot;<o=
:p></o:p></pre><pre> <o:p></o:p></pre><pre>&nbsp;require gcc-${PV}.inc<o:p>=
</o:p></pre><pre> require gcc-configure-runtime.inc<o:p></o:p></pre></block=
quote>

<p class=3DMsoNormal><br>
<br>
<br>
<o:p></o:p></p>

<pre>-- <o:p></o:p></pre><pre>Lu Jingdong<o:p></o:p></pre><pre><a
href=3D"mailto:jingdong.lu@windriver.com">jingdong.lu@windriver.com</a><o:p=
></o:p></pre><pre>China, Wind River<o:p></o:p></pre></div>

</div>

</body>

</html>

--_000_9DA5872FEF993D41B7173F58FCF6BE9431EDA9BDorsmsx504amrcor_--
