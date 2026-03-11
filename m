Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCE21125852
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 16:27:00 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.385.1773246417806413355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 09:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LUBOV0BY;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89a1c6dd788so742806d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773246417; cv=none;
        d=google.com; s=arc-20240605;
        b=HBeYK17MeOItliuaocMTRmZpz2QqciSNkjA8rU8hgINBUOEWIAGLXcIC/V8f1GeE3h
         hBEYj/CQPpfG+nkln6kUps/cxxMWvbOcQLZ5nO4AkqN0KJM5Z4DZgL/O3RhUUJpx2K4+
         hmUjgy7DkWml4+FohQCjaQ5MoKuei+NCZWTpnKD5BaLTIN20kB29ELWVZhWWLrjsmDu+
         sAe72++px2dJb+xSlnR5DeJyqcqRCBWF0PVDjXwgxINy/Mf/PIFBg2fJOpxtxiepFVMU
         Jk50ps8jibVEGFpSzbrLDu0GamBw4GiELTFEgrdjpt+eECb1Cx5gZ/4Sh+H2krEIWECF
         yFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IbrpZNbxBovX3lv+iUNCnnLKCimy2IoB7zRn66sHf4g=;
        fh=XL5Dxk5PI9oBiQgsRe5g/9lyu3gh5mgxOXNCOGBAKr0=;
        b=GK12ene4yRnJuSmHL8AnD7pD4gpR8fBpranVM1G1EDhxwxKnDr1pHdlm3a/F0qOVj7
         +jVQvM7SEoVc5RcwsCZr3w7aIHbFNCCrl1+ho2035zzwe1/FurwP3viQ6//zM+69FEUm
         STLU7mktfk/X2bYn2fiRZ9QAiJtOp9pr9BzHcPCigQ1wyIEfkZ7emiSoz23JEDf9MRxB
         Ysa9D1bLJKN36iXEqqR25O+JYlVKEvlpMAkkTOPugxugUUVtnLco+cnq3N2bjomiYI4U
         ganXtvKIaFgoWPZ+19RyfrZ57py1oAPKJ0YnuIRUDY/NvCq0m6/cOmlEkb7n6N7gpOvB
         MJGA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773246417; x=1773851217; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IbrpZNbxBovX3lv+iUNCnnLKCimy2IoB7zRn66sHf4g=;
        b=LUBOV0BYyY8lHUom85aQ62r1HsxZydE1cjkeuT3nOiemLeBSrcjGgDjx6c7qQw5dlw
         q1ssSrxJPQRGNLAqlFOhgw7dppqI17LacE8eL/Bio+ief528p4wcBYL4L23vPy8Teteq
         wcDOg9/PJv+Rup4DYgML1BLZ0j4YH+3/FJSDHUX2vLBFvA8v68uvY3IlmWOpS0eu2yQA
         ggqMrElqfYe1WBekeKa+MQYmg5mveA4yZXpx/hZWcRgWJC99lS7tyxkMPw9YDiTCRAbO
         o/qHGzzgEtd+gE4480dF1BTnUBD0m4LSpWSvu45IvwDvDWMl/dGpQzAm/qO+4CTTZTb+
         zZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246417; x=1773851217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbrpZNbxBovX3lv+iUNCnnLKCimy2IoB7zRn66sHf4g=;
        b=Zkm0ZPHGS+oA60nsm1FbyncOFgRoVnVocmgMJT/8zE8CCEwd1QtLWzJV7Yvy82hBPV
         IgHb9u13MsErQ38mWLmvnQtYocc3lRMf8B8weCj6XZrqZ0PixLbjm2rZMYnAvmE8XrZ/
         SF8Te47F3SNcua7RBfc+DQizlzN4VsJpIOemNbZx3dqrmXPz0NX+PRVc+Yppnt/RsyJ0
         w2/ri/rm0TwfZSjKOFtdWMdjCLt4uFxi0f/omDz+jA8lPea4kOXF9O2QVlpVEpcRMwKj
         itTYWMul3qCcAGp6fTdqwEc3OgGAuNQsKgHROoIgpLuNNDX40+hVk1IZRiCrZZjWy2XA
         LZsQ==
X-Gm-Message-State: AOJu0Ywme03qfdMjpKLYLnlGTJBweMddJDvy6g+fPXPk1/wNISHREa0t
	R2TsWQNDQl0lUaFf8DcUxlAY8UGRD51TRd83/AomH7DqZL4d9oaVuOn1Uxd/MdWxiAGjKTNrQLJ
	7W3wXs5H3U+JN45unin0gfZdvoJiaBpw=
X-Gm-Gg: ATEYQzz3A/f1OBnHEqacqlOOlIuZ1nmwuPZO6OOvfv2kAvKzRjoHWKtzMS6hcYh0s5q
	3OQQ10yZE/7pJ47gK90zeCNGL8+iaNcZyO4rUOzgRnWxNTdnhz+Irhx7n2xlhJ/rN38avluQk80
	MGgmDLm0P22H6T1kmuOPTNnZv+VFSA/i96rjzvAo0Ww0FfNPtTuutRuoPHGmUj1tAyT60SbYUij
	a+9eYRbonOiBUsiKCl0rIv53KIoFKml/4Irp6vRtpr4AilwOBe5JPolV+vkstxXP8/dUuWrO0XO
	VgXCycHgfzfnRTk/Gik0UpNJVkfG79UoiIJsfBq8eA==
