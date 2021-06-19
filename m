Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web09.25202.1624130052152052211
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jun 2021 12:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W2JzX8KL;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id r7so10197291qta.12
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Jun 2021 12:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q+8mHQItCATfoPtcu9uq0ExQSpcrM1lhv1oKZWEnv5I=;
        b=W2JzX8KLyhIbBtrkBiYZeOPoMHMzKn3WYiVsETaHFTtUruCSQeqQgC23CYig//xEAs
         oSm19yriwL4L/dS981AcB1RNVXnvSYJK2S3SsN3zkaLN6gCBLS4xjw9RJxqhKzA2Xivr
         lCYHR1MyE9IfEeMpgMq6iiON9KjfKLZ0NQ+/ilfD1ANKTEp42yKCp9C12v9MlIg1YcfT
         jikzmw54lgTMisBazGMLHZB/I6BcsBrW6MqjdXDWI1WcVoCDtDIbOxqq8QtOlISPuzp1
         ubfFpcdbP66pqfIg6Pz9aoJ9tdLBfPkYC4IpjK2ZuPucd2EqBz8LAwZpmUFaKAkjYFAZ
         C3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q+8mHQItCATfoPtcu9uq0ExQSpcrM1lhv1oKZWEnv5I=;
        b=WYg5wmTraeieJv0Vekr6Jt7z/4aRQ32IEkhBuHoHrHF0SggVjgW/wmAxVw0IOEFrvG
         ZtNZGnr7yKumzVDn+AppsKgVC6AKCKhrrIx7fJOi+/lMaRWJeXLlfpwv70/rREQS0n2L
         t7lIUs/o+s/nGf3TB2rpOMDgq6NxinYY3BQ59tqBLFq4hhCsCQg9+ID/dKlfUDwYcbfO
         RWu7hBQjz7mVBO6GOaUdQC64HrGYN+iq39Q9LMajmRDBWdO/lHSKeqX+rtpsQizz9KTc
         B7RIRJuWo+oxJw6hMs1ruHCrmFYWyviyOdi5FzycP2EW900OceGQGMK0LXyrh5+yjcvp
         mFUA==
X-Gm-Message-State: AOAM533sushh6dZQkwwif/LOCJuOI9Ck+AEIsVckigmrfIAGyQi+0i4S
	81ZoZ7JjE0O9/JdvxDI0xWNur7HDrtv8KL8D5sw=
X-Google-Smtp-Source: ABdhPJzyu2ijP2g/9F48I6lh/Dk2Nwg3NXDcG3RybvBDGWQk/qrarc/n6b9M+MYKA3vco8x4f7mp7wneAoc3fXTLQGc=
X-Received: by 2002:ac8:4b4b:: with SMTP id e11mr5498301qts.289.1624130051169;
 Sat, 19 Jun 2021 12:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210619095845.1853470-1-alex.kanavin@gmail.com> <20210619095845.1853470-2-alex.kanavin@gmail.com>
In-Reply-To: <20210619095845.1853470-2-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 19 Jun 2021 12:13:45 -0700
Message-ID: <CAMKF1sqdh+8bVneqeJ-Z8YygAk8MhmRKiqyHYBcMqkXA7eARtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] glibc: do not enable memory tagging on aarch64 just yet
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 19, 2021 at 2:59 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Sadly, it seems to break copy-on-write as reported here:
> https://lists.openembedded.org/g/openembedded-core/message/153082
>

looks ok thanks for the patch

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.33.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> index b70cd0978a..caa2e2ae18 100644
> --- a/meta/recipes-core/glibc/glibc_2.33.bb
> +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> @@ -90,10 +90,10 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
>
>  EXTRA_OECONF_append_x86 = " --enable-cet"
>  EXTRA_OECONF_append_x86-64 = " --enable-cet"
> -EXTRA_OECONF_append_aarch64 = " --enable-memory-tagging"
>
>  PACKAGECONFIG ??= "nscd"
>  PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
> +PACKAGECONFIG[memory-tagging] = "--enable-memory-tagging,--disable-memory-tagging"
>
>  do_patch_append() {
>      bb.build.exec_func('do_fix_readlib_c', d)
> --
> 2.31.1
>
>
> 
>
