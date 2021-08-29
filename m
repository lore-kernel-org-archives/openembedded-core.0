Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web08.4686.1630250283342942804
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Aug 2021 08:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WDD1vCWq;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id m19so8569094vsj.10
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Aug 2021 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=23rpamW/LJPsqePcgHebA7ZhF/IatI2583wJ/zZHdN4=;
        b=WDD1vCWqJPcUbM4iUqIhs7ugoQRxSe9Qh+Ah/LXvxS0+jyG7M7+RCog4DhfOBWh2XD
         doVV3MTQDMA0NKvg/B1PnJRNGUpcCOoOIn9bxOTjf1FVURf177JLF+WUmHvb65J1JYXG
         BNBnt9XOSOZyRfIO2BMz65BJyAk5adG15xWfkLLY83QRTWpfDba9bU71dFbBpCcuj2uT
         zdDy8Br6Er30mSN2b2XryTVMV3ZwFhkTRGi50BST1alMJLEJfy6YEd40Px8VwFTn/T+P
         aLmXztAhxbLYzSOd8L4X7eOGc5l31e6tl3i3/YPKNxQouINaCl5x9XrJ1VCWBPmoZ8lY
         8yGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=23rpamW/LJPsqePcgHebA7ZhF/IatI2583wJ/zZHdN4=;
        b=pOc/SqTI4YJqzinauxiibkupChu+mfkCoBnrw0k12b1LagViao1vWKYv/zu299y4pz
         4KyvDuo+o9E57mWQb3PRfmFd2A+4W0fBq6NregSXLYiNN6z6VCuuBPhatWi8mv4xDNIl
         wRGw3oQlLRykDA3zUDnoxt5RSfvbeG5SFUF2Z+wvN4ao2AJkwoNA0Vc0y/Etg4ojfZAs
         wRb0itr4+WgGaQVIXT1417NnoZhhWgD1cOsNsong4LoySB8+u6ervc7aUNKoIS/NpX6a
         V0gm/nP94pWKd2uvZ8Y9iTyKOl4nDEgqRVR3PqR2xcCt8tYSFihmHBdSflnAaNEUCL8k
         8VgQ==
X-Gm-Message-State: AOAM532z6EEWFFD3t40MnvIJkxj1fCEYADaB/uJK0icH1dTKQZvLuedQ
	qgy4ZyI1iB4Sc7/Gde+35RJ/RS4tP+JqYJ0rvv+lT4tU9yM=
X-Google-Smtp-Source: ABdhPJxfG2ndSOicj7peHJS3ASKLRDwYZtsoZ1QJNzif6g5pd1eIR5EHXPOP63TdBdu+wimoZBt++I7CtSrlYmNwYY8=
X-Received: by 2002:a05:6102:1343:: with SMTP id j3mr263099vsl.51.1630250281735;
 Sun, 29 Aug 2021 08:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <3aqge5gmth-1@m0250810.ppops.net> <d47a4a19-382c-ad6e-e3be-4ff4443fba7c@windriver.com>
In-Reply-To: <d47a4a19-382c-ad6e-e3be-4ff4443fba7c@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 29 Aug 2021 17:17:48 +0200
Message-ID: <CANNYZj8xLvDNBA3k=469+dDh7sfvOX2j6XSffGFWGTHf-7nHFw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] rustfmt: upgrading to 1.4.36 FAILED
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f022c905cab43836"

--000000000000f022c905cab43836
Content-Type: text/plain; charset="UTF-8"

No, the failure is not because of that. For rustfmt the version check
already works correctly, and 1.4.2 -> 1.4.36 attempt doesn't work because
devtool can't compile existing 1.4.2 rustfmt for the target:

ERROR: rustfmt-1.4.2-r0 do_compile: Execution of
'/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/temp/run.do_compile.2104'
failed with exit code 101:

Note that the target is qemux86, e.g. 32 bit.

Alex

