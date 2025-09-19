Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FC3CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:48:57 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.15762.1758286131671527676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 05:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WHYlSz4K;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32e1c8223d3so1751174a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758286131; x=1758890931; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BV89ndcw0YZvVgOthYWiMUpEyd6hoW3/U9vtuLKozU0=;
        b=WHYlSz4KBI+SvnaprnwUCarAXBy5tXoUbYC5WEviTgCfhomdtQoorxvL8GAKEeO2zL
         zgV06Q9S3npoDGPEGGt4x4BrtSPnGd3p5tuWFYVi/QM75cqa3SudOyU4m2YaXUKs1grx
         Ep4CuBFFlBHgpbsG2k0EilIHJWv0Ypsy5LbN333ME/Ba9IF+BsPK0yepGkylrXyYLj2t
         bBjw13nr9FUF7Dcf4XU+4Gcv6U4z31Y1HEf4k89lysbasme0TXcgIugs0SnLyuskmzm0
         lNfdRj/E6dFtNQFhrrl/ZXuv54e+Dk7j9GuCtIOa+bF9DJ9us9fGSTAfwU/MW5gcR26g
         PnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758286131; x=1758890931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV89ndcw0YZvVgOthYWiMUpEyd6hoW3/U9vtuLKozU0=;
        b=lURy4htTIZG4jcuW0IpAkAkMnJXS4mJVkf7McD3kCTL4Gn9xfD6mKP+eHmdE0akmrK
         iDzGvyIl426ktf/AJVExD76Xz7bIUL3I8DJwZo9IOa+DnejHlwkhGYjzibIaJiOzhJCX
         /n1WavqGotE+MEKj+YKRH2aEiw9gzIySCc0fSelsCtLkE3G3IuOxSQZDx6Axy7tLXCVP
         HXzGxomf+NKS2G1xKb+yHWMTZQoUjZ+kYXwrlEAZtFYhzcQb7q+x+ED9WtSQi/k4Vf7P
         y2HdyRXjsLnmXAqidSnvcli8mwQXu1crQz3Iym7i9XOaGlJUhyTIv/kykXymSxQfGqP8
         Cctw==
X-Forwarded-Encrypted: i=1; AJvYcCU2Aj6AZWIhcitBYDkYe5eqH7KTPhfVPGTcqUi0stXt0Q5ca6z1hCdN4dyT76TzPncOregoi6LvyC6TP+buWvcoTw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJFS46p44P8lLD1vGej73mNQvNTco6kZBKwGqxce55jjsDM6xk
	iW2oWYxVO1/wVVJR/pni3g8BW6IWdK9WvuyRzkyEUzhdCT+9IRb4CHP8SLymlVd0zwOVr85kPhm
	RJWRWX19efw7HMVOI5bkEwrKd7bBONEs=
X-Gm-Gg: ASbGncv/uTW2HyG1ccC1hNe7ngoIkkT5gGBx6bhABFlQ5Mcy3Zh8Q3lB7/c2YNEx+Kp
	tCbOEIGxsWEJQjQ/dBjQ5qcFTvBdMbAlKPD15dfvZIgHQYGyvFZhRUp3wSDD2V5VMNIKT3kVJew
	mL/n9IheoQHNQxa0fQDcAbF0NjnMQsv5xw7fWZ8IQDybWKyfJzzcqM32jiuQCVQgN6DFab7prjx
	ycD8IO237HxCtGiJjwbdmiyvYJvcF65USQXaXlS
X-Google-Smtp-Source: AGHT+IHs0DsQF1xDUomfU+tx9+A4Mgln15NxIEpR9UJNmzW03lbEGCTjg++yNl39YOQDwzFFljAo4dMpjS1fvGpKzeg=
X-Received: by 2002:a17:90b:4cd1:b0:32e:e18a:3691 with SMTP id
 98e67ed59e1d1-33098386c95mr4334072a91.35.1758286130929; Fri, 19 Sep 2025
 05:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
 <0074b1cd80c242493c1e50d9ff58cc4427272a50.1757088383.git.bruce.ashfield@gmail.com>
 <AS1PR10MB5697E637960455A217026DBBFD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1866AF8ECC88AFA1.22280@lists.openembedded.org>
In-Reply-To: <1866AF8ECC88AFA1.22280@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 19 Sep 2025 08:48:39 -0400
X-Gm-Features: AS18NWCahj1ufTLTlx2mj_mMo6NzZgPi9PuOIaI_V266Agww-_zjoWok4EcrOvQ
Message-ID: <CADkTA4NRGBeFNS_UE4YYOXh+RFPnTM8QoZYMizUAsD_d9tHKww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] poky: bump default kernel reference to 6.16
To: bruce.ashfield@gmail.com
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000003f62dc063f26e45e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 12:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223743

