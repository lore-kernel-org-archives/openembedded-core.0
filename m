Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4288BD4335F
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 23:04:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.166.1765494272654021611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 15:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WaaUnEUb;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477aa218f20so4552125e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765494271; x=1766099071; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6uxPmSP1PznBvF9L4PVJ7ceJbhzgpuIGHtMtKCqRilw=;
        b=WaaUnEUb4MBC/oFVmQQWF+34cxEyjhVC7rB5udPeo8g/hUiU3gRDAzT+XRaLXRkDRI
         +yawqTP4GqeAMYRSw66oiaRMqC+ZtxTLiR4Qt0Hx2xhuAEq7hQtK2eSuiB2QUU78iTO1
         bw8b2Aq/ZlhKdhXD550+LNBxNVZm6vW/N/4UKPZoJFgsN4pYhYWoX72Y9B8IOq40m28J
         9l/yagawaEk3LUZeUeC9JXVw5rMxfkzQBUUK55naavSl0fl2puGtRdu5HRv/E2G4KtTv
         sDYxR+MqAiyi9KVeL7ScGrO5iN6nbk8EFxPuEwyt0UvkdqL4jN6LQuybRCdoEkZbqWCx
         LZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765494271; x=1766099071;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6uxPmSP1PznBvF9L4PVJ7ceJbhzgpuIGHtMtKCqRilw=;
        b=Mga5dcDXlk9Hr6RKK7bGd/HKISe4KJ8FWE4pd+C9+CfK0W4ny9FzTBEt7gZ7w7/DdU
         mEf9NYm5dzxHU5bH6ormKYFPLbAC3XoXJsnZAzVeQh2e48qnc82/dSD4MQ07gSQmdA8G
         lyOMjMAO7blvoWgKhkNOxJC/p+Tux8LkJnwhnMtze1LageWpnXoGC74hWs1XAmjS0JXb
         F1IIs1zLBDdrzdzvitlnDIOzY9u5M2F8a+I+XYTAnnXA2uesOsQu1OKXWravssJUZozg
         lCpjx3g/8d6naXuA26bvi+hDEQuPeOJLrpP86UdJbToZFihKYy5EQE66sRaehCiLPKDA
         M/Cw==
X-Gm-Message-State: AOJu0Yzyrt7WcZZe6Ne43tPlU2euitopV0qR56JXEl59d3Rwwi2wddMF
	HZPw707TzruxxvQmK7flZPPy//+u4a6py777Uhi0BF9q1AyK0ehjh0vt
X-Gm-Gg: AY/fxX43VAWAKTJWwAdBWozWmMN7FwXnjQCaFK60RPjNScVVMZaTwthsNn3LnXTrJ9S
	tzRQp4UE1Cru8AfFK6dkAViztXrVlDnnPksY17HOoERNOuQa+0EPxvzx75PapU1mt2a6om/c/p3
	zi0QLLSDQAGwvBI42oMzZHJf8y9iY81u0T+tRRq5b14n2h1pjxmTnnnBJ/CIlMh01Sffyzs8EZP
	G9iXkBpozz+IaY2ZojLGHVN/aZarx7Q6CDyA7hoGaRUodOo5/E8aIMerA66KlULQ+J7A6y76Zq0
	DlXtrV/9cPoAwlJkksX7E+IHhmAYgKcMgKb6sUA7jQKY24xngNYpKQBBG6mU60ZcP1WjVWUkzq1
	38v4+nUuROkR4qwVxXVMcOz+Zi5drlGNkRjLL7MbwjCSRBtHwAhniAIUletskRuc3Ln+jEpcv2K
	D8uolGYt41gQjQAYzu2JlV14BxGGoP2SBmqC4q3teK0A2zTEeD7e3158g2yivz
X-Google-Smtp-Source: AGHT+IF8Wl0m5jh9r9rG/93uEYa/5KNBvaFUbByOiy2WySSYlfkK7Ytz0cCfjHwJhNQx0UFJIag2YA==
X-Received: by 2002:a05:600c:190e:b0:47a:7fbf:d5c8 with SMTP id 5b1f17b1804b1-47a8f90d61amr41905e9.26.1765494270792;
        Thu, 11 Dec 2025 15:04:30 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f2e8esm954035e9.9.2025.12.11.15.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:04:30 -0800 (PST)
Message-ID: <995dbe984d5fa03e007c6c8942b070e5bac3c3cf.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] u-boot: make initial environment
 binary image
From: adrian.freihofer@gmail.com
To: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 12 Dec 2025 00:04:30 +0100
In-Reply-To: <CAHT-cZvaB6407k=oV_eTKFwudyyTGfG22HAOMkE7apiUd7yP1w@mail.gmail.com>
References: <20251121084918.875151-1-pierre-loup.gosse@smile.fr>
	 <895bcf1973e78323c89bed28ac5c24e89f227e06.camel@gmail.com>
	 <CAHT-cZvaB6407k=oV_eTKFwudyyTGfG22HAOMkE7apiUd7yP1w@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-5asGDvmKTpXwwyp4gifM"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 23:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227566

--=-5asGDvmKTpXwwyp4gifM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pierre-Loup

Thank you for the explanation. I took a closer look at the tests and
now think I understand how it works and why it is consistent by
default.

Regards,
Adrian


