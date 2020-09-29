Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.13399.1601353465855736386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 21:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m8LeXBDF;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id q5so3202796qkc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 21:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDxZgIePUWoR5qutCLJEewV8bOgTbtVW4N/wMkfA9Tc=;
        b=m8LeXBDFDupLui7NUOG4CC/azd1aH+9rP+M/MUnvYueb7l/z5thhCV1Yscc6DHnpC0
         m+8YKnvI2ZI7McP13xfEiZvISFgOUiu3U2F8AAi+3EoSI9NXqRu2upUrIcld1Xq3OuFR
         LhXcCD8T6ThBA1A8gdiKNMYbcjk9jNj7WxyijWPYCQ9KtAjf50yqctNyfqigTxWdoPR8
         IJtczVZ0OwTvwn5GlHxtHLE6L9XdAPY1zFdjqPQ1/ZIEm5ZvRE7X5jBjR1aL5qnVcqmS
         4EZrNX0rWh5Xg/P4z9peOgqsXGoPhSEtQWNnicPKpXLU9ODNJA+KY5zt83VubPPnn0K7
         Vp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDxZgIePUWoR5qutCLJEewV8bOgTbtVW4N/wMkfA9Tc=;
        b=R87zF9BJSxPI4mbc9honkW1ldC4YV6AQVxWuBUY0qAefSCS+IvdzIqxQu6xCVrcuAy
         sBsrBybOXYh+VHV+G3VigZQ3pKhrIj1Ux1eOeojOQHc4dDdgk/pY/rjIk5OuNAUTVimm
         ScZtas/PqvImpmB3ewdyx1C7lqf1iOEV9QbnZI2KxSoQFCcv/Zc5s2lr+IsBx1dn9SqC
         xhEaHf4Hei2B/Dkv2YBYm8NVPyUxV7oxTXOmlQTbCRFgdLNxOT/YuS0rVgfqNhQqsK54
         Ud+Dv4hGtaujU07WQN5ZToNc+sRHgCy5dxnJSIJKttbwKLfKcRi8MSYwphUmEAXckyDJ
         XQGA==
X-Gm-Message-State: AOAM531yRY2T6omwPq+demARxBV4fpuUeoA+eeJELcn49YS7KVgjLoFc
	UQ2bkPCtm+HOwOQhJai2Wo0PbVAH5DPVuyfHpvg=
X-Google-Smtp-Source: ABdhPJz12LRkCet48D9X1H7n03yar6/Puquinp77uQQZsLmoaMpBYe5zyiA1sPBDvfXHAidlUTbm0Zks9c59JnYXAPg=
X-Received: by 2002:a37:c408:: with SMTP id d8mr2610007qki.71.1601353464847;
 Mon, 28 Sep 2020 21:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200929032216.32161-1-Qi.Chen@windriver.com> <20200929032216.32161-3-Qi.Chen@windriver.com>
In-Reply-To: <20200929032216.32161-3-Qi.Chen@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 28 Sep 2020 21:23:58 -0700
Message-ID: <CAMKF1srVBciPuLDgfGKyEVhFX8sbLd=H=CSOTzq-c21XCHH+-g@mail.gmail.com>
Subject: Re: [OE-core][PATCH 3/3] nfs-utils: fix configure error on some hosts
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 8:22 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> nfs-utils' configure.ac hardcodes the rpcgen's searching path. However,
> on some hosts, rpcgen is missing but SDK provides one. We should avoid
> the hardcoding so that nfs-utils could be built correctly under SDK.
>

perhaps its better to always require --with-rpcgen there is no need to
look into host paths

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...gure.ac-avoid-hardcoding-rpcgen-path.patch | 31 +++++++++++++++++++
>  .../nfs-utils/nfs-utils_2.5.1.bb              |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
> new file mode 100644
> index 0000000000..5602e5be57
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
> @@ -0,0 +1,31 @@
> +From b9049fbf051e559941298afd57ec43d6f6a5490d Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Wed, 29 Apr 2020 08:56:05 +0000
> +Subject: [PATCH] configure.ac: avoid hardcoding rpcgen path
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + configure.ac | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index f9efdb7..8e8aeaa 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -152,8 +152,9 @@ AC_ARG_WITH(rpcgen,
> +       rpcgen_cflags=-Werror=strict-prototypes
> +       RPCGEN_PATH=
> +       if test "$rpcgen_path" = "yes"; then
> +-          for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
> +-          do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
> ++          #for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
> ++          #do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
> ++          RPCGEN_PATH=`which rpcgen`
> +               if test -z "$RPCGEN_PATH"; then
> +                       AC_MSG_ERROR([Please install rpcgen or use --with-rpcgen])
> +               fi
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
> index b8ad23a0d8..b06ce2d0af 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
> @@ -30,6 +30,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>             file://bugfix-adjust-statd-service-name.patch \
>             file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
>             file://clang-warnings.patch \
> +           file://0001-configure.ac-avoid-hardcoding-rpcgen-path.patch \
>             "
>  SRC_URI[sha256sum] = "0f1c8170e16a07d9836bbf0836d48d0c842b6f0e0e8b18748f099751851d30c4"
>
> --
> 2.17.1
>
>
> 
>
