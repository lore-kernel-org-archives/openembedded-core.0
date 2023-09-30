Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3D6E7736C
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 10:45:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.38453.1696070715826525923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 03:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IeDSSBqB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5567AC0002;
	Sat, 30 Sep 2023 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696070713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sr4TZ5m/cM9KIw5VzxZdA2n9AsiXtSN1oOwxUqXhJL0=;
	b=IeDSSBqBJpvfwBEI8+gFAUktNniL8KNflby8/cX0xJBDC7Fh07BTmJoL3AkBNNoS80t66W
	XfFDxjfl1liYTOB4R70dhx4WPxz0lAYvQk806hU6QrTbT4DJmmdVT8lsDRO8ogobD7gQqE
	OnUnFERF5xO/pzHfdxGkj4UC9r9CpaNKFiJokH88U6a1v3xctQc7wNkVXzJd/IHFq3NlDH
	Hdr6ur0p6VxlCLypo/o6gRNAewvyA5yuTejXX1cXy/8j6uPmNkG9bUOJ8kSSaLt/neyKGe
	faIfPGt5ax2TbKGA9PTVXbA0n5q05WsqS9b2wzgG74DsM/hrHD9ylkEmats34A==
Date: Sat, 30 Sep 2023 12:45:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, kasper@krinvent.dk
Subject: Re: [OE-core][PATCH 1/3] rust-cross-canadian: set
 CARGO_TARGET_<triple>_RUSTFLAGS
Message-ID: <20230930104513751864bd@mail.local>
References: <20230929101925.1442545-1-sean@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929101925.1442545-1-sean@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 10:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188456

Hello,

This series causes those rust.RustHostCompileTest.test_cargo_build failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/7879/steps/13/logs/stdio

RustCompileTest class: SDK doesn't contain a Rust cross-canadian toolchain
RustCompileTest class: SDK doesn't contain a Rust cross-canadian toolchain
EpoxyTest class: SDK doesn't contain Meson
GalculatorTest class: SDK don't support gtk+3
No perl package in the SDK
No python3 package in the SDK
RustCompileTest class: SDK doesn't contain a Rust cross-canadian toolchain
RustCompileTest class: SDK doesn't contain a Rust cross-canadian toolchain
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qemuarm/build/meta/lib/oeqa/sdk/cases/rust.py", line 56, in test_cargo_build
    self._run('cd %s/hello; cargo build --target %s-oesdk-linux-gnu' % (self.tc.sdk_dir, machine))
  File "/home/pokybuild/yocto-worker/qemuarm/build/meta/lib/oeqa/sdk/case.py", line 14, in _run
    return subprocess.check_output(". %s > /dev/null; %s;" % \
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.11/subprocess.py", line 466, in check_output
    return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.11/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0/testimage-sdk/environment-setup-cortexa15t2hf-neon-poky-linux-gnueabi > /dev/null; cd /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0/testimage-sdk//hello; cargo build --target x86_64-oesdk-linux-gnu;' returned non-zero exit status 101
Standard Output: error: failed to run `rustc` to learn about target-specific information
Caused by:
  process didn't exit successfully: `rustc - --crate-name ___ --print=file-names --target x86_64-oesdk-linux-gnu --crate-type bin --crate-type rlib --crate-type dylib --crate-type cdylib --crate-type staticlib --crate-type proc-macro --print=sysroot --print=split-debuginfo --print=crate-name --print=cfg` (exit status: 1)
  --- stderr
  error: Error loading target specification: Could not find specification for target "x86_64-oesdk-linux-gnu". Run `rustc --print target-list` for a list of built-in targets


https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7858/steps/15/logs/stdio

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/sdk/cases/rust.py", line 57, in test_cargo_build
    self._run('cd %s/hello; cargo run --target %s-oesdk-linux-gnu' % (self.tc.sdk_dir, machine))
  File "/home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/sdk/case.py", line 14, in _run
    return subprocess.check_output(". %s > /dev/null; %s;" % \
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.11/subprocess.py", line 466, in check_output
    return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.11/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0/testimage-sdk/environment-setup-cortexa15t2hf-neon-oe-linux-gnueabi > /dev/null; cd /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0/testimage-sdk//hello; cargo run --target i686-oesdk-linux-gnu;' returned non-zero exit status 101
Standard Output:     Finished dev [unoptimized + debuginfo] target(s) in 0.04s
     Running `/home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0/testimage-sdk/sysroots/i686-oesdk-linux/lib/ld-linux-i686.so.2 target/i686-oesdk-linux-gnu/debug/hello`
error: could not execute process `/home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0/testimage-sdk/sysroots/i686-oesdk-linux/lib/ld-linux-i686.so.2 target/i686-oesdk-linux-gnu/debug/hello` (never executed)
Caused by:
  No such file or directory (os error 2)

On 29/09/2023 12:19:21+0200, Sean Nyekjaer wrote:
> Avoid setting sdk-wide RUSTFLAGS as these flags only are valid when
> building for target.
> This will enable building for different targets with different
> RUSTFLAGS.
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta/recipes-devtools/rust/rust-cross-canadian.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> index d569ac59f5..d25646237c 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -54,8 +54,10 @@ do_install () {
>      mkdir "${ENV_SETUP_DIR}"
>      RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
>  
> +    RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
> +
>      cat <<- EOF > "${RUST_ENV_SETUP_SH}"
> -	export RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
> +	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
>  	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
>  	EOF
>  
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188399): https://lists.openembedded.org/g/openembedded-core/message/188399
> Mute This Topic: https://lists.openembedded.org/mt/101654701/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

