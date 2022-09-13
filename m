Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174D3C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:34:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.3236.1663065287808494349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gcBSOmn4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id o5so5106619wms.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=Es+G+J65WCsqwOPmmmKwObQC3L0uDPCDxDoI3+ZTt60=;
        b=gcBSOmn4dG7pV5ZAqXZ1lwo6Y8JhwZVBEYhPdkOc5zyHsY41JKEW1rpe36uVsPALmX
         OYBZnDPulL+7n93qcsZ7+jPffZVPzwerkqaAU7o4Vc9aea34NGP4iMU4QST87LjTIMQA
         mU/SC8FUJ51PLrYSHv+VRR5aDs6tMqxiC500w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=Es+G+J65WCsqwOPmmmKwObQC3L0uDPCDxDoI3+ZTt60=;
        b=dwRFWdJGHnraW2/J1E/tcYqNNCExHfNa2AqJa/ii0YnxHE8kad60KQCdYa5egSJ0AU
         X6ZVt6G9STIkKZ5HWvpvM8ldix9eHL2RLwrqahnD5yct1JA07MyagP9UlZXJHMIusXP9
         TfxLcYom+7YdFgnXsNCAWUPZReEit0DJSE0ocXVvz5kRDH+6Rmrp9LJKwDYyFSRlBc52
         2MPL4tpFpvSrmPdbPWARvXn0nBNyF9s/Y612mdq6uP+vSMJLOLRBLh50ePAlYQ3wWoHu
         KGsIo2icaGoGkPg+3frILdob+I4HFTsFrfSsCksZC63GXhzdvjKVnc8nnNBFi3L9XT9T
         CgCA==
X-Gm-Message-State: ACgBeo3mQxXv51g0sGsP+Dj0BN+SFKf3LukOdz36xI8NdWoGX6VLmsgF
	7GJju6WCFXZKgMqlG3fU4Qu9uw==
X-Google-Smtp-Source: 
 AA6agR5J/24CjW1cT7RND1BD6LRKceiNZzYqTAP9xqv2PeeJgJBjx/AkwIyKXvD0CI53vyuCj6Y4kw==
X-Received: by 2002:a05:600c:19d1:b0:3a6:14e5:4725 with SMTP id
 u17-20020a05600c19d100b003a614e54725mr1831184wmq.141.1663065285924;
        Tue, 13 Sep 2022 03:34:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b740:75b6:5b77:5982?
 ([2001:8b0:aba:5f3c:b740:75b6:5b77:5982])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a5d5648000000b00228bf773b1fsm10067529wrw.7.2022.09.13.03.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 03:34:45 -0700 (PDT)
Message-ID: 
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken
 native functionality
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2022 11:34:44 +0100
In-Reply-To: 
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
	 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
	 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 10:34:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170568

