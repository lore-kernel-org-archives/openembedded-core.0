Received: from smtp1.ingenico.com ([217.108.148.240])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Matthieu.CRAPET@ingenico.com>) id 1UF0I8-0007og-Ff
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 11:49:21 +0100
X-IronPort-AV: E=Sophos;i="4.84,822,1355094000"; d="scan'208,217";a="23976638"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 11 Mar 2013 11:32:36 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.175]) by
	COSNADEXC22.usr.ingenico.loc ([10.31.4.222]) with mapi id
	14.02.0318.001; Mon, 11 Mar 2013 11:32:36 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Libtool & external toolchain & .la files
Thread-Index: Ac4eQ2qOLYKCXsUmSGmxkpS8uO+2xg==
Date: Mon, 11 Mar 2013 10:32:36 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B06678A38@COSNADEXC13.usr.ingenico.loc>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Libtool & external toolchain & .la files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 10:49:25 -0000
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_8672BB614B4CCA40A6B3BDD6FD82050B06678A38COSNADEXC13usri_"

--_000_8672BB614B4CCA40A6B3BDD6FD82050B06678A38COSNADEXC13usri_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear all,

I have some issue regarding  Libtool and my external toolchain (located in =
/opt)
I've created a basic C++ (STL) library using autotools.

My configure.ac is very simple:
<code>
AC_PREREQ([2.60])
AC_INIT([exemple], [1.2.3], [test@exemple.org])

AC_CONFIG_SRCDIR([Makefile.am])
AC_CANONICAL_HOST

AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([foreign])

LT_PREREQ([2.4])
LT_INIT

dnl Check for progs
AC_PROG_CXX

AC_SUBST([LIBEXEMPLE_SO_VERSION], [1:2:3])

AC_OUTPUT([
    Makefile
])
</code>

Then I've made a basic OE recipe to build it:

<code>
SUMMARY =3D "Libtool simple exemple"
LICENSE =3D "MIT"
LIC_FILES_CHKSUM =3D "\
                file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fd=
eb3b58 \
                file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0=
384361b4de20420 \
"

PR =3D "r1"

SRC_URI =3D "git://xx.xx.xx.xx/libexemple.git"
SRCREV =3D "HEAD"
S =3D "${WORKDIR}/git"

inherit autotools
</code>

Works fine but resulting .la files (in libexemple-dev package) contains:

dependency_libs=3D'/opt/...-linux-gnueabi/lib/libstdc++.la'

This is bad because if another program (using libtool) depends on libexampl=
e, libtool will search
libstdc++ in "${STAGING_DIR_HOST}/opt/...-linux-gnueabi/lib/libstdc++.la" (=
instead of "${STAGING_DIR_HOST}/lib/libstdc++.la").
I would like that dependency_libs points to openembedded sysroot.

Note: Toolchain's .la files located in ${STAGING_DIR_HOST} are correct (and=
 not referencing /opt).

I am wondering what is the best workaround for this. For now I've patched m=
y recipe:

<code>
do_compile_prepend () {
                cd ${S}
                sed -i -e  '/^compiler_lib_search_dirs=3D/s/.*/compiler_lib=
_search_dirs=3D""/' ${HOST_SYS}-libtool
                sed -i -e  '/^compiler_lib_search_path=3D/s/.*/compiler_lib=
_search_path=3D""/' ${HOST_SYS}-libtool
                sed -i -e  '/^sys_lib_search_path_spec=3D/s/.*/sys_lib_sear=
ch_path_spec=3D""/' ${HOST_SYS}-libtool
}
</code>

Ugly but works because libstdc++ can be found (using --sysroot argument). B=
ut "dependency_libs" is empty is .la file.

In real life: this is libglu and glew.

Regards,
Matthieu Crapet
PS: "exemple" is french word for "example" ;)

--_000_8672BB614B4CCA40A6B3BDD6FD82050B06678A38COSNADEXC13usri_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
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
<body lang=3D"FR" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Dear all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I have some issue regarding &nb=
sp;Libtool and my external toolchain (located in /opt)<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I've created a basic C&#43;&#43=
; (STL) library using autotools.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">My configure.ac is very simple:=
<o:p></o:p></span></p>
<p class=3D"MsoNormal">&lt;code&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">AC_PREREQ([2.60])<o:p></o:p></p>
<p class=3D"MsoNormal">AC_INIT([exemple], [1.2.3], [test@exemple.org])<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">AC_CONFIG_SRCDIR([Makefile.am])=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">AC_CANONICAL_HOST<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">AC_CONFIG_MACRO_DIR([m4])<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">AM_INIT_AUTOMAKE([foreign])<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">LT_PREREQ([2.4])<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">LT_INIT<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">dnl Check for progs<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">AC_PROG_CXX<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">AC_SUBST([LIBEXEMPLE_SO_VERSION=
], [1:2:3])<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">AC_OUTPUT([<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; Makefile<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">])<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&lt;/code&gt;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Then I've made a basic OE recip=
e to build it:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&lt;code&gt;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">SUMMARY =3D &quot;Libtool simpl=
e exemple&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">LICENSE =3D &quot;MIT&quot;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">LIC_FILES_CHKSUM =3D &quot;\<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://${COREBA=
SE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://${COREBA=
SE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420 \<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal">&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">PR =3D &quot;r1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">SRC_URI =3D &quot;git://xx.xx.xx.xx/libexemple.git&q=
uot;<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">SRCREV =3D &quot;HEAD&quot;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">S =3D &quot;${WORKDIR}/git&quot=
;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">inherit autotools<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&lt;/code&gt;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Works fine but resulting .la fi=
les (in libexemple-dev package) contains:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">dependency_libs=3D'/opt/...-lin=
ux-gnueabi/lib/libstdc&#43;&#43;.la'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">This is bad because if another =
program (using libtool) depends on libexample, libtool will search<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">libstdc&#43;&#43; in &quot;${ST=
AGING_DIR_HOST}/opt/...-linux-gnueabi/lib/libstdc&#43;&#43;.la&quot; (inste=
ad of &quot;${STAGING_DIR_HOST}/lib/libstdc&#43;&#43;.la&quot;).<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I would like that dependency_li=
bs points to openembedded sysroot.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Note: Toolchain's .la files loc=
ated in ${STAGING_DIR_HOST} are correct (and not referencing /opt).<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I am wondering what is the best=
 workaround for this. For now I&#8217;ve patched my recipe:<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&lt;code&gt;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">do_compile_prepend () {<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd ${S}<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e&nbsp;=
 '/^compiler_lib_search_dirs=3D/s/.*/compiler_lib_search_dirs=3D&quot;&quot=
;/' ${HOST_SYS}-libtool<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e&nbsp;=
 '/^compiler_lib_search_path=3D/s/.*/compiler_lib_search_path=3D&quot;&quot=
;/' ${HOST_SYS}-libtool<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e&nbsp;=
 '/^sys_lib_search_path_spec=3D/s/.*/sys_lib_search_path_spec=3D&quot;&quot=
;/' ${HOST_SYS}-libtool<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&lt;/code&gt;<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Ugly but works because libstdc&=
#43;&#43; can be found (using --sysroot argument). But &quot;dependency_lib=
s&quot; is empty is .la file.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">In real life: this is libglu an=
d glew.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Matthieu Crapet<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">PS: &quot;exemple&quot; is fren=
ch word for &quot;example&quot; ;)<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_8672BB614B4CCA40A6B3BDD6FD82050B06678A38COSNADEXC13usri_--
