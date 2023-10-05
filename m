Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7D8E7C4FE
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 08:58:56 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.11124.1696496329837320007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 01:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hicyGRRP;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c008042211so8942581fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696496328; x=1697101128; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SYH3D7xSJmQPj/bKXglDfeiMDFVZza7SURUYEUjXJc4=;
        b=hicyGRRPg5TdhFnU9b8q6PDWbAc5EiesEbMejJ+E4+AkiAO21EQUjewVM0Mt5r4wf0
         iWawuzee7nuxVAPkZe7XXl7bxciOZ8xLvz9f4aPnxds0R2NuqOCjj4iP3C1/Ji31k5rO
         WGvHXJ1JktGyP6JQniRy6QtgIx6Jz4InD4O09VyNSkW1u4XgJ4CjUNHskgWGlql6SMQ0
         FFN7q766n54lBueTOGicHWvZZv7dKtAlVMmoNPnq5KZ3F1kyP71G/dXrQpDzLp4NqUvG
         G1PiT08KTyohLdgN9pVas2VyjUNQYxTx02m2mhNh0rZzmQ3mFGliOzRMDVTP5Td+51YP
         f2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696496328; x=1697101128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYH3D7xSJmQPj/bKXglDfeiMDFVZza7SURUYEUjXJc4=;
        b=OWD+BCN3qAMH08cHIhm93jVSNCcLBFAIqtTeuCpn386eRoQsx29KXj4HwNkIvoounm
         Yovl6+23kgIWofDfE449FQFrB1jxmmNpwDBZhXHMMKE3LtKdYex3mrVGbMdwnd3Mo9DL
         5emlUKejIqCWleoWNo6t6LXafogNxoIDEdspmoXxBwjseTXQIrxNhwNGExgMjLrdCaqr
         K/pKX/OjjAtmx0GbqJKa/lbEeRuLP3oBfBrt+5+HpWXv3qGKgT+BUlFLEXSTjSKs+xOe
         kNixpVSL3s7zFZdkWN2JTvC1UM7eZevKO1D7ud5RdAcw4iSVRy8QhFCuG83lcry4NLjQ
         GDPA==
X-Gm-Message-State: AOJu0Yw5Wt72SKQWMCXTV17AEaLkJ2BguJxILRV+Wi42nz0ekV1kMBvb
	AKI3U1jLDuuQ3M/0qzoVN2fc6f00H3nlWa7wYxg=
X-Google-Smtp-Source: AGHT+IH84jzNiX51iCzv2nx0H8L9vJlxoJJToZGql3NT3bMzXAw3x8gCRVs8D222YauHb7+RGrYAzMeYK3bTnX+yOws=
X-Received: by 2002:a2e:9888:0:b0:2bc:d8cb:5a13 with SMTP id
 b8-20020a2e9888000000b002bcd8cb5a13mr4478290ljj.42.1696496327887; Thu, 05 Oct
 2023 01:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230928081035.604380-1-sean@geanix.com> <20230928081035.604380-2-sean@geanix.com>
 <CANNYZj9mQZuFDUCVVZDMpm0zPVFwDTW-w55i6NRpCwSja6aNjw@mail.gmail.com> <1696245131835.6.23594@webmail-backend-production-787464fbc7-86bhw>
In-Reply-To: <1696245131835.6.23594@webmail-backend-production-787464fbc7-86bhw>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Oct 2023 10:58:47 +0200
Message-ID: <CANNYZj9fD256i8hzOuvSswfMLBv6NZ+fK+wjEActVoFrOYdZXQ@mail.gmail.com>
Subject: Re: [OE-core][RFC 2/2] rust-cross-canadian: set CARGO_TARGET_<triple>_RUNNER
 for nativesdk
To: kasper@krinvent.dk
Cc: Sean Nyekjaer <sean@geanix.com>, openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>, 
	Adrian Freihofer <adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188711

I think Adrian made the most progress in addressing this problem, so
you should discuss/cooperate with him.

Alex

On Mon, 2 Oct 2023 at 13:12, Kasper <kasper@krinvent.dk> wrote:
>
> Hi Alexander
>
> I am in the same team as Sean, and we really like the way it is solved in Rust/Cargo.
> However, we have the issue also for C++, and as you state there is no obvious solution.
> We are using cmaake for our C+++ projects and are discussing if a solution is to try to make
> a cmake toolchain file for the oesdk environment as well.
> If you have any experience/input it would be highly appreciated.
>
> Br
> Kasper
>
> On September 28, 2023 at 2:47:27 pm +02:00, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> This seems like a good change (being able to easily run items built
> with c/c++ tolchains in yocto SDKs is a problem no one has
> satisfactorily resolved, and it's nice that rust got this right), but
> can you expand the test in meta/lib/oeqa/sdk/cases/rust.py to cover
> possible target options such as this one?
>
> Alex
>
> On Thu, 28 Sept 2023 at 10:10, Sean Nyekjaer <sean@geanix.com> wrote:
>
>
> This will enable us to build and run rust programs on the sdk host.
>
> % cargo run --target x86_64-oesdk-linux-gnu -vv
> Fresh hello v0.1.0 (~/development/hello)
> Finished dev [unoptimized + debuginfo] target(s) in 0.02s
> Running `/usr/local/sdk/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so.2 target/x86_64-oesdk-linux-gnu/debug/hello`
> Hello, world
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> meta/recipes-devtools/rust/rust-cross-canadian.inc | 3 +++
> 1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> index d25646237c..5b89216658 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -55,9 +55,12 @@ do_install () {
> RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
>
> RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
> + RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
> + SDKARCH=`echo ${SDK_ARCH} | sed 's/_/-/g'`
>
> cat <<- EOF > "${RUST_ENV_SETUP_SH}"
> export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
> + export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/ld-linux-${SDKARCH}.so.2"
> export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
> EOF
>
> --
> 2.42.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188370): https://lists.openembedded.org/g/openembedded-core/message/188370
> Mute This Topic: https://lists.openembedded.org/mt/101633983/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

