Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BA1D111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:09:58 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21950.1764259788558446833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 08:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LIIdbFQu;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64306a32ed2so828827d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 08:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764259788; x=1764864588; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lMSO6beGvAsdQfJb9UXo3Vye6zkB9xKL4VqG8pFTmJk=;
        b=LIIdbFQuEMv6/E44ozdylzPsNYO5sQ5x0RYngRjGpvDfBcczPUFgHw+8J0WPY7hjnp
         q/Kvtf6m2qjN1xaJa6Icn/pbFHKLM4vwhBgmjlbErY5oBe0zb3D9NM/Jg0SNYXvrMnQy
         8qpI+dnE/FZYxu4iXqxLfRG3a/0DvbK+AIW4Qkjq2JxEC7XY8utmOMN8AKRQTqa9XRYX
         DOY6p98FGhmIJuhYHoZC1MQmIgge/bdLH1wXZKX3TrQByFRyTfeplTQpho9Wu0wLLlAk
         fuqhR9QmDWqeBMQz/3YTSRyIz2sMa9SHDFMkJzw8CMemqMMerDTQy3EyzsHCBVcWNXtX
         66Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259788; x=1764864588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMSO6beGvAsdQfJb9UXo3Vye6zkB9xKL4VqG8pFTmJk=;
        b=Sa+vxi9fjoro19KrmRSMtJtrXW3cVipQqbEteJS/0g0w+0Brq5Tw9Y2L+jVC38nFrL
         sDbyVd0yTancmGXby+aw/0t80lp9a2yqL0bL9paDImUsS7y+G+RLHJ85VwiXT61/m8ha
         Gn/8FaIe+GFNAZJvcjsVPUf/Y+6TRJxPqE+WvhiO4nR1pbtd49PWd8nobQgLU5NmnJSq
         Xp8PP0SMojAd4gu/MxUDt2r/bEvbaLC/QVVxLwBTyBPM6eIuhFNRKZJB2HCaUf1jqM0h
         /tSuuHVltJKuISHrjbflR7Hd6AQwpIRjpFToNhJZTbhy9M7x3kzbO0aim/aUOCOjZ7ES
         pCcw==
X-Gm-Message-State: AOJu0Yx/2Q91fXrpCDtvwwLlZN4r5HvwUB6MXqPc6LvkqhZhuANYpv9b
	m2OSEULhq5jwtvjMJs91h7p/yDkfXx/hODaBQWovvWvT1t3+rqgRVXyWDniJrdHMNslbmjx10d7
	872G2/RFn+XKc3NI0YWyUgZ2FaRBdNgA=
X-Gm-Gg: ASbGncsjBklZF4SH41cwF+adWjsxGd+q7RaU06Yu4yFGE7od3PcfcGTEnb0iEDFpHCX
	RCDcZzd+UOk02UjuaXs1RvVg7sSHWRUirtDFvUUcZPJl0Tvk69Hj0Gdk0zEp1GBbANtq2eW+1/+
	5Umg+h1eoIhzLhnAQYiBEZ34k+qPujXxj7FLzHeH3yjqFr4vny2CCUikapDdnarx1siBhqRNRns
	AJDkNDC9l2qktV3ulQnoob2rhpAri4XvWRKTnj4JDbUgSc8tdvYf8MxgADjhWvpm6p5W9GCc7G+
	v9f14BZhmlqysa/M3dU5tZopsrFXeaLcWWXs82mynKi8dHrYjZxCbIX4/Tyr3wvrZHP4ATJ9pgb
	u9ANX7giNPAcCiQdXRtvce4z0rjGRM4LuQMZ8JceXS3NuuQ==
X-Google-Smtp-Source: AGHT+IHi5DzsNESygb8gfwfRsKHrtYHtfUq2JNPWC/7ibncpLqZRi5r7nzn+VpNWG4wI8e1+KVNhBUIj7HsXQSklFB0=
X-Received: by 2002:a53:b40d:0:b0:640:d0e9:1d85 with SMTP id
 956f58d0204a3-64302a3f9f1mr13636280d50.20.1764259787522; Thu, 27 Nov 2025
 08:09:47 -0800 (PST)
MIME-Version: 1.0
References: <20251107070819.3751599-1-raj.khem@gmail.com> <20251107070819.3751599-3-raj.khem@gmail.com>
 <7B947F4A-F020-4AEB-B311-22B5444845A4@arm.com>
In-Reply-To: <7B947F4A-F020-4AEB-B311-22B5444845A4@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Nov 2025 08:09:21 -0800
X-Gm-Features: AWmQ_bnWyUYBGBbwIVKko0j7keBPILqgNprqi5d00MK4Xl4H6pR7VE1fLmofpLQ
Message-ID: <CAMKF1srnVxnBEgEPKJ=WoEt5ZmMyME2hyC3uew4yuxj-5u=eZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] libxcrypt-compat,libxcrypt: upgrade 4.4.38
 -> 4.5.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ed482d064495bd03"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 16:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226847

--000000000000ed482d064495bd03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 2:57=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 7 Nov 2025, at 07:08, Khem Raj via lists.openembedded.org <raj.khem=3D
> gmail.com@lists.openembedded.org> wrote:
> > License-Update: New source files added under 0-BSD and BSD-3-Clause
> licenses
>
> This probably means the LICENSE should be updated too, right?
>

There were files under the same license before as well so they were not new=
.
LICENSE should be updates perhaps but thats not related to this change


>
> Ross

--000000000000ed482d064495bd03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 27,=
 2025 at 2:57=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 7 Nov 2025, at 07:08, Khem Raj via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:=
<br>
&gt; License-Update: New source files added under 0-BSD and BSD-3-Clause li=
censes<br>
<br>
This probably means the LICENSE should be updated too, right?<br></blockquo=
te><div><br></div><div>There were files under the same license before as we=
ll so they were not new.</div><div>LICENSE should be updates perhaps but th=
ats not related=C2=A0to this change</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Ross</blockquote></div></div>

--000000000000ed482d064495bd03--

