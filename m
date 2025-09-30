Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD44CCA468
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 13:48:01 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.25710.1759240074505666278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 06:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ol0YqsOF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3f44000626bso3687432f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759240073; x=1759844873; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HEtyJM6a9ZADLPGF0S1a+yzioBTJd0kUpPypjeaBuAw=;
        b=Ol0YqsOF61ZdpGW4LlbkXovZDb4VrIvEvF0FWFvjjB4Wc+V/y3T5uGwLYamUylplA+
         eef//yVIVVjeNkIMvHbgpWqqY4KjizZ/CYMy3Rnhe4Zg27jp0eAUi+0gLATr/ogtuNkP
         1QMcc0r0+A4hLgaUmf/9UYhgwgtRoro3P/d3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240073; x=1759844873;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEtyJM6a9ZADLPGF0S1a+yzioBTJd0kUpPypjeaBuAw=;
        b=KFVv1F4Hva+3LdSPDVR8lpG0ZKxl4WL3h4BHb5iP0Qyv7tJB1w/7SVpTdqXUMbyJUg
         sAx+Ew8g6iOUyd4M3qmIYil6+IZrfRHoYwdDINyClRFXVywopMQIL6g4hDuDKNQ9Eh5K
         4WQXcYOdiMpfnODs2MaRdD3NVT8pX52VOcVel4Ku/jqU0leM0AN80q2OuEiaZt/nDbji
         3JcOd/oDg0iVHqYTuZN9lqVMrJ/EIo58eN1EtlfNErGuRf5sMNY5CQw/FNqLx5sgBRVo
         HxImSp7ijGFuJNkjyEdwWdVuWW7VEhmzGYp+6pU1E7vd/P1DipTX13/ucejIp955W26z
         jY0w==
X-Forwarded-Encrypted: i=1; AJvYcCVejPN9wQB8xnXntWkrJM95/La5VXSQ0cOAcB7lsnNAjvRNkKfZQH1d7OzUxuHwbtNcjenH8HHASwLItodsLtf9LQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzxPeHLuXsk6M0K8F/xPtpDpmgc6MycBUC31U8MNV7SyvZ7Qi0c
	vjR/n9KVqg5D3UmYLxTJZMucf+zU+U/dfgb+SiXXkM3GFGUXdHx9QT/wQWk7wdf4Bb8=
X-Gm-Gg: ASbGncuGcLbBu0WtFtEWad+wWEQrZGQOCswubhq0dRpm5DZ3LAbmRpt1IQZxyE/FkqN
	PtN3ZZCFphVFIb3exZeKfiX6BKXgfzlzly0QBBN9KolnhdxdsocwQnwR4PMwtHgB8QuL+OqoX0a
	Fxvdgvwq217ZztIyHxdXYxXt/GvfMyixmJsqRAbbLpxzxGyFGO+CpwzNTIktvWOirwoCJcsvaFi
	fwcxAZj/5h1GXGrhW80iX36BPh0LFVm48ly4RGBYjZpMiOHpJNl7xH7lwiECgFJTg/6jhFNBjah
	DhvNTFjuIlyEO96HwyIstYUnulikZ2VHeFr/QH/GM/eyAjCO9p2YGI6c/nMZRPCeFtNUjA2FX+D
	VJFW1JMGKuNf57WPYiTljy+tu61sZe02JC0jXRvSdQ06dfZcwgVh8oHc7BBxNXV3QmHXBjSJoi9
	TtdWjtBly2T3q/Ip8EmVYUa1ZuDrYEsIjM
X-Google-Smtp-Source: AGHT+IE8YWaTPFmtk9SLvITBcp+uHXgQa8iLAqAowf5FzF+V7Dh8W70so3EXDpHM3vEqWqpncyuzYw==
X-Received: by 2002:a05:6000:26ce:b0:3e7:471c:1de3 with SMTP id ffacd0b85a97d-40e436422e6mr19971722f8f.14.1759240072777;
        Tue, 30 Sep 2025 06:47:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:55be:9f8:6c8b:6835? ([2001:8b0:aba:5f3c:55be:9f8:6c8b:6835])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb9e1bd14sm23999297f8f.28.2025.09.30.06.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:47:52 -0700 (PDT)
Message-ID: <d04d310ec882ddea6f9578eeb65d99cfae1abe69.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] binutils-cross-canadian: Add missing perl
 mpodules to RDEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Tue, 30 Sep 2025 14:47:51 +0100
In-Reply-To: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
References: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 13:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224188

On Tue, 2025-09-30 at 05:39 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> In sdk while running "x86_64-poky-linux-gp-display-html --help" gives
> following error:
> $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
> ./x86_64-poky-linux-gp-display-html --help
> Can't locate bigint.pm in @INC (you may need to install the bigint module
>=20
> By adding the following perl modules to RDEPENDS fixes the above errors:
> =C2=A0 nativesdk-perl-module-bignum
> =C2=A0 nativesdk-perl-module-bigint
> =C2=A0 nativesdk-perl-module-math-bigint
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b=
/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> index 7d7ffe92ce..9dc73fbdf1 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> @@ -5,6 +5,7 @@ PN =3D "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}=
"
> =C2=A0BPN =3D "binutils"
> =C2=A0
> =C2=A0DEPENDS =3D "flex-native bison-native virtual/nativesdk-cross-cc vi=
rtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
> +RDEPENDS:${PN} +=3D "nativesdk-perl-module-bignum=C2=A0 nativesdk-perl-m=
odule-bigint nativesdk-perl-module-math-bigint"
> =C2=A0EXTRA_OECONF +=3D "--with-sysroot=3D${SDKPATH}/sysroots/${TUNE_PKGA=
RCH}${TARGET_VENDOR}-${TARGET_OS} \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 --enable-poison-system-directories \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "

This is probably the right direction but shouldn't this be for the
gprofng package rather than ${PN}?

Cheers,

Richard

