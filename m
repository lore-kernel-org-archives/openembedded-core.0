Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RVLOg-0006KZ-9C
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 11:58:46 +0100
Received: by eaad13 with SMTP id d13so2924409eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 02:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=e3h8kOSFeq0CzexCLhjDtZrI7afhFrCPooIXcbdTic8=;
	b=Urp8cEM98MiEuLIfLXwKPd1Q8uBLTx6Bzp0xm/kGb0HBfai2SumNX4KLFpalRhL8Pw
	SQWsjftLmnkXluedQavsuLe9op0LhH/6Czj9O6tFN2nzcS5kCsxIpg1hn5aSmh6xQy2c
	fWlLV04h6Fk4CrAQnQzPzM4Dp9ae+xEosEqx0=
MIME-Version: 1.0
Received: by 10.227.209.146 with SMTP id gg18mr9495923wbb.6.1322563927295;
	Tue, 29 Nov 2011 02:52:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.216.186.13 with HTTP; Tue, 29 Nov 2011 02:52:07 -0800 (PST)
In-Reply-To: <1322563625-22780-1-git-send-email-eric@eukrea.com>
References: <1322563625-22780-1-git-send-email-eric@eukrea.com>
Date: Tue, 29 Nov 2011 08:52:07 -0200
X-Google-Sender-Auth: KAX3-uocAhAM0jFDtiu3WnPhJD0
Message-ID: <CAP9ODKqpf82sFpnTGEtJkV6h2w23CcXZgQqEVYQ9UmDDVHVVpA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: fix sed to have correct *.pc files
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
X-List-Received-Date: Tue, 29 Nov 2011 10:58:46 -0000
Content-Type: multipart/alternative; boundary=00151758a57c1447e304b2dd6995

--00151758a57c1447e304b2dd6995
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Tue, Nov 29, 2011 at 08:47, Eric B=E9nard <eric@eukrea.com> wrote:

