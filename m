Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233B3C7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 16:17:10 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.13768.1686241022007818512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 09:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AMOBtxjt;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-77a62a84855so28292339f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686241021; x=1688833021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zJTCDReTpPQn5rfFzoNtclpNY8fqSMXN7GYenkFpqKk=;
        b=AMOBtxjt4rYs15/FgvCP3M0GV1lu97+JwxUCJfCrwPNAS7ILBc0mWgQMHfb5cJX31T
         8QQhC9X+su/d1WhWueY4IasoYbeIiLsyIuy6YWBJYa7r77G+1TWbKOJe+GsbLTZduZ7h
         kO4zCVwR+8ut8r0NkCIiaQ4QKzLDGKpc6qtb0N6RH559zaUxmFwHo5PY2JesDTZMksm6
         St98imCJ3HPvcDizWQIASL0xcnOR8t0JLRz898o442GS3D/FxGxeaoa684rU5It63s83
         sE11CbR1YGrAcF/7x6FBlL5/u8J1HJBJHVow6n0ncrBuDO8PucWgj3d5a1V4Rt2h8tz4
         MwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686241021; x=1688833021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJTCDReTpPQn5rfFzoNtclpNY8fqSMXN7GYenkFpqKk=;
        b=f529N45qhywgn9A3EWSq7ILNudgTwvHoRQBzw8Wpcbz53XKt4FlhfI3gigCYDIORpb
         0HrE3ZfylWCKYmScCx8oxq/Q5zxQSEUcuEErqW+7/PvTMx7BrPQqI640GDTNZPgWcj3T
         3Bl5CUTAxp+lYHylAr3d5RW+en/GT3r7XzqmQkZXw0Tw0FC+0+Z8b+SdviFlAirTQzvX
         kDmLUjUnuuwvlrkXeYf1eR8N4d/bj8UHKaR+hSG281rLMZ9/liwDcc4X9/19ZUoSnKOI
         uVT9myjn/zg5ou2afnleFw9q19CJDKYduqpxHD0ysth1gwQD0qZfSA1jLdubI8hhkFA5
         gRVw==
X-Gm-Message-State: AC+VfDxU8lZM4j6nYSssVTl642OGDRkdcFMSrCunT8hlco6luYoyKmEy
	3ZJUtXiTTGO3QUgZmu3AbJz9qoMg7HxcoV1p0bM=
X-Google-Smtp-Source: ACHHUZ6wbdl7h6SLAYPUt1iVnDrVtTXZ8dMbITAcesY1dgTwcIh11UCxx97WCPwaWsJm340Muagk0OoNTjo0huYRgIg=
X-Received: by 2002:a5e:c80d:0:b0:774:91f6:9530 with SMTP id
 y13-20020a5ec80d000000b0077491f69530mr7446428iol.9.1686241021208; Thu, 08 Jun
 2023 09:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230607205347759a5df5@mail.local> <20230608054525.3293334-1-mingli.yu@eng.windriver.com>
 <CADkTA4Mj2WdncdduX+P6fT8HU0KjkS6+vjTePbhPc0FXL2d_CA@mail.gmail.com>
 <7326285b062d6b494d9933270bb5811b83e81e82.camel@linuxfoundation.org>
 <CADkTA4O5=PNOmmKtJPE8YYJfiynMQXA1hyjaX=wuW2ydw6evbA@mail.gmail.com> <ab9c352c2fe8518b6886fe1eaaf926512a314bdc.camel@linuxfoundation.org>
In-Reply-To: <ab9c352c2fe8518b6886fe1eaaf926512a314bdc.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Jun 2023 12:16:49 -0400
Message-ID: <CADkTA4OAmMD8h8=nNMEdtjeYwCfoGOtu4S4uWDMj+6Etm4SGUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] qemu: Split the qemu package
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000132f7505fda09566"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 16:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182514

