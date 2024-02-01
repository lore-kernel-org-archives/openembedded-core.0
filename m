Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C89C47DB3
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 02:09:38 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.6180.1706753370843975334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 18:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LprYTQDS;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-210dec2442eso238902fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 18:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706753370; x=1707358170; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vg4R/+WCBvupDY0cBcZdCIQh9yNnxWDXITva9p75SRs=;
        b=LprYTQDSSRIbAS4zEwAqFDjQazROpM0TuEYHDh6u6bCXHYH+iWzB3QTMwSRZTT9QIa
         tNT8rvl6YDrNC499EvLoJaszzL/KOV9ycFw0LBA4Siqc4/2vfvCBVMz/2HmxRgYoTe9K
         yNQT4ZP7x0G9q3PaB5uKcwYtaVVKMxClQJ+sENVH0N2JsBW+PhFLiwvpF/Gl/QGrrgim
         fDYrIqtpVIBAmguNHLXpzw7N2ATK+i7PKwQ8lSJo3pvCSGdQqV0ROP2+eB7/3s5y22kx
         Slx5QNNBXbva3tTxjYwDZJQ3gTKxj49VGJIPaJG6ViGIxG54l/wVDqaSujDtew5bjjPX
         B61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706753370; x=1707358170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vg4R/+WCBvupDY0cBcZdCIQh9yNnxWDXITva9p75SRs=;
        b=BhrrTxpHr0p9/El3QKwwoIQbDTwq4DbpC2VxBtNEbfcfRo97c+1BR/bIMUA3IR8AWt
         nJJFTq/BB7uvlEHhFxQHeDDw0Fr7Ej6oadrzkjx4BIKRmUy0JKl85ZCU8B2XHXr4sypz
         1XcGTOFFqt0N5JXFmaZBeDtjBTQ5q+vtVCUedMlKWavvBbwAOvZ+vO/bNsM96FvHjDLZ
         yil9ixvPnGWaJ8XgAWlbIlVVrnMkLdWVjTqY68KaDrBLEpiUT8nZPLlHRD8Yo0jNBtNr
         DDy9TiPrTWFR5C7v4cXBOImDR6gurWxltKWhtESrSzfd2oRL45tHfr8wzLOw+PxleJ/a
         jDYQ==
X-Gm-Message-State: AOJu0YynbR0Fo2OGrPCi5bk998vOl3QLQ++1W/XsvcuJJX4zZjy2mkCS
	BKYMNwBlOETYYhBI/aKiVEWkcqfxkT1bJaaCn5qVFRjx46GIZZiCW0PQlD2/J3WpcDEbTb/yPk2
	f8bxd2y170zN2owo5HKxjJTxExMA=
X-Google-Smtp-Source: AGHT+IEXGVGaHdm4nR9O0t+Q8ekqVlCu+6be9wU/WIpE3cDMp3Eg/bKGhLXzd1E4gqIZvO9OcktK+VC7LKybmTg+dUo=
X-Received: by 2002:a05:6871:6a7:b0:204:704b:a78c with SMTP id
 l39-20020a05687106a700b00204704ba78cmr1209598oao.51.1706753370005; Wed, 31
 Jan 2024 18:09:30 -0800 (PST)
MIME-Version: 1.0
References: <1706743783-10659-1-git-send-email-mark.hatle@kernel.crashing.org> <1706743783-10659-2-git-send-email-mark.hatle@kernel.crashing.org>
In-Reply-To: <1706743783-10659-2-git-send-email-mark.hatle@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Jan 2024 18:09:04 -0800
Message-ID: <CAMKF1spTk=-ruCfNpxC12skg=KCLF71NbFUY-xa5qRRHX5PkZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] tune-cortexa78.inc: Add cortexa78 tune,
 based on cortexa77
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 02:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194545

On Wed, Jan 31, 2024 at 3:29=E2=80=AFPM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> From: Mark Hatle <mark.hatle@amd.com>
>
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  .../include/arm/armv8-2a/tune-cortexa78.inc      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa78=
.inc
>
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc b/=
meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc
> new file mode 100644
> index 0000000000..8c85d98ef9
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc
> @@ -0,0 +1,16 @@
> +#
> +# Tune Settings for Cortex-A78
> +#
> +DEFAULTTUNE                                        ?=3D "cortexa78"
> +
> +TUNEVALID[cortexa78] =3D "Enable Cortex-A78 specific processor optimizat=
ions"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78', ' -=
mcpu=3Dcortex-a78', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES                                         +=3D "cortexa78"
> +ARMPKGARCH:tune-cortexa78                           =3D "cortexa78"
> +TUNE_FEATURES:tune-cortexa78                        =3D "${TUNE_FEATURES=
:tune-armv8-2a-crypto} cortexa78"

I think this should be set to "aarch64 crypto cortexa78" inline with
patch I sent last week [1], otherwise it looks ok.

[1] https://lore.kernel.org/openembedded-core/20240126233141.1589013-1-raj.=
khem@gmail.com/

