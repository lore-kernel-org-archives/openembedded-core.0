Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D48AC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 13:47:18 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.10150.1644500837491254838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 05:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NHXNEuNw;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id b13so11179048edn.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 05:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XW0h2+hyqJwjrSQCwtlk86Gwp11TOA5QiL+ibeE3Xtw=;
        b=NHXNEuNwOmU9Q15Bn5NRbEqT/Ja4vBL6Tq5XQiB/RagcD1u/Fg2rjhH4WBQNn4THnM
         EfUwMNgM/eQHqvmKC/t+haSZLy+BJzXrokEKePJUWwVxy9vVoQlgEeft9vFLbDnQ/VWE
         fFuqxtPaKvIyZe8508OQkAGmaVHJvvNefmjJn6bahVIEL26EEk2lAmyvOsSK5qurVe9Z
         Iu0z0z3PTAlkRcbV7tI/pEYjJdEakLsFJnq2MjPy4KL99p/DJ2kZXLar/pgWDUoAStTr
         2j9Kn+EjJwVot47kOlMoBHOYNkPawP/+08yhujSEHUkKK03yniWeq1kAz+9jwdfhXJQn
         y//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XW0h2+hyqJwjrSQCwtlk86Gwp11TOA5QiL+ibeE3Xtw=;
        b=fleutKJqt8NvEiUrcgztRXA7wmnSLO++jrh4cqVOogUBEXUY/vF7ibTAOMRoRWsc4f
         99vgrmlXxRqvggSKCyMI3Y3OIzn1blr6sZNHM3rfLL85Lv5dkCNQNVxwBz57YiK4yJLN
         OTK0i6zdPcX+pp3q7DDwu4LG/eCQzNCDbPCZbrmG2ZWGt+j+Z/8Fmi+vvU9mru3V3Vcs
         NjxufHI0+JMTtUbi5W7ZxN3YZQXKwKcSl9NMsje1DiDfWah+ndD2vjQh6hWKDtp+UGgE
         JQOc07oWTilyyzEi3QcN0KDHQU8cuIwvN9eYpteRfedt+BXrGId5itmem9LU9XRmiZNN
         9n3g==
X-Gm-Message-State: AOAM530VtEXMxdZ3Cj05AWV1LyBMIQPEbV8sH2G6E7n57sMyHOi7W6Hy
	nu+yxS7/A32YheaGr3RZTdDlnhVRVzLowoOMhoc=
X-Google-Smtp-Source: 
 ABdhPJyK8P5pAIHboAdtpKDLQK/ZB6aD36M9gAxu4DcPuP9WIrvNX37M8jlqsaZilAouInqSJsWiuQ1+qGeDHgZ0MuM=
X-Received: by 2002:aa7:c418:: with SMTP id j24mr8415820edq.451.1644500835921;
 Thu, 10 Feb 2022 05:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20220210115201.1729034-1-ross.burton@arm.com>
In-Reply-To: <20220210115201.1729034-1-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Feb 2022 08:47:05 -0500
Message-ID: 
 <CADkTA4O_31JcOUqRBUoT+djzCyf3E2_nWtMnHH3GFF045uYJ=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: make kernel-base recommend
 kernel-image, not depend
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 13:47:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161613

On Thu, Feb 10, 2022 at 6:52 AM Ross Burton <ross@burtonini.com> wrote:
>
> As kernel modules depend on the base kernel package, and the base kernel
> recipe depends on the kernel image, it's impossible to build file system
> images which contain kernel modules but not the kernel itself, such as
> an initramfs.
>
> Change the RDEPENDS to RRECOMMENDS so that the disk images can set
> PACKAGE_EXCLUDE = "kernel-image-*" to remove the kernel.
>

Looks good to me.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 880ee614064..4f304eb9c7a 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -655,7 +655,7 @@ FILES:${KERNEL_PACKAGE_NAME}-modules = ""
>  RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
>  # Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image (= ${EXTENDPKGV})"
> +RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image (= ${EXTENDPKGV})"
>  PKG:${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (= ${EXTENDPKGV})', '', d)}"
>  PKG:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161611): https://lists.openembedded.org/g/openembedded-core/message/161611
> Mute This Topic: https://lists.openembedded.org/mt/89043865/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

