Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB5660119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 13:07:39 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bIbgy-0000Zi-7y from Awais_Belal@mentor.com ;
	Thu, 30 Jun 2016 06:07:40 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.127]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Thu, 30 Jun 2016 14:07:39 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Thread-Topic: [OE-core] [PATCH] mesa: move crypto configs to versioned recipe
Thread-Index: AQHR0sylgVVRofGvXEyoiT0SFrxgJaAB6OoAgAARzDA=
Date: Thu, 30 Jun 2016 13:07:38 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FC8CC40@EU-MBX-03.mgc.mentorg.com>
References: <1467290422-19660-1-git-send-email-awais_belal@mentor.com>,
	<CAHiDW_GAUerRu1dxuVJ56cdznn_LVVh0LsyBemEVAvx-FLnOww@mail.gmail.com>
In-Reply-To: <CAHiDW_GAUerRu1dxuVJ56cdznn_LVVh0LsyBemEVAvx-FLnOww@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: move crypto configs to versioned recipe
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
X-List-Received-Date: Thu, 30 Jun 2016 13:07:43 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2021B186DC632746BD5A3CE32F12BD28011FC8CC40EUMBX03mgcmen_"

--_000_2021B186DC632746BD5A3CE32F12BD28011FC8CC40EUMBX03mgcmen_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Jussi,

Your observation is correct but the warning is reproducible with the git re=
cipe that is available in oe-core. I'm only updating the SRCREV in my layer=
s.

BR,
Awais
________________________________
From: Jussi Kukkonen [jussi.kukkonen@intel.com]
Sent: Thursday, June 30, 2016 6:02 PM
To: Belal, Awais
Cc: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH] mesa: move crypto configs to versioned recip=
e

On 30 June 2016 at 15:40, Awais Belal <awais_belal@mentor.com<mailto:awais_=
belal@mentor.com>> wrote:
Fixes
WARNING: mesa-2_11.0.8+gitAUTOINC+b9b19162ee-r0 do_configure: QA Issue: mes=
a: configure was passed unrecognised options: --with-sha1 [unknown-configur=
e-option]
for git based recipe as it is on an older version of mesa
which does not support crypto configs.

I was about to suggest removing the git recipe (or at least bumping the rev=
ision) instead... but mesa-2_11.0.8 is actually not a oe-core recipe/versio=
n at all?

 Jussi

Signed-off-by: Awais Belal <awais_belal@mentor.com<mailto:awais_belal@mento=
r.com>>
---
 meta/recipes-graphics/mesa/mesa.inc       | 6 ------
 meta/recipes-graphics/mesa/mesa_11.2.2.bb<http://mesa_11.2.2.bb> | 6 +++++=
+
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index 1d084c0..b227abc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -64,12 +64,6 @@ PACKAGECONFIG[gallium-llvm] =3D "--enable-gallium-llvm -=
-enable-llvm-shared-libs,
 export WANT_LLVM_RELEASE =3D "${MESA_LLVM_RELEASE}"
 PACKAGECONFIG[xa]  =3D "--enable-xa, --disable-xa"

-# Mesa requires one of the following crypto implementation, pick one of th=
em
-MESA_CRYPTO ??=3D "openssl"
-PACKAGECONFIG[openssl] =3D "--with-sha1=3Dlibcrypto,,openssl"
-PACKAGECONFIG[nettle] =3D "--with-sha1=3Dlibnettle,,nettle"
-PACKAGECONFIG[gcrypt] =3D "--with-sha1=3Dlibgcrypt,,libgcrypt"
-
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append =3D " -fno-omit-frame-pointer"

diff --git a/meta/recipes-graphics/mesa/mesa_11.2.2.bb<http://mesa_11.2.2.b=
b> b/meta/recipes-graphics/mesa/mesa_11.2.2.bb<http://mesa_11.2.2.bb>
index a864b54..87c12c8 100644
--- a/meta/recipes-graphics/mesa/mesa_11.2.2.bb<http://mesa_11.2.2.bb>
+++ b/meta/recipes-graphics/mesa/mesa_11.2.2.bb<http://mesa_11.2.2.bb>
@@ -1,5 +1,11 @@
 require ${BPN}.inc

+# Mesa requires one of the following crypto implementation, pick one of th=
em
+MESA_CRYPTO ??=3D "openssl"
+PACKAGECONFIG[openssl] =3D "--with-sha1=3Dlibcrypto,,openssl"
+PACKAGECONFIG[nettle] =3D "--with-sha1=3Dlibnettle,,nettle"
+PACKAGECONFIG[gcrypt] =3D "--with-sha1=3Dlibgcrypt,,libgcrypt"
+
 SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
 "
--
1.9.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.ope=
nembedded.org>
http://lists.openembedded.org/mailman/listinfo/openembedded-core



