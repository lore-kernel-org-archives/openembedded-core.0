Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8221C25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 21:55:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.27422.1716069318862768855
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 14:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KkGITyeZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 994DB40003;
	Sat, 18 May 2024 21:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716069317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nM5dWi8377VHDFgRqt5VvqUBzDZ10gmQQz95WLn6Sg4=;
	b=KkGITyeZCKNICYD3LXAmnWgQqjVWnRufjY2GMpEuSPGA8MwnQGyyGwS6+kuWUxBpwWBiL9
	ebuH1Kf08qGYUcTWCEqCLiMqGIDtWqKSXW0dv0PqG4Chv2LzJalY3v3z6wXDopPbNA0r8r
	zx2FSZy2gSR2sQyDmq0YkW71zPxN865SRIhbcROCCx8THwiyYQm2PdaTlnVurmjUIX8qIF
	a001AnnONDm+krgwfMIbj0jv63NV58H++xXkY9KK/Qo/60KhpocH/VK7xewsCEXocYHWf7
	Y9e7f1ifbK/l4WxDxXuRYUZyF3/gwLtIwvnyYQUD+57G4DomJINrRio8Kk1ZLw==
Date: Sat, 18 May 2024 23:55:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/4] rust: correctly link rust-snapshot into
 build/stage0
Message-ID: <20240518215516883b453a@mail.local>
References: <20240516112111.2145436-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516112111.2145436-1-alex.kanavin@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 21:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199540

ello,

The series broke the -tc builds as
rust.RustSelfTestSystemEmulated.test_rust is failing:


https://autobuilder.yoctoproject.org/typhoon/#/builders/151/builds/1723/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/1715/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/1711/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/1700/steps/12/logs/stdio

On 16/05/2024 13:21:08+0200, Alexander Kanavin wrote:
> From: Alexander Kanavin <alex@linutronix.de>
> 
> This does not seem to be used in regular builds, but is beneficial
> in rust selftest, where it allows dropping a custom patch
> that is unsuitable for upstream (and was rejected by them).
> 
> Also remove an obsolete comment that seems related to the code
> but describes something that was resolved long time ago.
> 
> I have confirmed that the rust selftest continues to pass with just
> this one commit on top of master (as the following changes do break
> the selftest).
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../rust/files/cargo-path.patch               | 37 -------------------
>  meta/recipes-devtools/rust/rust-source.inc    |  1 -
>  meta/recipes-devtools/rust/rust_1.75.0.bb     |  6 +--
>  3 files changed, 2 insertions(+), 42 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch
> 
> diff --git a/meta/recipes-devtools/rust/files/cargo-path.patch b/meta/recipes-devtools/rust/files/cargo-path.patch
> deleted file mode 100644
> index 9a50c402201..00000000000
> --- a/meta/recipes-devtools/rust/files/cargo-path.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Fix the cargo binary path error and ensure that it is fetched
> -during rustc bootstrap in rust oe-selftest.
> -
> -======================================================================
> -ERROR: test_cargoflags (bootstrap_test.BuildBootstrap)
> -----------------------------------------------------------------------
> -Traceback (most recent call last):
> -  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 157, in test_cargoflags
> -    args, _ = self.build_args(env={"CARGOFLAGS": "--timings"})
> -  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 154, in build_args
> -    return build.build_bootstrap_cmd(env), env
> -  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap.py", line 960, in build_bootstrap_cmd
> -    raise Exception("no cargo executable found at `{}`".format(
> -Exception: no cargo executable found at `/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
> -
> -Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/120125]
> -
> -Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ----
> -diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
> ---- a/src/bootstrap/bootstrap.py
> -+++ b/src/bootstrap/bootstrap.py
> -@@ -954,9 +954,11 @@
> -         if "RUSTFLAGS_BOOTSTRAP" in env:
> -             env["RUSTFLAGS"] += " " + env["RUSTFLAGS_BOOTSTRAP"]
> -
> --        env["PATH"] = os.path.join(self.bin_root(), "bin") + \
> --            os.pathsep + env["PATH"]
> --        if not os.path.isfile(self.cargo()):
> -+        cargo_bin_path = os.path.join(self.bin_root(), "bin", "cargo")
> -+        if not os.path.isfile(cargo_bin_path):
> -+            cargo_bin_path = os.getenv("RUST_TARGET_PATH") + "rust-snapshot/bin/cargo"
> -+            env["PATH"] = os.path.dirname(cargo_bin_path) + os.pathsep + env["PATH"]
> -+        else:
> -             raise Exception("no cargo executable found at `{}`".format(
> -                 self.cargo()))
> -         args = [self.cargo(), "build", "--manifest-path",
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
> index b14221b6cb8..c83c8ec3a39 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -7,7 +7,6 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
>              file://rv32-missing-syscalls.patch;patchdir=${RUSTSRC} \
>              file://rv32-rustix-libc-backend.patch;patchdir=${RUSTSRC} \
>              file://rv32-cargo-rustix-0.38.19-fix.patch;patchdir=${RUSTSRC} \
> -            file://cargo-path.patch;patchdir=${RUSTSRC} \
>              file://custom-target-cfg.patch;patchdir=${RUSTSRC} \
>              file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
>              file://target-build-value.patch;patchdir=${RUSTSRC} \
> diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
> index 76e1fe2d84a..8ef838ee90c 100644
> --- a/meta/recipes-devtools/rust/rust_1.75.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
> @@ -35,8 +35,6 @@ RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-co
>  # own vendoring.
>  CARGO_DISABLE_BITBAKE_VENDORING = "1"
>  
> -# We can't use RUST_BUILD_SYS here because that may be "musl" if
> -# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
>  setup_cargo_environment () {
>      # The first step is to build bootstrap and some early stage tools,
>      # these are build for the same target as the snapshot, e.g.
> @@ -54,8 +52,8 @@ do_rust_setup_snapshot () {
>  
>      # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
>      # and fail without it there.
> -    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
> -    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
> +    mkdir -p ${RUSTSRC}/build/${RUST_BUILD_SYS}
> +    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${RUST_BUILD_SYS}/stage0
>  
>      # Need to use uninative's loader if enabled/present since the library paths
>      # are used internally by rust and result in symbol mismatches if we don't
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199464): https://lists.openembedded.org/g/openembedded-core/message/199464
> Mute This Topic: https://lists.openembedded.org/mt/106132432/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

