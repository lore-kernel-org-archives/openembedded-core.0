Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF918C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 18:54:12 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.23034.1741892048406155838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 11:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Awnq2Yud;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5fea43da18aso333292eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741892047; x=1742496847; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ywQBkWmzfloYDpe7mgZxB6dY5V1jQ48hpZxgUmsoVU=;
        b=Awnq2YudIatsu+4TPCYjRVwRD43bQzb2TSRHrmlwWT3yIIhMz913p9RUQQ2QovLqsQ
         +KuOPOdHzUEVbEwzpzsQ3KonEdcnAIZUmB7tv2c31BvaooYX98pZttrFni6LIuJzCy+w
         GvMDuJqLrfQam2v2+48nv57w6xIOthSeBCiyESEGfu6DzIT0zFCcPGn5xiiPWg4JKV1z
         oPqdI9POkJ9o5wmcolzBUVhLUrznZM1BQRv2rs4FkI90yUXv2aT8BOPy243w5+N0Ac9H
         KWwekRpdGvRGmhpbnBAZwazJQrd1Zp4Zlyi6Qo8kr4sEMPLCNCTok7V58Y2fd1KlUwOX
         tD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741892047; x=1742496847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ywQBkWmzfloYDpe7mgZxB6dY5V1jQ48hpZxgUmsoVU=;
        b=bliAn3joyQk4DwEgo5tg8QAlW93AJHEzr/7F5ucx9QdN9+ILYQOf3s8AMMPgn4l/yA
         A862ZxJJkx8JWbYTEFeWF90VEQPG8atGghZfb1uMXPNyi/8/DJUxAWXhinTGwuEgOIPQ
         YLoaAkPAnWHOdvbvc+zrVB5OcCnYI6lguivxspdyc7/npBup1tUlLXtd1qMVba4M1Oeb
         1MMAoLcszSjdZ1DZoaCFZf+xT2SNQfefJeAegcNOAqGlQa5i8SQVnDiGSc9SlqVJhyR+
         5VdlqErINyC1yDcpcuE/aK6RB0YAzQUOUslXOWrL3/eBwySwLNnz0lvkZ3c+c3ev1Whw
         n6vg==
X-Gm-Message-State: AOJu0YwUEqJbH2qQXzHvFKgrSQwbrdX69gCPZzIfTtsiVFfk3xZRr7Ea
	s/XeoQs2LWbGamw25DIMKiQUr6+YYaaHykU2UU8EYiHMvPTqfnTZ7hHW73jj/E3dx8cHDI+Sbwi
	DXlyVgdzO81iD9IJnux8ioP45Ug0=
X-Gm-Gg: ASbGnctu8rJJUVp8oY9CbVxDWZyUwBqfjCFsARkqQcM8I4n7vsQvQipLEvSKFTMyibO
	Q0cNgPrq1vWNKppZPH3uZHBFraMBoz4Si9lcoZrBhE8frZz+HIEIgVgHeGWEK44HW0minbg2Adb
	frC8AUzgIM57pVEuLCZFjYZvah8w==
X-Google-Smtp-Source: AGHT+IECD55SmbMwll3wu1BWqrUro2JBU1wWMAUlQYxwVjBLtmzO89VYdLbz756pSgcUpmseCMTs2DAVBYku5Bx2N4o=
X-Received: by 2002:a05:6808:3a07:b0:3fa:adc7:1ec with SMTP id
 5614622812f47-3fda224d40dmr416777b6e.18.1741892047366; Thu, 13 Mar 2025
 11:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250313174036.102942-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20250313174036.102942-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Mar 2025 11:53:41 -0700
X-Gm-Features: AQ5f1JrzN3YTdRpi63e_Wg5pCgJ-WPDbnKRbuZpsUGTBM_jXdWK3OSGVbXjuGNA
Message-ID: <CAMKF1spz6WgF7aEPqvcBER5PZibVXmZaCKoAg1wU9k4NBtqJKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tcmode-default: eliminate needless
 linux-libc-headers version defaults
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 18:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212804

On Thu, Mar 13, 2025 at 10:40=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Manually setting the preferred version is not required or generally a
> good idea as stated in:
>    meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>
>    # You're probably looking here thinking you need to create some new co=
py
>    # of linux-libc-headers since you have your own custom kernel. To put
>    # this simply, you DO NOT.
>
> so remove that for linux-libc-headers.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index b43d5ffe8b..cbe8442cde 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -12,7 +12,6 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>  GCCVERSION ?=3D "14.%"
>  SDKGCCVERSION ?=3D "${GCCVERSION}"
>  GLIBCVERSION ?=3D "2.41%"
> -LINUXLIBCVERSION ?=3D "6.12%"

I think this is quite commonly used than others you were removing.
Mismatched kernel and kernel-headers
do have resulted in issues and BSPs do not match up to the released
kernel in oe-core. While I am fine with
this change, I think people will still need it, although a bit unwieldy now=
.

>  RUSTVERSION ?=3D "1.83%"
>
>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> @@ -30,8 +29,6 @@ PREFERRED_VERSION_nativesdk-gcc ?=3D "${SDKGCCVERSION}"
>  PREFERRED_VERSION_nativesdk-libgcc ?=3D "${SDKGCCVERSION}"
>  PREFERRED_VERSION_nativesdk-libgcc-initial ?=3D "${SDKGCCVERSION}"
>
> -PREFERRED_VERSION_linux-libc-headers ?=3D "${LINUXLIBCVERSION}"
> -PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D "${LINUXLIBCVERSION}=
"
>  PREFERRED_VERSION_glibc                    ?=3D "${GLIBCVERSION}"
>  PREFERRED_VERSION_glibc-locale             ?=3D "${GLIBCVERSION}"
>  PREFERRED_VERSION_glibc-mtrace             ?=3D "${GLIBCVERSION}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212798): https://lists.openembedded.org/g/openembedde=
d-core/message/212798
> Mute This Topic: https://lists.openembedded.org/mt/111684601/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