--000000000000132f7505fda09566
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 8, 2023 at 11:44=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2023-06-08 at 11:03 -0400, Bruce Ashfield wrote:
> >
> >
> > On Thu, Jun 8, 2023 at 9:55=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2023-06-08 at 09:33 -0400, Bruce Ashfield wrote:
> > > > At this point, you can probably see why I ended up using the
> > > > explicit
> > > > variables and overrides versus python when doing the
> > > > meta-virtualization splits. :)
> > > >
> > > > I have a few more comments that I made in v1, that I haven't seen
> > > > directly handled or replied to.
> > > >
> > > > My only remaining concern (and it may just be my own concern), is
> > > > that
> > > > there's no way to change this packaging split. Either you take
> > > > the
> > > > programatic split, or you take the -all packages.
> > > >
> > > > Other packages (glibc, kernel-modules) have a variable that
> > > > controls
> > > > whether the split happens or not, I'd like to see something
> > > > similar
> > > > here .. but I do realize that it makes test complexity more, and
> > > > that
> > > > Richard normally doesn't like conditionals like that.
> > >
> > > I only "like" conditionals if it is a code path that will be well
> > > travelled, otherwise we tend to find one of the paths is broken. I
> > > don't think we need to make this conditional.
> > >
> > > > Alternatively, did we rule out using PACKAGESPLITFUNCS to add the
> > > > splitting routine ? With that, we could remove the processing in
> > > > places we don't want it, in particular for the native/sdk builds,
> > > > as I
> > > > found that we really don't want the splitting of qemu in those
> > > > scenarios.
> > >
> >
> >
> > Can you think of a problem with the PACKAGESPLITFUNCS method for this
> > packaging split ?
> >
> > At least that way I could inhibit it from my other layers, versus
> > with this prepend, I don't see any options to have my own package
> > splitting.
>
> We can do this in a PACKAGESPLITFUNCS function. I guess I'm just
> nervous of having too many different ways of packaging qemu as I was
> hoping we could get something which would work for all users.
>
>
There are some very specific use cases for virtualization, where some
separation models use different architectures for devices, even
architectures that don't match the target (host in the running system).

There are also some combinations of usermode and system, as well as support
and firmware, etc.

I can't see a clean/easy way to make the split being proposed here serve
all those existing (and admittedly odd) case. Having a way to override it
(even temporarily) is a better transition path for meta-virt.

Bruce



> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000132f7505fda09566
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 8, 2023 at 11:44=E2=80=AFAM Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Thu, 2023-06-08 at 11:03 -0400, Bruce Ashfield wrot=
e:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Jun 8, 2023 at 9:55=E2=80=AFAM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Thu, 2023-06-08 at 09:33 -0400, Bruce Ashfield wrote:<br>
&gt; &gt; &gt; At this point, you can probably see why I ended up using the=
<br>
&gt; &gt; &gt; explicit<br>
&gt; &gt; &gt; variables and overrides versus python when doing the<br>
&gt; &gt; &gt; meta-virtualization splits. :)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I have a few more comments that I made in v1, that I haven&#=
39;t seen<br>
&gt; &gt; &gt; directly handled or replied to.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; My only remaining concern (and it may just be my own concern=
), is<br>
&gt; &gt; &gt; that<br>
&gt; &gt; &gt; there&#39;s no way to change this packaging split. Either yo=
u take<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; programatic split, or you take the -all packages.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Other packages (glibc, kernel-modules) have a variable that<=
br>
&gt; &gt; &gt; controls<br>
&gt; &gt; &gt; whether the split happens or not, I&#39;d like to see someth=
ing<br>
&gt; &gt; &gt; similar<br>
&gt; &gt; &gt; here .. but I do realize that it makes test complexity more,=
 and<br>
&gt; &gt; &gt; that<br>
&gt; &gt; &gt; Richard normally doesn&#39;t like conditionals like that.<br=
>
&gt; &gt; <br>
&gt; &gt; I only &quot;like&quot; conditionals if it is a code path that wi=
ll be well<br>
&gt; &gt; travelled, otherwise we tend to find one of the paths is broken. =
I<br>
&gt; &gt; don&#39;t think we need to make this conditional.<br>
&gt; &gt; <br>
&gt; &gt; &gt; Alternatively, did we rule out using PACKAGESPLITFUNCS to ad=
d the<br>
&gt; &gt; &gt; splitting routine ? With that, we could remove the processin=
g in<br>
&gt; &gt; &gt; places we don&#39;t want it, in particular for the native/sd=
k builds,<br>
&gt; &gt; &gt; as I<br>
&gt; &gt; &gt; found that we really don&#39;t want the splitting of qemu in=
 those<br>
&gt; &gt; &gt; scenarios.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Can you think of a problem with the PACKAGESPLITFUNCS=C2=A0method for =
this<br>
&gt; packaging split ?<br>
&gt; <br>
&gt; At least that way I could inhibit it from my other layers, versus<br>
&gt; with this prepend, I don&#39;t see any options to have my own package<=
br>
&gt; splitting.<br>
<br>
We can do this in a PACKAGESPLITFUNCS function. I guess I&#39;m just<br>
nervous of having too many different ways of packaging qemu as I was<br>
hoping we could get something which would work for all users.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">There are some very specific use cases for virtualization,=
 where some separation models use different architectures for devices, even=
 architectures that don&#39;t match the target (host in the running system)=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">There are also some com=
binations of usermode and system, as well as support and firmware, etc.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I can&#39;t see a clean/easy=
 way to make the split being proposed here serve all those existing (and ad=
mittedly odd) case. Having a way to override it (even temporarily) is a bet=
ter transition path for meta-virt.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000132f7505fda09566--

