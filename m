Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6ECC63705
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 14:10:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.16030.1670422224792625129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 06:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gYYvhOnP;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id q7so28272246wrr.8
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 06:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjGDOj5U9/ZpnR/5cv639wpC2b0GsK9W/K6TfhrRgoc=;
        b=gYYvhOnPadV7BFONiz3woJVJEQb4i18OAaCTX+dzEAckD5jsuhHOLSfC9zRHotSWN9
         hcipyVIymVtDqM1oLsWEZEGeCW9hlw/5jZg5b7m3HbI/bNTDFTjQAaLCrORg7wUswkws
         Sr9H4BoMLZGXr55qHp0xCUL5WWD9a5oFiBa6SUzvhXWvfC8UK8Lyz4m7eJo/hgF3IylY
         jc3LDiBeTtyKjUNlfd6A/hucY7kPZE8ElfGDVdF4zYTXJBT8+FgnHzWsz8RHfcplfmtM
         Pkt6srg+U9FlrgZ/pdXfzzj91Z70aGxkiG2bddIKgYDTpofWjlhq/4alL22kic5rM0+O
         pxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjGDOj5U9/ZpnR/5cv639wpC2b0GsK9W/K6TfhrRgoc=;
        b=mNyt3YSoEvk1HS/4urBrMmRItJVipajloGv5S4X1T64q72rtS6pfV/PyOGfPyB0Det
         qh2TyAX5RYYzyucawPY9ocOk6VKydTepUqApBPptjq2dsVWYtzi4V35t5wT024dzYQTn
         BvNwJ3TnLgglI/q/N+YZgA8Lsf843cZLXsK+K6c5A+SQXx+SJuS8TF8yp6Cm2u1REs1F
         yYGtHtqeNin7tq2hqPWC2rgWHLC+RuvvnVCVpMbQ+j0KrR2+lPoSWB2qmNIcLo2VIdHJ
         rd7sIzxbmj1Al+4uTqnZ9CgTXB/HSgRxy9l+rZhVNP9JBhNL7hHQj2IDVs0ug+vjTTxf
         xpaA==
X-Gm-Message-State: ANoB5pnvL7IVS0Cnr22pdxFfP8Cv8YszIsVJp2MpQ54GE0L7mdLVjel8
	FXA57c+J+l0cBrwU29JoZq41duWHYdafsD2mFGc=
X-Google-Smtp-Source: AA0mqf673HyTGoYaapGrZ3lB7hwntPtfac8+AGOusLKMdOn/1di+kIiPGmrRNi6iQXuYxhq0SIH4ljrMDhAIaM/gz/M=
X-Received: by 2002:a05:6000:258:b0:242:4008:6e06 with SMTP id
 m24-20020a056000025800b0024240086e06mr14860114wrz.204.1670422223079; Wed, 07
 Dec 2022 06:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20221201173942.1218836-1-f_l_k@t-online.de> <CAMKF1srCn0tDWAxxpVCYhTZmow3uwy0tGqLXy2VDX0qBHDx2ZA@mail.gmail.com>
 <NMLEMR.NA7JF86LUFN83@t-online.de> <CAP9ODKopgRpWZNiFHjFtw34dYhRHKH188p2_AAs_=Ptyti-ESA@mail.gmail.com>
In-Reply-To: <CAP9ODKopgRpWZNiFHjFtw34dYhRHKH188p2_AAs_=Ptyti-ESA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 7 Dec 2022 15:10:09 +0100
Message-ID: <CA+chaQcCzmqKquXstrcBBQGD8vJ5gDVuUJDNoN7uVNEbpjm+AA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Samuli Piippo <samuli.piippo@qt.io>
Cc: Markus Volk <f_l_k@t-online.de>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003b52f805ef3d7bca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 14:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174354

--0000000000003b52f805ef3d7bca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 5, 2022 at 3:04 PM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

>
>
> Em seg., 5 de dez. de 2022 =C3=A0s 02:52, Markus Volk <f_l_k@t-online.de>
> escreveu:
>
>> Am So, 4. Dez 2022 um 09:23:49 -0800 schrieb Khem Raj <raj.khem@gmail.co=
m
>> >:
>>
>> Not sure if this is related but I think its somewhere in egl headers
>> provided by mesa.
>>
>>
>> This is related to an update of the egl headers in Mesa, just as you
>> thought:
>> https://github.com/meta-qt5/meta-qt5/pull/491
>>
>
> It looks fine for me. @Martin Jansa <Martin.Jansa@gmail.com> could you
> check the PR above and merge if fine with it?
>

Thanks, I've merged this yesterday.

+Samuli Piippo <samuli.piippo@qt.io> as qtbase in meta-qt6 fails with this
mesa upgrade as well.

--0000000000003b52f805ef3d7bca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Dec 5, 2022 at 3:04 PM Otavio Sal=
vador &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvad=
or@ossystems.com.br</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">Em seg., 5 de dez. de 2022 =C3=A0s 02:52, Markus Volk &lt;<a href=
=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; e=
screveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div id=
=3D"m_1949578005322084513m_-7398430256557306960geary-body" dir=3D"auto">Am =
So, 4. Dez 2022 um 09:23:49 -0800 schrieb Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;:<br><blockqu=
ote type=3D"cite"><div style=3D"white-space:break-spaces">Not sure if this =
is related  but I think its somewhere in egl headers
provided by mesa.</div></blockquote><div><br></div><div>This is related to =
an update of the egl headers in Mesa, just as you thought:</div><div><a hre=
f=3D"https://github.com/meta-qt5/meta-qt5/pull/491" target=3D"_blank">https=
://github.com/meta-qt5/meta-qt5/pull/491</a></div></div>
</blockquote></div><div><br></div><div>It looks fine for me.=C2=A0<a class=
=3D"gmail_plusreply" id=3D"m_1949578005322084513plusReplyChip-0" href=3D"ma=
ilto:Martin.Jansa@gmail.com" target=3D"_blank">@Martin Jansa</a>=C2=A0could=
 you check the PR above and merge if fine with it?</div></div></blockquote>=
<div><br></div><div>Thanks, I&#39;ve merged this yesterday.</div><div><br><=
/div><div><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D"mailt=
o:samuli.piippo@qt.io" tabindex=3D"-1">+Samuli Piippo</a>=C2=A0as qtbase in=
 meta-qt6 fails with this mesa upgrade as well.=C2=A0</div></div></div>

--0000000000003b52f805ef3d7bca--

