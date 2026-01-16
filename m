Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870A8D47CC3
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 10:04:45 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2802.1768557880129461521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 02:04:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=SawifWG1;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.47, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b686e7d04so276038a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 02:04:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768557878; cv=none;
        d=google.com; s=arc-20240605;
        b=SJWjGoDPu/lQ/ReIJTJnatcEkASDxMeKDiEyrBqv9gdXy9obEcSyYepFgKKKhFuo7K
         iavtM+KJfQrJcWEuX4LW7bYz0Ea0aAguUcnxS7qAOtpys+YTTT4ZjijdXqRmMCRms86+
         cv9ytpya8VX5ogFLU4rQZ1yjpvRzf17cOiV3DhpNHIWQBkTRbVjsl7XWoOydcmpKVJpR
         5w81bcZP/ypH4ey1TgE+yD1rZRbZRkaFd1fquIOxkjnn/P3iSTfNY3LAIfNmZJPNCRCx
         iRpj5TyjVasX8qwJxIqTpDtJQyZ2gAA5oiPAoFXHNUgorYyU7OZIIb8L4Uk4WNyjzpZX
         wMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HdYbVqZEDUPQoJftbFBo14FHy1/yWJ3cBiUAuAhy3XQ=;
        fh=iuh7a7WO4MHJcgXMAsTgtgz6Gu8xH5WATMAPKsgVKvk=;
        b=RNoBEVg0uvesE3UOPg+JgAIXZj6WqZrgmvC4rQHmXl+bOseSX2qnCRHLTENt0i5eV3
         Z22lJJMb6vgrkkgXkTIyoKaTzkm0gfVcv3KEINM5ZWwWDSTJJ1VqlEHejma90bibbpxV
         Aljp7q7sH0xar1Yy4eftciz/e0D2dilAmzAmcpN8KEDuKUyr0vjqQeVfrtSMy9Jkort6
         uKQC2Z1GgoraFFNN92QHsjpMhfcAjSDa6zh0yoh+YKHVt5jcv5F5/IE2DE2Audm1NILL
         FDYm0qDag3TkRsBVTLdDhljJuRK6vt4NqOe4NP3GOOlWFRrrgt9q+d9b0Ldk9DNi+tQV
         WDDg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768557878; x=1769162678; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdYbVqZEDUPQoJftbFBo14FHy1/yWJ3cBiUAuAhy3XQ=;
        b=SawifWG1aMUsPcLI54IWPASk/lyH92umO8Pon2YntYwxN03m/3XZ9m0vRnvmK19mgE
         CsxQuWm82vFITIy0eVTsobEl8wSd7uDJABZ/iNLNKkkSImexZK4OTqCXPSVdxfAOzuWC
         X2kSttL5MDdT1xXdANgN14otKpO7HjlSgj/sY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557878; x=1769162678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdYbVqZEDUPQoJftbFBo14FHy1/yWJ3cBiUAuAhy3XQ=;
        b=BIrQJYAqqzKVCmBM6zdqzgk9Mh1da6DTuf9eC5ygzqk6DKnljGFB473TUi1ncbIrkL
         NS/FGYuLJy1UOuNfRa3ZlrGaPgrF8GNwwLK0RH99/XE2vzoWoR+bUOzccmT517xNqSXu
         SGaam82TrJ6yQ2o30YLTTPZ+dcHeLIBZXysRTcuF/RwpnUZBWyPw04P4k8Wsr3Hon3xa
         EryIddKjfdUHP/tkhkOLrT4BhDFadb1Lzk3o2WOF1KoNU9dK80Kzvtw4lZpqB1gEUDJT
         4uUgkpj8JJvhOCj60uECOpBXu5JsdKHfpW/sHPBgFEd2DnjEMgX2xYSQ/p2oo9B3g7eB
         IlHw==
X-Gm-Message-State: AOJu0YzPRjB+oNXI0qu0gk1HtGVcqMSIj7vQ+S3ENFn6slis0/DxI6v6
	kECCSaxMQJrerZyQwtN2/hkKcclRzZpbWKKRJm9IRiIBK6Jx0fR44jVEj+xUnZWsySbW9vySt3m
	abzTfs8mBem9dCpngoeZf7eqgWYy+7FMQLncaFIXSV7/XgPCVi5Y3RqA=
X-Gm-Gg: AY/fxX4nBiAxePzSSXRO0gg0TL5aTMzOVLBtdlZ1Ed1Biw/qWmtUe3fE4rb1aBiQpgR
	T/AQJCSdHOzdAgW43rDLtkMFEwuNTOIsHTkQ/tizTkYWvvvGOPs/1VHu8weY+5SdLgTVXqy3ygh
	oAh6mI9wYMOSPF4UqhXOalsGZ18OHpjHKmJhrH3CLDBVySOEsScq4n15XOxAdep1BWvyEOuIHyv
	tf/3lF1zbRxkpi4SNXV/t97hkYUtiJ+nnnPvLUYpHjF0S1vPuTU0JEWZ7BzFC4VXKqSV9X+m8Af
	WAe+/nX4ER5VFOWLC9Bfn8lO3aLx
X-Received: by 2002:a05:6402:350f:b0:649:5709:aafc with SMTP id
 4fb4d7f45d1cf-65452cdaddemr1175616a12.7.1768557878118; Fri, 16 Jan 2026
 02:04:38 -0800 (PST)
