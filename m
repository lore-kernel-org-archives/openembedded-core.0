Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E03E732CA
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 12:47:46 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.12669.1695905260771430890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 05:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UCjp2PtF;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c16bc71e4cso111390211fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 05:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695905259; x=1696510059; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V4R+BN3NF6qu+mvi8cZob/sRmQAXHNXDTsQZ1OzNvsA=;
        b=UCjp2PtF3sfzi4z58XJtRs7zrSEqFvf8hVHLy+b88w/iyhO24XDMQ47+V8ZXuJsJHz
         R7TGlYwMrZKSJIMLbeZQ18Y+NUK5U6Bld/5aonD2eLBbUS7Hl/R15TuUYxP9zO38ZJw8
         M9tPur2wZp1zLLUdE9b3v9A3L2vIS6rUgbFXVcsitIjRcD7LxIj0SVnw15zDsqScJzlh
         CY2ZL/RwrHIwj/FO2RknqmmDLVkpfQi5k3hDX06/2jIqtm4baQqh59yh0TkuUj7gcb+D
         VgVMuJvtjVm0iWnPSfCcnps1m0fkvx+ovWpd7Avc0LQU2udJf2YV3252XHVM3Hhx1NJK
         Mtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695905259; x=1696510059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4R+BN3NF6qu+mvi8cZob/sRmQAXHNXDTsQZ1OzNvsA=;
        b=oKKAEGYNj/sn5H85uZLaMosmnjMvyrobdYmYKJbFMnuvrEh13D4pnu4KO91vtB2Abm
         FmQQg4O5D51fCElQQfZ0EZPEetUShIlo+I5T8c06uVbI4vkzMH2qBkqE2DANCPfX+4EW
         umTBeHGt0e+m+ZtIaYVz6TtQ7tw6k+8QbpadjnR+Q6uPsfUIagJxcVALtCXz46Hr/Zxc
         Ibah9A+NRKXi3bsBidoPi17AAaOu5wAzZcFjrNvjd4A6tzp65abIVQ1XxxHcXE/iqQ9S
         F3jlpLBU1S/8x+I1U8vZVPZh47C3TDsjIA8uDsfdzt9ezjXvtYw6E3FjfBM/feYj2FAZ
         fdSQ==
X-Gm-Message-State: AOJu0YwsuSPQZ5qm618qvI3gFAZVPL2/y67xrcb14l2C+P81M7E7F3GM
	hZ51E9yqHwIbmjKTi9/jHrUYGNhqQ0PCzI+MK9s=
X-Google-Smtp-Source: AGHT+IG+Q6fTs5l+g0xbqD2/Oml2eahjaE9T2FS8iLaSDajyGVt8RPLO/FvZxIdhZMjo2sdQknsorPAoFH1lPEpznH4=
X-Received: by 2002:a2e:b0d5:0:b0:2c0:23d3:daee with SMTP id
 g21-20020a2eb0d5000000b002c023d3daeemr1101817ljl.39.1695905258657; Thu, 28
 Sep 2023 05:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230928081035.604380-1-sean@geanix.com> <20230928081035.604380-2-sean@geanix.com>
In-Reply-To: <20230928081035.604380-2-sean@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Sep 2023 14:47:27 +0200
Message-ID: <CANNYZj9mQZuFDUCVVZDMpm0zPVFwDTW-w55i6NRpCwSja6aNjw@mail.gmail.com>
Subject: Re: [OE-core][RFC 2/2] rust-cross-canadian: set CARGO_TARGET_<triple>_RUNNER
 for nativesdk
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, kasper@krinvent.dk
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 12:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188372

This seems like a good change (being able to easily run items built
with c/c++ tolchains in yocto SDKs is a problem no one has
satisfactorily resolved, and it's nice that rust got this right), but
can you expand the test in meta/lib/oeqa/sdk/cases/rust.py to cover
possible target options such as this one?

Alex

On Thu, 28 Sept 2023 at 10:10, Sean Nyekjaer <sean@geanix.com> wrote:
>
> This will enable us to build and run rust programs on the sdk host.
>
> % cargo run --target x86_64-oesdk-linux-gnu -vv
>        Fresh hello v0.1.0 (~/development/hello)
>     Finished dev [unoptimized + debuginfo] target(s) in 0.02s
>      Running `/usr/local/sdk/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so.2 target/x86_64-oesdk-linux-gnu/debug/hello`
> Hello, world
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta/recipes-devtools/rust/rust-cross-canadian.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> index d25646237c..5b89216658 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -55,9 +55,12 @@ do_install () {
>      RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
>
>      RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
> +    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
> +    SDKARCH=`echo ${SDK_ARCH} | sed 's/_/-/g'`
>
>      cat <<- EOF > "${RUST_ENV_SETUP_SH}"
>         export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
> +       export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/ld-linux-${SDKARCH}.so.2"
>         export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
>         EOF
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

