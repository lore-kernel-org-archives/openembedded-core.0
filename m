Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09978C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 13:56:04 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.43250.1679493363387382402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 06:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UWcEiVmT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id r29so17152733wra.13
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 06:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679493362;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAEG9aIO4UHLLcZHzc2SPAr7WdPL4Q3qE5/k7DMCwqo=;
        b=UWcEiVmTpBH/IBE2/+4lR1c2jhNXDALMVrCgywCbQidq3emy8etaP+6/VsUb/8PMGF
         pyGAcon0BgsSutlV1YxxL6AAy4SzUeU2RJUOJZH00JQyxwsagZikSa5KiGgkqD5JfrYl
         UyI7hWrmJpLMGWdONLAnSQZsh0+aMy93sdBss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679493362;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EAEG9aIO4UHLLcZHzc2SPAr7WdPL4Q3qE5/k7DMCwqo=;
        b=VQwWth/uaVQyUuZp9OCnjdIzg+pz4VUdNMHudC71zOx5+GKiFfdK79JPiFcN5dKLgh
         GJdJ5OJ8qEZDrY+x4ne9zDReeBki+QQPbQx4SdNuwmGwMpL+9Fpi9G4NmfoqyffGzF9p
         SubupztwKQhrAyJwbsaKNuJ/F6EeHaxFYRQwy/9eJ8MAUUw9nYjYFnMhFzoUls3O1dVW
         FOiwMWgfDWxYVdFqaaXKVD+FU9Mm6JH3YPvqb3PTso8zmIE+UE4jrZMdxbZRFC8vubXz
         rsUv6bk9vBgGQADfu086I8ztPCR3RHdwIBw1A0eIfS2jdoMf0r5IkfhOWpr+WmIkllwo
         +L4w==
X-Gm-Message-State: AO0yUKVTISoBa6L7FRK7SQm4bg3MB+IKO44rea89NOPu8rXQr1Gvbz65
	u0khZXjKRS8uDVCrZpke8HbRWg==
X-Google-Smtp-Source: AK7set/DdCxietu3Xngn6heMX6thqHw0DjN9UZ85iN69DaQExWzbYbFl+PAOFNmQqC8At0TByEdNAQ==
X-Received: by 2002:adf:cc8f:0:b0:2d3:fba4:e61d with SMTP id p15-20020adfcc8f000000b002d3fba4e61dmr1639187wrj.12.1679493361823;
        Wed, 22 Mar 2023 06:56:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb64:5f49:21ba:a392? ([2001:8b0:aba:5f3c:fb64:5f49:21ba:a392])
        by smtp.gmail.com with ESMTPSA id b9-20020adfde09000000b002daeb108304sm821001wrm.33.2023.03.22.06.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 06:56:01 -0700 (PDT)
Message-ID: <2ca64b83714e178f49a51fe61f1ef43551245533.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest: incompatible_lic.py: run bitbake -c
 testimage separately for each image
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2023 13:56:00 +0000
In-Reply-To: <20230313155603.3841787-1-Martin.Jansa@gmail.com>
References: <20230313155603.3841787-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 13:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178923

