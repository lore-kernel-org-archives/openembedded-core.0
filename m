Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A28410F6FD9
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 15:40:34 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15657.1775056191852388912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 08:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=giYiUQat;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.216.54, mailfrom: wminer@linuxfoundation.org)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so2692726a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 08:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775056191; cv=none;
        d=google.com; s=arc-20240605;
        b=gw6EhEAlNy17Cfb9U8y9XBluQQXElgvCvrfd7cZVxjk5wAhGH/spT8O09R3h5FSazm
         9pnxm5AdayuPI95YXbUXkjs6pWaNjfSn9H5aEB4lPqFTpYdYE+oIdsuVrLSQ4/G9NQSH
         MZV88WL9UXjr9SKFo5gYAh8/4tsawIWnbfLMfw0z4KYlBY3w/C0gq1vbwCkuslDQ8RCk
         tyCFrGfJQhVsHyDbtMOwJhMXWsW+JAqw4K5DQ1XLMDMGPV6mufD7G3o2PU2hk70Q1y8A
         OdQZ+fXGyG+1BiOdqaIOKzusCTawuTyrqErGaxKLErVlIxgsfjHM0S0HwxKL3N59I2Kg
         Vj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z8FsUOsK9f37hc1TEAM99BJG4BwP997fyrKMVSsRInM=;
        fh=MehbDxaoGoeuzZ9i2Vfaa/yhrh4f7qa4yBBIW/DfZQo=;
        b=gTMDdxo0BscO9OdXshR5xg7om3vGacBhCtIwfDYmGbWROwGVLm71x7X0TaKoCoEHKG
         DuDB20pVH1BGIY16AYKYdwav/XI+Lp0abl6Go8++H6N8JFb66ZuVNepsW86LcmyFDZp7
         02UJPimFjzoDtr+OErRu9DBsYyCD3N+dO/KCJfqPO0ZWwbM4J5GLqfIZSQe6WfMpP9FG
         P1EQlvodsScCGzZNcmNAQNZaBRcpeXs36v/c3OaoUzmDFaqO3rXqJSaDJZAbiY4wVT5Y
         AtYKVjchLoyl50cLPHNELjZe0JnccGgFfxHvnV/z1Xsj6Ia28JG3xIiY48RCn/QLqM5v
         IJZQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775056191; x=1775660991; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z8FsUOsK9f37hc1TEAM99BJG4BwP997fyrKMVSsRInM=;
        b=giYiUQatUFfbblLTsyosWNbQq+16NIgKzXlxRaideRL5fiGV5NdTkQtPlZeL72EZMt
         aW03pfzNGd6rbWQ8mxJuFFse48OIyN3UQ5CHv4H7pL95GrYdljVuRKP4v3CfNz3qvDEa
         nbeSp4gcMBb3rtaFQAwVJODGaHvmz0eCgIK+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775056191; x=1775660991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8FsUOsK9f37hc1TEAM99BJG4BwP997fyrKMVSsRInM=;
        b=JEap8DZD1qaGdJUC3BJYpkVFNFCLj1uijOKlkJb1GvZ1P7VZGw2s9ndNrufwGjYcDU
         za1yW/zENUeWSY/gmevm9EZTT+opelouQQ/xg7ZtDD7fqinFQgNTBqDMhQ42LoTsi3Qf
         T9iokG63h7Imqz0VgszlwAjw6xd6NhErWqRVBmo4UkbmUnDDSLV2+kMjY+ZwxSKWmKTF
         0dq3dFbzehhuGO/bLm+sU2RItEUSYO5nj0GzddYzX+Wo+mjJTdsLmmPOm2NZGJxbHNJ8
         w/qnuVL5rMq9z5cvuPUp6dzVfJIRGy/HnCODYcRQU6dnLmPwvJyxAZxyYTN6lVYS/q3E
         NVrA==
X-Forwarded-Encrypted: i=1; AJvYcCUm7hV45746YApHopX9qoIElKyuY3IgKEMpdmjL0eEQcBk3Y3+5mLFeOiJi78hfuAwrRejuKUjp9LzWC48PMoKMuA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YztJVt0f6gtqtiSOEc6y5izSSiMs1TOXa+zAwFm7DRxEhrtiDvG
	gx8azaMtWvrrkdVMp8Jf/qQusL1P7S4bUHWjhglkRjbSV+dNTosHNoWfrQFb/XRliVFLjqr+2o5
	uyVUhqpzzEEq5wZGWzxQVcBT9f9fZ97nUhhJoWkiA3w==
