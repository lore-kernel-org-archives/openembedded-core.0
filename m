Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web08.38018.1628868177303088293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 08:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o7as68Ep;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id n7so16213827ljq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lPM0I15+vOR2hrcRpiNlpG4CZa/UjR0nA/1LOILiZCE=;
        b=o7as68EpGDL7vBiJHBNodv3YZ/A6YZuHd7Orb4sGh04f2D392/MqbK70+0syApEpYK
         bXUtP48fMkSaZpqM/W4KqX7Snuolnk2Gfeej4nSnWX/otDysruZIUcSYLgrT0Qib4rpC
         4cP51SBjrsKBCwtvIQ2XwMvXnxBnYvMQPYEzPl8EamFk5C05z8yPurTKz1WiuWbfbyLL
         cUgj+3ySFNYlxombo9873XbhZJRMVsZB5qVRKu4fTuppZulYaONEfeNpedaaYandWYJi
         E1t41FOlkza5covQFOG+OspnwzX1jGHiWp5h9rwiunBHqdTrNhYqSXV0WJImbVk8DWxI
         a3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lPM0I15+vOR2hrcRpiNlpG4CZa/UjR0nA/1LOILiZCE=;
        b=P6z8uQ0H/5C//A61SPigpD6supWAm6gLPBVz1d2GZH/VsHK3gZLueo2fm7yWcw0/J4
         eFglRR/7W7bR737MIzrhmA/cC7XsoHegsch2QcY891khzIlIsUaY+FhZzWWTLJGXJcJ4
         tIyIrDdloG+jmDDc+dc2pOjbcqjKWx6Ndpu47027ofxsDqbE6MltlLv3sZO6P0M3RhHb
         n9ptX8qlb1HhVU59uB7L9HRXyL8Lh4Iyaw0e34D/flS1qr/2g3VVtGtywEcal1XZtRVZ
         7Mpgws5azNG+ZKP3z9gihXmEbKzqQWNU6UGKVPWxpRzhEEl45fpYv0svITivkmLlIgVr
         KBdw==
X-Gm-Message-State: AOAM533+eV9l3VTusfjjfyufiCIx76Sh4NxEuQgwqqS3FJj/7Aqde/jT
	y+MFDtnb5/DJaOIDNsDMODsdXx2xk8S8ksYAcNk=
X-Google-Smtp-Source: ABdhPJxAdj+gOGQEyP/L47rz3DnVNmXOVrY+Qpf7x4IjoO8dQyhHjjleTMSCmI8jEOEuRG4SfHTyQeHffgjMMDYpPSU=
X-Received: by 2002:a2e:9606:: with SMTP id v6mr2300914ljh.134.1628868175363;
 Fri, 13 Aug 2021 08:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com> <20210813151947.55142-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210813151947.55142-1-vinay.m.engg@gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Fri, 13 Aug 2021 20:52:44 +0530
Message-ID: <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, steven@stevenwalter.org, 
	johan.anderholm@gmail.com, derek@asterius.io, cardoe@cardoe.com, 
	dev@codyps.com, tylerwhall@gmail.com, Khem Raj <raj.khem@gmail.com>, 
	vinay.kumar@blackfigtech.com, saul.wold@windriver.com, martin.jansa@gmail.com, 
	paul@pbarker.dev
Content-Type: text/plain; charset="UTF-8"

Hi Randy,

>> Vinay or I will look into glibc/qemuppc64
>> if no one else is working on that.

The failure is due to the below error in libstd-rs package build.
"error: unrecognized arch "powerpc64le" in target specification"

The reason for this is "arch": "powerpc64le" from the below target
specific file.

cat $b2/tmp/work/ppc64p9le-poky-linux/libstd-rs/1.54.0-r0/recipe-sysroot-native/usr/lib/rustlib/powerpc64le-poky-linux.json
{
    "llvm-target": "powerpc64le-unknown-linux-gnu",
    "data-layout": "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512",
    "max-atomic-width": 64,
    "target-pointer-width": "64",
    "target-c-int-width": "64",
    "target-endian": "little",
    "arch": "powerpc64le",
    "os": "linux",
    "env": "gnu",
    "vendor": "unknown",
    "target-family": "unix",
    "linker": "powerpc64le-poky-linux-gcc",
    "ar": "powerpc64le-poky-linux-ar",
    "cpu": "generic",
    "dynamic-linking": true,
    "executables": true,
    "linker-is-gnu": true,
    "linker-flavor": "gcc",
    "has-rpath": true,
    "has-elf-tls": true,
    "position-independent-executables": true,
    "panic-strategy": "unwind"
}

So the "arch" should be "powerpc64" in case of "powerpc64le" fixes the
librstd-rs build failure.

With the above fix,

$cat  rust-hello-world-buildall.log
BUILDALL-QEMU LOG FOR rust-hello-world
START TIME: 2021-08-13_03:11:23
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-80-generic
===============
BUILD RESULTS:
[glibc]
PASS: qemuriscv32
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemuppc64
PASS: qemux86
[musl]
FAIL: qemuriscv32
FAIL: qemuarmv5
FAIL: qemumips
FAIL: qemux86-64
FAIL: qemuarm64
FAIL: qemumips64
FAIL: qemuarm
FAIL: qemuppc
FAIL: qemuriscv64
FAIL: qemuppc64
FAIL: qemux86
===============
PASSED: 11
FAILED: 11

Regards,
Vinay

On Fri, Aug 13, 2021 at 8:50 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>
> rust-common.inc: Fix build failure with qemuppc64.
>
> The glibc build of "rust-hello-world" throws error in libstd-rs package.
> error: unrecognized arch "powerpc64le" in target specification
>
> The same got fixed by changing the arch to "powerpc64".
>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-common.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
> index 350517c723..f574152815 100644
> --- a/meta/recipes-devtools/rust/rust-common.inc
> +++ b/meta/recipes-devtools/rust/rust-common.inc
> @@ -248,6 +248,8 @@ def arch_to_rust_target_arch(arch):
>          return "mips64"
>      elif arch == "armv7":
>          return "arm"
> +    elif arch == "powerpc64le":
> +        return "powerpc64"
>      else:
>          return arch
>
> --
> 2.31.1
>
