Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17589E92FD7
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 20:42:05 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51079.1767040914752474406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 12:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UdZfo7EL;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6446c924f9eso8383879d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 12:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767040914; x=1767645714; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LUzX+KiIsrV0wQMp+PqBoftSt7MCeg/QkVg9mriAQUs=;
        b=UdZfo7EL57Qjm8ni3n82PBellyaEk2zWePeu5bkQo9dWJhk5FsGU5UBgS+NEudPKNA
         s3/pkrCJbVGfBNwl/GZ5MqoH79vD4o4O0X/ZWSzby3UmbOj7qP1JnROLn5pZ8mIy7NhU
         W3mwM63Xu5kwaUyDihzvCjrkEa0ZtG9fJHEQVobEfUWCn1DhAbLsY7AhdLnqwnxFfnPl
         NN+l996S30PZdPPnMCvr1OKZm2D14gGwuV+4Dk1DXyJleuuXmFWACb5QqSyKRSs2Vn2d
         uULks5JfEUzzsySaL8nyGahzkYWcwGTONp+OIjANxU84I2krJb/HykNPZ3mcf0UAG8l7
         cqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767040914; x=1767645714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUzX+KiIsrV0wQMp+PqBoftSt7MCeg/QkVg9mriAQUs=;
        b=oOj+pDF/qWsBqkxA2mhPYHN4bahxtk5U7Gv+aef41/HY6PtGoU4FID0fMYn9bVO9Qa
         2vmDM4ErKqHZT/5eESTiWO9BoIVCKfQKsiVPDEzg5U/JgHpjwhTPkzhvhGrOWbpjf08E
         bnSRNbmbLAvTS1zJJROfAGnIXrvQe4jnkGN1DSfBV5dAK3d/PZ5Sla9DNMX4Z/sh0hxx
         hQQ/Jt4QZ5dx4Fyy0oVcbJiQ0aO1fdpEshkDERHHpA1GDyrcx9sU8P8t15IwuuisIkIX
         aMLQ6xEXbYs0oxL/KPTMdBoK8EfdxrM6VnV3lIv6CusVPfPIZDBwSmGghCcVPCF/4D18
         HBfQ==
X-Gm-Message-State: AOJu0YznWV1r96vRvxKlJlg5NvOwjT/M4s+5YwuhxoIa5DyvFSLpNB4Y
	/bJMvFGVAgPqpKNy0ciGzzQkVLcyu/lPklr7KdHqtz8eNyHQkibxxGd89kR84TLHRUSsmu+TRLT
	Uhr0Neu/tMoW27Hpx34TWKsxz4oqgOyY=
X-Gm-Gg: AY/fxX4E/dBF1PLe85SkhK6Miw9MP18LDEGBBCgaKDJLcpawmNtf0naV+2yhBcwVxj1
	0B6qLeFZ/+27WripOSOQ0uEADBycow3sUul+h8G7Tdm1HoUd9l3QSsp+JEHcThc5iSSFs3eMbWg
	o5yQoX5uKagvaNDzC1Cj2MUXg1lBtmmTNR/e/YBQLCozmfm8XzTjWxeY44/O2oFEnjlLt2iyKHZ
	UrRjYY0/HMEfFnH0R9nFdw4mEjeHngYQE39cyR9GjUebg9w10n2Lw3PnaAS931G1wgIlkCgfjf+
	NoJnftNIHDhG/825QLTGrmZw4CJV/fotuhscxQ9C1wiX9feGQsM7CbA20AsRzWak/lBQhAQuOA9
	6TBaWR+YD+FAZj/c1QXPQ9MVYdT8=
X-Google-Smtp-Source: AGHT+IHPcSiVtJTR4q2XEd9HbE06j0jzDv92gaSS+SAtQC0hu+fl/M4dgYLtLGWNWwsWVS/eFsHBPZ3Mobncnj6Jp5U=
X-Received: by 2002:a53:6912:0:b0:645:5d62:dd8 with SMTP id
 956f58d0204a3-6466a8f31a3mr19864218d50.50.1767040913828; Mon, 29 Dec 2025
 12:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
 <20251219032209.960840-22-ankur.tyagi85@gmail.com> <CAOSpxdZyis0uTZfX46DC8ZxHKNevWSU6NBYA=OEWTWG_d7zboQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZyis0uTZfX46DC8ZxHKNevWSU6NBYA=OEWTWG_d7zboQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Dec 2025 12:41:27 -0800
