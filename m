Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421D9C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 08:23:19 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.4291.1654158196238136816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 01:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=L5kn6iXF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.49,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f49.google.com with SMTP id er5so5261979edb.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 01:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=zLgjgVzZfNzmGOtSL525Tlgs6nlqj90t7d6GUDioiYs=;
        b=L5kn6iXFogyMk4klFeI4Tx04oi1yqtMl29Q4YJYDI1DR56xs7OY93KVyN7mwDF4YSB
         /hjFdrEhDbOjaIfkCVt5d2zLbM3C3Hz+3KLc3osuJGR11fS3Fu7QYcyxNbdI1nsZnLIX
         asJ14RGXnPfNsnNsovx7d1rn3V0wUIG/MR0S+BzwZZM3sh3aFgR8lmfAddjZJupgvFse
         hFKwlsx1ePtRZuCSUB9sUn20mybOSTIq8vajiwl46kz6PqKawzoimRkeaHc9eN1jqbIq
         aD0P767eRPDUmHCA0ToMXj7mH4X7tONaN+KXlc9U2YGetcOJzA7dFZLRE08NQwuEadNT
         MFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=zLgjgVzZfNzmGOtSL525Tlgs6nlqj90t7d6GUDioiYs=;
        b=owJkLfF3eMyZWAQFcbjKyN7BkOnszKGRrCPNel8T/2Hq8d1n3f73plN7T1Q0qDvNd5
         D7j970RM4C7GWAEPf6nj+FBrxQ79q8SwR0lHMnY7zllhvsRfGLXsllOVhF9H406XDqhj
         JkSiADzQpocobU+cnFKtukSEr0quD1i9axeK0yQ1VD2lxx4tvCPyJamg6tNxN9lORB9Z
         KCM7L/p2WpqzFgtCe053+Rt/sDlUN+Mhw/Wuozh5xQ2FhzrKK23mUo+4/em4kq/oMwuV
         vGWq6KYJoaMwwP6uzjga8m+T7Q/DA/vIGjB1jdXowIKlaZLv8WFCfeV7kzdAo/YHqlTl
         CbYQ==
X-Gm-Message-State: AOAM533jO7ZOP7M1hKKxAwkX/MYYtivwEy6FFmDCsFd3Sx7+kQfOPkyd
	VLLp2EF9HQmSMtiXy++H8I0KHbKqDah9c6pLgxgN9NCtwY1zFw==
X-Google-Smtp-Source: 
 ABdhPJyytxGs75B43mIFFZEaMtpU71LCQkKD6ZSbtbBhWSkJQx5i6Dh4QyoRmprZ0hUxbe/AdgM04B3xJvH2Q42oJ0s=
X-Received: by 2002:a05:6402:e0c:b0:42d:7f16:ac2c with SMTP id
 h12-20020a0564020e0c00b0042d7f16ac2cmr4006876edh.328.1654158194366; Thu, 02
 Jun 2022 01:23:14 -0700 (PDT)
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 2 Jun 2022 10:23:03 +0200
Message-ID: 
 <CAMRc=Meo0zQbMsG_feDcPXwruGkphWEePspjUMOMBD3t+8tiGQ@mail.gmail.com>
Subject: Rust recipe fails to build project on kirkstone but works on dunfell
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 08:23:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166464

Hi!

I have a recipe[1] for a rust project. It builds the gstreamer plugin
for streaming from AWS S3 that is part of the gst-plugins-rs repo. I'm
upgrading the system from dunfell to kirkstone and trying to switch
from using meta-rust to using the rust support from openembedded-core.
The target is aarch64 and host is x86-64.

Unfortunately the build fails on kirkstone with the following error:

