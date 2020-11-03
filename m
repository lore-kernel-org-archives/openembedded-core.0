Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.3814.1604409315902071805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 05:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i5+Wew6F;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id ay21so4833798edb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 05:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JzZAqU0dNjjg17VCQjzYhSTwR3JpT2K1bLG2rtf1f6A=;
        b=i5+Wew6F5C/1fIIN8CXXGh4SVIgFvxz6XdsT+Bvh55WP9oamXyhwctfsezTcyjy4rn
         9SXuR+XHOP/HdJ18g2o0DWZBfTDLi7dPl6k2XNDtgYiJbq4yRDwU5gVec+kC8Hg1qiGQ
         hmcrZSSur01vnjnrul7JqLBoKyilj5eZlwoxLlq8Q6r725U5bZH0YR8pnMGTunGEI/ln
         uhVezuLjzLvgkjm+C81DIpX3Vx8RGkIk4oxVYz8Iv8di5ORnLEhibzZs1hBr5ok0exbd
         bobQY0S8fM6Lw3cUlTLzA60Hc58j2fO2bYjIezNdEA860Br9ABTWqehW1vd4RL+HdG5g
         lThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JzZAqU0dNjjg17VCQjzYhSTwR3JpT2K1bLG2rtf1f6A=;
        b=ddL4UgT9/HEdqo1tNDR7sy2v5KNj5eJ5/lpYWZ8PBqAyXfwVpPp+//mRyVj7gcRyhB
         Bl7LmStQsD0ZXzEOlG5WydzLPdShQCVBq4PFDP7U6E+vUkoAlV/rur5SF3ud1GbPleHg
         DqmKbFD+P6ds7N8s6DJqglnT9h1psnDo+bQOKvAQXL/fEiSAlO0Tg0ORH0HPUQwBLA55
         3sRPEpuILzJ1llarPUZdvpUFkbaTebhBcg9PMvp0bGiXuBY9L5PmbohPjUG8LquuttyJ
         GWJ9WsJF8oMnmepKgi4mqnYIFwxZvUIf5L8y6aaBHJp0VJl/5YfSHEvlnh3635RwP6k7
         uf8g==
X-Gm-Message-State: AOAM531Hpys7dSfv1HLCyesxirTA1ZQoKWG6Y4PJgQ41+ted4gcXrv9P
	Oh+SeorvVViqvqTpXSx/R5B05YvdFufe/jQh+gk=
X-Google-Smtp-Source: ABdhPJyxTgi4VZyEZnr1M3uxXD1bXIKNrsWqy1E+5QTucJjUoA5Dt6XSwIK7Gj0b/3ts1dQPlrA4SfHH/MJm1qd4RaI=
X-Received: by 2002:aa7:d407:: with SMTP id z7mr18410673edq.234.1604409314282;
 Tue, 03 Nov 2020 05:15:14 -0800 (PST)
MIME-Version: 1.0
References: <20201102222852.38452-1-jason.wessel@windriver.com>
In-Reply-To: <20201102222852.38452-1-jason.wessel@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 3 Nov 2020 08:15:02 -0500
Message-ID: <CADkTA4PuAX+p96ogha6vRcpz_-3DSOYRTZ4hOZ6id6acVGgAJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] base-files/profile: Add universal resize function
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 2, 2020 at 5:29 PM Jason Wessel <jason.wessel@windriver.com> wrote:
>
> Using an editor or any kind of command line that wraps beyond the
> column width of the session on a serial port is quite problematic
> unless you are using an 80x24 session.
>
> The original /etc/profile tried to use the resize binary if it was
> available.  The problem is that you only get the resize binary if
> xterm, or busybox is installed.
>
> This updated /etc/profile will add a resize function available to the
> shell when no xterm or busybox resize binary is found.  More care is
> taken in this new version to test that terminal is interactive.  The
> EDITOR and SHLVL environment variables are checked to prevent resize
> from running necessarily.
>
> The function definitions are not indented intentionally to keep them
> to the 80 column width.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  .../base-files/base-files/profile             | 48 ++++++++++++++++---
>  1 file changed, 41 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
> index 9e4283e0c7..cc37e1ba77 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -2,7 +2,6 @@
>  # and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
>
>  PATH="/usr/local/bin:/usr/bin:/bin"
> -EDITOR="vi"                    # needed for packages like cron, git-commit
>  [ "$TERM" ] || TERM="vt100"    # Basic terminal capab. For screen etc.
>
>  # Add /sbin & co to $PATH for the root user
> @@ -20,13 +19,48 @@ if [ -d /etc/profile.d ]; then
>         unset i
>  fi
>
> -# Make sure we are on a serial console (i.e. the device used starts with
> -# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which tries do
> -# use ssh
> -case $(tty 2>/dev/null) in
> -       /dev/tty[A-z]*) [ -x @BINDIR@/resize ] && @BINDIR@/resize >/dev/null;;
> -esac
> +if [ -t 0 -a $# -eq 0 ]; then
> +       if [ ! -x @BINDIR@/resize ] ; then
> +               if [ -n "$BASH_VERSION" ] ; then
> +# Optimized resize funciton for bash
> +resize() {
> +       local x y
> +       IFS='[;' read -t 2 -p $(printf '\e7\e[r\e[999;999H\e[6n\e8') -sd R _ y x _
> +       [ -n "$y" ] && \
> +       echo -e "COLUMNS=$x;\nLINES=$y;\nexport COLUMNS LINES;" && \
> +       stty cols $x rows $y
> +}
> +               else
> +# Portable resize function for ash/bash/dash/ksh
> +# with subshell to avoid local variables
> +resize() {
> +       (o=$(stty -g)
> +       stty -echo raw min 0 time 2
> +       printf '\0337\033[r\033[999;999H\033[6n\0338'
> +       if echo R | read -d R x 2> /dev/null; then
> +               IFS='[;R' read -t 2 -d R -r z y x _
> +       else
> +               IFS='[;R' read -r _ y x _
> +       fi
> +       stty "$o"
> +       [ -z "$y" ] && y=${z##*[}&&x=${y##*;}&&y=${y%%;*}
> +       [ -n "$y" ] && \
> +       echo "COLUMNS=$x;"&&echo "LINES=$y;"&&echo "export COLUMNS LINES;"&& \
> +       stty cols $x rows $y)
> +}
> +               fi
> +       fi
> +       # Use the EDITOR not being set as a trigger to call resize
> +       # and only do this for /dev/tty[A-z] which are typically
> +       # serial ports
> +       if [ -z "$EDITOR" -a "$SHLVL" = 1 ] ; then
> +               case $(tty 2>/dev/null) in
> +                       /dev/tty[A-z]*) resize >/dev/null;;
> +               esac
> +       fi
> +fi
>
> +EDITOR="vi"                    # needed for packages like cron, git-commit

If we set vi as the default, should it be in the RDEPENDS for base-files ?

It's a bit of a grey area, since base-files has some special
dependency tweaks, and you actually need to trigger some functionality
for this to be used .. hence it isn't a hard rdepends.

Bruce

>  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>
>  umask 022
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
