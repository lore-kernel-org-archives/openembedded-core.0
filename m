Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.15749.1612897858856649311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 11:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z6S9TVv8;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id s77so19127260qke.4
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 11:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LHtkJOCmkCg1ox75htw3anDkoZclMdeLZvuEd011VPc=;
        b=Z6S9TVv8ujQ4mGKc3ygbNhIoohqYKXEE392JwKDd1HXu71HhDOL/ux4wJ61XVSK15B
         o5koeQaNIgvhD/sNwTEiZ546MujLzdbs2NJ1+HAEr74FN/9foa0/ua4noEx015n/3I2Z
         s3eiPVCTqp1U7Fy+G0fVpqk3FoXD963QutzkLeB+eaqNFQ3qifa6ydiGLP6HBEzdk02L
         kz/rRR0QXBAXfCEtPUCklGEmqn19OtWkr9ZdBNwniekaRQm8F9m41CdihMSqNkSFN7Vr
         hqWc2Fve9vPWwHQGLVm37cr61R8E+ij09JxLRY3pfNGggYcYRBJlBOZkhCHDAWM3cEhD
         mxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LHtkJOCmkCg1ox75htw3anDkoZclMdeLZvuEd011VPc=;
        b=mWFID560wTtt0orwpKXEeLepmMXBvu6z6wZNsp5nBrWUXDRW9HlrbxTDJ5kQq9Grda
         yl070ET0eg4wk3A4Fpncqu0Ftvb3ijO5ThWlDZ9wF5jDqOMgwLumn0yk7AcUXz1PgVHm
         Vr0xjGnG3XliO/G2ayKgr5Of1bSQ7gCdIrGDWcUItAwbgxRrT9P0p7RlKCb6LdxeH/i3
         Lk6Vp+Z/Uif6vruYpR6aPszdW7Qlctexqo+kjoYaKd98m5ZGrgXcvaaVOWnN4fWQibkd
         io5lxOl30fIWJUkCJMSBoKScuHawmK8OUAzO24eAUpwePHHOJFagaHN5Mxh1oUnYAxAP
         SG0A==
X-Gm-Message-State: AOAM531JsRHM1cxz+HORXRNtCbUPjmeXJXS3KHRrQU+z7kQUhnUuEKh4
	jEYBuS3bDGQWC5YHKh7Q2zYSasPRP0t1eXVjgD4=
X-Google-Smtp-Source: ABdhPJzzNBzdL1Qkve182fbryAsM6cs/xDteZ1oIMKlPEn0fTGge+kp4jwQFvHGXgMySvV9kjcUkKrYZFEpvpe+OnaU=
X-Received: by 2002:a37:9ec5:: with SMTP id h188mr6563686qke.474.1612897857895;
 Tue, 09 Feb 2021 11:10:57 -0800 (PST)
MIME-Version: 1.0
References: <20210209141616.24276-1-robert.rosengren@axis.com>
In-Reply-To: <20210209141616.24276-1-robert.rosengren@axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 9 Feb 2021 11:10:31 -0800
Message-ID: <CAMKF1spisR5dPaN-1pPsk-kiBjW356znTP2JJt500zuU5CjN=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mpg123: Add support for FPU-less targets
To: robert.rosengren@axis.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

is --with-cpu=generic_nofpu applicable for all soft fpu machines or
just arm ? I wonder if it will improve or regress other nofpu
machines. Do you have any data

On Tue, Feb 9, 2021 at 6:16 AM <robert.rosengren@axis.com> wrote:
>
> From: Robert Rosengren <robert.rosengren@axis.com>
>
> Support added to configure mpg123 for FPU-less targets. Building for
> fixed-point arithmetic increases performance on such devices.
>
> Signed-off-by: Robert Rosengren <robert.rosengren@axis.com>
> ---
>  meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
> index c9bbcd30ff..35cad6ffc4 100644
> --- a/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
> +++ b/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
> @@ -40,6 +40,7 @@ EXTRA_OECONF = " \
>      --with-audio='${AUDIOMODS}' \
>      ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
>      ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
> +    ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-cpu=generic_nofpu', '', d)} \
>  "
>  # Fails to build with thumb-1 (qemuarm)
>  #| {standard input}: Assembler messages:
> --
> 2.20.1
>
>
> 
>
