Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA473D41D5F
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:36:33 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12106.1765467387033818039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hULtfgLl;
 spf=pass (domain: smile.fr, ip: 209.85.167.51, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5943d20f352so297763e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765467385; x=1766072185; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZVw0/1Ir0m+hLfomTGamevLEjEzq3kyJ5V2D1UYp4g=;
        b=hULtfgLlq/lylxc/ckHRv7uundQL11R3SekgGqwKPEGPnz3xL+Wk0ibD3+M9rgecpv
         w7lWeOWDn6KSFYSWm0vql7+EtkpBPfv1tmzw/f5aN/X/6iWqPS5W4R9/rP1B1kRpYGlf
         z63kh4VZgcPDKkBdeycF3RkT4n8gU10Gy+FZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765467385; x=1766072185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZVw0/1Ir0m+hLfomTGamevLEjEzq3kyJ5V2D1UYp4g=;
        b=Stn7G2myoc20X1aCacCn4ZJ3SeWGGm+gddvCJ0awLRhRUkw2psJz+APa+u3YrItQpK
         or4niyiMHo0dzoNukQZfzyRLKBCx+gCDmK3NdtXaYgvlQEsgDINuIMl+dB9+PgFdYhK6
         jXQdg1Foz7XRcBHhQic+aTOejKlMcuopLf2LJYB71nzsOpwZrnXwebrLyKaDV1rE6wWG
         ekctVPpFeYajwXFjFvkw/iLUTE8P/Ulmc0kGwGKvUQ+GtDVYmfu1AKgHoUIr8eiCc+mi
         QvFMJKmm7YrWMEctQEwYvlhmytQS8SX83DbnOyoyAa1nNMdtvCyJxcpW/yzFyZXhrDFc
         KpGQ==
X-Gm-Message-State: AOJu0Yxpaxp+9aZ5ukN2lqdTxCqj09TV7Z+EjJBNQjsAbrL/uZNM2deE
	O7DKkTSal1rdhXsEjDXK+J7qSixQ/VTm+eTqBvQM6xh5+gj1qBYg9NHWIw/Aoy2OEmIDAoQBiPU
	0cVMqIDSnaGaggyXMwxcZ+aqknt2c5p6PjrVbq45y4Q==
X-Gm-Gg: AY/fxX5kLk/8qx/jDji3uLnSRGtr8SCBIjwcGwVxzhAhg83R4pOtf2O5Sbv41iqmhz7
	hWf7UYSvFzYRapsj6AdyEuN4ezZmYjeyNWCWpho2D1MqHwBtouCu/t4ARnJNCBrRG3ZuYZ3UX+s
	25I5gTLIW2QbUwhJUnbYaATx42pG7x8735bsN6C6WSb227RpN9uJyJenlpc76GPfC6wOHgogACk
	kSU+z/HBLQqxzIs5V6WHJmLAYMyTXpsf91UxuISJpUn0ISDCz9GJMik84KB+2DeJ291Vxo=
X-Google-Smtp-Source: AGHT+IElter2C9t0x2d5wQ/6LpAR/Y+hyum28rJWznLlKz0IE1CJzMHCUQhhfgGybXWU+4JQg8aWFbbvImmxaBDcB8Q=
X-Received: by 2002:a05:6512:131e:b0:571:8fad:ecee with SMTP id
 2adb3069b0e04-598ee4f5228mr2368562e87.21.1765467384878; Thu, 11 Dec 2025
 07:36:24 -0800 (PST)
MIME-Version: 1.0
References: <20251121084918.875151-1-pierre-loup.gosse@smile.fr> <895bcf1973e78323c89bed28ac5c24e89f227e06.camel@gmail.com>
In-Reply-To: <895bcf1973e78323c89bed28ac5c24e89f227e06.camel@gmail.com>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Thu, 11 Dec 2025 16:36:13 +0100
X-Gm-Features: AQt7F2p3Uo9_irAvc13uAywcSlEYhgHFH4jdpoyjxj2GugbcdcMtJj2W-vyu5cA
Message-ID: <CAHT-cZvaB6407k=oV_eTKFwudyyTGfG22HAOMkE7apiUd7yP1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] u-boot: make initial environment binary image
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000056aead0645aee826"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227548

--00000000000056aead0645aee826
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your remark.

