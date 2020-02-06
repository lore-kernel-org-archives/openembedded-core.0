Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 784156062D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 22:16:53 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id m195so43431vkh.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 14:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XG4hb1vPuS7198Uuo1Sm1KFGFUhvDw3O8GgD8Yappps=;
	b=UVG1yuh8aCd4muxQ3nM1CKAhPYATFWILBaKfgCYpSMAwQKRu4qPvmsOa9S0OROe9MK
	EySV/o6hCFd2jdOCf7wm60PvgO/Fsq8T49Ewc2WP6dSrtHJwUVjjlFYTilaFihurUh0X
	807c1QjCiHHtU382AajA+NUdVAwAsms/29dA3bbF3RKD+qQC5EPakS45eZWwpDDYq//S
	rN0omff1YKa7jJXO4JVU2G+QVkqWNptJNJeW0GbZHptcTXKilDe/K+LheLTDzum1U5Ou
	Juv99V2s/DGXekoCts5s1POeuwNid07O2kn1BLNL1Yvk4ubBkejV+xFntV2R+kELsO0f
	lyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XG4hb1vPuS7198Uuo1Sm1KFGFUhvDw3O8GgD8Yappps=;
	b=VuaNLZujeOaXdSGNREpyTY1Z9ILg4s+qalHsEh73/B4LWeEydxsfQtfaYpAwMkqQUM
	0XUKRn18AHR1Hl++HvG/Exj5m70Vlsi19vqzPi7Y2olbrh48mlQSSqmKLCOelXmhdrmd
	808cvmUePs/XK6Q/+0bwB8NFFg2uf+EyntIxuIzYVRwMix6jOH/Yk9tN2XNPvFOXVGJf
	MQliCQ4zw69kZtYiuF2wB5JctgL4q/y1quU6kyFCXGRTBIjdNBzDhBSUtn1ay/9Hgz2I
	ZEBsuoxaksl0tu+6k8Pone7Zb3J6n2SBMAajJd+t7PXdQearXG9lCkz0dqaCMCyXejyk
	ZZ3A==
X-Gm-Message-State: APjAAAU6B98eDKOniMsVf2sqcz8hScmIcCshCDybbqUMK5QaZ+p0zNNc
	wMz7GttRhQeJEU12uP778n4jD/TIMiLQWgJogC0EaQ==
X-Google-Smtp-Source: APXvYqw/Mp0sTqZrJqMLc7FhJRpQGcBzZeHOgq5aaImhPfP9JTgAK1w6vSM9VOqAobk5Ow4WH3V1bVTHQlGRXAAwQ/8=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr3278122vkc.29.1581027413649; 
	Thu, 06 Feb 2020 14:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20200206220704.1109-1-ross@burtonini.com>
In-Reply-To: <20200206220704.1109-1-ross@burtonini.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Feb 2020 23:16:42 +0100
Message-ID: <CANNYZj_qsWW4cugUQHzVRx6Z+WRaFbayQs8-hfEd71n6vOuJMA@mail.gmail.com>
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl: don't package the host configuration
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
X-List-Received-Date: Thu, 06 Feb 2020 22:16:53 -0000
Content-Type: multipart/alternative; boundary="0000000000005eec94059defa19b"

--0000000000005eec94059defa19b
Content-Type: text/plain; charset="UTF-8"

My patch is more comprehensive, as it also adjusts the ptests ;)

Alex

On Thu, 6 Feb 2020 at 23:07, Ross Burton <ross@burtonini.com> wrote:

> From: Ross Burton <ross.burton@intel.com>
>
> `make install` installs xconfig.h, which is the configuration of the
> *build host* used when building miniperl, used to bootstrap the Perl
> build.
>
> As this changes depending on the build host, remove don't install it.
>
> [ YOCTO #13372 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/perl/perl_5.30.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb
> b/meta/recipes-devtools/perl/perl_5.30.1.bb
> index d4b6bb32b43..8af9dfa4a2c 100644
> --- a/meta/recipes-devtools/perl/perl_5.30.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
> @@ -139,6 +139,10 @@ do_install() {
>      # Fix up shared library
>      rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so
>      ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo
> ${D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so
> +
> +    # This is the native configuration for the bootstrap perl, don't need
> it
> +    # packaged.
> +    rm -f ${D}${libdir}/perl5/${PV}/*/CORE/xconfig.h
>  }
>
>  do_install_append_class-target() {
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005eec94059defa19b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>My patch is more comprehensive, as it also adjusts th=
e ptests ;)</div><div><br></div><div>Alex<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 6 Feb 2020 at 23=
:07, Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;<br>
<br>
`make install` installs xconfig.h, which is the configuration of the<br>
*build host* used when building miniperl, used to bootstrap the Perl<br>
build.<br>
<br>
As this changes depending on the build host, remove don&#39;t install it.<b=
r>
<br>
[ YOCTO #13372 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.30.1.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" r=
el=3D"noreferrer" target=3D"_blank">perl_5.30.1.bb</a> b/meta/recipes-devto=
ols/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">perl_5.30.1.bb</a><br>
index d4b6bb32b43..8af9dfa4a2c 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.30.1.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.30.1.bb</a><br>
@@ -139,6 +139,10 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0# Fix up shared library<br>
=C2=A0 =C2=A0 =C2=A0rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so<br>
=C2=A0 =C2=A0 =C2=A0ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo ${=
D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so<br>
+<br>
+=C2=A0 =C2=A0 # This is the native configuration for the bootstrap perl, d=
on&#39;t need it<br>
+=C2=A0 =C2=A0 # packaged.<br>
+=C2=A0 =C2=A0 rm -f ${D}${libdir}/perl5/${PV}/*/CORE/xconfig.h<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_class-target() {<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000005eec94059defa19b--
