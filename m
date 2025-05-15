Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E733FC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:36:14 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.12489.1747316165842406220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SFj70QmI;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6060167af73so677102eaf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 06:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747316165; x=1747920965; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xIbaZdeQb/udIe8b85JvE4bDWGdV0QZonya+c7RNmZo=;
        b=SFj70QmIS7A+4gOzgl/IOKRVtkk7KV3VpvEbfqNYb/S3EGkHuwicKgUyne+DWHNWh7
         opG7b5mG7fI+8gDwdrl4Yrg4Y6aOEQSnTLDT8M+KzqisdjXSPRdqg59wiMMvDF4muYhg
         Ncfuzpw+ZewCwRslKJnAvIUlZKBUK9IFqZK9c1rCrdU4e7ga6yMhJ8U+5nzC2rBhEW4t
         LhBu434nEFiuMfvjz7zJ/tHYXs4JYArlwpLmkGd+EBKEp5CE7hC/hVLb4vGCInirUGW6
         VThYr7C4JEgNQNbOr5C8n+koB5YJXVBsDKvuS9ET2ddK4iOSbcFYtQyejfxNmKrCZU4O
         DyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747316165; x=1747920965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIbaZdeQb/udIe8b85JvE4bDWGdV0QZonya+c7RNmZo=;
        b=OBvSw+QDXvgf9eE0DpDPE27On2M9LH4wBIE5ZFuy8+6JVz0Rz1YXB5VVqm47ky9thK
         ATt2cPR0KBOkQPxEl//gel+X7UGklUgygLoyfcYatedTTwt5MdGNAviRSRFhyrmSdssB
         Nd6J5Yh8mZErIdcVdm6Z9WaM6eI4o9FXrhFsIN92hIBRoHqYXW520JnyshR0bIimw6as
         TN1Q7eEyJm5D85RgSH3CFKaVKRV+0+gyj9eRCWA0VhE6icbQCds54LGa/DVn7p4f8uxT
         Ev1c9WT1sOuzViYYWw3YVKf7rl3abUMeXPdxTaK1k8t94S5svW9U/bIlZHTY6SvHI0Q0
         zjrg==
X-Gm-Message-State: AOJu0YyP+zb57+RDxT1GtNF4soBNCEVXBVwfAfpRX0JpVF14/xsJAkwb
	Jg4ZmICjarQsnGt2EwH7vHoG9ngsnqQxrJa6jelqdthAZCNwPZa74aQvocgyVmbpWGWBtJS9won
	iMK5AWy5F6NtwQJG+4KRrOGpQY0KKyHJ6
X-Gm-Gg: ASbGncsXq/kNuDVLVQT+AAiz9SgmeaLvZIy++RCFkeCWSVj4jCuMuvNYZ2wCdu9x1mI
	s4KSFT3ICwq+vyJqX/BCYm1TFFlRgAaPsuSR3EARbGoYl1pQ/QuO7/NF9iEJUbeEAL2OlCJks+W
	nbMUjeBd1D4FHgj+boCpM+t44w1XtXofX6JDHe4jQUfFc1EB88QUkrzzL7PioUkLRDkA==
X-Google-Smtp-Source: AGHT+IG+lKuW+0KRD99u+bujVGW6tOZ0BIUu6LaAfiU0QfMl11P6LQP6RL8tqL26FMCvSrHG+ocKsfH5DoY9iMSEKSw=
X-Received: by 2002:a05:6820:8c9:b0:606:6384:555c with SMTP id
 006d021491bc7-609df26c6d5mr3905063eaf.8.1747316164665; Thu, 15 May 2025
 06:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250515083422.113413-1-raj.khem@gmail.com> <f5e409fb55000274ac0bcb5f6b56b29102b2135b.camel@linuxfoundation.org>
In-Reply-To: <f5e409fb55000274ac0bcb5f6b56b29102b2135b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 May 2025 06:35:53 -0700
X-Gm-Features: AX0GCFuiJHqRrMIcf07FjOUq1CkQ5_V75EriOorDX_EkOensF-YOQb7nLYy6E38
Message-ID: <CAMKF1soMUYBET_2SaUEHVf+ThiTf97muhsNaH8J+K-8WF1S4sg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] opensbi: Pass CROSS_COMPILE and REPRODUCIBLE flags
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004e287706352cbf3f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216676

--0000000000004e287706352cbf3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Perhaps you did not use v2 ?

On Thu, May 15, 2025 at 5:22=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2025-05-15 at 01:34 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > When using clang pass LLVM=3Dy to makefile so it can select needed bits
> > using clang
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: HOST_PREFIX instead of HOST_SYS is needed
> >
> >  ...lag-for-reprodubility-compiler-flags.patch | 49 +++++++++++++++++++
> >  meta/recipes-bsp/opensbi/opensbi_1.6.bb       |  8 +--
> >  2 files changed, 54 insertions(+), 3 deletions(-)
> >  create mode 100644
> meta/recipes-bsp/opensbi/opensbi/0001-Makefile-Add-flag-for-reprodubility=
-compiler-flags.patch
>
> This breaks the builds:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/77
>
> Cheers,
>
> Richard
>

--0000000000004e287706352cbf3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Perhaps you did not use v2 ?=C2=A0</div><div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, May 15, 2025 at 5:22=E2=80=AFAM Richard Purdie &lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2025-05-15=
 at 01:34 -0700, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; When using clang pass LLVM=3Dy to makefile so it can select needed bit=
s<br>
&gt; using clang<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: HOST_PREFIX instead of HOST_SYS is needed<br>
&gt; <br>
&gt; =C2=A0...lag-for-reprodubility-compiler-flags.patch | 49 +++++++++++++=
++++++<br>
&gt; =C2=A0meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.6.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.6.bb</a>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 8 +--<br>
&gt; =C2=A02 files changed, 54 insertions(+), 3 deletions(-)<br>
&gt; =C2=A0create mode 100644 meta/recipes-bsp/opensbi/opensbi/0001-Makefil=
e-Add-flag-for-reprodubility-compiler-flags.patch<br>
<br>
This breaks the builds:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/buil=
ds/77" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/valkyrie/#/builders/45/builds/77</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000004e287706352cbf3f--

