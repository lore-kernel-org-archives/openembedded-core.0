Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.11810.1613063600336886795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 09:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E5c9oVZV;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id d3so9127661lfg.10
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 09:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WXBBBvwV6p1U7oDBizfZ/DqhyRQaVIXZ8CHVKw/qnpw=;
        b=E5c9oVZVmhBdr1k83kS17qRJmF8touWuYG6jsrshUkKRyLYnXfYqPZroQPWgZKOVAp
         +S4umnfCC8eg7vHcILKAra95/Q7Dfpqn27QHmqtMsseRgFw/b3ejLbP4RrX6MuJwEZXO
         6dsX8EVlnqnZri3ZUCSCg3DmIzEOFNYvCl63Z/txXXYkD0QS+cWizVecR0m5djyzwe68
         aC5Zzowi/jxa2Go3lM7dAQBYTmWFVA4A4hheuniRpdcwrTW1IIpSDfKNXGVMt7/APl+b
         sVMu1noJ6M22HOaWkbhmHzpluH6sYuMEs7/SbnATbFXGeQ5oj7QYvEgZ//PcCjr3LJfE
         6Njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WXBBBvwV6p1U7oDBizfZ/DqhyRQaVIXZ8CHVKw/qnpw=;
        b=jF91as2nnRCkXd458PGmovSSPjooXs12dIQzPo12YmP+s5gxO32rOFRJw5tK0J6B79
         h40WPgvn83AmjtROwsA8i3dyNkldFpD7v3+hmRWU7lHI6fnH7DHSJrHSb8nbzW9LS/yi
         Ms1C4MCGFm1QIOD6Rbpm2jPD4Cpwgpb5POX696Nj9EJrz07uag2Vl8gKy/l5wudZMiW6
         gCE26majOizMu99I+Iz7mNTyjRFrb59W8/ZW99mtE5W5PjZuIpe5C2I0HdiETkB7POv+
         Je+ZFfmHYfb8qhK3cPXefBhj+I7zqbBkuZTb9vxLh1FI7WLdMXW+0rN2Fi4J5H9iroG3
         wVwQ==
X-Gm-Message-State: AOAM531xq1bLPZt5rXd3OeIUupklurrAzAL93cC7fWjhisKjj+jhE5JE
	pFyZkJvTk7sXOdnbhQpmNmgbwdJHvVirodDOMt8=
X-Google-Smtp-Source: ABdhPJzWBDjz9ukD0HFkirtWO5cP1IDIWe95dti4OHLhiObljin5m+vOMY98smMCM6DZbvkhet5+eTV2Xeek2AQEyUk=
X-Received: by 2002:ac2:5387:: with SMTP id g7mr4626181lfh.138.1613063598383;
 Thu, 11 Feb 2021 09:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20210211165229.741761-1-alistair.francis@wdc.com>
In-Reply-To: <20210211165229.741761-1-alistair.francis@wdc.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 11 Feb 2021 18:13:06 +0100
Message-ID: <CAHtQpK7yL4JGRK1FVGW-yoBr63iHnRfv3nvdYbLemePqVBoFeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Enable building for RISC-V 32-bit
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, alistair23@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello Alistair,

On Thu, Feb 11, 2021 at 5:52 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  ...ort-for-io_pgetevents_time64-syscall.patch | 58 +++++++++++++++++++
>  .../openssl/openssl_1.1.1i.bb                 |  4 ++
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch b/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
> new file mode 100644
> index 0000000000..591354fbb9
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
> @@ -0,0 +1,58 @@
> +From d1a1b797d961301fd58513e50ac5de9ad5b8bc08 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Thu, 29 Aug 2019 13:56:21 -0700
> +Subject: [PATCH] Add support for io_pgetevents_time64 syscall
> +
> +32-bit architectures that are y2038 safe don't include syscalls that use
> +32-bit time_t. Instead these architectures have suffixed syscalls that
> +always use a 64-bit time_t. In the case of the io_getevents syscall the
> +syscall has been replaced with the io_pgetevents_time64 syscall instead.
> +
> +This patch changes the io_getevents() function to use the correct
> +syscall based on the avaliable syscalls and the time_t size. We will
> +only use the new 64-bit time_t syscall if the architecture is using a
> +64-bit time_t. This is to avoid having to deal with 32/64-bit
> +conversions and relying on a 64-bit timespec struct on 32-bit time_t
> +platforms. As of Linux 5.3 there are no 32-bit time_t architectures
> +without __NR_io_getevents. In the future if a 32-bit time_t architecture
> +wants to use the 64-bit syscalls we can handle the conversion.
> +
> +This fixes build failures on 32-bit RISC-V.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/9819]

This PR and related commit has not been integrated in 1.1.1-stable
branch, and according to Arnd [1] - it might be wrong.

I do not know if this can be taken like that, but just want to point
out that upstream did not fully take the change you're providing here.

> +---
> + engines/e_afalg.c | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff --git a/engines/e_afalg.c b/engines/e_afalg.c
> +index dacbe358cb..99516cb1bb 100644
> +--- a/engines/e_afalg.c
> ++++ b/engines/e_afalg.c
> +@@ -125,7 +125,23 @@ static ossl_inline int io_getevents(aio_context_t ctx, long min, long max,
> +                                struct io_event *events,
> +                                struct timespec *timeout)
> + {
> ++#if defined(__NR_io_getevents)
> +     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
> ++#elif defined(__NR_io_pgetevents_time64)
> ++    /* Let's only support the 64 suffix syscalls for 64-bit time_t.
> ++     * This simplifies the code for us as we don't need to use a 64-bit
> ++     * version of timespec with a 32-bit time_t and handle converting
> ++     * between 64-bit and 32-bit times and check for overflows.
> ++     */
> ++    if (sizeof(timeout->tv_sec) == 8)
> ++        return syscall(__NR_io_pgetevents_time64, ctx, min, max, events, timeout, NULL);
> ++    else {
> ++        errno = ENOSYS;
> ++        return -1;
> ++    }
> ++#else
> ++# error "We require either the io_getevents syscall or __NR_io_pgetevents_time64."
> ++#endif
> + }
> +
> + static void afalg_waitfd_cleanup(ASYNC_WAIT_CTX *ctx, const void *key,
> +--
> +2.23.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> index 86950f7544..599d78abea 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> @@ -23,6 +23,10 @@ SRC_URI_append_class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> +SRC_URI_append_riscv32 = " \
> +           file://0003-Add-support-for-io_pgetevents_time64-syscall.patch \
> +          "
> +
>  SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
>
>  inherit lib_package multilib_header multilib_script ptest
> --
> 2.30.0
>
>
> 
>

Link: [1]: https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc#comments
-- 
Regards,
Andrey.