X-Gm-Gg: ATEYQzzzMT4TsYX8gv62nbMa0SWMUJlTkyH2Pp3T2egT4rYU4R7dGeEwr0/ryHlREcW
	NNYeHshbJjRwLoNnb4jBDdrj5eiLEIimklDecwIIfJnZfpHTbH98J7CUY8FkTNdiNL+reipT4sf
	8H9VTUqiI6Yqp+tY1c4Pac7SpFsug5OfVMwc3Lx4jUgska7kS1VQtwaTo2a6TOo6qqSRI73et9D
	h+gJ65D+afjhB9dOHDem4gcMQkft5YxRo2/swxoqjwX4i61/51GcX2hvbbejcg4h4QWx9Wn0JoZ
	1ERAfryQXofsqNFJo9XNBblp3twwdvQQ2QQ/a7nm71DdFujbi17u+6oDDlxclqAtiips0nZuZUu
	sREpUei/u8Q==
X-Received: by 2002:a17:90b:2ec4:b0:35d:a8d9:3a8 with SMTP id
 98e67ed59e1d1-35dc6f7ad0bmr3931989a91.16.1775056191165; Wed, 01 Apr 2026
 08:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <b2b22dae656f5f415374964c3ae94e2ce0bb3434.camel@pbarker.dev>
In-Reply-To: <b2b22dae656f5f415374964c3ae94e2ce0bb3434.camel@pbarker.dev>
From: "Walt Miner" <wminer@linuxfoundation.org>
Date: Wed, 1 Apr 2026 11:09:34 -0400
X-Gm-Features: AQROBzDyosgzkAWMmcm5--1Kwba8hwLZRxxdqw44bCAo7TWXGdVjpZ4wMNPjWu8
Message-ID: <CAC_dYdqKcv7yijCGqZ2QynxtKg4G24yskftM3eHY_BGotSG76w@mail.gmail.com>
Subject: Re: [yocto-status] Yocto Project release dates for May 2026 to April 2027
To: yocto-status@lists.yoctoproject.org
Cc: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Stephen Jolley <sjolley.yp.pm@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bb2769064e677927"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 15:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234445

--000000000000bb2769064e677927
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,
This is great.  Having 12 months of clarity greatly helps in planning the
AGL schedule since we usually put our schedules together 12 months in
advance. I have traditionally used guessed dates in planning and kept track
of which are guesses and which are provided by the project.

I think a quarterly review might be beneficial so you can adjust any dates
accordingly if things have slipped.  Having the complete picture of  the
upcoming year by early November would be a big help in my planning.

Regards,
Walt



Walt Miner
AGL Community Manager
The Linux Foundation

Visit us at:
www.automotivegradelinux.org
lists.automotivelinux.org
www.linuxfoundation.org




On Wed, Apr 1, 2026 at 10:24=E2=80=AFAM Paul Barker via lists.yoctoproject.=
org
<paul=3Dpbarker.dev@lists.yoctoproject.org> wrote:

