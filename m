Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.473.1630106023883488638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 16:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jkAQHxzY;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id r21so6624869qtw.11
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 16:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJyJEUmS9jw2gmeF5OocBumXRcPJFGDNvtU+XwI3v+I=;
        b=jkAQHxzYg5+L5knrJo1WS8KH3JNpKXaHOdQYoJW4+Ywp7Z8S+L3Tvy9hEsJCZRMMtI
         GDN8rwmk4/dk8s5g1YxYIycMJIemUYgwzXaWuD9gtNrkCpkMfTEOWFLQp1KLsjiwteWh
         EQQ47BcyIXYf/Ooml4iEvlNJ811jID3tbCsy21UvaLctEmXgWTOURq2FV+fDWoEKz5tP
         bP6PVIELgxQ26zs9rKeC+4m+VBv/jjl66CwTtK0ChyhaymuBCPouB1SxKryMW7LGvCfY
         nBPG7qTtk0cnPVlNafKH9BburIMDGVKIVZzz37n8lBwGl7i+a58R7s8cuSWlaZrVY0Ub
         oBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJyJEUmS9jw2gmeF5OocBumXRcPJFGDNvtU+XwI3v+I=;
        b=PMsnE+KFt6PhdKjXYiPk4wJkQ8ySl5FOgImCR6lstRJ1CDrIcIp9botfx7w4u/Q6k1
         lJmdrtEMi1hPpQaoLFP0cfM9YPdnY7z8eucOmFbXW2WzKPc7ylidCzT/UV1JfkqKZzsl
         yC6hOjzVdj/V4iffMg84CWkK4zjQVU/YRoDHPy01fxQHY3N6Nxiiq1Lb48PLPEJ7Nzgl
         fwnMrgJlSKKmKQ3iO3S5ijk6jiZjGt0gt3rSpRYEr6OB0gg6ukmbiIpNk6REXS6cpBEm
         X1pFHNI8svApWBLQnucGuvuW61ISo4C7AJQkZIhfrt/ktk8al8HAOLBynWpiAlga3Pr1
         Nscg==
X-Gm-Message-State: AOAM531MwYDMg5xt67sKR+kFxzJDPond6+k2fGolAiuUSlJbjeT3kZ54
	a6Dl6D/rcB+/WoXB/xz/d56iWKzmndALR4ZFGeiNOx+uSno=
X-Google-Smtp-Source: ABdhPJxMB1bcxTI2xBq3DsqAE96v0BJWssm6STCq2bGubQRb4LQz0NkuOqi23+46EwD4ytXYrqiVBpIi2Au7yJlmGHE=
X-Received: by 2002:ac8:7c44:: with SMTP id o4mr10484959qtv.82.1630106022981;
 Fri, 27 Aug 2021 16:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210827215743.2027466-1-saul.wold@windriver.com> <20210827215743.2027466-2-saul.wold@windriver.com>
In-Reply-To: <20210827215743.2027466-2-saul.wold@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 27 Aug 2021 16:13:17 -0700
Message-ID: <CAMKF1spRJjG8cSUwx2=qMO6KfGQhgiEvaxKuRdu2MJPJaLgAPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] quilt: Only package guard for the target
To: Saul Wold <Saul.Wold@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 2:58 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>
> The guard binary and documentaiton should only be be packaged for the
> target class.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-devtools/quilt/quilt.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
> index f85de384d2..41d30e89aa 100644
> --- a/meta/recipes-devtools/quilt/quilt.inc
> +++ b/meta/recipes-devtools/quilt/quilt.inc
> @@ -73,7 +73,7 @@ do_install_ptest() {
>         cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
>  }
>
> -PACKAGES += "guards guards-doc"
> +PACKAGES:append:class-target += "guards guards-doc"
>

append and += together is not necessary

>  FILES:${PN} = "${sysconfdir} ${datadir}/quilt \
>                 ${bindir}/quilt ${libdir}/quilt"
> --
> 2.25.1
>
>
> 
>
