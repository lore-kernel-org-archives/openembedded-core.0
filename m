Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2A1C369D5
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 11:56:36 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.3254.1745395004562146393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 00:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nkvdnuDg;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: patryk.seregiet@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5b8d13f73so646325785a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 00:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745395003; x=1745999803; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElHcI39+ceVMsNhf5zv7teWBuU/0l/UZTSSrITGRypI=;
        b=nkvdnuDgde6AL8PjqEwDeRwiIElBshO9rKawOCc+89qy3lR6ePxXpG9GVUGrxdkZg8
         LdPVrvSh2QiLEj/SnKedRvCLt/J0yq0dGPjt8UHJi09D0ot82JyqouBOep9tAGhHmUEg
         QcLfEylbm7tlvNfENMq9AO6BptbjGyHDgEjXJUnK23HMm479azFWVq21gABkkw6ODWz2
         aGM9TYc/xWn2v1At6HYHTCyRNkXyiYTncDp8m2f7+lTHwxxSYRSiKVGs289lwm/JXPlr
         nWeO2aY0yIwSWyrKeSM8Uc+Do/mZRQCJ3Z03UXNLo4S4yWxeb1fF/LCf1pmDaVpxb2S3
         Dn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395003; x=1745999803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElHcI39+ceVMsNhf5zv7teWBuU/0l/UZTSSrITGRypI=;
        b=vJBMP+Cw1JNHkgp46IPc27cqXZO8AQLjzScXtkSF9Ytxg6bAu2IOW753MLJjw9V+Jr
         Ccv1jJcnZB/E6CMB+WohxMCqVtr+8G82uEOX/dLvLuPCJMFTtirSrARiIiNJ0CLZ7QlA
         b0ELo4OVTFYd/tSNO3tATU1tpEVBOmpkgYAJt2BDZYPVh+X6SCmOpsmji8GdcLXJrw3A
         7SKc1HqRwospP1c/lS8OXb+Rt9dTa/Zd+wtD8I4PP5ZvJsIbOlmFNrIFn9cS3juOSUBp
         0dzgxFZXvyHpu1uGfQezav+YMZpIT07yEfswyqyIa/aKpJZZTadI/diGiKtg6/axy7Yu
         FTuw==
X-Gm-Message-State: AOJu0YzISsG3T2NCOdu2+d0tgdbvzc76BuE69OitbeL95tFRUevlMtlO
	FUcTD5oBsnB46ezShhG/A3v7Z/47yRXhYtCh7nZoQojjcWLFknjH0USI3fn1AV/mQzsZtgp0IRX
	G5OyLMJiiBQ3myUHQxFO2tXPcj98=
X-Gm-Gg: ASbGncvn9PiINw1Ivx932fLA5wTFABG6EmUDdskL4Lc7N9bhFyz9SvUhkJ988+nKHFn
	6VyJ1FjWLdO4jxSQARgA4fHz0K7OkVS99gt5B/1NouW4TCGKiIFlFTXQPKV0wyoVYaMLZAvucGS
	z9ShK3+poMbPWq04UAmziSpQ==
X-Google-Smtp-Source: AGHT+IGAjHWlcf0MP/CckHZKDS+m3H2HqFzABujO5OIb42KlqYfhubAHJ9gBHyYNNtyCQCFlrCFJtm3/jj1Q2oOxdO8=
X-Received: by 2002:a05:620a:2911:b0:7c5:5fa0:45f6 with SMTP id
 af79cd13be357-7c92805f2a9mr3274390085a.50.1745395003390; Wed, 23 Apr 2025
 00:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250422212432.3495828-1-patryk.seregiet@gmail.com> <CAO5Uq5Rx7123yf+iKieWab9nrpteHDzDrhCO+LodowPX2BGp5g@mail.gmail.com>
In-Reply-To: <CAO5Uq5Rx7123yf+iKieWab9nrpteHDzDrhCO+LodowPX2BGp5g@mail.gmail.com>
From: patryk seregiet <patryk.seregiet@gmail.com>
Date: Wed, 23 Apr 2025 09:56:32 +0200
X-Gm-Features: ATxdqUG2LAeOPGc3Yu7ESfTBGvlLYRgzcI48XibMRMI0kjR7xS8SqbiNNmyl0KU
Message-ID: <CAOf3PZyaOBitwamu2tpAYdFOrFGLPNO1ySQOyuzpTdvWxrtgjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: fix FILES to drop RDEPENDS on full package
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 11:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215283

Hi,

Yes I agree, makes sense. This causes rtl-8723 to RDEPEND on rtl-8821
which is fine. I'll send an updated patch

Pozdrawiam / Best Regards
Patryk Seregiet

=C5=9Br., 23 kwi 2025 o 09:32 Alex Kiernan <alex.kiernan@gmail.com> napisa=
=C5=82(a):
>
> On Tue, Apr 22, 2025 at 10:25=E2=80=AFPM patryk.seregiet via
> lists.openembedded.org
> <patryk.seregiet=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: pseregiet <patryk.seregiet@gmail.com>
> >
> > linux-firmware-rtl8723 and linux-firmware-adsp-sst
> > contain symlinks to files that were previously
> > packaged only in the main linux-firmware package.
> > This caused both subpackages to inherit an unintended
> > RDEPENDS on the full package. This change resolves the
> > issue by ensuring all required files are correctly
> > included in their respective subpackages.
> >
> > Thanks to Peter Kjellerstedt for figuring out the rootcause.
> >
> > Signed-off-by: Patryk Seregiet <patryk.seregiet@gmail.com>
> > ---
> >  .../linux-firmware/linux-firmware_20250410.bb               | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410=
.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> > index f12bb2c6d3..7e5c4e25a0 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> > @@ -1253,6 +1253,7 @@ FILES:${PN}-rtl8723 =3D " \
> >    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
> >    ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
> >    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin* \
> > +  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821c_config.bin \
>
> I think Peter's suggestion was correct - that file (or pattern) should
> be part of linux-firmware-rtl8821, not linux-firmware-rtl8723:
>
>   My guess is that the files matching
>   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821* should be included in
>   the ${PN}-rtl8821 package instead.
>
>
> >  "
> >  FILES:${PN}-rtl8821 =3D " \
> >    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
> > @@ -1760,7 +1761,10 @@ RDEPENDS:${PN}-ice      =3D "${PN}-ice-license"
> >  FILES:${PN}-adsp-sst-license      =3D "${nonarch_base_libdir}/firmware=
/LICENCE.adsp_sst"
> >  LICENSE:${PN}-adsp-sst            =3D "Firmware-adsp_sst"
> >  LICENSE:${PN}-adsp-sst-license    =3D "Firmware-adsp_sst"
> > -FILES:${PN}-adsp-sst              =3D "${nonarch_base_libdir}/firmware=
/intel/dsp_fw*"
> > +FILES:${PN}-adsp-sst              =3D "\
> > +    ${nonarch_base_libdir}/firmware/intel/dsp_fw* \
> > +    ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin \
> > +"
> >  RDEPENDS:${PN}-adsp-sst           =3D "${PN}-adsp-sst-license"
> >
> >  # For QAT
> > --
> > 2.49.0
> >
> >
> >=20
> >
>
>
> --
> Alex Kiernan