> Hi all,
>
> I'm happy to propose the following Yocto Project release dates, covering
> the period of May 2026 to April 2027.
>
> In order to make planning easier for downstream users, we're setting
> these dates for a full year instead of just 6 months. The increased
> horizon, and the focus on getting ready to build 6.0 M3 does mean that
> there's been a little delay getting the dates out, but this should
> hopefully put people in a good place to plan now.
>
> We will review these again in 6 months time to see if any adjustments
> are needed to the 2027 dates. I'd also like to get dates in the calendar
> up to Nov 2027 some time in October this year.
>
>
> Notes
> =3D=3D=3D=3D=3D
>
> - All dates are **week commencing**, the exact day the release is
>   published depends on TSC availability to approve releases and time
>   taken to upload release artifacts.
>
> - Releases will be built 10-14 days before the target release date to
>   give time for QA and review.
>
> - We aim for 6-7 weeks between releases in each series, occasionally
>   there will be an 8 week gap due to things like Christmas/New Year
>   vacations.
>
> - We aim for 4 weeks between .0 and .1 releases to allow us to get any
>   necessary fixes out for the new series.
>
>
> Feedback
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> Please review these and let me know if you have any feedback before the
> next weekly tech call on Tues 7th April.
>
> I'd especially like to know:
>   **Is 12 months of dates beneficial to you, vs just having 6 months?**
>
> It does take more coordination to plan with a longer horizon.
>
>
> 5.0 "scarthgap" series
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 5.0.18  : w/c 2026-05-25
> 5.0.19  : w/c 2026-07-13
> 5.0.20  : w/c 2026-08-31
> 5.0.21  : w/c 2026-10-19
> 5.0.22  : w/c 2026-12-14
> 5.0.23  : w/c 2027-01-25
> 5.0.24  : w/c 2027-03-08
> 5.0.25  : w/c 2027-04-19
>
>
> 6.0 "wrynose" series
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 6.0.0   : w/c 2026-05-04
> 6.0.1   : w/c 2026-06-01
> 6.0.2   : w/c 2026-07-06
> 6.0.3   : w/c 2026-08-24
> 6.0.4   : w/c 2026-10-12
> 6.0.5   : w/c 2026-12-07
> 6.0.6   : w/c 2027-01-18
> 6.0.7   : w/c 2027-03-01
> 6.0.8   : w/c 2027-04-12
>
>
> 6.1 series
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 6.1 M1  : w/c 2026-06-22
> 6.1 M2  : w/c 2026-08-03
> 6.1 M3  : w/c 2026-09-14
> 6.1.0   : w/c 2026-11-02
> 6.1.1   : w/c 2026-11-30
> 6.1.2   : w/c 2027-01-04
> 6.1.3   : w/c 2027-02-22
> 6.1.4   : w/c 2027-04-05
>
>
> 6.2 series
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 6.2 M1  : w/c 2026-12-21
> 6.2 M2  : w/c 2027-02-01
> 6.2 M3  : w/c 2027-03-15
> 6.2.0   : w/c 2027-05-03
>
>
> Best regards,
>
> --
> Paul Barker
>
>
>
>=20
>
>
>

--000000000000bb2769064e677927
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Paul,=C2=A0</div><div>This is great.=C2=A0 Having =
12 months of clarity greatly helps in planning the AGL schedule since we us=
ually put our schedules together 12 months in advance. I have traditionally=
 used guessed dates in planning and kept track of which are guesses and whi=
ch are provided by the project. =C2=A0</div><div><br></div><div>I think a q=
uarterly=C2=A0review might be beneficial so you can adjust any dates accord=
ingly if things have slipped.=C2=A0 Having the complete picture of =C2=A0th=
e upcoming year by early November would be a big help in my planning.</div>=
<div><br></div><div>Regards,</div><div>Walt</div><div><br></div><div><br></=
div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"color:rgb(136,136,136)">=
Walt Miner</span></div><div dir=3D"ltr"><div style=3D"color:rgb(136,136,136=
)">AGL Community Manager</div><div style=3D"color:rgb(136,136,136)">The Lin=
ux Foundation<br></div><div style=3D"color:rgb(136,136,136)"><br></div><div=
 style=3D"color:rgb(136,136,136)">Visit us at:</div><div style=3D"color:rgb=
(136,136,136)"><a href=3D"http://www.automotivegradelinux.org" target=3D"_b=
lank">www.automotivegradelinux.org</a></div><div style=3D"color:rgb(136,136=
,136)"><a href=3D"http://lists.automotivelinux.org" target=3D"_blank">lists=
.automotivelinux.org</a></div><div style=3D"color:rgb(136,136,136)"><a href=
=3D"http://www.linuxfoundation.org" target=3D"_blank">www.linuxfoundation.o=
rg</a></div><div style=3D"color:rgb(136,136,136)"><br></div><div style=3D"c=
olor:rgb(136,136,136)"><br></div></div></div></div></div></div></div></div>=
</div></div></div></div></div><br></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 1, 2026=
 at 10:24=E2=80=AFAM Paul Barker via <a href=3D"http://lists.yoctoproject.o=
