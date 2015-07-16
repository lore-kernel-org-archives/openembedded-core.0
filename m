Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 238CB75799
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 16:38:43 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZFmBH-0004Xb-K9 from drew_moseley@mentor.com ;
	Thu, 16 Jul 2015 09:38:43 -0700
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-06.mgc.mentorg.com ([147.34.97.120]) with mapi id
	14.03.0224.002; Thu, 16 Jul 2015 09:38:43 -0700
From: "Moseley, Drew" <drew_moseley@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] mesa-demos: Fix building demos which
	require GLU.
Thread-Index: AQHQv95jKEKCv+Qj6U6Ek2QibQhfTp3ewT8A
Date: Thu, 16 Jul 2015 16:38:42 +0000
Message-ID: <DBF4FAB7-1F3A-4FAA-936E-8752FC32CC69@mentor.com>
References: <1437059524-15971-1-git-send-email-drew_moseley@mentor.com>
	<20150716154529.GE2134@jama>
In-Reply-To: <20150716154529.GE2134@jama>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa-demos: Fix building demos which require GLU.
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
X-List-Received-Date: Thu, 16 Jul 2015 16:38:47 -0000
X-Groupsio-MsgNum: 68047
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AC2015C4-C45D-4D8D-8618-BC7FDF3FDA8B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_AC2015C4-C45D-4D8D-8618-BC7FDF3FDA8B
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E0506BC8-994A-4D9E-AC2F-1C3091FAFC31"

