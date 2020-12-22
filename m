Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.11459.1608644754520051410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 05:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fKndERAh;
 spf=pass (domain: konsulko.com, ip: 209.85.167.176, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f176.google.com with SMTP id l207so14796215oib.4
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 05:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YtZOu60Hm24tnftsV/MBeGh33q3tn4GYWo2QBSMBNTA=;
        b=fKndERAhiNqctWfOT6zIH+5FAYbTICycIzqzqnUGPbPxY4ss7d8rJdMvEuRhqQN5cf
         kib9Oj6Jw3mH/f34liNoxgKe5qWtI1PqExNZO+7J1C/3lmLsR9af0nGBN0ZhrGj8O6si
         TFGNhKfyWX3h9YqZQhule1/d4NtRVjEqlnUEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YtZOu60Hm24tnftsV/MBeGh33q3tn4GYWo2QBSMBNTA=;
        b=kaBe3tsQHu2/w8iLtwsqwQ1e42DfdqBGXzLLw/Ur6QXvjFQC4x3s4Vd7to4vaf65K4
         SbgI/6vy45sxs9/UcwO/tX+xpel85LZlBXvcn3qIbiITy7SfMqccMndvFPEOxDlqBOOm
         b7rpsOtXHjYhn8UJn6e8Fw3mzMo9wHNcbbTKThlzkWhHscXI0LDTKpMY2wCYDjvkZIBk
         IOdlc8XYBEUPuElg01OQvMy2N6X2ZRw5+FY0g4cIqsI8vP7xBd7wG/lQjdusUJXWwi3y
         uPRnf1WgrlNrh5I0tzkzVsamPnLR55z5RqO6ZlR2E/RqsKbO24/KMdE6YREfxOzll/Se
         +n2g==
X-Gm-Message-State: AOAM530SApYs49IBfNzU7gtGzBMYEHv33parMV/D2kbmF/XuoeCYl0T8
	EvNJCBARsCwPDd3yw1GxpZZuRUV0k1BIzQLSBah2Py7NqOk=
X-Google-Smtp-Source: ABdhPJxn/8AxxJz6cDWkjJ/qlVixc1Z/Y5Zn7au5REQEsjEmnoSt3fSE0fMTe3fJaugxzdtYwTwB/eKBhWilTiYa7j0=
X-Received: by 2002:aca:d882:: with SMTP id p124mr7173159oig.152.1608644753934;
 Tue, 22 Dec 2020 05:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20201222104124.39262-1-ovidiu.panait@windriver.com>
In-Reply-To: <20201222104124.39262-1-ovidiu.panait@windriver.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 22 Dec 2020 13:45:43 +0000
Message-ID: <CAM9ZRVtZproZpv4665dEE15h5p1hngMpi=ZJQNbewZfSgudNHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-devicetree: Introduce KERNEL_DEVICETREE_FLAGS to pass dtc flags
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Dec 2020 at 10:42, Ovidiu Panait <ovidiu.panait@windriver.com> wrote:
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

I'd prefer KERNEL_DTC_FLAGS but maybe that's just arguing over the
colour of the bikeshed.

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
> +
>  normalize_dtb () {
>         dtb="$1"
>         if echo $dtb | grep -q '/dts/'; then
> @@ -50,6 +53,10 @@ do_configure_append() {
>  }
>
>  do_compile_append() {
> +       if [ ! -z "${KERNEL_DEVICETREE_FLAGS}" ]; then
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
Paul Barker
Konsulko Group
