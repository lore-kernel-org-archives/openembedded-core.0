Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919F2C77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 08:41:55 +0000 (UTC)
Received: from mailrelay5-2.pub.mailoutpod2-cph3.one.com (mailrelay5-2.pub.mailoutpod2-cph3.one.com [46.30.211.186])
 by mx.groups.io with SMTP id smtpd.web10.45117.1683189706809072150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 01:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=L9wuibdx;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.186, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:content-type:in-reply-to:cc:from:references:to:
	 subject:mime-version:date:message-id:from;
	bh=VbTBIZVkyXyggTvVR3ooMCYAO4bN9Qxn0U9dUNvIYQs=;
	b=L9wuibdxUH0PTO7tBl33hM/Wk1RFCA53fkHpXbE2joaUfMBibYvWyGgUvQ+FKoQjycwsnA5rm4uQm
	 S3j5PeIX6sXdbFDlAro476QjjpmQXpapTISydlefsKznpY55N9Owk5v+2MuKGyKM20XrvogAvOgqHX
	 QSd3AxjbiTT0q9uSrBjrC01ZmuV7n7LsJkL9xbq3DPe95KEyxaFJ0WNeF6j20dkEXSUX0miVJXXk70
	 NwvfQ5+dKUj0DOTiI3NdaD2fesNABpeHWX+WZCpKAmtJVwpfD+P2d+9zjXTOp/gvQAVklanMaFYtiq
	 DRUeaDD4p/AavSp5mzZNvXOh0y2ejYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:content-type:in-reply-to:cc:from:references:to:
	 subject:mime-version:date:message-id:from;
	bh=VbTBIZVkyXyggTvVR3ooMCYAO4bN9Qxn0U9dUNvIYQs=;
	b=mn6giq0Ztc+1HtvOrkPiOk8mz6COpMG5p/FWR504G4LewCHiCTYQWZEqKoeEiUuLQwksiSFVLhrYn
	 IWIDvVnCA==
X-HalOne-ID: 7eeb24cd-ea57-11ed-9e05-231b2edd0ed2
Received: from [192.168.100.229] (c-799071d5.44006-0-69747578.bbcust.telenor.se [213.113.144.121])
	by mailrelay5 (Halon) with ESMTPSA
	id 7eeb24cd-ea57-11ed-9e05-231b2edd0ed2;
	Thu, 04 May 2023 08:41:43 +0000 (UTC)
Message-ID: <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se>
Date: Thu, 4 May 2023 10:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
From: Peter Bergin <peter@berginkonsult.se>
Cc: frederic.martinsons@gmail.com
In-Reply-To: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 08:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180854


