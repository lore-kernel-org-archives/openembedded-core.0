Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C314E92FC5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 17:32:34 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47623.1767029550609300551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 09:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eRHfaOU1;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.47, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6466d8fd383so6843896d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767029550; x=1767634350; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+cKuRhn/yW2nrXh9NOPzM481uk4MIVpAOGF+BlyftI=;
        b=eRHfaOU1w8ZB0VHIO/hMgsgKMxU1VBV/qHwl3cC8dc/0RVv5rf/PkpXOuWwk0gUISC
         ab+YxwzTgHrMFj4K4QzLDDIi5IuZDY/raVN/eJ041Cb+SYkz9zg8akfhDxCEBOwJT3Hu
         MWx3bli28oRSYvttKimH+4cnZIf+MP6HttcU/UX0YUwZTb2EBux18U+iHym1cFn6xIK7
         FvYa4CHQCt5hOkPBoE1dG8uKfD5Reue9waLF1y5LiTd+YTiJZhAnsvPyNFrP96+96ypr
         QyF1+0lHPAmD3wXUn8IcFzpOBiuQ5DtTdkWJ/g3Oewk7CnPNdOCxB7q9e5weJbymCHuW
         1ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767029550; x=1767634350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f+cKuRhn/yW2nrXh9NOPzM481uk4MIVpAOGF+BlyftI=;
        b=cTWnwjrgn0LuYl/BwiWITEeZzOtDng/mwJqKiD8ZqgIG70nbMRrykkW2UQ5I/lvpmg
         GK7yZ8PDRLzLHFKtM/SjUs0dBnWswpNO8DXeuukyw7CzmUieUr2jVTtkAhNqGHxDujpL
         mwyqhZV3464Pi7T5KjPgwKHGUy2Iwqrzr8hgESI9DPxu2eRFX36NKaSjNrP14UJQDtLR
         tJN9BfsAqad/bg0YMz+MMg41L8a6oi7cxAc/ZuFhfE8rnabJk1GyLV5+ZNhZKmfae7u6
         Ej5ool9ELjmQg6XYJFZdOGHLhUoiWk5M16BKQkvBP4OVJZBHRUyH3HC37MhWBl+ADBVi
         6Dmg==
X-Gm-Message-State: AOJu0YxBbsBcz0xiyQStTm92LIEFl8LtdOwvCMjzWtGIXcEh71depfty
	IhIZjdwXwiMUEHYEoh2Qe/X1SnnpgI2Gk/tEcqYggUMvY4FtOztEikDh7ArRHnEYyZc+A+g7C1Z
	qygKeZ9loUI+UFKsp/qYFv7Y3zsH8oGScYgU4lW+Xcg==
X-Gm-Gg: AY/fxX5UcfUwX2Qlzf8P3oJb+J6jOHWHqPpPsDPs0XPXPPR5Qd1Vb2UmnBfsNuVZ6bI
	FpDYGl5RLdDEHvGQwgc9HSjnxs2DPGbpzoL1EjjlRqkQpoOpIMEJLZ+WYFPFCQR2fW5L3fCgSeH
	j8oGVp5rVy51cSA5UAtXxyvizMMfX4I7N6FmXFr4PcgYuCQ8ZpIT1FIhD9/AO7L53ist9e+BT5s
	0XC5ffCUpR59bPxQKyE2RWKW0P+K7wU5seO+cb3wfjXCvUDe5JmHGbNxGv/mrRKJDOZF8hiQIPQ
	A43n3Kvm7aSpq15FzChAXR0Pcoc=
X-Google-Smtp-Source: AGHT+IGeuvj68IKg2PeJrkl9ia2xVqJy0MSuZO4Des3HCvK/un1+USqRsEAogEE/PARBaZjYqPjsco678mvYYTsz5jM=
X-Received: by 2002:a05:690e:1892:b0:645:5bfc:8be3 with SMTP id
 956f58d0204a3-6466a87d711mr24942192d50.12.1767029549450; Mon, 29 Dec 2025
 09:32:29 -0800 (PST)
MIME-Version: 1.0
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com> <20251219032209.960840-6-ankur.tyagi85@gmail.com>
In-Reply-To: <20251219032209.960840-6-ankur.tyagi85@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 29 Dec 2025 09:32:18 -0800
X-Gm-Features: AQt7F2q9_7lHwRX-0uU6LGETjralTsht75KDupk_hgNZnJXatJIAbB4bIGAHxdc
Message-ID: <CAOSpxdaU84M9x_HMBeNVG3uJM+0hMXuBUo2QS1VFGFU0X5DHUg@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH v2 05/29] spirv-llvm-translator:
 Upgrade to 21.1.2
To: ankur.tyagi85@gmail.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 17:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228610

On Thu, Dec 18, 2025 at 7:22=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> [Backport to 21] Implement SPV_INTEL_predicated_io extension (#3370) (#33=
86)

This is a feature addition, thus not eligible for backport

Steve

> [Backport to 21] Fix incorrect translation for AtomicCmpExchangeWeak buil=
tin ptr arg type. (#3390) (#3392)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit a824c087bd3f3af36374efd45ce6fb8838f813b7)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...lvm-translator_21.1.1.bb =3D> spirv-llvm-translator_21.1.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.1.bb =3D> =
spirv-llvm-translator_21.1.2.bb} (94%)
>
> diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb b=
/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
> similarity index 94%
> rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
> rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
> index 503e7df644..763afbd608 100644
> --- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
> +++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D47e311aa9c=
aedd1b3abf098bd7814d1d"
>
>  # pattern: llvm_branch_200, currently there are no minor releases, so, n=
o llvm_branch_201
>  SPIRV_BRANCH =3D "llvm_release_${@oe.utils.trim_version('${PV}', 1).repl=
ace('.', '')}0"
> -SRCREV =3D "29758b55816c14abb3e4142d42aca7a95bf46710"
> +SRCREV =3D "a37544fc0bb90b4e8b8d755580119c018891dfa4"
>  SRC_URI =3D " \
>      git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps=
;tag=3Dv${PV};branch=3D${SPIRV_BRANCH} \
>  "
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228173): https://lists.openembedded.org/g/openembedde=
d-core/message/228173
> Mute This Topic: https://lists.openembedded.org/mt/116854360/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

