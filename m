Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C4FC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 16:27:18 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.43348.1669048034260124724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 08:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T6Kl8p4q;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id bj12so29680849ejb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 08:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tS6ARHeBUGKnpV1zGE1kXfKX5Sr8SP2mPPs6vuEje+E=;
        b=T6Kl8p4qiEOXrNuOnR3fgWegvo0SwmQKrB8Gn/HZS6wyu5mbLM0mmWld8o+EblYOmE
         hcXzPR2AvK6oyS3znjQRTdeRkedL/GUkZeRQ1TS8fLZ7M1e7IgpGFu4hawPpumGP5VzH
         8vfQziKazy+Ov0Zvo6yaOTspKmx6EvM/rL1Wk+/bExVgHqphDfSBlfmEPTqqqpAPp3fU
         Ri4VzhwSUVvnWKUcW1RSpQqcEedJOUyW4oGgAtn2iJxKuj7/IJasHDmky7qyVSxUw3RG
         LcCszIHkUzDwDpW/862pZcpPNPwSR939HZAT3S2hO6V/Hfnkf8Zf/NNa41wHREXVC/aU
         2Erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tS6ARHeBUGKnpV1zGE1kXfKX5Sr8SP2mPPs6vuEje+E=;
        b=UPoIlT3rAX9BYf09/SNWIfh+t7XMxugOMlAhyjVlilYYOJUtU2LysVsy80frHTDtv7
         /9z85JIaqozOKT4PIzeynF/S2KN7PJ0YfcLY5jVQqiYcFraOPyJlpTh+Skk/W+yiUwrb
         iCHXHdz5fhlSb5tYs/k9YcyP9N1WFv+oWfD8vKQTJLPBRCTj5rhqdwDHw7cAq9h/dqKz
         wNGk39sVj65nUhRQ/+U4JXfmInetP9egZbwWEbHsZ4tp0gCrJtHUQA7ZRKh7HBpvNJls
         yquKyRNdRMjhlKyFQZ+T6Ov/VgRKvyJpq5EdA5KbSk9wF7QH55YBE2LF4NBFr2lS+PPf
         8dGg==
X-Gm-Message-State: ANoB5pnjtO+KvrudUkCjhn4Gm6juLbGwGtTd4j6/jdaYtSns72G5M4Rl
	JHq4PGhJZ5C74r5w7ViJQ6GIAvAUHX1t1NNn8STGZ48plxo=
X-Google-Smtp-Source: AA0mqf76/sdzgH8G2LwlXA32I3FdygE7uvDGDsIjEydwODk0zEDeWthvEHPM7asumFlPST2ksEo+YNuqobyja6Ja09g=
X-Received: by 2002:a17:906:590e:b0:78d:5176:c4d2 with SMTP id
 h14-20020a170906590e00b0078d5176c4d2mr15955125ejq.532.1669048032194; Mon, 21
 Nov 2022 08:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20221021181451.120630-1-JPEWhacker@gmail.com>
In-Reply-To: <20221021181451.120630-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 21 Nov 2022 10:27:00 -0600
Message-ID: <CAJdd5GbvTbdR_cLJm9oj1zAJdhYR_k3Jfk-yyfw4TPv29_uj6g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu-helper-native: Re-write bridge helper as C program
To: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 16:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173656

Steve,

Please backport this to Langdale

