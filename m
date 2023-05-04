Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874CDC7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 12:02:36 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.47875.1683201754885458398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 05:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=K6AL/KGU;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4efe8991b8aso470945e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683201753; x=1685793753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wmik7lPZTRu1LRkfEcTJLVIz4WRAMOJyzNScP43i7rU=;
        b=K6AL/KGUbLSJx6wZrLCRBCa6w/fxiiXTI/jPqj/+KZLMr0QzavKYqForD7G8mYE3YH
         +MT2U5gjdFWAGdg31C8NF+BP0F8H1iEx7wT1s9tjs1GO8yJFmKoEX0eLI7lsbX5Lx8qa
         r5psjkK9/gZoZbECd6299Z/hVTXqRKwthyEahtAfEytX7k/kbJ2mebgJ9msp9zzq0KVl
         ofAz0EWVrgCjAFibIBPgyQdHYNBnBwKl3Wg1k49ESHTB3Kgac1nYy69H43KBm8jtoaPQ
         z1tmRkUIASFWsPC3GRrxpOGOBSy2zBkkgjX70AI9/uUQ0PJGXQEzh7N6mdCpzmwnbldP
         yd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683201753; x=1685793753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wmik7lPZTRu1LRkfEcTJLVIz4WRAMOJyzNScP43i7rU=;
        b=OZmGbb+/qMaEb9rRkIyx60NVHeOh+YFpN5OIIPqDI6eMrPKhQ6Krc9hDGA74sfVSKD
         45BgwvBnHiamo8NFUGH63puY///X9ZJPSA0HtrT7/2+59BDq20UlXaCmV68kCQw0BLbT
         eT4KBdKXQ4/Xclo78G1ECRfA0fKa/nYkMe5BhKbV56Da7K8ol25gZi880h/fXpjC3FNG
         DbPAqOpyc2ZbHAF3j8Y4De9aSi4rfxENyvx9hyNUwc59IJwQWvdX4pfXRIWNqUHNkVPm
         kTcMi3Kx0iQPLkTZY1QzeEPMvN5LYIvo9Ld+0n/hLW7/QBcXqJot6Tde9RQQsjCytUQG
         oeGA==
X-Gm-Message-State: AC+VfDw+m5bXQO6rVreLVnOXWBC7QTf1cWIDFXe9x/y/EX447zj5xr8G
	NxndeT6+M298IXbCSARZkcDeZKCUpHt3oAa/J8Y=
X-Google-Smtp-Source: ACHHUZ6Vgw5d0Ekl6sTx2j63hOqx7yV1jwoTNlEfoVdKEGSyMEoexZnM8GmIimQeWxCZyql3+PhTP7suo6SQDWlXmAc=
X-Received: by 2002:a05:6512:910:b0:4dd:9f86:859d with SMTP id
 e16-20020a056512091000b004dd9f86859dmr1741830lft.13.1683201752866; Thu, 04
 May 2023 05:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
 <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se> <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
 <98af3b96-9d1c-3d6a-493f-c1d6a422f9e8@berginkonsult.se>
In-Reply-To: <98af3b96-9d1c-3d6a-493f-c1d6a422f9e8@berginkonsult.se>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 May 2023 14:02:20 +0200
Message-ID: <CANNYZj--KsUCsAJz9qO6o2E-ByvRjAQ1KxCFK2=W07djtf4FFw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
To: Peter Bergin <peter@berginkonsult.se>
Cc: frederic.martinsons@gmail.com, Tim Orling <ticotimo@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 12:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180871

I think you should look at prior art - other recipes where this works
correctly. For example rpm, a fairly simple component, is using
python.h and linking with libpython. How is it working there?

Alex

On Thu, 4 May 2023 at 14:00, Peter Bergin <peter@berginkonsult.se> wrote:
>
>
> On 2023-05-04 11:00, Alexander Kanavin wrote:
> > On Thu, 4 May 2023 at 10:41, Peter Bergin <peter@berginkonsult.se> wrote:
> >
> >> At
> >> https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46
> >> the path to python includes is defined by calling 'python3 -c "import
> >> sysconfig; print(sysconfig.get_path('include'))"' (but from inside
> >> rust). With print-debugging this seems to return the bad string
> >> '/usr/include/python3.11' which is then passed to cc::Build
> >>
> >> I executed this in recipe context:
> >>
> >> do_compile:prepend() {
> >>       which python3
> >>       python3 -c "import sysconfig; print(sysconfig.get_path('include'))"
> >> }
> >>
> >> and then I got the correct return value:
> >>
> >> |
> >> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
> >> |
> >> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11
> > This is pointing to the native sysroot in a target build, so it is
> > most likely not actually correct. I believe 'inherit
> > python3targetconfig' may help, as it substitutes most places where
> > native python gets queried by components with target-specific values.
> >
> > Alex
> >
> The bad thing is that the build.rs script is running python script to
> figure out the path to the headers. I'm not sure we can use target
> python exe in the build steps without running qemu instance or something
> which seems overkill in this case. We have the information about python
> include path for the target in the variable PYTHON_INCLUDE_DIR.
>
> With this patch the compilation will find Python.h:
>
> $ git diff src/rust/build.rs
> diff --git a/src/rust/build.rs b/src/rust/build.rs
> index 01177ac..7dc13fe 100644
> --- a/src/rust/build.rs
> +++ b/src/rust/build.rs
> @@ -43,11 +43,8 @@ fn main() {
>       )
>       .unwrap();
>       println!("cargo:rustc-cfg=python_implementation=\"{}\"", python_impl);
> -    let python_include = run_python_script(
> -        &python,
> -        "import sysconfig; print(sysconfig.get_path('include'), end='')",
> -    )
> -    .unwrap();
> +    let python_include = env::var("PYTHON_INCLUDE_DIR").unwrap();
> +
>       let openssl_include =
>           std::env::var_os("DEP_OPENSSL_INCLUDE").expect("unable to find
> openssl include path");
>       let openssl_c = Path::new(&out_dir).join("_openssl.c");
>
>
> But it fails later in the linking step.
>
> .....linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
> "-L"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out"
> "-L"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib"
> "-L"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
> "-Wl,-Bstatic" "-l_openssl.a"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x86_64-poky-linux-gnu/lib/libcompiler_builtins-45df5d471f0d20d0.rlib"
> "-Wl,-Bdynamic" "-lssl" "-lcrypto" "-lgcc_s" "-lutil" "-lrt" "-lpthread"
> "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr" "-Wl,-znoexecstack" "-L"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
> "-o"
> "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/deps/libcryptography_rust.so"
> "-Wl,--gc-sections" "-shared" "-Wl,-O1" "-nodefaultlibs"
>    = note:
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a07f-_openssl.o):
> warning: relocation against `_Py_NoneStruct' in read-only section `.text'
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a07f-_openssl.o):
> relocation R_X86_64_PC32 against undefined symbol `_Py_NoneStruct' can
> not be used when making a shared object; recompile with -fPIC
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
> final link failed: bad value
>            collect2: error: ld returned 1 exit status
>
>
> There are some '-L .../recipe-sysroot-native/usr/lib/rustlib/...' that
> can probably causing this. Don't know if it helps us forward?
>
> /Peter
>

