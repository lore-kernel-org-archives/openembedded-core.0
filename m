Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.9173.1604471581627580749
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 22:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KJzzjMcP;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 63so9344727qva.7
        for <Openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 22:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JDF9GRp+UQPReQh82i5CfaCYdoh0YkktEvzFeaKSWVE=;
        b=KJzzjMcP7D0K+QwhkSmbk4SEWZFtoM9lkyqPG3606rR4A0YnxVseEqfSl0Ez/JFDwp
         zC22CoJTPzUI6Otv3NH4+Z8UD+9XI2FDQcGuhQ4nQg5RGLtDADg6ANvpHLm0u4eGbcAW
         9pVU8rT/wTMhsFvV81SQhPtr7d6iEWMlBLxQQbziHYA6ZAg+drR7Tu9h5xTPbcjGf8w2
         2zClZ8KhREt8R6/O8l335OlzNLZpcS6Am1x0p8jw10dVVuXD9qHPwMuDkX81i6FlCzOj
         wydeuWlun6I98UpHxCDfWpLzUW7Ux+3kCkYKFeCuyYYVhJjjbjYHUmIhG+kcLOStd91U
         axnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JDF9GRp+UQPReQh82i5CfaCYdoh0YkktEvzFeaKSWVE=;
        b=ncehxqjZ3rT+VSuiHMTL3nc5pbgTVw/43h+Tq01nNdAOpEVPMw5HG5/Gcv+HA3O33+
         IeyWLCQ7L8tNrUheAgjQ9iJFBS8hQezrQko1H3J9OHwut0Peyb3Pdul1ZlUcECb7b3Ev
         dKWW0qHqfLYEHbTVgh1Hvfl7ANAGCFwFlNIukCq2jZNqYr9v/OCsyTUKwqo3SZEc+W8D
         e7OSJcD9c762NpGiew7/bj8cswPYCEuQnt/3fFUP5H/j7gFS3BwuYhkQw6i7+kK4qiGF
         w42hECTDqlzrRHPVtwtC5lezfdzaGBXEmGevtkriUMER9SaKKagUDzufEhjBZYir7AWK
         c8LQ==
X-Gm-Message-State: AOAM533swvv+ItmJbQNRktfibZev3lm1RsX01FWH11wb/iRd92e/tf+f
	EOGpGBY/tCaT+bibaVAQ2/7jgFhd7WzNAfAyJaE=
X-Google-Smtp-Source: ABdhPJzCoO0FMGRFqpsapuHwvRHrd5C6OIDbuxc2nVj7aQynQmkqI7lgLH70bTXDtJotcucfvAh2JZA6cJsjYZ7MofE=
X-Received: by 2002:a0c:e387:: with SMTP id a7mr31196076qvl.21.1604471580644;
 Tue, 03 Nov 2020 22:33:00 -0800 (PST)
MIME-Version: 1.0
References: <CANUMPcUV53punnV_5EArrkknXaTZWc=i_UunbJKHiFA_4HZdRw@mail.gmail.com>
In-Reply-To: <CANUMPcUV53punnV_5EArrkknXaTZWc=i_UunbJKHiFA_4HZdRw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 3 Nov 2020 22:32:34 -0800
Message-ID: <CAMKF1sqyhT4GRypCoNs3cTvq3Jj7yCNa-Q7Jxv51z43nvDxuaA@mail.gmail.com>
Subject: Re: [OE-core] Yocto rust build failure
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Vinay

Currently, rust for the target is not buildable, you can however build
rust cross compiler and use it to cross-compile rust applications
which run on your target, but generating rust compiler itself which
will run on target is not currently supported in meta-rust

On Tue, Nov 3, 2020 at 8:21 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>
> Hi,
>
> Trying to build yocto rust package using below branch,
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-wip-sept-5
>
> Getting below list of errors while building yocto rust,
> =======================================================
> Command:
> $bitbake rust
>
> Build Configuration:
> BB_VERSION           = "1.47.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "ubuntu-18.04"
> TARGET_SYS           = "arm-poky-linux-gnueabi"
> MACHINE              = "qemuarm"
> DISTRO               = "poky"
> DISTRO_VERSION       = "3.1+snapshot-20201029"
> TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
> TARGET_FPU           = "hard"
> meta
> meta-poky
> meta-yocto-bsp       =
> "rmacleod/rust-wip-sept-5:80e2aad495bd6f6e1c62b7af55677651131fa250"
>
>
> Error1:
>
> failed to execute command:
> "/home/build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-config"
> "--bindir"
> error: No such file or directory (os error 2)
>
>
> Fixed by below changes,
>
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -14,7 +14,7 @@ export RUST_TARGET_PATH="${WORKDIR}/targets/"
>
>  export FORCE_CRATE_HASH="${BB_TASKHASH}"
>
> -export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
> +export YOCTO_ALTERNATE_EXE_PATH =
> "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
>
>
> Error2:
>
> error: Error loading target specification: Could not find
> specification for target "arm-poky-linux-gnueabi". Use `--print
> target-list` for a list of built-in targets
>
> Fixed by updating "RUST_TARGET_PATH" in
> "build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/temp/run.do_compilerun.do_compile"
> to "$STAGING_LIBDIR_NATIVE/rustlib" path where target specification
> exists.
>
>
> Error3:
>
> While building "librustc_privacy" getting below error.
>
> /home/build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/10.2.0/ld:
> /tmp/rustcLL5VLM/librustc_llvm-755d330643cd0fe0.rlib: member
> /tmp/rustcLL5VLM/librustc_llvm-755d330643cd0fe0.rlib(X86Disassembler.cpp.o)
> in archive is not an object
>           collect2: error: ld returned 1 exit status
>
> error: aborting due to previous error
>
> error: could not compile `rustc_driver`.
> To learn more, run the command again with --verbose.
>
> =======================================================
>
> Please let me know if any corrections are needed in the build procedure.
>
>
> Regards,
> Vinay
>
> 
>
