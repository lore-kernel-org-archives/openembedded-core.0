Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E51C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 07:32:45 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.3013.1745393562326549771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 00:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CsKSSWh0;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso59258741fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 00:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745393560; x=1745998360; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3V4zoBtkBhaHyfOTYwTRp8QdxSR9xTp/FirRGnRam7k=;
        b=CsKSSWh0HT4uXLp6AuUQNDFTbPCdJDUfBbnzTQsuA65GvIKigJaKt32Pi32S+k/3z4
         R+wj+AI0DnGTN60/rvfts49qs51WmyWG+bP8fePrfS63eAbFymHttRBNUAyTOfJOQxNJ
         1fhkLyhgNHIiUchSxXF5fOk7MAQGWs6lgZeUslLAV+6BmYW2q62SnNG4lj2a4ospbpGl
         PlyoLr4Vw18aX3K50H2z8V5mDR4Yz7onI/cSNZcrfc5CVMJTJ6oLyBJVFQzc32Z0Bjc5
         lKYl9yxhLFfLEhkvtQ5kRb91HmS7WL0CkbNT1WxA4ArhC7mPVnb8qv55/dLr9Fg8QqCJ
         D02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393560; x=1745998360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3V4zoBtkBhaHyfOTYwTRp8QdxSR9xTp/FirRGnRam7k=;
        b=jExXXbFWa2eA8OG9m/0crBarz6Dq1HIYtGzbOnhKDTcU7W6iqBVfyHwn3w0hWymnfL
         2pmrV6sYAO6Zh3AgmbrjvzDbQ8dX2d4uTv5oIqBS4mBALllupNsUd5wQZUhq9P/mtQKQ
         mjFK3IPjpHk2Za2gMXpH2tJ0zWiTv6KFqNEffQKJJ+CesU9SL5rO0qutJz43waC90rh8
         pEsYFT0n2B4Goil355Sz88onA8O4BryOYGcSbVYnwATERfGlC0Zelx70UfzspIMHnOyt
         LVHCk7jUnPSwcISiYQ/mNiAlUesZg7skeuRLo4aXPn/UTtvH+fA3S3X/Rlg6iuBMTwiR
         3ZNA==
X-Gm-Message-State: AOJu0YwMnF41qzr7SWvhRO46lxfnzu/mWMWMhI+SZcovqg/Ds+lj1wb+
	qzWeUBg6WZ048R8jLMBhuEKVGAheVKN3gGAeljX6E59UyWHpNVyorbRT5fA5Yz3tnGB94RjDzpg
	LEGhn7hKjcArV7K3YHQmWJmcsjgU=
X-Gm-Gg: ASbGncubk9ZC5I5lbpiI1nd3/7OzoD4XdaG9Yv891idHgP4A1ipxR+oDaJd24+gN1+N
	2yCDpqCOFs2Cdp4cxrNlhuL3bLhoAvH/ToYuE9Frs6vN+VeZMPMF4Ewgmg3RaKTgU8MydxKg0O7
	VoLrN/YbxbTrd+A9d+qb6DhA==
X-Google-Smtp-Source: AGHT+IHsUoPn60+tAu6orNrwPWBBo8Yd5qubYPgbVNN8LUGLyJF69CamH3sdTdeyEJbkMFvQxOP7NYMPyj4eCUVJmcY=
X-Received: by 2002:a2e:ad86:0:b0:30b:d44d:e76a with SMTP id
 38308e7fff4ca-31090553ed6mr69013261fa.25.1745393560130; Wed, 23 Apr 2025
 00:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250422212432.3495828-1-patryk.seregiet@gmail.com>
In-Reply-To: <20250422212432.3495828-1-patryk.seregiet@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 23 Apr 2025 08:32:28 +0100
X-Gm-Features: ATxdqUGq6oiuSUq2m3f8cgNDHhmAHUoxa2NMuK0era6s3pUsb9oM04x4A6BVOSk
Message-ID: <CAO5Uq5Rx7123yf+iKieWab9nrpteHDzDrhCO+LodowPX2BGp5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: fix FILES to drop RDEPENDS on
 full package
To: patryk.seregiet@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 07:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215263

On Tue, Apr 22, 2025 at 10:25=E2=80=AFPM patryk.seregiet via
lists.openembedded.org
<patryk.seregiet=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: pseregiet <patryk.seregiet@gmail.com>
>
> linux-firmware-rtl8723 and linux-firmware-adsp-sst
> contain symlinks to files that were previously
> packaged only in the main linux-firmware package.
> This caused both subpackages to inherit an unintended
> RDEPENDS on the full package. This change resolves the
> issue by ensuring all required files are correctly
> included in their respective subpackages.
>
> Thanks to Peter Kjellerstedt for figuring out the rootcause.
>
> Signed-off-by: Patryk Seregiet <patryk.seregiet@gmail.com>
> ---
>  .../linux-firmware/linux-firmware_20250410.bb               | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> index f12bb2c6d3..7e5c4e25a0 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> @@ -1253,6 +1253,7 @@ FILES:${PN}-rtl8723 =3D " \
>    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
>    ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
>    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin* \
> +  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821c_config.bin \

I think Peter's suggestion was correct - that file (or pattern) should
be part of linux-firmware-rtl8821, not linux-firmware-rtl8723:

  My guess is that the files matching
  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821* should be included in
  the ${PN}-rtl8821 package instead.


>  "
>  FILES:${PN}-rtl8821 =3D " \
>    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
> @@ -1760,7 +1761,10 @@ RDEPENDS:${PN}-ice      =3D "${PN}-ice-license"
>  FILES:${PN}-adsp-sst-license      =3D "${nonarch_base_libdir}/firmware/L=
ICENCE.adsp_sst"
>  LICENSE:${PN}-adsp-sst            =3D "Firmware-adsp_sst"
>  LICENSE:${PN}-adsp-sst-license    =3D "Firmware-adsp_sst"
> -FILES:${PN}-adsp-sst              =3D "${nonarch_base_libdir}/firmware/i=
ntel/dsp_fw*"
> +FILES:${PN}-adsp-sst              =3D "\
> +    ${nonarch_base_libdir}/firmware/intel/dsp_fw* \
> +    ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin \
> +"
>  RDEPENDS:${PN}-adsp-sst           =3D "${PN}-adsp-sst-license"
>
>  # For QAT
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215247): https://lists.openembedded.org/g/openembedde=
d-core/message/215247
> Mute This Topic: https://lists.openembedded.org/mt/112403940/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alex Kiernan

