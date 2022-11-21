Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730A3C43219
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 16:28:08 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.43479.1669048079095576869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 08:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ADVQfBgS;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id m22so29706833eji.10
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 08:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C8voEoK6Fy+znWAlRP2TcutpXDiZFLVjbDLVIkaH1j0=;
        b=ADVQfBgSD4hQ1ejpNoo7I/Iz7Tp846Z/GVlNd1ClC2tq6nbXYQbO+nSKGizWWbmRnt
         EMplsxyydAIU2Hvj1GfvKvffrTyNHaaZjQ2Fh3Mk17zxkCnpL9NbltVfAoFUpdfY6D5U
         EGpgruITBsoRSP88ndc3L+xXYWRQAu45qwF2VI66rONNluLXIqztZ1X8Wx1XgdslTM66
         knHjPxed/gf9ptfE27WEv2PvV5p+V06F87Ituj2B4khViD57u008c18PatGz4SCxIDof
         I4dGLjb+Fq43ZI1JSTsPAUt5kBS3QTsB1iK0yo1gR8Rck/nKw5mHNvHUpMSwDoUaeopm
         o8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8voEoK6Fy+znWAlRP2TcutpXDiZFLVjbDLVIkaH1j0=;
        b=VlUzOGCaila1NKh8YBrjfDmL3wWiYS01buEVxVkU9b9VWof3W/ls1jqtHLTOaqK90D
         a1Jn2QGfEumQy45OOT3ZQT/ocNTS1kF+jPpQEmmLvergrvyhHZQ/DHuc7RSJByxSDKVe
         7QNxSgkeaxYuo5G/jew/O2RUji+W3xBzpX8/PUSa5178U5dHX3VFGlkRe/W7Qb8Tj2B4
         yt+4dVlwhPVqvXxNceV/M2Yqq02uEM5WS6Wx0RzGlYalG6rYlXu24cPA2T5Ds1l06dXw
         aYQch38p4J3lj1tfjXD7g9cpUnqhRIrv8vIBvvHK4WNF+p5SQSEUM4rw5IdpjshKUFmv
         TYsA==
X-Gm-Message-State: ANoB5pkDjK0XLU1MdM7wdaFUsDxhZ01CZNhnhbnBek/4oHKYUjeMJFb0
	nmgGuRicYPOzClLL7cJjzPKjysgLV0wfIcWPCY575AiD74M=
X-Google-Smtp-Source: AA0mqf6rSBW5NnOzBXNqTlSbBJF68Jy68PPJJYGfknSToDJSHt6/vCvUG2cc6p+OP6aWbjCpgBrWGn7vnkq/f25d3GM=
X-Received: by 2002:a17:906:4351:b0:78d:513d:f447 with SMTP id
 z17-20020a170906435100b0078d513df447mr2266749ejm.708.1669048077210; Mon, 21
 Nov 2022 08:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20221116184919.2085915-1-JPEWhacker@gmail.com>
In-Reply-To: <20221116184919.2085915-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 21 Nov 2022 10:27:46 -0600
Message-ID: <CAJdd5GaVPiQOZNxvmCsyiVQCyCV3sz9+4Q9s4k8yh+WO-_1m1g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu-helper-native: Correctly pass program name
 as argv[0]
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 16:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173657

Steve,

Please backport this to Langdale (note you'll need the other
qemu-helper-native patch first)

Thanks

On Wed, Nov 16, 2022 at 12:49 PM Joshua Watt <jpewhacker@gmail.com> wrote:
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

