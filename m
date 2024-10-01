Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E89CEACC3
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 13:56:20 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.82005.1727790977624672469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 06:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LqmE9Fno;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so41189405e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727790976; x=1728395776; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9fr4ylVhoZgpj7v1siu6Nm9z8t0kw0JJujd4uisysg=;
        b=LqmE9FnoqzAYLWNn+fqeuMXIRSr8R4SZW/e8ci/gZpbRogJjpsbPT6pm38/IYfwOf8
         NwIjZSYp01GCc/2o297vpifhUrixZo1xiOJ9U+1KpckFXTIi3jOfidsvnOqU9ewNqZOX
         9IrRdI0xdt/trycnGuBOSUAioRETKLaDYtMUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727790976; x=1728395776;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z9fr4ylVhoZgpj7v1siu6Nm9z8t0kw0JJujd4uisysg=;
        b=XTV1W/a9vgnZazfbm97wFrhjXYhm/8VZRNZ5kZmZu2pFP5RzY0V4dsUXbhnGB0fawW
         vM9XmmNNvd93qJPGu1bu5WU1G/8N5GYk4lqwdnJLf3ZtPEDhdn2hPP460xCo2DSC5sF1
         EntC1NEaNT7N6UP8s5Tp3VBV50wcfOWa+t/AxBWywhAul7rXSyy7UzBdCnFEvnn+nKpr
         u4ItIdBPO+s8fJOvv9x4+OUHusb/UkFeNW9icQAGuof6rg51nHUTvX628tkTjkaaOWmp
         CSNh/hzth3QmgG16BgGgBUUKYXmRWgbrL9hDryqSIMqg26Q6cnp+ECyZ5/sk7qNF9hht
         OBmw==
X-Forwarded-Encrypted: i=1; AJvYcCX9PxX/znw0+bG6mSJN+EiHHvR5Df51zXhbJ4evdSnsVyFmPGOu0IxP9UBG7Ngddps+qHjfnbkm3E0FfpE9EqcOiw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwUFHL9w3lSQS1eUzML/o3EqrDL1w8iryPQ/Aomk832XfjPXeYC
	shiiGxgrfnl7oiO9QNtaClxtLUHTQloOiQ6uZXGIh6gau23IHPfFIb7OuawtsBY=
X-Google-Smtp-Source: AGHT+IE1sZSfmTOV68fbRiVeqEQShiDI9jwZIJQoJjIEJanGa7+5U5Xt+GDKB5O9LEY7QnJAsb8W1w==
X-Received: by 2002:a05:600c:1d8a:b0:426:593c:935d with SMTP id 5b1f17b1804b1-42f58409f9dmr113896305e9.5.1727790975855;
        Tue, 01 Oct 2024 06:56:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d? ([2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575dfd2sm11862419f8f.117.2024.10.01.06.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:56:15 -0700 (PDT)
Message-ID: <7feab7358ed78cb749f95cfa9b104e45b50be88e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jdmason@kudzu.us, openembedded-core@lists.openembedded.org
Date: Tue, 01 Oct 2024 14:56:14 +0100
In-Reply-To: <20241001134322.1166436-1-jdmason@kudzu.us>
References: <20241001134322.1166436-1-jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 13:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205168

On Tue, 2024-10-01 at 09:43 -0400, Jon Mason via lists.openembedded.org
wrote:
> Currently, KERNEL_CONSOLE has a default value of "ttyS0".=C2=A0 However,
> Arm
> machines and those using virtio serial prefer to use "ttyAMA0" or
> "hvc0"
> (or something else).=C2=A0 These are usually defined by the machine confi=
g
> file as SERIAL_CONSOLES, which has one or more entries.=C2=A0 Take the
> first
> one of those instead of ttyS0, but default back to ttyS0 if nothing
> is
> set.
>=20
> Also, use this variable in the efi wic file instead of "ttyS0".
> Of note, this changes the default speed of the default kernel console
> from undefined (9600) to 115200.=C2=A0 This allows for users of the
> mkefidisk.wks to work as before but any users of this variable could
> see
> changed behavior and would now need to define this as:
> KERNEL_CONSOLE ?=3D "ttyS0,9600"
>=20
> This includes revisions suggested by Quentin Schulz and Ross Burton.
>=20
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
> =C2=A0meta/classes-recipe/image_types_wic.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 +
> =C2=A0meta/conf/distro/include/default-distrovars.inc | 3 ++-
> =C2=A0scripts/lib/wic/canned-wks/mkefidisk.wks=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 2 +-
> =C2=A03 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/image_types_wic.bbclass
> b/meta/classes-recipe/image_types_wic.bbclass
> index 86f40633ebcb..db598e874ad7 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -26,6 +26,7 @@ WICVARS ?=3D "\
> =C2=A0	INITRD \
> =C2=A0	INITRD_LIVE \
> =C2=A0	ISODIR \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KERNEL_CONSOLE \

I'll fix that whitespace rather than ask for a v5...

Cheers,

Richard

