Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1162C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 00:32:19 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.2234.1668645138185702127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 16:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aD8ete4I;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id q186so227071oia.9
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 16:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U0Bp4Rznha/PjiHGO0TC3SztnG5pq0A1fxt4iZm6vrg=;
        b=aD8ete4Iz87QdTx4m5xVpUoVD1b3smlmxwSG3qeNssnb1Voqb+7EbKZLftS3dthl0a
         nzlXcFgxAGCeof32LrRCyqC0pbr44GyUYK/yYcF9rFuUeSbG1zwHVxJXWoOM7xMVzObJ
         GlHkxE18V8c1aO5DT0jNJESODAKt18GzetlgArx/QKAlH/pZ82aHotOtCrSxtZDX+ppN
         oUcGE0Zjmr11ccGXCKf+q4tVXwRC+0KqJNMHSMLEnXS9V40Cb1zisZthFP+/xh4qFCH+
         0ZuKNatJhYEN4Cgc4SxRLko8Cr4M+bvcCEUhQBDxa8PW5ZgP63NNINoDJXjwBZJV50u3
         in5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0Bp4Rznha/PjiHGO0TC3SztnG5pq0A1fxt4iZm6vrg=;
        b=sRoWU2qFJHKdXuPSZ+dhC1WluoWHNy4zV9N9xJIpq2SU2eu2Un75vAcdn2+X7oCF1x
         x2mSCk/AvirdBb3vtGuQgl4eSkScn35BNLrc/AESJcVQ/G7SfQWXZPPlNTpj7cEAS+CJ
         8/1jUdVrRWgC+7ftgpfnmtKJnTLPKPPP66YkJZdkw8f5Wamj//g2QjmpxDcoP/97FuiH
         5Ye8FTCgGipwgsfjOFH+l1iaQ+UKtFlQh5iEosgCzkQFlB5R6oFx7KRbNCcVurqIAhMt
         e9pZtqlg2Nyu8jY4mrHKoFMNQPQyr/3bucQ61EJeccsfIN3w51anU8GmdCtdoeZ1jm1y
         0RqA==
X-Gm-Message-State: ANoB5pmMG6ik2tunygNmpzjLcyLIX2L4NStFJgL+FJVK9bNXQ1iuSFgU
	c2RKWDN/xoZ732D046EzVus4qxMxYU4Nhgr2mEU=
X-Google-Smtp-Source: AA0mqf7slR5JdiUAK/Q6ArrxbpAK8ugUKSuxi5Bc8HnflzcP/vT6euuNwS9HJ+95KddRDPbd5hnqaNzL1/Yci4pCExU=
X-Received: by 2002:a54:4491:0:b0:359:d852:616d with SMTP id
 v17-20020a544491000000b00359d852616dmr2840712oiv.55.1668645137314; Wed, 16
 Nov 2022 16:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20221116184919.2085915-1-JPEWhacker@gmail.com>
In-Reply-To: <20221116184919.2085915-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Nov 2022 16:31:51 -0800
Message-ID: <CAMKF1spMbDCbR7gZgeTh4RB_DP+k=qFrg88P74Re3f5TahpdJw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu-helper-native: Correctly pass program name
 as argv[0]
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 00:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173395

On Wed, Nov 16, 2022 at 10:49 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
> The previous version of this wasn't correctly passing the program name
> as argv[0], and was also over-complicated anyway because argv[] is
> guaranteed to be terminated with a NULL pointer, so it can be passed
> directly to the execv'd process without needing to be copied.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../qemu/qemu-helper/qemu-oe-bridge-helper.c      | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
> index cadf2a012ac..9434e1d2699 100644
> --- a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
> +++ b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
> @@ -8,6 +8,7 @@
>
>  #include <stdio.h>
>  #include <unistd.h>
> +#include <stdlib.h>

why do we need stdlib.h header ?

>
>  void try_program(char const* path, char** args) {
>      if (access(path, X_OK) == 0) {
> @@ -18,22 +19,14 @@ void try_program(char const* path, char** args) {
>  int main(int argc, char** argv) {
>      char* var;
>
> -    /* Copy arguments so that they are a NULL terminated list, skipping argv[0]
> -     * since it is this program name */
> -    char** args = malloc(argc * sizeof(char*));
> -    for (int i = 0; i < argc - 1; i++) {
> -        args[i] = argv[i + 1];
> -    }
> -    args[argc - 1] = NULL;
> -
>      var = getenv("QEMU_BRIDGE_HELPER");
>      if (var && var[0] != '\0') {
> -        execvp(var, args);
> +        execvp(var, argv);
>          return 1;
>      }
>
> -    try_program("/usr/libexec/qemu-bridge-helper", args);
> -    try_program("/usr/lib/qemu/qemu-bridge-helper", args);
> +    try_program("/usr/libexec/qemu-bridge-helper", argv);
> +    try_program("/usr/lib/qemu/qemu-bridge-helper", argv);
>
>      fprintf(stderr, "No bridge helper found\n");
>      return 1;
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173389): https://lists.openembedded.org/g/openembedded-core/message/173389
> Mute This Topic: https://lists.openembedded.org/mt/95073277/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