On Tue, 2022-09-13 at 13:29 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Tue, 13 Sept 2022 at 13:01, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2022-09-13 at 12:34 +0300, Mikko Rapeli wrote:
> > > The python3-cryptography-native builds work but are functionally brok=
en
> > > on Ubuntu 18.04 build host since the update from 3.3.2 in
> > > meta-openembedded/meta-python. If recipe needs and DEPENDS on
> > > python3-cryptography-native for signing use cases, loading
> > > the python modules fails:
> > >=20
> > > $ python3 -c  "from OpenSSL import crypto"
> > > Traceback (most recent call last):
> > >   File "<string>", line 1, in <module>
> > >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-lin=
ux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages=
/OpenSSL/__init__.py", line 8, in <module>
> > >     from OpenSSL import crypto, SSL
> > >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-lin=
ux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages=
/OpenSSL/crypto.py", line 11, in <module>
> > >     from OpenSSL._util import (
> > >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-lin=
ux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages=
/OpenSSL/_util.py", line 5, in <module>
> > >     from cryptography.hazmat.bindings.openssl.binding import Binding
> > >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-lin=
ux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages=
/cryptography/hazmat/bindings/openssl/binding.py", line 228, in <module>
> > >     Binding.init_static_locks()
> > >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-lin=
ux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages=
/cryptography/hazmat/bindings/openssl/binding.py", line 188, in init_static=
_locks
> > >     cls._ensure_ffi_initialized()
> > >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-lin=
ux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages=
/cryptography/hazmat/bindings/openssl/binding.py", line 176, in _ensure_ffi=
_initialized
> > >     _openssl_assert(
> > >   File "/home/builder/poky/build_kirkstone/tmp/work/core2-64-poky-lin=
ux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages=
/cryptography/hazmat/bindings/openssl/binding.py", line 90, in _openssl_ass=
ert
> > >     raise InternalError(
> > > cryptography.exceptions.InternalError: Unknown OpenSSL error. This er=
ror is commonly encountered when another library is not cleaning up the Ope=
nSSL error stack. If you are using cryptography with another library that u=
ses OpenSSL try disabling it before reporting a bug. Otherwise please file =
an issue at https://github.com/pyca/cryptography/issues with information on=
 how to reproduce this. ([_OpenSSLErrorWithText(code=3D310378599, lib=3D37,=
 reason=3D103, reason_text=3Db'error:12800067:DSO support routines::could n=
ot load the shared library'), _OpenSSLErrorWithText(code=3D310378599, lib=
=3D37, reason=3D103, reason_text=3Db'error:12800067:DSO support routines::c=
ould not load the shared library'), _OpenSSLErrorWithText(code=3D126615813,=
 lib=3D15, reason=3D786693, reason_text=3Db'error:078C0105:common libcrypto=
 routines::init fail')])
> > >=20
> > > This hacky patch enables enough functionality in
> > > python3-cryptography-native to work so that basic secure boot
> > > signing use cases work again.
> > >=20
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  ...3-cryptography_hack_to_remove_legacy.patch | 54 +++++++++++++++++=
++
> > >  .../python/python3-cryptography_37.0.4.bb     |  5 ++
> > >  2 files changed, 59 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/python/python3-cryptography=
/python3-cryptography_hack_to_remove_legacy.patch
> >=20
> > I'm very nervous about taking a patch like this as it would be near
> > impossible to tell when we still need it or not and it has zero chance
> > of making it upstream.
> >=20
> > Do we know how the openssl library is breaking internally? Is this some
> > kind of glibc or loader mismatch? Is it mixing up our sysroot ssl
> > library with the host one somehow?
>=20
> I could not see what exactly was wrong.
>=20
> python3 is taken correctly from recipe-sysroot-native path, same for
> all shared libraries like openssl, cffi etc.
> I went through strace output of the test case and could not see what
> exactly is wrong there. All binaries are openat()'ed from
> the native sysroot, part from libc, pthreads and a few others which
> AFAIK are normal.

Are you using uninative? I'd have expected glibc and pthreads to come
from there rather than the host.

>  The openssl.cnf file
> is not found in native sysroot, which is another small bug, but that
> did not seem to fix this (I just hacked it to work, some
> absolute build openssl-native env path leaks into the openssl-native bina=
ries).
>=20
> The old version 3.3.2 version of python3-cryptography from
> meta-openembedded/meta-python works without any problems.
> It's just the new versions 35, 36 and 37 which have this issue.
>=20
> On my Ubuntu 18.04 machine, python3-cryptography-native 35 and later
> don't work at all without this workaround.
> Would be nice to know if others can reproduce this on other host distribu=
tions.
>=20
> I was testing with busybox changes:
>=20
> meta/recipes-core/busybox/busybox_1.35.0.bb
> @@ -54,3 +54,7 @@ SRC_URI =3D
> "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>  SRC_URI:append:libc-musl =3D " file://musl.cfg "
>=20
>  SRC_URI[tarball.sha256sum] =3D
> "faeeb244c35a348a334f4a59e44626ee870fb07b6884d68c10ae8bc19f83a694"
> +
> +inherit python3native
> +
> +DEPENDS +=3D "python3-pyopenssl-native"
>=20
> And then in bitbake -c devshell busybox:
>=20
> # python3 -c  "from OpenSSL import crypto"
>=20
> I guess there is no way to add a test like that for python3-cryptography-=
native?

You could probably put that in do_configure to test it?

Cheers,

Richard





