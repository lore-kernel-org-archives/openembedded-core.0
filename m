Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1F5C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 08:24:35 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.7413.1651134266784073298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 01:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fu4Yj6V8;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id m23so5698515ljb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hV9xGzqKBa+t7QdEf5xiUUppIRTbhcQZCbNXKpm+DP8=;
        b=fu4Yj6V8GkCMRq0MWY1Gd+qixASYuVQS5b+06qQETMFaTQSeeTDrS0KDrbXyCWwZCg
         sQxTr8PmCsYuq57SzXqHwViRrXwUPydxlJu1Hz7Rk6Iq4dhV1Y6ykwPtPGH1fpwEIQCG
         KlZlPB2YE+d5x0A9/MQ1/jk96HWMbq5IW+82wd9mB+ZBdX+yJ91pj1H3h27/sNWeq57+
         9boZdqu7+jk5gr8DwrPcLKLNKcrYXVsIaCGw2jH8s5LDjFPNBQxc5yh6jia0yhVBCG2R
         9Ny9veNZZtB5/XCcYvCLpCKdiG1GTBzfkWk9XRRQX7XhJIdmHIEd9KfyFulN0/4kV6X2
         uJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hV9xGzqKBa+t7QdEf5xiUUppIRTbhcQZCbNXKpm+DP8=;
        b=VVwGy8D8WP4CqBl9J/sTNhtrUa8yAebab0SxD92eOSZhP4lEVh0LI9ITxiG4Foqw/a
         uQWpoxrOttlxUxsg0d89K0o+QLV+PbUUV7DZXjMt4B1+jM2kmGKmQMVZmKHXMNt3/A/c
         M65iZmhVPJuMhgauGHS9xNxjkBX7YQTaNAP4XKX6lYYXlBOFY1rQqCfWFKI7ceL29jTT
         0Oc9pOn+yb9BOdGDYmSZCcJi5zVoViohCxI6JKllYYp6i1N3wrSuOaS3UiSI4KZ929PL
         XhLTPzShiJWebXyNhhfKYwYjVC2bQg7FUa0fG7tbq6vkigcMECMMIM3Z8mKL6FjsEHF4
         ivIQ==
X-Gm-Message-State: AOAM530GTXKHEcKpfao22EzI72pLG90Ap7uvakWZtRdjb2MN87hiQYNj
	gjtL3sqUvq+1rEt0X+2TFD77uxYW+hPmmoV/cC4=
X-Google-Smtp-Source: 
 ABdhPJzVnk3MrV87Ncyy3lHuOtwtGi1bQc8VW+rtQwiXsVlzra5MEEDdXMWOUE6FOWh5KqeYgk9S5l4/sppHrD1drBA=
X-Received: by 2002:a05:651c:1994:b0:24d:d4b9:516c with SMTP id
 bx20-20020a05651c199400b0024dd4b9516cmr20571531ljb.278.1651134264578; Thu, 28
 Apr 2022 01:24:24 -0700 (PDT)
MIME-Version: 1.0
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6812ddf4-d065-4e4e-ad42-c48d1bca155d@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65eda1d8-3d07-4fbe-a1d1-669c533cd0a5@emailsignatures365.codetwo.com>
 <ef4b958c-8310-4b40-f671-779558228550@topic.nl>
 <749f33fad354821ee5e1b9f061aae211c252b934.camel@linuxfoundation.org>
 <70d61f68-8a56-86fa-5772-598628219797@topic.nl>
 <b14c0ed1-ebf3-3b25-54c7-dc6b9efdb4ce@denx.de>
 <24e9cfaa101ed3c4f1eb227cfee43a14ee475ecf.camel@linuxfoundation.org>
 <CANPvuRkZ20058vkTg8EQsg7C0fbVczdguj+0AY9Q-eBGq59P=g@mail.gmail.com>
 <fd4d3e333e61fcaa9c49c6abf6dc02053fbadf3d.camel@linuxfoundation.org>
In-Reply-To: 
 <fd4d3e333e61fcaa9c49c6abf6dc02053fbadf3d.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 28 Apr 2022 09:24:13 +0100
