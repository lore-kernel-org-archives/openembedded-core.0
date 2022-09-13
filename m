Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04609C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:29:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.3165.1663064940023610716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CDcnAmoJ;
 spf=pass (domain: linaro.org, ip: 209.85.214.179,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pl1-f179.google.com with SMTP id l10so11344791plb.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=6VU2GEdzdOlpho8Z/0isV+/QeDqVZE7EOZi50LpuDyo=;
        b=CDcnAmoJJ2mSNcfPN9gqMl4G32EkhBQnlN2ZoDnSWMr9Cj+bawoXZfkRnTpgt4yDPl
         oeUDFavWtVQybMvSjMGeyJCjpLErMNMmd8zJiupYR/oTYhwNaU3kkcdTXnCujAWYtmh7
         NUqqwQteSOecUCeMr3tBqXJxOsHJAnvsDGCWFEAoXzwWXIewlAkl6mZwCXBP3I6Xa62C
         Mr3TRpIw6+CBKgsxcymsV0DmkSsuj0CH+bqzW5hjmwwqSzjoZE2kQRlcg4CqkAQqnhOj
         GrTjinERnIFffV/fsPBh0W7EQUwXX9Aj2Z81iUZlSSWTa7FbY4lLzJLREG77B51deaum
         lmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6VU2GEdzdOlpho8Z/0isV+/QeDqVZE7EOZi50LpuDyo=;
        b=Nv0oMI4JZFnX6hxvOzcv/PS+RQxTr9IKZNgDdsB+ydBpiq+cHHwB0DTNEovS17Egrb
         qcip7P2Hiwf7WFxGXPbc6wzoMSbtN3e1heMR00pb5ZMzZxC+JwH/uYa9T2ijGiME3bVT
         qFQJT+4kuwvN4neTe0fjGU6un+2gIvAocjRDnrop5i440NxZFOussrxVyL8yrQbpg7v3
         WQW+on3GES6+CSj7gwlL7Oeo/D9qhMsPMe48j4RzMocL1PkpJ5RdzLUowGsQeUzs1xm2
         SMLmkL/Z5lTArvW8hnj1nZpuFxqkg2SSnCeBGc3aeiObre5bPS13obucQYucSPem/LBQ
         CaKg==
X-Gm-Message-State: ACgBeo1UQ407c09h84PQIrx4aHb11f9GRDkTGv+lPULb1hXi1cVFC4wF
	qpJn9hGHp0z2vpfe0eIhmYWOq9r0Sk65GwDCEyeSpw==
X-Google-Smtp-Source: 
 AA6agR7GN1OUAoBKVYwBU4SuQV7PmuMz3G6TdztEPAJSEjMLVf7PvKQizjKFQwL31DuZY24zFigCr1DYG1TGHCvIc3Y=
X-Received: by 2002:a17:90b:2643:b0:1fb:707d:af1f with SMTP id
 pa3-20020a17090b264300b001fb707daf1fmr3291493pjb.7.1663064939076; Tue, 13 Sep
 2022 03:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
In-Reply-To: 
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Tue, 13 Sep 2022 13:29:01 +0300
Message-ID: 
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 10:29:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170567

Hi,

On Tue, 13 Sept 2022 at 13:01, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-09-13 at 12:34 +0300, Mikko Rapeli wrote:
> > The python3-cryptography-native builds work but are functionally broken
> > on Ubuntu 18.04 build host since the update from 3.3.2 in
> > meta-openembedded/meta-python. If recipe needs and DEPENDS on
> > python3-cryptography-native for signing use cases, loading
> > the python modules fails:
> >
> > $ python3 -c  "from OpenSSL import crypto"
> > Traceback (most recent call last):
> >   File "<string>", line 1, in <module>
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/O=
penSSL/__init__.py", line 8, in <module>
> >     from OpenSSL import crypto, SSL
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/O=
penSSL/crypto.py", line 11, in <module>
> >     from OpenSSL._util import (
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/O=
penSSL/_util.py", line 5, in <module>
> >     from cryptography.hazmat.bindings.openssl.binding import Binding
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/c=
ryptography/hazmat/bindings/openssl/binding.py", line 228, in <module>
> >     Binding.init_static_locks()
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/c=
ryptography/hazmat/bindings/openssl/binding.py", line 188, in init_static_l=
ocks
> >     cls._ensure_ffi_initialized()
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/c=
ryptography/hazmat/bindings/openssl/binding.py", line 176, in _ensure_ffi_i=
nitialized
> >     _openssl_assert(
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/c=
ryptography/hazmat/bindings/openssl/binding.py", line 90, in _openssl_asser=
t
> >     raise InternalError(
> > cryptography.exceptions.InternalError: Unknown OpenSSL error. This erro=
r is commonly encountered when another library is not cleaning up the OpenS=
SL error stack. If you are using cryptography with another library that use=
s OpenSSL try disabling it before reporting a bug. Otherwise please file an=
 issue at https://github.com/pyca/cryptography/issues with information on h=
ow to reproduce this. ([_OpenSSLErrorWithText(code=3D310378599, lib=3D37, r=
eason=3D103, reason_text=3Db'error:12800067:DSO support routines::could not=
 load the shared library'), _OpenSSLErrorWithText(code=3D310378599, lib=3D3=
7, reason=3D103, reason_text=3Db'error:12800067:DSO support routines::could=
 not load the shared library'), _OpenSSLErrorWithText(code=3D126615813, lib=
=3D15, reason=3D786693, reason_text=3Db'error:078C0105:common libcrypto rou=
tines::init fail')])
> >
> > This hacky patch enables enough functionality in
> > python3-cryptography-native to work so that basic secure boot
> > signing use cases work again.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  ...3-cryptography_hack_to_remove_legacy.patch | 54 +++++++++++++++++++
> >  .../python/python3-cryptography_37.0.4.bb     |  5 ++
> >  2 files changed, 59 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3-cryptography/p=
ython3-cryptography_hack_to_remove_legacy.patch
>
> I'm very nervous about taking a patch like this as it would be near
> impossible to tell when we still need it or not and it has zero chance
> of making it upstream.
>
> Do we know how the openssl library is breaking internally? Is this some
> kind of glibc or loader mismatch? Is it mixing up our sysroot ssl
> library with the host one somehow?

I could not see what exactly was wrong.

python3 is taken correctly from recipe-sysroot-native path, same for
all shared libraries like openssl, cffi etc.
I went through strace output of the test case and could not see what
exactly is wrong there. All binaries are openat()'ed from
the native sysroot, part from libc, pthreads and a few others which
AFAIK are normal. The openssl.cnf file
is not found in native sysroot, which is another small bug, but that
did not seem to fix this (I just hacked it to work, some
absolute build openssl-native env path leaks into the openssl-native binari=
es).

The old version 3.3.2 version of python3-cryptography from
meta-openembedded/meta-python works without any problems.
It's just the new versions 35, 36 and 37 which have this issue.

On my Ubuntu 18.04 machine, python3-cryptography-native 35 and later
don't work at all without this workaround.
Would be nice to know if others can reproduce this on other host distributi=
ons.

I was testing with busybox changes:

meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -54,3 +54,7 @@ SRC_URI =3D
"https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
 SRC_URI:append:libc-musl =3D " file://musl.cfg "

 SRC_URI[tarball.sha256sum] =3D
"faeeb244c35a348a334f4a59e44626ee870fb07b6884d68c10ae8bc19f83a694"
+
+inherit python3native
+
+DEPENDS +=3D "python3-pyopenssl-native"

And then in bitbake -c devshell busybox:

# python3 -c  "from OpenSSL import crypto"

I guess there is no way to add a test like that for python3-cryptography-na=
tive?

Cheers,

-Mikko


On Tue, 13 Sept 2022 at 13:01, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-09-13 at 12:34 +0300, Mikko Rapeli wrote:
> > The python3-cryptography-native builds work but are functionally broken
> > on Ubuntu 18.04 build host since the update from 3.3.2 in
> > meta-openembedded/meta-python. If recipe needs and DEPENDS on
> > python3-cryptography-native for signing use cases, loading
> > the python modules fails:
> >
> > $ python3 -c  "from OpenSSL import crypto"
> > Traceback (most recent call last):
> >   File "<string>", line 1, in <module>
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/O=
penSSL/__init__.py", line 8, in <module>
> >     from OpenSSL import crypto, SSL
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/O=
penSSL/crypto.py", line 11, in <module>
> >     from OpenSSL._util import (
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/O=
penSSL/_util.py", line 5, in <module>
> >     from cryptography.hazmat.bindings.openssl.binding import Binding
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/c=
ryptography/hazmat/bindings/openssl/binding.py", line 228, in <module>
> >     Binding.init_static_locks()
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/c=
ryptography/hazmat/bindings/openssl/binding.py", line 188, in init_static_l=
ocks
> >     cls._ensure_ffi_initialized()
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/c=
ryptography/hazmat/bindings/openssl/binding.py", line 176, in _ensure_ffi_i=
nitialized
> >     _openssl_assert(
> >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-linux=
/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/c=
ryptography/hazmat/bindings/openssl/binding.py", line 90, in _openssl_asser=
t
> >     raise InternalError(
> > cryptography.exceptions.InternalError: Unknown OpenSSL error. This erro=
r is commonly encountered when another library is not cleaning up the OpenS=
SL error stack. If you are using cryptography with another library that use=
s OpenSSL try disabling it before reporting a bug. Otherwise please file an=
 issue at https://github.com/pyca/cryptography/issues with information on h=
ow to reproduce this. ([_OpenSSLErrorWithText(code=3D310378599, lib=3D37, r=
eason=3D103, reason_text=3Db'error:12800067:DSO support routines::could not=
 load the shared library'), _OpenSSLErrorWithText(code=3D310378599, lib=3D3=
7, reason=3D103, reason_text=3Db'error:12800067:DSO support routines::could=
 not load the shared library'), _OpenSSLErrorWithText(code=3D126615813, lib=
=3D15, reason=3D786693, reason_text=3Db'error:078C0105:common libcrypto rou=
tines::init fail')])
> >
> > This hacky patch enables enough functionality in
> > python3-cryptography-native to work so that basic secure boot
> > signing use cases work again.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  ...3-cryptography_hack_to_remove_legacy.patch | 54 +++++++++++++++++++
> >  .../python/python3-cryptography_37.0.4.bb     |  5 ++
> >  2 files changed, 59 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3-cryptography/p=
ython3-cryptography_hack_to_remove_legacy.patch
>
> I'm very nervous about taking a patch like this as it would be near
> impossible to tell when we still need it or not and it has zero chance
> of making it upstream.
>
> Do we know how the openssl library is breaking internally? Is this some
> kind of glibc or loader mismatch? Is it mixing up our sysroot ssl
> library with the host one somehow?
>
> Cheers,
>
> Richard

