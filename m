Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2458CC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:14:35 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.8757.1738142072627100529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H8rfhwfJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f664af5so74972195e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 01:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738142071; x=1738746871; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nkdtfva6CldqahY1dP+T7YcdMDvwl3x/AknuMaHmfeI=;
        b=H8rfhwfJxuFbBrZrG3OncT2XT8D+F2CK4ZYEc9PyYvHccrHk5sQNgKxW77TzOhPlEJ
         gGYHpIkyB4Y/oQ+uYZLxD4iQsFxLHYp+ctVZzwsZpxJWOQunP7NaxTJgM7YohoBJ4iXt
         oueJiZf2DPdqIaruK95MvdPEecCQgrypdrNonZvdUCyEMDYBDEzGNuxQA9nWd4JRMvWe
         GFtUTx9BxLo7PXIoZWfC5WGMbyJkl/igrxRcE3dhP6obwy1c7It76ku8d6L7QQfuaISK
         kyCvarsZG7Bn0nTstKxRW/GtnjBFphsRDUfHd+a9Y5R8R7+JM/MzYL0uxwRGgHgZIhRe
         5ITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738142071; x=1738746871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nkdtfva6CldqahY1dP+T7YcdMDvwl3x/AknuMaHmfeI=;
        b=K5+Dj+484aUOFBWjprlQZzSAKTsOel84gB4zB+zvJhhczdPW8Gf6ooC5Z7oGi6503M
         kWuRQG84kadAUAlhQjOeTxCz24/4gTC8z3EPWxkyyqKYLbd8oAgRsSIGZZJ6deMi7k0w
         PdbReq79G7KNbGaUVmY3XC9kkbRPyv1J3YwGQvGICzQcDi0h+rZPwwri7s+Orop3cxbx
         33ZuZjkactP4vDPoV8iGty0UdjEo3A0xdKbnqx7M+SAxgvncDqFXS9ev/qTkRZ8sUwzt
         XP0Pfdra9DK+A0+jnvG184vL3mPPlqRf3LkeAKhmcFZU4XjEz0wRoqq1PepYIQRaSRqH
         XAVA==
X-Gm-Message-State: AOJu0YyW/Kbkgnc4Pr+CQHvxrvc0AlFkt9oawAGYG3dm7JG/DHdPGlxN
	AP7n7G+z0/kVdHgf9LNxWa//7n9FPk4gRJry0QAoKpkg6II4WtJA
X-Gm-Gg: ASbGncv+fCBqF5g55dN8TUbW9FdKh2qA9rIVKzvsUXdp9/bVmumNWPHXndoUSoeW9AW
	Fu7ARza/8iFWNdr0FyyK+gNJm2BxiuVdYdIInNa3oXaspxy7hZKTppVIIYqXzgCu+l0YRo4rotK
	WptXhJ7Zv+4ureRvURh9skbqrRowCK6ELRUNM8izJLxdIjoiVE+9LufSWfr47csPwq+hyAPcxuT
	BMrJUbCRorEaPsiNQIiU/h+YcH3Yl0UF0pMUnBdPfgq14HV6sjKYUQSR/gGbhE1BHQmm/zBYJrG
	ej0dCOzIRBJhJGTgqAo9bUlE/Zn0u9wzu2dcqcvaa8fuiKFJ
X-Google-Smtp-Source: AGHT+IHePfp6m0/Ki4sJb30KH2I/9VbeLdvmRkXhQTGR+7o6YN7Unov8KYP7yuQj8Bc+c6hTX5D0rQ==
X-Received: by 2002:a05:6000:4024:b0:38a:8ace:85e8 with SMTP id ffacd0b85a97d-38c51e8e42fmr2117071f8f.44.1738142070613;
        Wed, 29 Jan 2025 01:14:30 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176548sm16119296f8f.5.2025.01.29.01.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 01:14:30 -0800 (PST)
Message-ID: <1a79fe44-ae6b-4a93-b321-f938c7ad500e@gmail.com>
Date: Wed, 29 Jan 2025 10:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/3] rpm-sequoia: New recipe for version 1.6.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129080902.1863054-1-zboszor@gmail.com>
 <20250129080902.1863054-2-zboszor@gmail.com>
 <CANNYZj-pUVu_vp7DERcSF__LcRWi3oA4hocfEqfKPW_KxmrGZg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-pUVu_vp7DERcSF__LcRWi3oA4hocfEqfKPW_KxmrGZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 09:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210356

