Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.8759.1601336674362464629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 16:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fUUNyIPm;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id 16so2754355qkf.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 16:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QdNAGn59aQnOwgeIPCXNmmHMx/bGJdSqa2Vlp57x7j4=;
        b=fUUNyIPmVQ7syCqYGmCb+A6DBNG77XsSraNKu4nPS8giNaNV9nGrZI8pQFB3evR/Z1
         5F6jOVmZztkOrwd0BwCwCqUa4tqSfw+pYkjRwY0Mjc69ZxsfMa3TPBjeLcjDG7bqNwOA
         l/dUSuRGC7ckVNQwVgxCHPtuRuTJR+HXUa5U/2OFCnZtxfwDbU4bXPe39YHJ+VqLAdC/
         l0sby0lbDHBjeICSjkbA65UTn+bllKxUomvdI6tZnibjRk/94tbQTeqPzAF/y9DvgHjP
         Z4oURGfByhkI3AeLA1iCqG56sdlCXPLi5pMXt8Jbvf/ExtmMoskOds5sA9kaH7oYiBTS
         FImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QdNAGn59aQnOwgeIPCXNmmHMx/bGJdSqa2Vlp57x7j4=;
        b=JnwG/V5jcs0irdqyszq3JUAQrMqCuCuiavWmonQbT1wv0CoJwQDFUhY8Aghg77ictf
         J8EfEhqlgm+RBbnuaA+MGWusxmZoR5ughMnHN4uN1crjaof6PZq9iVR2SKveu+OMWh/5
         4PjFZC4Iw5RPHS+OQ80hOvB/Ys/Clh2cX14ZMstQa7lpoCR2N/Z3NdOZF/NIBzseOtmX
         tMrczfnCUZKc6+pLaXMnXbOw22XcuX3jX2pxxZFHAb6EAGYRsWWiLw1Qt1AgNBsFcwPp
         YXfcSGhVY5ObISLpAJpdfkHwZrSHzhk6zcEmj67XU+44NTaobN54fF1puIizANovQ4Cf
         zCpw==
X-Gm-Message-State: AOAM530w7TLEn/OXrepN29UyNltXu24PeAQJFta3+LaX17rWLOpUgCHF
	vAy2h+lfDgB2lm7IH8QdrAWUSELdgBQfUpfJJCg=
X-Google-Smtp-Source: ABdhPJxsgKcx8+sLl532koq/kb/gw8C8g6LPiAGs31Q1fb2BiNKoVQQ3f7iJ1JilUUuOLhTYe5r6P9vEClM685u0Stk=
X-Received: by 2002:a05:620a:1670:: with SMTP id d16mr1967649qko.474.1601336673289;
 Mon, 28 Sep 2020 16:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200928161900.452970-1-ross.burton@arm.com>
In-Reply-To: <20200928161900.452970-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 28 Sep 2020 16:44:07 -0700
Message-ID: <CAMKF1sruPxkG5z_t9C4K6ZxGOXVFyg6yJ4PRDMBPbMu=HKkdqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] glibc: make nscd optional
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 9:19 AM Ross Burton <ross@burtonini.com> wrote:
>
> NSCD itself is already packaged into its own package, but if it is never
> going to be needed then it can be disabled and it won't be called from
> glibc at all.  Add a PACKAGECONFIG for NSCD that is enabled by default.
>
> As a side effect if NSCD is disable, glibc with and without systemd is
> binary identical, which helps sstate reuse.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/glibc/glibc_2.32.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
> index 7049e61625..2a0e464385 100644
> --- a/meta/recipes-core/glibc/glibc_2.32.bb
> +++ b/meta/recipes-core/glibc/glibc_2.32.bb
> @@ -69,13 +69,15 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                  --enable-stackguard-randomization \
>                  --disable-crypt \
>                  --with-default-link \
> -                --enable-nscd \
>                  ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
>                  ${GLIBCPIE} \
>                  ${GLIBC_EXTRA_OECONF}"
>
>  EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
>
> +PACKAGECONFIG ??= "nscd"
> +PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
> +
>  do_patch_append() {
>      bb.build.exec_func('do_fix_readlib_c', d)
>  }

The patch looks good to me but
I wonder if this goes beyond glibc and more like a distro features,
where you can also ignore nsswitch.conf and
packages being aware of it.

> --
> 2.25.1
>
>
> 
>