|     Building [===========>             ] 132/254: num-integer(build), quote...
|      Running `rustc --crate-name iovec
/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/cargo_home/bitbake/iovec-0.1.4/src/lib.rs
--error-format=json
--json=diagnostic-rendered-ansi,artifacts,future-incompat --crate-type
lib --emit=dep-info,metadata,link -C opt-level=3 -C debuginfo=2 -C
metadata=16f5461729d008fd -C extra-filename=-16f5461729d008fd
--out-dir /home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/build/target/aarch64-oe-linux/release/deps
--target aarch64-oe-linux -C
linker=/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/wrapper/target-rust-ccld
-L dependency=/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/build/target/aarch64-oe-linux/release/deps
-L dependency=/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/build/target/release/deps
--extern libc=/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/build/target/aarch64-oe-linux/release/deps/liblibc-f4d4da8aaaf5cc3b.rmeta
--cap-lints allow -L
/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/recipe-sysroot/usr/lib/rust
--remap-path-prefix=/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0=/usr/src/debug/gstreamer1.0-rusoto/0.6.0-r0`
| warning: target json file contains unused fields: has-elf-tls
|
| error: failed to run custom build command for `num-traits v0.2.12`
|
| Caused by:
|   process didn't exit successfully:
`/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/build/target/release/build/num-traits-399d85941461afdf/build-script-build`
(exit status: 101)
|   --- stderr
|   warning: target json file contains unused fields: has-elf-tls
|
|   warning: target json file contains unused fields: has-elf-tls
|
|   error[E0463]: can't find crate for `std`
|     |
|     = note: the `aarch64-oe-linux` target may not be installed
|     = help: consider downloading the target with `rustup target add
aarch64-oe-linux`
|
|   error: aborting due to previous error
|
|   For more information about this error, try `rustc --explain E0463`.
|   warning: target json file contains unused fields: has-elf-tls
|
|   warning: target json file contains unused fields: has-elf-tls
|
|   error[E0463]: can't find crate for `core`
|     |
|     = note: the `aarch64-oe-linux` target may not be installed
|     = help: consider downloading the target with `rustup target add
aarch64-oe-linux`
|
|   error[E0463]: can't find crate for `compiler_builtins`
|
|   error: aborting due to 2 previous errors
|
|   For more information about this error, try `rustc --explain E0463`.
|   warning: autocfg could not probe for `std`
|   warning: target json file contains unused fields: has-elf-tls
|
|   warning: target json file contains unused fields: has-elf-tls
|
|   error[E0463]: can't find crate for `std`
|     |
|     = note: the `aarch64-oe-linux` target may not be installed
|     = help: consider downloading the target with `rustup target add
aarch64-oe-linux`
|
|   error: aborting due to previous error
|
|   For more information about this error, try `rustc --explain E0463`.
|   thread 'main' panicked at 'i128 support was not detected!',
/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/armv8a-oe-linux/gstreamer1.0-rusoto/0.6.0-r0/cargo_home/bitbake/num-traits-0.2.12/build.rs:10:9
|   stack backtrace:
|      0: std::panicking::begin_panic
|                at
/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/x86_64-linux/rust-native/1.59.0-r0/rustc-1.59.0-src/library/std/src/panicking.rs:525:12
|      1: build_script_build::main
|                at ./build.rs:10:9
|      2: core::ops::function::FnOnce::call_once
|                at
/home/brgl/workspace/veki-kirkstone/build/tmp-glibc/work/x86_64-linux/rust-native/1.59.0-r0/rustc-1.59.0-src/library/core/src/ops/function.rs:227:5
|   note: Some details are omitted, run with `RUST_BACKTRACE=full` for
a verbose backtrace.
| warning: build failed, waiting for other jobs to finish...
|     Building [============>            ] 134/254: num-integer(build), quote...
|     Building [============>            ] 135/254: quote, http-body, typenum...
| warning: `paste` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 136/254: quote, http-body, typenum...
| warning: `http-body` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 137/254: quote, typenum, openssl-s...
| warning: `iovec` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 138/254: quote, typenum, openssl-s...
| warning: `rustc_version` (lib) generated 2 warnings (1 duplicate)
|     Building [============>            ] 139/254: quote, typenum, openssl-s...
| warning: `quote` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 140/254: typenum, openssl-sys(buil...
| warning: `httparse` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 141/254: typenum, openssl-sys(buil...
| warning: `net2` (lib) generated 2 warnings (2 duplicates)
|     Building [============>            ] 142/254: typenum, openssl-sys(buil...
| warning: `openssl-sys` (build script) generated 2 warnings (2 duplicates)
|     Building [=============>           ] 143/254: typenum
| warning: `typenum` (lib) generated 2 warnings (2 duplicates)
| error: build failed
| WARNING: exit code 101 from a shell command.

Not finding the 'std' crate looks like an environment problem but I'm
not sure what's wrong. Any hints are appreciated.

Thanks!
Bart

[1] https://pastebin.com/iCWpj8Ch