Message-ID: 
 <CANPvuR=YivA+Dr323eiFE6Dmsp8Rk3c+yrKtVjOGBs3o72abWQ@mail.gmail.com>
Subject: Re: [OE-core] Git and pseudo
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Stefano Babic <sbabic@denx.de>, Mike Looijmans <mike.looijmans@topic.nl>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000051179f05ddb2a74c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 08:24:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164937

--00000000000051179f05ddb2a74c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quarta,
27/04/2022 =C3=A0(s) 11:56:

> On Wed, 2022-04-27 at 11:37 +0100, Jose Quaresma wrote:
> > Hi,
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> quarta,
> > 27/04/2022 =C3=A0(s) 11:22:
> > > On Wed, 2022-04-27 at 08:47 +0200, Stefano Babic wrote:
> > >
> > >
> > >
> > >
> https://git.yoctoproject.org/poky/commit/?id=3D5bca57859b280f73b23247aac7=
dec6b05f48fde8
> > >
> >
> >
> > The change that introduces the intercept script [1] Is
> partially reversed with
> > [2]
> > With this approach using the environment we don't need the intercept
> script
> > anymore or I am missing something?
> >
> > [1]
> >
> https://git.yoctoproject.org/poky/commit/?id=3D21559199516a31c7635c5f2d87=
4eaa4a92fff0e5
> > [2]
> >
> https://git.yoctoproject.org/poky/commit/?id=3D5546a868b52400ed1487b2ac71=
49f3a9e7293bd2
>
> The devshell experience is better with the intercept as it means things
> like the
> user's HOMEDIR is used for their gitconfig for things like user and email
> when
> writing commits. I've therefore chosen to leave that in master. We may or
> may
> not backport those pieces, I don't have any strong preference.
>

I agree that the intercept will improve the devshell user experience
and it was this part that was escaping me.

Thanks

Jose


> The other commit from Ross solves the major issue we care about build wid=
e
> outside devshell.
>
> Cheers,
>
> Richard
>
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000051179f05ddb2a74c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; escreveu =
no dia quarta, 27/04/2022 =C3=A0(s) 11:56:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Wed, 2022-04-27 at 11:37 +0100, Jose Quaresma=
 wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu no=
 dia quarta,<br>
&gt; 27/04/2022 =C3=A0(s) 11:22:<br>
&gt; &gt; On Wed, 2022-04-27 at 08:47 +0200, Stefano Babic wrote:<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D5bca578=
59b280f73b23247aac7dec6b05f48fde8" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.yoctoproject.org/poky/commit/?id=3D5bca57859b280f73b23247aac7dec6b=
05f48fde8</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; The change that introduces the intercept script [1] Is partially=C2=A0=
reversed with<br>
&gt; [2]<br>
&gt; With this approach=C2=A0using the environment we don&#39;t need the in=
tercept script<br>
&gt; anymore or I am missing something?<br>
&gt; <br>
&gt; [1]<br>
&gt; <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D21559199516a=
31c7635c5f2d874eaa4a92fff0e5" rel=3D"noreferrer" target=3D"_blank">https://=
git.yoctoproject.org/poky/commit/?id=3D21559199516a31c7635c5f2d874eaa4a92ff=
f0e5</a><br>
&gt; [2]<br>
&gt; <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D5546a868b524=
00ed1487b2ac7149f3a9e7293bd2" rel=3D"noreferrer" target=3D"_blank">https://=
git.yoctoproject.org/poky/commit/?id=3D5546a868b52400ed1487b2ac7149f3a9e729=
3bd2</a><br>
<br>
The devshell experience is better with the intercept as it means things lik=
e the<br>
user&#39;s HOMEDIR is used for their gitconfig for things like user and ema=
il when<br>
writing commits. I&#39;ve therefore chosen to leave that in master. We may =
or may<br>
not backport those pieces, I don&#39;t have any strong preference.<br></blo=
ckquote><div><br></div><div>I agree that the intercept will improve the dev=
shell user experience</div><div>and it was this part that was escaping me.<=
br></div><div><br></div><div>Thanks</div><div><br></div><div>Jose</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The other commit from Ross solves the major issue we care about build wide<=
br>
outside devshell.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000051179f05ddb2a74c--

