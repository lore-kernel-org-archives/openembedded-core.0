Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8200CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 12:42:13 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.12952.1727181731306060645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 05:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=izWEcQJZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e04a6feef3so2714886b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 05:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727181730; x=1727786530; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TPKsFx491DdyfLSyt1IuDEzHypR3gYVLDShWkbL1V1I=;
        b=izWEcQJZaxeoFgBKFI5S1aY02EYVz5C4grwy9n0Bhmv7hMbUsr1t/uCJKL92LTz/Re
         5zAnJz34UDj50g5J1Xs2U46ZQMY5YApxLbhOBT4NWjj57QusYoj93or173AX1tqoB2ok
         SC/cbdRrl9GiiMgY45ZHUpRBZ7f6MH45vQF5hI+YSfq8QZSZ3lVwsEEgLxWIXlTt8E5U
         R6rI5MdQ4UDbWRUf4cBS2aoqSemsqsAkxpdODSEy2qg1Fi0aoxwH2sD59IK8mPmWZr8F
         KhCEMgUHmpzII9g2/41tnb4lwUQ31B9luaIXNE3Vuw+hJIx13t1cB79OHvEPNPKe+8Ja
         RU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727181730; x=1727786530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPKsFx491DdyfLSyt1IuDEzHypR3gYVLDShWkbL1V1I=;
        b=jGKmz1/dTdmSKlEsDZdvJnAPhEk7uc0Up2a5a43cHrUe8gBS68BLADg72l3u4RxUJY
         Zjlom608UtoNH8YWRouzl6IglxFO3T6lqECbfUmnU5xuySlCdZGhp67j1eccrwtkZgz+
         dA+Y1Fbszj0DPwmpi2lHGzft96K2XsLB2pivsHkCANQrEkX3iPamMGmKDG8gYpm2JPyK
         x8fkLU+ZqEvQMHwNswHgG0YeGSKQxaTy7jkFLo4+a2KHqng1/OvdhPeEjHqpKOT75659
         TNQ8OUAnim9tQJ7cL6kMRxzqnTHtLJiYB86UpPawUMyZwFHq7UBCEdlILdI1g8vGfURG
         MgXQ==
X-Gm-Message-State: AOJu0YwQTTxVF3xS579To0YtNmZk+snQEq+vPdbaw0vU2U+yCDsDK5jV
	kVjclJa+U6Lnk+knvNtklkb3nZq0BzBUyV4S1HtihDT2vBsjNFHY0Cew1h7mtk2X9Z6mleErDSl
	2iKixJbZIHdpqiPSkx1Z65xmC76ZuhBbf
X-Google-Smtp-Source: AGHT+IFbM1jrAcZLf/VFmP4NT9f28OXcVhPyRAZZsJL1VI4z9eeK1PWzfX/uURW9DhP7H9PuHzNh3bU69/JnAHxDJU0=
X-Received: by 2002:a05:6808:210b:b0:3e0:378c:c08c with SMTP id
 5614622812f47-3e2729381aamr9581139b6e.16.1727181729731; Tue, 24 Sep 2024
 05:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240923234336.3978188-1-raj.khem@gmail.com> <CANNYZj9jZywpqjYRZhtxPZTE6g8T=G2gsF2K86MwPxNXoVdnAQ@mail.gmail.com>
 <CAMKF1srvUpsSATHsf-YPrVg8umGPJR44aPOr6bGKukFBdAXTyg@mail.gmail.com> <CANNYZj_4_YfQJi=FLcwi=g8FLMjA9y2-u9Rm5xgML3LxSc3QEQ@mail.gmail.com>
In-Reply-To: <CANNYZj_4_YfQJi=FLcwi=g8FLMjA9y2-u9Rm5xgML3LxSc3QEQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Sep 2024 05:41:59 -0700
Message-ID: <CAMKF1sqz5jEjH6WmVtzrZgZBUrRzDypifdbYe9jt6CpD16AsyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vte: Upgrade to 0.78.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000076a0810622dcd597"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 12:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204860

--00000000000076a0810622dcd597
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 3:53=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Tue, 24 Sept 2024 at 07:27, Khem Raj <raj.khem@gmail.com> wrote:
> > > How can the crash be reproduced? This must be specified. Could it be
> specific to your setup? Qemu usermode is pretty robust with standard poky=
.
> > >
> > It could be my setup but I could see it with clang and gcc and I left i=
t
> there.
> > Its a bit convoluted to reproduce since its in generated program which
> > is called via another wrapper over qemu usermode,
> > here is the cmdline which can be used. After do_compile task is run for
> vte.
> > https://snips.sh/f/sREktUGD0f
>
> I think it is your setup. I just built this update on poky qemuarm
> with g-i re-enabled, and it worked (both glibc and musl). So you need
> to narrow it down to something else, disabling it for everyone isn't
> correct.


Thanks will send a v2


>
> Alex
>

--00000000000076a0810622dcd597
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 24, 2024 at 3:53=E2=80=AFAM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">On Tue, 24 Sept 2024 at 07:27, Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt; wrote:<br>
&gt; &gt; How can the crash be reproduced? This must be specified. Could it=
 be specific to your setup? Qemu usermode is pretty robust with standard po=
ky.<br>
&gt; &gt;<br>
&gt; It could be my setup but I could see it with clang and gcc and I left =
it there.<br>
&gt; Its a bit convoluted to reproduce since its in generated program which=
<br>
&gt; is called via another wrapper over qemu usermode,<br>
&gt; here is the cmdline which can be used. After do_compile task is run fo=
r vte.<br>
&gt; <a href=3D"https://snips.sh/f/sREktUGD0f" rel=3D"noreferrer" target=3D=
"_blank">https://snips.sh/f/sREktUGD0f</a><br>
<br>
I think it is your setup. I just built this update on poky qemuarm<br>
with g-i re-enabled, and it worked (both glibc and musl). So you need<br>
to narrow it down to something else, disabling it for everyone isn&#39;t<br=
>
correct.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks w=
ill send a v2</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto=
"><br>
<br>
Alex<br>
</blockquote></div></div>

--00000000000076a0810622dcd597--

