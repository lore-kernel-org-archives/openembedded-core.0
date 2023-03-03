Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C508AC7EE2F
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 19:08:57 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.906.1677870535271385238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 11:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YvmXxVlx;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id s22so4866291lfi.9
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 11:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677870533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1v9nXXYhsPT91Lddcdgt90rRNGugpCLyiUJx9cfKNOU=;
        b=YvmXxVlxnHaVwTf9/MQacyFTSy1teN6/g4Ll7cPF1XlsUgCPsNh5V83lyAa5CfttaN
         muXI0b3KhC47OB2l6iApME2fU7PclDuj1ejLryzbwqYj4H6uWhuutClMUd6ZzOwFZ2OC
         5Kc332VUIgODqdmu/A/KuhP7K+YBz0GKzxvxiw6lIBSC4ckTyPPbfLcKzrYwZn0Gx+Cj
         omZnCeGG7EbAMvsyHjQ2lAAD2/T9Vxycz7XF75933e4Qv0goWU8P5nDWZA4S2CCExXMB
         K/FDQyTKUEZ/LnC2K/7R8y6BS4IscDBe7nkvPoFFcWRq+Nr9pZzDw8sTlwimvZuoeX4+
         JqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677870533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v9nXXYhsPT91Lddcdgt90rRNGugpCLyiUJx9cfKNOU=;
        b=vc67++homJf224Qe/piLqVnrqld3ofTyGQS5eWqJuSTO7HgtVRh07lzIr5KmZgNFdM
         h9a23i+je6/RE/bz83d9d/iScVkV9zehQTVXr1HDFLzFCK49oP26/sJuavktDWvuFho9
         NS1F4jM675FU21vdEZbpf9cWVZk67g0kZMSt6ZHU7OpHQQGMUcbwjyX/h4q0/hwLBQtL
         NThwk03vgJgDq2R66xNwiU+o583+lC73y3ocCCSiWMAd202+YlxxYrSij4tYwxVYavtH
         HtUnTMfN+X4aGhF0wTp/yXQGbu/VYCnwIpvacEWtHfJxe/0Bq26mCXM+gjw26NbK0+ne
         qUzg==
X-Gm-Message-State: AO0yUKWbGdOYrfurDPlHx0BmRGYCaoGN4OX407Epyx6V7zNE9039ETvF
	WSbuITn2kvNQziJey4Bs+/IRpK/ZCS4k74QSa3o=
X-Google-Smtp-Source: AK7set9LtKE9hFH9fXifFeQGXgx/fo/xUTbYSKWVoEiRaaGtQVYXONoEConsMU7aoCsxoEj11Kx8d21TgHJGcfA0pqA=
X-Received: by 2002:ac2:5a0a:0:b0:4e0:39f3:5b9a with SMTP id
 q10-20020ac25a0a000000b004e039f35b9amr937733lfn.13.1677870533051; Fri, 03 Mar
 2023 11:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20230303184446.2507886-1-tom.hochstein@nxp.com>
In-Reply-To: <20230303184446.2507886-1-tom.hochstein@nxp.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 Mar 2023 20:08:41 +0100
Message-ID: <CANNYZj_icOJayS1odPQE4oi1bESHR5gTT=xJS7QA95ijRe=5fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: Fix wrapper handling of implicit setup command
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 19:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178022

This should have been caught by meta/lib/oeqa/sdk/cases/buildepoxy.py
- why wasn't it? Does the test need to be fixed?

Alex

On Fri, 3 Mar 2023 at 19:45, Tom Hochstein <tom.hochstein@nxp.com> wrote:
>
> From an SDK, running a meson setup build without an explicit setup
> command can result in a native build when a cross build is expected.
>
> The problem is in meson-wrapper where it tries to detect whether a
> setup command is being used. The logic looks through all arguments for
> a command, and the first argument it finds that doesn't start with a -
> is treated as the command. This doesn't work for an implicit setup
> command if any option with a space-separated argument exists. In this
> case, the argument is incorrectly selected as the command, causing the
> setup command options for the cross build to be excluded from the
> command line, and thus a native build.
>
> Improve the logic by just looking at the first argument. If it is
> a known comand, then record it. Otherwise just assume it is the
> implicit setup command.
>
> Note that this fix does not address the possibility of a new meson
> command. Two new echo statements are included to help the user in case
> of trouble:
>
> ```
> ~/git/weston-imx$ meson --warnlevel 3 --prefix=3D/usr -Ddoc=3Dfalse -Dbac=
kend-drm-screencast-vaapi=3Dfalse -Dcolor-management-lcms=3Dfalse -Dpipewir=
e=3Dfalse -Dbackend-x11=3Dfalse -Dxwayland=3Dtrue -Dsimple-clients=3Dall -D=
backend-wayland=3Dfalse  -Dbackend-default=3Ddrm -Dbackend-rdp=3Dfalse -Dte=
st-junit-xml=3Dfalse -Dlauncher-libseat=3Dfalse -Dimage-jpeg=3Dfalse -Dimag=
e-webp=3Dfalse -Drenderer-g2d=3Dtrue build
> meson-wrapper: Implicit setup command assumed
> meson-wrapper: Running meson with setup options: " --cross-file=3D/opt/fs=
l-imx-internal-xwayland/6.1-langdale/sysroots/x86_64-pokysdk-linux/usr/shar=
e/meson/aarch64-poky-linux-meson.cross --native-file=3D/opt/fsl-imx-interna=
l-xwayland/6.1-langdale/sysroots/x86_64-pokysdk-linux/usr/share/meson/meson=
.native "
> The Meson build system
> Version: 0.63.3
> ```
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta/recipes-devtools/meson/meson/meson-wrapper | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recip=
es-devtools/meson/meson/meson-wrapper
> index fca64a5692..7455985297 100755
> --- a/meta/recipes-devtools/meson/meson/meson-wrapper
> +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> @@ -13,20 +13,19 @@ fi
>  # config is already in meson.cross.
>  unset CC CXX CPP LD AR NM STRIP
>
> -for arg in "$@"; do
> -    case "$arg" in
> -    -*) continue ;;
> -    *) SUBCMD=3D"$arg"; break ;;
> -    esac
> -done
> +case "$1" in
> +setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewri=
te|compile|devenv|env2mfile|help) MESON_CMD=3D"$1" ;;
> +*) echo meson-wrapper: Implicit setup command assumed; MESON_CMD=3Dsetup=
 ;;
> +esac
>
> -if [ "$SUBCMD" =3D "setup" ] || [ -d "$SUBCMD" ]; then
> -    MESON_SUB_OPTS=3D" \
> +if [ "$MESON_CMD" =3D "setup" ]; then
> +    MESON_SETUP_OPTS=3D" \
>          --cross-file=3D"$OECORE_NATIVE_SYSROOT/usr/share/meson/${TARGET_=
PREFIX}meson.cross" \
>          --native-file=3D"$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.na=
tive" \
>          "
> +    echo meson-wrapper: Running meson with setup options: \"$MESON_SETUP=
_OPTS\"
>  fi
>
>  exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
>      "$@" \
> -    $MESON_SUB_OPTS
> +    $MESON_SETUP_OPTS
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178021): https://lists.openembedded.org/g/openembedde=
d-core/message/178021
> Mute This Topic: https://lists.openembedded.org/mt/97369067/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

