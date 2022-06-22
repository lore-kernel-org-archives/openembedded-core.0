Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B3DC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 08:32:41 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.4873.1655886759508728425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 01:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZudFTg2r;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id a13so16666487lfr.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 01:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ek4r0/vCagevWKIwveUvfnbyueG3zwRpTEIuDdtFln8=;
        b=ZudFTg2rC1wc98Re8ML2iWKcQiqMJCiJlgghw5qAAveGnwBVYEjSW2SR0wdYUFVABN
         Lf4PZrhdKXHivjAwf2F1pMKNSSrE3JdpjOCFlf4gJwptD+yLeNoC6j4iF29TgU9Mqp0D
         FJ5Shd+JQuGgmMkGFOD5bdhvQ+c9Lis16rYSMYCaPATP/lUO0lFkQ2o9n2GxMzYXJdVQ
         lVb4er7rSjSEcr0smAFwv5n38RzFOXD38Hgx7FVnd2BlQ2WsbBk6WYLIOK/kAOD3Fnck
         4koCX5i80GRVW9Ej44/0VIB4tfjTz3Fwj0zi5Ij1UASh3zFwN9m+K0+OxWTGx8ntnTsr
         +3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ek4r0/vCagevWKIwveUvfnbyueG3zwRpTEIuDdtFln8=;
        b=ZuYQMAMf0gH9+UeMByy1JqwpRkbSntR5cWRtK/5hXknlXa5ZQBqw6OQGihDsLGFu5x
         Ys5uGYQSNb86C73atVX8nZUKhNYz40SvIo7ZyoGkIyd2mTkiA+pCKsWAkImQP1JaBUyr
         uLBfRNiwEo0fmIvq18qKvYuL1jOPdMcouFl6RzaClwJ4TZ2iB290eRIIFI+ByjjppUqu
         AGG/WuYpRqnJhiFnRNasaH/yOjH62r1R4D/ekIO1Hr2/KqJNyTO2O+YRhjFV2vOi+LN4
         495IOFQIAITMOhK1XkXIFmHgFnxPrzO0UdN9o9vw5BzMJtsNLmyjhidIrmelh/Y8Gi77
         NtXQ==
X-Gm-Message-State: AJIora8xP6gmFVlL8bgNbPgmOsxSehI8NaxqbsPPxxejbuSM3uiYdPpa
	vsEV2/pQ8qGEdTecQQMGFJN2IL+tCIHz2zIxmd4=
X-Google-Smtp-Source: 
 AGRyM1tzbdtcyjHea8JTYqsZ0ip/EPNyHHXo1FKw0Fr2Un/rph1iLHE4PJVZP7miUBipkmXnJ0nsIBhb5leWuY2gnko=
X-Received: by 2002:a05:6512:acc:b0:47f:769e:6aef with SMTP id
 n12-20020a0565120acc00b0047f769e6aefmr1452125lfu.26.1655886757313; Wed, 22
 Jun 2022 01:32:37 -0700 (PDT)
MIME-Version: 1.0
References: 
 <01010181200fec93-2abce4ac-3ed8-402a-8127-c076f733d788-000000@us-west-2.amazonses.com>
 <CANNYZj9cfUQkS+oDpW7hK5Zi4JWnsmYnEeU5+X-9onRcMSw0fA@mail.gmail.com>
 <260249af-2c6a-dbde-96a3-65a80c451ea8@windriver.com>
 <CANNYZj_WDmAaji4tiUQi9=w1bwMTQ810tO-HUXqroSMAZa21Mg@mail.gmail.com>
 <429629c2-95d3-7a9f-df3f-e8ddf2ba5b2f@gmail.com>
In-Reply-To: <429629c2-95d3-7a9f-df3f-e8ddf2ba5b2f@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Jun 2022 10:32:25 +0200
Message-ID: 
 <CANNYZj--fTwahYe2e1O1tSssrMK+jPNVDRsRuoP-SVnDtCf8JA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.61.0 FAILED
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
 Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"Gowda, Naveen" <naveen.gowda@windriver.com>,
 Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 08:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167223

