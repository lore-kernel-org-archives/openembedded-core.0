Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10ABDEB64DA
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 05:13:03 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.11863.1689484375716277539
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 22:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gP/oIpGe;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b703a0453fso51906151fa.3
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 22:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689484374; x=1692076374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K6jMvgOToMFAFfsA3/A5sn+MOZ1CPISZPwaRyl9J2/g=;
        b=gP/oIpGe1ir7zCGWaHsJ5g0UPrkp9incgeW9ohKgyzJ0wvSvfxlO9iuZatamWbr+r1
         2KSXlXU4eG70mcHXJHxYTbQQV0q2qLGseP8CW/dwXYkQms8tHYjq7YBaKGsrYYtdSDd2
         4qAHCOnbl417hkchKL7l3OvvfbpKLHLM0NwEU7+Fr6NRZD/RDms7ZVuW91JJihjliQ6z
         RVt3amQ/Xk4Tehwva0vAP5DOyfy6i44N+7ia/dXSGly0HwhTrSWNa0f4Y3la//1em9TA
         aQhU6VjaakJcJw3JM/L2CaT+F/tdH7SaStLpSPfOn1nhd+2kXrRollGR6eYIoXfgR2iT
         kOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689484374; x=1692076374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6jMvgOToMFAFfsA3/A5sn+MOZ1CPISZPwaRyl9J2/g=;
        b=QxarfIvW4y1j9FWVxBl9wfwyEIuOJge8g4jRVNKwN8XAuaFZ83ZplO2uApKWRgb9US
         adpvQ8g5MQyEq0strEVPH/cVa5MuPzAfYGz9gATh0xyZQzGTYB6U5dDByE95kfYD+XYE
         SK3kc5O46saCi0cKmDXbb5xVFm+CIt6YO8IC/LHSLhOUtzK8h1zTTxrmVprpw0HNObvx
         CbOZRl0nJArf4NbTAbp6gsSwmDbqUkz/S6Esj5bPsvpPL49uex0WuLQcuoaTqFZbNf8t
         ut1KVO/nzuPw31WKqErsjyd4M4IuQnNWfSZh/bulzb3mJYq2Shh9AwFi55OgTo5QL/63
         XGqg==
X-Gm-Message-State: ABy/qLabcFpA0dm6MLJuLaPFeghph5X6K3S4UrdqtWQQ86sXkZNjgpo7
	edxUhobTA8ydP3mwZc9h5uxnf8oMC2AEdnWHTVI=
X-Google-Smtp-Source: APBJJlF+cPtZPoDfE2EG7uG7EqXC6dYJMOagYdW377UcTT9Z4nU9+naOIvvbh9/HpPIFn6ubPV67KLmJqwcDGdMSIG0=
X-Received: by 2002:a2e:8082:0:b0:2b6:effc:8ee1 with SMTP id
 i2-20020a2e8082000000b002b6effc8ee1mr7854060ljg.5.1689484373605; Sat, 15 Jul
 2023 22:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230714161823.20685-1-festevam@gmail.com> <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
 <20230714213719.GX2066889@bill-the-cat> <CANNYZj8-vQbGEO3yMgRbk2j2L-XOc2EeG6=2w2GhFwUuZqD=mw@mail.gmail.com>
 <c851b7c8-892a-f592-56f1-a69bfa06c193@denx.de> <CANNYZj9o5B7y2yFYtHfwhv=KYk74+ZWqC-kuysP2qRY6ifhMeQ@mail.gmail.com>
 <a8148cd0-46f0-2f52-10cd-d90747179a33@denx.de>
In-Reply-To: <a8148cd0-46f0-2f52-10cd-d90747179a33@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Jul 2023 08:12:42 +0300
Message-ID: <CANNYZj-QcKyeLhxo_U0Wi88SFm4DjcfzxoqGjj3rzanrPo0tgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] u-boot: Switch to nobranch=1
To: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>, Tom Rini <trini@konsulko.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f14479060093bbee"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 05:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184411

--000000000000f14479060093bbee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun 16. Jul 2023 at 4.01, Marek Vasut <marex@denx.de> wrote:

> This protection is really weak, this check fails on every single
> possibly bogus commit which is already on any random branch, so what is
> the gain here really ?



The gain is that the branch name is seen in the recipe and we can make the
judgement about it. You wouldn=E2=80=99t be able to switch from main to
my-ugly-hacks or dangling commit without having to explain that. With
nobranch the branch name disappears and this opens the door for bogus
commits. You may reassure us that right now the commit is not bogus, this
may not hold in future revision updates or if the branch is force pushed on
your side.

Alex

--000000000000f14479060093bbee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div>On Sun 16. Jul 2023 at 4.01, Marek Vasut &lt;<a href=3D"mailto:ma=
rex@denx.de" target=3D"_blank">marex@denx.de</a>&gt; wrote:</div><div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)" dir=3D"auto">
This protection is really weak, this check fails on every single <br>
possibly bogus commit which is already on any random branch, so what is <br=
>
the gain here really ?</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)" dir=3D"auto"></blockquote></div></div></di=
v><div><div dir=3D"auto">The gain is that the branch name is seen in the re=
cipe and we can make the judgement about it. You wouldn=E2=80=99t be able t=
o switch from main to my-ugly-hacks or dangling commit without having to ex=
plain that. With nobranch the branch name disappears and this opens the doo=
r for bogus commits. You may reassure us that right now the commit is not b=
ogus, this may not hold in future revision updates or if the branch is forc=
e pushed on your side.</div><div dir=3D"auto"><br></div><div dir=3D"auto">A=
lex</div>
</div>

--000000000000f14479060093bbee--

