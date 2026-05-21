Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E80CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 16:15:37 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40494.1779380133245353256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 09:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SKRLDx22;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7c2fa14795aso48625587b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 09:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779380132; cv=none;
        d=google.com; s=arc-20240605;
        b=kYaHX7XX1ftfhWl6KrkCYfzJJqHBUonTN4cIQV0tkP53LaBJqqegNZzxD0+E+2iQO9
         HxfyRUHUkkLPXty9VgOF89+sWr7+wix2mkkoWLYjfGVN+3EsgINzzW5FwbihRHmxvJSm
         pL07szv9yTY7QXmVJFnKUh/rESUhmCZdPhkFkGiIU5VCUGAW4kyMV+hFyFjHCd5Y8LCe
         hU2mzDQ9GGbk4BWL4D592k/P7rPFXQXGTESDli7ZVlCFsPiiCvmiUl7ymHbFbKtqVwju
         6UE6QVRgZ1GQ/PR9FWdgz+lenTlB7AN2c+AkNY+3o3WWgUAEmvab9GegRdsKoMQuD/ea
         z/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lAyAVMucPp3mEU8PTV3mvyzzWC7cHj4Y3lNRZmS7wpQ=;
        fh=1F+gk+DDIiRUvHGQWZWjDDerWBN3/kwNfii4xH3ES0Y=;
        b=YsQi/dUIGHZtBOx9rhT3SGNdPdHhTUbjK2ucWnNs0wqMBuFlhoSa/w1gGEzkKVaU58
         JywmgUZgu6iOURAfTmTx7daQ+oXoM+zg1Oyh350XWo2llkIvXjqyUyjaAtLiTkdU7D/9
         1LvRayNwc/+VwjZ/Tqzn8fTtaMc65MV23czlMzs4JMIV3g03HRHUGVAZLRHopbDpNsHG
         7PL0u0Pc3b2woJ6mpPs4pX1dhedAo4l54iOOCidqAx/GfxzzjKaEYUJsCLEhNGcmhAgV
         PyreC8LI86DtCo7vFnTu26L5C/+UpiIeHwKY5cNec8sW+43qWuyy2/jvTc8Qy6Hy7AI8
         3jRg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779380132; x=1779984932; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lAyAVMucPp3mEU8PTV3mvyzzWC7cHj4Y3lNRZmS7wpQ=;
        b=SKRLDx22aH+VO5YkK5AWicyoUxba3/8LKXTgA529oNAcZGC50b2w1lFIHF3YN2rrtg
         33epttz/QfDpLKZKQrj2IwH3eh7dKvDpmygHIEI/k0KqOGGyS2+vqNI6d93AUU0y6Pd1
         V62IXzt/fPjqTQiC8J8Ek6h4aTvldmGjhMoAWel2TYFyN4MpYyCtVHNzA0/wXuY0bUGX
         jdWnY9ov6HqMM9kN353QAzI055AvInAZGzfIky4RtrxBWZMIhwpiSvYzjKv/EQGyJV9m
         WuhCc/645kwYLA4nlUKRoNC9G6oJn3IORSsyH44+A2m+QUe8rrIyAAXsAVr/5PLVC+lf
         7UgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380132; x=1779984932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAyAVMucPp3mEU8PTV3mvyzzWC7cHj4Y3lNRZmS7wpQ=;
        b=XKBohBuA0QUhzlpcw3jTMIzNzgdu00LGQYO9Pqvlla+DAqaxmFrHKy4flYFDyS8EkP
         ees6JNcwxXDCrk5nW8u/TtO2HHkaphq05WsSk9vKfkyuULTQyjmzTFLTa/e84awr5fYp
         xbU9Plc1mleHnwToXc2esLV8JK3t9hSvgvt7SWPyEzASY2rDMhV4+N/9JtGHEB5nm6w4
         Rt5XTTPvo7RDiZmaOi73MXLECvQjgzemxTRx2YMysRZzg5B6EQfLPpHkDsq+S4pQ+hEH
         8H7vs6UISImP8gWnfVyRatzjndG0wAl+YGlD6yG1ECguKctBTX34pRXCoDSFpKXmwUcd
         ELxA==
X-Forwarded-Encrypted: i=1; AFNElJ+ri/OzwYVFnDI45Ik4e7S+HvTFx00ErvPqMHJjCrtoeIDtDd5SeEEz920slq699aK+fmPT0UT7emNPXfGCLhmIFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6/667YKTcu/G6qQ5N9wdiS01fwb4N1aq41+bcKZ6iaNrbblKl
	YJx09GTeyfGaJIDcG3V0uR660rKirtaYqhmn5Yf+nMiqDiFXcUvf7eKg15XvVkFiQIeZk8glWqU
	l294g05CIYbWpBscBpLXAolgL2QjLzMw=