rg">lists.yoctoproject.org</a> &lt;paul=3D<a href=3D"mailto:pbarker.dev@lis=
ts.yoctoproject.org">pbarker.dev@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,2=
04);padding-left:1ex">Hi all,<br>
<br>
I&#39;m happy to propose the following Yocto Project release dates, coverin=
g<br>
the period of May 2026 to April 2027.<br>
<br>
In order to make planning easier for downstream users, we&#39;re setting<br=
>
these dates for a full year instead of just 6 months. The increased<br>
horizon, and the focus on getting ready to build 6.0 M3 does mean that<br>
there&#39;s been a little delay getting the dates out, but this should<br>
hopefully put people in a good place to plan now.<br>
<br>
We will review these again in 6 months time to see if any adjustments<br>
are needed to the 2027 dates. I&#39;d also like to get dates in the calenda=
r<br>
up to Nov 2027 some time in October this year.<br>
<br>
<br>
Notes<br>
=3D=3D=3D=3D=3D<br>
<br>
- All dates are **week commencing**, the exact day the release is<br>
=C2=A0 published depends on TSC availability to approve releases and time<b=
r>
=C2=A0 taken to upload release artifacts.<br>
<br>
- Releases will be built 10-14 days before the target release date to<br>
=C2=A0 give time for QA and review.<br>
<br>
- We aim for 6-7 weeks between releases in each series, occasionally<br>
=C2=A0 there will be an 8 week gap due to things like Christmas/New Year<br=
>
=C2=A0 vacations.<br>
<br>
- We aim for 4 weeks between .0 and .1 releases to allow us to get any<br>
=C2=A0 necessary fixes out for the new series.<br>
<br>
<br>
Feedback<br>
=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Please review these and let me know if you have any feedback before the<br>
next weekly tech call on Tues 7th April.<br>
<br>
I&#39;d especially like to know:<br>
=C2=A0 **Is 12 months of dates beneficial to you, vs just having 6 months?*=
*<br>
<br>
It does take more coordination to plan with a longer horizon.<br>
<br>
<br>
5.0 &quot;scarthgap&quot; series<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
5.0.18=C2=A0 : w/c 2026-05-25<br>
5.0.19=C2=A0 : w/c 2026-07-13<br>
5.0.20=C2=A0 : w/c 2026-08-31<br>
5.0.21=C2=A0 : w/c 2026-10-19<br>
5.0.22=C2=A0 : w/c 2026-12-14<br>
5.0.23=C2=A0 : w/c 2027-01-25<br>
5.0.24=C2=A0 : w/c 2027-03-08<br>
5.0.25=C2=A0 : w/c 2027-04-19<br>
<br>
<br>
6.0 &quot;wrynose&quot; series<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
6.0.0=C2=A0 =C2=A0: w/c 2026-05-04<br>
6.0.1=C2=A0 =C2=A0: w/c 2026-06-01<br>
6.0.2=C2=A0 =C2=A0: w/c 2026-07-06<br>
6.0.3=C2=A0 =C2=A0: w/c 2026-08-24<br>
6.0.4=C2=A0 =C2=A0: w/c 2026-10-12<br>
6.0.5=C2=A0 =C2=A0: w/c 2026-12-07<br>
6.0.6=C2=A0 =C2=A0: w/c 2027-01-18<br>
6.0.7=C2=A0 =C2=A0: w/c 2027-03-01<br>
6.0.8=C2=A0 =C2=A0: w/c 2027-04-12<br>
<br>
<br>
6.1 series<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
6.1 M1=C2=A0 : w/c 2026-06-22<br>
6.1 M2=C2=A0 : w/c 2026-08-03<br>
6.1 M3=C2=A0 : w/c 2026-09-14<br>
6.1.0=C2=A0 =C2=A0: w/c 2026-11-02<br>
6.1.1=C2=A0 =C2=A0: w/c 2026-11-30<br>
6.1.2=C2=A0 =C2=A0: w/c 2027-01-04<br>
6.1.3=C2=A0 =C2=A0: w/c 2027-02-22<br>
6.1.4=C2=A0 =C2=A0: w/c 2027-04-05<br>
<br>
<br>
6.2 series<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
6.2 M1=C2=A0 : w/c 2026-12-21<br>
6.2 M2=C2=A0 : w/c 2027-02-01<br>
6.2 M3=C2=A0 : w/c 2027-03-15<br>
6.2.0=C2=A0 =C2=A0: w/c 2027-05-03<br>
<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000bb2769064e677927--

