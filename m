Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.11297.1608645007039328023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 05:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pm1aQmdI;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id w1so18306148ejf.11
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 05:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/x3hL+6sYl9OE2rENMIF6+Gc+gSOV58KBCt8v0Ta+Hc=;
        b=Pm1aQmdIOgCDuLAcsFiHUwOEUUCEXZYWhzu0zsoWK0nVTHm/0iT7yjiOkM9NoGUtCv
         bZjtwRfKlbDVuQVq7qNjRoV52l+p7s4TZK6q1K3B7iiAeEU+jEGw0ZWVw/OYfMmzI+T4
         HaalFDtPhX7sPNeUG+P9BD7Op1xkP+k+sI4+fS3MMvJ8Se2Ri7tCLJl/fJj9L0x+/0q4
         Rdkap39LbWVN5XstqF6vs26fMJKepOLwgiVUQOJqlSJRCCndyiLuuyWQErHiRukjvyE2
         /IrcsKDK/bKQ9cqa9wLWiONXJXsadrE17Lp7bpCmEIUmm3PxpcP7ebLYu0xUkWlbjqee
         Sadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/x3hL+6sYl9OE2rENMIF6+Gc+gSOV58KBCt8v0Ta+Hc=;
        b=m3eY+Jmiy0MV7xCfJpQE5cYHcatroxLEqSyf3htSFr1wuNs8mh3UguJ2ct/F5n4uG6
         5ArATpaqeZlnnea1ZjriLJwJ0/qZTjvs948lcOB+5L0l+XamqIhDkQfqxxy8dx72xptp
         9DkHwKZsvRrxWCcdUA7hJEcN1HNAKbl9ASrxl906OD5hpu6BuKcMDE7YIzTVDzUcg2X7
         U43TFSXxFPigbrJ11BRea3ezlA4XjR2xtw0Gw7oUxVrgYoVPEKs20zXhEzyyF45sqGAa
         BsEjYyHgcgpqABwyT5MCQEGVY+3+/lpDpuBfdADEQo5Pg9dUNdDNYGPAdvV7WSQKUh3y
         J+wQ==
X-Gm-Message-State: AOAM532iysEBhqaNCG59W9gydcFAi9RbnL6pUYpMyRwyGq+fbU/4GXTX
	gkDVR0Qy2OgND6HTM4HjvCudLSWtraJl9EZnVRA=
X-Google-Smtp-Source: ABdhPJwtUkFIMCl5abe3S8KXxlSr72RMSE9Z5pFDZ3OdvvpMVTVdmiOWthi4eGFo644LXDUoc1P+kNSYMJNxhXfA/Ps=
X-Received: by 2002:a17:906:6dd1:: with SMTP id j17mr20240886ejt.357.1608645005320;
 Tue, 22 Dec 2020 05:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20201222104124.39262-1-ovidiu.panait@windriver.com>
In-Reply-To: <20201222104124.39262-1-ovidiu.panait@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 22 Dec 2020 08:49:54 -0500
Message-ID: <CADkTA4PYk-jM7jqEBj008zGysEcf6UUVr3RfZuzkANp38-FkZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-devicetree: Introduce KERNEL_DEVICETREE_FLAGS to pass dtc flags
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 22, 2020 at 5:43 AM Ovidiu Panait
<ovidiu.panait@windriver.com> wrote:
>
> Currently DTC_FLAGS kernel makefile parameter can be specified directly on the
> command line by adding it to KERNEL_EXTRA_ARGS. However, this prevents
> scripts/Makefile.lib logic from appending flags that silence dtc warnings (all
> assignments done from within a makefile, to a variable specified on the command
> line, are ignored).
>
> Because of this, the do_compile log is cluttered with dtc warnings that should
> only be printed when compiling with W="123":
> ...
> /soc: node has a reg or ranges property, but no unit name
> /soc/gpu: missing or empty reg/ranges property
> /soc/firmware/gpio: missing or empty reg/ranges property
> ...
>
> To fix this, introduce the dedicated KERNEL_DEVICETREE_FLAGS variable to hold
> dtc flags and export DTC_FLAGS in the environment before generating the dtbs
> (make allows "+=" operations on variables that come from the environment, so
> the warnings are silenced properly).
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/classes/kernel-devicetree.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
> index 81dda8003f..2066096a9a 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -9,6 +9,9 @@ FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
>  # Generate kernel+devicetree bundle
>  KERNEL_DEVICETREE_BUNDLE ?= "0"
>
> +# dtc flags passed via DTC_FLAGS env variable
> +KERNEL_DEVICETREE_FLAGS ?= ""

We should also be updating the docs with the new variable.  I don't
know how well the other parts of this are documented, but the state of
the current docs shouldn't prevent this from being documented.

> +
>  normalize_dtb () {
>         dtb="$1"
>         if echo $dtb | grep -q '/dts/'; then
> @@ -50,6 +53,10 @@ do_configure_append() {
>  }
>
>  do_compile_append() {
> +       if [ ! -z "${KERNEL_DEVICETREE_FLAGS}" ]; then

Does -n work here ? Having a positive test "does this exist ?", is
almost always easier to read / maintain than "does this not exist ?".
But someone can correct me, if there's a compatibility concern with -n
(and if so, I have a lot of scripts to change ;))

Bruce

> +               export DTC_FLAGS="${KERNEL_DEVICETREE_FLAGS}"
> +       fi
> +
>         for dtbf in ${KERNEL_DEVICETREE}; do
>                 dtb=`normalize_dtb "$dtbf"`
>                 oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
