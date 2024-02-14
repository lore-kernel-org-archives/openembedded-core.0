Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2B7C4829A
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 06:39:30 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.36311.1707892766035940328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 22:39:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aznXV4su;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5119cfaeb9bso1589108e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 22:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707892764; x=1708497564; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jPqUg85DORfHmVu5tMeWX5XYV1TLiMroOmuUhvje3Is=;
        b=aznXV4suQmrY6eYo0SymnM7zr0wmGK+vykmRD8w0//vlKgsxGizv+CwUew0dN5Yagi
         Bk8LwR3WX0lmti2cECcRqpk1lMXaHARexvktvTJBJEhZAGCusgJLrrpd8oyMgO8LLOdj
         2RHTjFoPwzrA0qOJxMW1yG+Dh9R3Mr3du7NBCxBTgj4plwE9gdbkTl2jRLucTmUUv6kC
         75HuAzjJlbizruywS0mKUA1ypsghTCcAzBnbYm7DgKH13crC6jNzGmgfXAvKQUXVuP+c
         FMu2DYQ65ZFNMWW3ilDnpxLk7+Seo5PZ1hZttZWjH622q5KwmQCcCeCCsjz9em35GT5c
         vLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707892764; x=1708497564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPqUg85DORfHmVu5tMeWX5XYV1TLiMroOmuUhvje3Is=;
        b=hFB3WYj5MkZmv9zk+9BJFo8tGpTnLexGN/RRiwLFQ5GcfpQaiCC+AIh8tguDSPnBF7
         6qtICEr3IMRaRJF9RsELi5FWCnzdO0fN4g4Kq+RkFyOJhfLOvus5lQ/aXQhgQWkNfPiy
         jNVP9mGRpSa1KLF0nvkS3VeoBGtWQg8bm8y50aoceszaZj397CzOvzD3JiEiWcBM/2DL
         qB0aOU6rtR4hMu2N/0G6Ucv4HKqzsQSVTJ2qjUuC/jThum2EEnE4vp/4lXBoV8iyY/CS
         EevZFSvjPKJxRdQvKLjSAp90kslSBilkMLHcKpsXB6zznnvWkJLC/N3dM0RKziNcURpa
         P2iQ==
X-Gm-Message-State: AOJu0Ywrk0zReSvlvNB341cfCl6JQl3cwKMRqOzh48p25gaGG23LIy+B
	tWuSz6Q0qbI0LX4ndG/7iLKIHYqDLwt2XzpRk2MfAqbjTKQMys6nZyb9VPjU3BYEDdmw16zbqpn
	J4PHihOciQnWrNCqCxyoN4z8Im0IZ3lYm
X-Google-Smtp-Source: AGHT+IGzfL+eNjRgEAnDMf6QFLTrf1neERe8wNceN3ukVDj2c+Bxb4AyGTOBJQua0Wc1zmqhzWMnJ3ECIiSkMjonMjw=
X-Received: by 2002:ac2:5547:0:b0:511:878b:806 with SMTP id
 l7-20020ac25547000000b00511878b0806mr1065651lfk.2.1707892764037; Tue, 13 Feb
 2024 22:39:24 -0800 (PST)
MIME-Version: 1.0
References: <20240213221846.109260-1-adrian.freihofer@siemens.com> <20240213221846.109260-4-adrian.freihofer@siemens.com>
In-Reply-To: <20240213221846.109260-4-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 07:39:12 +0100
Message-ID: <CANNYZj_Gv1bxnYDembLCwqZ4D21iexPtphrDmJ7gwGeDM4-R3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/4] oe-init-build-env: generate .vscode from template
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 06:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195453

On Tue, 13 Feb 2024 at 23:19, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -59,6 +59,8 @@ if [ -n "$TEMPLATECONF" ]; then
>      OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
>      OECOREDESCRCONF="$TEMPLATECONF/conf-description.txt"
>      OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"
> +    VSCODE_SETTINGS_CONF="$TEMPLATECONF/vscode/settings.json.sample"
> +    VSCODE_EXTENSIONS_CONF="$TEMPLATECONF/vscode/extensions.json"
>  fi
>
>  unset SHOWYPDOC
> @@ -114,11 +116,52 @@ if [ ! -r "$BUILDDIR/conf/conf-notes.txt" ]; then
>      [ ! -r "$OECORENOTESCONF" ] || cp "$OECORENOTESCONF" "$BUILDDIR/conf/conf-notes.txt"
>  fi
>
> +# If VSCode is installed generate a reasonable configuration
> +if command -v code > /dev/null; then
> +    # Ensure VSCode does not try to index $BUILDDIR and ends up with an OOM exception.
> +    # Configure also the yocto-bitbake extension to work.
> +    if [ -z "$VSCODE_SETTINGS_CONF" ]; then
> +        VSCODE_SETTINGS_CONF="$OEROOT/meta/conf/templates/default/vscode/settings.json.sample"
> +    fi
> +    if [ ! -r "$OEINIT/.vscode/settings.json" ] && [ -f "$VSCODE_SETTINGS_CONF" ]; then
> +        cat <<EOM
> +You had no .vscode/settings.json file. This configuration file has therefore been
> +created for you from $VSCODE_SETTINGS_CONF.
> +
> +EOM
> +        mkdir -p "$OEINIT/.vscode"
> +        sed -e "s|##OEINIT##|$OEINIT|g" \
> +            -e "s|##OEROOT##|$OEROOT|g" \
> +            -e "s|##BUILDDIR##|$BUILDDIR|g" \
> +            \
> +            -e "s|\"$OEINIT|\"\${workspaceFolder}|g" \
> +            "$VSCODE_SETTINGS_CONF" > "$OEINIT/.vscode/settings.json"
> +        SHOWYPDOC=yes
> +    fi
> +
> +    # Support also recommending extensions for VSCode.
> +    if [ -z "$VSCODE_EXTENSIONS_CONF" ]; then
> +        VSCODE_EXTENSIONS_CONF="$OEROOT/meta/conf/templates/default/vscode/extensions.json"
> +    fi
> +    if [ ! -r "$OEINIT/.vscode/extensions.json" ] && [ -f "$VSCODE_EXTENSIONS_CONF" ]; then
> +        cat <<EOM
> +You had no .vscode/extensions.json file. This configuration file has therefore been
> +created for you from $VSCODE_EXTENSIONS_CONF.
> +
> +EOM
> +        mkdir -p "$OEINIT/.vscode"
> +        cp "$VSCODE_EXTENSIONS_CONF" "$OEINIT/.vscode"
> +        SHOWYPDOC=yes
> +    fi
> +fi
> +
>  # Prevent disturbing a new GIT clone in same console
>  unset OECORELOCALCONF
>  unset OECORELAYERCONF
>  unset OECOREDESCRCONF
>  unset OECORENOTESCONF
> +unset VSCODE_SETTINGS_CONF
> +unset VSCODE_EXTENSIONS_CONF

This certainly has to go into a separate script. oe-setup-builddir is
already over-stuffed and difficult to maintain, please don't make it
worse.

Alex

