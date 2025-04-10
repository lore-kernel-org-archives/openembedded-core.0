Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8351BC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 19:32:25 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.7230.1744313521297409719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 12:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=gGw5+h1g;
 spf=pass (domain: snapchat.com, ip: 209.85.208.52, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so2527036a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1744313520; x=1744918320; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lN4MDDCd9zQlSxNO6hXba02htBc4STttHozvqjIIZTA=;
        b=gGw5+h1gDXa98J4oGaoCcKrZJaasHgdnWdC2dXSCOl7beDSROKuEyI5IpFIVDmPflQ
         dVq//Rt7PMNh9L35jLaqVc0VrvYUZoZw24m1hsmf29Lh4mH62F41AQQUSLL7HRxAya9D
         k0XrCVdBfn9qMpRD5SSZFUGPCtyFFtrvmN5Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313520; x=1744918320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN4MDDCd9zQlSxNO6hXba02htBc4STttHozvqjIIZTA=;
        b=EhylOjO8IUFL3WDFhm06M+Fk+eNYHWNoU9wOA9AJ2MhnKd8ALeP/puTTPLPmQWgS2A
         e18rHE8pero/GljxpFSbLoiZLnuOR3ueQDXTrScxv4mNta7obm81BSbzPNDmpl7xoHTX
         YN9pVQXFuoJ3sbBKmBdc7qqP/GBUf/mNwmbsXviC9rVb+z+Yj1iocLEF4zpq8Qtm2RxC
         oeXw60PGzeRoH6mk3whJPJ0I12jiIC+nHdQ2DIOMND58BjJNLwMIfY7/eEfngLOznQeA
         EMjc2H48VAAUMkOUjeQV8KOskOrS4LptM9UcjOJ+WUQ1xt8yCU9mwE7oa+XIf8GI84ql
         K8Kw==
X-Gm-Message-State: AOJu0YynmnEFQkQip07xhBiCmOUPLRKUzy5hVNBEgNTLWeOsa7OzXtwP
	TWThnJPCMTBeG0H8aYX+Fp/4YxY/bh95QbPlBcKI7xNRYoNAqiuSHSuV2ol8HfrQYazGkL6go6P
	+EYRdoDGUDgg3jK9/7rPoZP7a4n0iyLi1eBI4x8ibitpASZ8mbzg=
X-Gm-Gg: ASbGnctqKx63S4BI8qmghM2Cc2/1jOkM64uzcc8JVjH828EfB4YqdeavOm5ZLtlvZYe
	EomTjGZZZuJZy4s4psogO65+3NlPrlLCsAUzZy14KEjDMwrMkWWCneymwGkQLFxnvhvE7UjWcY3
	1kDsb/7X8+oGb0K59g9uo7ug==
X-Google-Smtp-Source: AGHT+IGeefUbEbmwvbfxFa1TKmtJacYbs3dNdF06hL/qAF/aKdZNv1qU37O59awqlwCeWRcuQM8Q8r7ck7TqXWvRkzs=
X-Received: by 2002:a17:907:6e86:b0:ac8:179a:42f5 with SMTP id
 a640c23a62f3a-acabd191cd4mr326530366b.14.1744313519477; Thu, 10 Apr 2025
 12:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250410192632.2818966-1-ecordonnier@snap.com>
 <20250410192632.2818966-2-ecordonnier@snap.com> <CANNYZj--gFysZHiNLijg-kNCvr-xFtkjUBMVByP8aROYMz=-1Q@mail.gmail.com>
In-Reply-To: <CANNYZj--gFysZHiNLijg-kNCvr-xFtkjUBMVByP8aROYMz=-1Q@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 10 Apr 2025 21:31:48 +0200
X-Gm-Features: ATxdqUEAHqWJ-JimjkRbWSXHWdY1csK6v1S4pnEtsYqvrCiyv07fH8PSRzgtwP0
Message-ID: <CAHUKmYZkZ0FqSR00-RL+Tbp5v5B2u6ouK3WG+dvdAj3K0FHRAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] source-highlight: re-add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b4d936063271a32a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 19:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214704

--000000000000b4d936063271a32a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That's fair enough. My thinking was to try to upstream first to core, since
it used to be there before it was removed, and to also get feedback on
whether you would want to enable this per default gdb. I can also move it
to meta-oe if you think it is better.

=C3=89tienne