On Sun, 29 Aug 2021 at 16:52, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2021-08-29 8:14 a.m., auh@auh.yoctoproject.org wrote:
> > Hello,
> >
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe *rustfmt* to *1.4.36*
> has Failed(other errors).
>
> It looks like Alex has a fix for this in his stack:
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=30e283fbd73388c75fbd6fa5c42f154c52483df1
>
>
> ../Randy
>
> >
> > Detailed error information:
> >
> > 'MACHINE=qemux86 bitbake rustfmt' failed
> > Loading cache...done.
> > Loaded 1472 entries from dependency cache.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           = "1.51.1"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "universal"
> > TARGET_SYS           = "i686-poky-linux"
> > MACHINE              = "qemux86"
> > DISTRO               = "poky"
> > DISTRO_VERSION       =
> "3.3+snapshot-8379cd839ccd1124972d3b58b1ae80306821b1af"
> > TUNE_FEATURES        = "m32 core2"
> > TARGET_FPU           = ""
> > meta
> > meta-poky
> > meta-yocto-bsp       =
> "tmp-auh-upgrades:8379cd839ccd1124972d3b58b1ae80306821b1af"
> > workspace            = "master:a5b257006b2c480d86e09909cdafb3c8ba05b863"
> >
> > Initialising tasks...done.
> > Sstate summary: Wanted 32 Local 8 Network 0 Missed 24 Current 146 (25%
> match, 86% complete)
> > NOTE: Executing Tasks
> > NOTE: Setscene tasks completed
> > NOTE: Running task 566 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:
> do_fetch)
> > NOTE: Running task 567 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_fetch)
> > NOTE: Running task 608 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_fetch)
> > NOTE: Running task 609 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_fetch)
> > NOTE: Running task 616 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:
> do_fetch)
> > NOTE: Running task 617 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb:
> do_fetch)
> > NOTE: Running task 631 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_fetch)
> > NOTE: Running task 644 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:
> do_fetch)
> > NOTE: recipe rustfmt-1.4.2-r0: task do_fetch: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_fetch: Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_fetch: Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_fetch: Started
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_fetch: Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_fetch: Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_fetch: Started
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_fetch: Started
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_fetch: Succeeded
> > NOTE: Running task 653 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb:
> do_unpack)
> > NOTE: Running task 654 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb:
> do_prepare_recipe_sysroot)
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_unpack: Started
> > NOTE: recipe ca-certificates-native-20210119-r0: task
> do_prepare_recipe_sysroot: Started
> > NOTE: recipe ca-certificates-native-20210119-r0: task
> do_prepare_recipe_sysroot: Succeeded
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_unpack:
> Succeeded
> > NOTE: Running task 655 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb:
> do_patch)
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_patch: Started
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_patch: Succeeded
> > NOTE: Running task 656 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb:
> do_deploy_source_date_epoch)
> > NOTE: recipe ca-certificates-native-20210119-r0: task
> do_deploy_source_date_epoch: Started
> > NOTE: recipe ca-certificates-native-20210119-r0: task
> do_deploy_source_date_epoch: Succeeded
> > NOTE: Running task 657 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb:
> do_configure)
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_configure:
> Started
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_configure:
> Succeeded
> > NOTE: Running task 658 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb:
> do_compile)
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_compile: Started
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_compile:
> Succeeded
> > NOTE: Running task 659 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb:
> do_install)
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_fetch: Succeeded
> > NOTE: Running task 660 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:
> do_unpack)
> > NOTE: Running task 661 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:
> do_prepare_recipe_sysroot)
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_install: Started
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_unpack: Started
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_prepare_recipe_sysroot:
> Started
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_prepare_recipe_sysroot:
> Succeeded
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_unpack: Succeeded
> > NOTE: Running task 662 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:
> do_patch)
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_patch: Started
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_patch: Succeeded
> > NOTE: Running task 663 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:
> do_deploy_source_date_epoch)
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_deploy_source_date_epoch:
> Started
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_deploy_source_date_epoch:
> Succeeded
> > NOTE: Running task 664 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:
> do_configure)
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_configure: Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_fetch: Succeeded
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_fetch: Succeeded
> > NOTE: Running task 665 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:
> do_unpack)
> > NOTE: Running task 666 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_unpack)
> > NOTE: Running task 667 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:
> do_prepare_recipe_sysroot)
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_fetch: Succeeded
> > NOTE: Running task 668 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_unpack)
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_unpack: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_unpack: Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_unpack: Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_prepare_recipe_sysroot:
> Started
> > NOTE: recipe ca-certificates-native-20210119-r0: task do_install:
> Succeeded
> > NOTE: Running task 669 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb:
> do_populate_sysroot)
> > NOTE: recipe ca-certificates-native-20210119-r0: task
> do_populate_sysroot: Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_prepare_recipe_sysroot:
> Succeeded
> > NOTE: recipe ca-certificates-native-20210119-r0: task
> do_populate_sysroot: Succeeded
> > NOTE: recipe cargo-native-1.54.0-r0: task do_fetch: Succeeded
> > NOTE: recipe rust-native-1.54.0-r0: task do_fetch: Succeeded
> > NOTE: Running task 670 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_unpack)
> > NOTE: Running task 671 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_unpack)
> > NOTE: recipe rust-native-1.54.0-r0: task do_unpack: Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_unpack: Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_unpack: Succeeded
> > NOTE: Running task 672 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_patch)
> > NOTE: Running task 673 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_rust_setup_snapshot)
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_patch: Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_setup_snapshot:
> Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_setup_snapshot:
> Succeeded
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_patch: Succeeded
> > NOTE: Running task 674 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_rust_create_wrappers)
> > NOTE: Running task 675 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_deploy_source_date_epoch)
> > NOTE: Running task 676 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_rust_gen_targets)
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task
> do_deploy_source_date_epoch: Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_gen_targets: Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_create_wrappers:
> Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_gen_targets:
> Succeeded
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_create_wrappers:
> Succeeded
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_configure: Succeeded
> > NOTE: Running task 677 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:
> do_compile)
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task
> do_deploy_source_date_epoch: Succeeded
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_compile: Started
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_compile: Succeeded
> > NOTE: Running task 678 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:
> do_install)
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_install: Started
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_install: Succeeded
> > NOTE: Running task 679 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:
> do_populate_sysroot)
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_populate_sysroot: Started
> > NOTE: recipe libssh2-native-1.9.0-r0: task do_populate_sysroot: Succeeded
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_unpack: Succeeded
> > NOTE: Running task 680 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:
> do_patch)
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_patch: Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_patch: Succeeded
> > NOTE: Running task 681 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:
> do_generate_toolchain_file)
> > NOTE: Running task 682 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:
> do_deploy_source_date_epoch)
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task
> do_generate_toolchain_file: Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task
> do_deploy_source_date_epoch: Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task
> do_generate_toolchain_file: Succeeded
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task
> do_deploy_source_date_epoch: Succeeded
> > NOTE: Running task 683 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:
> do_configure)
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_configure: Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_configure: Succeeded
> > NOTE: Running task 684 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:
> do_compile)
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_compile: Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_unpack: Succeeded
> > NOTE: Running task 685 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_patch)
> > NOTE: Running task 686 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_rust_setup_snapshot)
> > NOTE: recipe rust-native-1.54.0-r0: task do_patch: Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_rust_setup_snapshot: Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_patch: Succeeded
> > NOTE: Running task 687 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_rust_create_wrappers)
> > NOTE: Running task 688 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_deploy_source_date_epoch)
> > NOTE: Running task 689 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_rust_gen_targets)
> > NOTE: recipe rust-native-1.54.0-r0: task do_rust_create_wrappers: Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_deploy_source_date_epoch:
> Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_rust_gen_targets: Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_rust_gen_targets: Succeeded
> > NOTE: recipe rust-native-1.54.0-r0: task do_rust_create_wrappers:
> Succeeded
> > NOTE: recipe rust-native-1.54.0-r0: task do_deploy_source_date_epoch:
> Succeeded
> > NOTE: recipe rust-native-1.54.0-r0: task do_rust_setup_snapshot:
> Succeeded
> > NOTE: recipe rustfmt-1.4.2-r0: task do_fetch: Succeeded
> > NOTE: Running task 690 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:
> do_unpack)
> > NOTE: recipe rustfmt-1.4.2-r0: task do_unpack: Started
> > NOTE: recipe rustfmt-1.4.2-r0: task do_unpack: Succeeded
> > NOTE: Running task 691 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:
> do_patch)
> > NOTE: recipe rustfmt-1.4.2-r0: task do_patch: Started
> > NOTE: recipe rustfmt-1.4.2-r0: task do_patch: Succeeded
> > NOTE: Running task 692 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:
> do_rust_create_wrappers)
> > NOTE: Running task 693 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:
> do_deploy_source_date_epoch)
> > NOTE: Running task 694 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:
> do_populate_lic)
> > NOTE: recipe rustfmt-1.4.2-r0: task do_rust_create_wrappers: Started
> > NOTE: recipe rustfmt-1.4.2-r0: task do_populate_lic: Started
> > NOTE: recipe rustfmt-1.4.2-r0: task do_deploy_source_date_epoch: Started
> > NOTE: recipe rustfmt-1.4.2-r0: task do_rust_create_wrappers: Succeeded
> > NOTE: recipe rustfmt-1.4.2-r0: task do_deploy_source_date_epoch:
> Succeeded
> > NOTE: recipe rustfmt-1.4.2-r0: task do_populate_lic: Succeeded
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_unpack: Succeeded
> > NOTE: Running task 695 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_patch)
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_patch: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_patch: Succeeded
> > NOTE: Running task 696 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_rust_create_wrappers)
> > NOTE: Running task 697 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_deploy_source_date_epoch)
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_deploy_source_date_epoch:
> Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_rust_create_wrappers: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_rust_create_wrappers: Succeeded
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_deploy_source_date_epoch:
> Succeeded
> > NOTE: recipe cargo-native-1.54.0-r0: task do_unpack: Succeeded
> > NOTE: Running task 698 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_patch)
> > NOTE: Running task 699 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_cargo_setup_snapshot)
> > NOTE: recipe cargo-native-1.54.0-r0: task do_patch: Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_cargo_setup_snapshot:
> Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_patch: Succeeded
> > NOTE: Running task 700 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_rust_create_wrappers)
> > NOTE: Running task 701 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_deploy_source_date_epoch)
> > NOTE: recipe cargo-native-1.54.0-r0: task do_deploy_source_date_epoch:
> Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_rust_create_wrappers:
> Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_rust_create_wrappers:
> Succeeded
> > NOTE: recipe cargo-native-1.54.0-r0: task do_deploy_source_date_epoch:
> Succeeded
> > NOTE: recipe cargo-native-1.54.0-r0: task do_cargo_setup_snapshot:
> Succeeded
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_compile: Succeeded
> > NOTE: Running task 702 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:
> do_install)
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_install: Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_install: Succeeded
> > NOTE: Running task 703 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:
> do_populate_sysroot)
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_populate_sysroot:
> Started
> > NOTE: recipe rust-llvm-native-1.54.0-r0: task do_populate_sysroot:
> Succeeded
> > NOTE: Running task 704 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_prepare_recipe_sysroot)
> > NOTE: recipe rust-native-1.54.0-r0: task do_prepare_recipe_sysroot:
> Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_prepare_recipe_sysroot:
> Succeeded
> > NOTE: Running task 705 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_configure)
> > NOTE: recipe rust-native-1.54.0-r0: task do_configure: Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_configure: Succeeded
> > NOTE: Running task 706 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_compile)
> > NOTE: recipe rust-native-1.54.0-r0: task do_compile: Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_compile: Succeeded
> > NOTE: Running task 707 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_install)
> > NOTE: recipe rust-native-1.54.0-r0: task do_install: Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_install: Succeeded
> > NOTE: Running task 708 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:
> do_populate_sysroot)
> > NOTE: recipe rust-native-1.54.0-r0: task do_populate_sysroot: Started
> > NOTE: recipe rust-native-1.54.0-r0: task do_populate_sysroot: Succeeded
> > NOTE: Running task 709 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_prepare_recipe_sysroot)
> > NOTE: Running task 710 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_prepare_recipe_sysroot)
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_prepare_recipe_sysroot:
> Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_prepare_recipe_sysroot:
> Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_prepare_recipe_sysroot:
> Succeeded
> > NOTE: Running task 711 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_configure)
> > NOTE: recipe cargo-native-1.54.0-r0: task do_configure: Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_configure: Succeeded
> > NOTE: Running task 712 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_compile)
> > NOTE: recipe cargo-native-1.54.0-r0: task do_compile: Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_prepare_recipe_sysroot:
> Succeeded
> > NOTE: Running task 713 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_configure)
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_configure: Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_configure: Succeeded
> > NOTE: Running task 714 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_compile)
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_compile: Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_compile: Succeeded
> > NOTE: Running task 715 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_install)
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_install: Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_install: Succeeded
> > NOTE: Running task 716 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:
> do_populate_sysroot)
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_populate_sysroot: Started
> > NOTE: recipe rust-cross-i686-1.54.0-r0: task do_populate_sysroot:
> Succeeded
> > NOTE: recipe cargo-native-1.54.0-r0: task do_compile: Succeeded
> > NOTE: Running task 717 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_install)
> > NOTE: recipe cargo-native-1.54.0-r0: task do_install: Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_install: Succeeded
> > NOTE: Running task 718 of 736
> (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:
> do_populate_sysroot)
> > NOTE: recipe cargo-native-1.54.0-r0: task do_populate_sysroot: Started
> > NOTE: recipe cargo-native-1.54.0-r0: task do_populate_sysroot: Succeeded
> > NOTE: Running task 719 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_prepare_recipe_sysroot)
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_prepare_recipe_sysroot: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_prepare_recipe_sysroot:
> Succeeded
> > NOTE: Running task 720 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_configure)
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_configure: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_configure: Succeeded
> > NOTE: Running task 721 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_compile)
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_compile: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_compile: Succeeded
> > NOTE: Running task 722 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_install)
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_install: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_install: Succeeded
> > NOTE: Running task 723 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_package)
> > NOTE: Running task 724 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_populate_sysroot)
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_populate_sysroot: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_package: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_populate_sysroot: Succeeded
> > NOTE: Running task 725 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:
> do_prepare_recipe_sysroot)
> > NOTE: recipe rustfmt-1.4.2-r0: task do_prepare_recipe_sysroot: Started
> > NOTE: recipe rustfmt-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
> > NOTE: Running task 726 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:
> do_configure)
> > NOTE: recipe rustfmt-1.4.2-r0: task do_configure: Started
> > NOTE: recipe rustfmt-1.4.2-r0: task do_configure: Succeeded
> > NOTE: Running task 727 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:
> do_compile)
> > NOTE: recipe rustfmt-1.4.2-r0: task do_compile: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_package: Succeeded
> > NOTE: Running task 728 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_packagedata)
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_packagedata: Started
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_packagedata: Succeeded
> > NOTE: Running task 729 of 736
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:
> do_package_write_rpm)
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_package_write_rpm: Started
> > ERROR: rustfmt-1.4.2-r0 do_compile: Execution of
> '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/temp/run.do_compile.2104'
> failed with exit code 101:
> >     Compiling proc-macro2 v0.4.30
> >     Compiling unicode-xid v0.1.0
> >     Compiling syn v0.15.42
> >     Compiling libc v0.2.60
> >     Compiling cfg-if v0.1.9
> >     Compiling serde v1.0.97
> >     Compiling spin v0.5.0
> >     Compiling rand_core v0.4.0
> >     Compiling autocfg v0.1.5
> >     Compiling log v0.4.7
> >     Compiling semver-parser v0.7.0
> >     Compiling arrayvec v0.4.11
> >     Compiling scopeguard v0.3.3
> >     Compiling nodrop v0.1.13
> >     Compiling memoffset v0.2.1
> >     Compiling byteorder v1.3.2
> >     Compiling stable_deref_trait v1.1.1
> >     Compiling smallvec v0.6.10
> >     Compiling rustc-rayon-core v0.2.0
> >     Compiling memchr v2.2.1
> >     Compiling rustc-rayon v0.2.0
> >     Compiling either v1.5.2
> >     Compiling unicode-width v0.1.5
> >     Compiling indexmap v1.0.2
> >     Compiling bitflags v1.1.0
> >     Compiling rustc-ap-graphviz v542.0.0
> >     Compiling cc v1.0.38
> >     Compiling ansi_term v0.11.0
> >     Compiling ucd-util v0.1.5
> >     Compiling ryu v1.0.0
> >     Compiling failure_derive v0.1.5
> >     Compiling utf8-ranges v1.0.3
> >     Compiling scoped-tls v1.0.0
> >     Compiling unicode-segmentation v1.3.0
> >     Compiling rustc-ap-rustc_target v542.0.0
> >     Compiling termcolor v1.0.5
> >     Compiling rustc-demangle v0.1.15
> >     Compiling itoa v0.4.4
> >     Compiling quick-error v1.2.2
> >     Compiling fnv v1.0.6
> >     Compiling same-file v1.0.5
> >     Compiling rustc-ap-syntax v542.0.0
> >     Compiling vec_map v0.8.1
> >     Compiling strsim v0.8.0
> >     Compiling rustfmt-nightly v1.4.2
> (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/git)
> >     Compiling rustc-ap-rustc_lexer v542.0.0
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/proc-macro2-0.4.30/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="proc-macro"' -C
> metadata=df9c0358a8f4cef2 -C extra-filename=-df9c0358a8f4cef2 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/proc-macro2-df9c0358a8f4cef2
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name unicode_xid
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-xid-0.1.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off --cfg 'feature="default"' -C metadata=11f58d24801d743d
> -C extra-filename=-11f58d24801d743d --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name cfg_if
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/cfg-if-0.1.9/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=81f5d828fe65528e -C
> extra-filename=-81f5d828fe65528e --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints a
> >   llow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/syn-0.15.42/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="clone-impls"' --cfg 'feature="default"' --cfg 'feature="derive"'
> --cfg 'feature="extra-traits"' --cfg 'feature="full"' --cfg
> 'feature="parsing"' --cfg 'feature="printing"' --cfg 'feature="proc-macro"'
> --cfg 'feature="quote"' --cfg 'feature="visit"' -C
> metadata=61f79f9dccfd40ba -C extra-filename=-61f79f9dccfd40ba --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/syn-61f79f9dccfd40ba
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L dependency=/home/pokybuild/yocto-worker/auh/build/build/
> >
>  build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/libc-0.2.60/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="std"' -C metadata=94ebb09615a0f486 -C
> extra-filename=-94ebb09615a0f486 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/libc-94ebb09615a0f486
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/serde-1.0.97/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="serde_derive"'
> --cfg 'feature="std"' -C metadata=397ac514ce86af00 -C
> extra-filename=-397ac514ce86af00 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/serde-397ac514ce86af00
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name spin
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/spin-0.5.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=7dd7ec836f8c506a -C
> extra-filename=-7dd7ec836f8c506a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow
> >    -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name rand_core
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rand_core-0.4.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="std"' -C
> metadata=966535236305dc5a -C extra-filename=-966535236305dc5a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust
> >   fmt/1.4.2-r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name autocfg
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/autocfg-0.1.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=9c7ae0aed7fc9823 -C
> extra-filename=-9c7ae0aed7fc9823 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/log-0.4.7/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="std"' -C metadata=e098f27b12050390 -C
> extra-filename=-e098f27b12050390 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/log-e098f27b12050390
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name semver_parser
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=f3b50fe98e08dd8b -C
> extra-filename=-f3b50fe98e08dd8b --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/arrayvec-0.4.11/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=9e8f7b244197be3e -C extra-filename=-9e8f7b244197be3e --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/arrayvec-9e8f7b244197be3e
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name scopeguard
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/scopeguard-0.3.3/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=fab120a9dd5bad14 -C
> extra-filename=-fab120a9dd5bad14 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap
> >   -lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name nodrop
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/nodrop-0.1.13/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=a17fe61129e65b62 -C
> extra-filename=-a17fe61129e65b62 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints
> >   allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name memoffset
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/memoffset-0.2.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=2f78f4fec416c99f -C
> extra-filename=-2f78f4fec416c99f --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-l
> >   ints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/byteorder-1.3.2/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="std"' -C metadata=539ed0edcb1553e7 -C
> extra-filename=-539ed0edcb1553e7 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/byteorder-539ed0edcb1553e7
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name stable_deref_trait
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/stable_deref_trait-1.1.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C
> metadata=bf11e8975b7faa18 -C extra-filename=-bf11e8975b7faa18 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
> >   2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints
> allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name smallvec
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="may_dangle"'
> --cfg 'feature="std"' --cfg 'feature="union"' -C metadata=c3ebde62e7bb47d1
> -C extra-filename=-c3ebde62e7bb47d1 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L dependency=/home/pokybuild/yocto-worker/auh/b
> >
>  uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-core-0.2.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=ea88230473b39d14 -C extra-filename=-ea88230473b39d14 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-rayon-core-ea88230473b39d14
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/memchr-2.2.1/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="use_std"' -C metadata=ce8d38ceb83b8294
> -C extra-filename=-ce8d38ceb83b8294 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/memchr-ce8d38ceb83b8294
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-0.2.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=5cea4c63c5dbd532 -C extra-filename=-5cea4c63c5dbd532 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-rayon-5cea4c63c5dbd532
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name either
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ea126583284a07f6 -C
> extra-filename=-ea126583284a07f6 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints a
> >   llow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name unicode_width
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-width-0.1.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' -C metadata=f9067b939a2e9ee3 -C
> extra-filename=-f9067b939a2e9ee3 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0
> >   /build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name indexmap
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/indexmap-1.0.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=f0d6daf2923716e0 -C
> extra-filename=-f0d6daf2923716e0 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lin
> >   ts allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/bitflags-1.1.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' -C metadata=8ecc663c609fc416 -C
> extra-filename=-8ecc663c609fc416 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/bitflags-8ecc663c609fc416
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name graphviz --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=616067e14d16bb5d -C
> extra-filename=-616067e14d16bb5d --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/
> >   release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name cc
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/cc-1.0.38/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=99eeff8d683be0c9 -C
> extra-filename=-99eeff8d683be0c9 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name either
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=a3de0059007db7dd -C
> extra-filename=-a3de0059007db7dd --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name ansi_term
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/ansi_term-0.11.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=97891616a3048472 -C
> extra-filename=-97891616a3048472 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-
> >   lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name ucd_util
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/ucd-util-0.1.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=c66dafd726901704 -C
> extra-filename=-c66dafd726901704 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lin
> >   ts allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/ryu-1.0.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=cf40bafebc5d9e2a -C extra-filename=-cf40bafebc5d9e2a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/ryu-cf40bafebc5d9e2a
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/failure_derive-0.1.5/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=500d9a3c0d7056cc -C extra-filename=-500d9a3c0d7056cc --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/failure_derive-500d9a3c0d7056cc
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name utf8_ranges
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/utf8-ranges-1.0.3/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ca04778dfdc33722 -C
> extra-filename=-ca04778dfdc33722 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --c
> >   ap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name scoped_tls
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/scoped-tls-1.0.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=4300e3ebfe432670 -C
> extra-filename=-4300e3ebfe432670 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap
> >   -lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name unicode_segmentation
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=609f5d0c875e0967 -C
> extra-filename=-609f5d0c875e0967 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name build_script_build --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_target-542.0.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=b1efc0d6a47b6a5c -C extra-filename=-b1efc0d6a47b6a5c --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-rustc_target-b1efc0d6a47b6a5c
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name termcolor
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/termcolor-1.0.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=af0d11e6713415b8 -C
> extra-filename=-af0d11e6713415b8 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-l
> >   ints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name rustc_demangle
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-demangle-0.1.15/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=f5028ac44d69eb7a -C
> extra-filename=-f5028ac44d69eb7a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/d
> >   eps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name itoa
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/itoa-0.4.4/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C
> metadata=efd7d4d7b4402894 -C extra-filename=-efd7d4d7b4402894 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.
> >   2-r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name quick_error
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/quick-error-1.2.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=83b8dad83398e3a4 -C
> extra-filename=-83b8dad83398e3a4 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --c
> >   ap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name fnv
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/fnv-1.0.6/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ceb682049fbd227a -C
> extra-filename=-ceb682049fbd227a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow -L /h
> >
>  ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name same_file
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/same-file-1.0.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=b7f253f5d5610b25 -C
> extra-filename=-b7f253f5d5610b25 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-l
> >   ints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name build_script_build --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-syntax-542.0.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=5aebbe0c13823bdd -C extra-filename=-5aebbe0c13823bdd --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-syntax-5aebbe0c13823bdd
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> >       Running `rustc --crate-name vec_map
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/vec_map-0.8.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=5831430b43ab8372 -C
> extra-filename=-5831430b43ab8372 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints
> >    allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name semver_parser
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ba877faa789ab53c -C
> extra-filename=-ba877faa789ab53c --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> >    --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name strsim
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/strsim-0.8.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=8aa9952c97613c38 -C
> extra-filename=-8aa9952c97613c38 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints a
> >   llow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >       Running `rustc --crate-name build_script_build --edition=2018
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="cargo-fmt"' --cfg 'feature="default"' --cfg
> 'feature="rustfmt-format-diff"' -C metadata=533f8374b6d41dfb -C
> extra-filename=-533f8374b6d41dfb --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustfmt-nightly-533f8374b6d41dfb
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps`
> >       Running `rustc --crate-name rustc_lexer --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=f811c840c35ab6d3 -C
> extra-filename=-f811c840c35ab6d3 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/bui
> >   ld/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >      Building [                           ] 0/167: vec_map, syn(build.rs),
> m...
> >     Compiling diff v0.1.11
> >      Building [                           ] 1/167: vec_map, syn(build.rs),
> m...
> >       Running `rustc --crate-name diff
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/diff-0.1.11/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=34e9b70cb21518fd -C
> extra-filename=-34e9b70cb21518fd --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allo
> >   w -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > error[E0554]: `#![feature]` may not be used on the stable release channel
> >    -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/lib.rs:33
> :32
> >     |
> > 33 | #![cfg_attr(feature = "union", feature(untagged_unions))]
> >     |                                ^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > error[E0554]: `#![feature]` may not be used on the stable release channel
> >    -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/lib.rs:35
> :37
> >     |
> > 35 | #![cfg_attr(feature = "may_dangle", feature(dropck_eyepatch))]
> >     |                                     ^^^^^^^^^^^^^^^^^^^^^^^^
> >
> >      Building [                           ] 2/167: vec_map, syn(build.rs),
> s...
> >       Running `rustc --crate-name unicode_segmentation
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ea80c7cedc2e61b8 -C
> extra-filename=-ea80c7cedc2e61b8 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe
> >   t/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >     Compiling rustc-workspace-hack v1.0.0
> >      Building [                           ] 3/167: vec_map, syn(build.rs),
> s...
> >       Running `rustc --crate-name rustc_workspace_hack
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-workspace-hack-1.0.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=4f12a631a3f78c68 -C
> extra-filename=-4f12a631a3f78c68 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe
> >   t/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > error[E0554]: `#![feature]` may not be used on the stable release channel
> >     -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/lib.rs:277
> :1
> >      |
> > 277 | #![feature(rustc_private, nll)]
> >      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> >     Compiling bytecount v0.5.1
> >      Building [                           ] 4/167: vec_map, syn(build.rs),
> s...
> >       Running `rustc --crate-name bytecount
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/bytecount-0.5.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=efcff43f975d063b -C
> extra-filename=-efcff43f975d063b --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-l
> >   ints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >     Compiling unicode_categories v0.1.1
> >      Building [                           ] 5/167: vec_map, syn(build.rs),
> s...
> >       Running `rustc --crate-name unicode_categories
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode_categories-0.1.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=1142561a6fb03929 -C
> extra-filename=-1142561a6fb03929 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/re
> >   lease/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >     Compiling crossbeam-utils v0.2.2
> >      Building [                           ] 6/167: vec_map, syn(build.rs),
> c...
> >       Running `rustc --crate-name crossbeam_utils
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/crossbeam-utils-0.2.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="use_std"' -C
> metadata=5683e3e83934a5f7 -C extra-filename=-5683e3e83934a5f7 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-
> >   32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --extern
> cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libcfg_if-81f5d828fe65528e.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >     Compiling owning_ref v0.4.0
> >      Building [>                          ] 7/167: vec_map, syn(build.rs),
> c...
> >       Running `rustc --crate-name owning_ref
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/owning_ref-0.4.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=432adf1bd23f2849 -C
> extra-filename=-432adf1bd23f2849 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --ext
> >   ern
> stable_deref_trait=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libstable_deref_trait-bf11e8975b7faa18.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >      Building [>                          ] 8/167: vec_map, syn(build.rs),
> c...
> > error[E0433]: failed to resolve: could not find `property` in `unicode`
> >     -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:672
> :24
> >      |
> > 672 |         core::unicode::property::Pattern_White_Space(c)
> >      |                        ^^^^^^^^ could not find `property` in
> `unicode`
> >
> > error[E0554]: `#![feature]` may not be used on the stable release channel
> >   -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:3
> :43
> >    |
> > 3 | #![cfg_attr(not(feature = "unicode-xid"),
> feature(unicode_internals))]
> >    |                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> >     Compiling humantime v1.2.0
> >      Building [>                          ] 9/167: vec_map, syn(build.rs),
> c...
> >       Running `rustc --crate-name humantime
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/humantime-1.2.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=8de357e2c8248f8b -C
> extra-filename=-8de357e2c8248f8b --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --exter
> >   n
> quick_error=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libquick_error-83b8dad83398e3a4.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >     Compiling walkdir v2.2.9
> >     Compiling textwrap v0.11.0
> >       Running `rustc --crate-name walkdir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/walkdir-2.2.9/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=9fe5824e18efee6f -C
> extra-filename=-9fe5824e18efee6f --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --extern sa
> >
>  me_file=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libsame_file-b7f253f5d5610b25.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >      Building [>                         ] 11/167: vec_map, syn(build.rs),
> c...
> >       Running `rustc --crate-name textwrap
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/textwrap-0.11.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=95d05764bcecd09a -C
> extra-filename=-95d05764bcecd09a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --extern
> >
> unicode_width=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > error: aborting due to previous error
> >
> > For more information about this error, try `rustc --explain E0554`.
> >     Compiling getopts v0.2.19
> >      Building [>                         ] 12/167: vec_map, syn(build.rs),
> c...
> >       Running `rustc --crate-name getopts
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/getopts-0.2.19/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=0873084cbf9afd94 -C
> extra-filename=-0873084cbf9afd94 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --extern u
> >
>  nicode_width=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> >     Compiling itertools v0.8.0
> >      Building [=>                        ] 13/167: vec_map, syn(build.rs),
> c...
> >       Running `rustc --crate-name itertools
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/itertools-0.8.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off --cfg 'feature="default"' --cfg 'feature="use_std"' -C
> metadata=ff7eca720ccd13a2 -C extra-filename=-ff7eca720ccd13a2 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --extern
> either=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps/libeither-a3
> >   de0059007db7dd.rmeta --cap-lints allow`
> > error: could not compile `rustc-ap-graphviz`
> >
> > Caused by:
> >    process didn't exit successfully: `rustc --crate-name graphviz
> --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=616067e14d16bb5d -C
> extra-filename=-616067e14d16bb5d --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt
> >   /1.4.2-r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> (exit status: 1)
> > warning: build failed, waiting for other jobs to finish...
> >      Building [=>                        ] 14/167: vec_map, syn(build.rs),
> c...
> >      Building [=>                        ] 15/167: vec_map, syn(build.rs),
> c...
> >      Building [=>                        ] 16/167: vec_map, syn(build.rs),
> c...
> >      Building [=>                        ] 17/167: vec_map, syn(build.rs),
> c...
> >      Building [=>                        ] 18/167: vec_map, syn(build.rs),
> c...
> >      Building [=>                        ] 19/167: vec_map, syn(build.rs),
> c...
> > error: aborting due to 2 previous errors
> >
> > For more information about this error, try `rustc --explain E0554`.
> >      Building [==>                       ] 20/167: vec_map, syn(build.rs),
> c...
> >      Building [==>                       ] 21/167: vec_map, syn(build.rs),
> c...
> >      Building [==>                       ] 22/167: vec_map, syn(build.rs),
> c...
> >      Building [==>                       ] 24/167: syn(build.rs),
> crossbeam-...
> > error[E0599]: no method named `is_xid_start` found for type `char` in
> the current scope
> >     -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:689
> :33
> >      |
> > 689 |             || (c > '\x7f' && c.is_xid_start())
> >      |                                 ^^^^^^^^^^^^ method not found in
> `char`
> >
> > error[E0599]: no method named `is_xid_continue` found for type `char` in
> the current scope
> >     -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:708
> :33
> >      |
> > 708 |             || (c > '\x7f' && c.is_xid_continue())
> >      |                                 ^^^^^^^^^^^^^^^ method not found
> in `char`
> >
> >      Building [==>                       ] 25/167: syn(build.rs),
> crossbeam-...
> > error: aborting due to 4 previous errors
> >
> > Some errors have detailed explanations: E0433, E0554, E0599.
> > For more information about an error, try `rustc --explain E0433`.
> >      Building [===>                      ] 26/167: syn(build.rs),
> crossbeam-...
> >      Building [===>                      ] 27/167: syn(build.rs),
> crossbeam-...
> >      Building [===>                      ] 28/167: syn(build.rs),
> crossbeam-...
> >      Building [===>                      ] 29/167: syn(build.rs),
> crossbeam-...
> >      Building [===>                      ] 30/167: crossbeam-utils,
> serde(bu...
> >      Building [===>                      ] 31/167: crossbeam-utils,
> serde(bu...
> >      Building [===>                      ] 32/167: crossbeam-utils,
> utf8-ran...
> >      Building [====>                     ] 33/167: crossbeam-utils,
> utf8-ran...
> >      Building [====>                     ] 34/167: crossbeam-utils,
> utf8-ran...
> >      Building [====>                     ] 35/167: crossbeam-utils,
> utf8-ran...
> >      Building [====>                     ] 36/167: crossbeam-utils,
> utf8-ran...
> >      Building [====>                     ] 37/167: crossbeam-utils,
> utf8-ran...
> >      Building [====>                     ] 38/167: utf8-ranges, cc,
> walkdir,...
> >      Building [=====>                    ] 39/167: utf8-ranges, cc,
> walkdir,...
> >      Building [=====>                    ] 40/167: cc, walkdir, getopts,
> hum...
> >      Building [=====>                    ] 41/167: cc, walkdir, getopts,
> hum...
> >      Building [=====>                    ] 42/167: cc, walkdir, getopts,
> hum...
> >      Building [=====>                    ] 43/167: cc, walkdir, getopts,
> hum...
> >      Building [=====>                    ] 44/167: cc, walkdir, getopts,
> hum...
> >      Building [======>                   ] 45/167: cc, walkdir, getopts,
> hum...
> >      Building [======>                   ] 46/167: cc, walkdir, getopts,
> hum...
> >      Building [======>                   ] 47/167: cc, walkdir, getopts,
> hum...
> >      Building [======>                   ] 48/167: cc, walkdir, getopts,
> hum...
> >      Building [======>                   ] 49/167: cc, walkdir, getopts,
> hum...
> >      Building [======>                   ] 50/167: cc, walkdir, getopts,
> sem...
> >      Building [======>                   ] 51/167: cc, walkdir, getopts,
> str...
> >      Building [=======>                  ] 52/167: cc, walkdir, getopts,
> dif...
> >      Building [=======>                  ] 53/167: cc, walkdir, getopts,
> dif...
> >      Building [=======>                  ] 54/167: cc, walkdir, getopts,
> dif...
> >      Building [=======>                  ] 55/167: walkdir, getopts,
> diff, r...
> >      Building [=======>                  ] 56/167: getopts, diff,
> rustc-dema...
> >      Building [=======>                  ] 57/167: getopts,
> rustc-demangle, ...
> >      Building [========>                 ] 58/167: getopts, itertools
> >      Building [========>                 ] 59/167: getopts
> > error: build failed
> > WARNING: exit code 101 from a shell command.
> >
> > ERROR: Logfile of failure stored in:
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/temp/log.do_compile.2104
> > Log data follows:
> > | DEBUG: Executing shell function do_compile
> > | NOTE: cargo =
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot-native/usr/bin/cargo
> > | NOTE: rustc =
> > | NOTE: cargo build -v --target i686-poky-linux --release
> --manifest-path=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/git//Cargo.toml
> > |    Compiling proc-macro2 v0.4.30
> > |    Compiling unicode-xid v0.1.0
> > |    Compiling syn v0.15.42
> > |    Compiling libc v0.2.60
> > |    Compiling cfg-if v0.1.9
> > |    Compiling serde v1.0.97
> > |    Compiling spin v0.5.0
> > |    Compiling rand_core v0.4.0
> > |    Compiling autocfg v0.1.5
> > |    Compiling log v0.4.7
> > |    Compiling semver-parser v0.7.0
> > |    Compiling arrayvec v0.4.11
> > |    Compiling scopeguard v0.3.3
> > |    Compiling nodrop v0.1.13
> > |    Compiling memoffset v0.2.1
> > |    Compiling byteorder v1.3.2
> > |    Compiling stable_deref_trait v1.1.1
> > |    Compiling smallvec v0.6.10
> > |    Compiling rustc-rayon-core v0.2.0
> > |    Compiling memchr v2.2.1
> > |    Compiling rustc-rayon v0.2.0
> > |    Compiling either v1.5.2
> > |    Compiling unicode-width v0.1.5
> > |    Compiling indexmap v1.0.2
> > |    Compiling bitflags v1.1.0
> > |    Compiling rustc-ap-graphviz v542.0.0
> > |    Compiling cc v1.0.38
> > |    Compiling ansi_term v0.11.0
> > |    Compiling ucd-util v0.1.5
> > |    Compiling ryu v1.0.0
> > |    Compiling failure_derive v0.1.5
> > |    Compiling utf8-ranges v1.0.3
> > |    Compiling scoped-tls v1.0.0
> > |    Compiling unicode-segmentation v1.3.0
> > |    Compiling rustc-ap-rustc_target v542.0.0
> > |    Compiling termcolor v1.0.5
> > |    Compiling rustc-demangle v0.1.15
> > |    Compiling itoa v0.4.4
> > |    Compiling quick-error v1.2.2
> > |    Compiling fnv v1.0.6
> > |    Compiling same-file v1.0.5
> > |    Compiling rustc-ap-syntax v542.0.0
> > |    Compiling vec_map v0.8.1
> > |    Compiling strsim v0.8.0
> > |    Compiling rustfmt-nightly v1.4.2
> (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/git)
> > |    Compiling rustc-ap-rustc_lexer v542.0.0
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/proc-macro2-0.4.30/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="proc-macro"' -C
> metadata=df9c0358a8f4cef2 -C extra-filename=-df9c0358a8f4cef2 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/proc-macro2-df9c0358a8f4cef2
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name unicode_xid
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-xid-0.1.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off --cfg 'feature="default"' -C metadata=11f58d24801d743d
> -C extra-filename=-11f58d24801d743d --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name cfg_if
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/cfg-if-0.1.9/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=81f5d828fe65528e -C
> extra-filename=-81f5d828fe65528e --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints
> >    allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/syn-0.15.42/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="clone-impls"' --cfg 'feature="default"' --cfg 'feature="derive"'
> --cfg 'feature="extra-traits"' --cfg 'feature="full"' --cfg
> 'feature="parsing"' --cfg 'feature="printing"' --cfg 'feature="proc-macro"'
> --cfg 'feature="quote"' --cfg 'feature="visit"' -C
> metadata=61f79f9dccfd40ba -C extra-filename=-61f79f9dccfd40ba --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/syn-61f79f9dccfd40ba
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L dependency=/home/pokybuild/yocto-worker/auh/build/buil
> >
>  d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/libc-0.2.60/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="std"' -C metadata=94ebb09615a0f486 -C
> extra-filename=-94ebb09615a0f486 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/libc-94ebb09615a0f486
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/serde-1.0.97/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="serde_derive"'
> --cfg 'feature="std"' -C metadata=397ac514ce86af00 -C
> extra-filename=-397ac514ce86af00 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/serde-397ac514ce86af00
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name spin
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/spin-0.5.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=7dd7ec836f8c506a -C
> extra-filename=-7dd7ec836f8c506a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints all
> >   ow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name rand_core
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rand_core-0.4.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="std"' -C
> metadata=966535236305dc5a -C extra-filename=-966535236305dc5a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru
> >   stfmt/1.4.2-r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name autocfg
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/autocfg-0.1.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=9c7ae0aed7fc9823 -C
> extra-filename=-9c7ae0aed7fc9823 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/log-0.4.7/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="std"' -C metadata=e098f27b12050390 -C
> extra-filename=-e098f27b12050390 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/log-e098f27b12050390
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name semver_parser
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=f3b50fe98e08dd8b -C
> extra-filename=-f3b50fe98e08dd8b --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/arrayvec-0.4.11/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=9e8f7b244197be3e -C extra-filename=-9e8f7b244197be3e --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/arrayvec-9e8f7b244197be3e
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name scopeguard
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/scopeguard-0.3.3/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=fab120a9dd5bad14 -C
> extra-filename=-fab120a9dd5bad14 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --c
> >   ap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name nodrop
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/nodrop-0.1.13/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=a17fe61129e65b62 -C
> extra-filename=-a17fe61129e65b62 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lint
> >   s allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name memoffset
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/memoffset-0.2.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=2f78f4fec416c99f -C
> extra-filename=-2f78f4fec416c99f --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap
> >   -lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/byteorder-1.3.2/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="std"' -C metadata=539ed0edcb1553e7 -C
> extra-filename=-539ed0edcb1553e7 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/byteorder-539ed0edcb1553e7
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name stable_deref_trait
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/stable_deref_trait-1.1.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C
> metadata=bf11e8975b7faa18 -C extra-filename=-bf11e8975b7faa18 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
> >   re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name smallvec
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="may_dangle"'
> --cfg 'feature="std"' --cfg 'feature="union"' -C metadata=c3ebde62e7bb47d1
> -C extra-filename=-c3ebde62e7bb47d1 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L dependency=/home/pokybuild/yocto-worker/auh
> >
>  /build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-core-0.2.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=ea88230473b39d14 -C extra-filename=-ea88230473b39d14 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-rayon-core-ea88230473b39d14
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/memchr-2.2.1/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="use_std"' -C metadata=ce8d38ceb83b8294
> -C extra-filename=-ce8d38ceb83b8294 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/memchr-ce8d38ceb83b8294
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-0.2.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=5cea4c63c5dbd532 -C extra-filename=-5cea4c63c5dbd532 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-rayon-5cea4c63c5dbd532
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name either
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ea126583284a07f6 -C
> extra-filename=-ea126583284a07f6 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints
> >    allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name unicode_width
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-width-0.1.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' -C metadata=f9067b939a2e9ee3 -C
> extra-filename=-f9067b939a2e9ee3 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-
> >   r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name indexmap
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/indexmap-1.0.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=f0d6daf2923716e0 -C
> extra-filename=-f0d6daf2923716e0 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-l
> >   ints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/bitflags-1.1.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' -C metadata=8ecc663c609fc416 -C
> extra-filename=-8ecc663c609fc416 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/bitflags-8ecc663c609fc416
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name graphviz --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=616067e14d16bb5d -C
> extra-filename=-616067e14d16bb5d --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe
> >   t/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name cc
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/cc-1.0.38/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=99eeff8d683be0c9 -C
> extra-filename=-99eeff8d683be0c9 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name either
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=a3de0059007db7dd -C
> extra-filename=-a3de0059007db7dd --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name ansi_term
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/ansi_term-0.11.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=97891616a3048472 -C
> extra-filename=-97891616a3048472 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --ca
> >   p-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name ucd_util
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/ucd-util-0.1.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=c66dafd726901704 -C
> extra-filename=-c66dafd726901704 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-l
> >   ints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/ryu-1.0.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=cf40bafebc5d9e2a -C extra-filename=-cf40bafebc5d9e2a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/ryu-cf40bafebc5d9e2a
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/failure_derive-0.1.5/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=500d9a3c0d7056cc -C extra-filename=-500d9a3c0d7056cc --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/failure_derive-500d9a3c0d7056cc
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name utf8_ranges
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/utf8-ranges-1.0.3/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ca04778dfdc33722 -C
> extra-filename=-ca04778dfdc33722 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -
> >   -cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name scoped_tls
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/scoped-tls-1.0.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=4300e3ebfe432670 -C
> extra-filename=-4300e3ebfe432670 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --c
> >   ap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name unicode_segmentation
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=609f5d0c875e0967 -C
> extra-filename=-609f5d0c875e0967 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_target-542.0.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=b1efc0d6a47b6a5c -C extra-filename=-b1efc0d6a47b6a5c --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-rustc_target-b1efc0d6a47b6a5c
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name termcolor
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/termcolor-1.0.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=af0d11e6713415b8 -C
> extra-filename=-af0d11e6713415b8 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap
> >   -lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name rustc_demangle
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-demangle-0.1.15/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=f5028ac44d69eb7a -C
> extra-filename=-f5028ac44d69eb7a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release
> >   /deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name itoa
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/itoa-0.4.4/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C
> metadata=efd7d4d7b4402894 -C extra-filename=-efd7d4d7b4402894 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.
> >   4.2-r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name quick_error
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/quick-error-1.2.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=83b8dad83398e3a4 -C
> extra-filename=-83b8dad83398e3a4 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -
> >   -cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name fnv
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/fnv-1.0.6/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ceb682049fbd227a -C
> extra-filename=-ceb682049fbd227a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow -L
> >
>  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name same_file
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/same-file-1.0.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=b7f253f5d5610b25 -C
> extra-filename=-b7f253f5d5610b25 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap
> >   -lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-syntax-542.0.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=5aebbe0c13823bdd -C extra-filename=-5aebbe0c13823bdd --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-syntax-5aebbe0c13823bdd
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name vec_map
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/vec_map-0.8.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=5831430b43ab8372 -C
> extra-filename=-5831430b43ab8372 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lin
> >   ts allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name semver_parser
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ba877faa789ab53c -C
> extra-filename=-ba877faa789ab53c --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/de
> >   ps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name strsim
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/strsim-0.8.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=8aa9952c97613c38 -C
> extra-filename=-8aa9952c97613c38 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints
> >    allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build --edition=2018
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="cargo-fmt"' --cfg 'feature="default"' --cfg
> 'feature="rustfmt-format-diff"' -C metadata=533f8374b6d41dfb -C
> extra-filename=-533f8374b6d41dfb --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustfmt-nightly-533f8374b6d41dfb
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps`
> > |      Running `rustc --crate-name rustc_lexer --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=f811c840c35ab6d3 -C
> extra-filename=-f811c840c35ab6d3 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/b
> >   uild/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |     Building [                           ] 0/167: vec_map, syn(
> build.rs), m...
> > |    Compiling diff v0.1.11
> > |     Building [                           ] 1/167: vec_map, syn(
> build.rs), m...
> > |      Running `rustc --crate-name diff
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/diff-0.1.11/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=34e9b70cb21518fd -C
> extra-filename=-34e9b70cb21518fd --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints al
> >   low -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > | error[E0554]: `#![feature]` may not be used on the stable release
> channel
> > |   -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/lib.rs:33
> :32
> > |    |
> > | 33 | #![cfg_attr(feature = "union", feature(untagged_unions))]
> > |    |                                ^^^^^^^^^^^^^^^^^^^^^^^^
> > |
> > | error[E0554]: `#![feature]` may not be used on the stable release
> channel
> > |   -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/lib.rs:35
> :37
> > |    |
> > | 35 | #![cfg_attr(feature = "may_dangle", feature(dropck_eyepatch))]
> > |    |                                     ^^^^^^^^^^^^^^^^^^^^^^^^
> > |
> > |     Building [                           ] 2/167: vec_map, syn(
> build.rs), s...
> > |      Running `rustc --crate-name unicode_segmentation
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ea80c7cedc2e61b8 -C
> extra-filename=-ea80c7cedc2e61b8 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar
> >   get/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling rustc-workspace-hack v1.0.0
> > |     Building [                           ] 3/167: vec_map, syn(
> build.rs), s...
> > |      Running `rustc --crate-name rustc_workspace_hack
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-workspace-hack-1.0.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=4f12a631a3f78c68 -C
> extra-filename=-4f12a631a3f78c68 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar
> >   get/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > | error[E0554]: `#![feature]` may not be used on the stable release
> channel
> > |    -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/lib.rs:277
> :1
> > |     |
> > | 277 | #![feature(rustc_private, nll)]
> > |     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > |
> > |    Compiling bytecount v0.5.1
> > |     Building [                           ] 4/167: vec_map, syn(
> build.rs), s...
> > |      Running `rustc --crate-name bytecount
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/bytecount-0.5.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=efcff43f975d063b -C
> extra-filename=-efcff43f975d063b --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap
> >   -lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling unicode_categories v0.1.1
> > |     Building [                           ] 5/167: vec_map, syn(
> build.rs), s...
> > |      Running `rustc --crate-name unicode_categories
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode_categories-0.1.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=1142561a6fb03929 -C
> extra-filename=-1142561a6fb03929 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/
> >   release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling crossbeam-utils v0.2.2
> > |     Building [                           ] 6/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name crossbeam_utils
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/crossbeam-utils-0.2.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="use_std"' -C
> metadata=5683e3e83934a5f7 -C extra-filename=-5683e3e83934a5f7 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
> >   2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --extern
> cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libcfg_if-81f5d828fe65528e.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling owning_ref v0.4.0
> > |     Building [>                          ] 7/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name owning_ref
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/owning_ref-0.4.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=432adf1bd23f2849 -C
> extra-filename=-432adf1bd23f2849 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --e
> >   xtern
> stable_deref_trait=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libstable_deref_trait-bf11e8975b7faa18.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |     Building [>                          ] 8/167: vec_map, syn(
> build.rs), c...
> > | error[E0433]: failed to resolve: could not find `property` in `unicode`
> > |    -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:672
> :24
> > |     |
> > | 672 |         core::unicode::property::Pattern_White_Space(c)
> > |     |                        ^^^^^^^^ could not find `property` in
> `unicode`
> > |
> > | error[E0554]: `#![feature]` may not be used on the stable release
> channel
> > |  -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:3
> :43
> > |   |
> > | 3 | #![cfg_attr(not(feature = "unicode-xid"),
> feature(unicode_internals))]
> > |   |
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^
> > |
> > |    Compiling humantime v1.2.0
> > |     Building [>                          ] 9/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name humantime
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/humantime-1.2.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=8de357e2c8248f8b -C
> extra-filename=-8de357e2c8248f8b --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --ext
> >   ern
> quick_error=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libquick_error-83b8dad83398e3a4.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling walkdir v2.2.9
> > |    Compiling textwrap v0.11.0
> > |      Running `rustc --crate-name walkdir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/walkdir-2.2.9/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=9fe5824e18efee6f -C
> extra-filename=-9fe5824e18efee6f --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --extern
> >
>  same_file=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libsame_file-b7f253f5d5610b25.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |     Building [>                         ] 11/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name textwrap
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/textwrap-0.11.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=95d05764bcecd09a -C
> extra-filename=-95d05764bcecd09a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --exte
> >   rn
> unicode_width=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > | error: aborting due to previous error
> > |
> > | For more information about this error, try `rustc --explain E0554`.
> > |    Compiling getopts v0.2.19
> > |     Building [>                         ] 12/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name getopts
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/getopts-0.2.19/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=0873084cbf9afd94 -C
> extra-filename=-0873084cbf9afd94 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --extern
> >
> unicode_width=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling itertools v0.8.0
> > |     Building [=>                        ] 13/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name itertools
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/itertools-0.8.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off --cfg 'feature="default"' --cfg 'feature="use_std"' -C
> metadata=ff7eca720ccd13a2 -C extra-filename=-ff7eca720ccd13a2 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --extern
> either=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps/libeither-
> >   a3de0059007db7dd.rmeta --cap-lints allow`
> > | error: could not compile `rustc-ap-graphviz`
> > |
> > | Caused by:
> > |   process didn't exit successfully: `rustc --crate-name graphviz
> --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=616067e14d16bb5d -C
> extra-filename=-616067e14d16bb5d --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf
> >   mt/1.4.2-r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> (exit status: 1)
> > | warning: build failed, waiting for other jobs to finish...
> > |     Building [=>                        ] 14/167: vec_map, syn(
> build.rs), c...
> > |     Building [=>                        ] 15/167: vec_map, syn(
> build.rs), c...
> > |     Building [=>                        ] 16/167: vec_map, syn(
> build.rs), c...
> > |     Building [=>                        ] 17/167: vec_map, syn(
> build.rs), c...
> > |     Building [=>                        ] 18/167: vec_map, syn(
> build.rs), c...
> > |     Building [=>                        ] 19/167: vec_map, syn(
> build.rs), c...
> > | error: aborting due to 2 previous errors
> > |
> > | For more information about this error, try `rustc --explain E0554`.
> > |     Building [==>                       ] 20/167: vec_map, syn(
> build.rs), c...
> > |     Building [==>                       ] 21/167: vec_map, syn(
> build.rs), c...
> > |     Building [==>                       ] 22/167: vec_map, syn(
> build.rs), c...
> > |     Building [==>                       ] 24/167: syn(build.rs),
> crossbeam-...
> > | error[E0599]: no method named `is_xid_start` found for type `char` in
> the current scope
> > |    -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:689
> :33
> > |     |
> > | 689 |             || (c > '\x7f' && c.is_xid_start())
> > |     |                                 ^^^^^^^^^^^^ method not found in
> `char`
> > |
> > | error[E0599]: no method named `is_xid_continue` found for type `char`
> in the current scope
> > |    -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:708
> :33
> > |     |
> > | 708 |             || (c > '\x7f' && c.is_xid_continue())
> > |     |                                 ^^^^^^^^^^^^^^^ method not found
> in `char`
> > |
> > |     Building [==>                       ] 25/167: syn(build.rs),
> crossbeam-...
> > | error: aborting due to 4 previous errors
> > |
> > | Some errors have detailed explanations: E0433, E0554, E0599.
> > | For more information about an error, try `rustc --explain E0433`.
> > |     Building [===>                      ] 26/167: syn(build.rs),
> crossbeam-...
> > |     Building [===>                      ] 27/167: syn(build.rs),
> crossbeam-...
> > |     Building [===>                      ] 28/167: syn(build.rs),
> crossbeam-...
> > |     Building [===>                      ] 29/167: syn(build.rs),
> crossbeam-...
> > |     Building [===>                      ] 30/167: crossbeam-utils,
> serde(bu...
> > |     Building [===>                      ] 31/167: crossbeam-utils,
> serde(bu...
> > |     Building [===>                      ] 32/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 33/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 34/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 35/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 36/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 37/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 38/167: utf8-ranges, cc,
> walkdir,...
> > |     Building [=====>                    ] 39/167: utf8-ranges, cc,
> walkdir,...
> > |     Building [=====>                    ] 40/167: cc, walkdir,
> getopts, hum...
> > |     Building [=====>                    ] 41/167: cc, walkdir,
> getopts, hum...
> > |     Building [=====>                    ] 42/167: cc, walkdir,
> getopts, hum...
> > |     Building [=====>                    ] 43/167: cc, walkdir,
> getopts, hum...
> > |     Building [=====>                    ] 44/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 45/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 46/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 47/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 48/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 49/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 50/167: cc, walkdir,
> getopts, sem...
> > |     Building [======>                   ] 51/167: cc, walkdir,
> getopts, str...
> > |     Building [=======>                  ] 52/167: cc, walkdir,
> getopts, dif...
> > |     Building [=======>                  ] 53/167: cc, walkdir,
> getopts, dif...
> > |     Building [=======>                  ] 54/167: cc, walkdir,
> getopts, dif...
> > |     Building [=======>                  ] 55/167: walkdir, getopts,
> diff, r...
> > |     Building [=======>                  ] 56/167: getopts, diff,
> rustc-dema...
> > |     Building [=======>                  ] 57/167: getopts,
> rustc-demangle, ...
> > |     Building [========>                 ] 58/167: getopts, itertools
> > |     Building [========>                 ] 59/167: getopts
> > | error: build failed
> > | WARNING: exit code 101 from a shell command.
> > | ERROR: Execution of
> '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/temp/run.do_compile.2104'
> failed with exit code 101:
> > |    Compiling proc-macro2 v0.4.30
> > |    Compiling unicode-xid v0.1.0
> > |    Compiling syn v0.15.42
> > |    Compiling libc v0.2.60
> > |    Compiling cfg-if v0.1.9
> > |    Compiling serde v1.0.97
> > |    Compiling spin v0.5.0
> > |    Compiling rand_core v0.4.0
> > |    Compiling autocfg v0.1.5
> > |    Compiling log v0.4.7
> > |    Compiling semver-parser v0.7.0
> > |    Compiling arrayvec v0.4.11
> > |    Compiling scopeguard v0.3.3
> > |    Compiling nodrop v0.1.13
> > |    Compiling memoffset v0.2.1
> > |    Compiling byteorder v1.3.2
> > |    Compiling stable_deref_trait v1.1.1
> > |    Compiling smallvec v0.6.10
> > |    Compiling rustc-rayon-core v0.2.0
> > |    Compiling memchr v2.2.1
> > |    Compiling rustc-rayon v0.2.0
> > |    Compiling either v1.5.2
> > |    Compiling unicode-width v0.1.5
> > |    Compiling indexmap v1.0.2
> > |    Compiling bitflags v1.1.0
> > |    Compiling rustc-ap-graphviz v542.0.0
> > |    Compiling cc v1.0.38
> > |    Compiling ansi_term v0.11.0
> > |    Compiling ucd-util v0.1.5
> > |    Compiling ryu v1.0.0
> > |    Compiling failure_derive v0.1.5
> > |    Compiling utf8-ranges v1.0.3
> > |    Compiling scoped-tls v1.0.0
> > |    Compiling unicode-segmentation v1.3.0
> > |    Compiling rustc-ap-rustc_target v542.0.0
> > |    Compiling termcolor v1.0.5
> > |    Compiling rustc-demangle v0.1.15
> > |    Compiling itoa v0.4.4
> > |    Compiling quick-error v1.2.2
> > |    Compiling fnv v1.0.6
> > |    Compiling same-file v1.0.5
> > |    Compiling rustc-ap-syntax v542.0.0
> > |    Compiling vec_map v0.8.1
> > |    Compiling strsim v0.8.0
> > |    Compiling rustfmt-nightly v1.4.2
> (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/git)
> > |    Compiling rustc-ap-rustc_lexer v542.0.0
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/proc-macro2-0.4.30/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="proc-macro"' -C
> metadata=df9c0358a8f4cef2 -C extra-filename=-df9c0358a8f4cef2 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/proc-macro2-df9c0358a8f4cef2
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name unicode_xid
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-xid-0.1.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off --cfg 'feature="default"' -C metadata=11f58d24801d743d
> -C extra-filename=-11f58d24801d743d --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name cfg_if
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/cfg-if-0.1.9/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=81f5d828fe65528e -C
> extra-filename=-81f5d828fe65528e --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints
> >    allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/syn-0.15.42/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="clone-impls"' --cfg 'feature="default"' --cfg 'feature="derive"'
> --cfg 'feature="extra-traits"' --cfg 'feature="full"' --cfg
> 'feature="parsing"' --cfg 'feature="printing"' --cfg 'feature="proc-macro"'
> --cfg 'feature="quote"' --cfg 'feature="visit"' -C
> metadata=61f79f9dccfd40ba -C extra-filename=-61f79f9dccfd40ba --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/syn-61f79f9dccfd40ba
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L dependency=/home/pokybuild/yocto-worker/auh/build/buil
> >
>  d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/libc-0.2.60/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="std"' -C metadata=94ebb09615a0f486 -C
> extra-filename=-94ebb09615a0f486 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/libc-94ebb09615a0f486
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/serde-1.0.97/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="derive"' --cfg 'feature="serde_derive"'
> --cfg 'feature="std"' -C metadata=397ac514ce86af00 -C
> extra-filename=-397ac514ce86af00 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/serde-397ac514ce86af00
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name spin
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/spin-0.5.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=7dd7ec836f8c506a -C
> extra-filename=-7dd7ec836f8c506a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints all
> >   ow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name rand_core
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rand_core-0.4.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="alloc"' --cfg 'feature="std"' -C
> metadata=966535236305dc5a -C extra-filename=-966535236305dc5a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru
> >   stfmt/1.4.2-r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name autocfg
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/autocfg-0.1.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=9c7ae0aed7fc9823 -C
> extra-filename=-9c7ae0aed7fc9823 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/log-0.4.7/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="std"' -C metadata=e098f27b12050390 -C
> extra-filename=-e098f27b12050390 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/log-e098f27b12050390
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name semver_parser
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=f3b50fe98e08dd8b -C
> extra-filename=-f3b50fe98e08dd8b --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/arrayvec-0.4.11/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=9e8f7b244197be3e -C extra-filename=-9e8f7b244197be3e --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/arrayvec-9e8f7b244197be3e
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name scopeguard
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/scopeguard-0.3.3/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=fab120a9dd5bad14 -C
> extra-filename=-fab120a9dd5bad14 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --c
> >   ap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name nodrop
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/nodrop-0.1.13/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=a17fe61129e65b62 -C
> extra-filename=-a17fe61129e65b62 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lint
> >   s allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name memoffset
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/memoffset-0.2.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=2f78f4fec416c99f -C
> extra-filename=-2f78f4fec416c99f --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap
> >   -lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/byteorder-1.3.2/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="std"' -C metadata=539ed0edcb1553e7 -C
> extra-filename=-539ed0edcb1553e7 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/byteorder-539ed0edcb1553e7
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name stable_deref_trait
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/stable_deref_trait-1.1.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C
> metadata=bf11e8975b7faa18 -C extra-filename=-bf11e8975b7faa18 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
> >   re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name smallvec
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="may_dangle"'
> --cfg 'feature="std"' --cfg 'feature="union"' -C metadata=c3ebde62e7bb47d1
> -C extra-filename=-c3ebde62e7bb47d1 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L dependency=/home/pokybuild/yocto-worker/auh
> >
>  /build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-core-0.2.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=ea88230473b39d14 -C extra-filename=-ea88230473b39d14 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-rayon-core-ea88230473b39d14
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/memchr-2.2.1/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' --cfg 'feature="use_std"' -C metadata=ce8d38ceb83b8294
> -C extra-filename=-ce8d38ceb83b8294 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/memchr-ce8d38ceb83b8294
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-0.2.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=5cea4c63c5dbd532 -C extra-filename=-5cea4c63c5dbd532 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-rayon-5cea4c63c5dbd532
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name either
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ea126583284a07f6 -C
> extra-filename=-ea126583284a07f6 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints
> >    allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name unicode_width
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-width-0.1.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' -C metadata=f9067b939a2e9ee3 -C
> extra-filename=-f9067b939a2e9ee3 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-
> >   r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name indexmap
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/indexmap-1.0.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=f0d6daf2923716e0 -C
> extra-filename=-f0d6daf2923716e0 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-l
> >   ints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/bitflags-1.1.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="default"' -C metadata=8ecc663c609fc416 -C
> extra-filename=-8ecc663c609fc416 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/bitflags-8ecc663c609fc416
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name graphviz --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=616067e14d16bb5d -C
> extra-filename=-616067e14d16bb5d --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe
> >   t/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name cc
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/cc-1.0.38/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=99eeff8d683be0c9 -C
> extra-filename=-99eeff8d683be0c9 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name either
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=a3de0059007db7dd -C
> extra-filename=-a3de0059007db7dd --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name ansi_term
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/ansi_term-0.11.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=97891616a3048472 -C
> extra-filename=-97891616a3048472 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --ca
> >   p-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name ucd_util
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/ucd-util-0.1.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=c66dafd726901704 -C
> extra-filename=-c66dafd726901704 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-l
> >   ints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/ryu-1.0.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=cf40bafebc5d9e2a -C extra-filename=-cf40bafebc5d9e2a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/ryu-cf40bafebc5d9e2a
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/failure_derive-0.1.5/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=500d9a3c0d7056cc -C extra-filename=-500d9a3c0d7056cc --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/failure_derive-500d9a3c0d7056cc
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name utf8_ranges
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/utf8-ranges-1.0.3/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ca04778dfdc33722 -C
> extra-filename=-ca04778dfdc33722 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -
> >   -cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name scoped_tls
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/scoped-tls-1.0.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=4300e3ebfe432670 -C
> extra-filename=-4300e3ebfe432670 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --c
> >   ap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name unicode_segmentation
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off -C metadata=609f5d0c875e0967 -C
> extra-filename=-609f5d0c875e0967 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name build_script_build --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_target-542.0.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=b1efc0d6a47b6a5c -C extra-filename=-b1efc0d6a47b6a5c --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-rustc_target-b1efc0d6a47b6a5c
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name termcolor
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/termcolor-1.0.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=af0d11e6713415b8 -C
> extra-filename=-af0d11e6713415b8 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap
> >   -lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name rustc_demangle
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-demangle-0.1.15/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=f5028ac44d69eb7a -C
> extra-filename=-f5028ac44d69eb7a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release
> >   /deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name itoa
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/itoa-0.4.4/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="std"' -C
> metadata=efd7d4d7b4402894 -C extra-filename=-efd7d4d7b4402894 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.
> >   4.2-r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name quick_error
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/quick-error-1.2.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=83b8dad83398e3a4 -C
> extra-filename=-83b8dad83398e3a4 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -
> >   -cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name fnv
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/fnv-1.0.6/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ceb682049fbd227a -C
> extra-filename=-ceb682049fbd227a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow -L
> >
>  /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name same_file
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/same-file-1.0.5/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=b7f253f5d5610b25 -C
> extra-filename=-b7f253f5d5610b25 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap
> >   -lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-syntax-542.0.0/
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off -C
> metadata=5aebbe0c13823bdd -C extra-filename=-5aebbe0c13823bdd --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-syntax-5aebbe0c13823bdd
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints allow`
> > |      Running `rustc --crate-name vec_map
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/vec_map-0.8.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=5831430b43ab8372 -C
> extra-filename=-5831430b43ab8372 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lin
> >   ts allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name semver_parser
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ba877faa789ab53c -C
> extra-filename=-ba877faa789ab53c --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/de
> >   ps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name strsim
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/strsim-0.8.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=8aa9952c97613c38 -C
> extra-filename=-8aa9952c97613c38 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints
> >    allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |      Running `rustc --crate-name build_script_build --edition=2018
> build.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> bin --emit=dep-info,link -C embed-bitcode=no -C debug-assertions=off --cfg
> 'feature="cargo-fmt"' --cfg 'feature="default"' --cfg
> 'feature="rustfmt-format-diff"' -C metadata=533f8374b6d41dfb -C
> extra-filename=-533f8374b6d41dfb --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustfmt-nightly-533f8374b6d41dfb
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps`
> > |      Running `rustc --crate-name rustc_lexer --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=f811c840c35ab6d3 -C
> extra-filename=-f811c840c35ab6d3 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/b
> >   uild/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |     Building [                           ] 0/167: vec_map, syn(
> build.rs), m...
> > |    Compiling diff v0.1.11
> > |     Building [                           ] 1/167: vec_map, syn(
> build.rs), m...
> > |      Running `rustc --crate-name diff
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/diff-0.1.11/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=34e9b70cb21518fd -C
> extra-filename=-34e9b70cb21518fd --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap-lints al
> >   low -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > | error[E0554]: `#![feature]` may not be used on the stable release
> channel
> > |   -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/lib.rs:33
> :32
> > |    |
> > | 33 | #![cfg_attr(feature = "union", feature(untagged_unions))]
> > |    |                                ^^^^^^^^^^^^^^^^^^^^^^^^
> > |
> > | error[E0554]: `#![feature]` may not be used on the stable release
> channel
> > |   -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/lib.rs:35
> :37
> > |    |
> > | 35 | #![cfg_attr(feature = "may_dangle", feature(dropck_eyepatch))]
> > |    |                                     ^^^^^^^^^^^^^^^^^^^^^^^^
> > |
> > |     Building [                           ] 2/167: vec_map, syn(
> build.rs), s...
> > |      Running `rustc --crate-name unicode_segmentation
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=ea80c7cedc2e61b8 -C
> extra-filename=-ea80c7cedc2e61b8 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar
> >   get/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling rustc-workspace-hack v1.0.0
> > |     Building [                           ] 3/167: vec_map, syn(
> build.rs), s...
> > |      Running `rustc --crate-name rustc_workspace_hack
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-workspace-hack-1.0.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=4f12a631a3f78c68 -C
> extra-filename=-4f12a631a3f78c68 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar
> >   get/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > | error[E0554]: `#![feature]` may not be used on the stable release
> channel
> > |    -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/lib.rs:277
> :1
> > |     |
> > | 277 | #![feature(rustc_private, nll)]
> > |     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > |
> > |    Compiling bytecount v0.5.1
> > |     Building [                           ] 4/167: vec_map, syn(
> build.rs), s...
> > |      Running `rustc --crate-name bytecount
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/bytecount-0.5.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=efcff43f975d063b -C
> extra-filename=-efcff43f975d063b --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --cap
> >   -lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling unicode_categories v0.1.1
> > |     Building [                           ] 5/167: vec_map, syn(
> build.rs), s...
> > |      Running `rustc --crate-name unicode_categories
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode_categories-0.1.1/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=1142561a6fb03929 -C
> extra-filename=-1142561a6fb03929 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/
> >   release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling crossbeam-utils v0.2.2
> > |     Building [                           ] 6/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name crossbeam_utils
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/crossbeam-utils-0.2.2/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no --cfg 'feature="default"' --cfg 'feature="use_std"' -C
> metadata=5683e3e83934a5f7 -C extra-filename=-5683e3e83934a5f7 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
> >   2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --extern
> cfg_if=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libcfg_if-81f5d828fe65528e.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling owning_ref v0.4.0
> > |     Building [>                          ] 7/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name owning_ref
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/owning_ref-0.4.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=432adf1bd23f2849 -C
> extra-filename=-432adf1bd23f2849 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --e
> >   xtern
> stable_deref_trait=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libstable_deref_trait-bf11e8975b7faa18.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |     Building [>                          ] 8/167: vec_map, syn(
> build.rs), c...
> > | error[E0433]: failed to resolve: could not find `property` in `unicode`
> > |    -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:672
> :24
> > |     |
> > | 672 |         core::unicode::property::Pattern_White_Space(c)
> > |     |                        ^^^^^^^^ could not find `property` in
> `unicode`
> > |
> > | error[E0554]: `#![feature]` may not be used on the stable release
> channel
> > |  -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:3
> :43
> > |   |
> > | 3 | #![cfg_attr(not(feature = "unicode-xid"),
> feature(unicode_internals))]
> > |   |
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^
> > |
> > |    Compiling humantime v1.2.0
> > |     Building [>                          ] 9/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name humantime
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/humantime-1.2.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=8de357e2c8248f8b -C
> extra-filename=-8de357e2c8248f8b --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --ext
> >   ern
> quick_error=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libquick_error-83b8dad83398e3a4.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling walkdir v2.2.9
> > |    Compiling textwrap v0.11.0
> > |      Running `rustc --crate-name walkdir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/walkdir-2.2.9/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=9fe5824e18efee6f -C
> extra-filename=-9fe5824e18efee6f --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --extern
> >
>  same_file=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libsame_file-b7f253f5d5610b25.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |     Building [>                         ] 11/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name textwrap
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/textwrap-0.11.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=95d05764bcecd09a -C
> extra-filename=-95d05764bcecd09a --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --exte
> >   rn
> unicode_width=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > | error: aborting due to previous error
> > |
> > | For more information about this error, try `rustc --explain E0554`.
> > |    Compiling getopts v0.2.19
> > |     Building [>                         ] 12/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name getopts
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/getopts-0.2.19/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=0873084cbf9afd94 -C
> extra-filename=-0873084cbf9afd94 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --extern
> >
> unicode_width=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta
> --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> > |    Compiling itertools v0.8.0
> > |     Building [=>                        ] 13/167: vec_map, syn(
> build.rs), c...
> > |      Running `rustc --crate-name itertools
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/itertools-0.8.0/src/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type
> lib --emit=dep-info,metadata,link -C embed-bitcode=no -C
> debug-assertions=off --cfg 'feature="default"' --cfg 'feature="use_std"' -C
> metadata=ff7eca720ccd13a2 -C extra-filename=-ff7eca720ccd13a2 --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps
> --extern
> either=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps/libeither-
> >   a3de0059007db7dd.rmeta --cap-lints allow`
> > | error: could not compile `rustc-ap-graphviz`
> > |
> > | Caused by:
> > |   process didn't exit successfully: `rustc --crate-name graphviz
> --edition=2018
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/
> lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts
> --crate-type lib --emit=dep-info,metadata,link -C opt-level=3 -C
> embed-bitcode=no -C metadata=616067e14d16bb5d -C
> extra-filename=-616067e14d16bb5d --out-dir
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> --target i686-poky-linux -C
> linker=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps
> -L
> dependency=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf
> >   mt/1.4.2-r0/build/target/release/deps --cap-lints allow -L
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust
> --remap-path-prefix=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=/usr/src/debug/rustfmt/1.4.2-r0`
> (exit status: 1)
> > | warning: build failed, waiting for other jobs to finish...
> > |     Building [=>                        ] 14/167: vec_map, syn(
> build.rs), c...
> > |     Building [=>                        ] 15/167: vec_map, syn(
> build.rs), c...
> > |     Building [=>                        ] 16/167: vec_map, syn(
> build.rs), c...
> > |     Building [=>                        ] 17/167: vec_map, syn(
> build.rs), c...
> > |     Building [=>                        ] 18/167: vec_map, syn(
> build.rs), c...
> > |     Building [=>                        ] 19/167: vec_map, syn(
> build.rs), c...
> > | error: aborting due to 2 previous errors
> > |
> > | For more information about this error, try `rustc --explain E0554`.
> > |     Building [==>                       ] 20/167: vec_map, syn(
> build.rs), c...
> > |     Building [==>                       ] 21/167: vec_map, syn(
> build.rs), c...
> > |     Building [==>                       ] 22/167: vec_map, syn(
> build.rs), c...
> > |     Building [==>                       ] 24/167: syn(build.rs),
> crossbeam-...
> > | error[E0599]: no method named `is_xid_start` found for type `char` in
> the current scope
> > |    -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:689
> :33
> > |     |
> > | 689 |             || (c > '\x7f' && c.is_xid_start())
> > |     |                                 ^^^^^^^^^^^^ method not found in
> `char`
> > |
> > | error[E0599]: no method named `is_xid_continue` found for type `char`
> in the current scope
> > |    -->
> /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.0.0/src/lib.rs:708
> :33
> > |     |
> > | 708 |             || (c > '\x7f' && c.is_xid_continue())
> > |     |                                 ^^^^^^^^^^^^^^^ method not found
> in `char`
> > |
> > |     Building [==>                       ] 25/167: syn(build.rs),
> crossbeam-...
> > | error: aborting due to 4 previous errors
> > |
> > | Some errors have detailed explanations: E0433, E0554, E0599.
> > | For more information about an error, try `rustc --explain E0433`.
> > |     Building [===>                      ] 26/167: syn(build.rs),
> crossbeam-...
> > |     Building [===>                      ] 27/167: syn(build.rs),
> crossbeam-...
> > |     Building [===>                      ] 28/167: syn(build.rs),
> crossbeam-...
> > |     Building [===>                      ] 29/167: syn(build.rs),
> crossbeam-...
> > |     Building [===>                      ] 30/167: crossbeam-utils,
> serde(bu...
> > |     Building [===>                      ] 31/167: crossbeam-utils,
> serde(bu...
> > |     Building [===>                      ] 32/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 33/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 34/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 35/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 36/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 37/167: crossbeam-utils,
> utf8-ran...
> > |     Building [====>                     ] 38/167: utf8-ranges, cc,
> walkdir,...
> > |     Building [=====>                    ] 39/167: utf8-ranges, cc,
> walkdir,...
> > |     Building [=====>                    ] 40/167: cc, walkdir,
> getopts, hum...
> > |     Building [=====>                    ] 41/167: cc, walkdir,
> getopts, hum...
> > |     Building [=====>                    ] 42/167: cc, walkdir,
> getopts, hum...
> > |     Building [=====>                    ] 43/167: cc, walkdir,
> getopts, hum...
> > |     Building [=====>                    ] 44/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 45/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 46/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 47/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 48/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 49/167: cc, walkdir,
> getopts, hum...
> > |     Building [======>                   ] 50/167: cc, walkdir,
> getopts, sem...
> > |     Building [======>                   ] 51/167: cc, walkdir,
> getopts, str...
> > |     Building [=======>                  ] 52/167: cc, walkdir,
> getopts, dif...
> > |     Building [=======>                  ] 53/167: cc, walkdir,
> getopts, dif...
> > |     Building [=======>                  ] 54/167: cc, walkdir,
> getopts, dif...
> > |     Building [=======>                  ] 55/167: walkdir, getopts,
> diff, r...
> > |     Building [=======>                  ] 56/167: getopts, diff,
> rustc-dema...
> > |     Building [=======>                  ] 57/167: getopts,
> rustc-demangle, ...
> > |     Building [========>                 ] 58/167: getopts, itertools
> > |     Building [========>                 ] 59/167: getopts
> > | error: build failed
> > | WARNING: exit code 101 from a shell command.
> > |
> > NOTE: recipe rustfmt-1.4.2-r0: task do_compile: Failed
> > ERROR: Task
> (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:do_compile)
> failed with exit code '1'
> > NOTE: recipe libstd-rs-1.54.0-r0: task do_package_write_rpm: Succeeded
> > NOTE: Tasks Summary: Attempted 729 tasks of which 644 didn't need to be
> rerun and 1 failed.
> > NOTE: Writing buildhistory
> > NOTE: Writing buildhistory took: 8 seconds
> >
> > Summary: 1 task failed:
> >
> /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:
> do_compile
> > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> >
> >
> >
> > Please review the attached files for further information and
> build/update failures.
> > Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
> >
> > Regards,
> > The Upgrade Helper
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
> 
>
>

--000000000000f022c905cab43836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>No, the failure is not because of that. For rustfmt t=
he version check already works correctly, and 1.4.2 -&gt; 1.4.36 attempt do=
esn&#39;t work because devtool can&#39;t compile existing 1.4.2 rustfmt for=
 the target:</div><div><br></div><div><font size=3D"-1">
ERROR: rustfmt-1.4.2-r0 do_compile: Execution of &#39;/home/pokybuild/yocto=
-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
/temp/run.do_compile.2104&#39; failed with exit code 101:</font></div><div>=
<font size=3D"-1"><br></font></div><div><font size=3D"-1">Note that the tar=
get is qemux86, e.g. 32 bit.<br></font></div><div><font size=3D"-1"><br></f=
ont></div><div><font size=3D"-1">Alex<br></font></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 29 Aug 2021 =
at 16:52, Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">=
randy.macleod@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On 2021-08-29 8:14 a.m., <a href=3D"mailto:auh@a=
uh.yoctoproject.org" target=3D"_blank">auh@auh.yoctoproject.org</a> wrote:<=
br>
&gt; Hello,<br>
&gt; <br>
&gt; this email is a notification from the Auto Upgrade Helper<br>
&gt; that the automatic attempt to upgrade the recipe *rustfmt* to *1.4.36*=
 has Failed(other errors).<br>
<br>
It looks like Alex has a fix for this in his stack:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=
=3Dakanavin/package-version-updates&amp;id=3D30e283fbd73388c75fbd6fa5c42f15=
4c52483df1" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.or=
g/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-updates&a=
mp;id=3D30e283fbd73388c75fbd6fa5c42f154c52483df1</a><br>
<br>
<br>
../Randy<br>
<br>
&gt; <br>
&gt; Detailed error information:<br>
&gt; <br>
&gt; &#39;MACHINE=3Dqemux86 bitbake rustfmt&#39; failed<br>
&gt; Loading cache...done.<br>
&gt; Loaded 1472 entries from dependency cache.<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt; <br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.51.1&qu=
ot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-li=
nux&quot;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;i686-poky=
-linux&quot;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemu=
x86&quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;poky&quot;<br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;3.3+snapshot-8379cd=
839ccd1124972d3b58b1ae80306821b1af&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m32 core2&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br=
>
&gt; meta<br>
&gt; meta-poky<br>
&gt; meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;tmp-auh-upgrades:83=
79cd839ccd1124972d3b58b1ae80306821b1af&quot;<br>
&gt; workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:a5=
b257006b2c480d86e09909cdafb3c8ba05b863&quot;<br>
&gt; <br>
&gt; Initialising tasks...done.<br>
&gt; Sstate summary: Wanted 32 Local 8 Network 0 Missed 24 Current 146 (25%=
 match, 86% complete)<br>
&gt; NOTE: Executing Tasks<br>
&gt; NOTE: Setscene tasks completed<br>
&gt; NOTE: Running task 566 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:do=
_fetch)<br>
&gt; NOTE: Running task 567 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_fetc=
h)<br>
&gt; NOTE: Running task 608 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_fetch)<br>
&gt; NOTE: Running task 609 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_fe=
tch)<br>
&gt; NOTE: Running task 616 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_=
fetch)<br>
&gt; NOTE: Running task 617 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certifica=
tes_20210119.bb:do_fetch)<br>
&gt; NOTE: Running task 631 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_fetch)<br>
&gt; NOTE: Running task 644 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:do_fetch)<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_fetch: Started<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_fetch: Started<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_fetch: Started<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_fetch: Started<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_fetch: Starte=
d<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_fetch: Started<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_fetch: Started<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_fetch: Started<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_fetch: Succee=
ded<br>
&gt; NOTE: Running task 653 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certifica=
tes_20210119.bb:do_unpack)<br>
&gt; NOTE: Running task 654 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certifica=
tes_20210119.bb:do_prepare_recipe_sysroot)<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_unpack: Start=
ed<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_prepare_recip=
e_sysroot: Started<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_prepare_recip=
e_sysroot: Succeeded<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_unpack: Succe=
eded<br>
&gt; NOTE: Running task 655 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certifica=
tes_20210119.bb:do_patch)<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_patch: Starte=
d<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_patch: Succee=
ded<br>
&gt; NOTE: Running task 656 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certifica=
tes_20210119.bb:do_deploy_source_date_epoch)<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_deploy_source=
_date_epoch: Started<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_deploy_source=
_date_epoch: Succeeded<br>
&gt; NOTE: Running task 657 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certifica=
tes_20210119.bb:do_configure)<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_configure: St=
arted<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_configure: Su=
cceeded<br>
&gt; NOTE: Running task 658 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certifica=
tes_20210119.bb:do_compile)<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_compile: Star=
ted<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_compile: Succ=
eeded<br>
&gt; NOTE: Running task 659 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certifica=
tes_20210119.bb:do_install)<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_fetch: Succeeded<br>
&gt; NOTE: Running task 660 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_=
unpack)<br>
&gt; NOTE: Running task 661 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_=
prepare_recipe_sysroot)<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_install: Star=
ted<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_unpack: Started<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_prepare_recipe_sysroot: =
Started<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_prepare_recipe_sysroot: =
Succeeded<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_unpack: Succeeded<br>
&gt; NOTE: Running task 662 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_=
patch)<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_patch: Started<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_patch: Succeeded<br>
&gt; NOTE: Running task 663 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_=
deploy_source_date_epoch)<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_deploy_source_date_epoch=
: Started<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_deploy_source_date_epoch=
: Succeeded<br>
&gt; NOTE: Running task 664 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_=
configure)<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_configure: Started<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_fetch: Succeeded<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_fetch: Succeeded<br>
&gt; NOTE: Running task 665 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:do=
_unpack)<br>
&gt; NOTE: Running task 666 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_unpack)<br>
&gt; NOTE: Running task 667 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:do=
_prepare_recipe_sysroot)<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_fetch: Succeeded<br>
&gt; NOTE: Running task 668 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_unpack)<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_unpack: Started<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_unpack: Started<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_unpack: Started<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_prepare_recipe_sysroo=
t: Started<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_install: Succ=
eeded<br>
&gt; NOTE: Running task 669 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certifica=
tes_20210119.bb:do_populate_sysroot)<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_populate_sysr=
oot: Started<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_prepare_recipe_sysroo=
t: Succeeded<br>
&gt; NOTE: recipe ca-certificates-native-20210119-r0: task do_populate_sysr=
oot: Succeeded<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_fetch: Succeeded<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_fetch: Succeeded<br>
&gt; NOTE: Running task 670 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_un=
pack)<br>
&gt; NOTE: Running task 671 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_unpa=
ck)<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_unpack: Started<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_unpack: Started<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_unpack: Succeeded<br>
&gt; NOTE: Running task 672 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_patch)<br>
&gt; NOTE: Running task 673 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_rust_setup_sn=
apshot)<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_patch: Started<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_setup_snapshot: S=
tarted<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_setup_snapshot: S=
ucceeded<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_patch: Succeeded<br>
&gt; NOTE: Running task 674 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_rust_create_w=
rappers)<br>
&gt; NOTE: Running task 675 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_deploy_source=
_date_epoch)<br>
&gt; NOTE: Running task 676 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_rust_gen_targ=
ets)<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_deploy_source_date_epo=
ch: Started<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_gen_targets: Star=
ted<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_create_wrappers: =
Started<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_gen_targets: Succ=
eeded<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_rust_create_wrappers: =
Succeeded<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_configure: Succeeded<br>
&gt; NOTE: Running task 677 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_=
compile)<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_deploy_source_date_epo=
ch: Succeeded<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_compile: Started<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_compile: Succeeded<br>
&gt; NOTE: Running task 678 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_=
install)<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_install: Started<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_install: Succeeded<br>
&gt; NOTE: Running task 679 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.9.0.bb:do_=
populate_sysroot)<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_populate_sysroot: Starte=
d<br>
&gt; NOTE: recipe libssh2-native-1.9.0-r0: task do_populate_sysroot: Succee=
ded<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_unpack: Succeeded<br>
&gt; NOTE: Running task 680 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:do=
_patch)<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_patch: Started<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_patch: Succeeded<br>
&gt; NOTE: Running task 681 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:do=
_generate_toolchain_file)<br>
&gt; NOTE: Running task 682 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:do=
_deploy_source_date_epoch)<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_generate_toolchain_fi=
le: Started<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_deploy_source_date_ep=
och: Started<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_generate_toolchain_fi=
le: Succeeded<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_deploy_source_date_ep=
och: Succeeded<br>
&gt; NOTE: Running task 683 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:do=
_configure)<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_configure: Started<br=
>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_configure: Succeeded<=
br>
&gt; NOTE: Running task 684 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:do=
_compile)<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_compile: Started<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_unpack: Succeeded<br>
&gt; NOTE: Running task 685 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_patc=
h)<br>
&gt; NOTE: Running task 686 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_rust=
_setup_snapshot)<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_patch: Started<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_rust_setup_snapshot: Start=
ed<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_patch: Succeeded<br>
&gt; NOTE: Running task 687 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_rust=
_create_wrappers)<br>
&gt; NOTE: Running task 688 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_depl=
oy_source_date_epoch)<br>
&gt; NOTE: Running task 689 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_rust=
_gen_targets)<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_rust_create_wrappers: Star=
ted<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_deploy_source_date_epoch: =
Started<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_rust_gen_targets: Started<=
br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_rust_gen_targets: Succeede=
d<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_rust_create_wrappers: Succ=
eeded<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_deploy_source_date_epoch: =
Succeeded<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_rust_setup_snapshot: Succe=
eded<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_fetch: Succeeded<br>
&gt; NOTE: Running task 690 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:do_unpack)<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_unpack: Started<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_unpack: Succeeded<br>
&gt; NOTE: Running task 691 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:do_patch)<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_patch: Started<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_patch: Succeeded<br>
&gt; NOTE: Running task 692 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:do_rust_create_wra=
ppers)<br>
&gt; NOTE: Running task 693 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:do_deploy_source_d=
ate_epoch)<br>
&gt; NOTE: Running task 694 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:do_populate_lic)<b=
r>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_rust_create_wrappers: Started<b=
r>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_populate_lic: Started<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_deploy_source_date_epoch: Start=
ed<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_rust_create_wrappers: Succeeded=
<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_deploy_source_date_epoch: Succe=
eded<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_populate_lic: Succeeded<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_unpack: Succeeded<br>
&gt; NOTE: Running task 695 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_patch)<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_patch: Started<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_patch: Succeeded<br>
&gt; NOTE: Running task 696 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_rust_create_wr=
appers)<br>
&gt; NOTE: Running task 697 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_deploy_source_=
date_epoch)<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_deploy_source_date_epoch: St=
arted<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_rust_create_wrappers: Starte=
d<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_rust_create_wrappers: Succee=
ded<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_deploy_source_date_epoch: Su=
cceeded<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_unpack: Succeeded<br>
&gt; NOTE: Running task 698 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_pa=
tch)<br>
&gt; NOTE: Running task 699 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_ca=
rgo_setup_snapshot)<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_patch: Started<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_cargo_setup_snapshot: Sta=
rted<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_patch: Succeeded<br>
&gt; NOTE: Running task 700 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_ru=
st_create_wrappers)<br>
&gt; NOTE: Running task 701 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_de=
ploy_source_date_epoch)<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_deploy_source_date_epoch:=
 Started<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_rust_create_wrappers: Sta=
rted<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_rust_create_wrappers: Suc=
ceeded<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_deploy_source_date_epoch:=
 Succeeded<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_cargo_setup_snapshot: Suc=
ceeded<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_compile: Succeeded<br=
>
&gt; NOTE: Running task 702 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:do=
_install)<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_install: Started<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_install: Succeeded<br=
>
&gt; NOTE: Running task 703 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb:do=
_populate_sysroot)<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_populate_sysroot: Sta=
rted<br>
&gt; NOTE: recipe rust-llvm-native-1.54.0-r0: task do_populate_sysroot: Suc=
ceeded<br>
&gt; NOTE: Running task 704 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_prep=
are_recipe_sysroot)<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_prepare_recipe_sysroot: St=
arted<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_prepare_recipe_sysroot: Su=
cceeded<br>
&gt; NOTE: Running task 705 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_conf=
igure)<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_configure: Started<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_configure: Succeeded<br>
&gt; NOTE: Running task 706 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_comp=
ile)<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_compile: Started<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_compile: Succeeded<br>
&gt; NOTE: Running task 707 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_inst=
all)<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_install: Started<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_install: Succeeded<br>
&gt; NOTE: Running task 708 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.54.0.bb:do_popu=
late_sysroot)<br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_populate_sysroot: Started<=
br>
&gt; NOTE: recipe rust-native-1.54.0-r0: task do_populate_sysroot: Succeede=
d<br>
&gt; NOTE: Running task 709 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_pr=
epare_recipe_sysroot)<br>
&gt; NOTE: Running task 710 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_prepare_recip=
e_sysroot)<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_prepare_recipe_sysroot=
: Started<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_prepare_recipe_sysroot: S=
tarted<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_prepare_recipe_sysroot: S=
ucceeded<br>
&gt; NOTE: Running task 711 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_co=
nfigure)<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_configure: Started<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_configure: Succeeded<br>
&gt; NOTE: Running task 712 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_co=
mpile)<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_compile: Started<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_prepare_recipe_sysroot=
: Succeeded<br>
&gt; NOTE: Running task 713 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_configure)<br=
>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_configure: Started<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_configure: Succeeded<b=
r>
&gt; NOTE: Running task 714 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_compile)<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_compile: Started<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_compile: Succeeded<br>
&gt; NOTE: Running task 715 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_install)<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_install: Started<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_install: Succeeded<br>
&gt; NOTE: Running task 716 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/rust-cross_1.54.0.bb:do_populate_sysr=
oot)<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_populate_sysroot: Star=
ted<br>
&gt; NOTE: recipe rust-cross-i686-1.54.0-r0: task do_populate_sysroot: Succ=
eeded<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_compile: Succeeded<br>
&gt; NOTE: Running task 717 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_in=
stall)<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_install: Started<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_install: Succeeded<br>
&gt; NOTE: Running task 718 of 736 (virtual:native:/home/pokybuild/yocto-wo=
rker/auh/build/build/poky/meta/recipes-devtools/cargo/cargo_1.54.0.bb:do_po=
pulate_sysroot)<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_populate_sysroot: Started=
<br>
&gt; NOTE: recipe cargo-native-1.54.0-r0: task do_populate_sysroot: Succeed=
ed<br>
&gt; NOTE: Running task 719 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_prepare_recipe=
_sysroot)<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_prepare_recipe_sysroot: Star=
ted<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_prepare_recipe_sysroot: Succ=
eeded<br>
&gt; NOTE: Running task 720 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_configure)<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_configure: Started<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_configure: Succeeded<br>
&gt; NOTE: Running task 721 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_compile)<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_compile: Started<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_compile: Succeeded<br>
&gt; NOTE: Running task 722 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_install)<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_install: Started<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_install: Succeeded<br>
&gt; NOTE: Running task 723 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_package)<br>
&gt; NOTE: Running task 724 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_populate_sysro=
ot)<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_populate_sysroot: Started<br=
>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_package: Started<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_populate_sysroot: Succeeded<=
br>
&gt; NOTE: Running task 725 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:do_prepare_recipe_=
sysroot)<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_prepare_recipe_sysroot: Started=
<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_prepare_recipe_sysroot: Succeed=
ed<br>
&gt; NOTE: Running task 726 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:do_configure)<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_configure: Started<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_configure: Succeeded<br>
&gt; NOTE: Running task 727 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb:do_compile)<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_compile: Started<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_package: Succeeded<br>
&gt; NOTE: Running task 728 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_packagedata)<b=
r>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_packagedata: Started<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_packagedata: Succeeded<br>
&gt; NOTE: Running task 729 of 736 (/home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb:do_package_write_=
rpm)<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_package_write_rpm: Started<b=
r>
&gt; ERROR: rustfmt-1.4.2-r0 do_compile: Execution of &#39;/home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/temp/run.do_compile.2104&#39; failed with exit code 101:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling proc-macro2 v0.4.30<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling unicode-xid v0.1.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling syn v0.15.42<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling libc v0.2.60<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling cfg-if v0.1.9<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling serde v1.0.97<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling spin v0.5.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling rand_core v0.4.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling autocfg v0.1.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling log v0.4.7<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling semver-parser v0.7.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling arrayvec v0.4.11<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling scopeguard v0.3.3<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling nodrop v0.1.13<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling memoffset v0.2.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling byteorder v1.3.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling stable_deref_trait v1.1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling smallvec v0.6.10<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling rustc-rayon-core v0.2.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling memchr v2.2.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling rustc-rayon v0.2.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling either v1.5.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling unicode-width v0.1.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling indexmap v1.0.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling bitflags v1.1.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling rustc-ap-graphviz v542.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling cc v1.0.38<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling ansi_term v0.11.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling ucd-util v0.1.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling ryu v1.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling failure_derive v0.1.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling utf8-ranges v1.0.3<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling scoped-tls v1.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling unicode-segmentation v1.3.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling rustc-ap-rustc_target v542.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling termcolor v1.0.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling rustc-demangle v0.1.15<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling itoa v0.4.4<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling quick-error v1.2.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling fnv v1.0.6<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling same-file v1.0.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling rustc-ap-syntax v542.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling vec_map v0.8.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling strsim v0.8.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling rustfmt-nightly v1.4.2 (/home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/git)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling rustc-ap-rustc_lexer v542.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/proc-macro2-0.4.30/<a href=3D"h=
ttp://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-f=
ormat=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Dde=
p-info,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feat=
ure=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;proc-macro&quot;&=
#39; -C metadata=3Ddf9c0358a8f4cef2 -C extra-filename=3D-df9c0358a8f4cef2 -=
-out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/proc-macro2-df9c0=
358a8f4cef2 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L de=
pendency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allo=
w`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name unicode_xid /hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-xid-0.1.0/src/<a href=3D"http:=
//lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3D=
dep-info,metadata,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cf=
g &#39;feature=3D&quot;default&quot;&#39; -C metadata=3D11f58d24801d743d -C=
 extra-filename=3D-11f58d24801d743d --out-dir /home/pokybuild/yocto-worker/=
auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/t=
arget/release/deps -C linker=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccl=
d -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo=
rk/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lin=
ts allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name cfg_if /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/cfg-if-0.1.9/src/<a href=3D"http://lib.rs" =
rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --jso=
n=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,m=
etadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D81f5d828f=
e65528e -C extra-filename=3D-81f5d828fe65528e --out-dir /home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C li=
nker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints a<br>
&gt;=C2=A0 =C2=A0llow -L /home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust =
--remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tm=
p/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-=
r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/syn-0.15.42/<a href=3D"http://b=
uild.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-inf=
o,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;clone-impls&quot;&#39; --cfg &#39;feature=3D&quot;default&quot;&#3=
9; --cfg &#39;feature=3D&quot;derive&quot;&#39; --cfg &#39;feature=3D&quot;=
extra-traits&quot;&#39; --cfg &#39;feature=3D&quot;full&quot;&#39; --cfg &#=
39;feature=3D&quot;parsing&quot;&#39; --cfg &#39;feature=3D&quot;printing&q=
uot;&#39; --cfg &#39;feature=3D&quot;proc-macro&quot;&#39; --cfg &#39;featu=
re=3D&quot;quote&quot;&#39; --cfg &#39;feature=3D&quot;visit&quot;&#39; -C =
metadata=3D61f79f9dccfd40ba -C extra-filename=3D-61f79f9dccfd40ba --out-dir=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/build/target/release/build/syn-61f79f9dccfd40ba -C l=
inker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home=
/pokybuild/yocto-worker/auh/build/build/<br>
&gt;=C2=A0 =C2=A0build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/=
target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/libc-0.2.60/<a href=3D"http://b=
uild.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-inf=
o,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C me=
tadata=3D94ebb09615a0f486 -C extra-filename=3D-94ebb09615a0f486 --out-dir /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/build/libc-94ebb09615a0f486 -C li=
nker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/serde-1.0.97/<a href=3D"http://=
build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-inf=
o,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;derive&quot;&#39; --=
cfg &#39;feature=3D&quot;serde_derive&quot;&#39; --cfg &#39;feature=3D&quot=
;std&quot;&#39; -C metadata=3D397ac514ce86af00 -C extra-filename=3D-397ac51=
4ce86af00 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/serde-=
397ac514ce86af00 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld =
-L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work=
/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints=
 allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name spin /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/spin-0.5.0/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D7dd7ec836f=
