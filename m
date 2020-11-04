Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web09.8625.1604463706760385774
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 20:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f+vZJeox;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id bl9so9215998qvb.10
        for <Openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 20:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=9FweYh1WKJOMal0a3KZR+MLixGWMKGGoEFizl//AOaw=;
        b=f+vZJeoxptIdk7D1wpEoGyXJgHUQ548Vby+//peyo+v5NHdoi8XQtHQ98h+NXNNwgf
         ArcyopoJVB2fwMwpmRs8HYvcxvo0oSLdJ6AFFP2h2OhPZrhhZp9txpwY3wFWhVmpq3sV
         BdxxymwlHqGMS2s055QRCEodx6cxlqX2Ndj/PAmmG58EHyUkVQXBRrbUBNBXmzNHIGln
         xfz7O/myCQcULmi0nYA6ZzYUxhj0WWTaqhXe3lo7uAm+qUzi+frWi+rJJ6JqgPoPUTJb
         C/VPJujfyGJfxsOdmtOffq6YfMic2HGfrFGg8FCJXnTl0VJ01dlUFsdJTfJtrWRXrNHG
         FcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=9FweYh1WKJOMal0a3KZR+MLixGWMKGGoEFizl//AOaw=;
        b=LBLJ1b2KZjYf+aDGMy7OOneRjUjnjL2FmXZiVjNC7YaTr09zgSoRA66JBbJKa38Ha6
         tX31ThZB5CNhmx8/E6H3ahhLnxj9jBjIXuwbDgC3HY9Yx69QTwiCXYUzTvmhCb/ujIFm
         9/iRHSu/iAY8qYGciXwCL34fADaEjf2/jP1Z5loiOTTRHrJr9GIDqrtgnZh0msJpfxXk
         8Pocf4K5HFWU+hLJySQm1MrKOB/c51AGJAJ4fosR4kEOKxptJGjYRmBojw6hlej5/nuz
         5yMX9u5VnT38WeXy+Sc/ndYi141UVBM/5NalwwprmstGS/q4des4mxk4azbpefjkTYO8
         +mHA==
X-Gm-Message-State: AOAM532hEGWsoOAkM8qd0GnIzn6BYwFxIKyLyYTX/fHWQz7sEZAR2Vqn
	6Vmb8ICjXCR/40XBJcz2al+nkFsGCLZzT6V1U+Y6tBQVyR8=
X-Google-Smtp-Source: ABdhPJw1e7EkKco8McNqHjiKIh/uvem38dNugmafsxhMiVNoeCDaUn1zZa53sm1WB33ed7+Z8TzHkHISLeGrN9aDLjU=
X-Received: by 2002:a0c:ba2a:: with SMTP id w42mr29624028qvf.23.1604463705562;
 Tue, 03 Nov 2020 20:21:45 -0800 (PST)
MIME-Version: 1.0
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Wed, 4 Nov 2020 09:51:34 +0530
Message-ID: <CANUMPcUV53punnV_5EArrkknXaTZWc=i_UunbJKHiFA_4HZdRw@mail.gmail.com>
Subject: Yocto rust build failure
To: Openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Trying to build yocto rust package using below branch,

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-wip-sept-5

Getting below list of errors while building yocto rust,
=======================================================
Command:
$bitbake rust

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-18.04"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201029"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta
meta-poky
meta-yocto-bsp       =
"rmacleod/rust-wip-sept-5:80e2aad495bd6f6e1c62b7af55677651131fa250"


Error1:

failed to execute command:
"/home/build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-config"
"--bindir"
error: No such file or directory (os error 2)


Fixed by below changes,

--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -14,7 +14,7 @@ export RUST_TARGET_PATH="${WORKDIR}/targets/"

 export FORCE_CRATE_HASH="${BB_TASKHASH}"

-export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
+export YOCTO_ALTERNATE_EXE_PATH =
"${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"


Error2:

error: Error loading target specification: Could not find
specification for target "arm-poky-linux-gnueabi". Use `--print
target-list` for a list of built-in targets

Fixed by updating "RUST_TARGET_PATH" in
"build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/temp/run.do_compilerun.do_compile"
to "$STAGING_LIBDIR_NATIVE/rustlib" path where target specification
exists.


Error3:

While building "librustc_privacy" getting below error.

/home/build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/10.2.0/ld:
/tmp/rustcLL5VLM/librustc_llvm-755d330643cd0fe0.rlib: member
/tmp/rustcLL5VLM/librustc_llvm-755d330643cd0fe0.rlib(X86Disassembler.cpp.o)
in archive is not an object
          collect2: error: ld returned 1 exit status

error: aborting due to previous error

error: could not compile `rustc_driver`.
To learn more, run the command again with --verbose.

=======================================================

Please let me know if any corrections are needed in the build procedure.


Regards,
Vinay
