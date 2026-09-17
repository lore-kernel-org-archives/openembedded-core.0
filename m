Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7ABC88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 14:13:53 +0000 (UTC)
Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40750.1789654428294302168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 07:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XlchtWSG;
 spf=pass (domain: gmail.com, ip: 74.125.227.146, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so5726555ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789654428; cv=none;
        d=google.com; s=arc-20260327;
        b=ikThfj71dtPYYpRyxRrlw/jpRF3urXBHhuWTq+6Y2+ykG6NRtpw51vnjwVLP9baq26
         U3FHODnBVfSOvF2W9aTpOU18E4yjrf7zyXA0fw7UD2LrJMVrtMcz+vF5o2/ioj9Lcs/+
         4kmaBzZ1T3ehvZaaXynUPkok6Gp1iF7HNlt+ywpg1fYYMP11j0uRteMPFPhsSVIhbe45
         MqvmJx8wX6wRM4rybCtqrE1f6hnuGrC0KUkHXQKb/KLRWbvytUo6tT7+hT2Ktr1DsJ86
         cZvfRpCcEnAAl89JDwIFLgmxxsm3h8tf4l5TvQ6loZsOb60xSWG+TwltZ78qYwhzS6Eg
         YlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kZtFY1ybbDk5JPnDu8H5XhfdoAkUTYxvU+LWKadS2Ps=;
        fh=1ROTFATXKDV4/MdqU770mbEsEjcULA3jt6SZktIund4=;
        b=Cum8dqS8HhreJA6k5r4IWn/I+1+DApTNiN6xaPyqGQn0IIPj32vtGqRWhOXS8ERqIR
         o1GeCj/TrvpRAmUo0PTdbUokcWLUdg8JznB5yKRyZwBAPvlT072S06hNQCx2o3KbqGsa
         0XBMXOUYNsrNvl9E/x7sfFuvjvGflWMYgTh2QbSfjTpJ+ziDUJ4SV5GMCAa7EPqBz9fp
         Bv44ffhmZKYnhdXq4/Sz983tpSTrzGP+xU+aXP3ARuuW8ge3ThMtXURvpOve/PzzniYb
         BGMfaQAGPkJfu52Fz5kA63rwIwg1FPnvTjCVUv3rd5nmIWqNItpgatP+K82kMq9IBcdA
         yCjw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789654428; x=1790259228; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZtFY1ybbDk5JPnDu8H5XhfdoAkUTYxvU+LWKadS2Ps=;
        b=XlchtWSGU3ofkZ7FJg6r8d+64ywBcNaNsu1+QoQlTQrlOg/V74vVLxkSEZoY8+5fzJ
         ykOD9hBbTEBcDrau+inEWTsnqWdsqwfxL2Pq+LJtBnBKegV9+LmfNJflmLpv8ZZxtXQf
         zV6xxOY86kOAnJ+B7If4XASNRoZVltGBw8wcsqDInnxOlBjRXqskdSwQAvpD37wwvZb7
         ZBWh2ZKqSmwfMD6cloLN08i4v8Mejq/DKZ2d6yjCpZE7wBq07WEBNX0HWeX7jOUd0xg6
         60iMNr02Sp7rQpUCYsGFlcl88m8UmGU4mKS5WhKx8zDDtTTMc31kr63E1hHDk04uO7+d
         My9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789654428; x=1790259228;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kZtFY1ybbDk5JPnDu8H5XhfdoAkUTYxvU+LWKadS2Ps=;
        b=U1LSVE/lgS3o90JDhhNESYklAX+90Bua2pgw71NrC/P/COlM3hBfKRIJFCGTAqJ9b/
         Ft71qvBUXIg49PBdzCv5JaV5G7+dtDpmFYKVlswUyCS+2nkETepk1Ug5DXj4ZDfUkgJb
         Vh6OtlVYKtKpi4yFxA06Lyy1Rlf3J8FB3u2MjUdJqPxNcG1u89ARwptBjcuA2MAFhlBw
         qNhEQn2fXd9n6trLWW1KA9b+RGvm6nQ5EErXbhbiJs6enPT3ZXpYZOekgZywbkackvQ/
         beO3tAthj0Nkg5sSw7LlDqA4QWp51mxAyFr074TT/bgri57otenDKRk2luronZfahN4S
         2mPw==
X-Forwarded-Encrypted: i=1; AKwUvBx7zvHnKmvTd3aTdVfl9bEyH2cUH68xTjN1Ps+5AhoOwG6X2ArKfnRQx+UDToexZxOU4Zax9rE5j1QXHSA58xj2/Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++mLUZXwyL5sLBUsjj/gLcqFSy57KLeIhggfIbdn0fPIdym8MsYK
	TUHTuaAanjzkuiwZSFNPekhMElypyNuGDDgU4PgtaZuWbdpkUnDUcmiva+TBzjffa6cgU29QaA7
	W0fe3WZB/xwrSzG6FJtPsAb9V+HTzdGA=
X-Gm-Gg: AYBFou39FPy0db9bfShHcMuLZenuCrweKwUJK9MzDXsyBQr713B2Jq2ZPQhCdfmjYXe
	ESTGDDPwMqRqmCDr9GxxsmPhTrV9VmVIYWPmigUCfDfpq/3GW3M69zCr4IRVNkyIgOUv/o/890F
	aslzARrLIgr6Q5NTEE1BmNKTho0fQVo5Rvn3PcbwHxWDAqpAH7qiKF2w+vmYCuQFCthn5lFh3GB
	KAt4wEw59VDjS3johPJDBQ3H/h9lVcxO9nQrJ5VSo2KZ0GTezgS48paQ8zDIeB6aw0ggemkl5VF
	OuAlZBoFBfHEYoOQa/LO53tgmvREDmw0kIox4uTIWrBpH28506j979H/YtP4Ep374YrtYqHgkyw
	GGPOMDW7ka3mbLf5i4hmZ6osp5fnHvtJ9I8n8uIoCTdX9zSQ7JcvZ3NuhWgabnIPvMbJvy7gGyg
	==
X-Received: by 2002:a17:902:ef08:b0:2dd:ad73:c98a with SMTP id
 d9443c01a7336-2ddad73cd8amr7438635ad.34.1789654427240; Thu, 17 Sep 2026
 07:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260917051340.1472139-1-bruce.ashfield@gmail.com>
 <20260917051340.1472139-4-bruce.ashfield@gmail.com> <DLHND5FZBEYT.3LPLI9L0JOBP5@bootlin.com>
In-Reply-To: <DLHND5FZBEYT.3LPLI9L0JOBP5@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Sep 2026 10:13:35 -0400
X-Gm-Features: AcwNN1VrmweFpMVIXEQDHi7_1lKM_Q95nNKmv1Cuxk4A0_lU6tZT9iXjtlAOGSU
Message-ID: <CADkTA4MFxHuCVX-WNcma1Q7AzUwupf73MZTb76+W4kvZ3BQtEA@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH 03/06] linux-yocto/7.2: update to v7.2.6
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000680cda065bae643d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 14:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246068

--000000000000680cda065bae643d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:05=E2=80=AFAM Antonin Godard <antonin.godard@boo=
tlin.com>
wrote:

> Hi,
>
> Am I missing something or this series is missing a patch to meta-yocto-bs=
p
> to
> update SRCREV_machine:genericarm64 to 7.2.6?
>

yup. I didn't the bump, but in my rush to generate the series, I didn't
send it out.

It'll arrive shortly, I just rebased and re-generated it.

Bruce



>
> Antonin
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000680cda065bae643d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 17, 2026 at 10:05=
=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com=
">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi,<br>
<br>
Am I missing something or this series is missing a patch to meta-yocto-bsp =
to<br>
update SRCREV_machine:genericarm64 to 7.2.6?<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">yup.=C2=A0I di=
dn&#39;t the bump, but in my rush to generate the series, I didn&#39;t send=
 it out.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">It&#39;ll =
arrive shortly, I just rebased and re-generated it.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Antonin<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000680cda065bae643d--

