Return-Path: <sathishkumar.d.cbe@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4099C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 08:55:21 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.4136.1746608118762994520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 01:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AN8PJ2mP;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: sathishkumar.d.cbe@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70900a80907so29724557b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746608118; x=1747212918; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2qxlH6EAPl5/ZE0COQoUSGr9232A1BFAl01lHzi3ntE=;
        b=AN8PJ2mPC9gb+33M9QB+v/yF6lOYWP+kASsFjnHO2fdCCjiMpVf869FPp7NSIapkxf
         xvye6b6M5sajNZ19bTBhVPgUq6F54MEDDNTegNN23NyuX01wjxgHnBdij/Ld7PfnHtHz
         4P27uYZJEQBdTb5zs6byk02r9g5ngU/6Lyhwgzmd7Yqkbsu0uhtW3aOZoGLK8ObD+Woj
         af0T7zjIn3b5dKadJjv0PYFf8gA3+PH0GMmB/BfKZqFYHY30Vp3WJ2pnaQUN+fsNr6Eo
         yjhJBHLzpwgzMPkmybzj/ahGUOLCOjsLWKkps78XGPB5TgKqY6TNHAG9DKi0PUbOFfwC
         Fy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746608118; x=1747212918;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qxlH6EAPl5/ZE0COQoUSGr9232A1BFAl01lHzi3ntE=;
        b=D07IqA0jV6UHcmLV8xFLcaYUVnycb+zRjJADTg7JWc9t7oEEBbKAASJXk8nvDRrz0e
         SKm3Naup0iDnGnp+GXYOVuYPdWwCqCmvei7a/Im2xUe6bPKe0wS0SHV31s9a3MkrM68Q
         Wl0fmSdaX6lLJgnlonYhhE+NvwEAdLXLJtvdAdaD/8HVI+dOg9pQfnQJityJwX3mlB1u
         pgHreca0a8v2rnWkTe83mCpj93xHpoRrEOO8VkivkHz37vcXVXM3jvxPo3oM7tn0/OIL
         CTCX19Re81zutc9axzCJCF8Hk50FPTybGYQRvTQStIWh5UyK450LCGPnrkw2SEucawWH
         J0kQ==
X-Gm-Message-State: AOJu0YxwLaFZK5rEQJNNOa2Bc4w4RYnwhCxRySxUxRUrr9OY7e3c/+rN
	ydVZcZ65CxIW98LmurtWZ6VWCFkHC0Uxps502dX3UZ+lo261csx6u7c4xfa1S1c/3LEfg/Lavav
	j2SZ0WPfPKKyMp7a28iEHcqSQa2kMUlUk
X-Gm-Gg: ASbGncum7dGw5l2OY58zI/AivggNVHfb4AHM7/Wqm8U1kDFKXzuy63aNaOLojbMLf9l
	AvcuCpT9uG1M1VY+rXuYAJflTHCLiZfUEZeTNLysFRP5QYpMA7Fwb6eQq8Wj9IcZW888NzFMe+Z
	cojlTx4ogEYnzTXIRUmDb5lA==
X-Google-Smtp-Source: AGHT+IHiHZ0pbaZRch1JQYoGCG076/RUi5BiufXtxejjmi4qUqFiXE9M9tA7fTie7FLy1qNui3MLszw5FUdERm9RJTA=
X-Received: by 2002:a05:690c:48c6:b0:6ef:8dd0:fff9 with SMTP id
 00721157ae682-70a1d9dcc80mr30332067b3.8.1746608117651; Wed, 07 May 2025
 01:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org> <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org> <aBsacm6DAvrHxHpO@nuoska>
In-Reply-To: <aBsacm6DAvrHxHpO@nuoska>
From: Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>
Date: Wed, 7 May 2025 14:25:06 +0530
X-Gm-Features: ATxdqUHj2fi19jS1QFH0PJCkcDeuERIO-7zoT2g4AbnRa9kavNE6di_K6wJHGag
Message-ID: <CAHebdzRagMdTuv_EPDsWNjrhRvMtVdRkZzcNAUb7Dsnw9rqhhA@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006a20b7063487e482"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 08:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216103

--0000000000006a20b7063487e482
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 7, 2025 at 2:01=E2=80=AFPM Mikko Rapeli <mikko.rapeli@linaro.or=
g> wrote:

> Hi,
>
> On Wed, May 07, 2025 at 11:22:49AM +0300, Mikko Rapeli via
> lists.openembedded.org wrote:
> > I think disabling linker warnings as errors in systemd is the way out
> for now.
>
> Sent out https://lists.yoctoproject.org/g/yocto-patches/message/1524
> which disables systemd linker warnings as errors and fixes this for me.
>
> Super. That is great.

I have triggered a clean build, my laptop is a little-bit old, the build is
still on-going. I will add this patch in my local layer.


> Cheers,
>
> -Mikko
>


Regards,
Sathishkumar D

--0000000000006a20b7063487e482
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 7, 2025 at 2:01=
=E2=80=AFPM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mik=
ko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
On Wed, May 07, 2025 at 11:22:49AM +0300, Mikko Rapeli via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; I think disabling linker warnings as errors in systemd is the way out =
for now.<br>
<br>
Sent out <a href=3D"https://lists.yoctoproject.org/g/yocto-patches/message/=
1524" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g=
/yocto-patches/message/1524</a><br>
which disables systemd linker warnings as errors and fixes this for me.<br>
<br></blockquote><div>Super. That is great.=C2=A0</div><div><br></div><div>=
I have triggered=C2=A0a clean build, my laptop is a little-bit old, the bui=
ld is still on-going. I will add this patch in my local layer.=C2=A0</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
-Mikko<br></blockquote><div><br></div><div><br></div><div>Regards,</div><di=
v>Sathishkumar D=C2=A0</div></div></div>

--0000000000006a20b7063487e482--