--0000000000003f62dc063f26e45e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 8:42=E2=80=AFAM Bruce Ashfield via lists.openembedd=
ed.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Fri, Sep 19, 2025 at 8:35=E2=80=AFAM Marko, Peter <Peter.Marko@siemens=
.com>
> wrote:
>
>> Hello Bruce,
>>
>> This upgrade broke build of external kernel modules for powerpc.
>> Yocto test devtool.DevtoolTest.test_devtool_kernelmodule is failing.
>>
>> We have prepared a patch for upstream kernel.
>>
>> https://lore.kernel.org/all/20250919121417.1601020-1-alexander.sverdlin@=
siemens.com/
>> But I guess it will take lot of time to get picked there, then backporte=
d
>> to 6.16, tagged and finally this tag picked by yocto.
>> Is there a process to pick this patch already now to keep the pipeline
>> green?
>>
>
> Yes, if you submit it to the linux-yocto mailing list (you need to
> subscribe), I can
> merge it directly to linux-yocto and send a SRCREV bump to the list.
>
> I'll carry the patch to any newer kernel that I do, until it merges
> upstream and
> I'll automatically drop it at that point.
>

What is interesting is that we had a crtres patch for powerpc for many
years,
but "recently" (2024) dropped it:

https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=3Dyocto-6.12&id=
=3D3cf758061025b9284ddfb1259f79860666737302

And that dropped patch should have been part of several reference kernels
since
that commit. Just so I know, this is something that has been passing on all
reference kernels and just broke on 6.16 ?

Something must have changed upstream to bring the breakage back! Your
fix is simpler than the old one we had, so that's progress :)

Bruce



>
> Bruce
>
>
>
>> Peter
>>
>> > -----Original Message-----
>> > From: openembedded-core@lists.openembedded.org <openembedded-
>> > core@lists.openembedded.org> On Behalf Of Bruce Ashfield via
>> > lists.openembedded.org
>> > Sent: Friday, September 5, 2025 18:09
>> > To: richard.purdie@linuxfoundation.org
>> > Cc: openembedded-core@lists.openembedded.org
>> > Subject: [OE-core] [PATCH 1/5] poky: bump default kernel reference to
>> 6.16
>> >
>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >
>> > Bumping the reference kernel to 6.16. We keep the alt distro
>> > on 6.12 for better coverage.
>> >
>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > ---
>> >  meta-poky/conf/distro/poky-tiny.conf | 2 +-
>> >  meta-poky/conf/distro/poky.conf      | 4 ++--
>> >  2 files changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/meta-poky/conf/distro/poky-tiny.conf
>> b/meta-poky/conf/distro/poky-
>> > tiny.conf
>> > index 81153b3b36..84baef347c 100644
>> > --- a/meta-poky/conf/distro/poky-tiny.conf
>> > +++ b/meta-poky/conf/distro/poky-tiny.conf
>> > @@ -41,7 +41,7 @@ FULL_OPTIMIZATION =3D "-Os"
>> >  # Distro config is evaluated after the machine config, so we have to
>> explicitly
>> >  # set the kernel provider to override a machine config.
>> >  PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto-tiny"
>> > -PREFERRED_VERSION_linux-yocto-tiny ?=3D "6.12%"
>> > +PREFERRED_VERSION_linux-yocto-tiny ?=3D "6.16%"
>> >
>> >  # We can use packagegroup-core-boot, but in the future we may need a
>> new
>> > packagegroup-core-tiny
>> >  #POKY_DEFAULT_EXTRA_RDEPENDS +=3D "packagegroup-core-boot"
>> > diff --git a/meta-poky/conf/distro/poky.conf
>> b/meta-poky/conf/distro/poky.conf
>> > index b12df2be70..d86630b153 100644
>> > --- a/meta-poky/conf/distro/poky.conf
>> > +++ b/meta-poky/conf/distro/poky.conf
>> > @@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-
>> > module-af-packet"
>> >
>> >  DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}
>> > ${POKY_DEFAULT_DISTRO_FEATURES}"
>> >
>> > -PREFERRED_VERSION_linux-yocto ?=3D "6.12%"
>> > -PREFERRED_VERSION_linux-yocto-rt ?=3D "6.12%"
>> > +PREFERRED_VERSION_linux-yocto ?=3D "6.16%"
>> > +PREFERRED_VERSION_linux-yocto-rt ?=3D "6.16%"
>> >
>> >  SDK_NAME =3D "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-
>> > ${TUNE_PKGARCH}-${MACHINE}"
>> >  SDKPATHINSTALL =3D "/opt/${DISTRO}/${SDK_VERSION}"
>> > --
>> > 2.39.2
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223742):
> https://lists.openembedded.org/g/openembedded-core/message/223742
> Mute This Topic: https://lists.openembedded.org/mt/115084892/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003f62dc063f26e45e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 19, 2025 at 8:42=
=E2=80=AFAM Bruce Ashfield via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 19, 2025=
 at 8:35=E2=80=AFAM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.=