On Fri, Oct 21, 2022 at 1:14 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> The bridge helper program is invoked directly from QEMU when it needs to
> attach to a network bridge. As such, it is subject to the environment of
> QEMU itself. Specifically, if bridging is enabled with direct rendering
> acceleration, QEMU is run with an LD_PRELOAD that attempts to preload
> several uninative libraries; however /bin/sh doesn't use the uninative
> loader which means it can fail to start with an error like:
>
>  /bin/sh: symbol lookup error: sysroots-uninative/x86_64-linux/lib/librt.so.1: undefined symbol: __libc_unwind_link_get, version GLIBC_PRIVATE
>
> Converting the helper program to a C program resolves this problem
> because it will now use the uninative loader so the preload doesn't
> cause errors.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../qemu/qemu-helper-native_1.0.bb            |  6 +--
>  .../qemu/qemu-helper/qemu-oe-bridge-helper    | 25 -----------
>  .../qemu/qemu-helper/qemu-oe-bridge-helper.c  | 41 +++++++++++++++++++
>  3 files changed, 44 insertions(+), 28 deletions(-)
>  delete mode 100755 meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper
>  create mode 100644 meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
>
> diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
> index aa9e499c77..e297586bbb 100644
> --- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/tunctl.c;endline=4;md5=ff3a09996bc5fff6bc5
>
>  SRC_URI = "\
>      file://tunctl.c \
> -    file://qemu-oe-bridge-helper \
> +    file://qemu-oe-bridge-helper.c \
>      "
>
>  S = "${WORKDIR}"
> @@ -16,13 +16,13 @@ inherit native
>
>  do_compile() {
>         ${CC} ${CFLAGS} ${LDFLAGS} -Wall tunctl.c -o tunctl
> +       ${CC} ${CFLAGS} ${LDFLAGS} -Wall qemu-oe-bridge-helper.c -o qemu-oe-bridge-helper
>  }
>
>  do_install() {
>         install -d ${D}${bindir}
>         install tunctl ${D}${bindir}/
> -
> -    install -m 755 ${WORKDIR}/qemu-oe-bridge-helper ${D}${bindir}/
> +       install qemu-oe-bridge-helper ${D}${bindir}/
>  }
>
>  DEPENDS += "qemu-system-native"
> diff --git a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper
> deleted file mode 100755
> index f057d4eef0..0000000000
> --- a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -#! /bin/sh
> -# Copyright 2020 Garmin Ltd. or its subsidiaries
> -#
> -# SPDX-License-Identifier: GPL-2.0
> -#
> -# Attempts to find and exec the host qemu-bridge-helper program
> -
> -# If the QEMU_BRIDGE_HELPER variable is set by the user, exec it.
> -if [ -n "$QEMU_BRIDGE_HELPER" ]; then
> -    exec "$QEMU_BRIDGE_HELPER" "$@"
> -fi
> -
> -# Search common paths for the helper program
> -BN="qemu-bridge-helper"
> -PATHS="/usr/libexec/ /usr/lib/qemu/"
> -
> -for p in $PATHS; do
> -    if [ -e "$p/$BN" ]; then
> -        exec "$p/$BN" "$@"
> -    fi
> -done
> -
> -echo "$BN not found!" > /dev/stderr
> -exit 1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
> new file mode 100644
> index 0000000000..cadf2a012a
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
> @@ -0,0 +1,41 @@
> +/*
> + * Copyright 2022 Garmin Ltd. or its subsidiaries
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + *
> + * Attempts to find and exec the host qemu-bridge-helper program
> + */
> +
> +#include <stdio.h>
> +#include <unistd.h>
> +
> +void try_program(char const* path, char** args) {
> +    if (access(path, X_OK) == 0) {
> +        execv(path, args);
> +    }
> +}
> +
> +int main(int argc, char** argv) {
> +    char* var;
> +
> +    /* Copy arguments so that they are a NULL terminated list, skipping argv[0]
> +     * since it is this program name */
> +    char** args = malloc(argc * sizeof(char*));
> +    for (int i = 0; i < argc - 1; i++) {
> +        args[i] = argv[i + 1];
> +    }
> +    args[argc - 1] = NULL;
> +
> +    var = getenv("QEMU_BRIDGE_HELPER");
> +    if (var && var[0] != '\0') {
> +        execvp(var, args);
> +        return 1;
> +    }
> +
> +    try_program("/usr/libexec/qemu-bridge-helper", args);
> +    try_program("/usr/lib/qemu/qemu-bridge-helper", args);
> +
> +    fprintf(stderr, "No bridge helper found\n");
> +    return 1;
> +}
> +
> --
> 2.33.0
>