X-Received: by 2002:a05:6214:4116:b0:89a:d41:b1cc with SMTP id
 6a1803df08f44-89a66b5a31emr42388266d6.47.1773246416681; Wed, 11 Mar 2026
 09:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260302132815.2922014-1-sunilkumar.dora@windriver.com>
 <CANNYZj8TCoYWsniWbOK0-eaTOg+8npU3fxAMFifsS2MjPaYPRQ@mail.gmail.com> <DS0PR11MB790166352B5EF4401D9EA681E047A@DS0PR11MB7901.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB790166352B5EF4401D9EA681E047A@DS0PR11MB7901.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Mar 2026 17:26:45 +0100
X-Gm-Features: AaiRm53RKjN0QXisEKai9ALHB28c1EjUggbnzvc0x_8pWFtLfMp3l1m3rkeEK4E
Message-ID: <CANNYZj80WP1SdzzZTADBf1M_EQpEuybNV-ywQU8d9qn-m_ip0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Enable dynamic LLVM linking for nativesdk-rust
To: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"Varatharajan, Deepesh" <Deepesh.Varatharajan@windriver.com>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 16:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232895

On Wed, 11 Mar 2026 at 14:46, Dora, Sunil Kumar
<SunilKumar.Dora@windriver.com> wrote:
> Regarding the bootstrap binary you mentioned (rustc-1.93.0-src/build/bootstrap/debug/rustc), I tried to reproduce the issue locally by following the steps discussed earlier in YPBZ-16058.
> With the current change, where rust-native and nativesdk-rust link LLVM dynamically, I was not able to reproduce a crash in the target rustc.
>
> It is possible that I may be missing something in the setup. Could you please suggest if there are any additional steps to confirm whether target Rust builds could also be affected?
>
> Moreover, we have not seen any target rustc crashes in AB so far (with rust-native currently linking LLVM dynamically in oe-core master).

Hello Sunil,

as you know, rustc crashes require a very particular build sequence
involving cross-distro llvm sstate sharing. Autobuilder probably
hasn't hit that combination of distros yet.

Here's how I confirmed target rust is also affected.

First, the logs:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5451595/raw_inline
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5464376/raw_inline

I wasn't quite correct: the crash is not in bootstrap rustc, but in
stage1 compiler, particularly
/srv/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp/work/x86_64-nativesdk-oesdk-linux/nativesdk-rust/1.93.0/sources/rustc-1.93.0-src/build/x86_64-unknown-linux-gnu/stage1/lib/librustc_driver-589f8dcb4946d37d.so

Then, I ran this locally against current master (e.g. only native rust
is using shared llvm linking):
$ bitbake -c install rust-native rust nativesdk-rust

Then I went and inspected
build/x86_64-unknown-linux-gnu/stage1/lib/librustc_driver-589f8dcb4946d37d.so
in all three build directories.

rust-native is linking stage1 pieces with libLLVM.so dynamically:

$ ldd /srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/rust-native/1.94.0/sources/rustc-1.94.0-src/build/x86_64-unknown-linux-gnu/stage1/bin/../lib/librustc_driver-f5e56a2b9cd1fb54.so
    linux-vdso.so.1 (0x00007f1ee2f7a000)
    libLLVM.so.21.1 =>
/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/rust-native/1.94.0/recipe-sysroot-native/usr/lib/libLLVM.so.21.1
(0x00007f1ed6e00000)
    libstdc++.so.6 => /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f1ed6a00000)
    libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f1ee2f3a000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f1ed680b000)
    /lib64/ld-linux-x86-64.so.2 (0x00007f1ee2f7c000)
    libffi.so.8 =>
/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/rust-native/1.94.0/recipe-sysroot-native/usr/lib/./libffi.so.8
(0x00007f1ee2f28000)
    libz.so.1 =>
/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/rust-native/1.94.0/recipe-sysroot-native/usr/lib/./libz.so.1
(0x00007f1ee2f0e000)
    libzstd.so.1 =>
/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/rust-native/1.94.0/recipe-sysroot-native/usr/lib/./libzstd.so.1
(0x00007f1ee2e41000)
    libxml2.so.16 =>
/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/rust-native/1.94.0/recipe-sysroot-native/usr/lib/./libxml2.so.16
(0x00007f1edd2c3000)
    libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f1ed6d10000)

nativesdk-rust and target rust do not, which means they both
statically link with llvm:

alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ldd
/srv/storage/alex/yocto/build-64-alt/tmp/work/aarch64-nativesdk-pokysdk-linux/nativesdk-rust/1.94.0/sources/rustc-1.94.0-src/build/x86_64-unknown-linux-gnu/stage1/bin/../lib/librustc_driver-cb9e6f92243d3a7f.so
    linux-vdso.so.1 (0x00007f5b44adc000)
    libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f5b39d10000)
    libz.so.1 =>
/srv/storage/alex/yocto/build-64-alt/tmp/work/aarch64-nativesdk-pokysdk-linux/nativesdk-rust/1.94.0/recipe-sysroot-native/usr/lib/libz.so.1
(0x00007f5b39cf6000)
    libzstd.so.1 =>
/srv/storage/alex/yocto/build-64-alt/tmp/work/aarch64-nativesdk-pokysdk-linux/nativesdk-rust/1.94.0/recipe-sysroot-native/usr/lib/libzstd.so.1
(0x00007f5b39c29000)
    libstdc++.so.6 => /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f5b39800000)
    libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f5b39bfc000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f5b3960b000)
    /lib64/ld-linux-x86-64.so.2 (0x00007f5b44ade000)

(running ldd for target rust shows the same output)

This almost certainly means that the proposed nativesdk-specific fix
is incomplete. It needs to apply to all possibilities, nativesdk,
native and target.

Alex

