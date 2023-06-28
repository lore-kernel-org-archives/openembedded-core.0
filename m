Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAC1EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:24:18 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.17885.1687962256973227075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=e+BFIq7N;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso58395071fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687962255; x=1690554255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=96QoqLzyxWXhiJgvw0/uR/yWaUPgTIi/V7zV9FOi/K4=;
        b=e+BFIq7NPd2MfaVk9borP/N540OTXEWo5vhGQlwKNbNx5JL8eCrtBPuFRndOIw9Bk9
         3+4Fa7kIhcq/F3y9Yl0n4umN/vHI7DpeTto4TUP/7lugy8DKEFdky071klJHHT6WVX9R
         oaiuWAoH2losKqOWVwEaxDGIVZb4ylTA2gr+Sn98BQXmxZMxmrHuVGH6tHdRskykM29v
         tR3TCrLkUV6aj77J90kDdblcVFryy0O5N2Gr9thh2mYQYIhC17tbTjcWwxYjuvwxW8VH
         odMYpa5KUY+eyZF/jeZ7IaJi0ynjpKH1x9XaZRdf1Gw44ErNoBVmqZErHISCwbvd1D8D
         Ed8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687962255; x=1690554255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96QoqLzyxWXhiJgvw0/uR/yWaUPgTIi/V7zV9FOi/K4=;
        b=ETtnuNUwqmMTu/y/ofenS0mIjkQSAHMXWJrUolGf/PCJ1vqfDqtYyexc5NidxXqYDb
         8ZVdGde0t9wK5YlXSbk6pKJZFKviXDDPq/ZJjekQW8A5ZWZXU0gWbnlSn/yjRVDsImE8
         WCsczp24Xx5btZKnjUVUoxyiFEg76goujg2npbfawJEZFnI44C0Es28Gdahrre7tnUxg
         ffnLcZawkuI+mia3BnrqVA0ClK6NeFaTsiRkgY+JDhcDmtCx52WyjUVVQ3YqNDDAriaT
         E01T8/QNWW+M28jXIK6ik7EGua+7/+USHFwElb7O3Fw9mkoVmrnTl9OOeIyxY9wmP6Jm
         bXhA==
X-Gm-Message-State: AC+VfDwxOE2DRwUTgbEVO0opkFfMe0He5ebBp4kVLeMKIFCd9J1FkEK9
	+qdDSxlJ+KAbuHhgq21MxLH2EgX96SzjRyc7fkQ=
X-Google-Smtp-Source: ACHHUZ5PCBoYPv5AJ64RqtNh3xsWamuDxRkjrrBBHr8QVqWhGhetyTkC5+22YIHA91UOjBCGwb8vrCqK0U6ACrxxiCA=
X-Received: by 2002:a2e:9ad6:0:b0:2b6:a5bd:da2d with SMTP id
 p22-20020a2e9ad6000000b002b6a5bdda2dmr6166318ljj.27.1687962254963; Wed, 28
 Jun 2023 07:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230618090946.2478083-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230618090946.2478083-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Jun 2023 16:24:03 +0200
Message-ID: <CANNYZj9exqWr7e2yd_JcYLhjV_D4QZ=TRnwDMWdcKjNNN=6ekQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-runner: Pull in sync fix to improve log warnings
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183585

This appears to have regressed glib-2.0 ptest, particularly:
Failed ptests:
{'glib-2.0': ['glib/codegen.py.test']}
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5273/steps/12/logs/stdio

I didn't yet got to the root cause, just wanted to register where it
happened. Note that the ptest passes when run directly and fails only
under ptest-runner, and it somehow is specific to qemux86_64 as well.
Bizarre, yes.

Alex

On Sun, 18 Jun 2023 at 11:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Pulls in:
>
>     utils: Ensure buffers are flushed after child exits
>
>     We currently wait for the child to exit but we don't flush the buffers.
>     This can mean the output ends up out of sync and the END: line isn't at
>     the end of the logs.
>
>     We've recently seen a lot of issues related to this on the autobuilder.
>     Add in a flush call for all fds to ensure buffers are in sync. This
>     does appear to improve warnings on the autobuilder now we started detecting
>     the issue.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> index ff5629c6f9b..67dd887c240 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>
> -SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
> +SRCREV = "ea2a9cc159ad5f64ee75781d55101d7c340e0303"
>  PV .= "+git${SRCPV}"
>
>  SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183056): https://lists.openembedded.org/g/openembedded-core/message/183056
> Mute This Topic: https://lists.openembedded.org/mt/99601743/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

