Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web08.8562.1605372796355074879
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2020 08:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PRN01Ow+;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id l12so11343955ilo.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2020 08:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j1n8Av/ivW8aWPqDRQ2W8QvVTp13o/QIIq6a6N3DLXw=;
        b=PRN01Ow+JrekV+4QAsYcie9iFjxmjk0uvqn5SXaP9qs86PE4CZXVWpGF7mXPqSaq4G
         B2L0i9rZReIo3v76LL9fNbabk8V6LVY2Y+q/D2Fo/hAxytxLDXWcrnaQ1Uz8YTzAoHoL
         7XVW07SUfJh3VMaXQsamAb7akcU5t/FNyIxelo9J85akd96hOwEzgAHQdp/7GxDYhdVc
         g8R48f+Z8HnUut4qLcDGeg0YIMUOjumnIl3/sr4elVr8P57Zoo2Sy5hSqDMr2ZAbexNe
         CQQ01X7cvekr6Om7vWaxbcDinVEelxEZu3RhOhPOCdEUB/GosspUV6sQrzKVFCJ12T6G
         2CyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j1n8Av/ivW8aWPqDRQ2W8QvVTp13o/QIIq6a6N3DLXw=;
        b=lDTliKxLBBobadGVvbTxMJ5szEBGbu3eFBHAez0S+uASSiK6fsQ3BqosC7yXS9sO15
         +eh48SuLc8Jsi8gqg4QLHuO+J9pgNW8mJqkxTSD27qfPZ9lEeYYJTKMbZ5Ogc2egC1sh
         Wg4e1HH56e1Lyhfo1kWAbjFwgz+bswNjoBtCa2NZoLpu4G4DdYJ+rkM1ylajjj3q+WDZ
         Q9gm0dBJdbKS4HX7mrf8eCp/N27RgJ5yX3aDTnY/z7et9/EUdXazUQdfgkm11cDE48gH
         6n16aayIdbvSUOnsJx/+2UZyjzDBFXGMfN+NA/aG1o/a8/QETEVFBq6pihNsQceBi3H/
         k4mg==
X-Gm-Message-State: AOAM530RJsSp2Up4wdQoJrADsvZcEMDk1SCVsoAXEk9G8GjKIDaJijAL
	SviYwaeJwW4MpxLrWfeFjJJqbJP1Ylnvnej/GI0=
X-Google-Smtp-Source: ABdhPJw1viTHlkoGaaY7Z539htrx7+0cp4CTO1ty+lxEE+fnIYRh96eHBueDPG3L1eg0h+p8vALCJlaZQrrlGw4/rAU=
X-Received: by 2002:a92:d446:: with SMTP id r6mr3807911ilm.267.1605372795789;
 Sat, 14 Nov 2020 08:53:15 -0800 (PST)
MIME-Version: 1.0
References: <20201113194854.21266-1-alex.kanavin@gmail.com>
In-Reply-To: <20201113194854.21266-1-alex.kanavin@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Sat, 14 Nov 2020 08:41:06 -0800
Message-ID: <CAKmqyKOw+zE5WQr3yv9cPOuZPux6aEjjpjs+_V1C1No=ZOpwvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] python3: split python target configuration into own class
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 11:49 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Setting _PYTHON_SYSCONFIGDATA_NAME in python3native class globally was
> problematic as it was leaking into host python environment, which
> was causing tracebacks depending on host distro and action
> (typically anything involving importing sysconfig module).
>
> The new class sets the variable only in specific tasks where it is needed,
> and should be inherited explicitly:
> - use python3native to run scripts with native python
> - use python3targetconfig to run scripts with native python
> if those scripts need to access target config data (such
> as correct installation directories). This also adds a dependency
> on target python, so should be used carefully to avoid lengthening builds.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

This fixes the devtool modify u-boot failure for me on Arch.

Alistair

> ---
>  meta/classes/python3native.bbclass       |  2 --
>  meta/classes/python3targetconfig.bbclass | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta/classes/python3targetconfig.bbclass
>
> diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
> index d98fb4c758..2e3a88c126 100644
> --- a/meta/classes/python3native.bbclass
> +++ b/meta/classes/python3native.bbclass
> @@ -17,8 +17,6 @@ export STAGING_LIBDIR
>  export PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
>  export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
>
> -export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> -
>  # suppress host user's site-packages dirs.
>  export PYTHONNOUSERSITE = "1"
>
> diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python3targetconfig.bbclass
> new file mode 100644
> index 0000000000..640d0c97b6
> --- /dev/null
> +++ b/meta/classes/python3targetconfig.bbclass
> @@ -0,0 +1,15 @@
> +inherit python3native
> +
> +DEPENDS_append = " python3"
> +
> +do_configure_prepend() {
> +        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> +}
> +
> +do_compile_prepend() {
> +        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> +}
> +
> +do_install_prepend() {
> +        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> +}
> --
> 2.29.2
>
>
> 
>
