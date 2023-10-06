Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B954DE94134
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 22:01:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6817.1696629691435876455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 15:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HefFLkkC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C444920004;
	Fri,  6 Oct 2023 22:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696629689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aaiUZMMDK+mcjv1xE8X8UCJpR5kNaAS2WnlixBu0/9g=;
	b=HefFLkkC+o7LsZk+D5DvIlsIlJxBD7NUM6PJY7yJKdAevkMjDusd+N/0Gnh2fd82V+PHh1
	sCHFy5OfHd5KmaZ5Vl3zDMFojyLJ0hDPwuZGFLEBjSpQlAfc2alY3lNtVBy76o+T6L3AD/
	u1Pv6An9qcCK3owzcualg5ZcUNma3ysXbcBrFRL0GIvxTemOibPJSgYdddzyi4O3RL6gSo
	BVeanluuNogdMYyME3GY+w1xUnfIuGSBUqgGxdua1ACqSNewIo3NjrwF4vJxnPjaNzeZcj
	n7x53CLoFlOqj0jrmGqDCYm+Wu/SMBOSSstdLx19VHVbuVLc+CJ4VDUfsVYy2w==
Date: Sat, 7 Oct 2023 00:01:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, kasper@krinvent.dk
Subject: Re: [OE-core][PATCH v2 1/3] rust-cross-canadian: set
 CARGO_TARGET_<triple>_RUSTFLAGS
Message-ID: <20231006220128918ae555@mail.local>
References: <20231003070632.1040011-1-sean@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003070632.1040011-1-sean@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 22:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188794

Hello,

I believe this series causes this kind of failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/7857/steps/17/logs/stdio

  File "/home/pokybuild/yocto-worker/qemux86-64/build/meta/lib/oeqa/sdk/cases/rust.py", line 57, in test_cargo_build
    self._run('cd %s/hello; cargo run --target %s-gnu' % (self.tc.sdk_dir, sdksys))
  File "/home/pokybuild/yocto-worker/qemux86-64/build/meta/lib/oeqa/sdk/case.py", line 14, in _run
    return subprocess.check_output(". %s > /dev/null; %s;" % \
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/qemux86-64/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/subprocess.py", line 466, in check_output
    return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/qemux86-64/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /home/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdk/environment-setup-core2-64-poky-linux > /dev/null; cd /home/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdk//hello; cargo run --target i686-pokysdk-linux-gnu;' returned non-zero exit status 101
Standard Output:     Finished dev [unoptimized + debuginfo] target(s) in 0.03s
     Running `/home/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots/i686-pokysdk-linux/lib/ld-linux-i686.so.2 target/i686-pokysdk-linux-gnu/debug/hello`
error: could not execute process `/home/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots/i686-pokysdk-linux/lib/ld-linux-i686.so.2 target/i686-pokysdk-linux-gnu/debug/hello` (never executed)
Caused by:
  No such file or directory (os error 2)


On 03/10/2023 09:06:28+0200, Sean Nyekjaer wrote:
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
> View/Reply Online (#188625): https://lists.openembedded.org/g/openembedded-core/message/188625
> Mute This Topic: https://lists.openembedded.org/mt/101729592/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

