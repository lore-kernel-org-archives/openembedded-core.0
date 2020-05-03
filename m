Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.33201.1588546316851846034
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 15:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NEFzzHqb;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id e16so13614174wra.7
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ppf2Uy1TQkEsALNk2a4tIZUW3YMrHSi9Oxgj10J6Pxc=;
        b=NEFzzHqblw7yhnACK1gyzgfPAuacOXgFy/1COO8jx6WY0nmEKRApMY3pJTMX1WL7+e
         eHP5k0Q0Qh9VbhkwoGRUsgPZRi2O6cGjfDIc8/LdXxddzwMQ+tiykgVZvrLFVtAF4VDS
         3H7cOeKkk8hoGHoyCj1MRPeRjrXTAQDSMVdX9ewKF3ppM60oh8ZIZKV55k0XjldgxnG/
         +SZ8UfaS0Bgo/Zg0JDJ+hXDnvLLwgZWyNtQJmUkRIdGdR+YsUXu/FEgACx29d0g34L3u
         1E8Z/WdiwOo+M6F5iYbZLLhxyp2Q9u0GESNqqw5KzvkNFDSBVvPd/v3ft4wDMoUTnN7v
         wXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ppf2Uy1TQkEsALNk2a4tIZUW3YMrHSi9Oxgj10J6Pxc=;
        b=YXLNg7COt8P0pBFdhdU9+34pLD4r6NfyKWu4inejR6U15Czh37Q/JgZb7DUxsIQSsS
         udjrycrfuoZzRPeI3qWiV3tLTR7KjggYdR7OFne9+DkqwfdDWd6ie+RyVuUj0RQaN6SY
         nnHLsZDJItSrELjlnV7Xj5TXFu2sZzKkepyZ7Sl8dleakmlPH8pAJvuUt3o1NNLLoJsN
         JJxxVjUPvjgQBbHNqYfCTQCobFojJ83AyMOqmItes7JPS4w1YrZXpKgnEiPlLmPX8S52
         CW98WJ60d2oEYige3sEvhid7hPzTtibb8U5LvvGAw7DF6fYDJUqika1FfjW5+sBgVEzD
         9eVw==
X-Gm-Message-State: AGi0PuaKYAqSkbApTqcYivabD4fW/QTmOWPCQR5nSeSPy6ftALrQiIWq
	8YRQN9DEXQ45VsPWWh2+MJsWxcrHYJvuZ68xfTE=
X-Google-Smtp-Source: APiQypJEpI6j5mtH1u8LL0w9ebWg2JC6a0dIJvDgnEP3BUUReNz4CybV8SBbEo/IB998StQ/3unA/gXa3cuI/VDt1Kk=
X-Received: by 2002:a5d:5445:: with SMTP id w5mr3862391wrv.422.1588546315193;
 Sun, 03 May 2020 15:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200428125747.27422-1-ovidiu.panait@windriver.com>
In-Reply-To: <20200428125747.27422-1-ovidiu.panait@windriver.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Sun, 3 May 2020 12:51:44 -1000
Message-ID: <CAGDS+n=sk=UvThgL+VTa=L3mbbymTdPPYciRkT3Uw+ybrucLgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] populate_sdk_base: Add ld.so.conf for nativesdk-binutils
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Should I consider these two patches for dunfell LTS?

Thanks!

Steve

On Tue, Apr 28, 2020 at 2:59 AM Ovidiu Panait
<ovidiu.panait@windriver.com> wrote:
>
> Extend the functionality provided by commit [1] to the SDK as well. This way we
> can make sure that nativesdk-binutils finds SDK libraries first rather than
> host ones.
>
> This is useful for example when trying to build the linux kernel using
> nativesdk-gcc. This scenario currently fails because it tries to link to host
> libraries rather than SDK host ones:
>
> make x86_64_defconfig
> make bzImage
> ...
> error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel
> Makefile:1101: recipe for target 'prepare-objtool' failed
> make: *** [prepare-objtool] Error 1
> ....
> /../../../../x86_64-wrlinuxsdk-linux/bin/ld: /lib/x86_64-linux-gnu/libpthread.so.0: undefined reference to `__libc_vfork@GLIBC_PRIVATE'
> ...
>
> [1] 15049c610b [buildtools-tarball: Add an ld.so.conf for nativesdk-binutils]
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/classes/populate_sdk_base.bbclass       | 5 +++++
>  meta/recipes-core/meta/buildtools-tarball.bb | 4 ----
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index ef0d8bef58..6a1ebc8c02 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -185,6 +185,11 @@ fakeroot create_sdk_files() {
>         # Escape special characters like '+' and '.' in the SDKPATH
>         escaped_sdkpath=$(echo ${SDKPATH} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
>         sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
> +
> +       mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
> +       echo '${SDKPATHNATIVE}${libdir}
> +${SDKPATHNATIVE}${base_libdir}
> +include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
>  }
>
>  python check_sdk_sysroots() {
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index 977b6a5e1d..c49802eef8 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -76,10 +76,6 @@ create_sdk_files_append () {
>         echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
>         echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
>
> -       mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
> -       echo '${SDKPATHNATIVE}${libdir}
> -${SDKPATHNATIVE}${base_libdir}
> -include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
>         if [ "${SDKMACHINE}" = "i686" ]; then
>                 echo 'export NO32LIBS="0"' >>$script
>                 echo 'echo "$BB_ENV_EXTRAWHITE" | grep -q "NO32LIBS"' >>$script
> --
> 2.17.1
>
> 