8c506a -C extra-filename=3D-7dd7ec836f8c506a --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow<br>
&gt;=C2=A0 =C2=A0 -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --re=
map-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo=
rk/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name rand_core /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/rand_core-0.4.0/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;featur=
e=3D&quot;alloc&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C met=
adata=3D966535236305dc5a -C extra-filename=3D-966535236305dc5a --out-dir /h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686=
-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L d=
ependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps=
 -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor=
k/core2-32-poky-linux/rust<br>
&gt;=C2=A0 =C2=A0fmt/1.4.2-r0/build/target/release/deps --cap-lints allow -=
L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky=
-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name autocfg /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/cargo_home/bitbake/autocfg-0.1.5/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi --crate-type lib --emit=3Ddep-info,metadata,=
link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D9c7ae0ae=
d7fc9823 -C extra-filename=3D-9c7ae0aed7fc9823 --out-dir /home/pokybuild/yo=
cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2=
-r0/build/target/release/deps -C linker=3D/home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/bui=
ld-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/dep=
s --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/log-0.4.7/<a href=3D"http://bui=
ld.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Dj=
son --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,li=
nk -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&qu=
ot;std&quot;&#39; -C metadata=3De098f27b12050390 -C extra-filename=3D-e098f=
27b12050390 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tm=
p/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/log-=
e098f27b12050390 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld =
-L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work=
/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints=
 allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name semver_parser /h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/<a href=3D"h=
