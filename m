Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FA6CCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 07:55:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.14846.1760255728741889368
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 00:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L1vaw4vH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D6B8CC08CF1;
	Sun, 12 Oct 2025 07:55:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 857CA606C6;
	Sun, 12 Oct 2025 07:55:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D5FA102F1BFD;
	Sun, 12 Oct 2025 09:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760255725; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PUMeBtSESRCwP2Y1Z62A5IVCrLt4pZMi2+XIqiaZ6uM=;
	b=L1vaw4vHepDI0b6CT81GpAznDTq2EdrXktxIUtZ4xpTxe7V3Fa1C7He5EG/hQjhdV9IDqr
	ZOsgNanVyIku+UD54vNa2fxAfJuLmUuAaSgfzlsC/uETy/g6lxYe0ty0t3LejczzLalU/Y
	HamJslKGLfzVts9DERSoXuMQQy5B2fTMrK7/zaKmlk8JY30VvmsfmslEm7L7+p/uwLBVJ2
	C1kKNS85D4GhEwdeAdlt6AyZ8FzEjnz2H71SKRGJ2HTUBK7uWs3OYwWMawQfRZbYDPYK+B
	xwiBJl+nESOQb9HfescOaCs9w2RcD0+WW79Guiow93OyeWilh4yYNzcyxe+8SQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Oct 2025 09:55:15 +0200
Message-Id: <DDG6KOCK8TPK.2XZMV4A9B9D79@bootlin.com>
Subject: Re: [OE-core] [PATCH V4 1/2] rust: Use llvm instead of rust-llvm
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251010144735.862149-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251010144735.862149-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 07:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224727

On Fri Oct 10, 2025 at 4:47 PM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Updated the Rust build to depend on llvm instead.
>
> *Summary of discussion with the rust upstream about using latest LLVM ins=
tead of Rust maintained LLVM fork.
> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm=
-fork-what-rust-uses/23489
>
> *Upstream LLVM is generally compatible:
> - Rust does support building with upstream (vanilla) LLVM, especially the=
 latest
> major release and the one or two preceding ones.
> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating=
-llvm
>
> *Impact on Yocto Rust upgrades:
> - Rust upgrades shall always check for updates on rust forked llvm and ba=
ckport
> the relevant patches to llvm.
>
> *Regarding the rust forked llvm local patches:
> - There are no local patches on rust forked llvm other than the backporte=
d fixes
> from llvm master.
>
> *We are copying the natively built `llvm-config` binary into the target s=
ysroot and running
> it. However, this `llvm-config` has compile time dependencies on various =
other arch's LLVM
> libraries because native-llvm is built for all oe-core supported targets.
>
> Attempting to work around this by symlinking the missing libraries from t=
he native sysroot
> into the target sysroot leads to mixed architectures in the final `.rlib`=
. Specifically,
> the object files extracted from those symlinked libraries within `librust=
c_llvm-<hash>.rlib`
> are built for the host, while others are correctly built for the target T=
his results in linker
> failures due to file format not recognized.
>
> To resolve this, we now build llvm-target also for all oe-core supported =
architectures in
> addition to the native-llvm build. This ensures that `llvm-config` and al=
l associated
> libraries are built for the correct target, eliminating cross-architectur=
e contamination
> and linker issues.
>
> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" because of=
 this following
> diff otherwise we will get errors during link time.
>
> Setup in rust-llvm
> -DLLVM_ENABLE_ZLIB=3DOFF \
> -DLLVM_ENABLE_ZSTD=3DOFF \
> -DLLVM_ENABLE_FFI=3DOFF \
>
> Setup in llvm
> -DLLVM_ENABLE_FFI=3DON \
>
> *When multilibs enabled:
>
> llvm-config expects static libraries to be located in the lib directory r=
ather than
> lib64. However, since we are copying the natively built llvm-config to ta=
rget sysroot
> and running it and llvm-config doesn't know anything about lib64 existenc=
e. To accommodate
> this without breaking multilib behavior, we are creating a symlink from '=
lib' to 'lib64'
> directory.
>
> Previously, when we depended on rust-llvm, this worked because we specifi=
ed:
> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
>
> With this setup, llvm-config was installed inside ${libdir}/llvm-rust, wh=
ich included
> its own bin and lib directories. Thus, llvm-config located in bin would c=
orrectly find
> the libraries in the adjacent lib directory.
>
> Even when multilib was enabled or not, llvm-config would still look for l=
ibraries under
> lib in this structure, so everything functioned as expected.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---

