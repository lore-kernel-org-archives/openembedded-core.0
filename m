Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC75C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 11:10:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.21727.1680088220174898585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 04:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MSw/+nnw;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id j24so15270670wrd.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 04:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680088218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nAC3puUboV+PaW2AQboG/NDyPZL41B5tfCSBNI9NrRA=;
        b=MSw/+nnwxQBlbmApkHWJkSx0euEE2SHCQWltiUvU6bO40MGjZJstHH/WHn2vXMgh5t
         q7CIOpEGdqY6+VddtNSIhX9jMcoOi64rufElFIjjWdCBejrYU8HjApn7FpMZqc4ZMbR8
         lZDEuVJB0Rim75wSVHnQMnR3cgMvlk4GByeLN+xB8py7rRAXFZ1oud/l2ubTU0O2AipG
         6lwDlfnsPQb36f5mJEonPvkRew50zF+swJNuCoUuW5u2E5Xo9OGG+fB+Xvc+Kfr5Z1jj
         YlXluEhysVir7/fWVQSA0fbxit7Y7ook2upvUJ11g6hyXCcBn5yvjN4oCQwezYZL7YIr
         IS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680088218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAC3puUboV+PaW2AQboG/NDyPZL41B5tfCSBNI9NrRA=;
        b=kyuNUZmz3sdPeFFObKm0VUf8LWTFEwXI8GZ6f9rw2JKmkBtnulAhqPaD0bCGvpz9rF
         0OAu1omfJrRoWdy9yYHgyZjhYvMdqMJYlOCnxbtOp6uLto/2otYXxwMkOC/PD/pZsztQ
         k5hVtgEoUi4ZY6ZTA7T0xTBVPGuoi7tQaGSrFAPvMpzUWwvOQXGQyW9eZOWPrEJ/QhOT
         0t1k3bXrhcLC0NFFykiz5sjirmrNmVFvKC201/Lbwo5y3arRhlP0mGGcXzqQ1I+e7+1a
         YYjwJJ6Lnzul91I+RjHjIPH6QtoMb7o2x+Xivbay8Umrm7e/HZimUxCZVIwHswALftyR
         r9xg==
X-Gm-Message-State: AAQBX9f4z4R0DQZ+87pSotHwQj/Fnr71k+zgJgaBpo9HT18b9PuGYj+e
	5H8TizXC7VF9dF9vRAfpPOWt4rRukGFkOL7wggQ=
X-Google-Smtp-Source: AKy350a80kaSMGworpaSVTZ0pyqWo/tjIiWiZjDHWXpvA8dxPa55tW1G/Etx+gpegmTRyEPVMbMf0D3SZZYabxsGV3A=
X-Received: by 2002:a5d:4cc3:0:b0:2e2:1f55:7ce9 with SMTP id
 c3-20020a5d4cc3000000b002e21f557ce9mr1335743wrt.1.1680088218264; Wed, 29 Mar
 2023 04:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230207215439.1391583-1-richard.purdie@linuxfoundation.org>
 <CA+chaQegKKEqfCG3-BG=zs44CTLojSu0tFAWqpuPk3aze2jYiA@mail.gmail.com> <23839d81dabf0f98af383b3c09d9eb772624231e.camel@linuxfoundation.org>
In-Reply-To: <23839d81dabf0f98af383b3c09d9eb772624231e.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Mar 2023 13:10:03 +0200
Message-ID: <CA+chaQfVqAiZ_kwB7MP7R+OnPE=zTUC0hPStTb7CM-Y3tpN9ug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uninative: Upgrade to 3.9 to include glibc 2.37
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000070e79605f80805d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 11:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179274

--00000000000070e79605f80805d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Over night I got one failure in kirkstone with new uninative:

Exception: subprocess.CalledProcessError: Command '('patchelf-uninative',
'--set-interpreter',
'TOPDIR/BUILD/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2',
'TOPDIR/BUILD/work/x86_64-linux/3gpt/fakes/sstate-build-populate_sysroot/re=
cipe-sysroot-native/usr/bin/makePr0n')'
returned non-zero exit status 1.

Subprocess output:
patchelf: open: Permission denied

After discussing with RP on #yocto he mentioned patchelf change related to
this and that's:
https://git.openembedded.org/openembedded-core/commit/?id=3D728775c87a7e35a=
03408675ce1c7a8cd061b2fda
which is already in langdale and does apply for kirkstone.

I've backported this for my kirkstone builds and will send formal backport
request for all 4 changes after a bit more testing (even safe things tend
to break if you build a lot of weird stuff).

Regards,

