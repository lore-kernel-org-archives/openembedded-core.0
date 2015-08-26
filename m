Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id D4B2676E02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 19:16:27 +0000 (UTC)
Received: by qkfh127 with SMTP id h127so125936448qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 12:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ljlhJ+VuQqxa/W6PUUB94f/3/huRVeX0BTkNCLrxBFI=;
	b=mvHVmOHNH40dVTTmCNrxOfwawo9ZK6I66qLjHxPZKaAnmaCBeTgODOVhj4Li1tDO95
	cXqSekPAAMpWIcGWhLr2AbeJscMv3Sp8Dt71aAyjIzB8mSbRMTtvKmEpmWN66uUyAFMq
	1qVj0+I8yUrMU0v1m+r1aP4PSKVtattK86LNnUU05orFUYSO7AfxS4JF3Fe80v2qsggo
	LGo0oU21+2JJ1zV1yzs48VYJ/4L0GJ7I7C01oXs25jE9ccaHutLNZv6Vjk23fSBgGWrL
	STA75rIVATnyRVV7uLKTNjHniqgS4G6To1sfILxwbzAuByXHJsZ/jFUbqShRbXn37xU2
	Ku3w==
MIME-Version: 1.0
X-Received: by 10.55.209.156 with SMTP id o28mr36664qkl.92.1440616587705; Wed,
	26 Aug 2015 12:16:27 -0700 (PDT)
Received: by 10.55.167.70 with HTTP; Wed, 26 Aug 2015 12:16:26 -0700 (PDT)
Received: by 10.55.167.70 with HTTP; Wed, 26 Aug 2015 12:16:26 -0700 (PDT)
In-Reply-To: <f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
References: <1440605035.20082.20.camel@intel.com>
	<f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
Date: Wed, 26 Aug 2015 12:16:26 -0700
Message-ID: <CAMKF1speSYjijUeuHAyVXRQf5DQtaWsCRjZ3=02dXPOeOdRb=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mtd-utils: add xattr PACKAGECONFIG and fix acl dependency
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
X-List-Received-Date: Wed, 26 Aug 2015 19:16:28 -0000
Content-Type: multipart/alternative; boundary=001a11479dacf7c502051e3baf1d

--001a11479dacf7c502051e3baf1d
Content-Type: text/plain; charset=UTF-8

On Aug 26, 2015 9:11 AM, "Patrick Ohly" <patrick.ohly@intel.com> wrote:
>
> The unconditional removal of -DWITHOUT_XATTR accidentally introduced a
> compile-time dependency on "acl", because "sys/acl.h" gets
> included. This caused random compile failures.
>
> To fix this, we introduce a proper PACKAGECONFIG for the "xattr"
> support, with the distro's "xattr" feature determining the
> default. Setting the define must be done with custom code because
> PACKAGECONFIG can only influence configure parameters.
>
> The "acl" distro feature is not checked because although enabling
> "xattr" support now triggers a build of acl, nothing from it will not
> get included in the resulting target image. This seems more suitable
> than not enabling xattr support in mtd-utils when acl support in the
> distro is disabled.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb
b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 8d4892a..17dca77 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -19,7 +19,13 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
>
>  S = "${WORKDIR}/git/"
>
> -EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}'
'CFLAGS=${CFLAGS} -I${S}/include' 'BUILDDIR=${S}'"
> +# xattr support creates an additional compile-time dependency on acl
because
> +# the sys/acl.h header is needed. libacl is not needed and thus enabling
xattr
> +# regardless whether acl is enabled or disabled in the distro should be
okay.
> +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr',
'xattr', '', d)}"
> +PACKAGECONFIG[xattr] = ",,acl,"
> +
> +EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}'
'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '',
'-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
>
Do I see a spurious " in the middle
>  do_install () {
>         oe_runmake install DESTDIR=${D} SBINDIR=${sbindir}
MANDIR=${mandir} INCLUDEDIR=${includedir}
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a11479dacf7c502051e3baf1d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 26, 2015 9:11 AM, &quot;Patrick Ohly&quot; &lt;<a href=3D"mailto:pat=
rick.ohly@intel.com">patrick.ohly@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The unconditional removal of -DWITHOUT_XATTR accidentally introduced a=
<br>
&gt; compile-time dependency on &quot;acl&quot;, because &quot;sys/acl.h&qu=
ot; gets<br>
&gt; included. This caused random compile failures.<br>
&gt;<br>
&gt; To fix this, we introduce a proper PACKAGECONFIG for the &quot;xattr&q=
uot;<br>
&gt; support, with the distro&#39;s &quot;xattr&quot; feature determining t=
he<br>
&gt; default. Setting the define must be done with custom code because<br>
&gt; PACKAGECONFIG can only influence configure parameters.<br>
&gt;<br>
&gt; The &quot;acl&quot; distro feature is not checked because although ena=
bling<br>
&gt; &quot;xattr&quot; support now triggers a build of acl, nothing from it=
 will not<br>
&gt; get included in the resulting target image. This seems more suitable<b=
r>
&gt; than not enabling xattr support in mtd-utils when acl support in the<b=
r>
&gt; distro is disabled.<br>
&gt;<br>
&gt; Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.c=
om">patrick.ohly@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb">mt=
d-utils_git.bb</a> | 8 +++++++-<br>
&gt; =C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git=
.bb">mtd-utils_git.bb</a> b/meta/recipes-devtools/mtd/<a href=3D"http://mtd=
-utils_git.bb">mtd-utils_git.bb</a><br>
&gt; index 8d4892a..17dca77 100644<br>
&gt; --- a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb">mt=
d-utils_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb">mt=
d-utils_git.bb</a><br>
&gt; @@ -19,7 +19,13 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.infra=
dead.org/mtd-utils.git">git.infradead.org/mtd-utils.git</a> \<br>
&gt;<br>
&gt; =C2=A0S =3D &quot;${WORKDIR}/git/&quot;<br>
&gt;<br>
&gt; -EXTRA_OEMAKE =3D &quot;&#39;CC=3D${CC}&#39; &#39;RANLIB=3D${RANLIB}&#=
39; &#39;AR=3D${AR}&#39; &#39;CFLAGS=3D${CFLAGS} -I${S}/include&#39; &#39;B=
UILDDIR=3D${S}&#39;&quot;<br>
&gt; +# xattr support creates an additional compile-time dependency on acl =
because<br>
&gt; +# the sys/acl.h header is needed. libacl is not needed and thus enabl=
ing xattr<br>
&gt; +# regardless whether acl is enabled or disabled in the distro should =
be okay.<br>
&gt; +PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;xattr&#39;, &#39;xattr&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +PACKAGECONFIG[xattr] =3D &quot;,,acl,&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE =3D &quot;&#39;CC=3D${CC}&#39; &#39;RANLIB=3D${RANLIB}&#=
39; &#39;AR=3D${AR}&#39; &#39;CFLAGS=3D${CFLAGS} ${@bb.utils.contains(&#39;=
PACKAGECONFIG&#39;, &#39;xattr&#39;, &#39;&#39;, &#39;-DWITHOUT_XATTR&#39;,=
 d)} -I${S}/include&#39; &#39;BUILDDIR=3D${S}&#39;&quot;<br>
&gt;<br>
Do I see a spurious &quot; in the middle<br>
&gt; =C2=A0do_install () {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} SBINDIR=
=3D${sbindir} MANDIR=3D${mandir} INCLUDEDIR=3D${includedir}<br>
&gt; --<br>
&gt; 2.1.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a11479dacf7c502051e3baf1d--