On Thu, Apr 10, 2025 at 9:28=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> Unless you want to enable it by default in gdb (and the other patch
> shows that is not the case), source-highlight does not have to be in
> core. We have plenty of recipes in core with options that require
> items from meta-oe or other layers.
>
> Alex
>
> On Thu, 10 Apr 2025 at 21:26, Etienne Cordonnier via
> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
> wrote:
> >
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > source-highlight version 3.1.8 was removed in
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__web.git.yoctoproje=
ct.org_poky_commit_-3Fid-3D6560db9ddfd39a2715ede96430228306b00f53dd&d=3DDwI=
BaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4=
_yp3Vldzt83qQW4zvi&s=3DGDekE4em2Y0dcrW5i9p81jWBM-rLGDqNCZJM66b8ZzI&e=3D
> in June 2019 because the was no user left,
> > however there is now a gdb PACKAGECONFIG option which uses it. Since th=
e
> last release was in 2019, let's rather use the latest git version.
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  1 +
> >  .../source-highlight/source-highlight_git.bb  | 36 +++++++++++++++++++
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 meta/recipes-support/source-highlight/
> source-highlight_git.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 2b47d3103c0..831494312b6 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -777,6 +777,7 @@ RECIPE_MAINTAINER:pn-shutdown-desktop =3D "Unassign=
ed <
> unassigned@yoctoproject.org
> >  RECIPE_MAINTAINER:pn-signing-keys =3D "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
> >  RECIPE_MAINTAINER:pn-slang =3D "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER:pn-socat =3D "Hongxu Jia <hongxu.jia@windriver.com>"
> > +RECIPE_MAINTAINER:pn-source-highlight =3D "Etienne Cordonnier <
> ecordonnier@snap.com>"
> >  RECIPE_MAINTAINER:pn-speex =3D "Michael Opdenacker <
> michael@opdenacker.org>"
> >  RECIPE_MAINTAINER:pn-speexdsp =3D "Michael Opdenacker <
> michael@opdenacker.org>"
> >  RECIPE_MAINTAINER:pn-spirv-headers =3D "Jose Quaresma <
> quaresma.jose@gmail.com>"
> > diff --git a/meta/recipes-support/source-highlight/
> source-highlight_git.bb b/meta/recipes-support/source-highlight/
> source-highlight_git.bb
> > new file mode 100644
> > index 00000000000..ad5085250cb
> > --- /dev/null
> > +++ b/meta/recipes-support/source-highlight/source-highlight_git.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY =3D "Syntax highlight utility"
> > +DESCRIPTION =3D "Source-highlight converts source code to formatted te=
xt
> with syntax highlighting."
> > +HOMEPAGE =3D "
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.gnu.org_softwa=
re_src-2Dhighlite_&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DjBI-VlyTB1xFAWS9hMgg=
BpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3DlwbvDkI4fDkloLf3cs3QeCgqOB=
F_LRpfobo2v-EYtEc&e=3D
> "
> > +LICENSE =3D "GPL-3.0-only"
> > +SECTION =3D "libs"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;;md5=3Dff95bfe019feaf92f524b73dd79e76eb"
> > +
> > +SRCREV =3D "894cacd0799ca60afa359a63782729dec76cbb79"
> > +PV =3D "3.1.9+git"
> > +SRC_URI =3D "git://
> git.savannah.gnu.org/git/src-highlite.git;protocol=3Dhttps;branch=3Dmaste=
r"
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig
> > +
> > +DEPENDS:append =3D " bison-native boost"
> > +
> > +DEPENDS:append:class-target =3D " ${PN}-native"
> > +
> > +EXTRA_OECONF=3D"--with-boost-regex=3Dboost_regex"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +PACKAGES +=3D "${PN}-tools ${PN}-data"
> > +
> > +RDEPENDS:${PN} =3D "boost-regex ${PN}-data"
> > +RDEPENDS:${PN}-tools =3D "${PN} ${PN}-data bash"
> > +
> > +FILES:${PN}       =3D "${libdir}/*${SOLIBS}"
> > +FILES:${PN}-data  =3D "${datadir}/source-highlight"
> > +FILES:${PN}-tools =3D "${bindir} ${sysconfdir}/bash_completion.d"
> > +
> > +# source-highlight is using its own binary from the build tree to make
> documentation
> > +# let's substitute the native binary instead
> > +do_configure:prepend:class-target () {
> > +     sed -i -e 's,^SRCHILITEEXE =3D $(top_builddir).*,SRCHILITEEXE =3D
> source-highlight,' ${S}/doc/Makefile.am
> > +}
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#214702):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_214702&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3D59g=
bMbCXZ3BY1pfUB3UCI5Czkn6drHSb9wkgR4-e3Ls&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_112197845_1686489&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DjBI-VlyTB1xFA=
WS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3DLl_TLcnLKTlhI4Rm2ka=
Zpieo_LWka4TfPLOsJ6o8ER4&e=3D
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DjBI-Vl=
yTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&s=3DJcEYIhnX11pb=
laVhmSRW-5aSQ5QHO6L9M7ugjPg0uWU&e=3D
> [alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000b4d936063271a32a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That&#39;s fair enough. My thinking was to try to upstream=
 first to=C2=A0core, since it used to be there before it was removed,=C2=A0=
and to also get feedback on whether you would want to enable this per defau=
lt gdb. I can also move it to meta-oe if you think it is better.<br><br>=C3=
=89tienne=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 10, 2025 at 9:28=E2=80=AFP=
M Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kana=
vin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Unless you want to enable it by default in gdb (and the other =
patch<br>
shows that is not the case), source-highlight does not have to be in<br>
core. We have plenty of recipes in core with options that require<br>
items from meta-oe or other layers.<br>
<br>
Alex<br>
<br>
On Thu, 10 Apr 2025 at 21:26, Etienne Cordonnier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com=
@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;<br>
&gt; source-highlight version 3.1.8 was removed in <a href=3D"https://urlde=
fense.proofpoint.com/v2/url?u=3Dhttps-3A__web.git.yoctoproject.org_poky_com=
mit_-3Fid-3D6560db9ddfd39a2715ede96430228306b00f53dd&amp;d=3DDwIBaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddz=
Zf4_yp3Vldzt83qQW4zvi&amp;s=3DGDekE4em2Y0dcrW5i9p81jWBM-rLGDqNCZJM66b8ZzI&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__web.git.yoctoproject.org_poky_commit_-3Fid-3D6560=
db9ddfd39a2715ede96430228306b00f53dd&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4=
zvi&amp;s=3DGDekE4em2Y0dcrW5i9p81jWBM-rLGDqNCZJM66b8ZzI&amp;e=3D</a>=C2=A0 =
in June 2019 because the was no user left,<br>
&gt; however there is now a gdb PACKAGECONFIG option which uses it. Since t=
he last release was in 2019, let&#39;s rather use the latest git version.<b=
r>
&gt;<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 .../source-highlight/<a href=3D"http://source-highlight_git.bb" =
rel=3D"noreferrer" target=3D"_blank">source-highlight_git.bb</a>=C2=A0 | 36=
 +++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 37 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/source-highlight/<a href=
=3D"http://source-highlight_git.bb" rel=3D"noreferrer" target=3D"_blank">so=
urce-highlight_git.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 2b47d3103c0..831494312b6 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -777,6 +777,7 @@ RECIPE_MAINTAINER:pn-shutdown-desktop =3D &quot;Un=
assigned &lt;<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blan=
k">unassigned@yoctoproject.org</a><br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-signing-keys =3D &quot;Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-slang =3D &quot;Yi Zhao &lt;<a href=3D"mail=
to:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&q=
uot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-socat =3D &quot;Hongxu Jia &lt;<a href=3D"m=
ailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com<=
/a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-source-highlight =3D &quot;Etienne Cordonnier &l=
t;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@sna=
p.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-speex =3D &quot;Michael Opdenacker &lt;<a h=
ref=3D"mailto:michael@opdenacker.org" target=3D"_blank">michael@opdenacker.=
org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-speexdsp =3D &quot;Michael Opdenacker &lt;<=
a href=3D"mailto:michael@opdenacker.org" target=3D"_blank">michael@opdenack=
er.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-spirv-headers =3D &quot;Jose Quaresma &lt;<=
a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@g=
mail.com</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-support/source-highlight/<a href=3D"http://s=
ource-highlight_git.bb" rel=3D"noreferrer" target=3D"_blank">source-highlig=
ht_git.bb</a> b/meta/recipes-support/source-highlight/<a href=3D"http://sou=
rce-highlight_git.bb" rel=3D"noreferrer" target=3D"_blank">source-highlight=
_git.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 00000000000..ad5085250cb<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/source-highlight/<a href=3D"http://source-h=
ighlight_git.bb" rel=3D"noreferrer" target=3D"_blank">source-highlight_git.=
bb</a><br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +SUMMARY =3D &quot;Syntax highlight utility&quot;<br>
&gt; +DESCRIPTION =3D &quot;Source-highlight converts source code to format=
ted text with syntax highlighting.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttps-3A__www.gnu.org_software_src-2Dhighlite_&amp;d=3DDwIBaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddz=
Zf4_yp3Vldzt83qQW4zvi&amp;s=3DlwbvDkI4fDkloLf3cs3QeCgqOBF_LRpfobo2v-EYtEc&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__www.gnu.org_software_src-2Dhighlite_&amp;d=3DDwIB=
aQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIG=
RfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvL=
fhQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DlwbvDkI4fDkloLf3cs3QeCgqOBF_LRpfobo2v=
-EYtEc&amp;e=3D</a> &quot;<br>
&gt; +LICENSE =3D &quot;GPL-3.0-only&quot;<br>
&gt; +SECTION =3D &quot;libs&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;;md5=3Dff95bfe019feaf92f524=
b73dd79e76eb&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;894cacd0799ca60afa359a63782729dec76cbb79&quot;<br>
&gt; +PV =3D &quot;3.1.9+git&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.savannah.gnu.org/git/sr=
c-highlite.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">git.savannah.gnu.org/git/src-highlite.git;protocol=3Dhttps;bran=
ch=3Dmaster</a>&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +inherit autotools pkgconfig<br>
&gt; +<br>
&gt; +DEPENDS:append =3D &quot; bison-native boost&quot;<br>
&gt; +<br>
&gt; +DEPENDS:append:class-target =3D &quot; ${PN}-native&quot;<br>
&gt; +<br>
&gt; +EXTRA_OECONF=3D&quot;--with-boost-regex=3Dboost_regex&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; +<br>
&gt; +PACKAGES +=3D &quot;${PN}-tools ${PN}-data&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} =3D &quot;boost-regex ${PN}-data&quot;<br>
&gt; +RDEPENDS:${PN}-tools =3D &quot;${PN} ${PN}-data bash&quot;<br>
&gt; +<br>
&gt; +FILES:${PN}=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;${libdir}/*${SOLIBS}&=
quot;<br>
&gt; +FILES:${PN}-data=C2=A0 =3D &quot;${datadir}/source-highlight&quot;<br=
>
&gt; +FILES:${PN}-tools =3D &quot;${bindir} ${sysconfdir}/bash_completion.d=
&quot;<br>
&gt; +<br>
&gt; +# source-highlight is using its own binary from the build tree to mak=
e documentation<br>
&gt; +# let&#39;s substitute the native binary instead<br>
&gt; +do_configure:prepend:class-target () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,^SRCHILITEEXE =3D $(top_builddir=
).*,SRCHILITEEXE =3D source-highlight,&#39; ${S}/doc/Makefile.am<br>
&gt; +}<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#214702): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_messa=
ge_214702&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFA=
WS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3D59gbMbCXZ3BY1pf=
UB3UCI5Czkn6drHSb9wkgR4-e3Ls&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.=
org_g_openembedded-2Dcore_message_214702&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83=
qQW4zvi&amp;s=3D59gbMbCXZ3BY1pfUB3UCI5Czkn6drHSb9wkgR4-e3Ls&amp;e=3D</a> <b=
r>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_112197845_1686489&amp;d=3DDwIBaQ&amp=
;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ68d=
dzZf4_yp3Vldzt83qQW4zvi&amp;s=3DLl_TLcnLKTlhI4Rm2kaZpieo_LWka4TfPLOsJ6o8ER4=
&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_112197845_1686489&amp=
;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhk=
bNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5=
DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DLl_TLcnLKTlhI4Rm2kaZpieo_LWk=
a4TfPLOsJ6o8ER4&amp;e=3D</a> <br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIBaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9hMggBpmdK5DJQqcmgvLfhQ=
68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DJcEYIhnX11pblaVhmSRW-5aSQ5QHO6L9M7ugjPg0=
uWU&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore=
_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&a=
mp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DjBI-VlyTB1xFAWS9=
hMggBpmdK5DJQqcmgvLfhQ68ddzZf4_yp3Vldzt83qQW4zvi&amp;s=3DJcEYIhnX11pblaVhmS=
RW-5aSQ5QHO6L9M7ugjPg0uWU&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:alex.kanavi=
n@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000b4d936063271a32a--