On 2023-05-03 19:30, Tim Orling wrote:
> I am working on an upgrade from 39.0.2 to 40.0.2 for 
> python3-cryptography:
> https://git.yoctoproject.org/poky-contrib/log/?h=timo/python3-cryptography_40.0.2
>
> The patch at the tip of HEAD is perhaps not needed, as the compiling 
> of `openssl-sys` was not the problem. We might need tweaks to not 
> vendor OpenSSL, but I do not think this is the root of the problem 
> right now.
>
> The issue I am struggling with is "Python.h" is not being found:
> |   cargo:rerun-if-env-changed=CRATE_CC_NO_DEFAULTS
> |   CRATE_CC_NO_DEFAULTS = Some("1")
> |   Info: default compiler flags are disabled
> |   cargo:rerun-if-env-changed=CC_x86_64-poky-linux-gnu
> |   CC_x86_64-poky-linux-gnu = None
> |   cargo:rerun-if-env-changed=CC_x86_64_poky_linux_gnu
> |   CC_x86_64_poky_linux_gnu = None
> |   cargo:rerun-if-env-changed=TARGET_CC
> |   TARGET_CC = None
> |   cargo:rerun-if-env-changed=CC
> |   CC = Some("x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 
> -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 
> -Wformat -Wformat-security -Werror=format-security 
> --sysroot=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot")
> |   cargo:rerun-if-env-changed=CFLAGS_x86_64-poky-linux-gnu
> |   CFLAGS_x86_64-poky-linux-gnu = None
> |   cargo:rerun-if-env-changed=CFLAGS_x86_64_poky_linux_gnu
> |   CFLAGS_x86_64_poky_linux_gnu = None
> |   cargo:rerun-if-env-changed=TARGET_CFLAGS
> |   TARGET_CFLAGS = None
> |   cargo:rerun-if-env-changed=CFLAGS
> |   CFLAGS = Some(" -O2 -pipe -g -feliminate-unused-debug-types 
> -fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=/usr/src/debug/python3-cryptography/40.0.2-r0 
>  -fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=/usr/src/debug/python3-cryptography/40.0.2-r0 
>  -fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build=/usr/src/debug/python3-cryptography/40.0.2-r0 
>  -fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build=/usr/src/debug/python3-cryptography/40.0.2-r0 
>  -fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot= 
>  -fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot= 
>  -fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native= 
> ")
> |   cargo:rerun-if-env-changed=CRATE_CC_NO_DEFAULTS
> |   CRATE_CC_NO_DEFAULTS = Some("1")
> |   Info: default compiler flags are disabled
> |   running: "x86_64-poky-linux-gcc" "-m64" "-march=core2" 
> "-mtune=core2" "-msse3" "-mfpmath=sse" "-fstack-protector-strong" 
> "-O2" "-D_FORTIFY_SOURCE=2" "-Wformat" "-Wformat-security" 
> "-Werror=format-security" 
> "--sysroot=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot" 
> "-O2" "-pipe" "-g" "-feliminate-unused-debug-types" 
> "-fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=/usr/src/debug/python3-cryptography/40.0.2-r0" 
> "-fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/cryptography-40.0.2=/usr/src/debug/python3-cryptography/40.0.2-r0" 
> "-fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build=/usr/src/debug/python3-cryptography/40.0.2-r0" 
> "-fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build=/usr/src/debug/python3-cryptography/40.0.2-r0" 
> "-fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot=" 
> "-fmacro-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot=" 
> "-fdebug-prefix-map=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native=" 
> "-I" "/usr/include/python3.11" "-I" 
> "/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/include" 
> "-Wconversion" "-Wno-error=sign-conversion" "-Wno-unused-parameter" 
> "-DPy_LIMITED_API=0x030600f0" "-o" 
> "/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/9f543b84f9f4dceb-_openssl.o" 
> "-c" 
> "/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/_openssl.c"

So the issue is most probably '-I /usr/include/python3.11' among the 
arguments to the compiler.

> | 
> cargo:warning=/srv/build/ttorling/build-upgrades/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/build/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/_openssl.c:57:10: 
> fatal error: Python.h: No such file or directory
> |   cargo:warning=   57 | #include <Python.h>
> |   cargo:warning=      |          ^~~~~~~~~~
> |   cargo:warning=compilation terminated.
> |   exit status: 1
> |
> |   --- stderr
>
> which I believe is happening during:
> https://github.com/pyca/cryptography/blob/40.0.x/src/rust/build.rs#L74
>
At 
https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46 
the path to python includes is defined by calling 'python3 -c "import 
sysconfig; print(sysconfig.get_path('include'))"' (but from inside 
rust). With print-debugging this seems to return the bad string 
'/usr/include/python3.11' which is then passed to cc::Build

I executed this in recipe context:

do_compile:prepend() {
     which python3
     python3 -c "import sysconfig; print(sysconfig.get_path('include'))"
}

and then I got the correct return value:

| 
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
| 
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11

On my machine I have python3.10 so the include path is fetched from 
correct python inside the build. The question is how, why and where the 
path is stripped?

/Peter


> I would appreciate input from any crustaceans out there with a better 
> understanding of what might be happening.
>
> --Tim
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180834): https://lists.openembedded.org/g/openembedded-core/message/180834
> Mute This Topic: https://lists.openembedded.org/mt/98667212/3617552
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [peter@berginkonsult.se]
> -=-=-=-=-=-=-=-=-=-=-=-
>

