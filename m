Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C896D44C4E
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:57:15 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2732.1768557433107984631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=R/uNlg8C;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.51, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b7d213fd6so318780a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:57:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768557431; cv=none;
        d=google.com; s=arc-20240605;
        b=GTraxj+Fyd3r7ObPsRlNS9YwnbibwmO4A1wrUF7oZAE8KwN/8RcezZBXjQL8YdjmxE
         t9BV92U5GwO37lRFV3xksFiVBzsnUX3Zf3rOW1H/eoUq4H5t1g+cxR8E8urIMhApa+pQ
         k1FeucwANNwZ9MauceAxxg6knSItwiyigE9PPavdhY/DzTQXSKblaEEwRFi/zlMBq4JS
         SovHl6s0bOEyQKa61225oyJw26WYCtr4+SqKow2MWfYn+O9DxeInIDSW6lnqqNjhJ3UA
         Vor19EQhJRlESlHoVbtioY8uRMJV7D6M5aCAwGKkcp46ogS+babTmeAIMIqS8ce9xl83
         QP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8fajDufqrs25mISezOirRqzP7GPMNQ6pNXR+5yjCVBs=;
        fh=iuh7a7WO4MHJcgXMAsTgtgz6Gu8xH5WATMAPKsgVKvk=;
        b=Vztl+pGZDk7iZQBTWh519uUDkOGlowxgMY0A6CjGEGJRLvmMNqCrMmfSkeH+wpGkIN
         KF7RjZgEk/Eg05JJczruehArMm0TKkPcrq0y/zvUVrnhO2bDeStUs5yhe32Zymk3iB+4
         iHYeQHIxOPD9iC+G+bDEX79BX2DZch5Go1NAaotqvjbB6a44Vkjt+yiHRVx3oG76swRo
         OcEgUUWO3K62gWNfZtQZxx5/SOrHDwa2PVWYdPPlOFy905jtLMeucPtzu86L9bb7k5Cw
         SynvnleVwsEMAAyA2aAS9ta0tLea/p7uOflPMFbAFGCEyGoKQGfoVUH6tgX7KalzP2ab
         e2/Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768557431; x=1769162231; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8fajDufqrs25mISezOirRqzP7GPMNQ6pNXR+5yjCVBs=;
        b=R/uNlg8CRJNNEea0k1T7Bouk9J4Uiay/JqMQN3LCj71c5YRXsSShEj0BHVJYNAYwBp
         y08SZFmqKF9vfuyA+nh8TRI12XbBaiEO9/OFDPosNHguCW84Q6CqY9vdeZOBXM01AhXu
         VbSJWYbTQFy6CRutKMOSWyOVilfqBdAlJdLEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557431; x=1769162231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fajDufqrs25mISezOirRqzP7GPMNQ6pNXR+5yjCVBs=;
        b=QqZeCELx2cn5FuBZSzNA4RSqW5Of9R8HPP2j0g1qN52lzoobcShF7rdN3KvYdvIm1f
         loKwJQ+p1xmQ0KKeRMUjNvBA3qZQuerKZfK2wYZ7DEWQfquC+a4zS7lthCq0RxbQJAGO
         sDnqcbsuD/n4dceuS7DTj24ppLo5lDD1p+Ni/tpfWegFFkkFYYcEvbDpi9E6LpHwm0bX
         espdBYBKRUHlxGFlvwaS2QdPW8MoQkTThyeB8MzsguzfK3uYik6My+v2uTLxeNtGgK21
         JKf2xtsnBknH8hWyQaRbPS9Bzjgpczo0RUyZMXVp/fxGOLObMP6/8afyM0lLvPYv7SkC
         Tw4w==
X-Gm-Message-State: AOJu0YzCwDxb6TdDK2xHBPeG1Qvk4gy2ZM6FMmlMl76uvq30lgGQZlDX
	hSctEAVXXyfLS4Gz2/6mrwV/90Wn08lP8XO76NeYbgl8i2rzwmXbjEeuMtqhx+Fp059Br4ZSTmi
	dQpvvjtBwhGplBlaJWrG4wI23LBp78wieR0q6jjjOLg==
X-Gm-Gg: AY/fxX4B+ERJY5IuVUrgftYl7+6jDGkGL8SgoDsFzJuUkoHSaF4lT1Q8XmjjmQ7w394
	tNk0woSr1aYu8aXR1Ys+VCn9CfdF7ffM7zTNOrclD7z4pAvl4eXTSAVE9MhiQru2JUsANBzhp9u
	7HdTYU3nuwKa5YShyUn4jXPmPrJtpFdFgqS4R/M0EgVRHw0pFCd4dGxQhKHaQUXot5Z+lx2Q5AR
	AJhgeP4aA7Z2BMubslkcuvZHRlMQ41pECB6KeNvQo2PjQOFMDNBvyCQyt7HEiv4mrEGPDU4cndP
	F2flx3IY6iYnegLf+sX83mwQyln3
X-Received: by 2002:a05:6402:5114:b0:64b:45db:3624 with SMTP id
 4fb4d7f45d1cf-654529d2140mr1133105a12.3.1768557431276; Fri, 16 Jan 2026
 01:57:11 -0800 (PST)
