Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8ECC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 06:53:14 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.8464.1699426391037662310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 22:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=krZVNvQh;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1ead2e6fab7so3890915fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 22:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699426390; x=1700031190; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqMBdkIDjnXnciiY43dDQRpR3axTTMCQBP+hj9GYDUg=;
        b=krZVNvQh6AnkecQDGRpz2+thCBRTKMu6RPUhlURpCgLVFNt+JEdQVBOgZpKZ7bzvh4
         N+AOSDnEq52XqYSE4fvLlYv2sm47fzXXL2Fy7PoDHOEAOPzhlYZmy3UfjDizCOiNLrGD
         1JBv9OsTMlFUkpTL+89qEnrwqqEDWWR7DHrQcoEU7kMui943yBAI22qKvTiQG8eZQKse
         upi0dayy0UZJxdC462Zt3UlHK/I9rz+9kvxDZhAM7GMkPTNLcoy4XkFVxsvuU6EjA9rF
         yIbFDUry47Qw9fqPd3NBVeDBEF9WSTBcACjfvHhg8Y2ql9P8QovnnoLD0SBUSwIVCxCq
         TWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699426390; x=1700031190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqMBdkIDjnXnciiY43dDQRpR3axTTMCQBP+hj9GYDUg=;
        b=gCUTw7ACJzN/xERymhZvcr/6Sbp70QHCSXM/CVtQkhof8SCVZY4ysKiAlDTTMCsj9F
         HD1VB0Av8sKPdiCMEbOUg6w6iolTJYmdfh7GQ/omgInDK6ILzh8Bx7pX7Hvl+EnQq8lF
         3ijCFk43R2kJfNgmrZit6UkN7TqfkHd6hcLlTIs4mmQG6pOEphw1WTNZBlpOUApW87jA
         PJjm0CATODs6QuJkAfMdCA4q5E9ks4VzObBfqA5OIO8w+g8NukQs+zfHRVRBYO40zyo+
         1oSPhrjU1xFqgXkg2xS4L0cCeiQfi/Of1xh5Zb6LPisrW+7N0MPKqTZ1Sl4zXyfFsH10
         0jQw==
X-Gm-Message-State: AOJu0Yx8wLTTd2kJEIL/VWk7RSw7wQZPPPTqwy3CzGctaruVP49Sf+Nw
	Q/9XW50wTQ3k78NFE5QoPpgdgCH49eiDxaFiFY46OLRQmj8=
X-Google-Smtp-Source: AGHT+IFaYG0tMNLtIc4x/xYScmUhLJy7B9aUwp8XOYtJg6nmO1IlKctZ4RO938NG+bCERDDQcZ0m9mq8JxhMOe7ci0w=
X-Received: by 2002:a05:6870:f81a:b0:1e9:97eb:15a with SMTP id
 fr26-20020a056870f81a00b001e997eb015amr1164606oab.36.1699426390144; Tue, 07
 Nov 2023 22:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20231108060904.2305647-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20231108060904.2305647-1-Deepthi.Hemraj@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Nov 2023 22:52:43 -0800
Message-ID: <CAMKF1sq68hCc_kC4D90_=UqNURyBiOCukNiM6UqvV1UKvz-1aQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: Fix file conflicts for arm
 and aarch64
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190305

On Tue, Nov 7, 2023 at 10:09=E2=80=AFPM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> [YOCTO #15061]
> Rust multilib sdks broken because of the conflicts between attempted inst=
alls of rust-cross-canadian for arm and aarch64.
>
> Arm and aarch64 target architectures are trying to install cargo.sh and r=
ust.sh in the same path which resulted in the issue.
>
> The current patch modifies CARGO_ENV_SETUP_SH and RUST_ENV_SETUP_SH macro=
s based on the architecture.
> Hence, creates different file names for the environment setup scripts and=
 resolves the issue.
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  .../rust/rust-cross-canadian.inc              | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/re=
cipes-devtools/rust/rust-cross-canadian.inc
> index 7bfef6d175..94c3b0d696 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -54,6 +54,18 @@ do_install () {
>      mkdir "${ENV_SETUP_DIR}"
>      RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust.sh"
>
> +    # Set up environment variables for AArch64
> +    if [ "${TARGET_ARCH}" =3D=3D "aarch64" ]; then

change this check to '=3D'

> +       RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust-aarch64.sh"
> +       RUST_TARGET_SYS=3D"aarch64-unknown-linux-gnu"
> +    # Set up environment variables for ARM
> +    elif [ "${TARGET_ARCH}" =3D=3D "arm" ]; then
> +       RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust-arm.sh"
> +       RUST_TARGET_SYS=3D"arm-unknown-linux-gnueabi"
> +    else
> +       RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust.sh"
> +    fi
> +
>      RUST_TARGET_TRIPLE=3D`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:up=
per:]' | sed 's/-/_/g'`
>      RUST_HOST_TRIPLE=3D`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:=
]' | sed 's/-/_/g'`
>      SDKLOADER=3D${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86=
-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2',=
 '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1'=
, '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${=
@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', ''=
, d)}
> @@ -67,6 +79,19 @@ do_install () {
>      chown -R root.root ${D}
>
>      CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo.sh"
> +
> +    # Set up environment variables for AArch64
> +    if [ "${TARGET_ARCH}" =3D "aarch64" ]; then
> +       CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo-aarch64.sh"
> +       CARGO_TARGET_SYS=3D"aarch64-unknown-linux-gnu"
> +    # Set up environment variables for ARM
> +    elif [ "${TARGET_ARCH}" =3D=3D "arm" ]; then

same here

> +       CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo-arm.sh"
> +       CARGO_TARGET_SYS=3D"arm-unknown-linux-gnueabi"
> +    else
> +       CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo.sh"
> +    fi
> +
>      cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
>         export CARGO_HOME=3D"\$OECORE_TARGET_SYSROOT/home/cargo"
>         mkdir -p "\$CARGO_HOME"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190304): https://lists.openembedded.org/g/openembedde=
d-core/message/190304
> Mute This Topic: https://lists.openembedded.org/mt/102459344/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