X-Gm-Features: AQt7F2pKieNRGUjEVFYWGl81ECgGpNx8p73Y-9xmM5MSUjkLv8HSO3d68noT8NY
Message-ID: <CAMKF1sr3MDmAp3gyep5BJ90u8VpBV+eDad9Ux90fNEBQXVHOyg@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH v2 21/29] llvm/clang: Upgrade to
 21.1.7 release
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, ankur.tyagi85@gmail.com
Content-Type: multipart/alternative; boundary="000000000000f8f1f006471d45ce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 20:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228615

--000000000000f8f1f006471d45ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 12:34=E2=80=AFPM Steve Sakoman <steve@sakoman.com> =
wrote:

> Khem,
>
> Do you feel that the upgrades from 21.1.5 to 21.1.7 are suitable for a
> stable release?
>

Yes the point releases of LLVM are bugfix-only changes. We should be fine
to have them on
YP releases.


>
> Thanks,
>
> Steve
>
> On Thu, Dec 18, 2025 at 7:23=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >
> > Brings following bugfixes on top of 21.1.6
> >
> > 292dc2b86f66 (HEAD, tag: llvmorg-21.1.7) [LLD][COFF] Align EC code
> ranges to page boundaries (#168222)
> > 9ed1927442a4 [server-llvm-21][MC] Fixing vector overflow
> > 922c9914e14b [clangd] Clangd running with
> `--experimental-modules-support` crashes when the compilation database is
> unavailable (#153802)
> > 33e1a55a8bc7 Bump version to 21.1.7
> >
> > Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com=
>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 2351cc82dca18e159c9630266a81571a95394bfe)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc     | 2 +-
> >  meta/recipes-devtools/clang/common-clang.inc | 2 +-
> >  meta/recipes-devtools/clang/common.inc       | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 163d9808ad..efe8fb5f09 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce
> Ashfield <bruce.ashfield@gmail.com>
> >  RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
> >  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
> > -RECIPE_MAINTAINER:pn-llvm-project-source-21.1.6 =3D "Khem Raj <
> raj.khem@gmail.com>"
> > +RECIPE_MAINTAINER:pn-llvm-project-source-21.1.7 =3D "Khem Raj <
> raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.=
com
> >"
> >  RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> > diff --git a/meta/recipes-devtools/clang/common-clang.inc
> b/meta/recipes-devtools/clang/common-clang.inc
> > index 4051ce6085..ae0caa6f01 100644
> > --- a/meta/recipes-devtools/clang/common-clang.inc
> > +++ b/meta/recipes-devtools/clang/common-clang.inc
> > @@ -5,7 +5,7 @@ LLVM_HTTP ?=3D "https://github.com/llvm"
> >
> >  MAJOR_VER =3D "21"
> >  MINOR_VER =3D "1"
> > -PATCH_VER =3D "6"
> > +PATCH_VER =3D "7"
> >  # could be 'rcX' or 'git' or empty ( for release )
> >  VER_SUFFIX =3D ""
> >
> > diff --git a/meta/recipes-devtools/clang/common.inc
> b/meta/recipes-devtools/clang/common.inc
> > index f19599ae58..c960bf2d1d 100644
> > --- a/meta/recipes-devtools/clang/common.inc
> > +++ b/meta/recipes-devtools/clang/common.inc
> > @@ -17,7 +17,7 @@ BASEURI ?=3D
> "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
> >  UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
> >  UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
> >  SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
> > -SRC_URI[sha256sum] =3D
> "ae67086eb04bed7ca11ab880349b5f1ab6f50e1b88cda376eaf8a845b935762b"
> > +SRC_URI[sha256sum] =3D
> "e5b65fd79c95c343bb584127114cb2d252306c1ada1e057899b6aacdd445899e"
> >
> >  SRC_URI =3D "\
> >      ${BASEURI} \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#228189):
> https://lists.openembedded.org/g/openembedded-core/message/228189
> > Mute This Topic: https://lists.openembedded.org/mt/116854382/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000f8f1f006471d45ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 29,=
 2025 at 12:34=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman=
.com">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Khem,<br>
<br>
Do you feel that the upgrades from 21.1.5 to 21.1.7 are suitable for a<br>
stable release?<br></blockquote><div><br></div><div>Yes the point releases=
=C2=A0of LLVM are bugfix-only changes. We should be fine to have them on</d=
iv><div>YP releases.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Thanks,<br>
<br>
Steve<br>
<br>
On Thu, Dec 18, 2025 at 7:23=E2=80=AFPM Ankur Tyagi via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a><br>
&lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varatharajan@=
windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>&gt;=
<br>
&gt;<br>
&gt; Brings following bugfixes on top of 21.1.6<br>
&gt;<br>
&gt; 292dc2b86f66 (HEAD, tag: llvmorg-21.1.7) [LLD][COFF] Align EC code ran=
ges to page boundaries (#168222)<br>
&gt; 9ed1927442a4 [server-llvm-21][MC] Fixing vector overflow<br>
&gt; 922c9914e14b [clangd] Clangd running with `--experimental-modules-supp=
ort` crashes when the compilation database is unavailable (#153802)<br>
&gt; 33e1a55a8bc7 Bump version to 21.1.7<br>
&gt;<br>
&gt; Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Vara=
tharajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.co=
m</a>&gt;<br>
&gt; Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dub=
ois-briand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com=
</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; (cherry picked from commit 2351cc82dca18e159c9630266a81571a95394bfe)<b=
r>
&gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.c=
om" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0| 2 =
+-<br>
&gt;=C2=A0 meta/recipes-devtools/clang/common-clang.inc | 2 +-<br>
&gt;=C2=A0 meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt;=C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 163d9808ad..efe8fb5f09 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt =3D &quot;Bruc=
e Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank=
">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D &quot;Bruce Ashfield &=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashf=
ield@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-lld =3D &quot;Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br=
>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-lldb =3D &quot;Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<b=
r>
&gt; -RECIPE_MAINTAINER:pn-llvm-project-source-21.1.6 =3D &quot;Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-llvm-project-source-21.1.7 =3D &quot;Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D &quot;Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-llvm =3D &quot;Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<b=
r>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-logrotate =3D &quot;Yi Zhao &lt;<a href=3D"=
mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&g=
t;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recip=
es-devtools/clang/common-clang.inc<br>
&gt; index 4051ce6085..ae0caa6f01 100644<br>
&gt; --- a/meta/recipes-devtools/clang/common-clang.inc<br>
&gt; +++ b/meta/recipes-devtools/clang/common-clang.inc<br>
&gt; @@ -5,7 +5,7 @@ LLVM_HTTP ?=3D &quot;<a href=3D"https://github.com/llv=
m" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm</a>&quot;<b=
r>
&gt;<br>
&gt;=C2=A0 MAJOR_VER =3D &quot;21&quot;<br>
&gt;=C2=A0 MINOR_VER =3D &quot;1&quot;<br>
&gt; -PATCH_VER =3D &quot;6&quot;<br>
&gt; +PATCH_VER =3D &quot;7&quot;<br>
&gt;=C2=A0 # could be &#39;rcX&#39; or &#39;git&#39; or empty ( for release=
 )<br>
&gt;=C2=A0 VER_SUFFIX =3D &quot;&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-dev=
tools/clang/common.inc<br>
&gt; index f19599ae58..c960bf2d1d 100644<br>
&gt; --- a/meta/recipes-devtools/clang/common.inc<br>
&gt; +++ b/meta/recipes-devtools/clang/common.inc<br>
&gt; @@ -17,7 +17,7 @@ BASEURI ?=3D &quot;${LLVM_HTTP}/llvm-project/release=
s/download/llvmorg-${PV}${VER_SUFFI<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;${LLVM_HTTP}/llvm-project/releases/=
&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/llvmorg-?(?P&lt;pver=
&gt;\d+(\.\d+)+)&quot;<br>
&gt;=C2=A0 SOURCEDIR ?=3D &quot;llvm-project-${PV}${VER_SUFFIX}.src&quot;<b=
r>
&gt; -SRC_URI[sha256sum] =3D &quot;ae67086eb04bed7ca11ab880349b5f1ab6f50e1b=
88cda376eaf8a845b935762b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;e5b65fd79c95c343bb584127114cb2d252306c1a=
da1e057899b6aacdd445899e&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${BASEURI} \<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#228189): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/228189" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/228189</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11685438=
2/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116854382/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000f8f1f006471d45ce--