MIME-Version: 1.0
References: <20260115132728.3570868-1-adam.duskett@amarulasolutions.com> <DFPWYFPKCFJX.2BQFT0MCMX3QY@bootlin.com>
In-Reply-To: <DFPWYFPKCFJX.2BQFT0MCMX3QY@bootlin.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 16 Jan 2026 10:56:59 +0100
X-Gm-Features: AZwV_QiBiboZGN2v3dI1xuK1jLMvxYPDD8vlpWTItHyFEvHZv14_qKIKv16ht8g
Message-ID: <CAHDQB6ObMtbbVbEf3KTQv3QA9OsNRtwcQH2KvLYj8iDPkqWt-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] systemd: upgrade from 258.1 to 258.3
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000074dc3b06487e5d2d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229538

--00000000000074dc3b06487e5d2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Strange.

The error seems to be from this commit:
https://github.com/systemd/systemd/commit/e1789bfa5ff5502f6b28d85e76a5e0ec4=
a6c0d9a

But I don't understand why it's happening on your QEMU instance, as I am
using this in a
qemux86-64 instance as well and it works fine.

Adam Dusket



On Fri, Jan 16, 2026 at 10:41=E2=80=AFAM Antonin Godard <antonin.godard@boo=
tlin.com>
wrote:

> Hi,
>
> This triggers the following error on our test infrastructure:
>
> [  868.041774] systemd-ssh-generator[11355]: Failed to query local
> AF_VSOCK CID: Cannot assign requested address
> [  869.652338] systemd-ssh-generator[11392]: Failed to query local
> AF_VSOCK CID: Cannot assign requested address
> [  871.124628] systemd-ssh-generator[11428]: Failed to query local
> AF_VSOCK CID: Cannot assign requested address
> [  873.574975] systemd-ssh-generator[11479]: Failed to query local
> AF_VSOCK CID: Cannot assign requested address
> [ 1080.239169] systemd-ssh-generator[12943]: Failed to query local
> AF_VSOCK CID: Cannot assign requested address
> [ 1084.241817] systemd-ssh-generator[12998]: Failed to query local
> AF_VSOCK CID: Cannot assign requested address
>
> Not sure what this relates to, but is failing when our qemu runners using
> systemd as the init manager. Can you have a look / try to reproduce?
>
> Full logs:
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4980270/raw_inl=
ine
>
> Corresponding build:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3021
>
> Also fails in multiples builders using systemd (suffixed with "-alt") as
> you can
> see from:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3065
>
> Thanks,
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000074dc3b06487e5d2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Strange.</div><div><br></div><div>The error seems to =
be from this commit:</div><div><a href=3D"https://github.com/systemd/system=
d/commit/e1789bfa5ff5502f6b28d85e76a5e0ec4a6c0d9a">https://github.com/syste=
md/systemd/commit/e1789bfa5ff5502f6b28d85e76a5e0ec4a6c0d9a</a></div><div><b=
r></div><div>But I don&#39;t understand why it&#39;s happening on your QEMU=
 instance, as I am using this in a=C2=A0</div><div>qemux86-64 instance as w=
ell and it works fine.=C2=A0</div><div><br></div><div><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
span><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Ubuntu,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;w=
hite-space:pre-wrap">Adam Dusket</span></p></span><span><div><br></div></sp=
an></div></div></div><br></div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 16, 2026 at 10:4=
1=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.co=
m">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi,<br>
<br>
This triggers the following error on our test infrastructure:<br>
<br>
[=C2=A0 868.041774] systemd-ssh-generator[11355]: Failed to query local AF_=
VSOCK CID: Cannot assign requested address<br>
[=C2=A0 869.652338] systemd-ssh-generator[11392]: Failed to query local AF_=
VSOCK CID: Cannot assign requested address<br>
[=C2=A0 871.124628] systemd-ssh-generator[11428]: Failed to query local AF_=
VSOCK CID: Cannot assign requested address<br>
[=C2=A0 873.574975] systemd-ssh-generator[11479]: Failed to query local AF_=
VSOCK CID: Cannot assign requested address<br>
[ 1080.239169] systemd-ssh-generator[12943]: Failed to query local AF_VSOCK=
 CID: Cannot assign requested address<br>
[ 1084.241817] systemd-ssh-generator[12998]: Failed to query local AF_VSOCK=
 CID: Cannot assign requested address<br>
<br>
Not sure what this relates to, but is failing when our qemu runners using<b=
r>
systemd as the init manager. Can you have a look / try to reproduce?<br>
<br>
Full logs:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/498027=
0/raw_inline" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/api/v2/logs/4980270/raw_inline</a><br>
<br>
Corresponding build:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/build=
s/3021" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/9/builds/3021</a><br>
<br>
Also fails in multiples builders using systemd (suffixed with &quot;-alt&qu=
ot;) as you can<br>
see from:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3065" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/29/builds/3065</a><br>
<br>
Thanks,<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--00000000000074dc3b06487e5d2d--