Hi Deepesh,

Thanks for the new version.

I suspect this series is responsible of the following error on the
autobuilder:

AssertionError: Command 'export TARGET_VENDOR=3D"-poky"; export PATH=3D/srv=
/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2164988/tmp/work/cortex=
a57-poky-linux/rust/1.90.0/recipe-sysroot-native/usr/bin/python3-native:/sr=
v/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2164988/tmp/work/corte=
xa57-poky-linux/rust/1.90.0/recipe-sysroot-native/usr/bin:/srv/pokybuild/yo=
cto-worker/qemuarm64-tc/build/build-st-2164988/tmp/work/cortexa57-poky-linu=
x/rust/1.90.0/recipe-sysroot-native/usr/bin/aarch64-poky-linux:/srv/pokybui=
ld/yocto-worker/qemuarm64-tc/build/build-st-2164988/tmp/hosttools:$PATH; ex=
port RUST_TARGET_PATH=3D/srv/pokybuild/yocto-worker/qemuarm64-tc/build/buil=
d-st-2164988/tmp/work/cortexa57-poky-linux/rust/1.90.0/rust-targets; export=
 TEST_DEVICE_ADDR=3D"192.168.7.2:12345"; cd /srv/pokybuild/yocto-worker/qem=
uarm64-tc/build/build-st-2164988/tmp/work/cortexa57-poky-linux/rust/1.90.0/=
sources/rustc-1.90.0-src; python3 src/bootstrap/bootstrap.py test  --exclud=
e src/bootstrap  --exclude src/doc/rustc  --exclude src/doc/rustdoc  --excl=
ude src/doc/unstable-book  --exclude src/etc/test-float-parse  --exclude sr=
c/librustdoc  --exclude src/rustdoc-json-types  --exclude src/tools/coverag=
e-dump  --exclude src/tools/jsondoclint  --exclude src/tools/lint-docs  --e=
xclude src/tools/replace-version-placeholder  --exclude src/tools/rust-anal=
yzer  --exclude src/tools/rustdoc-themes  --exclude src/tools/rust-installe=
r  --exclude src/tools/test-float-parse  --exclude src/tools/suggest-tests =
 --exclude src/tools/tidy  --exclude tests/assembly-llvm/asm/aarch64-outlin=
e-atomics.rs  --exclude tests/codegen-llvm/issues/issue-122805.rs  --exclud=
e tests/codegen-llvm/thread-local.rs  --exclude tests/mir-opt/  --exclude t=
ests/run-make  --exclude tests/run-make-fulldeps  --exclude tests/rustdoc  =
--exclude tests/rustdoc-json  --exclude tests/rustdoc-js-std  --exclude tes=
ts/ui/abi/stack-probes-lto.rs  --exclude tests/ui/abi/stack-probes.rs  --ex=
clude tests/ui/codegen/mismatched-data-layouts.rs  --exclude tests/codegen-=
llvm/rust-abi-arch-specific-adjustment.rs  --exclude tests/ui/debuginfo/deb=
uginfo-emit-llvm-ir-and-split-debuginfo.rs  --exclude tests/ui/feature-gate=
s/version_check.rs  --exclude tests/ui-fulldeps/  --exclude tests/ui/proces=
s/nofile-limit.rs  --exclude tidyselftest --no-doc --no-fail-fast --bless -=
-target aarch64-poky-linux-gnu' returned non-zero exit status 1:
...
hread 'main' panicked at src/tools/remote-test-client/src/main.rs:351:5:
io::copy(&mut file, dst) failed with Connection reset by peer (os error 104=
)
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race
error: test failed, to rerun pass `-p rustc_driver_impl --lib`
     Running unittests src/lib.rs (build/x86_64-unknown-linux-gnu/stage1-ru=
stc/aarch64-poky-linux-gnu/release/deps/rustc_error_codes-e9a3d92a58a57e6f)
uploaded "/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2164988/t=
mp/work/cortexa57-poky-linux/rust/1.90.0/sources/rustc-1.90.0-src/build/x86=
_64-unknown-linux-gnu/stage1-rustc/aarch64-poky-linux-gnu/release/deps/rust=
c_error_codes-e9a3d92a58a57e6f", waiting for result
...
2025-10-11 14:39:15,774 - oe-selftest - INFO - rust.RustSelfTestSystemEmula=
ted.test_rust (subunit.RemotedTestCase)
2025-10-11 14:39:15,789 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2477
https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2471
https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/571
https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2490

Can you have a look at these errors, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


