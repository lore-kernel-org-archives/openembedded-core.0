Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543C6C19F32
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 00:51:29 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.1357.1741222285109443420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 16:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KwB9kq8W;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2c12b7af278so118214fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 16:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741222284; x=1741827084; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEDHcru9/j2Xns2zyPmYw6jLT9EHrGgB/EI4gZq3OBs=;
        b=KwB9kq8WY4LwHUTwp38//lyJFjls2wNExaeb/vT5Y/r8/zDmPap4jpkvhTCwqqiZJ7
         8pX0mFPywt4XrZS3prnlT6zNAKy7YtxaaSheowvCeZlTcn0d9nBbMLVP8NqxW9UVoLEK
         CqfYrtcyyX6lhCXqMFn7ge4YfXvkCKnLzFJ2OF5WCa/G3ycJapVOzxAq6Guq/cFXU7kI
         AUdbAAarY9TBlOoIARLB8y5Z+QLnxC8oAQtag6jJq9cehPmdSn875SyHWr1GX8YrJxiF
         rTbesWQIp6d8nJlpDMXfC6emoh9mvQIBDdOev1HG8ht/LSNaZv0YT00abyH4gMdofGi3
         0agQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741222284; x=1741827084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEDHcru9/j2Xns2zyPmYw6jLT9EHrGgB/EI4gZq3OBs=;
        b=bXEo2Me6ZxPHZDOuYMoDDJnXsc9ZTu9VSBtvOad2Wvz5BCU14juXUN+n/YvjpCGdG6
         l64HMYPJJ5dhN2wVb3E9aeWo7Jf/P75uN4E/WZf/5cyIvyTOLW7VqpVfR1PLTyZgZ/al
         TGSgOJduK/oujJi8wY7F19d7eLZ6roI7Gm12l21klxriPin6UMqt5Jye9ysbexQbcV63
         ozur7at/ko8/iNSu7o/Q/GkXuYpG7LO7j+EM3Tt1/i8eTastpWl5Kkg1pgAPTfxX9fKt
         Q5i5LoPnmf7wtLnjELgFYGZXYVszK0o0pcCjnH1TpzR3/jquY9NDLIN7Wus94O2LaPJH
         E+jQ==
X-Gm-Message-State: AOJu0YwXvYROSIHaWUM9Lkcnu8j/q9m3RxDdO7zUV2A+RibrF/4Ya+cm
	LOABcc3j0W67LULxbsGZl+iW5Kv1qnJ9PK8XrTqD0dlJqJfhl8HmanlXRJeYl8hUb24fiIRdtJW
	/KEckOCZ6NDboWKDoUeyW/QDYrzY=
X-Gm-Gg: ASbGncuC1mDm64W8hxNZhgPjofg9nXQxg7Je/t5fmMIMVJ/fFaXzrVRMWsE1w5wj2Zi
	xQWkph6MDHM5KtcRoAjIiN6mJtaOx9mB1jXR0ku5yEQP1erff0aP0A3fTn4BMDt8e2OONvTdk+G
	tf9kxkZb6AUl3a3Hd6fL0l1tEA
X-Google-Smtp-Source: AGHT+IF6kdGCkpeozITasQnu3VgrPuCqZeOzkJnPzQJ3w1QCU6xFANZJ2sMDllK2dfTjOLlRDcUFnaUY0WcODQdmF3o=
X-Received: by 2002:a05:6870:a995:b0:2c1:556f:f752 with SMTP id
 586e51a60fabf-2c23e4b494dmr861907fac.0.1741222284239; Wed, 05 Mar 2025
 16:51:24 -0800 (PST)
MIME-Version: 1.0
References: <20250305151906.269922-1-f_l_k@t-online.de>
In-Reply-To: <20250305151906.269922-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Mar 2025 19:50:57 -0500
X-Gm-Features: AQ5f1Jp_V2XRW0ctX6Yzj5X5_OOXXt7iRePDh26Y7nt0NzZSMssKerVlZunEMeI
Message-ID: <CAMKF1srzaSQFbJgAfGu4VFujBaHn7Zdu4oM60nsB9hCgiF9hLA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] fastfloat: add recipe
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 00:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212368

On Wed, Mar 5, 2025 at 10:19=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> A header-only library for fast number parsing
> An older version of this recipe is included in meta-oe, since fastfloat
> is also used by libplacebo. If the recipe is accepted, I will send a patc=
h for
> removal there.
>
> The reason why this is needed in oe-core is the upcoming vte release,
> which uses fastfloat but pulls it as a wrap-based subproject by default.
>

Yes, that's right. LGTM

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/conf/distro/include/maintainers.inc          |  1 +
>  .../recipes-devtools/fastfloat/fastfloat_8.0.0.bb | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index a6f413caa9..5515d46ca5 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -174,6 +174,7 @@ RECIPE_MAINTAINER:pn-eudev =3D "Anuj Mittal <anuj.mit=
tal@intel.com>"
>  RECIPE_MAINTAINER:pn-expat =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-expect =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-ffmpeg =3D "Unassigned <unassigned@yoctoproject.org=
>"
> +RECIPE_MAINTAINER:pn-fastfloat =3D "Markus Volk <f_l_k@t-online.de>"
>  RECIPE_MAINTAINER:pn-file =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-findutils =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-flac =3D "Michael Opdenacker <michael@opdenacker.or=
g>"
> diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb b/meta/re=
cipes-devtools/fastfloat/fastfloat_8.0.0.bb
> new file mode 100644
> index 0000000000..6426a1d2ec
> --- /dev/null
> +++ b/meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "fast_float number parsing library: 4x faster than strtod"
> +HOMEPAGE =3D "https://github.com/fastfloat/fast_float"
> +LICENSE =3D "Apache-2.0 & BSL-1.0 & MIT"
> +LIC_FILES_CHKSUM =3D " \
> +       file://LICENSE-MIT;md5=3D32b11d50c7d9788d4270f6a83f3e68eb \
> +       file://LICENSE-APACHE;md5=3D81db248e90379bcfc0582b578b009bc3 \
> +       file://LICENSE-BOOST;md5=3D2c7a3fa82e66676005cd4ee2608fd7d2 \
> +"
> +
> +SRC_URI =3D "git://github.com/fastfloat/fast_float.git;protocol=3Dhttps;=
branch=3Dmain"
> +
> +SRCREV =3D "77cc847c842c49e7e3477c1e95da2b6540166d66"
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212320): https://lists.openembedded.org/g/openembedde=
d-core/message/212320
> Mute This Topic: https://lists.openembedded.org/mt/111529479/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

