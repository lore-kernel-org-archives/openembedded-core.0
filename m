Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.511.1615418758001168066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 15:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T7F2w8wh;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id h4so27934202ljl.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 15:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4h0EjCXykufLLRv3D+zHTZXZe1F1zS9isNoDU7H53zw=;
        b=T7F2w8whBnMd6z+KLmmVWTGDVSqsEXuozvPrNVckpQfIczHOUA1v5xLcPcEeoAf7t1
         qkw8S3az0B4jVhZRLj9B+JiFHK2FPDgULBQWMvxd5Bi1ll27M1Gl/xuGROEmOAupZXhb
         YN8/5YQJTebZDl4UQBbvaEgchzOPTvaL1pDC5Yv/CptUiPpmFxfxmfNa/tSoRpGnXtn3
         Drwy0ynoeAeQ9sGsVDApFJvGgYqngNHvlHhpjXZ/UX5IzqRB6qz+9xu8q6FZxDs1F0qB
         4V46UuCNxYddzG0Anq81+yw6MMnYtROK8dJ4NqGoxWFepZ1ZIIwBWF1iYEQorBJVRbG3
         JFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4h0EjCXykufLLRv3D+zHTZXZe1F1zS9isNoDU7H53zw=;
        b=nb7iJwe7W1vE9hWK0bJSZjduizwZMsWn9imCtz3SCH+pfXqLl4Q0ICLaGqjKMSq75I
         kX65V12y717aW2mEa5DzC+kBgOQj07O0tuUnwcbSXvLDsaCOCOpUQqOJwni1ALndmu9r
         woNximIULlzqiG+9bMeTFSDlsNRLC4kgIicLEe92GgASPzETcu1kQZvqhs6gSk96bVYI
         WMfMFT3AxqqB19gw6zMopJ9JHnOJQoYBCkHSOh57l1Oau6E0AT3fibBLOYU7SUOXFNw7
         G42QWw3mZTP4Smn2eeE1/Jhf/3GzroEie3XmozMQbXwb3WRPwpcWdJ/KcdeYrlueVBy/
         mgGw==
X-Gm-Message-State: AOAM532hU5oNcjC6NLLuHrWKZRw/tQONa4dO5jbze8jYSje7f8Z6ZmaH
	Qh3McWvaQJFcYPWvHXDTk5O5giPBcS8moP9TY0s=
X-Google-Smtp-Source: ABdhPJwxXTX3YNnGjg1G7JY+O6cedz/b+LjyhkOSktcEhlcU6CAuHPQnWgCiX1LBYR6c1O9T1fX+iZXuOFDKFqmUTAY=
X-Received: by 2002:a05:651c:387:: with SMTP id e7mr3216681ljp.425.1615418756063;
 Wed, 10 Mar 2021 15:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20210310230433.29983-1-jdmason@kudzu.us>
In-Reply-To: <20210310230433.29983-1-jdmason@kudzu.us>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 10 Mar 2021 15:25:44 -0800
Message-ID: <CAJ86T=XDpdxFY_dLtpOf7b=gZ8N_jHe0Yp1Frhw+h4uqzWpRhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemuarmv5: add softfp
To: Jon Mason <jdmason@kudzu.us>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 3:04 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> pulseaudio-14.2 is throwing the following error when compiling for
> machine qemuarmv5
> "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>
> Using softfp to resolve this issue.

Wouldn't "sidestep" be a more accurate description then "resolve" ?

Either way I'm not sure that changing qemuarmv5 just to workaround one
broken package is the right approach. Doesn't it mean OE will no
longer have any test coverage for ARM soft float?

> Signed-off-by: Jon Mason <jon.mason@arm.com>
> Change-Id: I513ed523f03ed091507a099e3f80fa95a6fc7ca9

Not sure if there's an official policy for this, but personally I'd
say your own private gerrit IDs should be stripped before pushing
changes upstream.

> ---
>  meta/conf/machine/qemuarmv5.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> index dfe2a89573b2..29bcc1199ea1 100644
> --- a/meta/conf/machine/qemuarmv5.conf
> +++ b/meta/conf/machine/qemuarmv5.conf
> @@ -18,3 +18,4 @@ PREFERRED_VERSION_linux-yocto ??= "5.10%"
>  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>
>  KMACHINE_qemuarmv5 = "qemuarm"
> +TUNE_CCARGS_MFLOAT = "softfp"
> --
> 2.20.1
>
>
> 
>