--_000_2021B186DC632746BD5A3CE32F12BD28011FC8CC40EUMBX03mgcmen_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Jussi,<br>
<br>
Your observation is correct but the warning is reproducible with the git re=
cipe that is available in oe-core. I'm only updating the SRCREV in my layer=
s.<br>
<div><br>
<div style=3D"font-family:Tahoma; font-size:13px"><font face=3D"Tahoma"></f=
ont>
<div style=3D"font-size:13px">
<div><font face=3D"Tahoma" size=3D"2"><span lang=3D"en-US">
<div style=3D"margin:0">BR,</div>
<div style=3D"margin:0"><i>Awais</i></div>
</span></font></div>
</div>
<font face=3D"Tahoma"></font></div>
</div>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div style=3D"direction: ltr;" id=3D"divRpF69592"><font face=3D"Tahoma" siz=
e=3D"2" color=3D"#000000"><b>From:</b> Jussi Kukkonen [jussi.kukkonen@intel=
.com]<br>
<b>Sent:</b> Thursday, June 30, 2016 6:02 PM<br>
<b>To:</b> Belal, Awais<br>
<b>Cc:</b> Patches and discussions about the oe-core layer<br>
<b>Subject:</b> Re: [OE-core] [PATCH] mesa: move crypto configs to versione=
d recipe<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra">
<div class=3D"gmail_quote">On 30 June 2016 at 15:40, Awais Belal <span dir=
=3D"ltr">&lt;<a href=3D"mailto:awais_belal@mentor.com" target=3D"_blank">aw=
ais_belal@mentor.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; border=
-left-width:1px; border-left-style:solid; border-left-color:rgb(204,204,204=
); padding-left:1ex">
Fixes<br>
WARNING: mesa-2_11.0.8&#43;gitAUTOINC&#43;b9b19162ee-r0 do_configure: QA Is=
sue: mesa: configure was passed unrecognised options: --with-sha1 [unknown-=
configure-option]<br>
for git based recipe as it is on an older version of mesa<br>
which does not support crypto configs.<br>
</blockquote>
<div><br>
</div>
<div>I was about to suggest removing the git recipe (or at least bumping th=
e revision) instead... but mesa-2_11.0.8 is actually not a oe-core recipe/v=
ersion at all?</div>
<div>&nbsp;</div>
<div>&nbsp;Jussi</div>
<div><br>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; border=
-left-width:1px; border-left-style:solid; border-left-color:rgb(204,204,204=
); padding-left:1ex">
Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com" ta=
rget=3D"_blank">awais_belal@mentor.com</a>&gt;<br>
---<br>
&nbsp;meta/recipes-graphics/mesa/mesa.inc&nbsp; &nbsp; &nbsp; &nbsp;| 6 ---=
---<br>
&nbsp;meta/recipes-graphics/mesa/<a href=3D"http://mesa_11.2.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_11.2.2.bb</a> | 6 &#43;&#43;&#43;&#43;&#4=
3;&#43;<br>
&nbsp;2 files changed, 6 insertions(&#43;), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index 1d084c0..b227abc 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
&#43;&#43;&#43; b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -64,12 &#43;64,6 @@ PACKAGECONFIG[gallium-llvm] =3D &quot;--enable-galli=
um-llvm --enable-llvm-shared-libs,<br>
&nbsp;export WANT_LLVM_RELEASE =3D &quot;${MESA_LLVM_RELEASE}&quot;<br>
&nbsp;PACKAGECONFIG[xa]&nbsp; =3D &quot;--enable-xa, --disable-xa&quot;<br>
<br>
-# Mesa requires one of the following crypto implementation, pick one of th=
em<br>
-MESA_CRYPTO ??=3D &quot;openssl&quot;<br>
-PACKAGECONFIG[openssl] =3D &quot;--with-sha1=3Dlibcrypto,,openssl&quot;<br=
>
-PACKAGECONFIG[nettle] =3D &quot;--with-sha1=3Dlibnettle,,nettle&quot;<br>
-PACKAGECONFIG[gcrypt] =3D &quot;--with-sha1=3Dlibgcrypt,,libgcrypt&quot;<b=
r>
-<br>
&nbsp;# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)<b=
r>
&nbsp;FULL_OPTIMIZATION_append =3D &quot; -fno-omit-frame-pointer&quot;<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_11.2.2.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_11.2.2.bb</a> b/meta/recipes-graph=
ics/mesa/<a href=3D"http://mesa_11.2.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">mesa_11.2.2.bb</a><br>
index a864b54..87c12c8 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_11.2.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_11.2.2.bb</a><br>
&#43;&#43;&#43; b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_11.2.2.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa_11.2.2.bb</a><br>
@@ -1,5 &#43;1,11 @@<br>
&nbsp;require ${BPN}.inc<br>
<br>
&#43;# Mesa requires one of the following crypto implementation, pick one o=
f them<br>
&#43;MESA_CRYPTO ??=3D &quot;openssl&quot;<br>
&#43;PACKAGECONFIG[openssl] =3D &quot;--with-sha1=3Dlibcrypto,,openssl&quot=
;<br>
&#43;PACKAGECONFIG[nettle] =3D &quot;--with-sha1=3Dlibnettle,,nettle&quot;<=
br>
&#43;PACKAGECONFIG[gcrypt] =3D &quot;--with-sha1=3Dlibgcrypt,,libgcrypt&quo=
t;<br>
&#43;<br>
&nbsp;SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.org/pub/mesa/${PV}=
/mesa-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.freedesk=
top.org/pub/mesa/${PV}/mesa-${PV}.tar.xz</a> \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://replace_glibc_check_with_l=
inux.patch \<br>
&nbsp;&quot;<br>
<span class=3D""><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core<br>
</a><br>
</font></span></blockquote>
<div>&nbsp;</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_2021B186DC632746BD5A3CE32F12BD28011FC8CC40EUMBX03mgcmen_--