On Tue, Mar 28, 2023 at 10:33=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2023-03-28 at 22:13 +0200, Martin Jansa wrote:
> > On Tue, Feb 7, 2023 at 10:54=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > From: Michael Halstead <mhalstead@linuxfoundation.org>
> > >
> > > Update uninative to work with the new glibc 2.37.
> > >
> >
> >
> > >
> > > Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/meta/conf/distro/include/yocto-uninative.inc
> > > b/meta/conf/distro/include/yocto-uninative.inc
> > > index 51c0cdee438..8a5cab5360d 100644
> > > --- a/meta/conf/distro/include/yocto-uninative.inc
> > > +++ b/meta/conf/distro/include/yocto-uninative.inc
> > > @@ -6,10 +6,10 @@
> > >  # to the distro running on the build machine.
> > >  #
> > >
> > > -UNINATIVE_MAXGLIBCVERSION =3D "2.36"
> > > -UNINATIVE_VERSION =3D "3.8.1"
> > > +UNINATIVE_MAXGLIBCVERSION =3D "2.37"
> > > +UNINATIVE_VERSION =3D "3.9"
> > >
> >
> >
> > Was there some dependency on other changes to consider this for
> > backport to langdale (which already has the libgcc change with 3.8.1)
> > and then kirkstone (needs both update to 3.8.1 and then this).
> >
> > I'll start using it for my ubuntu-23.10 builds (with glibc 2.37) and
> > ask for backport later if there is no reply on this.
>
> Uninative should generally be safe for backporting.
>
> Cheers,
>
> Richard
>

--00000000000070e79605f80805d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Over night I got one failure in kirkstone with new uninati=
ve:<div><br></div><div>Exception: subprocess.CalledProcessError: Command &#=
39;(&#39;patchelf-uninative&#39;, &#39;--set-interpreter&#39;, &#39;TOPDIR/=
BUILD/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2&#39;, &#39;T=
OPDIR/BUILD/work/x86_64-linux/3gpt/fakes/sstate-build-populate_sysroot/reci=
pe-sysroot-native/usr/bin/makePr0n&#39;)&#39; returned non-zero exit status=
 1.<br><br>Subprocess output:<br>patchelf: open: Permission denied<br></div=
><div><br></div><div>After discussing with RP on #yocto he mentioned patche=
lf change related to this and that&#39;s:</div><div><a href=3D"https://git.=
openembedded.org/openembedded-core/commit/?id=3D728775c87a7e35a03408675ce1c=
7a8cd061b2fda">https://git.openembedded.org/openembedded-core/commit/?id=3D=
728775c87a7e35a03408675ce1c7a8cd061b2fda</a><br></div><div>which is already=
 in langdale and does apply for kirkstone.<br></div><div><br></div><div>I&#=
39;ve backported this for my kirkstone builds and will send formal backport=
 request for all 4 changes after a bit more testing (even safe things tend =
to break if you build a lot of weird stuff).</div><div><br></div><div>Regar=
ds,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Mar 28, 2023 at 10:33=E2=80=AFPM Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, 2023-03-28 at 22:13 +0200, Martin Jansa wrote:<br>
&gt; On Tue, Feb 7, 2023 at 10:54=E2=80=AFPM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; From: Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxfound=
ation.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Update uninative to work with the new glibc 2.37.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Michael Halstead &lt;<a href=3D"mailto:mhalstead@l=
inuxfoundation.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;=
<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/conf/distro/include/yocto-uninative.inc | 10 +++++----=
-<br>
&gt; &gt; =C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/conf/distro/include/yocto-uninative.inc<br>
&gt; &gt; b/meta/conf/distro/include/yocto-uninative.inc<br>
&gt; &gt; index 51c0cdee438..8a5cab5360d 100644<br>
&gt; &gt; --- a/meta/conf/distro/include/yocto-uninative.inc<br>
&gt; &gt; +++ b/meta/conf/distro/include/yocto-uninative.inc<br>
&gt; &gt; @@ -6,10 +6,10 @@<br>
&gt; &gt; =C2=A0# to the distro running on the build machine.<br>
&gt; &gt; =C2=A0#<br>
&gt; &gt; <br>
&gt; &gt; -UNINATIVE_MAXGLIBCVERSION =3D &quot;2.36&quot;<br>
&gt; &gt; -UNINATIVE_VERSION =3D &quot;3.8.1&quot;<br>
&gt; &gt; +UNINATIVE_MAXGLIBCVERSION =3D &quot;2.37&quot;<br>
&gt; &gt; +UNINATIVE_VERSION =3D &quot;3.9&quot;<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Was there some dependency on other changes to consider this for<br>
&gt; backport to langdale (which already has the libgcc change with 3.8.1)<=
br>
&gt; and then kirkstone (needs both update to 3.8.1 and then this).<br>
&gt; <br>
&gt; I&#39;ll start using it for my ubuntu-23.10 builds (with glibc 2.37) a=
nd<br>
&gt; ask for backport later if there is no reply on this.<br>
<br>
Uninative should generally be safe for backporting.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--00000000000070e79605f80805d3--

