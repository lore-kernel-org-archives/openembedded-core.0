Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6A1C6FA8A
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:01:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.2809.1663063317071477053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T2183GS3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id bj14so19878993wrb.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=CENYTjEiq1vmrqySnB2DvKt9sSchfvE2B9iBW9SS0/A=;
        b=T2183GS3iaFiXvni456Df0cEUTXqbGzKlo8ZZBJfSKmxeWsuhnr/HPfopGkcFul/Mc
         RPUB2qgqPIC1vOTkz8ga4fYp+XldmIgPw8FMMsQW7qKvVmipBVGW2qoYjXFiwZAOfafe
         PR+u7eXNV5dc/XvjE1QZuGI3ATd4KJOCRDPwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=CENYTjEiq1vmrqySnB2DvKt9sSchfvE2B9iBW9SS0/A=;
        b=PDLt67lqIhMD0ZUdjBLkgBa9dLYYL+pd75m04BLpSyekdTSR8Whivjd3wZ+e0vhCfi
         Lf2CNzbo/MBO/U9RLXxCoccCj+2syNgkKUosGKgx/Lbe4P9AA0xLPV6hKEYdeLGpM9gW
         4pG8wn9Ay9ejhTBrPskcj2V+4VU0rAdGeinrJKKV9XeyvA3XDWwo0XdQhX/ihHA+QSMB
         +G5YrC9pZWvKYN3qB3bBzcWScY+ZKbfcQBrh+w3YBzzWhof8NposZpudzSnhNKfi1wD7
         g2a5N/j4ctZZh4IXybuuld0Qs7JI2igIaczAypOUzGLAUb8b04OIV9vdu+j5/yfdbaR5
         6KpQ==
X-Gm-Message-State: ACgBeo1CrL2Qh7OpJgVGFFMihJCqFYJyDv0S9f+l4WH9Uzyij+Y6ZnEo
	qc7EQRUJST20qvmXvN1xlgxJA0oRN2M98Q==
X-Google-Smtp-Source: 
 AA6agR6RTzHh1zMI/wKxew7XOktD+QGdeU96F6iHhIAUXC8NWNlGAL+h1uAsQheepRPXme3HngKgBg==
X-Received: by 2002:a5d:408b:0:b0:228:9c95:3b66 with SMTP id
 o11-20020a5d408b000000b002289c953b66mr18067427wrp.90.1663063315004;
        Tue, 13 Sep 2022 03:01:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b740:75b6:5b77:5982?
 ([2001:8b0:aba:5f3c:b740:75b6:5b77:5982])
        by smtp.gmail.com with ESMTPSA id
 a12-20020a5d570c000000b00228dd80d78asm9794942wrv.86.2022.09.13.03.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 03:01:54 -0700 (PDT)
Message-ID: 
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken
 native functionality
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2022 11:01:54 +0100
In-Reply-To: <20220913093452.47839-1-mikko.rapeli@linaro.org>
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 10:01:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170566

On Tue, 2022-09-13 at 12:34 +0300, Mikko Rapeli wrote:
> The python3-cryptography-native builds work but are functionally broken
> on Ubuntu 18.04 build host since the update from 3.3.2 in
> meta-openembedded/meta-python. If recipe needs and DEPENDS on
> python3-cryptography-native for signing use cases, loading
> the python modules fails:
>=20
> $ python3 -c  "from OpenSSL import crypto"
> Traceback (most recent call last):
>   File "<string>", line 1, in <module>
>   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/b=
usybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/Ope=
nSSL/__init__.py", line 8, in <module>
>     from OpenSSL import crypto, SSL
>   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/b=
usybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/Ope=
nSSL/crypto.py", line 11, in <module>
>     from OpenSSL._util import (
>   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/b=
usybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/Ope=
nSSL/_util.py", line 5, in <module>
>     from cryptography.hazmat.bindings.openssl.binding import Binding
>   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/b=
usybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cry=
ptography/hazmat/bindings/openssl/binding.py", line 228, in <module>
>     Binding.init_static_locks()
>   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/b=
usybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cry=
ptography/hazmat/bindings/openssl/binding.py", line 188, in init_static_loc=
ks
>     cls._ensure_ffi_initialized()
>   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/b=
usybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cry=
ptography/hazmat/bindings/openssl/binding.py", line 176, in _ensure_ffi_ini=
tialized
>     _openssl_assert(
>   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux/b=
usybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/cry=
ptography/hazmat/bindings/openssl/binding.py", line 90, in _openssl_assert
>     raise InternalError(
> cryptography.exceptions.InternalError: Unknown OpenSSL error. This error =
is commonly encountered when another library is not cleaning up the OpenSSL=
 error stack. If you are using cryptography with another library that uses =
OpenSSL try disabling it before reporting a bug. Otherwise please file an i=
ssue at https://github.com/pyca/cryptography/issues with information on how=
 to reproduce this. ([_OpenSSLErrorWithText(code=3D310378599, lib=3D37, rea=
son=3D103, reason_text=3Db'error:12800067:DSO support routines::could not l=
oad the shared library'), _OpenSSLErrorWithText(code=3D310378599, lib=3D37,=
 reason=3D103, reason_text=3Db'error:12800067:DSO support routines::could n=
ot load the shared library'), _OpenSSLErrorWithText(code=3D126615813, lib=
=3D15, reason=3D786693, reason_text=3Db'error:078C0105:common libcrypto rou=
tines::init fail')])
>=20
> This hacky patch enables enough functionality in
> python3-cryptography-native to work so that basic secure boot
> signing use cases work again.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  ...3-cryptography_hack_to_remove_legacy.patch | 54 +++++++++++++++++++
>  .../python/python3-cryptography_37.0.4.bb     |  5 ++
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-cryptography/pyt=
hon3-cryptography_hack_to_remove_legacy.patch

I'm very nervous about taking a patch like this as it would be near
impossible to tell when we still need it or not and it has zero chance
of making it upstream.

Do we know how the openssl library is breaking internally? Is this some
kind of glibc or loader mismatch? Is it mixing up our sysroot ssl
library with the host one somehow?

Cheers,

Richard