--Apple-Mail=_E0506BC8-994A-4D9E-AC2F-1C3091FAFC31
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 16, 2015, at 11:45 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Thu, Jul 16, 2015 at 11:12:04AM -0400, Drew Moseley wrote:
>> The existing test for GLU support is backwards.  Reverse the
>> sense of the conditional when built with "--enable-glu".
>>=20
>> Signed-off-by: Drew Moseley <drew_moseley@mentor.com =
<mailto:drew_moseley@mentor.com>>
>> ---
>> ...figure-Allow-to-disable-demos-which-require-GLEW-.patch | 14 =
++++++++------
>> 1 file changed, 8 insertions(+), 6 deletions(-)
>>=20
>> diff --git =
a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-de=
mos-which-require-GLEW-.patch =
b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-de=
mos-which-require-GLEW-.patch
>> index 4b07193..b25f5ce 100644
>> --- =
a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-de=
mos-which-require-GLEW-.patch
>> +++ =
b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-de=
mos-which-require-GLEW-.patch
>> @@ -10,20 +10,21 @@ Subject: [PATCH 3/9] configure: Allow to disable =
demos which require GLEW or
>> Upstream-Status: Pending
>>=20
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com =
<mailto:Martin.Jansa@gmail.com>>
>> +Signed-off-by: Drew Moseley <drew_moseley@mentor.com =
<mailto:drew_moseley@mentor.com>>
>> ---
>> - configure.ac                  | 49 ++++++++++++++++++++---------
>> - src/Makefile.am               | 14 ++++++---
>> + configure.ac                  | 50 ++++++++++++++++++++---------
>> + src/Makefile.am               | 18 ++++++++---
>>  src/demos/Makefile.am         | 73 =
++++++++++++++++++++++++-------------------
>>  src/egl/Makefile.am           |  8 +++--
>>  src/egl/opengles1/Makefile.am | 44 +++++++++++++++-----------
>>  src/egl/opengles2/Makefile.am | 33 ++++++++++---------
>> - 6 files changed, 135 insertions(+), 86 deletions(-)
>> + 6 files changed, 140 insertions(+), 86 deletions(-)
>>=20
>> diff --git a/configure.ac b/configure.ac
>> index 9445424..bc4c8d1 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> -@@ -93,25 +93,44 @@ AC_EGREP_HEADER([glutInitContextProfile],
>> +@@ -89,25 +89,45 @@ AC_EGREP_HEADER([glutInitContextProfile],
>>  		[AC_DEFINE(HAVE_FREEGLUT)],
>>  		[])
>>=20
>> @@ -66,7 +67,7 @@ index 9445424..bc4c8d1 100644
>> -DEMO_CFLAGS=3D"$DEMO_CFLAGS $GLU_CFLAGS"
>> -DEMO_LIBS=3D"$DEMO_LIBS $GLU_LIBS"
>> +if test "x$enable_glu" =3D xyes; then
>> -+    PKG_CHECK_MODULES(GLU, [glu], [],
>> ++    PKG_CHECK_MODULES(GLU, [glu],
>=20
> Are you sure? It was like this in original PKG_CHECK_MODULES and I =
think
> it was correct. 4th parameter is used as fallback to find it manually
> when pkg-config doesn't find it, with your change it would use
> AC_CHECK_HEADER and ignore the values set returned by pkg-config.


Hi Martin,

I=E2=80=99m fairly certain this is needed however I=E2=80=99m not =
terribly familiar with autotools so it=E2=80=99s possible I missed =
something.  I know that without this change a number of the demo apps I =
expect do not get built.  It=E2=80=99s been a while since I looked but I =
seem to recall that the =E2=80=9Cgeartrain=E2=80=9D demo among others =
will not be available without this change.

=46rom my reading of the PKG_CHECK_MODULES docs at =
https://autotools.io/pkgconfig/pkg_check_modules.html =
<https://autotools.io/pkgconfig/pkg_check_modules.html>, it seems the =
3rd parameter is the action-if-found and my read of the logic here is =
that if glu is found it then verifies the presence of the header files =
and libs.

I=E2=80=99ll kick off a fresh build and dig around a bit just in case I =
missed something.

Regards,

Drew

--Apple-Mail=_E0506BC8-994A-4D9E-AC2F-1C3091FAFC31
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jul 16, 2015, at 11:45 AM, Martin Jansa &lt;<a =
href=3D"mailto:martin.jansa@gmail.com" =
class=3D"">martin.jansa@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">On Thu, Jul 16, 2015 at 11:12:04AM -0400, Drew =
Moseley wrote:</span><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D"">The existing test for GLU support is backwards. =
&nbsp;Reverse the<br class=3D"">sense of the conditional when built with =
"--enable-glu".<br class=3D""><br class=3D"">Signed-off-by: Drew Moseley =
&lt;<a href=3D"mailto:drew_moseley@mentor.com" =
class=3D"">drew_moseley@mentor.com</a>&gt;<br class=3D"">---<br =
class=3D"">...figure-Allow-to-disable-demos-which-require-GLEW-.patch | =
14 ++++++++------<br class=3D"">1 file changed, 8 insertions(+), 6 =
deletions(-)<br class=3D""><br class=3D"">diff --git =
a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-de=
mos-which-require-GLEW-.patch =
b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-de=
mos-which-require-GLEW-.patch<br class=3D"">index 4b07193..b25f5ce =
100644<br class=3D"">--- =
a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-de=
mos-which-require-GLEW-.patch<br class=3D"">+++ =
b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-de=
mos-which-require-GLEW-.patch<br class=3D"">@@ -10,20 +10,21 @@ Subject: =
[PATCH 3/9] configure: Allow to disable demos which require GLEW or<br =
class=3D"">Upstream-Status: Pending<br class=3D""><br =
class=3D"">Signed-off-by: Martin Jansa &lt;<a =
href=3D"mailto:Martin.Jansa@gmail.com" =
class=3D"">Martin.Jansa@gmail.com</a>&gt;<br class=3D"">+Signed-off-by: =
Drew Moseley &lt;<a href=3D"mailto:drew_moseley@mentor.com" =
class=3D"">drew_moseley@mentor.com</a>&gt;<br class=3D"">---<br =
class=3D"">- configure.ac =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;| 49 ++++++++++++++++++++---------<br =
class=3D"">- src/Makefile.am =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| 14 ++++++---<br class=3D"">+ configure.ac =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;| 50 ++++++++++++++++++++---------<br =
class=3D"">+ src/Makefile.am =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| 18 ++++++++---<br class=3D"">&nbsp;src/demos/Makefile.am =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 73 =
++++++++++++++++++++++++-------------------<br =
class=3D"">&nbsp;src/egl/Makefile.am =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;8 =
+++--<br class=3D"">&nbsp;src/egl/opengles1/Makefile.am | 44 =
+++++++++++++++-----------<br =
class=3D"">&nbsp;src/egl/opengles2/Makefile.am | 33 =
++++++++++---------<br class=3D"">- 6 files changed, 135 insertions(+), =
86 deletions(-)<br class=3D"">+ 6 files changed, 140 insertions(+), 86 =
deletions(-)<br class=3D""><br class=3D"">diff --git a/configure.ac =
b/configure.ac<br class=3D"">index 9445424..bc4c8d1 100644<br =
class=3D"">--- a/configure.ac<br class=3D"">+++ b/configure.ac<br =
class=3D"">-@@ -93,25 +93,44 @@ =
AC_EGREP_HEADER([glutInitContextProfile],<br class=3D"">+@@ -89,25 =
+89,45 @@ AC_EGREP_HEADER([glutInitContextProfile],<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>[AC_DEFINE(HAVE_FREEGLUT)],<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>[])<br =
class=3D""><br class=3D"">@@ -66,7 +67,7 @@ index 9445424..bc4c8d1 =
100644<br class=3D"">-DEMO_CFLAGS=3D"$DEMO_CFLAGS $GLU_CFLAGS"<br =
class=3D"">-DEMO_LIBS=3D"$DEMO_LIBS $GLU_LIBS"<br class=3D"">+if test =
"x$enable_glu" =3D xyes; then<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;PKG_CHECK_MODULES(GLU, [glu], [],<br class=3D"">++ =
&nbsp;&nbsp;&nbsp;PKG_CHECK_MODULES(GLU, [glu],<br =
class=3D""></blockquote><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">Are you sure? It was like =
this in original PKG_CHECK_MODULES and I think</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">it was correct. 4th parameter is used as =
fallback to find it manually</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">when pkg-config doesn't =
find it, with your change it would use</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">AC_CHECK_HEADER and ignore the values set =
returned by pkg-config.</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""></div></blockquote></div><div class=3D""><br =
class=3D""></div><div class=3D"">Hi Martin,</div><div class=3D""><br =
class=3D""></div><div class=3D"">I=E2=80=99m fairly certain this is =
needed however I=E2=80=99m not terribly familiar with autotools so =
it=E2=80=99s possible I missed something. &nbsp;I know that without this =
change a number of the demo apps I expect do not get built. &nbsp;It=E2=80=
=99s been a while since I looked but I seem to recall that the =
=E2=80=9Cgeartrain=E2=80=9D demo among others will not be available =
without this change.</div><div class=3D""><br class=3D""></div><div =
class=3D"">=46rom my reading of the PKG_CHECK_MODULES docs at&nbsp;<a =
href=3D"https://autotools.io/pkgconfig/pkg_check_modules.html" =
class=3D"">https://autotools.io/pkgconfig/pkg_check_modules.html</a>, it =
seems the 3rd parameter is the action-if-found and my read of the logic =
here is that if glu is found it then verifies the presence of the header =
files and libs.</div><div class=3D""><br class=3D""></div><div =
class=3D"">I=E2=80=99ll kick off a fresh build and dig around a bit just =
in case I missed something.</div><div class=3D""><br class=3D""></div><div=
 class=3D"">Regards,</div><div class=3D""><br class=3D""></div><div =
class=3D"">Drew</div></body></html>=

--Apple-Mail=_E0506BC8-994A-4D9E-AC2F-1C3091FAFC31--

--Apple-Mail=_AC2015C4-C45D-4D8D-8618-BC7FDF3FDA8B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iD8DBQFVp94G++E4Rrql4XYRAqjMAJ47ZVI+e8NT9hLofSRR4XxSLFO/9QCgtoyc
7qz+8KjWmca2/CpzsIAaeEk=
=qUg5
-----END PGP SIGNATURE-----

--Apple-Mail=_AC2015C4-C45D-4D8D-8618-BC7FDF3FDA8B--
