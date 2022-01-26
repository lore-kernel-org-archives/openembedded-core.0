Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189CFC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 18:43:34 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web12.16830.1643222613624778140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 10:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KjRJ4MUE;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id n15so425292uaq.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 10:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rWJDZThP6df4R5hDuLQI5NuwzWGaAZTTI0hJ9Ri6XfU=;
        b=KjRJ4MUEeepuGla01SlyAxHV0YWOMnJrchWx1w1OFd+41dZ8wLtEQe7rRqMZYNgQSa
         FBxqZlxg8qSF4P2sAvkXr0Ig3v3Vh4F1D0nSy5Agsi/X6P4DTn581ZcMeevoCdJ7TnBj
         CF+AhyUveQnJDN8hhcO1tQz6ZxNDGd4Fr7PhQabWVcTx58Z5ajAeQi48cJZSjQH+8MGj
         YUHgICKCAZ+ZCsG9MbrR+cJtQJIMAbALMN/eFeB3gLN764gs4wOd7SA+g0kECpjVy87J
         7IoljDHUqiWqA2J1rsj1SatKvFR93DQ3ki0xSgSj5gkXzRRcQIpjpev66g0Tb+qfLgwE
         3miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rWJDZThP6df4R5hDuLQI5NuwzWGaAZTTI0hJ9Ri6XfU=;
        b=5zZuRCv/nDVgz18yZLMh/Z6U2wnHTTNv1g1ZCPXzrPn3qiifR3+kF04CDcX13swcOf
         oYiK6hSYrgQRlEI53lYfJ1ggzQk0J3zS2yQ1DNSOrhhF0a157R+qARz3HUr+j1wkIJwx
         ctHzj+kkrckWKqNqubYUy1DQMTZQyYgUJZsfjxVYG53SfbkPU7N2rWc5w1cH0WCAXxN5
         E54lzJjkn0Pvnag74/CPg3uTeTvhFGfBtRQHWsq6ybzYpeT40wm0pR57zq8PW/9t4RbE
         T0vVVzwKGG8BdpZKMWDgoGdGIFRTq0I1LIQqEjZzQcztFmf4afp8rmy1obO3axE/wv8U
         jijA==
X-Gm-Message-State: AOAM531vJXF8gwrJfmjYq4YvcURX8o2w0bpCokT67RAhWX4Lvm+uPSfM
	x6VHJUlQe/ZgJmoECk6fyRYdohltYuXDN7tY0jw=
X-Google-Smtp-Source: 
 ABdhPJwJxHy0sfYKxQXDFtr0IRDI1YAPEOfqLT7Avjr64SxMdZdN32Hfb+V66lb1CK/Ntt8Hpktp3W56G6mkvwsdO1k=
X-Received: by 2002:a9f:308b:: with SMTP id j11mr263018uab.100.1643222612796;
 Wed, 26 Jan 2022 10:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20220126102814.4173943-1-ch@denx.de>
 <CANPvuR=bCzgv+R3kHQgDOh4CSst7CP0y+uy+9L_my4oVQrdm1A@mail.gmail.com>
 <CANNYZj93yXZHz8Yyobey6srn27h1sLSV+zbXkdsHiZqreE5E+w@mail.gmail.com>
 <d9982093-1923-e9ec-1b7c-5edecdafe1d3@denx.de>
 <16CDD21A9A152F83.12885@lists.openembedded.org>
In-Reply-To: <16CDD21A9A152F83.12885@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Jan 2022 19:43:21 +0100
Message-ID: 
 <CANNYZj9MqeNuSYPDbaK3m=2=WKScq+yCho9zEfzb+48qrBbo2Q@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 00/12] Update to gstreamer 1.20 for kirkstone
To: Claudius Heine <ch@denx.de>, Jose Quaresma <quaresma.jose@gmail.com>,
 Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000001f6a4f05d680946d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 18:43:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160994

--0000000000001f6a4f05d680946d
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Jan 2022 at 13:34, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> There you go:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3161
>
> Your choice is to watch the ongoing builds with trepidation, or come back
> in 3 hours-ish (most of the builds should be complete by then) and see how
> many fails you got :)
>
> Test configurations are defined here:
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json
>

There is a ptest fail on x86:
https://autobuilder.yocto.io/pub/non-release/20220126-15/testresults/qemux86-64-ptest/gstreamer1.0.log

The same ptest has no issues on aarch64:
https://autobuilder.yocto.io/pub/non-release/20220126-15/testresults/qemuarm64-ptest/gstreamer1.0.log

Other than that, looks pretty good. armhost fail is unrelated.

Alex

--0000000000001f6a4f05d680946d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 26 Jan 2022 at 13:34, Alexander Kanavin via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a =
href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr">There you go:<div><a href=3D"https://autobuilder.yoc=
toproject.org/typhoon/#/builders/83/builds/3161" target=3D"_blank">https://=
autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3161</a></div><di=
v><br></div><div>Your choice is to watch the ongoing builds with trepidatio=
n, or come back in 3 hours-ish (most of the builds should be complete by th=
en) and see how many fails you got :)</div><div><br></div><div>Test configu=
rations are defined here:</div><div><a href=3D"https://git.yoctoproject.org=
/yocto-autobuilder-helper/tree/config.json" target=3D"_blank">https://git.y=
octoproject.org/yocto-autobuilder-helper/tree/config.json</a></div></div></=
blockquote><div><br></div>There is a ptest fail on x86:</div><div class=3D"=
gmail_quote"><a href=3D"https://autobuilder.yocto.io/pub/non-release/202201=
26-15/testresults/qemux86-64-ptest/gstreamer1.0.log">https://autobuilder.yo=
cto.io/pub/non-release/20220126-15/testresults/qemux86-64-ptest/gstreamer1.=
0.log</a></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">The same ptest has no issues on aarch64:</div><div class=3D"gmail_quote=
"><a href=3D"https://autobuilder.yocto.io/pub/non-release/20220126-15/testr=
esults/qemuarm64-ptest/gstreamer1.0.log">https://autobuilder.yocto.io/pub/n=
on-release/20220126-15/testresults/qemuarm64-ptest/gstreamer1.0.log</a></di=
v><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Other tha=
n that, looks pretty good. armhost fail is unrelated.<br></div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div><div cl=
ass=3D"gmail_quote"><br></div></div>

--0000000000001f6a4f05d680946d--

