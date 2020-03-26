Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.779.1585243422509227813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 10:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=El9Xn66D;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id x82so4348954vsc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S2kjJ8Uwvvl2mtqoRPksr1ynVHuNmMUjjcNJif5aE2E=;
        b=El9Xn66D+UWlC3lBmMUZfCRUApe6kStlcchyGOw/k5IQjmTttJHB295F9k3GUeHNXQ
         2UrKXlD4BAFPrUnsA9JDQXGLpNjivLT/To3TcUYhhnum+NbErpqyvhM7QeIQkCgNW5pJ
         MBMS6CVbYcdIv3tLCmRg9+sTjsP8vhg+xFZUN44PGKH6lc58UOtrNR7P/dW+JI0q5e5W
         V++lFZ2yj7U7GckTx6bemJR8MGNpIsyKf719pLWqOZMNJN8B+XA2p8In8teTJ9iPMMtT
         Bst+6dVthkNIhWaE3m4Yl4dnL3sscWIpkFzPQjDaS8Lkr+c6Gn37+1mM2Jd1RcsUjylu
         p7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2kjJ8Uwvvl2mtqoRPksr1ynVHuNmMUjjcNJif5aE2E=;
        b=jM7u2MBLfcCV9LDK6GS+ZBre9Z3KOCCEMoxndYoYh6JZuO0ge36gELP3r2zSXZWaQS
         8hk6lBpWKHR8ye9xkkcFU8lhcXyzcxBYO5e9aJ3/Dtj2CmzO0+6+2E/qLLbYmU7Lrlwm
         nVAoq/6NM0B+O3nu7CcpDSrme2BSJMqR5s6DpWVctCAhXaQawm31dcFPS6QJv7pBPvvC
         4NeYJrJsF99/0UV3RQGj39WyCFImeAaS6SQb2g6NFeOpLhTJ9ntwtNM5cOI/R6DPoLqt
         wkUnh8UtM+taJznraQXFmoodCGOuVlJcG68qZUi0MOrGa9EAeMHeowtUEcPx21cZsNuq
         /SUg==
X-Gm-Message-State: ANhLgQ0jR7jwLEuyVBsXCUwe82YQ8724hIDx96Jp+GF5ZYD6KtdeKCdt
	DwuL/GiOaqbOawIgaHCYUyfWKXbNvuq2PKjoXoY=
X-Google-Smtp-Source: ADFU+vtoytucVwVpizDs9IX2LlUmA9M5Pt4Cy+9OgnY9K1vFSa1JpJeogCauOTw8EHX8MZyAffS1YWXIUj8qSIzYdVE=
X-Received: by 2002:a67:80d6:: with SMTP id b205mr7574627vsd.137.1585243421564;
 Thu, 26 Mar 2020 10:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200326152629.29272-1-stefan.ghinea@windriver.com>
In-Reply-To: <20200326152629.29272-1-stefan.ghinea@windriver.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 26 Mar 2020 10:23:35 -0700
Message-ID: <CAJ86T=UQQSRy8zMU4EXBF2HVx0Tm4HLq2LhFx=t529UF6nR92Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
To: Stefan Ghinea <stefan.ghinea@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 8:26 AM Stefan Ghinea
<stefan.ghinea@windriver.com> wrote:
>
> From: Catalin Enache <catalin.enache@windriver.com>
>
> When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> since the Thumb frame pointer in r7 clashes with pulseaudio's use of inline
> asm to make syscalls (where r7 is used for the syscall NR).
>
> In most cases, frame pointers will be disabled automatically due to
> the optimisation level, but appending an explicit -fomit-frame-pointer
> to CFLAGS handles cases where optimisation is set to -O0 or frame
> pointers have been enabled by -fno-omit-frame-pointer earlier in
> CFLAGS, etc.
>
> References:
> https://www.openwall.com/lists/musl/2017/10/09/2
>
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 4e32b27087..c7f3e67022 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -63,6 +63,14 @@ DEPENDS += "speexdsp libxml-parser-perl-native libcap"
>
>  inherit autotools bash-completion pkgconfig useradd gettext perlnative systemd manpages gsettings
>
> +# When compiling for Thumb or Thumb2, frame pointers _must_ be disabled since the
> +# Thumb frame pointer in r7 clashes with pulseaudio's use of inline asm to make syscalls
> +# (where r7 is used for the syscall NR). In most cases, frame pointers will be
> +# disabled automatically due to the optimisation level, but append an explicit
> +# -fomit-frame-pointer to handle cases where optimisation is set to -O0 or frame
> +# pointers have been enabled by -fno-omit-frame-pointer earlier in CFLAGS, etc.
> +CFLAGS_append_arm = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"

This is OK and safe to merge but note that it's now regarded as the
"old style" fix for this problem. The newer approach is to tweak the
asm code to save the frame pointer before making the syscall and
restore it afterwards. e.g.

  https://github.com/strace/strace/commit/0c75ebaad09d6d3f2395dfe6160904af883dd0d9

If pulseaudio can be fixed in the same way then that's probably a
better approach.

>  # *.desktop rules wont be generated during configure and build will fail
>  # if using --disable-nls
>  USE_NLS = "yes"
> --
> 2.17.1
