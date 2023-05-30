Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACC8C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 15:06:18 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.101.1685459173832729836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 08:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ettFdbAG;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2af2f4e719eso49816451fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 08:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685459172; x=1688051172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ecnpc2fcdA47F65/RnWz650uzPtw0V7sOtTTSr4coLM=;
        b=ettFdbAGos+u10GtNcrriejMI5OSY6cDMJqxZzblcApFBQCwYAFWhMWNsXVqFk1Oul
         SXUV8AiIDlvmZuKVJypeHTiFkmi580eht7KQ4h20oEbNNsX+p9MnnOHWQ4DPv1DJRKP5
         3N15sNhEwsrLOkMXSvPu8qB+Vt+qg5509susNTFOiNQh5TgUbaSz36RH2FNBD9j2ZIpW
         kD4zme4ww+0xtQoCi6/x8/1wXC3hAq7p6D3Up2YSgvXqg8AWRzrIPTcdeeapI9KiwBnY
         AHQaJaqS3Pa2CFca9hs+wWEj+6YRmCdKHXKYhtbtIfr7V3z+WnrSMu3/Bq85ixbw51Xi
         yLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685459172; x=1688051172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ecnpc2fcdA47F65/RnWz650uzPtw0V7sOtTTSr4coLM=;
        b=jSjbq8actgUUcj9SQDJ6FVPwBG4l7/R1UVTV7OYm93FacWxTCy9LfukQv72raUV26o
         oiHCSaw6shpqkKYjDskM3CRrv4DVKZS5+nHp1nLX+/PGgrubvyaDDPQRNMrBzadHCXPO
         6z6JKwmGxUU4Yq0d6HLuUVK3BxYyRQ4fdRtSpxxUEG2gCKDYGt+osmWWriqMsa0i9yha
         XpBF7yAPbBpYF8mADP17yFgzDTcyCD+nGetmqDMJka8UMoEe2u0lNRJ8cFfCR/7D7Ivn
         Cjikf93E7q2LyUUsUm75WFSHlLRY/wT7Mpk+51zRAj4apEHtCb3+WegnaOvKLMIzdkPn
         S4wA==
X-Gm-Message-State: AC+VfDxBQfqWF7tiqw4e2t0ZfQfYwiaPcYgTxEdn2xcPuu4g0IGirZx8
	7Jy/PxJuDW5dy+yMU5ayFdGa8RXwmY3+dyWr4zg=
X-Google-Smtp-Source: ACHHUZ7qQ21pJcUR2ncA8CTt6QX1l6mjtweKqwdl0YxOK2a9fIB4aoi3bNuO796cSJLmv7MGD2lN8NXIH3qcSBu9dYs=
X-Received: by 2002:a2e:9e15:0:b0:2ac:8c95:d42b with SMTP id
 e21-20020a2e9e15000000b002ac8c95d42bmr1013416ljk.4.1685459171772; Tue, 30 May
 2023 08:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230530105125.445622-1-yashinde145@gmail.com>
 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
 <CA+cAkeoEfQWbQkwYMhAUqQKQXyXcyCYJdoFewWkDKsVW=Mpyeg@mail.gmail.com> <c13fb9159ec84ab2bb4710a3e59190db61b54612.camel@linuxfoundation.org>
In-Reply-To: <c13fb9159ec84ab2bb4710a3e59190db61b54612.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 30 May 2023 17:05:59 +0200
Message-ID: <CA+cAkeqPd=5dodJ_mfEv_w-BsvfUCE1JQq1k1oSk+Paegrv3ZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v14] Rust Oe-Selftest implementation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yash Shinde <yashinde145@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, Randy.MacLeod@windriver.com, 
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Yash.Shinde@windriver.com
Content-Type: multipart/alternative; boundary="000000000000378cbc05fcea8b89"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 15:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181934

--000000000000378cbc05fcea8b89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh okay, didn't try that personnaly.
the class is currently tied to cargo behavior so for performing rust core
tests, it will not be suitable (at least in its present form)

Le mar. 30 mai 2023, 16:44, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Tue, 2023-05-30 at 16:35 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > Beside the errors pointed by Richard, I'm wondering how it behave
> > with the ptest-cargo class? Does this class still useful with this
> > work? Is it some kind of complementary or did it concern a totally
> > different matter/use case ?
>
> As I understand it, the intent in this change was to enable the core
> rust tests to run as ptests.
>
> Could we use ptest-cargo for that instead for the core rust recipe? If
> so, has anyone tried it?
>
> Cheers,
>
> Richard
>

--000000000000378cbc05fcea8b89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oh okay, didn&#39;t try that personnaly.=C2=A0<div dir=3D=
"auto">the class is currently tied to cargo behavior so for performing rust=
 core tests, it will not be suitable (at least in its present form)=C2=A0</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Le mar. 30 mai 2023, 16:44, Richard Purdie &lt;<a href=3D"mailto:richar=
d.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2023-05-3=
0 at 16:35 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:<br>
&gt; Beside the errors pointed by Richard, I&#39;m wondering how it behave<=
br>
&gt; with the ptest-cargo class? Does this class still useful with this<br>
&gt; work? Is it some kind of complementary or did it concern a totally<br>
&gt; different matter/use case ?=C2=A0<br>
<br>
As I understand it, the intent in this change was to enable the core<br>
rust tests to run as ptests.<br>
<br>
Could we use ptest-cargo for that instead for the core rust recipe? If<br>
so, has anyone tried it?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000378cbc05fcea8b89--

