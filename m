Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CD5E6F08A
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 20:35:44 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.4110.1730493340926189172
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 13:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O+OYkc8u;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so351617e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 13:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730493339; x=1731098139; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTroQXa9hXKtIQxyp8p5U6JgMBWUFyPIPn390AEjamk=;
        b=O+OYkc8um7SaOt0QgRu0kU3H3+9Qj8mp7/U0pcXqsSXkl57oD9HwG3QlYxnC222Ey7
         1E8S93AWg30O9sbRtPZE2oT+6+oj9wA4Ni3f8ieSAfg8AqrGz8hsOO1MpZIBPJGv6Eql
         6EIhQVKKTC5t9dcjbk/3ksdDpvPiYa9NnT1Rly0F87ScqnNWSkYMyqx4grIbhRE4llGR
         B/CHGufaqXl8ULUGpn+rLbrPXDPM+eGdCi//uEYLHpKzw9U8P00N5Lb2no5cnfoxtMhW
         Lp2lHrGH+fk6wIhs83uR7wZyp4JmVrCnuCQe9CQEIfpW8VdX0zgGQsx0MYpfzhJF3cAQ
         d2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730493339; x=1731098139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTroQXa9hXKtIQxyp8p5U6JgMBWUFyPIPn390AEjamk=;
        b=Yvg7YkQ6vPXsRdg5b3RZ16gGJqlZxkS2jRFo4UN1punXVPf1NKOORxY0seRRh3boAm
         U/nSmFCCFsD+lx4p69xqxgPMt12L84YSjxxwie6rbMCMN6x+YFFInIooGUwMEZUjBkPW
         +ju95oGcS+QmlGqyoI8Baa9ovFn6nzFpigybKyDlEsnVrwDzxiGcJtnMKoHVFguvXVXp
         iRsRCWt2RGdyV4PvbzyazJoXZ8nyymFAsuXfMRttcM07jsHkpf5G4kIO3/7Jg8yhVSQl
         dL3j88IPMB54eBq96LQg5cE1AaI7RlI7D6oTw+rhpANm7kKL1CfzX1wh5LL518tjCYcK
         w7xA==
X-Gm-Message-State: AOJu0YwGJ5UDnRUVyobCqKVquxWI8f5b0mjwB+DNORG0/rUlupC4dYR2
	pkWpoJwe6AYbG+dMPdvA56QOMOOIlf311+CxWbQ7AzSnLARvUzHKC3eEt9RQ85xinVSpYb365RN
	F9NopEU4Yl05fQDLET+GJ+SwYB4o=
X-Google-Smtp-Source: AGHT+IEYDc+7L8uOYbPDSr6Pwiw3RZHzoFz2NXrnhv1jcnkbDk6BRWxsMkBnM7Svcrccahv3upbVpJuRLYCoNdBRkOg=
X-Received: by 2002:a2e:a550:0:b0:2fa:d84a:bd83 with SMTP id
 38308e7fff4ca-2fd0595132cmr75417911fa.24.1730493338545; Fri, 01 Nov 2024
 13:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241101184156.2368109-1-hiagofranco@gmail.com>
 <CANNYZj-nmnzTFqPT2nCY2EWWirCpyo1Yw9gFUz9_=dMt3diYXA@mail.gmail.com> <20241101202323.4ld6jdczxaoxk6fb@hiago-nb>
In-Reply-To: <20241101202323.4ld6jdczxaoxk6fb@hiago-nb>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Nov 2024 21:35:27 +0100
Message-ID: <CANNYZj_tFUibOLa5MUDLOSBvKt2F=bZqdk7q4_6besXMJ4pgHA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] drm-info: add recipe
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000baf3f60625dfe026"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 20:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206633

--000000000000baf3f60625dfe026
Content-Type: text/plain; charset="UTF-8"

Perhaps you can show what the tool outputs?

Alex

On Fri 1. Nov 2024 at 21.23, Hiago De Franco <hiagofranco@gmail.com> wrote:

> Hi Alexander,
>
> On Fri, Nov 01, 2024 at 08:22:03PM +0100, Alexander Kanavin wrote:
> > Should this go to meta-oe rather? Why core?
>
> I was not 100% sure, I just selected here because I saw the recipe for
> 'libdrm' and the 'recipes-graphics/drm'. I can move this to meta-oe if
> openembedded-core is not the correct place. Please let me know.
>
> >
> > Alex
> >
> > On Fri 1. Nov 2024 at 19.42, Hiago De Franco via lists.openembedded.org
> > <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> >
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > This recipe provides information about DRM devices, useful for
> debugging
> > > and checking information about DRM.
> > >
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > >  meta/conf/distro/include/maintainers.inc    |  1 +
> > >  meta/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
> > >  2 files changed, 14 insertions(+)
> > >  create mode 100644 meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > >
> > > diff --git a/meta/conf/distro/include/maintainers.inc
> > > b/meta/conf/distro/include/maintainers.inc
> > > index 7aafa7a2d146..2c2779f8cf83 100644
> > > --- a/meta/conf/distro/include/maintainers.inc
> > > +++ b/meta/conf/distro/include/maintainers.inc
> > > @@ -156,6 +156,7 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi
> > > Zhao <yi.zhao@windriver.com>"
> > >  RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
> > >  RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
> > >  RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org
> >"
> > > +RECIPE_MAINTAINER:pn-drm-info = "Hiago De Franco <
> > > hiago.franco@toradex.com>"
> > >  RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
> > >  RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
> > >  RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <
> > > alex.kanavin@gmail.com>"
> > > diff --git a/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > new file mode 100644
> > > index 000000000000..9f1cbb47fbfd
> > > --- /dev/null
> > > +++ b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > > @@ -0,0 +1,13 @@
> > > +SUMMARY = "Small utility to dump info about DRM devices"
> > > +HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
> > > +
> > > +SRC_URI = "git://
> > >
> gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
> > > +SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +inherit meson pkgconfig
> > > +
> > > +DEPENDS = "json-c libdrm"
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#206628):
> > > https://lists.openembedded.org/g/openembedded-core/message/206628
> > > Mute This Topic: https://lists.openembedded.org/mt/109340073/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [
> > > alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> > >
>
> Regards,
>
> Hiago.
>

