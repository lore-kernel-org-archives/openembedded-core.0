Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E660C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 14:55:33 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.10061.1750949722949826999
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 07:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EN637EeZ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so190931266b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750949721; x=1751554521; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77FiSHBpTCYuDf1yXbdTXVgt4ffRkKKgldWNlkXYo+c=;
        b=EN637EeZkQiSGzpWAOIfUsZHUxbMsxJynYHrgkT8nF4d+zSwtmZlh8DP591P/Ne8b7
         TI2xQoOc4LIk7KpwadJBM8QWfBz30BUp3OhZNwKPK9IjcVCz9+2H3O60+ReeR5a0OprQ
         6+oimQLa4vIbo3SkYcHS14JwDZvfrsmGo78ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949721; x=1751554521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77FiSHBpTCYuDf1yXbdTXVgt4ffRkKKgldWNlkXYo+c=;
        b=lzOasgwc/ls+WzLxr+OaSxbDR0yFek2SDhdyQtxXxkbYVFzNEX1pVhzbe7KLRlbwxs
         zr3AbC0mYDcIXFkPX2vg9K1njQ8ofzkWFBeHlA0JR2flDuCkcuLfK+v8tmzfDuI7uZnp
         +MBuLGZ+GgwlREzZgKlZfw79R1A0vZHzsyb7C5djLwqqYRDfcdtknrsfMfLb8XLd+B4w
         WrI0SGuF0GZEPUshHBP3ss/Oq22wGgxpnjVgxrUna3pogGTf4rkDRILO6aj35EO1fDCA
         5LJb0IC5Gz/pHnH7e5gDKsNVXdyHUxwu1Vz93z/bGTw0nfAD9yeaF6jpV5aBp9yLWNMV
         kX4Q==
X-Gm-Message-State: AOJu0Yw9r3nIexRnR4BqtjlKgYP7M/oIOwV+t4tkoBWy/nFFRMzj1hCl
	aeVy7JGSZT0M1DTbF06Cba9pzs7Lppb1udbWEE5DIHP4MkiyT4Hnxj0SDuedcL8rxuZeH+Vwf+d
	jD9NPIwLgzAu7j0b9v0mBSabEv2wzQR0TAprXvDFShg==
X-Gm-Gg: ASbGncvCvMa/jyCkliMkw+JSNgSji0k1aArBkyJaBmrFjMcNd/dlvlOK4b0FX5QKbaO
	r778mODCnGTNTehGh2+PhgxY5KGiDTt0dbKyaLgs9jVTjHqwAlpkklAtHqpfxLYs1794yTPQ28e
	ihvHQEzT9ts/1awL8TeWTchqtN1zEmcIpYoEUo1cJFwEA=
X-Google-Smtp-Source: AGHT+IHR0hnYw22ja+ZqOnHdEf9CklTHKhX+9fVSf7XvfDLz5Y11UYliyANojc3CINNozgBq0ht0ERMAa2w/1aXBNik=
X-Received: by 2002:a17:907:9716:b0:add:ed3a:e792 with SMTP id
 a640c23a62f3a-ae0beac3570mr707806366b.47.1750949720210; Thu, 26 Jun 2025
 07:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1750806216.git.tim.orling@konsulko.com> <8028bc471f02bc3d688ab422120db7504a38a121.1750806216.git.tim.orling@konsulko.com>
 <08D01BAF-8748-4F97-9EE2-6395227D1690@arm.com>
In-Reply-To: <08D01BAF-8748-4F97-9EE2-6395227D1690@arm.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Thu, 26 Jun 2025 07:55:09 -0700
X-Gm-Features: Ac12FXxqvxgtA_MLy-ac5phqZ04bunm02HO_IXpg_5nQzXpu1eLHX9gEBngzz8s
Message-ID: <CAOyo-85MMrj2EmFMcbbdvEV3ss8WNttRb9DoLB5Kcd4jAqVnQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] python3-wheel: upgrade 0.45.1 -> 0.46.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000017d46e06387ac021"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 14:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219357

--00000000000017d46e06387ac021
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 3:20=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 25 Jun 2025, at 00:13, Tim Orling via lists.openembedded.org
> <tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:
> > * Removed vendored packaging in favor of a run-time dependency on it
>
> I=E2=80=99m guessing this means we need a RDEPENDS on python3-packaging?
>

Good catch, thank you.
https://github.com/pypa/wheel/blob/main/pyproject.toml#L28

v2 in the works.
I will try to add ptest as well if it isn't too invasive (doesn't add new
dependencies not in oe-core).
Initial glance says it is just pytest and setuptools:
https://github.com/pypa/wheel/blob/main/pyproject.toml#L46

>
> Ross

--00000000000017d46e06387ac021
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 26,=
 2025 at 3:20=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 25 Jun 2025, at 00:13, Tim Orling via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> &lt;tim.orling=3D<a href=3D"mailto:konsulko.com@lists.=
openembedded.org" target=3D"_blank">konsulko.com@lists.openembedded.org</a>=
&gt; wrote:<br>
&gt; * Removed vendored packaging in favor of a run-time dependency on it<b=
r>
<br>
I=E2=80=99m guessing this means we need a RDEPENDS on python3-packaging?<br=
></blockquote><div><br></div><div>Good catch, thank you.</div><div><a href=
=3D"https://github.com/pypa/wheel/blob/main/pyproject.toml#L28">https://git=
hub.com/pypa/wheel/blob/main/pyproject.toml#L28</a></div><div><br></div><di=
v>v2 in the works.</div><div>I will try to add ptest as well if it isn&#39;=
t too invasive (doesn&#39;t add new dependencies=C2=A0not in oe-core).</div=
><div>Initial glance says it is just pytest and setuptools:</div><div><a hr=
ef=3D"https://github.com/pypa/wheel/blob/main/pyproject.toml#L46">https://g=
ithub.com/pypa/wheel/blob/main/pyproject.toml#L46</a></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
Ross</blockquote></div></div>

--00000000000017d46e06387ac021--