X-Gm-Gg: Acq92OHdFSX5TBqpG5el5bceJfl2zuB1pMmZc2mKV7q+UUOZQ+s75kTqGhsiR90zDMY
	eNpVVtr5FXPTRQ9T3mubbCigE3cl1b6sBHUsD6YWqmUrKKMO86uOQx41/Zi1n926CakWVgDOgxm
	DMNmJLM3COONYZLWr4XDWaaKSiSj8PT2Uf5IdoiDL57PWIr3e0HffzAqX49MsX/hDzJAwD7tHsO
	3CfPIJVfFHzG7aJQCud7fN7W7w7ndaK8aLpf5Pki2SDyUESL3mpF6RbG8M8xuyX5pqNoVEl0gJI
	+ryyV4A0
X-Received: by 2002:a05:690c:4907:b0:7d0:79f:338f with SMTP id
 00721157ae682-7d20c549a07mr40726177b3.33.1779380132227; Thu, 21 May 2026
 09:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <CABF_=ygrm+zsyehypM_iRpdfdnH8DSTCMK-Dtt=OQsy3aFtYPw@mail.gmail.com>
 <faa3919e8145fdb9f49b9e360d6aca83abae43dd.camel@linuxfoundation.org> <CABF_=yiXuU84OyLo9O3Dd+yQiae2HW2=N+ZSMcHKE-wkep6s9g@mail.gmail.com>
In-Reply-To: <CABF_=yiXuU84OyLo9O3Dd+yQiae2HW2=N+ZSMcHKE-wkep6s9g@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 21 May 2026 10:15:22 -0600
X-Gm-Features: AVHnY4LYygw7m7GNOCHGNNDi15kDXCD254QAJb2H1BuYPbHFhyJIxiAPx4remGE
Message-ID: <CAJdd5GYSJFQ0EbLuoy70v7uYAXTaOeJP84MDEeHw7p3iPX8a2A@mail.gmail.com>
Subject: Re: [OE-core] adding WXwindows-exception-3.1 license?
To: jan vermaete <jan.vermaete@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Rob Woolley <rob.woolleywr@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b3ad2d065256385b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 16:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237519

--000000000000b3ad2d065256385b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was traveling, so sorry for the delay. Please create a bugzilla and
assign it to me.

On Thu, May 21, 2026, 10:14=E2=80=AFAM jan vermaete <jan.vermaete@gmail.com=
> wrote:

> Should I make a ticket for this in Bugzilla?
>
> Br
>
>
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>
> On Sat, 16 May 2026 at 09:01, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Fri, 2026-05-15 at 19:12 +0200, Jan Vermaete via
>> lists.openembedded.org wrote:
>> > The WXwindows-exception-3.1 license is a valid SPDX license [1].
>> > And used in the `openscenegraph` recipe of meta-ros [2].
>> > Generating the spdx (do_create_spdx) is now failing for this recipe.
>> >
>> > Could this license be added to the `spdx-licenses.json` file?
>> >
>> >
>> > [1]: https://spdx.org/licenses/WxWindows-exception-3.1.html
>> > [2]: https://layers.openembedded.org/layerindex/recipe/438736/
>>
>> That file is generated from the the scripts/update-sdpx-licenses.py
>> update script. I did just run an update so we can pull in recent
>> changes however that license isn't among them.
>>
>> I therefore checked and it is because it is a license exception, not a
>> full license.
>>
>> Copying Joshua, I'm not sure how we want to handle the exceptions.
>>
>> Cheers,
>>
>> Richard
>>
>

--000000000000b3ad2d065256385b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I was traveling, so sorry for the delay. Please crea=
te a bugzilla and assign it to me.<br><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 21, 2026,=
 10:14=E2=80=AFAM jan vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.com=
">jan.vermaete@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"auto">Should I make a ticket for this in Bugzilla?</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Br</div><div><br clear=3D"all">=
<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature">Jan Vermaete<br>=E2=80=9CSuccess is a self-correc=
ting phenomenom.=E2=80=9D -- Gary Hamel</div></div></div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 16 May 2026=
 at 09:01, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundatio=
n.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Fri, 2026-05-15 at 19:12 +0200, Jan Vermaete via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; The WXwindows-exception-3.1 license is a valid SPDX license [1].<br>
&gt; And used in the `openscenegraph` recipe of meta-ros [2].<br>
&gt; Generating the spdx (do_create_spdx) is now failing for this recipe.<b=
r>
&gt; <br>
&gt; Could this license be added to the `spdx-licenses.json` file?<br>
&gt; <br>
&gt; <br>
&gt; [1]: <a href=3D"https://spdx.org/licenses/WxWindows-exception-3.1.html=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://spdx.org/licenses=
/WxWindows-exception-3.1.html</a><br>
&gt; [2]: <a href=3D"https://layers.openembedded.org/layerindex/recipe/4387=
36/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://layers.openemb=
edded.org/layerindex/recipe/438736/</a><br>
<br>
That file is generated from the the scripts/update-sdpx-licenses.py<br>
update script. I did just run an update so we can pull in recent<br>
changes however that license isn&#39;t among them.<br>
<br>
I therefore checked and it is because it is a license exception, not a<br>
full license.<br>
<br>
Copying Joshua, I&#39;m not sure how we want to handle the exceptions.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>
</blockquote></div></div></div>

--000000000000b3ad2d065256385b--