On Mon, 2023-03-13 at 16:56 +0100, Martin Jansa wrote:
> * with 1 preconfigured tap device you cannot run testimage on multiple im=
ages
>   at the same time
>=20
>   in my case have /tmp/qemu-tap-locks/tap0.skip (tap0 is used by openvpn =
on builder)
>   and /etc/runqemu-nosudo as my build user doesn't have sudo powers
>=20
>   but then when 2 do_testimage tasks are executed at the same time it fai=
ls like this:
>=20
>     NOTE: recipe core-image-weston-1.0-r0: task do_testimage: Started
>     NOTE: recipe core-image-full-cmdline-1.0-r0: task do_testimage: Start=
ed
>     QMP Available for connection at /OE/build/poky/build-st/tmp/.c2d3k3bh
>     QMP Available for connection at /OE/build/poky/build-st/tmp/._4agpi1v
>     ERROR: core-image-full-cmdline-1.0-r0 do_testimage: runqemu exited wi=
th code 1
>     ERROR: core-image-full-cmdline-1.0-r0 do_testimage: Output from runqe=
mu:
>     runqemu - INFO - Continuing with the following parameters:
>     KERNEL: [/OE/build/poky/build-st/tmp/deploy/images/qemux86-64/bzImage=
]
>     MACHINE: [qemux86-64]
>     FSTYPE: [ext4]
>     ROOTFS: [/OE/build/poky/build-st/tmp/deploy/images/qemux86-64/core-im=
age-full-cmdline-qemux86-64.ext4]
>     CONFFILE: [/OE/build/poky/build-st/tmp/deploy/images/qemux86-64/core-=
image-full-cmdline-qemux86-64.qemuboot.conf]
>=20
>     runqemu - INFO - Found /tmp/qemu-tap-locks/tap0.skip, skipping tap0
>     runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap1.lock fai=
led: [Errno 11] Resource temporarily unavailable
>     runqemu - ERROR - Error: There are no available tap devices to use fo=
r networking,
>     runqemu - ERROR - and I see /etc/runqemu-nosudo exists, so I am not g=
oing to try creating
>     runqemu - ERROR - a new one with sudo.
>     runqemu - INFO - Cleaning up
>     runqemu - INFO - Host uptime: 67474.59
>=20
>     tput: No value for $TERM and no -T specified
>=20
>     WARNING: core-image-full-cmdline-1.0-r0 do_testimage: Qemu ended unex=
pectedly, dump data from host is in /OE/build/poky/build-st/tmp/log/runtime=
-hostdump/202303131614_qemu
>     WARNING: core-image-full-cmdline-1.0-r0 do_testimage: runqemu during =
is_alive() test
>     ERROR: core-image-full-cmdline-1.0-r0 do_testimage: Error executing a=
 python function in exec_func_python() autogenerated:
>=20
>   which is very reasonable error message, but 600 lines later it also sho=
ws:
>=20
>     RESULTS - xorg.XorgTest.test_xorg_running: SKIPPED (0.00s)
>     SUMMARY:
>     core-image-weston () - Ran 71 tests in 34.073s
>     core-image-weston - OK - All required tests passed (successes=3D14, s=
kipped=3D57, failures=3D0, errors=3D0)
>     NOTE: recipe core-image-weston-1.0-r0: task do_testimage: Succeeded
>     NOTE: Tasks Summary: Attempted 1141 tasks of which 1139 didn't need t=
o be rerun and 1 failed.
>=20
>     Summary: 1 task failed:
>       /OE/build/poky/meta/recipes-extended/images/core-image-full-cmdline=
.bb:do_testimag
>=20
>   and I didn't notice that there are actually 2 different images core-ima=
ge-weston
>   and core-image-full-cmdline and spent most time trying to figure out ho=
w it was
>   able to run all those ptest when qemu failed to start at the beginning.
>=20
>   It's possible to create 2nd tap with runqemu-ifup before running this t=
est.
>   Then it works, maybe some check like in DevtoolTests to error out early=
 if
>   there isn't enough tap devices? But the implementation in:
>   https://git.openembedded.org/openembedded-core/commit/?id=3D2258345e19e=
fff7717fe19a5026ec55f1b6f90b6
>   has its own limitations (e.g. not checking /tmp/qemu-tap-locks/tap0.ski=
p)
>   and would probably need to be re-implemented as some generic decorator
>   as other tests need this as well.
>=20
>   It's a bit slower when serialized:
>   INFO - RESULTS - incompatible_lic.NoGPL3InImagesTests.test_core_image_f=
ull_cmdline_weston: PASSED (145.96s)
>   without this change:
>   INFO - RESULTS - incompatible_lic.NoGPL3InImagesTests.test_core_image_f=
ull_cmdline_weston: PASSED (104.72s)
>=20
>   I don't mind if this is rejected, sending it mostly to document this be=
havior.
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/incompatible_lic.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/=
oeqa/selftest/cases/incompatible_lic.py
> index 4edf60fc55..b2da25e612 100644
> --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> @@ -158,5 +158,6 @@ CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston +=3D "r=
pm"
>  CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston =3D "matchbox-termin=
al"
>  """)
>          bitbake('core-image-full-cmdline core-image-weston')
> -        bitbake('-c testimage core-image-full-cmdline core-image-weston'=
)
> +        bitbake('-c testimage core-image-full-cmdline')
> +        bitbake('-c testimage core-image-weston')
> =20

It is expected that this should work and that multiple tap/tun devices
would be available in general when using selftest so I don't plan to
merge this. We could use all the parallelism we can find!

Cheers,

Richard