2025. 01. 29. 10:05 keltezéssel, Alexander Kanavin írta:
> On Wed, 29 Jan 2025 at 09:09, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> +Subject: [PATCH 1/2] Make openssl the default signing crypto
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Idea taken from the Fedora 41 rpm specfile, extended to build.rs
>> +to make it actually build. Give credit where credit is due: the
>> +Cargo.toml part of this patch is identical to the Fedora version.
>> +
>> +Signed-off-by: Fabio Valentini <decathorpe@gmail.com>
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +Upstream-Status: Inappropriate [Yocto specific]
>> +---
>> + Cargo.toml | 5 +----
>> + build.rs   | 8 +-------
>> + 2 files changed, 2 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/Cargo.toml b/Cargo.toml
>> +index 7832878..1024cad 100644
>> +--- a/Cargo.toml
>> ++++ b/Cargo.toml
>> +@@ -43,11 +43,8 @@ crate-type = ["cdylib"]
>> +
>> + # We explicitly do not want to enable Sequoia's decompression support.
>> + # Hence we only select a crypto backend.
>> +-default = ["crypto-nettle"]
>> ++default = ["crypto-openssl"]
>> + crypto-nettle = ["sequoia-openpgp/crypto-nettle"]
>> + crypto-rust = ["sequoia-openpgp/crypto-rust"]
>> +-crypto-cng = ["sequoia-openpgp/crypto-cng"]
>> + crypto-openssl = ["sequoia-openpgp/crypto-openssl"]
>> +-crypto-botan = ["sequoia-openpgp/crypto-botan"]
>> +-crypto-botan2 = ["sequoia-openpgp/crypto-botan2"]
>> +
>> +diff --git a/build.rs b/build.rs
>> +index 1fdef4e..cdbbe88 100644
>> +--- a/build.rs
>> ++++ b/build.rs
>> +@@ -30,16 +30,10 @@ impl PkgConfigTemplate {
>> +             ("VERSION".to_string(), env!("CARGO_PKG_VERSION").to_string()),
>> +             ("HOMEPAGE".to_string(), env!("CARGO_PKG_HOMEPAGE").to_string()),
>> +             ("REQUIRES".to_string(),
>> +-             if cfg!(feature = "crypto-botan") {
>> +-                 "botan-3"
>> +-             } else if cfg!(feature = "crypto-botan2") {
>> +-                 "botan-2"
>> +-             } else if cfg!(feature = "crypto-nettle") {
>> ++             if cfg!(feature = "crypto-nettle") {
>> +                  "nettle"
>> +              } else if cfg!(feature = "crypto-openssl") {
>> +                  "libssl"
>> +-             } else if cfg!(feature = "crypto-cng") {
>> +-                 ""
>> +              } else if cfg!(feature = "crypto-rust") {
>> +                  ""
>> +              } else {
> I don't understand. It seems like this changes the default crypto
> choice, but why not simply pass openssl selection as a parameter from
> the recipe?
>
>> + Cargo.lock | 1049 +++++++++++++++++++++++++++++++---------------------
> If this is updated correctly, then the change to cargo class in
> another patch should not be necessary.
>
> Also, this file is going to be a royal pain to keep updated with
> sequoia version updates. Another reason not to patch rust sources when
> it can be avoided.
>
>
>
>> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb
>> @@ -0,0 +1,40 @@
>> +SUMMARY = "An OpenPGP backend for rpm using Sequoia PGP"
>> +HOMEPAGE = "https://sequoia-pgp.org/"
>> +LICENSE = "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT & Unicode-DFS-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) & (Unlicense | MIT)"
> This is very elaborate, how was it determined? How to ensure it remains correct?
>
>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ff5ff7747cf7d394079c6ae87f5f0c"
>> +
>> +DEPENDS = "openssl"
>> +
>> +inherit pkgconfig rust cargo cargo-update-recipe-crates
>> +
>> +CARGO_USE_OFFLINE_FLAG = "1"
> As explained above, this should not be needed if Cargo.lock is correct.
>
>> +export CARGO_PROFILE_RELEASE_BUILD_OVERRIDE_DEBUG = "true"
> Why? Things like this need a comment in the recipe.
>
>> +do_compile:prepend () {
>> +       mkdir -p ${S}/target/release
>> +}
> Why?

For the same reason your own half baked recipe has it.
https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/rpm/rpm-sequoia_1.5.0.bb?h=akanavin/package-version-updates-later

| Caused by:
|   process didn't exit successfully: 
`/home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/rpm-sequoia/1.6.0/build/target/release/build/rpm-sequoia-cae33956cd11baf0/build-script-build` 
(exit status: 101)
|   --- stderr
|   thread 'main' panicked at build.rs:119:36:
|   Creating 
"/home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/rpm-sequoia/1.6.0/sources-unpack/git/target/release/rpm-sequoia.pc" 
(CARGO_TARGET_DIR: None): Os { code: 2, kind: NotFound, message: "No such file or directory" }
|   stack backtrace:
|      0: rust_begin_unwind
|      1: core::panicking::panic_fmt
|      2: core::result::unwrap_failed
|      3: core::result::Result<T,E>::expect
|                at 
/rustc/eeb90cda1969383f56a2637cbd3037bdf598841c/library/core/src/result.rs:1059:23
|      4: build_script_build::main
|                at ./build.rs:119:18
|      5: core::ops::function::FnOnce::call_once
|                at 
/rustc/eeb90cda1969383f56a2637cbd3037bdf598841c/library/core/src/ops/function.rs:250:5
|   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.


>
>> +do_install () {
>> +       mkdir -p ${D}${libdir}
>> +       install -m0755 ${B}/target/${RUST_TARGET_SYS}/release/librpm_sequoia.so ${D}${libdir}/librpm_sequoia.so.1
>> +       ln -s librpm_sequoia.so.1 ${D}${libdir}/librpm_sequoia.so
>> +
>> +       mkdir -p ${D}${libdir}/pkgconfig
>> +       install -m644 ${S}/target/release/rpm-sequoia.pc ${D}${libdir}/pkgconfig
>> +}
> Why can't we use upstream's standard install procedure? Also,
> cargo.bbclass has an install function, why is it completely replaced?
>
> Alex