--000000000000baf3f60625dfe026
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Perhaps you can show what the tool outputs?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 1. Nov 2024 at 21.23,=
 Hiago De Franco &lt;<a href=3D"mailto:hiagofranco@gmail.com">hiagofranco@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)">Hi Alexander,<br>
<br>
On Fri, Nov 01, 2024 at 08:22:03PM +0100, Alexander Kanavin wrote:<br>
&gt; Should this go to meta-oe rather? Why core?<br>
<br>
I was not 100% sure, I just selected here because I saw the recipe for<br>
&#39;libdrm&#39; and the &#39;recipes-graphics/drm&#39;. I can move this to=
 meta-oe if<br>
openembedded-core is not the correct place. Please let me know.<br>
<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Fri 1. Nov 2024 at 19.42, Hiago De Franco via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a><br>
&gt; &lt;hiagofranco=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; From: Hiago De Franco &lt;<a href=3D"mailto:hiago.franco@toradex.=
com" target=3D"_blank">hiago.franco@toradex.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This recipe provides information about DRM devices, useful for de=
bugging<br>
&gt; &gt; and checking information about DRM.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Hiago De Franco &lt;<a href=3D"mailto:hiago.franco=
@toradex.com" target=3D"_blank">hiago.franco@toradex.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt; &gt;=C2=A0 meta/recipes-graphics/drm/<a href=3D"http://drm-info_2.7.0.=
bb" rel=3D"noreferrer" target=3D"_blank">drm-info_2.7.0.bb</a> | 13 +++++++=
++++++<br>
&gt; &gt;=C2=A0 2 files changed, 14 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-graphics/drm/<a href=3D"htt=
p://drm-info_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">drm-info_2.7.0.=
bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; b/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; index 7aafa7a2d146..2c2779f8cf83 100644<br>
&gt; &gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; @@ -156,6 +156,7 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets =
=3D &quot;Yi<br>
&gt; &gt; Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blan=
k">yi.zhao@windriver.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-dos2unix =3D &quot;Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;&quot;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-dosfstools =3D &quot;Yi Zhao &lt;<a hr=
ef=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com=
</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-dpkg =3D &quot;Unassigned &lt;<a href=
=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctop=
roject.org</a>&gt;&quot;<br>
&gt; &gt; +RECIPE_MAINTAINER:pn-drm-info =3D &quot;Hiago De Franco &lt;<br>
&gt; &gt; <a href=3D"mailto:hiago.franco@toradex.com" target=3D"_blank">hia=
go.franco@toradex.com</a>&gt;&quot;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-dropbear =3D &quot;Yi Zhao &lt;<a href=
=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</=
a>&gt;&quot;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-dtc =3D &quot;Wang Mingyu &lt;<a href=
=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;=
&quot;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER:pn-dwarfsrcfiles =3D &quot;Alexander Kana=
vin &lt;<br>
&gt; &gt; <a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt;&quot;<br>
&gt; &gt; diff --git a/meta/recipes-graphics/drm/<a href=3D"http://drm-info=
_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">drm-info_2.7.0.bb</a><br>
&gt; &gt; b/meta/recipes-graphics/drm/<a href=3D"http://drm-info_2.7.0.bb" =
rel=3D"noreferrer" target=3D"_blank">drm-info_2.7.0.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..9f1cbb47fbfd<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-graphics/drm/<a href=3D"http://drm-info_2.7.0.=
bb" rel=3D"noreferrer" target=3D"_blank">drm-info_2.7.0.bb</a><br>
&gt; &gt; @@ -0,0 +1,13 @@<br>
&gt; &gt; +SUMMARY =3D &quot;Small utility to dump info about DRM devices&q=
uot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.freedesktop.org/eme=
rsion/drm_info" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedes=
ktop.org/emersion/drm_info</a>&quot;<br>
&gt; &gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D32fd56d355bd6a61=
017655d8da26b67c&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D &quot;git://<br>
&gt; &gt; <a href=3D"http://gitlab.freedesktop.org/emersion/drm_info.git;br=
anch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gitlab=
.freedesktop.org/emersion/drm_info.git;branch=3Dmaster;protocol=3Dhttps</a>=
&quot;<br>
&gt; &gt; +SRCREV =3D &quot;c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc&quot;<=
br>
&gt; &gt; +<br>
&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit meson pkgconfig<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS =3D &quot;json-c libdrm&quot;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#206628):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/206628" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/206628</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109=
340073/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/109340073/1686489</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<br>
&gt; &gt; <a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
Regards,<br>
<br>
Hiago.<br>
</blockquote></div></div>

--000000000000baf3f60625dfe026--