I did not plan to mention this in the documentation patch, as I think it is
outside the scope of these patches, which only create the binary format of
the existing u-boot-initial-env file.

Besides, from my comprehension, all these approaches use the same
environment source from the default_environment structure declared in the
env_default.h file, which enforces consistency.

However, this is not prevent users from installing a different default
environment from the one compiled in U-Boot. If wanted, I can explicitly
mention this matter in my documentation patch.

Regards,
Pierre-Loup



On Mon, Dec 1, 2025 at 6:59=E2=80=AFPM <adrian.freihofer@gmail.com> wrote:

> Hi
>
> Just a few thoughts on the matter. There are several ways to transfer
> the default environment to a target device:
>
> * Compile the environment in u-boot and run env default -a on the
> target device, as documented at
>
> https://docs.u-boot.org/en/latest/usage/environment.html#text-based-envir=
onment
> .
> * Install the file in /etc/u-boot-initial-env, which is used by
> libubootenv as the initial environment on the target device.
> * Install it as suggested in this patch, e.g., via wic or another flash
> approach during device manufacturing.
>
> It is important to enforce some consistency between all these different
> approaches. Ideally, all approaches should use the same environment
> source, which should be the file referenced by CONFIG_ENV_SOURCE_FILE.
> If this is not the case, when the user executes, for example, env
> default -a, they will get a different environment than the one
> initialized by wic for fw_setenv.
>
> Will this be mentioned in the documentation, or will it not be taken
> into account in these patches?
>
> Thank you for the patches.
> Regards,
> Adrian
>
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#226653):
> > https://lists.openembedded.org/g/openembedded-core/message/226653
> > Mute This Topic: https://lists.openembedded.org/mt/116405112/4454582
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub [
> > adrian.freihofer@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--00000000000056aead0645aee826
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br><div>Thanks for your remark.</div><div><br></di=
v>I did not plan to mention this in the documentation patch, as I think it =
is outside the scope of these patches, which only create the binary format =
of the existing <span style=3D"font-family:monospace">u-boot-initial-env</s=
pan> file.<br><br>Besides, from my comprehension, all these approaches use =
the same environment source from the <span style=3D"font-family:monospace">=
default_environment</span> structure declared in the <span style=3D"font-fa=
mily:monospace">env_default.h</span> file, which enforces consistency.<br><=
br>However, this is not prevent users from installing a different default e=
nvironment from the one compiled in U-Boot. If wanted, I can explicitly men=
tion this matter in my documentation patch.<br><br>Regards,<br>Pierre-Loup<=
br><br><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 1, 2025 at 6:59=E2=80=AFPM &lt=
;<a href=3D"mailto:adrian.freihofer@gmail.com">adrian.freihofer@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi=
<br>
<br>
Just a few thoughts on the matter. There are several ways to transfer<br>
the default environment to a target device:<br>
<br>
* Compile the environment in u-boot and run env default -a on the<br>
target device, as documented at<br>
<a href=3D"https://docs.u-boot.org/en/latest/usage/environment.html#text-ba=
sed-environment" rel=3D"noreferrer" target=3D"_blank">https://docs.u-boot.o=
rg/en/latest/usage/environment.html#text-based-environment</a><br>
.<br>
* Install the file in /etc/u-boot-initial-env, which is used by<br>
libubootenv as the initial environment on the target device.<br>
* Install it as suggested in this patch, e.g., via wic or another flash<br>
approach during device manufacturing.<br>
<br>
It is important to enforce some consistency between all these different<br>
approaches. Ideally, all approaches should use the same environment<br>
source, which should be the file referenced by CONFIG_ENV_SOURCE_FILE.<br>
If this is not the case, when the user executes, for example, env<br>
default -a, they will get a different environment than the one<br>
initialized by wic for fw_setenv.<br>
<br>
Will this be mentioned in the documentation, or will it not be taken<br>
into account in these patches?<br>
<br>
Thank you for the patches.<br>
Regards,<br>
Adrian<br>
<br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#226653):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
226653" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/226653</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11640511=
2/4454582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116405112/4454582</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/unsub" r=
el=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/openem=
bedded-core/unsub</a>=C2=A0[<br>
&gt; <a href=3D"mailto:adrian.freihofer@gmail.com" target=3D"_blank">adrian=
.freihofer@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
</blockquote></div>

--00000000000056aead0645aee826--