Can you publish your work somewhere on git so I can reproduce the
nativesdk issue locally?

Khem, can you help us out please with it? :)

Also I'm starting to wonder if we should patch rust with a workaround
from the ticket instead?


Alex

On Wed, 22 Jun 2022 at 08:24, Sundeep KOKKONDA
<sundeep.kokkonda@gmail.com> wrote:
>
> Hi,
>
> In Yocto, the Rust upgrade from 1.60.0 -> 1.61.0 enables a dependency on =
the libstdc++-static library for rust-llvm. With this upgrade build is abor=
ted for 'bitbake core-image-minimal -cpopulate_sdk' with below error.
>
> =3D=3D=3D=3D=3D=3D=3D Error Text =3D=3D=3D=3D=3D=3D=3D
> | error: could not compile `rustc_llvm` due to previous error
> |
> | Caused by:
> |   process didn't exit successfully: `/home/pokybuild/yocto-worker/qemum=
ips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.=
0-src/build/bootstrap/debug/rustc --crate-name rustc_llvm --edition=3D2021 =
compiler/rustc_llvm/src/lib.rs --error-format=3Djson --json=3Ddiagnostic-re=
ndered-ansi,artifacts,future-incompat --crate-type lib --emit=3Ddep-info,me=
tadata,link -C opt-level=3D3 -C embed-bitcode=3Dno -C debuginfo=3D0 -C meta=
data=3D5acc17ffb3ce44a9 -C extra-filename=3D-5acc17ffb3ce44a9 --out-dir /ho=
me/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/ru=
st-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-=
rustc/x86_64-unknown-linux-gnu/release/deps --target x86_64-unknown-linux-g=
nu -C linker=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/wo=
rk/x86_64-linux/rust-native/1.61.0-r0/wrapper/build-rust-ccld -L dependency=
=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-li=
nux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/s=
tage0-rustc/x86_64-unknown-linux-gnu/release/deps -L dependency=3D/home/pok=
ybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-nat=
ive/1.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/=
release/deps --extern libc=3D/home/pokybuild/yocto-worker/qemumips-alt/buil=
d/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/build/=
x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release/deps=
/liblibc-be8f25d7c5c0a059.rmeta --cfg=3Dbootstrap -Csymbol-mangling-version=
=3Dv0 -Zmacro-backtrace -Clink-args=3D-Wl,-z,origin '-Clink-args=3D-Wl,-rpa=
th,$ORIGIN/../lib' -Ztls-model=3Dinitial-exec -Zunstable-options '-Wrustc::=
internal' -Cprefer-dynamic -Z binary-dep-depinfo -L native=3D/home/pokybuil=
d/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-linux/rust-native/1=
.61.0-r0/rustc-1.61.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_6=
4-unknown-linux-gnu/release/build/rustc_llvm-688051e8c720f5a9/out -L native=
=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-li=
nux/rust-native/1.61.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib -L na=
tive=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_6=
4-linux/rust-llvm-native/1.61.0-r0/recipe-sysroot-native/usr/lib -L native=
=3D/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/x86_64-li=
nux/rust-llvm-native/1.61.0-r0/recipe-sysroot-native/lib -L native=3D --cfg=
 'llvm_component=3D"aarch64"' --cfg 'llvm_component=3D"arm"' --cfg 'llvm_co=
