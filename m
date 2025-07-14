Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5A4C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 18:09:44 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.85097.1752516580878427254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 11:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DHR8cKuu;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e8275f110c6so3356103276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752516580; x=1753121380; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ieDYuDvv6mLx88SuSfS2CblU/Q3dh3P6DMyCykiGts=;
        b=DHR8cKuu3avQ8lEc5n4z4/QRCDSauXPYppeM1CC7m7zViT8ZTZUEtXTat+nYsNhojf
         l6qVZVkGvG8ukY3XUuxPz6+Vhm15ITpzJz4F766lnmyv1tSvS78hbrkp6PbzFYgtzK+x
         AAcKoux0XDBt8uHOd8l9pirntae+nHW02UhnQnqoL0rutNliGNZrL1SeK8nrK/eEsbT/
         F1smS/FW/glOIJcTjQxCLSRc1de6rDUJaTnFUYWH42TFkc9uWKTaq0FvondZgwPWoQsA
         5N/UxliLz8KA/RG9YZYIElBJFGJKpWK703GSb25MVrEXFoqI4fgITrcGd6Ns5pHAiZer
         EU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752516580; x=1753121380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ieDYuDvv6mLx88SuSfS2CblU/Q3dh3P6DMyCykiGts=;
        b=L+sMoI9AQPk0gLSZfXDhHQ5GRZqNZfwMph9cqLvbIh/qQgkq+I8pgCsQYDNH/Uea/h
         TMHO5x2eKmCKJD8as7gbKyCV0SVfxySeSvzEWMnLnopTimQVwWhs+912j0FhFwcFyZHg
         Hd5+2gyjYLIdD4ZUwjmU83fcI65be/9k2mKtmd8IGlHe99wrZ4bLgIoCd79RVgeO7ev9
         PTwBAlT9ypGfnMsSkJd5RHdSu2qB+DkPg89iTdhSrvHkgSZr4fMQBOQ29WloXstoEMgz
         W1vbdIOxSrNvaNgOUkxdlFpkX+RBPPfN7zSwBTF7GjNEqb1XI0T60D+7uZwx2wEwWLCY
         zaZA==
X-Gm-Message-State: AOJu0YxsCknBkQr7TGkcBXSjaoA10+mSmMWuJdeOA7yOVmNsWNnA5FO4
	7z6uKxzjtmlLXrv877ZRkV06+WBbbHKARwcwIycS+x8qSfQ8RZHTe0iip9XSTGF/dtJcvAar2wL
	6+QiKlP8kPuonsVsln05o6oxaGi15uZU=
X-Gm-Gg: ASbGncvUx4W/HPVuRar7bpUZz9UC46r7BA2K5zzYV5pQfdAOKc3c47CIqGi/WSoiNjn
	xhlzt4X4bIAyMaULoEXlF1v6zGgz1b73x7nEHw9sNSMl6rd+3pko0zJSws+1+Yyv85nwwjVZIH8
	NbfRCCJBX2Fd8oxm2Nfb6FuL2bj+y6wAU8lRVu4MrRVHnnXWRVXdznRxRzUAHRPYcmnqz1Pouil
	Dhc/dY6cq0kp6q+WHBN5FiwiT1NgYwi+LQ=
X-Google-Smtp-Source: AGHT+IGpEzc92FGeH3F4zRvwuoqlZleWO2x8FgCYlyMfOvMBb6mwja5TKtm2h/EpY3RUHumH9q6ziglltuozgIDa4nw=
X-Received: by 2002:a05:690c:6e06:b0:70c:90af:154 with SMTP id
 00721157ae682-717d5dac9d1mr244754247b3.20.1752516579490; Mon, 14 Jul 2025
 11:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250714120225.1113086-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250714120225.1113086-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jul 2025 11:09:12 -0700
X-Gm-Features: Ac12FXx4b-WcM3me-Jh3fmYsE3aEyZK2LVjh_pB0A9x5uGhbdZ7dLGEY9rozhRI
Message-ID: <CAMKF1sr8Anofw06MMwbVW0fJt6dG4WATOyFhOKud5hF1VWyXjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Add flags to CFLAGS instead of CC
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 18:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220260

On Mon, Jul 14, 2025 at 5:02=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> Recent changes mean toolchain variables are initialized via inherit_defer=
.
> It is therefore no longer possible to add to CC using the +=3D operator.
> Instead, add to CFLAGS.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/glibc/glibc_2.41.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/gl=
ibc/glibc_2.41.bb
> index 7771fac0412..0852bb4bdbe 100644
> --- a/meta/recipes-core/glibc/glibc_2.41.bb
> +++ b/meta/recipes-core/glibc/glibc_2.41.bb
> @@ -111,7 +111,7 @@ do_configure () {
>  }
>
>  LDFLAGS +=3D "-fuse-ld=3Dbfd"
> -CC +=3D "-fuse-ld=3Dbfd"
> +CFLAGS +=3D "-fuse-ld=3Dbfd"

This works ok when ld-is-lld is used as DISTRO_FEATURES so I am good with i=
t.

>
>  do_compile () {
>         base_do_compile
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220225): https://lists.openembedded.org/g/openembedde=
d-core/message/220225
> Mute This Topic: https://lists.openembedded.org/mt/114145812/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

