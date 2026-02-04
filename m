Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6240EA7949
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 22:34:35 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7797.1770244472381969499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 14:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KtjFiHcF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fb2314f52so228669f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770244470; x=1770849270; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5rH93hOM3l13NZY8idiikY56isprSQ8HbIuCiV2Ni4s=;
        b=KtjFiHcFQioY/v5lV4ppxaaoeUqeCqnZOE6318y0DzqO1nsBy9TnrEw8ycnahFVydN
         7+2pbHWmOU64rg1u9Azgs0dryj5BH3JNpAZPwTgt3WA4EjrZzvCX3GQa5ZLREW9cJvS5
         4mUWysCYXjhrC4KZDPSmWaELGRzGzRDpM5YoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770244470; x=1770849270;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5rH93hOM3l13NZY8idiikY56isprSQ8HbIuCiV2Ni4s=;
        b=GkzSPmN8eXtFwSwFZw4H1ILZPrwdgxkswvWfprY143cFfB3ogwm8W8mAHyavwI3s/q
         EiFNnVQhz2F6AjuqG5G5cYlWjtv6uMUkGHK6eu/XBbGDCRHq85q7RzJjjwvSrmkWeRlu
         NZuL3Ri0IIv09IEW7IxLZZKf6OeCs1xG0q6UPfSS/PeVJgb6Xcs3FXDCNX08Vq1mpQ0U
         AKolP0MauJ0FMSuEVP8+7Mvq13ug+vD7+g9hxfo3JmiV9hcVO7cIqbVTlCHQs3KwtN0H
         275BA3536wrGEGZ4RH5k6w4k4xDdU+Jc8m8lNJEATt/Egi5zrr8VQuMTx9/NOYcKf3w5
         Zv5g==
X-Gm-Message-State: AOJu0YwvelfVtMgzKseZCji1fHd240O+5/PTt5SfNOcJbQVltal4MLFu
	YL6FS0NwVsxCiKrN6nQqtjB1awSkFO5+TDmLcOtU3dDIUiTxoKUIWfXGZmtZKvbV9cw=
X-Gm-Gg: AZuq6aJeWl1q1yrMIbCe18NuPUzoaQLJGBbqSORvd8URX6GMAxIKz7k6eToJ68MG8ym
	V9KoiYl7rIirg0cXoCA2k2foAGVw6B9nFmuDiHfyCuNqNZABSFHm3yeXLDCIaNRhqPnzGXJBL6E
	45MomBWPocTEoM4PvrRlNH4iSevCWb9OUKLxiEMQ1bTmy0mYTjVVd+ZaIns11kUfdtpvFKHhREb
	YZ8LbLdVNHh01x5M83ib9fnQG/71EfkX2ENcunYKrDl7sOFEn1fki87qj7RgBt+evygbPVJDcHV
	pFs2o0cRGfnz0QO1oC7lGoLPXSAgLJIe45Fw3Diurgc9eZdwePB8gHdKFhYCXN46UAuJ2N3ETqZ
	883vlKqXaKfUkE0iECcsz2UTQzTAe28FOVwT8yUYJK1McCoub2OslI/SJINtgTKdhmMOeQfiEj8
	ocGtvskNap9mioKjEWOGyszxGbETZo4/A1ZiVYYSy4aMuBUFNzuSEI9DXljkEErZQxcP1XyZhwe
	g8=
X-Received: by 2002:a05:6000:26c4:b0:435:bcfe:b11 with SMTP id ffacd0b85a97d-43617e42954mr6164015f8f.18.1770244470616;
        Wed, 04 Feb 2026 14:34:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d? ([2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm9705890f8f.21.2026.02.04.14.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 14:34:30 -0800 (PST)
Message-ID: <cb907e385cfb6bee2d07bf94102143d4457f75c4.camel@linuxfoundation.org>
Subject: Re: [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to TARGET_LDFLAGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>, 
	changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org, rs@ti.com, raj.khem@gmail.com,
 	antonin.godard@bootlin.com
Date: Wed, 04 Feb 2026 22:34:28 +0000
In-Reply-To: <CAA_5yotUG4nyeAZJ5nx76o+gzXz2xLWHabe1tCaq=DJDxD5otg@mail.gmail.com>
References: <20260204052638.284617-1-changqing.li@windriver.com>
	 <CAA_5yotUG4nyeAZJ5nx76o+gzXz2xLWHabe1tCaq=DJDxD5otg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 22:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230561

On Wed, 2026-02-04 at 15:17 -0300, Ricardo de Araujo (Salveti) wrote:
> On Wed, Feb 4, 2026 at 2:26=E2=80=AFAM <changqing.li@windriver.com> wrote=
:
> >=20
> > From: Changqing Li <changqing.li@windriver.com>
> >=20
> > DEBUG_PREFIX_MAP is appended to TARGET_LDFLAGS in commit [1] for fixing
> > reproducible issue when LTO is enabled. It is removed in comit [2] sinc=
e
> > this commit causes cgo binary not reproducible. But actually, we still
> > need this DEBUG_PREFIX_MAP in LDFLAGS when LTO enabled. So, only appene=
d
> > it when LTO is enabled. Refer [3] for the history, with this patch,
> > patch [4] is also needed for cgo + lto enabled.
> >=20
> > [1] https://git.openembedded.org/openembedded-core/commit/?id=3Dfddaecc=
88979967d0e00e2fafdbaaabec030da9f
> > [2] https://git.openembedded.org/openembedded-core/commit/?id=3D1797741=
aad02b8bf429fac4b81e30cdda64b5448
> > [3] https://lists.openembedded.org/g/openembedded-core/topic/patch_bitb=
ake_conf_remove/117408334
> > [4] https://lists.openembedded.org/g/openembedded-core/message/230059
> >=20
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> > =C2=A0meta/conf/distro/include/lto.inc | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/includ=
e/lto.inc
> > index 227f0c5c2a..cef92901e3 100644
> > --- a/meta/conf/distro/include/lto.inc
> > +++ b/meta/conf/distro/include/lto.inc
> > @@ -49,5 +49,6 @@ LTO:toolchain-clang =3D "${@bb.utils.contains('DISTRO=
_FEATURES', 'thin-lto', '-flt
> >=20
> > =C2=A0SELECTED_OPTIMIZATION:append =3D "${@bb.utils.contains('DISTRO_FE=
ATURES', 'lto', ' ${LTO}', '', d)}"
> > =C2=A0TARGET_LDFLAGS:append:class-target =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
> > +TARGET_LDFLAGS:append:class-target =3D "${@bb.utils.contains('DISTRO_F=
EATURES', 'lto', ' ${DEBUG_PREFIX_MAP}', '', d)}"
> >=20
> > =C2=A0SELECTED_OPTIMIZATION[vardeps] +=3D "LTO LTOEXTRA"
>=20
> As raised by Randolph in the previous thread
> (https://lists.openembedded.org/g/openembedded-core/message/230469),
> this will only fix the build for users that are enabling LTO in OE,
> but we still have quite a few recipes enabling LTO as part of the
> project meson/make/etc files (e.g. lxc) even when lto.inc is not used.

See my other reply. According to the bug report links where this was
discussed, upstream think this is a bug in gcc/binutils itself and you
shouldn't have to pass these options to the linker.

I think we do need to narrow down a test case for upstream and see if
this really is a bug or not.

It may be we have to work around this in recipes that are forcing LTO
unconditionally, I'd hope there aren't that many of them? Perhaps just
force the include for those recipes?

Cheers,

Richard


