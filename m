Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.90.1600879114008081621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 09:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jRrPJuFk;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id f142so240405qke.13
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 09:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F1Ap+FKghHxN+mO9XgkIOpBbtMciWXVjF9DrsQcMrzs=;
        b=jRrPJuFktfd7fSqPEWFXHaEhadLdaPzTgtE9uVdL/vFckKFAxdi3xJGExEOom8ltWy
         1iK3n3KCIKgTix8WLWOVgJoX0btRpyV3Qg9i5LOLWIn7OZqxvlL1tQl2chEyiutwdY/U
         tTe0r+iTvfityAMpIV71bibqyy+3P+O7TnA/2YA0l4oBa3i6OA/0QtKc9J/SssokpP4Y
         TptCheZI1gRzmF/DQBqVuUBX0+aT1K2gIjZBCI0RYYDhiGHhEZVTyN9uLzNWyTrHgz89
         URIynIsCMvx3AzDO0U0qwqdgYvZMfFDd18jT5BWi0uuAtBrX39dR8t6XK+ie2xePMHu2
         Q/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F1Ap+FKghHxN+mO9XgkIOpBbtMciWXVjF9DrsQcMrzs=;
        b=RZpOFeHdLjsPThN5LfZKz44kIRSWUHCEQNEsPCm66FOU2zDA1vhOH7f/THkXhQ5Ns0
         JG8HI44HX+cX0S5+5Ss9uqwEhdnrrt2Rwd2+k1UGi2XbKlQtdGRR9+GlSFy19BLYWmq3
         xlRkggrE2ObfpcCiNHSUdzNou87Agv55mMNsScHYMMGg8bSpqY2BeduWOkRWhpJ1QsMG
         CTlcLI0EY6nWGuaawCV+tdYHjUm2Hak4VrdH3AHhQ2oObPwpKu+4KHwi/MIB/Ln/wiaK
         HIl8c7wD3Dgf7Jl+ebjMjfMnC5dY54QTyu/i6DRUT9tw/Brh3AANYwwudpUdvb49fs0y
         ASRQ==
X-Gm-Message-State: AOAM532R8SEeCiBQRtOhGs4BG+XgbL2WKYUdWT6ykOOaKgXK/EuMCn2r
	M3WHv5ua3i+xNzgMmidb1vWfdNHMcTf5FZyFexUS9mgrjjU=
X-Google-Smtp-Source: ABdhPJwgWOU+GXIrhEciftWRaMFqeW7zK+xWhVDYOfGdOb8OEq+kfMw8WkzSeitPe1XkCM56Gk1QPRweiOS8D2FWlhc=
X-Received: by 2002:a05:620a:1670:: with SMTP id d16mr726178qko.474.1600879112987;
 Wed, 23 Sep 2020 09:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200923084544.32128-1-ceggers@arri.de>
In-Reply-To: <20200923084544.32128-1-ceggers@arri.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 23 Sep 2020 09:38:06 -0700
Message-ID: <CAMKF1sqTT==wZ7a_HzzvsETmJeYAzX16E3y+RrnZF_kw92HuMg@mail.gmail.com>
Subject: Re: [PATCH] packagegroup: rrecommend perf also for musl
To: Christian Eggers <ceggers@arri.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2020 at 1:46 AM Christian Eggers <ceggers@arri.de> wrote:
>
> The perf recipe builds fine for musl.

which all architectures did you build on musl ?
Regardless of that we should still use PERF var so non-core
architectures can still override it

>
> Fixes: d758a4445a ("packagegroup: Disable packages not available on musl")
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  .../packagegroups/packagegroup-core-tools-profile.bb          | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index 1c94653d72..a5dca95c2a 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -17,7 +17,7 @@ PROFILE_TOOLS_X_nios2 = ""
>  PROFILE_TOOLS_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-analyze', '', d)}"
>
>  RRECOMMENDS_${PN} = "\
> -    ${PERF} \
> +    perf \
>      blktrace \
>      ${PROFILE_TOOLS_X} \
>      ${PROFILE_TOOLS_SYSTEMD} \
> @@ -26,8 +26,6 @@ RRECOMMENDS_${PN} = "\
>  PROFILETOOLS = "\
>      powertop \
>      "
> -PERF = "perf"
> -PERF_libc-musl = ""
>
>  # systemtap needs elfutils which is not fully buildable on some arches/libcs
>  SYSTEMTAP = "systemtap"
> --
> Christian Eggers
> Embedded software developer
>
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternummer: HRA 57918
> Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
> Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternummer: HRB 54477
> Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Trauninger; Markus Zeiler
>