MIME-Version: 1.0
References: <20260115132728.3570868-1-adam.duskett@amarulasolutions.com>
 <DFPWYFPKCFJX.2BQFT0MCMX3QY@bootlin.com> <CAHDQB6ObMtbbVbEf3KTQv3QA9OsNRtwcQH2KvLYj8iDPkqWt-g@mail.gmail.com>
In-Reply-To: <CAHDQB6ObMtbbVbEf3KTQv3QA9OsNRtwcQH2KvLYj8iDPkqWt-g@mail.gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 16 Jan 2026 11:04:26 +0100
X-Gm-Features: AZwV_Qi7Mu0xHD79ZbwubsqWvQh6RJf0tzSqNW7xB4BplH5S7PbM0-UV1be-9W8
Message-ID: <CAHDQB6Po6vK=JPJphNEzizwxCYrsh85mvLact5rPWWNy2rVcdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] systemd: upgrade from 258.1 to 258.3
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000017189b06487e7874"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 10:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229539

--00000000000017189b06487e7874
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah ok,
https://github.com/systemd/systemd/commit/8c3acba63b40cd0ebcb9863804e598744=
eda0b80
needs to be backported.

Upstream, the method has been backported and is found here:
https://github.com/systemd/systemd/blob/v258-stable/src/ssh-generator/ssh-u=
til.c#L30

So maybe it's best to just wait for 258.4

Adam Dusket



On Fri, Jan 16, 2026 at 10:56=E2=80=AFAM Adam Duskett <
adam.duskett@amarulasolutions.com> wrote:

> Strange.
>
> The error seems to be from this commit:
>
> https://github.com/systemd/systemd/commit/e1789bfa5ff5502f6b28d85e76a5e0e=
c4a6c0d9a
>
> But I don't understand why it's happening on your QEMU instance, as I am
> using this in a
> qemux86-64 instance as well and it works fine.
>
> Adam Dusket
>
>
>
> On Fri, Jan 16, 2026 at 10:41=E2=80=AFAM Antonin Godard <
> antonin.godard@bootlin.com> wrote:
>
>> Hi,
>>
>> This triggers the following error on our test infrastructure:
>>
>> [  868.041774] systemd-ssh-generator[11355]: Failed to query local
>> AF_VSOCK CID: Cannot assign requested address
>> [  869.652338] systemd-ssh-generator[11392]: Failed to query local
>> AF_VSOCK CID: Cannot assign requested address
>> [  871.124628] systemd-ssh-generator[11428]: Failed to query local
>> AF_VSOCK CID: Cannot assign requested address
>> [  873.574975] systemd-ssh-generator[11479]: Failed to query local
>> AF_VSOCK CID: Cannot assign requested address
>> [ 1080.239169] systemd-ssh-generator[12943]: Failed to query local
>> AF_VSOCK CID: Cannot assign requested address
>> [ 1084.241817] systemd-ssh-generator[12998]: Failed to query local
>> AF_VSOCK CID: Cannot assign requested address
>>
>> Not sure what this relates to, but is failing when our qemu runners usin=
g
>> systemd as the init manager. Can you have a look / try to reproduce?
>>
>> Full logs:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4980270/raw_in=
line
>>
>> Corresponding build:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3021
>>
>> Also fails in multiples builders using systemd (suffixed with "-alt") as
>> you can
>> see from:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3065
>>
>> Thanks,
>> Antonin
>>
>> --
>> Antonin Godard, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>

--00000000000017189b06487e7874
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ah ok,=C2=A0<a href=3D"https://github.com/systemd/sys=
temd/commit/8c3acba63b40cd0ebcb9863804e598744eda0b80">https://github.com/sy=
stemd/systemd/commit/8c3acba63b40cd0ebcb9863804e598744eda0b80</a></div><div=
>needs to be backported.</div><div><br></div><div>Upstream, the method has =
been backported and is found here:</div><div><a href=3D"https://github.com/=
systemd/systemd/blob/v258-stable/src/ssh-generator/ssh-util.c#L30">https://=
github.com/systemd/systemd/blob/v258-stable/src/ssh-generator/ssh-util.c#L3=
0</a></div><div><br></div><div>So maybe it&#39;s best to just wait for 258.=
4=C2=A0</div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" s=
tyle=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);=
background-color:transparent;vertical-align:baseline;white-space:pre-wrap">=
Adam Dusket</span></p></span><br></div></div></div><br></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Jan 16, 2026 at 10:56=E2=80=AFAM Adam Duskett &lt;<a href=3D"mail=
to:adam.duskett@amarulasolutions.com">adam.duskett@amarulasolutions.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div>Strange.</div><div><br></div><div>The error seems to be f=
rom this commit:</div><div><a href=3D"https://github.com/systemd/systemd/co=
mmit/e1789bfa5ff5502f6b28d85e76a5e0ec4a6c0d9a" target=3D"_blank">https://gi=
thub.com/systemd/systemd/commit/e1789bfa5ff5502f6b28d85e76a5e0ec4a6c0d9a</a=
></div><div><br></div><div>But I don&#39;t understand why it&#39;s happenin=
g on your QEMU instance, as I am using this in a=C2=A0</div><div>qemux86-64=
 instance as well and it works fine.=C2=A0</div><div><br></div><div><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" s=
tyle=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;vertical-align:baseline;white-space:pre-wrap">Adam Dusket</sp=
an></p></span><span><div><br></div></span></div></div></div><br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan=
 16, 2026 at 10:41=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.=
godard@bootlin.com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
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
</blockquote></div>

--00000000000017189b06487e7874--

