Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C26C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 13:17:06 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.13239.1670505421634692275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 05:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JUxOUxO8;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id h10so1504818ljk.11
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 05:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a96mWH8ObS0vE/RnsGhHyhxaLbopNzOF+JgfFzm0CXI=;
        b=JUxOUxO8Ct5puQD3i3T5V/t4hvPsVHdVjIDFWKh1Sia4PT15ZaZ4Ee7b+WEz+euk+w
         Z5Jz7cpcAqi0CIJ/Y3K9lKMpw8+Gw21MOek1WBcMectkmbnvRo54tBZ99EjjRGOOSXUE
         yfzYTlf0FrYEwzVjgxJaABbrcCFyRjeOQ6YVD7nVRYoRMD5h80LnIajeJkPIaNT6Mwp7
         dfSeJL0OxOQact/sKD1PSW4X73VMMUugF7LeEcXSoo3DkK3pZSylM2MQO1dC6HzUtZ/N
         QSDoIp0dwdh5L8lptjgPplM6cLfGrT54WKL0eXLZr2P9FLZgfXXilPbKPJSFwsrI+XsD
         GBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a96mWH8ObS0vE/RnsGhHyhxaLbopNzOF+JgfFzm0CXI=;
        b=8RUYyhCoU5jd1sSMZR/tEr291sEkQvFpII8YJC8ymZjqk/k0H/mdg1ruwHq5U9yjmM
         tncX2luyFq7UmnVzKoGr3qcyLmICPa+X9n+mKoBkTSULLlyMXT7A+jz+QEoPd3EiVXzS
         /TMSVlaHKjAgtUJFWzZWsiv5nE8bWXPhRgiNypKRgGKKigFH9ZPkTOYa/7nwZ0QqzhaO
         sGucw3Jo8qe+Y1RL1faFRhGX3lKlivMZRXlAsqFoWVRkHWA66kh1PuWxz/PaXWiSt/He
         J2TimeRdlwAVKL38hCi6vnlQRRZhAtK0Q6Rmn2cj12/hxCRXeCGmMDN1xut2VNr5O+5E
         1c0g==
X-Gm-Message-State: ANoB5pn2kXluTZM5nqv/gHzizcB+1j1FBco+ABYVCt0FEICynlsfOdCg
	7qJN0k1ssGCRKRAQg/Hsj4h8wBSh1yHftCcKtg4=
X-Google-Smtp-Source: AA0mqf6Xg49UQzYPCWz6AFPauwVQ/G5xiZEYXArLSCMgeOUgms2YNcAa51L59+qLE+exrFGL8Xdkg13Z9wbnUMaDKRk=
X-Received: by 2002:a2e:94cb:0:b0:279:8865:38e1 with SMTP id
 r11-20020a2e94cb000000b00279886538e1mr20277101ljh.217.1670505419748; Thu, 08
 Dec 2022 05:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20221208112612.3023718-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20221208112612.3023718-1-sundeep.kokkonda@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Dec 2022 14:16:48 +0100
Message-ID: <CANNYZj_u7tJAiE3j0jasv2b7r-uJk-oiQs9giRuoAgv_SwzNyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: fix for target compilation failed issue
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com, 
	yashinde145@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 13:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174406

The json provided in the commit is x86-specific and will not work on
any other target.

Rather, you need to copy over and install the target json already
available in ${RUST_TARGETS_DIR} and generated according to the target
spec.

Alex


On Thu, 8 Dec 2022 at 12:26, Sundeep KOKKONDA
<sundeep.kokkonda@gmail.com> wrote:
>
> Rust code compilation on qemu failed with with below error.
> error: Error loading target specification: Could not find specification for target "x86_64-poky-linux-gnu". Run `rustc --print target-list` for a list of built-in targets.
>
> This patch fix the issue by adding the missing json file to the image.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  meta/recipes-devtools/rust/files/target.json | 39 ++++++++++++++++++++
>  meta/recipes-devtools/rust/rust.inc          |  9 +++++
>  meta/recipes-devtools/rust/rust_1.65.0.bb    |  2 +
>  3 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/files/target.json
>
> diff --git a/meta/recipes-devtools/rust/files/target.json b/meta/recipes-devtools/rust/files/target.json
> new file mode 100644
> index 0000000000..69dbbaa9f9
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/target.json
> @@ -0,0 +1,39 @@
> +{
> +   "arch": "x86_64",
> +   "cpu": "x86-64",
> +   "crt-static-respected": true,
> +   "data-layout":
> +"e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128",
> +   "dynamic-linking": true,
> +   "env": "gnu",
> +   "executables": true,
> +   "has-rpath": true,
> +   "linker-is-gnu": true,
> +   "llvm-target": "x86_64-unknown-linux-gnu",
> +   "max-atomic-width": 64,
> +   "os": "linux",
> +   "position-independent-executables": true,
> +   "pre-link-args": {
> +     "gcc": [
> +       "-m64"
> +     ]
> +   },
> +   "relro-level": "full",
> +   "stack-probes": {
> +     "kind": "inline-or-call",
> +     "min-llvm-version-for-inline": [
> +       11,
> +       0,
> +       1
> +     ]
> +   },
> +   "supported-sanitizers": [
> +     "address",
> +     "leak",
> +     "memory",
> +     "thread"
> +   ],
> +   "target-family": "unix",
> +   "target-pointer-width": "64"
> +}
> +
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
> index 956301023a..75473f967b 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -13,6 +13,10 @@ DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"
>
>  S = "${RUSTSRC}"
>
> +SRC_URI += "\
> +     file://target.json \
> +"
> +
>  export FORCE_CRATE_HASH="${BB_TASKHASH}"
>
>  RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
> @@ -217,3 +221,8 @@ rust_do_install () {
>  do_install () {
>      rust_do_install
>  }
> +
> +FILE_${PN} += " \
> +       ${WORKDIR}/target.json \
> +"
> +
> diff --git a/meta/recipes-devtools/rust/rust_1.65.0.bb b/meta/recipes-devtools/rust/rust_1.65.0.bb
> index dbf74cec8f..afef72e45c 100644
> --- a/meta/recipes-devtools/rust/rust_1.65.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.65.0.bb
> @@ -68,6 +68,8 @@ rust_do_install:class-target() {
>          chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
>      done
>
> +    cp ${WORKDIR}/target.json ${D}${libdir}/rustlib/${RUST_TARGET_SYS}
> +
>      chown root:root ${D}/ -R
>      rm ${D}${libdir}/rustlib/uninstall.sh
>      rm ${D}${libdir}/rustlib/install.log
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174396): https://lists.openembedded.org/g/openembedded-core/message/174396
> Mute This Topic: https://lists.openembedded.org/mt/95535785/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