ttp://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-forma=
t=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emi=
t=3Ddep-info,metadata,link -C embed-bitcode=3Dno -C debug-assertions=3Doff =
-C metadata=3Df3b50fe98e08dd8b -C extra-filename=3D-f3b50fe98e08dd8b --out-=
dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/build/target/release/deps -C linker=3D/home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-wo=
rker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/bu=
ild/target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/arrayvec-0.4.11/<a href=3D"http=
://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-form=
at=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-i=
nfo,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D9e8f=
7b244197be3e -C extra-filename=3D-9e8f7b244197be3e --out-dir /home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/build/target/release/build/arrayvec-9e8f7b244197be3e -C linker=3D/h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name scopeguard /home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/cargo_home/bitbake/scopeguard-0.3.3/src/<a href=3D"http://=
lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djs=
on --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Dde=
p-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Df=
ab120a9dd5bad14 -C extra-filename=3D-fab120a9dd5bad14 --out-dir /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-lin=
ux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/=
core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap<br>
&gt;=C2=A0 =C2=A0-lints allow -L /home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/l=
ib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfm=
t/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name nodrop /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/nodrop-0.1.13/src/<a href=3D"http://lib.rs"=
 rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --js=
on=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,=
metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Da17fe611=
29e65b62 -C extra-filename=3D-a17fe61129e65b62 --out-dir /home/pokybuild/yo=
cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2=
-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C l=
inker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints<br>
&gt;=C2=A0 =C2=A0allow -L /home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust=
 --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/t=
mp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2=
-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name memoffset /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/memoffset-0.2.1/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D2f7=
8f4fec416c99f -C extra-filename=3D-2f78f4fec416c99f --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux=
 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-l<br>
&gt;=C2=A0 =C2=A0ints allow -L /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib=
/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/=
1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/byteorder-1.3.2/<a href=3D"http=
://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-form=
at=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-i=
nfo,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C me=
tadata=3D539ed0edcb1553e7 -C extra-filename=3D-539ed0edcb1553e7 --out-dir /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/build/byteorder-539ed0edcb1553e7 =
-C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name stable_deref_tra=
it /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/stable_deref_trait-1.1.1/src/<a=
 href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --e=
rror-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type=
 lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno=
 --cfg &#39;feature=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;s=
td&quot;&#39; -C metadata=3Dbf11e8975b7faa18 -C extra-filename=3D-bf11e8975=
b7faa18 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo=
rk/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/releas=
e/deps --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/au=
h/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/t=
arget-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-pok=
y-linux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core<br>
&gt;=C2=A0 =C2=A02-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps=
 --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tm=
p/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --r=
emap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name smallvec /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/<a href=3D"http://lib.rs"=
 rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --js=
on=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,=
metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;feature=3D&=
quot;default&quot;&#39; --cfg &#39;feature=3D&quot;may_dangle&quot;&#39; --=
cfg &#39;feature=3D&quot;std&quot;&#39; --cfg &#39;feature=3D&quot;union&qu=
ot;&#39; -C metadata=3Dc3ebde62e7bb47d1 -C extra-filename=3D-c3ebde62e7bb47=
d1 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/dep=
s --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/bui=
ld/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target=
-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-lin=
ux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/b<br>
&gt;=C2=A0 =C2=A0uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto-w=
orker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/r=
ecipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-work=
er/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/u=
sr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-core-0.2.0/<a href=
=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --er=
ror-format=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=
=3Ddep-info,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadat=
a=3Dea88230473b39d14 -C extra-filename=3D-ea88230473b39d14 --out-dir /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/release/build/rustc-rayon-core-ea88230473b39d1=
4 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/memchr-2.2.1/<a href=3D"http://=
build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-inf=
o,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;use_std&quot;&#39; -=
C metadata=3Dce8d38ceb83b8294 -C extra-filename=3D-ce8d38ceb83b8294 --out-d=
ir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/build/memchr-ce8d38ceb83b8294=
 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-0.2.0/<a href=3D"ht=
tp://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-fo=
rmat=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep=
-info,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D5c=
ea4c63c5dbd532 -C extra-filename=3D-5cea4c63c5dbd532 --out-dir /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/build/target/release/build/rustc-rayon-5cea4c63c5dbd532 -C linker=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name either /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/<a href=3D"http://lib.rs" =
rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --jso=
n=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,m=
etadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dea1265832=
84a07f6 -C extra-filename=3D-ea126583284a07f6 --out-dir /home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C li=
nker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints a<br>
&gt;=C2=A0 =C2=A0llow -L /home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust =
--remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tm=
p/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-=
r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name unicode_width /h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-width-0.1.5/src/<a href=3D"h=
ttp://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-forma=
t=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emi=
t=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#3=
9;feature=3D&quot;default&quot;&#39; -C metadata=3Df9067b939a2e9ee3 -C extr=
a-filename=3D-f9067b939a2e9ee3 --out-dir /home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target=
/i686-poky-linux/release/deps --target i686-poky-linux -C linker=3D/home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps -L dependency=3D/home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0<br>
&gt;=C2=A0 =C2=A0/build/target/release/deps --cap-lints allow -L /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name indexmap /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/cargo_home/bitbake/indexmap-1.0.2/src/<a href=3D"http://lib.=
rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson -=
-json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-in=
fo,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Df0d6d=
af2923716e0 -C extra-filename=3D-f0d6daf2923716e0 --out-dir /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -=
C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependenc=
y=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lin<br>
&gt;=C2=A0 =C2=A0ts allow -L /home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/r=
ust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.=
4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/bitflags-1.1.0/<a href=3D"http:=
//build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-forma=
t=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-in=
fo,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;default&quot;&#39; -C metadata=3D8ecc663c609fc416 -C extra-filenam=
e=3D-8ecc663c609fc416 --out-dir /home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/=
build/bitflags-8ecc663c609fc416 -C linker=3D/home/pokybuild/yocto-worker/au=
h/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/b=
uild-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/d=
eps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name graphviz --editi=
on=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2=
-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.=
0/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a>=
 --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-=
type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=
=3Dno -C metadata=3D616067e14d16bb5d -C extra-filename=3D-616067e14d16bb5d =
--out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2=
-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -=
-target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/=
build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-ru=
st-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/=
release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/<br>
&gt;=C2=A0 =C2=A0release/deps --cap-lints allow -L /home/pokybuild/yocto-wo=
rker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/re=
cipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worke=
r/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/us=
r/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name cc /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/cc-1.0.38/src/<a href=3D"http://lib.rs" rel=3D"=
noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddia=
gnostic-rendered-ansi --crate-type lib --emit=3Ddep-info,metadata,link -C e=
mbed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D99eeff8d683be0c9 =
-C extra-filename=3D-99eeff8d683be0c9 --out-dir /home/pokybuild/yocto-worke=
r/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build=
/target/release/deps -C linker=3D/home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-c=
cld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-l=
ints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name either /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/<a href=3D"http://lib.rs" =
rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --jso=
n=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,m=
etadata,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D=
a3de0059007db7dd -C extra-filename=3D-a3de0059007db7dd --out-dir /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/build/target/release/deps -C linker=3D/home/pokybuild/yocto-wor=
ker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wra=
pper/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/rel=
ease/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name ansi_term /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/ansi_term-0.11.0/src/<a href=3D"http://l=
ib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djso=
n --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep=
-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D97=
891616a3048472 -C extra-filename=3D-97891616a3048472 --out-dir /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linu=
x -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-<br>
&gt;=C2=A0 =C2=A0lints allow -L /home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/li=
b/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt=
/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name ucd_util /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/cargo_home/bitbake/ucd-util-0.1.5/src/<a href=3D"http://lib.=
rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson -=
-json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-in=
fo,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dc66da=
fd726901704 -C extra-filename=3D-c66dafd726901704 --out-dir /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -=
C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependenc=
y=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lin<br>
&gt;=C2=A0 =C2=A0ts allow -L /home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/r=
ust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.=
4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/ryu-1.0.0/<a href=3D"http://bui=
ld.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Dj=
son --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,li=
nk -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3Dcf40bafebc=
5d9e2a -C extra-filename=3D-cf40bafebc5d9e2a --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/release/build/ryu-cf40bafebc5d9e2a -C linker=3D/home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-work=
er/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/buil=
d/target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/failure_derive-0.1.5/<a href=3D=
"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error=
-format=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3D=
dep-info,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=
=3D500d9a3c0d7056cc -C extra-filename=3D-500d9a3c0d7056cc --out-dir /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/release/build/failure_derive-500d9a3c0d7056cc -=
C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name utf8_ranges /hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/cargo_home/bitbake/utf8-ranges-1.0.3/src/<a href=3D"http:=
//lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3D=
dep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=
=3Dca04778dfdc33722 -C extra-filename=3D-ca04778dfdc33722 --out-dir /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky=
-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L depend=
ency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L d=
ependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --c<br>
&gt;=C2=A0 =C2=A0ap-lints allow -L /home/pokybuild/yocto-worker/auh/build/b=
uild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr=
/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rust=
fmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name scoped_tls /home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/cargo_home/bitbake/scoped-tls-1.0.0/src/<a href=3D"http://=
lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djs=
on --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Dde=
p-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D4=
300e3ebfe432670 -C extra-filename=3D-4300e3ebfe432670 --out-dir /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-lin=
ux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/=
core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap<br>
&gt;=C2=A0 =C2=A0-lints allow -L /home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/l=
ib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfm=
t/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name unicode_segmenta=
tion /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/sr=
c/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a>=
 --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-=
type lib --emit=3Ddep-info,metadata,link -C embed-bitcode=3Dno -C debug-ass=
ertions=3Doff -C metadata=3D609f5d0c875e0967 -C extra-filename=3D-609f5d0c8=
75e0967 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo=
rk/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -C linker=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld --edition=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc=
_target-542.0.0/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_b=
lank">build.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi =
--crate-type bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debug-asse=
rtions=3Doff -C metadata=3Db1efc0d6a47b6a5c -C extra-filename=3D-b1efc0d6a4=
7b6a5c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor=
k/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-=
rustc_target-b1efc0d6a47b6a5c -C linker=3D/home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/bui=
ld-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/dep=
s --cap-lints allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name termcolor /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/termcolor-1.0.5/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Daf0=
d11e6713415b8 -C extra-filename=3D-af0d11e6713415b8 --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux=
 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-l<br>
&gt;=C2=A0 =C2=A0ints allow -L /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib=
/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/=
1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name rustc_demangle /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-demangle-0.1.15/src/<a href=
=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-=
format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib =
--emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C m=
etadata=3Df5028ac44d69eb7a -C extra-filename=3D-f5028ac44d69eb7a --out-dir =
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i6=
86-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L=
 dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/de=
ps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/d<br>
&gt;=C2=A0 =C2=A0eps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysr=
oot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/bui=
ld/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/deb=
ug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name itoa /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/itoa-0.4.4/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;feature=3D&qu=
ot;default&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C metadata=
=3Defd7d4d7b4402894 -C extra-filename=3D-efd7d4d7b4402894 --out-dir /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky=
-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L depend=
ency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L d=
ependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.<br>
&gt;=C2=A0 =C2=A02-r0/build/target/release/deps --cap-lints allow -L /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name quick_error /hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/cargo_home/bitbake/quick-error-1.2.2/src/<a href=3D"http:=
//lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3D=
dep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=
=3D83b8dad83398e3a4 -C extra-filename=3D-83b8dad83398e3a4 --out-dir /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky=
-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L depend=
ency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L d=
ependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --c<br>
&gt;=C2=A0 =C2=A0ap-lints allow -L /home/pokybuild/yocto-worker/auh/build/b=
uild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr=
/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rust=
fmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name fnv /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/cargo_home/bitbake/fnv-1.0.6/<a href=3D"http://lib.rs" rel=3D"nor=
eferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddiagno=
stic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata,li=
nk -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dceb682049fbd227a -C=
 extra-filename=3D-ceb682049fbd227a --out-dir /home/pokybuild/yocto-worker/=
auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/t=
arget/i686-poky-linux/release/deps --target i686-poky-linux -C linker=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/build/target/release/deps --cap-lints allow -L /h<br>
&gt;=C2=A0 =C2=A0ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/=
core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-pa=
th-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name same_file /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/same-file-1.0.5/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Db7f=
253f5d5610b25 -C extra-filename=3D-b7f253f5d5610b25 --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux=
 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-l<br>
&gt;=C2=A0 =C2=A0ints allow -L /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib=
/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/=
1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld --edition=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-synta=
x-542.0.0/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">=
build.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi --crat=
e-type bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debug-assertions=
=3Doff -C metadata=3D5aebbe0c13823bdd -C extra-filename=3D-5aebbe0c13823bdd=
 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-syntax=
-5aebbe0c13823bdd -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld=
 -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor=
k/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lint=
s allow`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name vec_map /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/cargo_home/bitbake/vec_map-0.8.1/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D5831430=
b43ab8372 -C extra-filename=3D-5831430b43ab8372 --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints<br>
&gt;=C2=A0 =C2=A0 allow -L /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rus=
t --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.=
2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name semver_parser /h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/<a href=3D"h=
ttp://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-forma=
t=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emi=
t=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metada=
ta=3Dba877faa789ab53c -C extra-filename=3D-ba877faa789ab53c --out-dir /home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-po=
ky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L depe=
ndency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L=
 dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps<br>
&gt;=C2=A0 =C2=A0 --cap-lints allow -L /home/pokybuild/yocto-worker/auh/bui=
ld/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot=
/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/=
build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/=
rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name strsim /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/strsim-0.8.0/src/<a href=3D"http://lib.rs" =
rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --jso=
n=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,m=
etadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D8aa9952c9=
7613c38 -C extra-filename=3D-8aa9952c97613c38 --out-dir /home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C li=
nker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints a<br>
&gt;=C2=A0 =C2=A0llow -L /home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust =
--remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tm=
p/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-=
r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name build_script_bui=
ld --edition=3D2018 <a href=3D"http://build.rs" rel=3D"noreferrer" target=
=3D"_blank">build.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered=
-ansi --crate-type bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debu=
g-assertions=3Doff --cfg &#39;feature=3D&quot;cargo-fmt&quot;&#39; --cfg &#=
39;feature=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;rustfmt-fo=
rmat-diff&quot;&#39; -C metadata=3D533f8374b6d41dfb -C extra-filename=3D-53=
3f8374b6d41dfb --out-dir /home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/r=
ustfmt-nightly-533f8374b6d41dfb -C linker=3D/home/pokybuild/yocto-worker/au=
h/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/b=
uild-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/d=
eps`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name rustc_lexer --ed=
ition=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-=
542.0.0/src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">=
lib.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifact=
s --crate-type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embe=
d-bitcode=3Dno -C metadata=3Df811c840c35ab6d3 -C extra-filename=3D-f811c840=
c35ab6d3 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/relea=
se/deps --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/a=
uh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/=
target-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-po=
ky-linux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/buil=
d/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/bui<br>
&gt;=C2=A0 =C2=A0ld/target/release/deps --cap-lints allow -L /home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 0/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), m...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling diff v0.1.11<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 1/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), m...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name diff /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/diff-0.1.11/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D34e9b70cb2=
1518fd -C extra-filename=3D-34e9b70cb21518fd --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allo<br>
&gt;=C2=A0 =C2=A0w -L /home/pokybuild/yocto-worker/auh/build/build/build/tm=
p/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --r=
emap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`=
<br>
&gt; error[E0554]: `#![feature]` may not be used on the stable release chan=
nel<br>
&gt;=C2=A0 =C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-=
0.6.10/lib.rs:33:32<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt; 33 | #![cfg_attr(feature =3D &quot;union&quot;, feature(untagged_union=
s))]<br>
&gt;=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^=
^^^^^^^^^^^^<br>
&gt; <br>
&gt; error[E0554]: `#![feature]` may not be used on the stable release chan=
nel<br>
&gt;=C2=A0 =C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec-=
0.6.10/lib.rs:35:37<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt; 35 | #![cfg_attr(feature =3D &quot;may_dangle&quot;, feature(dropck_ey=
epatch))]<br>
&gt;=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 2/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name unicode_segmenta=
tion /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/sr=
c/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a>=
 --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-=
type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=
=3Dno -C metadata=3Dea80c7cedc2e61b8 -C extra-filename=3D-ea80c7cedc2e61b8 =
--out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2=
-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -=
-target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/=
build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-ru=
st-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/=
release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe<br>
&gt;=C2=A0 =C2=A0t/release/deps --cap-lints allow -L /home/pokybuild/yocto-=
worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/=
recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-wor=
ker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/=
usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling rustc-workspace-hack v1.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 3/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name rustc_workspace_=
hack /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-workspace-hack-1.0.0/sr=
c/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a>=
 --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-=
type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=
=3Dno -C metadata=3D4f12a631a3f78c68 -C extra-filename=3D-4f12a631a3f78c68 =
--out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2=
-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -=
-target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/=
build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-ru=
st-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/=
release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe<br>
&gt;=C2=A0 =C2=A0t/release/deps --cap-lints allow -L /home/pokybuild/yocto-=
worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/=
recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-wor=
ker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/=
usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; error[E0554]: `#![feature]` may not be used on the stable release chan=
nel<br>
&gt;=C2=A0 =C2=A0 =C2=A0--&gt; /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rus=
tc-ap-graphviz-542.0.0/lib.rs:277:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; 277 | #![feature(rustc_private, nll)]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling bytecount v0.5.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 4/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name bytecount /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/bytecount-0.5.1/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Defc=
ff43f975d063b -C extra-filename=3D-efcff43f975d063b --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux=
 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-l<br>
&gt;=C2=A0 =C2=A0ints allow -L /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib=
/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/=
1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling unicode_categories v0.1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 5/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name unicode_categori=
es /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode_categories-0.1.1/src/<a=
 href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --e=
rror-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type=
 lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno=
 -C metadata=3D1142561a6fb03929 -C extra-filename=3D-1142561a6fb03929 --out=
-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --targ=
et i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-cc=
ld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/relea=
se/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/re<br>
&gt;=C2=A0 =C2=A0lease/deps --cap-lints allow -L /home/pokybuild/yocto-work=
er/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/reci=
pe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/=
auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/=
src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling crossbeam-utils v0.2.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 6/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name crossbeam_utils =
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/cargo_home/bitbake/crossbeam-utils-0.2.2/src/<a href=
=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-=
format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib =
--emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cf=
g &#39;feature=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;use_st=
d&quot;&#39; -C metadata=3D5683e3e83934a5f7 -C extra-filename=3D-5683e3e839=
34a5f7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor=
k/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release=
/deps --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh=
/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/ta=
rget-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky=
-linux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/=
build/build/tmp/work/core2-<br>
&gt;=C2=A0 =C2=A032-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -=
-extern cfg_if=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor=
k/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release=
/deps/libcfg_if-81f5d828fe65528e.rmeta --cap-lints allow -L /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yo=
cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2=
-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling owning_ref v0.4.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 7/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name owning_ref /home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/cargo_home/bitbake/owning_ref-0.4.0/src/<a href=3D"http://=
lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djs=
on --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Dde=
p-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D4=
32adf1bd23f2849 -C extra-filename=3D-432adf1bd23f2849 --out-dir /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-lin=
ux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/=
core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --ext<br>
&gt;=C2=A0 =C2=A0ern stable_deref_trait=3D/home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe=
t/i686-poky-linux/release/deps/libstable_deref_trait-bf11e8975b7faa18.rmeta=
 --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tm=
p/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --r=
emap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 8/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; error[E0433]: failed to resolve: could not find `property` in `unicode=
`<br>
&gt;=C2=A0 =C2=A0 =C2=A0--&gt; /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rus=
tc-ap-rustc_lexer-542.0.0/src/lib.rs:672:24<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; 672 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0core::unicode::property::Patter=
n_White_Space(c)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^ could not find `property` in `u=
nicode`<br>
&gt; <br>
&gt; error[E0554]: `#![feature]` may not be used on the stable release chan=
nel<br>
&gt;=C2=A0 =C2=A0--&gt; /home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-r=
ustc_lexer-542.0.0/src/lib.rs:3:43<br>
&gt;=C2=A0 =C2=A0 |<br>
&gt; 3 | #![cfg_attr(not(feature =3D &quot;unicode-xid&quot;), feature(unic=
ode_internals))]<br>
&gt;=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling humantime v1.2.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 9/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name humantime /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/humantime-1.2.0/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D8de=
357e2c8248f8b -C extra-filename=3D-8de357e2c8248f8b --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux=
 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --exter<br>
&gt;=C2=A0 =C2=A0n quick_error=3D/home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-po=
ky-linux/release/deps/libquick_error-83b8dad83398e3a4.rmeta --cap-lints all=
ow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling walkdir v2.2.9<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling textwrap v0.11.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name walkdir /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/cargo_home/bitbake/walkdir-2.2.9/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D9fe5824=
e18efee6f -C extra-filename=3D-9fe5824e18efee6f --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --extern sa<br>
&gt;=C2=A0 =C2=A0me_file=3D/home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-lin=
ux/release/deps/libsame_file-b7f253f5d5610b25.rmeta --cap-lints allow -L /h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 11/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name textwrap /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/cargo_home/bitbake/textwrap-0.11.0/src/<a href=3D"http://lib=
.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson =
--json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-i=
nfo,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D95d0=
5764bcecd09a -C extra-filename=3D-95d05764bcecd09a --out-dir /home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux =
-C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependen=
cy=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/build/target/release/deps --extern<br>
&gt;=C2=A0 =C2=A0 unicode_width=3D/home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-p=
oky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta --cap-lints =
allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-pre=
fix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; error: aborting due to previous error<br>
&gt; <br>
&gt; For more information about this error, try `rustc --explain E0554`.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling getopts v0.2.19<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 12/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name getopts /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/cargo_home/bitbake/getopts-0.2.19/src/<a href=3D"http://lib.r=
s" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --=
json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-inf=
o,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D087308=
4cbf9afd94 -C extra-filename=3D-0873084cbf9afd94 --out-dir /home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C=
 linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2=
-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --extern u<br>
&gt;=C2=A0 =C2=A0nicode_width=3D/home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-pok=
y-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta --cap-lints al=
low -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefi=
x=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt;=C2=A0 =C2=A0 =C2=A0Compiling itertools v0.8.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 13/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Running `rustc --crate-name itertools /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/itertools-0.8.0/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi --crate-type lib --emit=3Ddep-info,metad=
ata,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;use_std&quot;&#39; -=
C metadata=3Dff7eca720ccd13a2 -C extra-filename=3D-ff7eca720ccd13a2 --out-d=
ir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps -C linker=3D/home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-wor=
ker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/bui=
ld/target/release/deps --extern either=3D/home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target=
/release/deps/libeither-a3<br>
&gt;=C2=A0 =C2=A0de0059007db7dd.rmeta --cap-lints allow`<br>
&gt; error: could not compile `rustc-ap-graphviz`<br>
&gt; <br>
&gt; Caused by:<br>
&gt;=C2=A0 =C2=A0 process didn&#39;t exit successfully: `rustc --crate-name=
 graphviz --edition=3D2018 /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-a=
