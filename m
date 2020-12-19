Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.12438.1608399928435635291
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 09:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=diRJTlmD;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id 143so5216835qke.10
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 09:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EhS5FAKekF7JX/qBMv9IdMuQPd2oXF2MsW9d2MIyLgU=;
        b=diRJTlmD1VrOIvLDL5DRokvYajaALaWJo9INnmgrBC8vKyzkDTI3MHDTb5UI9P8lbU
         jkWtEaeulUEmjdoSmDiRKjeQBLLblM2W5VO7g8aslcdDPw+1+dPaRtFIEGn8MD3MUjVY
         IFF2Z10jmlXDli0VpnJDWvJj8I6kVFW3Lk5LgBuZD1IFVZORpXHlMjQ//Jr4gLhCLlM+
         o6aU4KJaW+IS3glUOHGfFy8TgP92HRAW5Mwk54kvGeGodwK5+RnnqjT2TIs8ZbL05LXE
         JPSxDcIOGaCaDmUs1E9CQl8vBgqRSM8kXv0P64kRLz+4hchFb6uresTlaNn/vB9lsCKD
         nPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EhS5FAKekF7JX/qBMv9IdMuQPd2oXF2MsW9d2MIyLgU=;
        b=leDltDOlIWVohWaL5CmKysZZO6hWTZE9qJ5YG0/B7A1k23Tf46TE3Srje+i+6DDzlS
         EhnzMNYsclDG0lv+iakXYe7IYYMjItOhTNF7szkU38yLR+tYLl71gm8sBuB2wnURY8mR
         j0rEksw4i8m5W0IptNGA9NU0vgpU1Tgz4vR4RvjeR0wsi8bdSkQv8d//NDXp0OcDSkIB
         VcTpFTscWARa2MbtKdpiCqkOQWimSDhwfK4VIGDtstmQ7U9m+5POVZ0Dw+VokzdyoGJJ
         mQE3ORk52pP6wjMKvu8PkMrT9/7KmOfgf6NwtYnZVJnR6/O6O88r0bXgJcmY6Zs/VKTG
         A6aw==
X-Gm-Message-State: AOAM531Vp+gvV4t8Rw38t8ZvlidlQ5olKEJ+efLP78Rv49i6YZSHDYyw
	Jgn2JOuFl8r3KVFE/N+/No73zv64CIAfhiub+uw=
X-Google-Smtp-Source: ABdhPJxSDCIhcHNb59ph7XpwSmLo+VG215Ys2P9605GCywftmq1lhKWdke9SqWAD7lg9OZZN6kxqtm5RDOwV4inGD0s=
X-Received: by 2002:a05:620a:1139:: with SMTP id p25mr2441171qkk.9.1608399927571;
 Sat, 19 Dec 2020 09:45:27 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
In-Reply-To: <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 19 Dec 2020 09:45:01 -0800
Message-ID: <CAMKF1srt3iP-hd2eff2KarP6sAFcHcNb6DGt=kWLiMxRp=yxoQ@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Shachar Menashe <shachar@vdoo.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This looks a good improvement to me. I think it perhaps is a good idea
to disable them across
all openssl recipe types, but we might find issues with
native/nativesdk versions

On Sat, Dec 19, 2020 at 9:36 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The OE-Core list needs to be included on this so I'm doing so.
>
> Cheers,
>
> Richard
>
>
>
> ---------- Forwarded message ----------
> From: Shachar Menashe <shachar@vdoo.com>
> To: "yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>
> Cc:
> Bcc:
> Date: Sat, 19 Dec 2020 16:04:30 +0000
> Subject: [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
> 1. Drop support for many deprecated algorithms by default
> 2. Allow dropping support for TLS 1.0/1.1 via PACKAGECONFIG
>
> Signed-off-by: Shachar Menashe <shachar@vdoo.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> index 8159558..f9764bd 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> @@ -33,6 +33,8 @@ PACKAGECONFIG_class-native = ""
>  PACKAGECONFIG_class-nativesdk = ""
>
>  PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
> +PACKAGECONFIG[no-tls1] = "no-tls1"
> +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
>
>  B = "${WORKDIR}/build"
>  do_configure[cleandirs] = "${B}"
> @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
>  CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>  CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>
> +# Disable deprecated crypto algorithms
> +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
> +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
> +
>  do_configure () {
>         os=${HOST_OS}
>         case $os in
> @@ -122,7 +128,7 @@ do_configure () {
>         # WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
>         # environment variables set by bitbake. Adjust the environment variables instead.
>         HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
> -       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
> +       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
>         perl ${B}/configdata.pm --dump
>  }
>
> --
> 2.17.1
>
> 
>