> it seems sed doesn't handle \? properly if the string in not between
> quotes.
>
> without this patch, we get something like (for example for QtDBusE.pc :
> Libs: -L${libdir} -lQtDBusE
> Libs.private:
> -L/home/ebenard/WORK/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysro=
ots/board/
> usr/lib -L/usr/lib
>  -L/home/ebenard/WORK/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysr=
oots/board
> /usr/lib -lQtXmlE -L/usr/lib -lQtCoreE -lpthread
> Cflags: -DQT_SHARED -I/usr/include/qtopia -I${includedir}
>
> with the patch we get what is expected :
> Libs: -L${libdir} -lQtDBusE
> Libs.private:     -lQtXmlE  -lQtCoreE -lpthread
> Cflags: -DQT_SHARED -I/usr/include/qtopia -I${includedir}
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
>  meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
>  meta/recipes-qt/qt4/qt4.inc          |   10 +++++-----
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc
> b/meta/recipes-qt/qt4/qt4-embedded.inc
> index bee7345..c4f6e98 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
>  LICENSE =3D "LGPLv2.1 | GPLv3"
>  HOMEPAGE =3D "http://qt.nokia.com"
>  DEPENDS +=3D "directfb tslib"
> -INC_PR =3D "r36"
> +INC_PR =3D "r37"
>
>  QT_BASE_NAME ?=3D "qt4-embedded"
>  QT_BASE_LIB  ?=3D "libqt-embedded"
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc
> b/meta/recipes-qt/qt4/qt4-x11-free.inc
> index f391028..5abb5a1 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://qt.nokia.com"
>  SECTION =3D "x11/libs"
>  DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig libxft libxext
> libxrender libxrandr libxcursor"
>
> -INC_PR =3D "r32"
> +INC_PR =3D "r33"
>
>  QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl'=
,
> '-no-opengl', d)} "
>  QT_GLFLAGS_qemux86 =3D "-opengl"
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 82ba637..b365e75 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -294,13 +294,13 @@ do_install() {
>        rm -f ${D}/${bindir}/lrelease
>
>        # fix pkgconfig, libtool and prl files
> -       sed -i -e s#-L${S}/lib/\?##g \
> -                       -e s#-L${STAGING_LIBDIR}/\?##g \
> +       sed -i -e 's#-L${S}/lib/\?##g' \
> +                       -e 's#-L${STAGING_LIBDIR}/\?##g' \
>                        -e 's#STAGING_LIBDIR}#libdir}'#g \
> -                       -e s#-L${libdir}/\?##g \
> +                       -e 's#-L${libdir}/\?##g' \
>                        -e
> s#'$(OE_QMAKE_LIBS_X11)'#"${OE_QMAKE_LIBS_X11}"#g \
> -                       -e s#" -Wl,-rpath-link,${S}/lib/\?"##g \
> -                       -e s#" -Wl,-rpath-link,${libdir}/\?"##g \
> +                       -e 's#" -Wl,-rpath-link,${S}/lib/\?"##g' \
> +                       -e 's#" -Wl,-rpath-link,${libdir}/\?"##g' \
>                        -e 's#Iin#I${in#g' \
>                        ${D}${libdir}/*.la ${D}${libdir}/*.prl
> ${D}${libdir}/pkgconfig/*.pc
>
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--00151758a57c1447e304b2dd6995
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">ot=
avio@ossystems.com.br</a>&gt;<br><br><div class=3D"gmail_quote">On Tue, Nov=
 29, 2011 at 08:47, Eric B=E9nard <span dir=3D"ltr">&lt;<a href=3D"mailto:e=
ric@eukrea.com">eric@eukrea.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;">it seems sed doesn&#39;t handle \? properly=
 if the string in not between<br>
quotes.<br>
<br>
without this patch, we get something like (for example for QtDBusE.pc :<br>
Libs: -L${libdir} -lQtDBusE<br>
Libs.private: -L/home/ebenard/WORK/setup-scripts/build/tmp-angstrom_2010_x-=
eglibc/sysroots/board/<br>
usr/lib -L/usr/lib =A0-L/home/ebenard/WORK/setup-scripts/build/tmp-angstrom=
_2010_x-eglibc/sysroots/board<br>
/usr/lib -lQtXmlE -L/usr/lib -lQtCoreE -lpthread<br>
Cflags: -DQT_SHARED -I/usr/include/qtopia -I${includedir}<br>
<br>
with the patch we get what is expected :<br>
Libs: -L${libdir} -lQtDBusE<br>
Libs.private: =A0 =A0 -lQtXmlE =A0-lQtCoreE -lpthread<br>
Cflags: -DQT_SHARED -I/usr/include/qtopia -I${includedir}<br>
<br>
Signed-off-by: Eric B=E9nard &lt;<a href=3D"mailto:eric@eukrea.com">eric@eu=
krea.com</a>&gt;<br>
---<br>
=A0meta/recipes-qt/qt4/qt4-embedded.inc | =A0 =A02 +-<br>
=A0meta/recipes-qt/qt4/qt4-x11-free.inc | =A0 =A02 +-<br>
=A0meta/recipes-qt/qt4/qt4.inc =A0 =A0 =A0 =A0 =A0| =A0 10 +++++-----<br>
=A03 files changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4=
-embedded.inc<br>
index bee7345..c4f6e98 100644<br>
--- a/meta/recipes-qt/qt4/qt4-embedded.inc<br>
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc<br>
@@ -3,7 +3,7 @@ SECTION =3D &quot;libs&quot;<br>
=A0LICENSE =3D &quot;LGPLv2.1 | GPLv3&quot;<br>
=A0HOMEPAGE =3D &quot;<a href=3D"http://qt.nokia.com" target=3D"_blank">htt=
p://qt.nokia.com</a>&quot;<br>
=A0DEPENDS +=3D &quot;directfb tslib&quot;<br>
-INC_PR =3D &quot;r36&quot;<br>
+INC_PR =3D &quot;r37&quot;<br>
<br>
=A0QT_BASE_NAME ?=3D &quot;qt4-embedded&quot;<br>
=A0QT_BASE_LIB =A0?=3D &quot;libqt-embedded&quot;<br>
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4=
-x11-free.inc<br>
index f391028..5abb5a1 100644<br>
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc<br>
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc<br>
@@ -5,7 +5,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://qt.nokia.com" target=
=3D"_blank">http://qt.nokia.com</a>&quot;<br>
=A0SECTION =3D &quot;x11/libs&quot;<br>
=A0DEPENDS +=3D &quot;virtual/libgl virtual/libx11 fontconfig libxft libxex=
t libxrender libxrandr libxcursor&quot;<br>
<br>
-INC_PR =3D &quot;r32&quot;<br>
+INC_PR =3D &quot;r33&quot;<br>
<br>
=A0QT_GLFLAGS ?=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;o=
pengl&#39;, &#39;-opengl&#39;, &#39;-no-opengl&#39;, d)} &quot;<br>
=A0QT_GLFLAGS_qemux86 =3D &quot;-opengl&quot;<br>
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc<br>
index 82ba637..b365e75 100644<br>
--- a/meta/recipes-qt/qt4/qt4.inc<br>
+++ b/meta/recipes-qt/qt4/qt4.inc<br>
@@ -294,13 +294,13 @@ do_install() {<br>
 =A0 =A0 =A0 =A0rm -f ${D}/${bindir}/lrelease<br>
<br>
 =A0 =A0 =A0 =A0# fix pkgconfig, libtool and prl files<br>
- =A0 =A0 =A0 sed -i -e s#-L${S}/lib/\?##g \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e s#-L${STAGING_LIBDIR}/\?##=
g \<br>
+ =A0 =A0 =A0 sed -i -e &#39;s#-L${S}/lib/\?##g&#39; \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e &#39;s#-L${STAGING_LIBDIR}=
/\?##g&#39; \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-e &#39;s#STAGING_LIBDIR}#l=
ibdir}&#39;#g \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e s#-L${libdir}/\?##g \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e &#39;s#-L${libdir}/\?##g&#=
39; \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-e s#&#39;$(OE_QMAKE_LIBS_X=
11)&#39;#&quot;${OE_QMAKE_LIBS_X11}&quot;#g \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e s#&quot; -Wl,-rpath-link,$=
{S}/lib/\?&quot;##g \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e s#&quot; -Wl,-rpath-link,$=
{libdir}/\?&quot;##g \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e &#39;s#&quot; -Wl,-rpath-l=
ink,${S}/lib/\?&quot;##g&#39; \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e &#39;s#&quot; -Wl,-rpath-l=
ink,${libdir}/\?&quot;##g&#39; \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-e &#39;s#Iin#I${in#g&#39; =
\<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${libdir}/*.la ${D}${li=
bdir}/*.prl ${D}${libdir}/pkgconfig/*.pc<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.6.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--00151758a57c1447e304b2dd6995--