p-graphviz-542.0.0/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_=
blank">lib.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,a=
rtifacts --crate-type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 =
-C embed-bitcode=3Dno -C metadata=3D616067e14d16bb5d -C extra-filename=3D-6=
16067e14d16bb5d --out-dir /home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linu=
x/release/deps --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-w=
orker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/w=
rapper/target-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/bu=
ild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/=
i686-poky-linux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/a=
uh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt<br>
&gt;=C2=A0 =C2=A0/1.4.2-r0/build/target/release/deps --cap-lints allow -L /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0` (exit status: 1)<br>
&gt; warning: build failed, waiting for other jobs to finish...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 14/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 15/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 16/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 17/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 18/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 19/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; error: aborting due to 2 previous errors<br>
&gt; <br>
&gt; For more information about this error, try `rustc --explain E0554`.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 20/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 21/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 22/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 24/167: syn(<a hre=
f=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), c=
rossbeam-...<br>
&gt; error[E0599]: no method named `is_xid_start` found for type `char` in =
the current scope<br>
&gt;=C2=A0 =C2=A0 =C2=A0--&gt; /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rus=
tc-ap-rustc_lexer-542.0.0/src/lib.rs:689:33<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; 689 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (c &gt; &#39;\=
x7f&#39; &amp;&amp; c.is_xid_start())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^=
^^^^^^ method not found in `char`<br>
&gt; <br>
&gt; error[E0599]: no method named `is_xid_continue` found for type `char` =
in the current scope<br>
&gt;=C2=A0 =C2=A0 =C2=A0--&gt; /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rus=
tc-ap-rustc_lexer-542.0.0/src/lib.rs:708:33<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; 708 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (c &gt; &#39;\=
x7f&#39; &amp;&amp; c.is_xid_continue())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^=
^^^^^^^^^ method not found in `char`<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 25/167: syn(<a hre=
f=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), c=
rossbeam-...<br>
&gt; error: aborting due to 4 previous errors<br>
&gt; <br>
&gt; Some errors have detailed explanations: E0433, E0554, E0599.<br>
&gt; For more information about an error, try `rustc --explain E0433`.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 26/167: syn(<a href=3D"=
http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), crossb=
eam-...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 27/167: syn(<a href=3D"=
http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), crossb=
eam-...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 28/167: syn(<a href=3D"=
http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), crossb=
eam-...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 29/167: syn(<a href=3D"=
http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), crossb=
eam-...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 30/167: crossbeam-utils=
, serde(bu...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 31/167: crossbeam-utils=
, serde(bu...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 32/167: crossbeam-utils=
, utf8-ran...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 33/167: crossbeam-uti=
ls, utf8-ran...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 34/167: crossbeam-uti=
ls, utf8-ran...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 35/167: crossbeam-uti=
ls, utf8-ran...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 36/167: crossbeam-uti=
ls, utf8-ran...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 37/167: crossbeam-uti=
ls, utf8-ran...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 38/167: utf8-ranges, =
cc, walkdir,...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 39/167: utf8-ranges, cc,=
 walkdir,...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 40/167: cc, walkdir, get=
opts, hum...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 41/167: cc, walkdir, get=
opts, hum...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 42/167: cc, walkdir, get=
opts, hum...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 43/167: cc, walkdir, get=
opts, hum...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 44/167: cc, walkdir, get=
opts, hum...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 45/167: cc, walkdir, =
getopts, hum...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 46/167: cc, walkdir, =
getopts, hum...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 47/167: cc, walkdir, =
getopts, hum...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 48/167: cc, walkdir, =
getopts, hum...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 49/167: cc, walkdir, =
getopts, hum...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 50/167: cc, walkdir, =
getopts, sem...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 51/167: cc, walkdir, =
getopts, str...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 52/167: cc, walkdir, get=
opts, dif...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 53/167: cc, walkdir, get=
opts, dif...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 54/167: cc, walkdir, get=
opts, dif...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 55/167: walkdir, getopts=
, diff, r...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 56/167: getopts, diff, r=
ustc-dema...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 57/167: getopts, rustc-d=
emangle, ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 58/167: getopts, iter=
tools<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 59/167: getopts<br>
&gt; error: build failed<br>
&gt; WARNING: exit code 101 from a shell command.<br>
&gt; <br>
&gt; ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/temp/log.do=
_compile.2104<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing shell function do_compile<br>
&gt; | NOTE: cargo =3D /home/pokybuild/yocto-worker/auh/build/build/build/t=
mp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot-native/usr/bin/=
cargo<br>
&gt; | NOTE: rustc =3D<br>
&gt; | NOTE: cargo build -v --target i686-poky-linux --release --manifest-p=
ath=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/git//Cargo.toml<br>
&gt; |=C2=A0 =C2=A0 Compiling proc-macro2 v0.4.30<br>
&gt; |=C2=A0 =C2=A0 Compiling unicode-xid v0.1.0<br>
&gt; |=C2=A0 =C2=A0 Compiling syn v0.15.42<br>
&gt; |=C2=A0 =C2=A0 Compiling libc v0.2.60<br>
&gt; |=C2=A0 =C2=A0 Compiling cfg-if v0.1.9<br>
&gt; |=C2=A0 =C2=A0 Compiling serde v1.0.97<br>
&gt; |=C2=A0 =C2=A0 Compiling spin v0.5.0<br>
&gt; |=C2=A0 =C2=A0 Compiling rand_core v0.4.0<br>
&gt; |=C2=A0 =C2=A0 Compiling autocfg v0.1.5<br>
&gt; |=C2=A0 =C2=A0 Compiling log v0.4.7<br>
&gt; |=C2=A0 =C2=A0 Compiling semver-parser v0.7.0<br>
&gt; |=C2=A0 =C2=A0 Compiling arrayvec v0.4.11<br>
&gt; |=C2=A0 =C2=A0 Compiling scopeguard v0.3.3<br>
&gt; |=C2=A0 =C2=A0 Compiling nodrop v0.1.13<br>
&gt; |=C2=A0 =C2=A0 Compiling memoffset v0.2.1<br>
&gt; |=C2=A0 =C2=A0 Compiling byteorder v1.3.2<br>
&gt; |=C2=A0 =C2=A0 Compiling stable_deref_trait v1.1.1<br>
&gt; |=C2=A0 =C2=A0 Compiling smallvec v0.6.10<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-rayon-core v0.2.0<br>
&gt; |=C2=A0 =C2=A0 Compiling memchr v2.2.1<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-rayon v0.2.0<br>
&gt; |=C2=A0 =C2=A0 Compiling either v1.5.2<br>
&gt; |=C2=A0 =C2=A0 Compiling unicode-width v0.1.5<br>
&gt; |=C2=A0 =C2=A0 Compiling indexmap v1.0.2<br>
&gt; |=C2=A0 =C2=A0 Compiling bitflags v1.1.0<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-ap-graphviz v542.0.0<br>
&gt; |=C2=A0 =C2=A0 Compiling cc v1.0.38<br>
&gt; |=C2=A0 =C2=A0 Compiling ansi_term v0.11.0<br>
&gt; |=C2=A0 =C2=A0 Compiling ucd-util v0.1.5<br>
&gt; |=C2=A0 =C2=A0 Compiling ryu v1.0.0<br>
&gt; |=C2=A0 =C2=A0 Compiling failure_derive v0.1.5<br>
&gt; |=C2=A0 =C2=A0 Compiling utf8-ranges v1.0.3<br>
&gt; |=C2=A0 =C2=A0 Compiling scoped-tls v1.0.0<br>
&gt; |=C2=A0 =C2=A0 Compiling unicode-segmentation v1.3.0<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-ap-rustc_target v542.0.0<br>
&gt; |=C2=A0 =C2=A0 Compiling termcolor v1.0.5<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-demangle v0.1.15<br>
&gt; |=C2=A0 =C2=A0 Compiling itoa v0.4.4<br>
&gt; |=C2=A0 =C2=A0 Compiling quick-error v1.2.2<br>
&gt; |=C2=A0 =C2=A0 Compiling fnv v1.0.6<br>
&gt; |=C2=A0 =C2=A0 Compiling same-file v1.0.5<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-ap-syntax v542.0.0<br>
&gt; |=C2=A0 =C2=A0 Compiling vec_map v0.8.1<br>
&gt; |=C2=A0 =C2=A0 Compiling strsim v0.8.0<br>
&gt; |=C2=A0 =C2=A0 Compiling rustfmt-nightly v1.4.2 (/home/pokybuild/yocto=
-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
/git)<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-ap-rustc_lexer v542.0.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/proc-macro2-0.4.30/<a href=3D"http:=
//build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-forma=
t=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-in=
fo,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;proc-macro&quot;&#39=
; -C metadata=3Ddf9c0358a8f4cef2 -C extra-filename=3D-df9c0358a8f4cef2 --ou=
t-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/build/target/release/build/proc-macro2-df9c0358=
a8f4cef2 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<=
br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name unicode_xid /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/cargo_home/bitbake/unicode-xid-0.1.0/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#=
39;feature=3D&quot;default&quot;&#39; -C metadata=3D11f58d24801d743d -C ext=
ra-filename=3D-11f58d24801d743d --out-dir /home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe=
t/release/deps -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L=
 dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints a=
llow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name cfg_if /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/cfg-if-0.1.9/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D81f5d828fe=
65528e -C extra-filename=3D-81f5d828fe65528e --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints<br>
&gt;=C2=A0 =C2=A0 allow -L /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rus=
t --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.=
2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/syn-0.15.42/<a href=3D"http://build=
.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djso=
n --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,link=
 -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&quot=
;clone-impls&quot;&#39; --cfg &#39;feature=3D&quot;default&quot;&#39; --cfg=
 &#39;feature=3D&quot;derive&quot;&#39; --cfg &#39;feature=3D&quot;extra-tr=
aits&quot;&#39; --cfg &#39;feature=3D&quot;full&quot;&#39; --cfg &#39;featu=
re=3D&quot;parsing&quot;&#39; --cfg &#39;feature=3D&quot;printing&quot;&#39=
; --cfg &#39;feature=3D&quot;proc-macro&quot;&#39; --cfg &#39;feature=3D&qu=
ot;quote&quot;&#39; --cfg &#39;feature=3D&quot;visit&quot;&#39; -C metadata=
=3D61f79f9dccfd40ba -C extra-filename=3D-61f79f9dccfd40ba --out-dir /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/release/build/syn-61f79f9dccfd40ba -C linker=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybui=
ld/yocto-worker/auh/build/buil<br>
&gt;=C2=A0 =C2=A0d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/buil=
d/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/libc-0.2.60/<a href=3D"http://build=
.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djso=
n --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,link=
 -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&quot=
;default&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C metadata=
=3D94ebb09615a0f486 -C extra-filename=3D-94ebb09615a0f486 --out-dir /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/release/build/libc-94ebb09615a0f486 -C linker=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/serde-1.0.97/<a href=3D"http://buil=
d.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djs=
on --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,lin=
k -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&quo=
t;default&quot;&#39; --cfg &#39;feature=3D&quot;derive&quot;&#39; --cfg &#3=
9;feature=3D&quot;serde_derive&quot;&#39; --cfg &#39;feature=3D&quot;std&qu=
ot;&#39; -C metadata=3D397ac514ce86af00 -C extra-filename=3D-397ac514ce86af=
00 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/serde-397ac51=
4ce86af00 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tm=
p/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L depe=
ndency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`=
<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name spin /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/cargo_home/bitbake/spin-0.5.0/src/<a href=3D"http://lib.rs" rel=3D"n=
oreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddiag=
nostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata,=
link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D7dd7ec836f8c506a =
-C extra-filename=3D-7dd7ec836f8c506a --out-dir /home/pokybuild/yocto-worke=
r/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build=
/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/build/target/release/deps --cap-lints all<br>
&gt;=C2=A0 =C2=A0ow -L /home/pokybuild/yocto-worker/auh/build/build/build/t=
mp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --=
remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0=
`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name rand_core /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/rand_core-0.4.0/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;feature=3D=
&quot;alloc&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C metadat=
a=3D966535236305dc5a -C extra-filename=3D-966535236305dc5a --out-dir /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-pok=
y-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L =
dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/ru<br>
&gt;=C2=A0 =C2=A0stfmt/1.4.2-r0/build/target/release/deps --cap-lints allow=
 -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name autocfg /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/cargo_home/bitbake/autocfg-0.1.5/src/<a href=3D"http://lib.rs" re=
l=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi --crate-type lib --emit=3Ddep-info,metadata,lin=
k -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D9c7ae0aed7f=
c9823 -C extra-filename=3D-9c7ae0aed7fc9823 --out-dir /home/pokybuild/yocto=
-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
/build/target/release/deps -C linker=3D/home/pokybuild/yocto-worker/auh/bui=
ld/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-=
rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -=
-cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/log-0.4.7/<a href=3D"http://build.r=
s" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djson =
--json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,link -=
C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&quot;s=
td&quot;&#39; -C metadata=3De098f27b12050390 -C extra-filename=3D-e098f27b1=
2050390 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo=
rk/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/log-e098=
f27b12050390 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L d=
ependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints all=
ow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name semver_parser /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/<a href=3D"http:=
//lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3D=
dep-info,metadata,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C m=
etadata=3Df3b50fe98e08dd8b -C extra-filename=3D-f3b50fe98e08dd8b --out-dir =
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/release/deps -C linker=3D/home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker=
/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/=
target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/arrayvec-0.4.11/<a href=3D"http://b=
uild.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-inf=
o,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D9e8f7b=
244197be3e -C extra-filename=3D-9e8f7b244197be3e --out-dir /home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/build/target/release/build/arrayvec-9e8f7b244197be3e -C linker=3D/hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name scopeguard /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/scopeguard-0.3.3/src/<a href=3D"http://lib.=
rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson -=
-json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-in=
fo,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dfab12=
0a9dd5bad14 -C extra-filename=3D-fab120a9dd5bad14 --out-dir /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -=
C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependenc=
y=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/build/target/release/deps --c<br>
&gt;=C2=A0 =C2=A0ap-lints allow -L /home/pokybuild/yocto-worker/auh/build/b=
uild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr=
/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rust=
fmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name nodrop /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/nodrop-0.1.13/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Da17fe61129=
e65b62 -C extra-filename=3D-a17fe61129e65b62 --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lint<br>
&gt;=C2=A0 =C2=A0s allow -L /home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/ru=
st --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4=
.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name memoffset /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/memoffset-0.2.1/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D2f78f4f=
ec416c99f -C extra-filename=3D-2f78f4fec416c99f --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap<br>
&gt;=C2=A0 =C2=A0-lints allow -L /home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/l=
ib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfm=
t/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/byteorder-1.3.2/<a href=3D"http://b=
uild.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-inf=
o,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C me=
tadata=3D539ed0edcb1553e7 -C extra-filename=3D-539ed0edcb1553e7 --out-dir /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/build/byteorder-539ed0edcb1553e7 =
-C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name stable_deref_trait /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/stable_deref_trait-1.1.1/src/<a hre=
f=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error=
-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib=
 --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --c=
fg &#39;feature=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;std&q=
uot;&#39; -C metadata=3Dbf11e8975b7faa18 -C extra-filename=3D-bf11e8975b7fa=
a18 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/de=
ps --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/bu=
ild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/targe=
t-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-li=
nux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/co<br>
&gt;=C2=A0 =C2=A0re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/de=
ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust -=
-remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r=
0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name smallvec /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;feature=3D&qu=
ot;default&quot;&#39; --cfg &#39;feature=3D&quot;may_dangle&quot;&#39; --cf=
g &#39;feature=3D&quot;std&quot;&#39; --cfg &#39;feature=3D&quot;union&quot=
;&#39; -C metadata=3Dc3ebde62e7bb47d1 -C extra-filename=3D-c3ebde62e7bb47d1=
 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps =
--target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-r=
ust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux=
/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh<br>
&gt;=C2=A0 =C2=A0/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto=
-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-wo=
rker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D=
/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-core-0.2.0/<a href=3D"h=
ttp://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-f=
ormat=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Dde=
p-info,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3De=
a88230473b39d14 -C extra-filename=3D-ea88230473b39d14 --out-dir /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/build/target/release/build/rustc-rayon-core-ea88230473b39d14 -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/memchr-2.2.1/<a href=3D"http://buil=
d.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djs=
on --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,lin=
k -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&quo=
t;default&quot;&#39; --cfg &#39;feature=3D&quot;use_std&quot;&#39; -C metad=
ata=3Dce8d38ceb83b8294 -C extra-filename=3D-ce8d38ceb83b8294 --out-dir /hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/build/target/release/build/memchr-ce8d38ceb83b8294 -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-0.2.0/<a href=3D"http:/=
/build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-inf=
o,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D5cea4c=
63c5dbd532 -C extra-filename=3D-5cea4c63c5dbd532 --out-dir /home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/build/target/release/build/rustc-rayon-5cea4c63c5dbd532 -C linker=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name either /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dea12658328=
4a07f6 -C extra-filename=3D-ea126583284a07f6 --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints<br>
&gt;=C2=A0 =C2=A0 allow -L /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rus=
t --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.=
2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name unicode_width /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/unicode-width-0.1.5/src/<a href=3D"http:=
//lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3D=
dep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;fe=
ature=3D&quot;default&quot;&#39; -C metadata=3Df9067b939a2e9ee3 -C extra-fi=
lename=3D-f9067b939a2e9ee3 --out-dir /home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i68=
6-poky-linux/release/deps --target i686-poky-linux -C linker=3D/home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/pokybuild/yocto-wo=
rker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/bu=
ild/target/i686-poky-linux/release/deps -L dependency=3D/home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
<br>
&gt;=C2=A0 =C2=A0r0/build/target/release/deps --cap-lints allow -L /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name indexmap /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/indexmap-1.0.2/src/<a href=3D"http://lib.rs" =
rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --jso=
n=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,m=
etadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Df0d6daf29=
23716e0 -C extra-filename=3D-f0d6daf2923716e0 --out-dir /home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C li=
nker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/release/deps --cap-l<br>
&gt;=C2=A0 =C2=A0ints allow -L /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib=
/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/=
1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/bitflags-1.1.0/<a href=3D"http://bu=
ild.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,l=
ink -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&q=
uot;default&quot;&#39; -C metadata=3D8ecc663c609fc416 -C extra-filename=3D-=
8ecc663c609fc416 --out-dir /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build=
/bitflags-8ecc663c609fc416 -C linker=3D/home/pokybuild/yocto-worker/auh/bui=
ld/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-=
rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -=
-cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name graphviz --edition=
=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/=
<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> -=
-error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-ty=
pe lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3D=
no -C metadata=3D616067e14d16bb5d -C extra-filename=3D-616067e14d16bb5d --o=
ut-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --ta=
rget i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-=
ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/rel=
ease/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe<br>
&gt;=C2=A0 =C2=A0t/release/deps --cap-lints allow -L /home/pokybuild/yocto-=
worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/=
recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-wor=
ker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/=
usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name cc /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/cargo_home/bitbake/cc-1.0.38/src/<a href=3D"http://lib.rs" rel=3D"nore=
ferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddiagnos=
tic-rendered-ansi --crate-type lib --emit=3Ddep-info,metadata,link -C embed=
-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D99eeff8d683be0c9 -C e=
xtra-filename=3D-99eeff8d683be0c9 --out-dir /home/pokybuild/yocto-worker/au=
h/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar=
get/release/deps -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld =
-L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work=
/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints=
 allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name either /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3Da=
3de0059007db7dd -C extra-filename=3D-a3de0059007db7dd --out-dir /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/build/target/release/deps -C linker=3D/home/pokybuild/yocto-work=
er/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrap=
per/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/=
build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/rele=
ase/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name ansi_term /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/ansi_term-0.11.0/src/<a href=3D"http://lib.r=
s" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --=
json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-inf=
o,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D978916=
16a3048472 -C extra-filename=3D-97891616a3048472 --out-dir /home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C=
 linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2=
-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --ca<br>
&gt;=C2=A0 =C2=A0p-lints allow -L /home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/=
lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustf=
mt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name ucd_util /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/ucd-util-0.1.5/src/<a href=3D"http://lib.rs" =
rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --jso=
n=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,m=
etadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dc66dafd72=
6901704 -C extra-filename=3D-c66dafd726901704 --out-dir /home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C li=
nker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/release/deps --cap-l<br>
&gt;=C2=A0 =C2=A0ints allow -L /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib=
/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/=
1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/ryu-1.0.0/<a href=3D"http://build.r=
s" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djson =
--json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,link -=
C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3Dcf40bafebc5d9e=
2a -C extra-filename=3D-cf40bafebc5d9e2a --out-dir /home/pokybuild/yocto-wo=
rker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/bu=
ild/target/release/build/ryu-cf40bafebc5d9e2a -C linker=3D/home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/a=
uh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/ta=
rget/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/failure_derive-0.1.5/<a href=3D"htt=
p://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-for=
mat=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-=
info,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D500=
d9a3c0d7056cc -C extra-filename=3D-500d9a3c0d7056cc --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/release/build/failure_derive-500d9a3c0d7056cc -C link=
er=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name utf8_ranges /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/cargo_home/bitbake/utf8-ranges-1.0.3/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dca0=
4778dfdc33722 -C extra-filename=3D-ca04778dfdc33722 --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux=
 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -<br>
&gt;=C2=A0 =C2=A0-cap-lints allow -L /home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/u=
sr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/ru=
stfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name scoped_tls /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/scoped-tls-1.0.0/src/<a href=3D"http://lib.=
rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson -=
-json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-in=
fo,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D4300e=
3ebfe432670 -C extra-filename=3D-4300e3ebfe432670 --out-dir /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -=
C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependenc=
y=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/build/target/release/deps --c<br>
&gt;=C2=A0 =C2=A0ap-lints allow -L /home/pokybuild/yocto-worker/auh/build/b=
uild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr=
/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rust=
fmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name unicode_segmentation=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/src/<a=
 href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --e=
rror-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type=
 lib --emit=3Ddep-info,metadata,link -C embed-bitcode=3Dno -C debug-asserti=
ons=3Doff -C metadata=3D609f5d0c875e0967 -C extra-filename=3D-609f5d0c875e0=
967 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -C linker=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build -=
-edition=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work=
/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_tar=
get-542.0.0/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank=
">build.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi --cr=
ate-type bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debug-assertio=
ns=3Doff -C metadata=3Db1efc0d6a47b6a5c -C extra-filename=3D-b1efc0d6a47b6a=
5c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-rust=
c_target-b1efc0d6a47b6a5c -C linker=3D/home/pokybuild/yocto-worker/auh/buil=
d/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-r=
ust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --=
cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name termcolor /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/termcolor-1.0.5/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Daf0d11e=
6713415b8 -C extra-filename=3D-af0d11e6713415b8 --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap<br>
&gt;=C2=A0 =C2=A0-lints allow -L /home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/l=
ib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfm=
t/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name rustc_demangle /home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-demangle-0.1.15/src/<a href=3D"ht=
tp://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=
=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadat=
a=3Df5028ac44d69eb7a -C extra-filename=3D-f5028ac44d69eb7a --out-dir /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-pok=
y-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L =
dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release<br>
&gt;=C2=A0 =C2=A0/deps --cap-lints allow -L /home/pokybuild/yocto-worker/au=
h/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sy=
sroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/d=
ebug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name itoa /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/cargo_home/bitbake/itoa-0.4.4/src/<a href=3D"http://lib.rs" rel=3D"n=
oreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddiag=
nostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata,=
link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;feature=3D&quot;defa=
ult&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C metadata=3Defd7=
d4d7b4402894 -C extra-filename=3D-efd7d4d7b4402894 --out-dir /home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux =
-C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependen=
cy=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.<br>
&gt;=C2=A0 =C2=A04.2-r0/build/target/release/deps --cap-lints allow -L /hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name quick_error /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/cargo_home/bitbake/quick-error-1.2.2/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D83b=
8dad83398e3a4 -C extra-filename=3D-83b8dad83398e3a4 --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux=
 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -<br>
&gt;=C2=A0 =C2=A0-cap-lints allow -L /home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/u=
sr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/ru=
stfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name fnv /home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/cargo_home/bitbake/fnv-1.0.6/<a href=3D"http://lib.rs" rel=3D"norefer=
rer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddiagnostic=
-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata,link -=
C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dceb682049fbd227a -C ext=
ra-filename=3D-ceb682049fbd227a --out-dir /home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe=
t/i686-poky-linux/release/deps --target i686-poky-linux -C linker=3D/home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
r0/build/target/i686-poky-linux/release/deps -L dependency=3D/home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/build/target/release/deps --cap-lints allow -L<br>
&gt;=C2=A0 =C2=A0/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor=
k/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-=
path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name same_file /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/same-file-1.0.5/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Db7f253f=
5d5610b25 -C extra-filename=3D-b7f253f5d5610b25 --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap<br>
&gt;=C2=A0 =C2=A0-lints allow -L /home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/l=
ib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfm=
t/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build -=
-edition=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work=
/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-syntax-54=
2.0.0/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi --crate-ty=
pe bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debug-assertions=3Do=
ff -C metadata=3D5aebbe0c13823bdd -C extra-filename=3D-5aebbe0c13823bdd --o=
ut-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-syntax-5ae=
bbe0c13823bdd -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L =
dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints al=
low`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name vec_map /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/cargo_home/bitbake/vec_map-0.8.1/src/<a href=3D"http://lib.rs" re=
l=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D5831430b43=
ab8372 -C extra-filename=3D-5831430b43ab8372 --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lin<br>
&gt;=C2=A0 =C2=A0ts allow -L /home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/r=
ust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.=
4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name semver_parser /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/<a href=3D"http:=
//lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3D=
dep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=
=3Dba877faa789ab53c -C extra-filename=3D-ba877faa789ab53c --out-dir /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky=
-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L depend=
ency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L d=
ependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/de<br>
&gt;=C2=A0 =C2=A0ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysro=
ot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/buil=
d/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debu=
g/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name strsim /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/strsim-0.8.0/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D8aa9952c97=
613c38 -C extra-filename=3D-8aa9952c97613c38 --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints<br>
&gt;=C2=A0 =C2=A0 allow -L /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rus=
t --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.=
2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build -=
-edition=3D2018 <a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_b=
lank">build.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi =
--crate-type bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debug-asse=
rtions=3Doff --cfg &#39;feature=3D&quot;cargo-fmt&quot;&#39; --cfg &#39;fea=
ture=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;rustfmt-format-d=
iff&quot;&#39; -C metadata=3D533f8374b6d41dfb -C extra-filename=3D-533f8374=
b6d41dfb --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustfmt=
-nightly-533f8374b6d41dfb -C linker=3D/home/pokybuild/yocto-worker/auh/buil=
d/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-r=
ust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps`<b=
r>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name rustc_lexer --editio=
n=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.=
0.0/src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.=
rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --=
crate-type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bi=
tcode=3Dno -C metadata=3Df811c840c35ab6d3 -C extra-filename=3D-f811c840c35a=
b6d3 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/=
core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/d=
eps --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/targ=
et-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-l=
inux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/b<br>
&gt;=C2=A0 =C2=A0uild/target/release/deps --cap-lints allow -L /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 0/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), m...<br>
&gt; |=C2=A0 =C2=A0 Compiling diff v0.1.11<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 1/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), m...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name diff /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/cargo_home/bitbake/diff-0.1.11/src/<a href=3D"http://lib.rs" rel=3D"=
noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddia=
gnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata=
,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D34e9b70cb21518fd=
 -C extra-filename=3D-34e9b70cb21518fd --out-dir /home/pokybuild/yocto-work=
er/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/buil=
d/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/release/deps --cap-lints al<br>
&gt;=C2=A0 =C2=A0low -L /home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust -=
-remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r=
0`<br>
&gt; | error[E0554]: `#![feature]` may not be used on the stable release ch=
annel<br>
&gt; |=C2=A0 =C2=A0--&gt; /home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec=
-0.6.10/lib.rs:33:32<br>
&gt; |=C2=A0 =C2=A0 |<br>
&gt; | 33 | #![cfg_attr(feature =3D &quot;union&quot;, feature(untagged_uni=
ons))]<br>
&gt; |=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^=
^^^^^^^^^<br>
&gt; |<br>
&gt; | error[E0554]: `#![feature]` may not be used on the stable release ch=
annel<br>
&gt; |=C2=A0 =C2=A0--&gt; /home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec=
-0.6.10/lib.rs:35:37<br>
&gt; |=C2=A0 =C2=A0 |<br>
&gt; | 35 | #![cfg_attr(feature =3D &quot;may_dangle&quot;, feature(dropck_=
eyepatch))]<br>
&gt; |=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; |<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 2/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name unicode_segmentation=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/src/<a=
 href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --e=
rror-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type=
 lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno=
 -C metadata=3Dea80c7cedc2e61b8 -C extra-filename=3D-ea80c7cedc2e61b8 --out=
-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --targ=
et i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-cc=
ld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/relea=
se/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar<br>
&gt;=C2=A0 =C2=A0get/release/deps --cap-lints allow -L /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-w=
orker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-workspace-hack v1.0.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 3/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name rustc_workspace_hack=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-workspace-hack-1.0.0/src/<a=
 href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --e=
rror-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type=
 lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno=
 -C metadata=3D4f12a631a3f78c68 -C extra-filename=3D-4f12a631a3f78c68 --out=
