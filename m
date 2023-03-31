Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE214C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 07:48:46 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.49346.1680248921654812425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 00:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bhXzxFgo;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id q16so27774904lfe.10
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 00:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680248920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JimkGEeO+UdQL/gHOL3/2XmVkVEJ6lMbHcJ9VZYvq5g=;
        b=bhXzxFgoVrHpToB3qeT2z7e3IAZc/9zXaMhFKwLkhcKezD9sM7PVKZiUOm4cIAE4v1
         Luox5gcI3fsCCjGFKPcESnQSk0On2b6mbwH0eYQni0Ui59j341D4Je96jRLmcdfiCI0A
         HcldGRKg47uhel09kAsHm9KRCPyl26OH6zpN8mBUmSbeE9Whr0GgX7bacPuF14ukuS0e
         wuKUloOfOA4tXtX29N4qhWvDyWTOlzk4GIsYr8klDfs6ZyHwg1DDqlUdmLnXP3V+Hm9r
         pFoX2QzwSsmOtRXsttUTMv++Qc+vTKijQCilvoMcPkQOdTquSw5E0nva6g7NNB502tBU
         ID1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JimkGEeO+UdQL/gHOL3/2XmVkVEJ6lMbHcJ9VZYvq5g=;
        b=Cca3U3p1jlJqHWHW9lCZ4wSSvWD8dJtMBfzPUBpeGu05gRbimONX60+C+dkZujvrLn
         SYHb4jlF0nvBjxeQ3QzjfDS2Qoq9QpddY9JvEl+0JvgAKna0Onu5GdeWrEW8Bx7o4u4p
         O+LGFOlSSXBfub42ift9Wzo79v5JHdtTczQWWw9TfuAxgZdmwOX9DLOGv8nig4icbKk0
         oLlFtCLCSGyouRIAkHd7pgJY8S2itb5JJbrzg0KJ6oY0qldxeVP9XLGRh7pcA5CdboEu
         ym1Dglr+1NkSrPAu1QCoohBt0IuHLYo0WBI/lqvy5quGcgPrJS7EnbesFXfMyu5LWpQM
         s2Sw==
X-Gm-Message-State: AAQBX9c7vJFhDXhDCJ9dW0WvNqkj0AUWIFNJajpY6ZFl4awkUGE1fRAG
	Xr5KPUh+R0ZeiBHhfx0IahKfOwqu/3beiYmHtPE=
X-Google-Smtp-Source: AKy350ZnacTYsVLNr+uAUVKa2LxG2vPODOwQSlB11Xx+0kJye8zB6D92j18HDFHmBZ1mNTdyjztHp4i8+2xdMsXEC5Y=
X-Received: by 2002:ac2:560e:0:b0:4e9:22ff:948e with SMTP id
 v14-20020ac2560e000000b004e922ff948emr7804700lfd.6.1680248919574; Fri, 31 Mar
 2023 00:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230328102349.57990-1-geoffrey.giry@smile.fr>
 <CAApg2=TD8PtdUxmLT7wOqRG-7O9zEaEKt0n47mRuRX_yvr1T=A@mail.gmail.com> <CAGwXbzZN_FXowS4QvFKxEW-a3_voTT3J6HZDjjg1P=ZEASFKkw@mail.gmail.com>
In-Reply-To: <CAGwXbzZN_FXowS4QvFKxEW-a3_voTT3J6HZDjjg1P=ZEASFKkw@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 31 Mar 2023 09:48:27 +0200
Message-ID: <CAApg2=TfJT1g3EhEhGRXYXqVdS-0o25c_060ijhcmo73L9WSyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fix cve-check false negative
To: Geoffrey GIRY <geoffrey.giry@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann CONGAL <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000fc4c9e05f82d6fcc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 07:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179402

--000000000000fc4c9e05f82d6fcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Geoffrey,
Would it be possible to run it over the world build of oe-core and possibly
meta-oe ?

My build farm will be available only next week and I would like to know if
there are unexpected changes.

Kind regards,
Marta

On Wed, Mar 29, 2023 at 3:31=E2=80=AFPM Geoffrey GIRY <geoffrey.giry@smile.=
fr>
wrote:

> Hello Marta,
>
> We only tested core-image-minimal and some recipes that use the update
> and release candidate formats (pX and -rcX)
>
> Geoffrey GIRY
> SMILE ECS - R&D Engineer
>
> Le mer. 29 mars 2023 =C3=A0 06:45, Marta Rybczynska <rybczynska@gmail.com=
> a
> =C3=A9crit :
> >
> > On Tue, Mar 28, 2023 at 12:24=E2=80=AFPM Geoffrey GIRY <geoffrey.giry@s=
mile.fr>
> wrote:
> >>
> >> Fixes [YOCTO #14127]
> >>
> >> NVD DB store version and update in the same value, separated by '_'.
> >> The proposed patch check if the version from NVD DB contains a "_",
> >> ie 9.2.0_p1 is convert to 9.2.0p1 before version comparison.
> >>
> >
> > Thank you for the patch. Which layers (and world builds) have you
> verified it with?
> > I'm asking because versioning is always a complicated problems with
> frequent exceptions to all "rules".
> >
> > Kind regards,
> > Marta
>

--000000000000fc4c9e05f82d6fcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Geoffrey,</div><div>Would it be possible to run=
 it over the world build of oe-core and possibly meta-oe ?</div><div><br></=
div><div>My build farm will be available only next week and I would like to=
 know if there are unexpected changes.</div><div><br></div><div>Kind regard=
s,</div><div>Marta<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 29, 2023 at 3:31=E2=80=AFPM Geoff=
rey GIRY &lt;<a href=3D"mailto:geoffrey.giry@smile.fr">geoffrey.giry@smile.=
fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hello Marta,<br>
<br>
We only tested core-image-minimal and some recipes that use the update<br>
and release candidate formats (pX and -rcX)<br>
<br>
Geoffrey GIRY<br>
SMILE ECS - R&amp;D Engineer<br>
<br>
Le mer. 29 mars 2023 =C3=A0 06:45, Marta Rybczynska &lt;<a href=3D"mailto:r=
ybczynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; a =C3=
=A9crit :<br>
&gt;<br>
&gt; On Tue, Mar 28, 2023 at 12:24=E2=80=AFPM Geoffrey GIRY &lt;<a href=3D"=
mailto:geoffrey.giry@smile.fr" target=3D"_blank">geoffrey.giry@smile.fr</a>=
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Fixes [YOCTO #14127]<br>
&gt;&gt;<br>
&gt;&gt; NVD DB store version and update in the same value, separated by &#=
39;_&#39;.<br>
&gt;&gt; The proposed patch check if the version from NVD DB contains a &qu=
ot;_&quot;,<br>
&gt;&gt; ie 9.2.0_p1 is convert to 9.2.0p1 before version comparison.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Thank you for the patch. Which layers (and world builds) have you veri=
fied it with?<br>
&gt; I&#39;m asking because versioning is always a complicated problems wit=
h frequent exceptions to all &quot;rules&quot;.<br>
&gt;<br>
&gt; Kind regards,<br>
&gt; Marta<br>
</blockquote></div>

--000000000000fc4c9e05f82d6fcc--

