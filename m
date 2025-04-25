Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA769C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 20:36:01 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.972.1745613355323899294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 13:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mDxNhbgC;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3feb3f54339so2642187b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745613354; x=1746218154; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oq60tHwZPiGToiRT/iLbwjUAhC/ws9EEZY6ycQJTrw=;
        b=mDxNhbgCMi5ltsDA0cBYaX0vstetR41WJTZM8y83FpUInAgQ8MZQnfS/dsFbbQznaS
         CqGp5svdjBK2Gv9eFRea2v/GixlT+rmnIcFObv/Gp1nwvTuUv93UAOvYB60N5SQ/CUVu
         E1rqrm4MOoZnU+pHjYd8+x+fhfgHhtony4TC18VqilYThAmGK0sJzMULLHUQ1gTkRtcK
         w0FOMrY3XuIDRMLOIDxpnX+24QBAo/pdDOAdhlVyW3jSjDAvRfT6br5hj+3It9lBCQow
         FssMOvdLwIv8xc9sUwgMG6APEsu6LcpCVZmBNaG1IUVUYaZA32dOMziB9zg2V3z1Zed/
         tc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745613354; x=1746218154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oq60tHwZPiGToiRT/iLbwjUAhC/ws9EEZY6ycQJTrw=;
        b=Mzdj9sSvW783tksswBOvWfkMqiorP/MHsTevrmbuNWgUM/BcRmbMPr1Qqp5fHc2Kf9
         Uu5CRkTJA1kaMkES6h18eMth5Pz2sZ1XR5GUfY4OU1OwNjt17rUUhWtWtctnnbG6xakj
         f/bdub6DW9+sGp0RlNOJ6upsZFNM9Yo9bAbVH6/+FbhJH5IDzxtOEV3+7qM3Df7Wq0Qr
         dYRwZWGtHTfbVfHdH0TLqxHzNaeqZ2q+/m26yT1C0ncys3Z7t0cEVB/xMb4fc8npiPSY
         A2TL2adPyENfpKiZCcmLevyQ+8iGBe9Gj/MwlhryyoHpDBC1+M3malAPrMm86dSjUyYL
         gUoQ==
X-Gm-Message-State: AOJu0Yz1gYeNV2wa1MxEihL964uPL0uqwZjGz3Vl1dxNjH9XwYaAVxZC
	fKqnsSm8IIlASgP2MsU1E92vrvTEwdAdncCucfRgwV1eTbJJxj+OOM2TKTMZHR25u3Rw8cf0cOu
	9HVhXoB5iMWMvwftsaktYa4glmOE=
X-Gm-Gg: ASbGncsd5ciTcx1U1sYxYhGt6z00LMa2JZH8F1ST8F3zOMW6dBlVjyyBkgjA8DBCAQV
	Odr4jE78S4ZJR+6h+ZwmMIJ8fELIr97hVT4G327KbAnYqdgRj8RGfUiXbx57qlAfXGdytgiTO78
	D0W3kSFI+6Y0zdKBt85sZ0
X-Google-Smtp-Source: AGHT+IHQav6e1GBhy4keeX+IkDp30F0+c48+JCITORE6h6fGSN6Cdg+MSZ0WcOb0wBuX7k/UAKai8JDLoYgJAjtrB3o=
X-Received: by 2002:a05:6808:2348:b0:3f6:ea63:6a6d with SMTP id
 5614622812f47-401f28ae1cfmr1992872b6e.22.1745613354446; Fri, 25 Apr 2025
 13:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250425112350.3626731-1-ross.burton@arm.com> <20250425112350.3626731-3-ross.burton@arm.com>
In-Reply-To: <20250425112350.3626731-3-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 13:35:28 -0700
X-Gm-Features: ATxdqUHMoGM5qZQ8D6NAQ3lFJdrbJi4-t0dpJUWufr8OqGJJ0Y29n2J6c8nXOo0
Message-ID: <CAMKF1so6+82R9EOEQnqqqY2332dW3oTYxoUqeHjJsLE0BJhcPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] libunwind: fix build when unused sections
 are garbage collected
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 20:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215496

On Fri, Apr 25, 2025 at 4:23=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> poky-tiny uses gcsections.inc to strip unused sections from the
> binaries.  However, on qemuarm5/qemuarm64 with poky-tiny this appears to
> result in too much being removed and the link fails:
>
>   ld: .libs/Gtest-trace: hidden symbol `__aarch64_cas8_acq_rel' in
>   libgcc.a(cas_8_4.o) is referenced by DSO
>
> Work around this by disabling gcsections.inc.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/libunwind/libunwind_1.8.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.8.1.bb
> index 38022569df2..b22cb30646e 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
> @@ -32,6 +32,10 @@ EXTRA_OECONF =3D "--enable-static"
>  ARM_INSTRUCTION_SET:armv4 =3D "arm"
>  ARM_INSTRUCTION_SET:armv5 =3D "arm"
>
> +# With qemuarm64 and poky-tiny:
> +# ld: .libs/Gtest-trace: hidden symbol `__aarch64_cas8_acq_rel' in libgc=
c.a(cas_8_4.o) is referenced by DSO
> +LDFLAGS_SECTION_REMOVAL =3D ""
> +

While it seems to be fine here, I wonder if it should be in
meta-poky/conf/distro/include/gcsections.inc as well.

>  LDFLAGS +=3D "-Wl,-z,relro,-z,now"
>
>  SECURITY_LDFLAGS:append:libc-musl =3D " -lssp_nonshared"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215456): https://lists.openembedded.org/g/openembedde=
d-core/message/215456
> Mute This Topic: https://lists.openembedded.org/mt/112449133/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