-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --targ=
et i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-cc=
ld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/relea=
se/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar<br>
&gt;=C2=A0 =C2=A0get/release/deps --cap-lints allow -L /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-w=
orker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; | error[E0554]: `#![feature]` may not be used on the stable release ch=
annel<br>
&gt; |=C2=A0 =C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-a=
p-graphviz-542.0.0/lib.rs:277:1<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|<br>
&gt; | 277 | #![feature(rustc_private, nll)]<br>
&gt; |=C2=A0 =C2=A0 =C2=A0| ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; |<br>
&gt; |=C2=A0 =C2=A0 Compiling bytecount v0.5.1<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 4/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name bytecount /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/bytecount-0.5.1/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Defcff43=
f975d063b -C extra-filename=3D-efcff43f975d063b --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap<br>
&gt;=C2=A0 =C2=A0-lints allow -L /home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/l=
ib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfm=
t/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling unicode_categories v0.1.1<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 5/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name unicode_categories /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode_categories-0.1.1/src/<a hre=
f=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error=
-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib=
 --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C =
metadata=3D1142561a6fb03929 -C extra-filename=3D-1142561a6fb03929 --out-dir=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i=
686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -=
L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/=
core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/d=
eps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/<br>
&gt;=C2=A0 =C2=A0release/deps --cap-lints allow -L /home/pokybuild/yocto-wo=
rker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/re=
cipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worke=
r/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/us=
r/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling crossbeam-utils v0.2.2<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 6/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name crossbeam_utils /hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/cargo_home/bitbake/crossbeam-utils-0.2.2/src/<a href=3D"h=
ttp://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-forma=
t=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emi=
t=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#3=
9;feature=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;use_std&quo=
t;&#39; -C metadata=3D5683e3e83934a5f7 -C extra-filename=3D-5683e3e83934a5f=
7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps=
 --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/buil=
d/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-=
rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linu=
x/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core<br>
&gt;=C2=A0 =C2=A02-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps=
 --extern cfg_if=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/relea=
se/deps/libcfg_if-81f5d828fe65528e.rmeta --cap-lints allow -L /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling owning_ref v0.4.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 7/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name owning_ref /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/owning_ref-0.4.0/src/<a href=3D"http://lib.=
rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson -=
-json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-in=
fo,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D432ad=
f1bd23f2849 -C extra-filename=3D-432adf1bd23f2849 --out-dir /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -=
C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependenc=
y=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/build/target/release/deps --e<br>
&gt;=C2=A0 =C2=A0xtern stable_deref_trait=3D/home/pokybuild/yocto-worker/au=
h/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar=
get/i686-poky-linux/release/deps/libstable_deref_trait-bf11e8975b7faa18.rme=
ta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust -=
-remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r=
0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 8/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; | error[E0433]: failed to resolve: could not find `property` in `unico=
de`<br>
&gt; |=C2=A0 =C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-a=
p-rustc_lexer-542.0.0/src/lib.rs:672:24<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|<br>
&gt; | 672 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0core::unicode::property::Patt=
ern_White_Space(c)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^ could not find `property` in `=
unicode`<br>
&gt; |<br>
&gt; | error[E0554]: `#![feature]` may not be used on the stable release ch=
annel<br>
&gt; |=C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc=
_lexer-542.0.0/src/lib.rs:3:43<br>
&gt; |=C2=A0 =C2=A0|<br>
&gt; | 3 | #![cfg_attr(not(feature =3D &quot;unicode-xid&quot;), feature(un=
icode_internals))]<br>
&gt; |=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; |<br>
&gt; |=C2=A0 =C2=A0 Compiling humantime v1.2.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 9/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name humantime /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/humantime-1.2.0/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D8de357e=
2c8248f8b -C extra-filename=3D-8de357e2c8248f8b --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --ext<br>
&gt;=C2=A0 =C2=A0ern quick_error=3D/home/pokybuild/yocto-worker/auh/build/b=
uild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-=
poky-linux/release/deps/libquick_error-83b8dad83398e3a4.rmeta --cap-lints a=
llow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-pref=
ix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling walkdir v2.2.9<br>
&gt; |=C2=A0 =C2=A0 Compiling textwrap v0.11.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name walkdir /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/cargo_home/bitbake/walkdir-2.2.9/src/<a href=3D"http://lib.rs" re=
l=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D9fe5824e18=
efee6f -C extra-filename=3D-9fe5824e18efee6f --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --extern<br>
&gt;=C2=A0 =C2=A0same_file=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-l=
inux/release/deps/libsame_file-b7f253f5d5610b25.rmeta --cap-lints allow -L =
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 11/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name textwrap /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/textwrap-0.11.0/src/<a href=3D"http://lib.rs"=
 rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --js=
on=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,=
metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D95d05764=
bcecd09a -C extra-filename=3D-95d05764bcecd09a --out-dir /home/pokybuild/yo=
cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2=
-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C l=
inker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --exte<br>
&gt;=C2=A0 =C2=A0rn unicode_width=3D/home/pokybuild/yocto-worker/auh/build/=
build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686=
-poky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta --cap-lint=
s allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-p=
refix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; | error: aborting due to previous error<br>
&gt; |<br>
&gt; | For more information about this error, try `rustc --explain E0554`.<=
br>
&gt; |=C2=A0 =C2=A0 Compiling getopts v0.2.19<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 12/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name getopts /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/cargo_home/bitbake/getopts-0.2.19/src/<a href=3D"http://lib.rs" r=
el=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D0873084cbf=
9afd94 -C extra-filename=3D-0873084cbf9afd94 --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --extern<br>
&gt;=C2=A0 =C2=A0 unicode_width=3D/home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-p=
oky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta --cap-lints =
allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-pre=
fix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling itertools v0.8.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 13/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name itertools /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/itertools-0.8.0/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi --crate-type lib --emit=3Ddep-info,metadata,=
link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&=
quot;default&quot;&#39; --cfg &#39;feature=3D&quot;use_std&quot;&#39; -C me=
tadata=3Dff7eca720ccd13a2 -C extra-filename=3D-ff7eca720ccd13a2 --out-dir /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps -C linker=3D/home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/=
auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/t=
arget/release/deps --extern either=3D/home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/rel=
ease/deps/libeither-<br>
&gt;=C2=A0 =C2=A0a3de0059007db7dd.rmeta --cap-lints allow`<br>
&gt; | error: could not compile `rustc-ap-graphviz`<br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 =C2=A0process didn&#39;t exit successfully: `rustc --crate-nam=
e graphviz --edition=3D2018 /home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-=
ap-graphviz-542.0.0/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"=
_blank">lib.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,=
artifacts --crate-type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3=
 -C embed-bitcode=3Dno -C metadata=3D616067e14d16bb5d -C extra-filename=3D-=
616067e14d16bb5d --out-dir /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-lin=
ux/release/deps --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-=
worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/=
wrapper/target-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target=
/i686-poky-linux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/=
auh/build/build/build/tmp/work/core2-32-poky-linux/rustf<br>
&gt;=C2=A0 =C2=A0mt/1.4.2-r0/build/target/release/deps --cap-lints allow -L=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0` (exit status: 1)<br>
&gt; | warning: build failed, waiting for other jobs to finish...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 14/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 15/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 16/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 17/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 18/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 19/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; | error: aborting due to 2 previous errors<br>
&gt; |<br>
&gt; | For more information about this error, try `rustc --explain E0554`.<=
br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 20/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 21/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 22/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 24/167: syn(<a hre=
f=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), c=
rossbeam-...<br>
&gt; | error[E0599]: no method named `is_xid_start` found for type `char` i=
n the current scope<br>
&gt; |=C2=A0 =C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-a=
p-rustc_lexer-542.0.0/src/lib.rs:689:33<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|<br>
&gt; | 689 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (c &gt; &#39=
;\x7f&#39; &amp;&amp; c.is_xid_start())<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^=
^^^^^^^ method not found in `char`<br>
&gt; |<br>
&gt; | error[E0599]: no method named `is_xid_continue` found for type `char=
` in the current scope<br>
&gt; |=C2=A0 =C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-a=
p-rustc_lexer-542.0.0/src/lib.rs:708:33<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|<br>
&gt; | 708 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (c &gt; &#39=
;\x7f&#39; &amp;&amp; c.is_xid_continue())<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^=
^^^^^^^^^^ method not found in `char`<br>
&gt; |<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 25/167: syn(<a hre=
f=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), c=
rossbeam-...<br>
&gt; | error: aborting due to 4 previous errors<br>
&gt; |<br>
&gt; | Some errors have detailed explanations: E0433, E0554, E0599.<br>
&gt; | For more information about an error, try `rustc --explain E0433`.<br=
>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 26/167: syn(<a href=
=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), cr=
ossbeam-...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 27/167: syn(<a href=
=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), cr=
ossbeam-...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 28/167: syn(<a href=
=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), cr=
ossbeam-...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 29/167: syn(<a href=
=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), cr=
ossbeam-...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 30/167: crossbeam-ut=
ils, serde(bu...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 31/167: crossbeam-ut=
ils, serde(bu...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 32/167: crossbeam-ut=
ils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 33/167: crossbeam-=
utils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 34/167: crossbeam-=
utils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 35/167: crossbeam-=
utils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 36/167: crossbeam-=
utils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 37/167: crossbeam-=
utils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 38/167: utf8-range=
s, cc, walkdir,...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 39/167: utf8-ranges, cc=
, walkdir,...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 40/167: cc, walkdir, ge=
topts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 41/167: cc, walkdir, ge=
topts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 42/167: cc, walkdir, ge=
topts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 43/167: cc, walkdir, ge=
topts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 44/167: cc, walkdir, ge=
topts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 45/167: cc, walkdir, =
getopts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 46/167: cc, walkdir, =
getopts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 47/167: cc, walkdir, =
getopts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 48/167: cc, walkdir, =
getopts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 49/167: cc, walkdir, =
getopts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 50/167: cc, walkdir, =
getopts, sem...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 51/167: cc, walkdir, =
getopts, str...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 52/167: cc, walkdir, get=
opts, dif...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 53/167: cc, walkdir, get=
opts, dif...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 54/167: cc, walkdir, get=
opts, dif...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 55/167: walkdir, getopts=
, diff, r...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 56/167: getopts, diff, r=
ustc-dema...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 57/167: getopts, rustc-d=
emangle, ...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 58/167: getopts, iter=
tools<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 59/167: getopts<br>
&gt; | error: build failed<br>
&gt; | WARNING: exit code 101 from a shell command.<br>
&gt; | ERROR: Execution of &#39;/home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/temp/run.do_compile.2=
104&#39; failed with exit code 101:<br>
&gt; |=C2=A0 =C2=A0 Compiling proc-macro2 v0.4.30<br>
&gt; |=C2=A0 =C2=A0 Compiling unicode-xid v0.1.0<br>
&gt; |=C2=A0 =C2=A0 Compiling syn v0.15.42<br>
&gt; |=C2=A0 =C2=A0 Compiling libc v0.2.60<br>
&gt; |=C2=A0 =C2=A0 Compiling cfg-if v0.1.9<br>
&gt; |=C2=A0 =C2=A0 Compiling serde v1.0.97<br>
&gt; |=C2=A0 =C2=A0 Compiling spin v0.5.0<br>
&gt; |=C2=A0 =C2=A0 Compiling rand_core v0.4.0<br>
&gt; |=C2=A0 =C2=A0 Compiling autocfg v0.1.5<br>
&gt; |=C2=A0 =C2=A0 Compiling log v0.4.7<br>
&gt; |=C2=A0 =C2=A0 Compiling semver-parser v0.7.0<br>
&gt; |=C2=A0 =C2=A0 Compiling arrayvec v0.4.11<br>
&gt; |=C2=A0 =C2=A0 Compiling scopeguard v0.3.3<br>
&gt; |=C2=A0 =C2=A0 Compiling nodrop v0.1.13<br>
&gt; |=C2=A0 =C2=A0 Compiling memoffset v0.2.1<br>
&gt; |=C2=A0 =C2=A0 Compiling byteorder v1.3.2<br>
&gt; |=C2=A0 =C2=A0 Compiling stable_deref_trait v1.1.1<br>
&gt; |=C2=A0 =C2=A0 Compiling smallvec v0.6.10<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-rayon-core v0.2.0<br>
&gt; |=C2=A0 =C2=A0 Compiling memchr v2.2.1<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-rayon v0.2.0<br>
&gt; |=C2=A0 =C2=A0 Compiling either v1.5.2<br>
&gt; |=C2=A0 =C2=A0 Compiling unicode-width v0.1.5<br>
&gt; |=C2=A0 =C2=A0 Compiling indexmap v1.0.2<br>
&gt; |=C2=A0 =C2=A0 Compiling bitflags v1.1.0<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-ap-graphviz v542.0.0<br>
&gt; |=C2=A0 =C2=A0 Compiling cc v1.0.38<br>
&gt; |=C2=A0 =C2=A0 Compiling ansi_term v0.11.0<br>
&gt; |=C2=A0 =C2=A0 Compiling ucd-util v0.1.5<br>
&gt; |=C2=A0 =C2=A0 Compiling ryu v1.0.0<br>
&gt; |=C2=A0 =C2=A0 Compiling failure_derive v0.1.5<br>
&gt; |=C2=A0 =C2=A0 Compiling utf8-ranges v1.0.3<br>
&gt; |=C2=A0 =C2=A0 Compiling scoped-tls v1.0.0<br>
&gt; |=C2=A0 =C2=A0 Compiling unicode-segmentation v1.3.0<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-ap-rustc_target v542.0.0<br>
&gt; |=C2=A0 =C2=A0 Compiling termcolor v1.0.5<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-demangle v0.1.15<br>
&gt; |=C2=A0 =C2=A0 Compiling itoa v0.4.4<br>
&gt; |=C2=A0 =C2=A0 Compiling quick-error v1.2.2<br>
&gt; |=C2=A0 =C2=A0 Compiling fnv v1.0.6<br>
&gt; |=C2=A0 =C2=A0 Compiling same-file v1.0.5<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-ap-syntax v542.0.0<br>
&gt; |=C2=A0 =C2=A0 Compiling vec_map v0.8.1<br>
&gt; |=C2=A0 =C2=A0 Compiling strsim v0.8.0<br>
&gt; |=C2=A0 =C2=A0 Compiling rustfmt-nightly v1.4.2 (/home/pokybuild/yocto=
-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
/git)<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-ap-rustc_lexer v542.0.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/proc-macro2-0.4.30/<a href=3D"http:=
//build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-forma=
t=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-in=
fo,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;proc-macro&quot;&#39=
; -C metadata=3Ddf9c0358a8f4cef2 -C extra-filename=3D-df9c0358a8f4cef2 --ou=
t-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/build/target/release/build/proc-macro2-df9c0358=
a8f4cef2 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<=
br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name unicode_xid /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/cargo_home/bitbake/unicode-xid-0.1.0/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#=
39;feature=3D&quot;default&quot;&#39; -C metadata=3D11f58d24801d743d -C ext=
ra-filename=3D-11f58d24801d743d --out-dir /home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe=
t/release/deps -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L=
 dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints a=
llow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name cfg_if /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/cfg-if-0.1.9/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D81f5d828fe=
65528e -C extra-filename=3D-81f5d828fe65528e --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints<br>
&gt;=C2=A0 =C2=A0 allow -L /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rus=
t --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.=
2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/syn-0.15.42/<a href=3D"http://build=
.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djso=
n --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,link=
 -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&quot=
;clone-impls&quot;&#39; --cfg &#39;feature=3D&quot;default&quot;&#39; --cfg=
 &#39;feature=3D&quot;derive&quot;&#39; --cfg &#39;feature=3D&quot;extra-tr=
aits&quot;&#39; --cfg &#39;feature=3D&quot;full&quot;&#39; --cfg &#39;featu=
re=3D&quot;parsing&quot;&#39; --cfg &#39;feature=3D&quot;printing&quot;&#39=
; --cfg &#39;feature=3D&quot;proc-macro&quot;&#39; --cfg &#39;feature=3D&qu=
ot;quote&quot;&#39; --cfg &#39;feature=3D&quot;visit&quot;&#39; -C metadata=
=3D61f79f9dccfd40ba -C extra-filename=3D-61f79f9dccfd40ba --out-dir /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/release/build/syn-61f79f9dccfd40ba -C linker=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybui=
ld/yocto-worker/auh/build/buil<br>
&gt;=C2=A0 =C2=A0d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/buil=
d/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/libc-0.2.60/<a href=3D"http://build=
.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djso=
n --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,link=
 -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&quot=
;default&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C metadata=
=3D94ebb09615a0f486 -C extra-filename=3D-94ebb09615a0f486 --out-dir /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/release/build/libc-94ebb09615a0f486 -C linker=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/serde-1.0.97/<a href=3D"http://buil=
d.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djs=
on --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,lin=
k -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&quo=
t;default&quot;&#39; --cfg &#39;feature=3D&quot;derive&quot;&#39; --cfg &#3=
9;feature=3D&quot;serde_derive&quot;&#39; --cfg &#39;feature=3D&quot;std&qu=
ot;&#39; -C metadata=3D397ac514ce86af00 -C extra-filename=3D-397ac514ce86af=
00 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/serde-397ac51=
4ce86af00 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tm=
p/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L depe=
ndency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`=
<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name spin /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/cargo_home/bitbake/spin-0.5.0/src/<a href=3D"http://lib.rs" rel=3D"n=
oreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddiag=
nostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata,=
link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D7dd7ec836f8c506a =
-C extra-filename=3D-7dd7ec836f8c506a --out-dir /home/pokybuild/yocto-worke=
r/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build=
/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/build/target/release/deps --cap-lints all<br>
&gt;=C2=A0 =C2=A0ow -L /home/pokybuild/yocto-worker/auh/build/build/build/t=
mp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --=
remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0=
`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name rand_core /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/rand_core-0.4.0/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;feature=3D=
&quot;alloc&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C metadat=
a=3D966535236305dc5a -C extra-filename=3D-966535236305dc5a --out-dir /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-pok=
y-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L =
dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/ru<br>
&gt;=C2=A0 =C2=A0stfmt/1.4.2-r0/build/target/release/deps --cap-lints allow=
 -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name autocfg /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/cargo_home/bitbake/autocfg-0.1.5/src/<a href=3D"http://lib.rs" re=
l=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi --crate-type lib --emit=3Ddep-info,metadata,lin=
k -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D9c7ae0aed7f=
c9823 -C extra-filename=3D-9c7ae0aed7fc9823 --out-dir /home/pokybuild/yocto=
-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
/build/target/release/deps -C linker=3D/home/pokybuild/yocto-worker/auh/bui=
ld/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-=
rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -=
-cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/log-0.4.7/<a href=3D"http://build.r=
s" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djson =
--json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,link -=
C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&quot;s=
td&quot;&#39; -C metadata=3De098f27b12050390 -C extra-filename=3D-e098f27b1=
2050390 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/wo=
rk/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/log-e098=
f27b12050390 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L d=
ependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints all=
ow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name semver_parser /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/<a href=3D"http:=
//lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3D=
dep-info,metadata,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C m=
etadata=3Df3b50fe98e08dd8b -C extra-filename=3D-f3b50fe98e08dd8b --out-dir =
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/release/deps -C linker=3D/home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker=
/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/=
target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/arrayvec-0.4.11/<a href=3D"http://b=
uild.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-inf=
o,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D9e8f7b=
244197be3e -C extra-filename=3D-9e8f7b244197be3e --out-dir /home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/build/target/release/build/arrayvec-9e8f7b244197be3e -C linker=3D/hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name scopeguard /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/scopeguard-0.3.3/src/<a href=3D"http://lib.=
rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson -=
-json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-in=
fo,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dfab12=
0a9dd5bad14 -C extra-filename=3D-fab120a9dd5bad14 --out-dir /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -=
C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependenc=
y=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/build/target/release/deps --c<br>
&gt;=C2=A0 =C2=A0ap-lints allow -L /home/pokybuild/yocto-worker/auh/build/b=
uild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr=
/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rust=
fmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name nodrop /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/nodrop-0.1.13/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Da17fe61129=
e65b62 -C extra-filename=3D-a17fe61129e65b62 --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lint<br>
&gt;=C2=A0 =C2=A0s allow -L /home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/ru=
st --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4=
.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name memoffset /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/memoffset-0.2.1/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D2f78f4f=
ec416c99f -C extra-filename=3D-2f78f4fec416c99f --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap<br>
&gt;=C2=A0 =C2=A0-lints allow -L /home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/l=
ib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfm=
t/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/byteorder-1.3.2/<a href=3D"http://b=
uild.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-inf=
o,link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=
=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C me=
tadata=3D539ed0edcb1553e7 -C extra-filename=3D-539ed0edcb1553e7 --out-dir /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/build/byteorder-539ed0edcb1553e7 =
-C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name stable_deref_trait /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/stable_deref_trait-1.1.1/src/<a hre=
f=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error=
-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib=
 --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --c=
fg &#39;feature=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;std&q=
uot;&#39; -C metadata=3Dbf11e8975b7faa18 -C extra-filename=3D-bf11e8975b7fa=
a18 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/de=
ps --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/bu=
ild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/targe=
t-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-li=
nux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/co<br>
&gt;=C2=A0 =C2=A0re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/de=
ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust -=
-remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r=
0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name smallvec /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/smallvec-0.6.10/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;feature=3D&qu=
ot;default&quot;&#39; --cfg &#39;feature=3D&quot;may_dangle&quot;&#39; --cf=
g &#39;feature=3D&quot;std&quot;&#39; --cfg &#39;feature=3D&quot;union&quot=
;&#39; -C metadata=3Dc3ebde62e7bb47d1 -C extra-filename=3D-c3ebde62e7bb47d1=
 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps =
--target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-r=
ust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux=
/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh<br>
&gt;=C2=A0 =C2=A0/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/release/deps --cap-lints allow -L /home/pokybuild/yocto=
-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-wo=
rker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D=
/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-core-0.2.0/<a href=3D"h=
ttp://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-f=
ormat=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Dde=
p-info,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3De=
a88230473b39d14 -C extra-filename=3D-ea88230473b39d14 --out-dir /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/build/target/release/build/rustc-rayon-core-ea88230473b39d14 -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/memchr-2.2.1/<a href=3D"http://buil=
d.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djs=
on --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,lin=
k -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&quo=
t;default&quot;&#39; --cfg &#39;feature=3D&quot;use_std&quot;&#39; -C metad=
ata=3Dce8d38ceb83b8294 -C extra-filename=3D-ce8d38ceb83b8294 --out-dir /hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/build/target/release/build/memchr-ce8d38ceb83b8294 -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-rayon-0.2.0/<a href=3D"http:/=
/build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-inf=
o,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D5cea4c=
63c5dbd532 -C extra-filename=3D-5cea4c63c5dbd532 --out-dir /home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/build/target/release/build/rustc-rayon-5cea4c63c5dbd532 -C linker=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name either /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dea12658328=
4a07f6 -C extra-filename=3D-ea126583284a07f6 --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints<br>
&gt;=C2=A0 =C2=A0 allow -L /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rus=
t --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.=
2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name unicode_width /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/unicode-width-0.1.5/src/<a href=3D"http:=
//lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3D=
dep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;fe=
ature=3D&quot;default&quot;&#39; -C metadata=3Df9067b939a2e9ee3 -C extra-fi=
lename=3D-f9067b939a2e9ee3 --out-dir /home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i68=
6-poky-linux/release/deps --target i686-poky-linux -C linker=3D/home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/pokybuild/yocto-wo=
rker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/bu=
ild/target/i686-poky-linux/release/deps -L dependency=3D/home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
<br>
&gt;=C2=A0 =C2=A0r0/build/target/release/deps --cap-lints allow -L /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name indexmap /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/indexmap-1.0.2/src/<a href=3D"http://lib.rs" =
rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --jso=
n=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,m=
etadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Df0d6daf29=
23716e0 -C extra-filename=3D-f0d6daf2923716e0 --out-dir /home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C li=
nker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/release/deps --cap-l<br>
&gt;=C2=A0 =C2=A0ints allow -L /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib=
/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/=
1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/bitflags-1.1.0/<a href=3D"http://bu=
ild.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,l=
ink -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&q=
uot;default&quot;&#39; -C metadata=3D8ecc663c609fc416 -C extra-filename=3D-=
8ecc663c609fc416 --out-dir /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build=
/bitflags-8ecc663c609fc416 -C linker=3D/home/pokybuild/yocto-worker/auh/bui=
ld/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-=
rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -=
-cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name graphviz --edition=
=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-graphviz-542.0.0/=
<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> -=
-error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-ty=
pe lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3D=
no -C metadata=3D616067e14d16bb5d -C extra-filename=3D-616067e14d16bb5d --o=
ut-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --ta=
rget i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-=
ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/rel=
ease/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe<br>
&gt;=C2=A0 =C2=A0t/release/deps --cap-lints allow -L /home/pokybuild/yocto-=
worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/=
recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-wor=
ker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/=
usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name cc /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/cargo_home/bitbake/cc-1.0.38/src/<a href=3D"http://lib.rs" rel=3D"nore=
ferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddiagnos=
tic-rendered-ansi --crate-type lib --emit=3Ddep-info,metadata,link -C embed=
-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D99eeff8d683be0c9 -C e=
xtra-filename=3D-99eeff8d683be0c9 --out-dir /home/pokybuild/yocto-worker/au=
h/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar=
get/release/deps -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld =
-L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work=
/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints=
 allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name either /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/either-1.5.2/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3Da=
3de0059007db7dd -C extra-filename=3D-a3de0059007db7dd --out-dir /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/build/target/release/deps -C linker=3D/home/pokybuild/yocto-work=
er/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrap=
per/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/=
build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/rele=
ase/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name ansi_term /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/ansi_term-0.11.0/src/<a href=3D"http://lib.r=
s" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --=
json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-inf=
o,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D978916=
16a3048472 -C extra-filename=3D-97891616a3048472 --out-dir /home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C=
 linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2=
-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --ca<br>
&gt;=C2=A0 =C2=A0p-lints allow -L /home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/=
lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustf=
mt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name ucd_util /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/ucd-util-0.1.5/src/<a href=3D"http://lib.rs" =
rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --jso=
n=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,m=
etadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dc66dafd72=
6901704 -C extra-filename=3D-c66dafd726901704 --out-dir /home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C li=
nker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/release/deps --cap-l<br>
&gt;=C2=A0 =C2=A0ints allow -L /home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib=
/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/=
1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/ryu-1.0.0/<a href=3D"http://build.r=
s" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-format=3Djson =
--json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-info,link -=
C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3Dcf40bafebc5d9e=
2a -C extra-filename=3D-cf40bafebc5d9e2a --out-dir /home/pokybuild/yocto-wo=
rker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/bu=
ild/target/release/build/ryu-cf40bafebc5d9e2a -C linker=3D/home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/a=
uh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/ta=
rget/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/failure_derive-0.1.5/<a href=3D"htt=
p://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> --error-for=
mat=3Djson --json=3Ddiagnostic-rendered-ansi --crate-type bin --emit=3Ddep-=
info,link -C embed-bitcode=3Dno -C debug-assertions=3Doff -C metadata=3D500=
d9a3c0d7056cc -C extra-filename=3D-500d9a3c0d7056cc --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/release/build/failure_derive-500d9a3c0d7056cc -C link=
er=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name utf8_ranges /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/cargo_home/bitbake/utf8-ranges-1.0.3/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dca0=
4778dfdc33722 -C extra-filename=3D-ca04778dfdc33722 --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux=
 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -<br>
&gt;=C2=A0 =C2=A0-cap-lints allow -L /home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/u=
sr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/ru=
stfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name scoped_tls /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/scoped-tls-1.0.0/src/<a href=3D"http://lib.=
rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson -=
-json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-in=
fo,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D4300e=
3ebfe432670 -C extra-filename=3D-4300e3ebfe432670 --out-dir /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -=
C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependenc=
y=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/build/target/release/deps --c<br>
&gt;=C2=A0 =C2=A0ap-lints allow -L /home/pokybuild/yocto-worker/auh/build/b=
uild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr=
/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/buil=
d/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rust=
fmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name unicode_segmentation=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/src/<a=
 href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --e=
rror-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type=
 lib --emit=3Ddep-info,metadata,link -C embed-bitcode=3Dno -C debug-asserti=
ons=3Doff -C metadata=3D609f5d0c875e0967 -C extra-filename=3D-609f5d0c875e0=
967 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -C linker=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/build/target/release/deps --cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build -=
-edition=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work=
/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_tar=
get-542.0.0/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank=
">build.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi --cr=
ate-type bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debug-assertio=
ns=3Doff -C metadata=3Db1efc0d6a47b6a5c -C extra-filename=3D-b1efc0d6a47b6a=
5c --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-rust=
c_target-b1efc0d6a47b6a5c -C linker=3D/home/pokybuild/yocto-worker/auh/buil=
d/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-r=
ust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --=
cap-lints allow`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name termcolor /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/termcolor-1.0.5/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Daf0d11e=
6713415b8 -C extra-filename=3D-af0d11e6713415b8 --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap<br>
&gt;=C2=A0 =C2=A0-lints allow -L /home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/l=
ib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfm=
t/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name rustc_demangle /home=
/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/=
rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-demangle-0.1.15/src/<a href=3D"ht=
tp://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=
=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=
=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadat=
a=3Df5028ac44d69eb7a -C extra-filename=3D-f5028ac44d69eb7a --out-dir /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-pok=
y-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L =
dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release<br>
&gt;=C2=A0 =C2=A0/deps --cap-lints allow -L /home/pokybuild/yocto-worker/au=
h/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sy=
sroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/d=
ebug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name itoa /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/cargo_home/bitbake/itoa-0.4.4/src/<a href=3D"http://lib.rs" rel=3D"n=
oreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddiag=
nostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata,=
link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#39;feature=3D&quot;defa=
ult&quot;&#39; --cfg &#39;feature=3D&quot;std&quot;&#39; -C metadata=3Defd7=
d4d7b4402894 -C extra-filename=3D-efd7d4d7b4402894 --out-dir /home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux =
-C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependen=
cy=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.<br>
&gt;=C2=A0 =C2=A04.2-r0/build/target/release/deps --cap-lints allow -L /hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name quick_error /home/po=
kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rus=
tfmt/1.4.2-r0/cargo_home/bitbake/quick-error-1.2.2/src/<a href=3D"http://li=
b.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson=
 --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-=
