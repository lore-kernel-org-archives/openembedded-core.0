Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51588ECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 13:57:45 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.24213.1725976658333938410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 06:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jv8+T0/H;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5da6865312eso3448087eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725976657; x=1726581457; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I+lQ8baDWOaR80KxKwVtEE87NBx7/b1b5bVDbf6XuLk=;
        b=jv8+T0/HoKXbigzCVcvYhKUSQjoYa+v5xc/vM5s+nnHZgMoxY3IWnqljNq6RP0jrYy
         d1OyGUPBeVANz03llEIPxw0dT7IL6OD8Gr1VPl+4GUQLKgV9owFDL9W3NN0OjTQmfGEp
         CVWnEFesCdMRCZ8q8j5bCNMJcMxRKs/g1pH9t9wMRkNiIOWHDbaePiL6GWhw2Ascaouv
         A0RC7U7E6GVaBwkz3YpXnDI7qSOuDHkp9OBwU62oFT3U9R4hz34TK+76v9TTF+niG88x
         W/A8hhxRAcYgAzM7E20r0x/hBOTYolfrM+ubv+vJ/BpDC+uIIge9JYy49D8YW18cQ2RM
         87Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725976657; x=1726581457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+lQ8baDWOaR80KxKwVtEE87NBx7/b1b5bVDbf6XuLk=;
        b=GWDJVZ6fWQ+9wiodJAkplzAYWrp0qLodWs+fL9+0HSQoPkKzp1gC0S3xnZ2iBFCwcl
         3mTXwFkEoCrVUxV2V3RNjDoUgyu5ECJMfU0GAtk5TRwNlWe+YPIdd6LjNM1iIzwUYL8B
         iqFBVJArjB0FcN0/BqMEf2O68cuPIlbaEjk6fkMd7c90DMJPSuDjRFrjgKUeVyXAZF0b
         H/tGKrbfUe5iPJBYZBfEt7uXKAb8+LeAiu+acSK3Nkrqx8rWARke8XHNpLMugbTzsy56
         jKls0I6U6Ugb2Ac4Za/RunIQ2sLDoC00MJS9eejSeaUKXTqPOokKXr2I+ohENgErua86
         wQog==
X-Gm-Message-State: AOJu0YzuJl3ea2Ew9tnUu6OGPFrlTuyX7DjNHkSMkMeDKLTd8+P0MSfm
	O17B0v752JZuDptuUOvLCikBpHvGuEuxPOd9u7WXWH+C5JNLNcOuKnx40jvOC/QE/xeQqcHGroY
	eNZIw6pe/Jf/wVG6ZKCfkK0In3KA=
X-Google-Smtp-Source: AGHT+IHK3drcVbLfQZPwzcPjI67eaOAQehKA+ayy0QKPAdZ5S8K9ctrxTwaBo1igRfJjFOO4xC7jmei4bF6e5xpwzrw=
X-Received: by 2002:a05:6871:3a06:b0:277:ecd2:7b7 with SMTP id
 586e51a60fabf-27b82da1a88mr11129269fac.7.1725976657419; Tue, 10 Sep 2024
 06:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240910005158.1797671-1-raj.khem@gmail.com> <59590CCB-55D5-46F5-86F2-6689B3BDFA68@arm.com>
In-Reply-To: <59590CCB-55D5-46F5-86F2-6689B3BDFA68@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Sep 2024 06:57:26 -0700
Message-ID: <CAMKF1sorxHixBLZ6gpj5zUh_-_rEvSqGJx+3PA3RuCr5NUkUPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: Disable on 32bit ARM
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008e6a6a0621c441d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 13:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204352

--0000000000008e6a6a0621c441d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 5:22=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 10 Sep 2024, at 01:51, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > vulkan-samples depend on atsc module and this module
> > only supports x86_64/arm64 as it seems,
>
> I=E2=80=99m wondering if we should reverse this logic and just list the p=
latforms
> that vulkan-samples actually works on.


Yeah that would be arm64 and x86_64 AFAICT

>
>
> For example, it also fails on 32-bit ppc:
>
> vulkan-samples/git/git/components/filesystem/src/std_filesystem.cpp:52:13=
:
> error: narrowing conversion of 'size' from 'long long unsigned int' to
> 'size_t' {aka 'unsigned int'} [-Werror=3Dnarrowing]
>
> Ross

--0000000000008e6a6a0621c441d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 10, 2024 at 5:22=E2=80=AFAM Ross Burton &lt;<a =
href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On 10 Sep 2024, at 01:51, Khem Raj via =
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br>
&gt; <br>
&gt; vulkan-samples depend on atsc module and this module<br>
&gt; only supports x86_64/arm64 as it seems,<br>
<br>
I=E2=80=99m wondering if we should reverse this logic and just list the pla=
tforms that vulkan-samples actually works on.</blockquote><div dir=3D"auto"=
><br></div><div dir=3D"auto">Yeah that would be arm64 and x86_64 AFAICT=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
For example, it also fails on 32-bit ppc:<br>
<br>
vulkan-samples/git/git/components/filesystem/src/std_filesystem.cpp:52:13: =
error: narrowing conversion of &#39;size&#39; from &#39;long long unsigned =
int&#39; to &#39;size_t&#39; {aka &#39;unsigned int&#39;} [-Werror=3Dnarrow=
ing]<br>
<br>
Ross</blockquote></div></div>

--0000000000008e6a6a0621c441d9--