com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Hello Bruce,<br>
<br>
This upgrade broke build of external kernel modules for powerpc.<br>
Yocto test devtool.DevtoolTest.test_devtool_kernelmodule is failing.<br>
<br>
We have prepared a patch for upstream kernel.<br>
<a href=3D"https://lore.kernel.org/all/20250919121417.1601020-1-alexander.s=
verdlin@siemens.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.ker=
nel.org/all/20250919121417.1601020-1-alexander.sverdlin@siemens.com/</a><br=
>
But I guess it will take lot of time to get picked there, then backported t=
o 6.16, tagged and finally this tag picked by yocto.<br>
Is there a process to pick this patch already now to keep the pipeline gree=
n?<br></blockquote><div><br></div><div><div style=3D"font-size:small">Yes, =
if you submit=C2=A0it to the linux-yocto mailing list (you need to subscrib=
e), I can</div><div style=3D"font-size:small">merge it directly to linux-yo=
cto and send a SRCREV bump to the list.</div><div style=3D"font-size:small"=
><br></div><div style=3D"font-size:small">I&#39;ll carry the patch to any n=
ewer kernel that I do, until it merges upstream and</div><div style=3D"font=
-size:small">I&#39;ll automatically drop it at that point.</div></div></div=
></div></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">What is interesting is that we had a crtres=C2=A0patch=
 for powerpc for many years,</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">but &quot;recently&quot; (2024) dropped it:</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small"><a href=3D"https://git.yoctoproject.org/=
yocto-kernel-cache/commit/?h=3Dyocto-6.12&amp;id=3D3cf758061025b9284ddfb125=
9f79860666737302">https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=
=3Dyocto-6.12&amp;id=3D3cf758061025b9284ddfb1259f79860666737302</a></div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">And that dropped patch should =
have been part of several reference kernels since=C2=A0</div><div class=3D"=
gmail_default" style=3D"font-size:small">that commit. Just so I know, this =
is something that has been passing on all</div><div class=3D"gmail_default"=
 style=3D"font-size:small">reference kernels and just broke on 6.16 ?</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Something must have changed up=
stream to bring the breakage back! Your</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">fix is simpler than the old one we had, so that&#3=
9;s progress :)</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-siz=
e:small"><br></div><div style=3D"font-size:small">Bruce</div><br></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Bruce Ashfield via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Friday, September 5, 2025 18:09<br>
&gt; To: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core] [PATCH 1/5] poky: bump default kernel reference to =
6.16<br>
&gt; <br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Bumping the reference kernel to 6.16. We keep the alt distro<br>
&gt; on 6.12 for better coverage.<br>
&gt; <br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-poky/conf/distro/poky-tiny.conf | 2 +-<br>
&gt;=C2=A0 meta-poky/conf/distro/poky.conf=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/dis=
tro/poky-<br>
&gt; tiny.conf<br>
&gt; index 81153b3b36..84baef347c 100644<br>
&gt; --- a/meta-poky/conf/distro/poky-tiny.conf<br>
&gt; +++ b/meta-poky/conf/distro/poky-tiny.conf<br>
&gt; @@ -41,7 +41,7 @@ FULL_OPTIMIZATION =3D &quot;-Os&quot;<br>
&gt;=C2=A0 # Distro config is evaluated after the machine config, so we hav=
e to explicitly<br>
&gt;=C2=A0 # set the kernel provider to override a machine config.<br>
&gt;=C2=A0 PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux-yocto-tiny&quo=
t;<br>
&gt; -PREFERRED_VERSION_linux-yocto-tiny ?=3D &quot;6.12%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto-tiny ?=3D &quot;6.16%&quot;<br>
&gt; <br>
&gt;=C2=A0 # We can use packagegroup-core-boot, but in the future we may ne=
ed a new<br>
&gt; packagegroup-core-tiny<br>
&gt;=C2=A0 #POKY_DEFAULT_EXTRA_RDEPENDS +=3D &quot;packagegroup-core-boot&q=
uot;<br>
&gt; diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/p=
oky.conf<br>
&gt; index b12df2be70..d86630b153 100644<br>
&gt; --- a/meta-poky/conf/distro/poky.conf<br>
&gt; +++ b/meta-poky/conf/distro/poky.conf<br>
&gt; @@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS =3D &quot;kernel-<br>
&gt; module-af-packet&quot;<br>
&gt; <br>
&gt;=C2=A0 DISTRO_FEATURES ?=3D &quot;${DISTRO_FEATURES_DEFAULT}<br>
&gt; ${POKY_DEFAULT_DISTRO_FEATURES}&quot;<br>
&gt; <br>
&gt; -PREFERRED_VERSION_linux-yocto ?=3D &quot;6.12%&quot;<br>
&gt; -PREFERRED_VERSION_linux-yocto-rt ?=3D &quot;6.12%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto ?=3D &quot;6.16%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto-rt ?=3D &quot;6.16%&quot;<br>
&gt; <br>
&gt;=C2=A0 SDK_NAME =3D &quot;${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BAS=
ENAME}-<br>
&gt; ${TUNE_PKGARCH}-${MACHINE}&quot;<br>
&gt;=C2=A0 SDKPATHINSTALL =3D &quot;/opt/${DISTRO}/${SDK_VERSION}&quot;<br>
&gt; --<br>
&gt; 2.39.2<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#223742): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/223742" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/223742</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115084892/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115084892/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000003f62dc063f26e45e--