info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D83b=
8dad83398e3a4 -C extra-filename=3D-83b8dad83398e3a4 --out-dir /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux=
 -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L depen=
dency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps -<br>
&gt;=C2=A0 =C2=A0-cap-lints allow -L /home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/u=
sr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/ru=
stfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name fnv /home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/cargo_home/bitbake/fnv-1.0.6/<a href=3D"http://lib.rs" rel=3D"norefer=
rer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddiagnostic=
-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata,link -=
C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Dceb682049fbd227a -C ext=
ra-filename=3D-ceb682049fbd227a --out-dir /home/pokybuild/yocto-worker/auh/=
build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/targe=
t/i686-poky-linux/release/deps --target i686-poky-linux -C linker=3D/home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/pokybuild/yoc=
to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-=
r0/build/target/i686-poky-linux/release/deps -L dependency=3D/home/pokybuil=
d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1=
.4.2-r0/build/target/release/deps --cap-lints allow -L<br>
&gt;=C2=A0 =C2=A0/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor=
k/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-=
path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c=
ore2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name same_file /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/same-file-1.0.5/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Db7f253f=
5d5610b25 -C extra-filename=3D-b7f253f5d5610b25 --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap<br>
&gt;=C2=A0 =C2=A0-lints allow -L /home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/l=
ib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfm=
t/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build -=
-edition=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work=
/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-syntax-54=
2.0.0/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi --crate-ty=
pe bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debug-assertions=3Do=
ff -C metadata=3D5aebbe0c13823bdd -C extra-filename=3D-5aebbe0c13823bdd --o=
ut-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustc-ap-syntax-5ae=
bbe0c13823bdd -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-rust-ccld -L =
dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co=
re2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints al=
low`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name vec_map /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/cargo_home/bitbake/vec_map-0.8.1/src/<a href=3D"http://lib.rs" re=
l=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D5831430b43=
ab8372 -C extra-filename=3D-5831430b43ab8372 --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lin<br>
&gt;=C2=A0 =C2=A0ts allow -L /home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/r=
ust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.=
4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name semver_parser /home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/cargo_home/bitbake/semver-parser-0.7.0/src/<a href=3D"http:=
//lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3D=
json --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3D=
dep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=
=3Dba877faa789ab53c -C extra-filename=3D-ba877faa789ab53c --out-dir /home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky=
-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L depend=
ency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32=
-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L d=
ependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/de<br>
&gt;=C2=A0 =C2=A0ps --cap-lints allow -L /home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysro=
ot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/buil=
d/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debu=
g/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name strsim /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/cargo_home/bitbake/strsim-0.8.0/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D8aa9952c97=
613c38 -C extra-filename=3D-8aa9952c97613c38 --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --cap-lints<br>
&gt;=C2=A0 =C2=A0 allow -L /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rus=
t --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.=
2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name build_script_build -=
-edition=3D2018 <a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_b=
lank">build.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi =
--crate-type bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debug-asse=
rtions=3Doff --cfg &#39;feature=3D&quot;cargo-fmt&quot;&#39; --cfg &#39;fea=
ture=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;rustfmt-format-d=
iff&quot;&#39; -C metadata=3D533f8374b6d41dfb -C extra-filename=3D-533f8374=
b6d41dfb --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/build/rustfmt=
-nightly-533f8374b6d41dfb -C linker=3D/home/pokybuild/yocto-worker/auh/buil=
d/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/build-r=
ust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build=
/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps`<b=
r>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name rustc_lexer --editio=
n=3D2018 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc_lexer-542.=
0.0/src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.=
rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --=
crate-type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bi=
tcode=3Dno -C metadata=3Df811c840c35ab6d3 -C extra-filename=3D-f811c840c35a=
b6d3 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/=
core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/d=
eps --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/targ=
et-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-l=
inux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/b<br>
&gt;=C2=A0 =C2=A0uild/target/release/deps --cap-lints allow -L /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 0/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), m...<br>
&gt; |=C2=A0 =C2=A0 Compiling diff v0.1.11<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 1/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), m...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name diff /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/cargo_home/bitbake/diff-0.1.11/src/<a href=3D"http://lib.rs" rel=3D"=
noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=3Ddia=
gnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,metadata=
,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D34e9b70cb21518fd=
 -C extra-filename=3D-34e9b70cb21518fd --out-dir /home/pokybuild/yocto-work=
er/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/buil=
d/target/i686-poky-linux/release/deps --target i686-poky-linux -C linker=3D=
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/home/p=
okybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ru=
stfmt/1.4.2-r0/build/target/release/deps --cap-lints al<br>
&gt;=C2=A0 =C2=A0low -L /home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust -=
-remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r=
0`<br>
&gt; | error[E0554]: `#![feature]` may not be used on the stable release ch=
annel<br>
&gt; |=C2=A0 =C2=A0--&gt; /home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec=
-0.6.10/lib.rs:33:32<br>
&gt; |=C2=A0 =C2=A0 |<br>
&gt; | 33 | #![cfg_attr(feature =3D &quot;union&quot;, feature(untagged_uni=
ons))]<br>
&gt; |=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^=
^^^^^^^^^<br>
&gt; |<br>
&gt; | error[E0554]: `#![feature]` may not be used on the stable release ch=
annel<br>
&gt; |=C2=A0 =C2=A0--&gt; /home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/smallvec=
-0.6.10/lib.rs:35:37<br>
&gt; |=C2=A0 =C2=A0 |<br>
&gt; | 35 | #![cfg_attr(feature =3D &quot;may_dangle&quot;, feature(dropck_=
eyepatch))]<br>
&gt; |=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; |<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 2/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name unicode_segmentation=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode-segmentation-1.3.0/src/<a=
 href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --e=
rror-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type=
 lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno=
 -C metadata=3Dea80c7cedc2e61b8 -C extra-filename=3D-ea80c7cedc2e61b8 --out=
-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --targ=
et i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-cc=
ld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/relea=
se/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar<br>
&gt;=C2=A0 =C2=A0get/release/deps --cap-lints allow -L /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-w=
orker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling rustc-workspace-hack v1.0.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 3/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name rustc_workspace_hack=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-workspace-hack-1.0.0/src/<a=
 href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --e=
rror-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type=
 lib --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno=
 -C metadata=3D4f12a631a3f78c68 -C extra-filename=3D-4f12a631a3f78c68 --out=
-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --targ=
et i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-cc=
ld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/relea=
se/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar<br>
&gt;=C2=A0 =C2=A0get/release/deps --cap-lints allow -L /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-w=
orker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=
=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; | error[E0554]: `#![feature]` may not be used on the stable release ch=
annel<br>
&gt; |=C2=A0 =C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-a=
p-graphviz-542.0.0/lib.rs:277:1<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|<br>
&gt; | 277 | #![feature(rustc_private, nll)]<br>
&gt; |=C2=A0 =C2=A0 =C2=A0| ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; |<br>
&gt; |=C2=A0 =C2=A0 Compiling bytecount v0.5.1<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 4/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name bytecount /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/bytecount-0.5.1/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3Defcff43=
f975d063b -C extra-filename=3D-efcff43f975d063b --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --cap<br>
&gt;=C2=A0 =C2=A0-lints allow -L /home/pokybuild/yocto-worker/auh/build/bui=
ld/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/l=
ib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/=
build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfm=
t/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling unicode_categories v0.1.1<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 5/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), s...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name unicode_categories /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/cargo_home/bitbake/unicode_categories-0.1.1/src/<a hre=
f=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error=
-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib=
 --emit=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C =
metadata=3D1142561a6fb03929 -C extra-filename=3D-1142561a6fb03929 --out-dir=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps --target i=
686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -=
L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/=
core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/d=
eps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/<br>
&gt;=C2=A0 =C2=A0release/deps --cap-lints allow -L /home/pokybuild/yocto-wo=
rker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/re=
cipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/yocto-worke=
r/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/us=
r/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling crossbeam-utils v0.2.2<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 6/167: vec_map=
, syn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">buil=
d.rs</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name crossbeam_utils /hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/cargo_home/bitbake/crossbeam-utils-0.2.2/src/<a href=3D"h=
ttp://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-forma=
t=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emi=
t=3Ddep-info,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno --cfg &#3=
9;feature=3D&quot;default&quot;&#39; --cfg &#39;feature=3D&quot;use_std&quo=
t;&#39; -C metadata=3D5683e3e83934a5f7 -C extra-filename=3D-5683e3e83934a5f=
7 --out-dir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor=
e2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps=
 --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-worker/auh/buil=
d/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-=
rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build/buil=
d/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linu=
x/release/deps -L dependency=3D/home/pokybuild/yocto-worker/auh/build/build=
/build/tmp/work/core<br>
&gt;=C2=A0 =C2=A02-32-poky-linux/rustfmt/1.4.2-r0/build/target/release/deps=
 --extern cfg_if=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w=
ork/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/relea=
se/deps/libcfg_if-81f5d828fe65528e.rmeta --cap-lints allow -L /home/pokybui=
ld/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/=
1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling owning_ref v0.4.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 7/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name owning_ref /home/pok=
ybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rust=
fmt/1.4.2-r0/cargo_home/bitbake/owning_ref-0.4.0/src/<a href=3D"http://lib.=
rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson -=
-json=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-in=
fo,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D432ad=
f1bd23f2849 -C extra-filename=3D-432adf1bd23f2849 --out-dir /home/pokybuild=
/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.=
4.2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -=
C linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependenc=
y=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po=
ky-linux/rustfmt/1.4.2-r0/build/target/release/deps --e<br>
&gt;=C2=A0 =C2=A0xtern stable_deref_trait=3D/home/pokybuild/yocto-worker/au=
h/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/tar=
get/i686-poky-linux/release/deps/libstable_deref_trait-bf11e8975b7faa18.rme=
ta --cap-lints allow -L /home/pokybuild/yocto-worker/auh/build/build/build/=
tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust -=
-remap-path-prefix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp=
/work/core2-32-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r=
0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 8/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; | error[E0433]: failed to resolve: could not find `property` in `unico=
de`<br>
&gt; |=C2=A0 =C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-a=
p-rustc_lexer-542.0.0/src/lib.rs:672:24<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|<br>
&gt; | 672 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0core::unicode::property::Patt=
ern_White_Space(c)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^ could not find `property` in `=
unicode`<br>
&gt; |<br>
&gt; | error[E0554]: `#![feature]` may not be used on the stable release ch=
annel<br>
&gt; |=C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/build/tmp/=
work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-ap-rustc=
_lexer-542.0.0/src/lib.rs:3:43<br>
&gt; |=C2=A0 =C2=A0|<br>
&gt; | 3 | #![cfg_attr(not(feature =3D &quot;unicode-xid&quot;), feature(un=
icode_internals))]<br>
&gt; |=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; |<br>
&gt; |=C2=A0 =C2=A0 Compiling humantime v1.2.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 9/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name humantime /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/humantime-1.2.0/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info=
,metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D8de357e=
2c8248f8b -C extra-filename=3D-8de357e2c8248f8b --out-dir /home/pokybuild/y=
octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.=
2-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C =
linker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --ext<br>
&gt;=C2=A0 =C2=A0ern quick_error=3D/home/pokybuild/yocto-worker/auh/build/b=
uild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-=
poky-linux/release/deps/libquick_error-83b8dad83398e3a4.rmeta --cap-lints a=
llow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-pref=
ix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p=
oky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling walkdir v2.2.9<br>
&gt; |=C2=A0 =C2=A0 Compiling textwrap v0.11.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name walkdir /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/cargo_home/bitbake/walkdir-2.2.9/src/<a href=3D"http://lib.rs" re=
l=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D9fe5824e18=
efee6f -C extra-filename=3D-9fe5824e18efee6f --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --extern<br>
&gt;=C2=A0 =C2=A0same_file=3D/home/pokybuild/yocto-worker/auh/build/build/b=
uild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-l=
inux/release/deps/libsame_file-b7f253f5d5610b25.rmeta --cap-lints allow -L =
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-l=
inux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/ho=
me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu=
x/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 11/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name textwrap /home/pokyb=
uild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfm=
t/1.4.2-r0/cargo_home/bitbake/textwrap-0.11.0/src/<a href=3D"http://lib.rs"=
 rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --js=
on=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,=
metadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D95d05764=
bcecd09a -C extra-filename=3D-95d05764bcecd09a --out-dir /home/pokybuild/yo=
cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2=
-r0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C l=
inker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/hom=
e/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux=
/rustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=
=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok=
y-linux/rustfmt/1.4.2-r0/build/target/release/deps --exte<br>
&gt;=C2=A0 =C2=A0rn unicode_width=3D/home/pokybuild/yocto-worker/auh/build/=
build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686=
-poky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta --cap-lint=
s allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core=
2-32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-p=
refix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3=
2-poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; | error: aborting due to previous error<br>
&gt; |<br>
&gt; | For more information about this error, try `rustc --explain E0554`.<=
br>
&gt; |=C2=A0 =C2=A0 Compiling getopts v0.2.19<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 12/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name getopts /home/pokybu=
ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt=
/1.4.2-r0/cargo_home/bitbake/getopts-0.2.19/src/<a href=3D"http://lib.rs" r=
el=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --json=
=3Ddiagnostic-rendered-ansi,artifacts --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C metadata=3D0873084cbf=
9afd94 -C extra-filename=3D-0873084cbf9afd94 --out-dir /home/pokybuild/yoct=
o-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r=
0/build/target/i686-poky-linux/release/deps --target i686-poky-linux -C lin=
ker=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0/wrapper/target-rust-ccld -L dependency=3D/home/=
pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/r=
ustfmt/1.4.2-r0/build/target/i686-poky-linux/release/deps -L dependency=3D/=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps --extern<br>
&gt;=C2=A0 =C2=A0 unicode_width=3D/home/pokybuild/yocto-worker/auh/build/bu=
ild/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-p=
oky-linux/release/deps/libunicode_width-f9067b939a2e9ee3.rmeta --cap-lints =
allow -L /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-=
32-poky-linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-pre=
fix=3D/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-=
poky-linux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0`<br>
&gt; |=C2=A0 =C2=A0 Compiling itertools v0.8.0<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 13/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 Running `rustc --crate-name itertools /home/poky=
build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustf=
mt/1.4.2-r0/cargo_home/bitbake/itertools-0.8.0/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a> --error-format=3Djson --j=
son=3Ddiagnostic-rendered-ansi --crate-type lib --emit=3Ddep-info,metadata,=
link -C embed-bitcode=3Dno -C debug-assertions=3Doff --cfg &#39;feature=3D&=
quot;default&quot;&#39; --cfg &#39;feature=3D&quot;use_std&quot;&#39; -C me=
tadata=3Dff7eca720ccd13a2 -C extra-filename=3D-ff7eca720ccd13a2 --out-dir /=
home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li=
nux/rustfmt/1.4.2-r0/build/target/release/deps -C linker=3D/home/pokybuild/=
yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4=
.2-r0/wrapper/build-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/=
auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/t=
arget/release/deps --extern either=3D/home/pokybuild/yocto-worker/auh/build=
/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/rel=
ease/deps/libeither-<br>
&gt;=C2=A0 =C2=A0a3de0059007db7dd.rmeta --cap-lints allow`<br>
&gt; | error: could not compile `rustc-ap-graphviz`<br>
&gt; |<br>
&gt; | Caused by:<br>
&gt; |=C2=A0 =C2=A0process didn&#39;t exit successfully: `rustc --crate-nam=
e graphviz --edition=3D2018 /home/pokybuild/yocto-worker/auh/build/build/bu=
ild/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-=
ap-graphviz-542.0.0/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"=
_blank">lib.rs</a> --error-format=3Djson --json=3Ddiagnostic-rendered-ansi,=
artifacts --crate-type lib --emit=3Ddep-info,metadata,link -C opt-level=3D3=
 -C embed-bitcode=3Dno -C metadata=3D616067e14d16bb5d -C extra-filename=3D-=
616067e14d16bb5d --out-dir /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target/i686-poky-lin=
ux/release/deps --target i686-poky-linux -C linker=3D/home/pokybuild/yocto-=
worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/=
wrapper/target-rust-ccld -L dependency=3D/home/pokybuild/yocto-worker/auh/b=
uild/build/build/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/build/target=
/i686-poky-linux/release/deps -L dependency=3D/home/pokybuild/yocto-worker/=
auh/build/build/build/tmp/work/core2-32-poky-linux/rustf<br>
&gt;=C2=A0 =C2=A0mt/1.4.2-r0/build/target/release/deps --cap-lints allow -L=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-=
linux/rustfmt/1.4.2-r0/recipe-sysroot/usr/lib/rust --remap-path-prefix=3D/h=
ome/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin=
ux/rustfmt/1.4.2-r0=3D/usr/src/debug/rustfmt/1.4.2-r0` (exit status: 1)<br>
&gt; | warning: build failed, waiting for other jobs to finish...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 14/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 15/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 16/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 17/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 18/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 19/167: vec_map, syn=
(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs<=
/a>), c...<br>
&gt; | error: aborting due to 2 previous errors<br>
&gt; |<br>
&gt; | For more information about this error, try `rustc --explain E0554`.<=
br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 20/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 21/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 22/167: vec_map, s=
yn(<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a>), c...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 24/167: syn(<a hre=
f=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), c=
rossbeam-...<br>
&gt; | error[E0599]: no method named `is_xid_start` found for type `char` i=
n the current scope<br>
&gt; |=C2=A0 =C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-a=
p-rustc_lexer-542.0.0/src/lib.rs:689:33<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|<br>
&gt; | 689 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (c &gt; &#39=
;\x7f&#39; &amp;&amp; c.is_xid_start())<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^=
^^^^^^^ method not found in `char`<br>
&gt; |<br>
&gt; | error[E0599]: no method named `is_xid_continue` found for type `char=
` in the current scope<br>
&gt; |=C2=A0 =C2=A0 --&gt; /home/pokybuild/yocto-worker/auh/build/build/bui=
ld/tmp/work/core2-32-poky-linux/rustfmt/1.4.2-r0/cargo_home/bitbake/rustc-a=
p-rustc_lexer-542.0.0/src/lib.rs:708:33<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|<br>
&gt; | 708 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (c &gt; &#39=
;\x7f&#39; &amp;&amp; c.is_xid_continue())<br>
&gt; |=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^=
^^^^^^^^^^ method not found in `char`<br>
&gt; |<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 25/167: syn(<a hre=
f=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), c=
rossbeam-...<br>
&gt; | error: aborting due to 4 previous errors<br>
&gt; |<br>
&gt; | Some errors have detailed explanations: E0433, E0554, E0599.<br>
&gt; | For more information about an error, try `rustc --explain E0433`.<br=
>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 26/167: syn(<a href=
=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), cr=
ossbeam-...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 27/167: syn(<a href=
=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), cr=
ossbeam-...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 28/167: syn(<a href=
=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), cr=
ossbeam-...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 29/167: syn(<a href=
=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a>), cr=
ossbeam-...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 30/167: crossbeam-ut=
ils, serde(bu...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 31/167: crossbeam-ut=
ils, serde(bu...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 32/167: crossbeam-ut=
ils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 33/167: crossbeam-=
utils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 34/167: crossbeam-=
utils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 35/167: crossbeam-=
utils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 36/167: crossbeam-=
utils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 37/167: crossbeam-=
utils, utf8-ran...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 38/167: utf8-range=
s, cc, walkdir,...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 39/167: utf8-ranges, cc=
, walkdir,...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 40/167: cc, walkdir, ge=
topts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 41/167: cc, walkdir, ge=
topts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 42/167: cc, walkdir, ge=
topts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 43/167: cc, walkdir, ge=
topts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 44/167: cc, walkdir, ge=
topts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 45/167: cc, walkdir, =
getopts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 46/167: cc, walkdir, =
getopts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 47/167: cc, walkdir, =
getopts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 48/167: cc, walkdir, =
getopts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 49/167: cc, walkdir, =
getopts, hum...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 50/167: cc, walkdir, =
getopts, sem...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 51/167: cc, walkdir, =
getopts, str...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 52/167: cc, walkdir, get=
opts, dif...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 53/167: cc, walkdir, get=
opts, dif...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 54/167: cc, walkdir, get=
opts, dif...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 55/167: walkdir, getopts=
, diff, r...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 56/167: getopts, diff, r=
ustc-dema...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ] 57/167: getopts, rustc-d=
emangle, ...<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 58/167: getopts, iter=
tools<br>
&gt; |=C2=A0 =C2=A0 =C2=A0Building [=3D=3D=3D=3D=3D=3D=3D=3D&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0] 59/167: getopts<br>
&gt; | error: build failed<br>
&gt; | WARNING: exit code 101 from a shell command.<br>
&gt; |<br>
&gt; NOTE: recipe rustfmt-1.4.2-r0: task do_compile: Failed<br>
&gt; ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/re=
cipes-example/rustfmt/rustfmt_1.4.2.bb:do_compile) failed with exit code &#=
39;1&#39;<br>
&gt; NOTE: recipe libstd-rs-1.54.0-r0: task do_package_write_rpm: Succeeded=
<br>
&gt; NOTE: Tasks Summary: Attempted 729 tasks of which 644 didn&#39;t need =
to be rerun and 1 failed.<br>
&gt; NOTE: Writing buildhistory<br>
&gt; NOTE: Writing buildhistory took: 8 seconds<br>
&gt; <br>
&gt; Summary: 1 task failed:<br>
&gt;=C2=A0 =C2=A0 /home/pokybuild/yocto-worker/auh/build/build/poky/meta/re=
cipes-example/rustfmt/rustfmt_1.4.2.bb:do_compile<br>
&gt; Summary: There was 1 ERROR message shown, returning a non-zero exit co=
de.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Please review the attached files for further information and build/upd=
ate failures.<br>
&gt; Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproj=
ect.org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"norefe=
rrer" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?pro=
duct=3DAutomated%20Update%20Handler</a><br>
&gt; <br>
&gt; Regards,<br>
&gt; The Upgrade Helper<br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f022c905cab43836--