On Thu, 2025-12-11 at 16:36 +0100, Pierre-loup GOSSE wrote:
> Hi,
>=20
> Thanks for your remark.
>=20
> I did not plan to mention this in the documentation patch, as I think
> it is outside the scope of these patches, which only create the
> binary format of the existing u-boot-initial-env file.
>=20
> Besides, from my comprehension, all these approaches use the same
> environment source from the default_environment structure declared in
> the env_default.h file, which enforces consistency.
>=20
> However, this is not prevent users from installing a different
> default environment from the one compiled in U-Boot. If wanted, I can
> explicitly mention this matter in my documentation patch.
>=20
> Regards,
> Pierre-Loup
>=20
>=20
>=20
> On Mon, Dec 1, 2025 at 6:59=E2=80=AFPM <adrian.freihofer@gmail.com> wrote=
:
> > Hi
> >=20
> > Just a few thoughts on the matter. There are several ways to
> > transfer
> > the default environment to a target device:
> >=20
> > * Compile the environment in u-boot and run env default -a on the
> > target device, as documented at
> > https://docs.u-boot.org/en/latest/usage/environment.html#text-based-env=
ironment
> > .
> > * Install the file in /etc/u-boot-initial-env, which is used by
> > libubootenv as the initial environment on the target device.
> > * Install it as suggested in this patch, e.g., via wic or another
> > flash
> > approach during device manufacturing.
> >=20
> > It is important to enforce some consistency between all these
> > different
> > approaches. Ideally, all approaches should use the same environment
> > source, which should be the file referenced by
> > CONFIG_ENV_SOURCE_FILE.
> > If this is not the case, when the user executes, for example, env
> > default -a, they will get a different environment than the one
> > initialized by wic for fw_setenv.
> >=20
> > Will this be mentioned in the documentation, or will it not be
> > taken
> > into account in these patches?
> >=20
> > Thank you for the patches.
> > Regards,
> > Adrian
> >=20
> >=20
> > >=20
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#226653):
> > > https://lists.openembedded.org/g/openembedded-core/message/226653
> > > Mute This Topic:
> > https://lists.openembedded.org/mt/116405112/4454582
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > > adrian.freihofer@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=-5asGDvmKTpXwwyp4gifM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hi Pierre-Loup</div><div><br></div><div>Thank you=
 for the explanation. I took a closer look at the tests and now think I und=
erstand how it works and why it is consistent by default.</div><div><br></d=
iv><div>Regards,</div><div>Adrian</div><div><br></div><div><br></div><div>O=
n Thu, 2025-12-11 at 16:36 +0100, Pierre-loup GOSSE wrote:</div><blockquote=
 type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pa=
dding-left:1ex"><div dir=3D"ltr">Hi,<br><br><div>Thanks for your remark.</d=
iv><div><br></div>I did not plan to mention this in the documentation patch=
, as I think it is outside the scope of these patches, which only create th=
e binary format of the existing <span style=3D"font-family:monospace">u-boo=
t-initial-env</span> file.<br><br>Besides, from my comprehension, all these=
 approaches use the same environment source from the <span style=3D"font-fa=
mily:monospace">default_environment</span> structure declared in the <span =
style=3D"font-family:monospace">env_default.h</span> file, which enforces c=
onsistency.<br><br>However, this is not prevent users from installing a dif=
ferent default environment from the one compiled in U-Boot. If wanted, I ca=
n explicitly mention this matter in my documentation patch.<br><br>Regards,=
<br>Pierre-Loup<br><br><br></div><div><br></div><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 1, =
2025 at 6:59=E2=80=AFPM &lt;<a href=3D"mailto:adrian.freihofer@gmail.com">a=
drian.freihofer@gmail.com</a>&gt; wrote:<br></div><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><div>Hi<br></div><div><br>Just a few thoughts on the matter. There are se=
veral ways to transfer<br>the default environment to a target device:<br></=
div><div><br>* Compile the environment in u-boot and run env default -a on =
the<br>target device, as documented at<br></div><div><a href=3D"https://doc=
s.u-boot.org/en/latest/usage/environment.html#text-based-environment" rel=
=3D"noreferrer" target=3D"_blank">https://docs.u-boot.org/en/latest/usage/e=
nvironment.html#text-based-environment</a><br>.<br>* Install the file in /e=
tc/u-boot-initial-env, which is used by<br>libubootenv as the initial envir=
onment on the target device.<br>* Install it as suggested in this patch, e.=
g., via wic or another flash<br>approach during device manufacturing.<br></=
div><div><br>It is important to enforce some consistency between all these =
different<br>approaches. Ideally, all approaches should use the same enviro=
nment<br>source, which should be the file referenced by CONFIG_ENV_SOURCE_F=
ILE.<br>If this is not the case, when the user executes, for example, env<b=
r>default -a, they will get a different environment than the one<br>initial=
ized by wic for fw_setenv.<br></div><div><br>Will this be mentioned in the =
documentation, or will it not be taken<br>into account in these patches?<br=
></div><div><br>Thank you for the patches.<br>Regards,<br>Adrian<br></div><=
div><br></div><div><br>&gt; <br>&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br>&gt; Links: You receive all messages sent to this group.<br>&gt=
; View/Reply Online (#226653):<br>&gt; <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/226653" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/226653</a><b=
r>&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116405=
112/4454582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/mt/116405112/4454582</a><br>&gt; Group Owner: <a href=3D"mailto:opene=
mbedded-core%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded=
-core+owner@lists.openembedded.org</a><br>&gt; Unsubscribe:<br>&gt; <a href=
=3D"https://lists.openembedded.org/g/openembedded-core/unsub" rel=3D"norefe=
rrer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/=
unsub</a>&nbsp;[<br>&gt; <a href=3D"mailto:adrian.freihofer@gmail.com" targ=
et=3D"_blank">adrian.freihofer@gmail.com</a>]<br>&gt; -=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-<br></div></blockquote></div></blockquote><div><br>=
</div><div><span></span></div></body></html>

--=-5asGDvmKTpXwwyp4gifM--