mponent=3D"asmparser"' --cfg 'llvm_component=3D"bitreader"' --cfg 'llvm_com=
ponent=3D"bitwriter"' --cfg 'llvm_component=3D"coverage"' --cfg 'llvm_compo=
nent=3D"instrumentation"' --cfg 'llvm_component=3D"ipo"' --cfg 'llvm_compon=
ent=3D"linker"' --cfg 'llvm_component=3D"lto"' --cfg 'llvm_component=3D"mip=
s"' --cfg 'llvm_component=3D"powerpc"' --cfg 'llvm_component=3D"riscv"' --c=
fg 'llvm_component=3D"x86"' -l static=3Dllvm-wrapper -l static=3DLLVMX86Tar=
getMCA -l static=3DLLVMMCA -l static=3DLLVMX86Disassembler -l static=3DLLVM=
X86AsmParser -l static=3DLLVMX86CodeGen -l static=3DLLVMX86Desc -l static=
=3DLLVMX86Info -l static=3DLLVMRISCVDisassembler -l static=3DLLVMRISCVAsmPa=
rser -l static=3DLLVMRISCVCodeGen -l static=3DLLVMRISCVDesc -l static=3DLLV=
MRISCVInfo -l static=3DLLVMPowerPCDisassembler -l static=3DLLVMPowerPCAsmPa=
rser -l static=3DLLVMPowerPCCodeGen -l static=3DLLVMPowerPCDesc -l static=
=3DLLVMPowerPCInfo -l static=3DLLVMMipsDisassembler -l static=3DLLVMMipsAsm=
Parser -l static=3DLLVMMipsCodeGen -l static=3DLLVMMipsDesc -l static=3DLLV=
MMipsInfo -l static=3DLLVMLTO -l static=3DLLVMPasses -l static=3DLLVMCorout=
ines -l static=3DLLVMObjCARCOpts -l static=3DLLVMExtensions -l static=3DLLV=
MCoverage -l static=3DLLVMARMDisassembler -l static=3DLLVMARMAsmParser -l s=
tatic=3DLLVMARMCodeGen -l static=3DLLVMipo -l static=3DLLVMInstrumentation =
-l static=3DLLVMVectorize -l static=3DLLVMLinker -l static=3DLLVMIRReader -=
l static=3DLLVMAsmParser -l static=3DLLVMFrontendOpenMP -l static=3DLLVMARM=
Desc -l static=3DLLVMARMUtils -l static=3DLLVMARMInfo -l static=3DLLVMAArch=
64Disassembler -l static=3DLLVMMCDisassembler -l static=3DLLVMAArch64AsmPar=
ser -l static=3DLLVMAArch64CodeGen -l static=3DLLVMCFGuard -l static=3DLLVM=
GlobalISel -l static=3DLLVMSelectionDAG -l static=3DLLVMAsmPrinter -l stati=
c=3DLLVMDebugInfoMSF -l static=3DLLVMCodeGen -l static=3DLLVMTarget -l stat=
ic=3DLLVMScalarOpts -l static=3DLLVMInstCombine -l static=3DLLVMAggressiveI=
nstCombine -l static=3DLLVMTransformUtils -l static=3DLLVMBitWriter -l stat=
ic=3DLLVMAnalysis -l static=3DLLVMProfileData -l static=3DLLVMDebugInfoDWAR=
F -l static=3DLLVMObject -l static=3DLLVMTextAPI -l static=3DLLVMMCParser -=
l static=3DLLVMBitReader -l static=3DLLVMCore -l static=3DLLVMRemarks -l st=
atic=3DLLVMBitstreamReader -l static=3DLLVMAArch64Desc -l static=3DLLVMAArc=
h64Utils -l static=3DLLVMAArch64Info -l static=3DLLVMMC -l static=3DLLVMDeb=
ugInfoCodeView -l static=3DLLVMBinaryFormat -l static=3DLLVMSupport -l stat=
ic=3DLLVMDemangle -l dylib=3Drt -l dylib=3Ddl -l dylib=3Dpthread -l dylib=
=3Dm -l static=3Dstdc++` (exit status: 1)
> | warning: build failed, waiting for other jobs to finish...
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D>    ] 186/218: rustc_ast_passes, rustc_e...
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D>    ] 187/218: rustc_expand, rustc_parse...
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D>    ] 188/218: rustc_expand, rustc_parse...
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D>    ] 189/218: rustc_parse, rustc_builti...
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D>    ] 190/218: rustc_parse, rustc_middle
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D>    ] 191/218: rustc_middle
> | error: build failed
> | command did not execute successfully: "/home/pokybuild/yocto-worker/qem=
umips-alt/build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rust-snap=
shot/bin/cargo" "build" "--target" "x86_64-unknown-linux-gnu" "-Zbinary-dep=
-depinfo" "-j" "16" "-v" "--release" "--frozen" "--features" "llvm max_leve=
l_info" "--manifest-path" "/home/pokybuild/yocto-worker/qemumips-alt/build/=
build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/compiler=
/rustc/Cargo.toml" "--message-format" "json-render-diagnostics"
> | expected success, got: exit status: 101
> | Traceback (most recent call last):
> |   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/=
x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap=
.py", line 1341, in <module>
> |     main()
> |   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/=
x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap=
.py", line 1324, in main
> |     bootstrap(help_triggered)
> |   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/=
x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap=
.py", line 1310, in bootstrap
> |     run(args, env=3Denv, verbose=3Dbuild.verbose, is_bootstrap=3DTrue)
> |   File "/home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work/=
x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/src/bootstrap/bootstrap=
.py", line 185, in run
> |     raise RuntimeError(err)
> | RuntimeError: failed to run: /home/pokybuild/yocto-worker/qemumips-alt/=
build/build/tmp/work/x86_64-linux/rust-native/1.61.0-r0/rustc-1.61.0-src/bu=
ild/bootstrap/debug/bootstrap -j 16 build --stage 2 --verbose
> | WARNING: /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp/work=
/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104:179 exit 1 f=
rom 'python3 src/bootstrap/bootstrap.py -j 16 "$@" --verbose'
> | WARNING: Backtrace (BB generated script):
> |     #1: rust_runx, /home/pokybuild/yocto-worker/qemumips-alt/build/buil=
d/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104, l=
ine 179
> |     #2: do_compile, /home/pokybuild/yocto-worker/qemumips-alt/build/bui=
ld/tmp/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104, =
line 162
> |     #3: main, /home/pokybuild/yocto-worker/qemumips-alt/build/build/tmp=
/work/x86_64-linux/rust-native/1.61.0-r0/temp/run.do_compile.175104, line 2=
02
> NOTE: recipe rust-native-1.61.0-r0: task do_compile: Failed
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The build error is solved by adding the libstdc++.a library on the Host (=
in my case Ubuntu) machine. Now, I am working on to add this library to the=
 Yocto nativesdk sysroot to avoid the dependency on the Host machine. I mad=
e several attempts to add the libstdc++ lib to the nativesdk sysroot before=
 the rust / rust-llvm recipe 'do_compile' task is executed. In the build di=
rectory I can see the libstdc++.a is available but it is not considered by =
the rust recipe and still the above mentoned error is appearing. When I add=
ed dependencies, I observed  errors like 'nothing provides libstdc++ / libs=
tdc++-static / libstdc++-staticdev / virtual/nativesdk-libstdc++-staticdev =
... etc'.
>
> Below are the few locations in build/tmp/work/ directory where libstdc++.=
a lib is available.
> ./x86_64-nativesdk-pokysdk-linux/meta-environment-qemux86-64/1.0-r8/recip=
e-sysroot/usr/lib/libstdc++.a
> ./x86_64-nativesdk-pokysdk-linux/rust-cross-canadian-x86-64/1.61.0-r0/rec=
ipe-sysroot/usr/lib/libstdc++.a
> ./x86_64-nativesdk-pokysdk-linux/rust-tools-cross-canadian-x86-64/1.61.0-=
r0/recipe-sysroot/usr/lib/libstdc++.a
>
>
> Could someone give some hints on which recipe should provide the libstdc+=
+-static lib and how can I made it is considered by the rust recipe?
>
> The link https://github.com/rust-lang/rust/issues/94983#issue-1170386860 =
describes the libstdc++ dependency with rust update.
>
>
>
>
> Thanks,
> Sundeep K.
>
>
> On 13-06-2022 18:56, Alexander Kanavin wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> To get started quicker, I have a recipe update commit on top of this
> branch, which you are welcome to cherry-pick:
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-versi=
on-updates-later
>
> Alex
>
> On Mon, 13 Jun 2022 at 15:01, Randy MacLeod <randy.macleod@windriver.com>=
 wrote:
>
> On 2022-06-13 04:15, Alexander Kanavin wrote:
>
> Rust 1.61 is held by rust-native regressing on red hat distros; fedora
> 34/35, centos/alma 8 all show this:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3151
>
> Alex
>
> Thanks Alex.
>
>
> Naveen, Sundeep,
>
> It looks like there's been a change to how or if libstdc++-static is used=
:
>
> https://github.com/rust-lang/rust/issues/97138
>
>
> This change is part of 1.61:
>
> https://github.com/rust-lang/rust/pull/94832
>
> so perhaps we need to change our recipe. Anyway, I only took a quick look=
.
> Please work on this issue ASAP.
>
> ../Randy
>
>
> On Wed, 1 Jun 2022 at 18:19, Auto Upgrade Helper <auh@yoctoproject.org> w=
rote:
>
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *rust-llvm* to *1.61.0* =
has Failed (devtool error).
>
> Detailed error information:
>
> The following devtool command failed:  finish -f rust-llvm /home/pokybuil=
d/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
> NOTE: Starting bitbake server...
> WARNING: Host distribution "almalinux-8.6" has not been validated with th=
is version of the build system; you may possibly experience unexpected fail=
ures. It is recommended that you use a tested distribution.
> Loading cache...done.
> Loaded 1643 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 884 .bb files complete (883 cached, 1 parsed). 1644 targets, 3=
5 skipped, 0 masked, 0 errors.
>
> Summary: There was 1 WARNING message.
>
> ERROR: Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/cookerdata.py", line 162, in wrapped
>      return func(fn, *args)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/cookerdata.py", line 187, in parse_config_file
>      return bb.parse.handle(fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/__init__.py", line 107, in handle
>      return h['handle'](fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/parse_py/ConfHandler.py", line 118, in handle
>      abs_fn =3D resolve_file(fn, data)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/__init__.py", line 133, in resolve_file
>      raise IOError(errno.ENOENT, "file %s not found" % fn)
> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>
> ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/poky/=
meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybuild/=
yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.con=
f not found
> Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/cookerdata.py", line 162, in wrapped
>      return func(fn, *args)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/cookerdata.py", line 187, in parse_config_file
>      return bb.parse.handle(fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/__init__.py", line 107, in handle
>      return h['handle'](fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/parse_py/ConfHandler.py", line 118, in handle
>      abs_fn =3D resolve_file(fn, data)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/parse/__init__.py", line 133, in resolve_file
>      raise IOError(errno.ENOENT, "file %s not found" % fn)
> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtoo=
l", line 334, in <module>
>      ret =3D main()
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtoo=
l", line 321, in main
>      ret =3D args.func(args, config, basepath, workspace)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/de=
vtool/standard.py", line 2108, in finish
>      updated, appendfile, removed =3D _update_recipe(args.recipename, wor=
kspace, rd, args.mode, appendlayerdir, wildcard_version=3DTrue, no_remove=
=3DFalse, no_report_remove=3Dremoving_original, initial_rev=3Dargs.initial_=
rev, dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_overrides, for=
ce_patch_refresh=3Dargs.force_patch_refresh)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/de=
vtool/standard.py", line 1814, in _update_recipe
>      updated, appendf, removed =3D _update_recipe_patch(recipename, works=
pace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_=
remove, initial_rev, dry_run_outdir, force_patch_refresh)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/de=
vtool/standard.py", line 1671, in _update_recipe_patch
>      redirect_output=3Ddry_run_outdir)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/re=
cipeutils.py", line 705, in bbappend_recipe
>      appendpath, pathok =3D get_bbappend_path(rd, destlayerdir, wildcardv=
er)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/re=
cipeutils.py", line 632, in get_bbappend_path
>      confdata =3D bb.cookerdata.parse_config_file(destlayerconf, confdata=
)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb=
/cookerdata.py", line 167, in wrapped
>      raise bb.BBHandledException()
> bb.BBHandledException
>
>
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166404): https://lists.openembedded.org/g/openembedde=
d-core/message/166404
> Mute This Topic: https://lists.openembedded.org/mt/91480159/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
> --
> # Randy MacLeod
> # Wind River Linux
>
> .
>
>

