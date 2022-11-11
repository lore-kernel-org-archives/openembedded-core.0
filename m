Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20885C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 08:06:52 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.3192.1668154009617946175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 00:06:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CRpWCzxo;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id d6so7209186lfs.10
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 00:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7AUIVQ6XrEto0VFdUVgsftWKmaDiRQSI3Jpic0n7ij0=;
        b=CRpWCzxo6HJl/zkFmgtuhXNu43BGdytHUkFwm12plKyXPNBjNJR4jwNr9ZsdlXH/Dl
         xSqFjHWkNZIMthq5KaQ/HLvgPWnxzsJfLYt1huqg7YgpN5F4S7c0iETp6r+YbhzBCQHt
         vtx+e/S13dBEzmWd3iUyBl7XVdgwhzKbZsEmCoYmNxzJZNAwQBgJ7+GZidA0yJaoubNw
         UR90bnoCl62b2LuN4t4kt/mzIiphXfyYP4LFpC7HQYUvUDxRxGDezJ/CszyJnLAXpqEL
         a+1UFg3N0qAk6MkPhxwXBQ/g7Ld+TgsUsFmSDr23xs8N9gnpwQ/bA3Wra2QewkjGB8+0
         x9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AUIVQ6XrEto0VFdUVgsftWKmaDiRQSI3Jpic0n7ij0=;
        b=fFC2Ym4HWUzBojhEX4t85wKwttsvtgZDzTAcLazGReoC6KmL6DMpZJmNAeirj7udFD
         JBmEPetZOZr5VEJ0dk8JV1hs1h8VinD/cehhah9bKt7xj2ZnuqJySG8l+xUi5SXRw49A
         5eqrdpriKq35QwLwFfzKbqtrlboJ4i8lC4eRgYwmPBtKZTk1wLvh0nYQnJ0xhwM135VL
         J5EvD93odUt/gvnLm3RBiml/C7guPOcoYzRMXFQM/an10N1zwdB1nPAU3nMhaz43HN5B
         OErvfVIDoMbjz1xc1/XoZrZB58cWIoteZgq02SfeITsOYXS03tBM8oXkWc2tENk5Z+AV
         kpIA==
X-Gm-Message-State: ANoB5pkqaS6Gc6Uejn/oWYgpOvM1ApHt/IOGJN+2fxXymkC/3SAyaC1J
	7y9bmZNUu1ppKPcVk78FdnHjm5XFB8H0uCqRUbk=
X-Google-Smtp-Source: AA0mqf6RlE3eJ+mMjVZQmVITT7XWMDps7imxgSdLCQ5saw2r+LMLXsceVq92OZXXB2nUuoxpzL0w/nDCwSXDp11dvW0=
X-Received: by 2002:a05:6512:3d22:b0:4a9:39f4:5793 with SMTP id
 d34-20020a0565123d2200b004a939f45793mr408114lfv.131.1668154007799; Fri, 11
 Nov 2022 00:06:47 -0800 (PST)
MIME-Version: 1.0
References: <20221111080415.1046023-1-vince@underview.tech>
In-Reply-To: <20221111080415.1046023-1-vince@underview.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Nov 2022 09:06:36 +0100
Message-ID: <CANNYZj9ncQzMWfowU9TimasPhZK23fWxQ2eErgSmoUKOFWhsSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: on x64 machines llvm-config --libdir
 locate libraries
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 08:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173121

This seems like brittle special-casing for a specific target. Can we
fix the issue in llvm-config itself, so that it returns the correct
path?

Alex


On Fri, 11 Nov 2022 at 09:04, Vincent Davis Jr <vince@underview.tech> wrote:
>
> mesa's meson requires the llvm-config --libdir command which in turn
> returns ${STAGING_EXECPREFIXDIR}/lib, but on an x86_64 bit machine
> libs are located at ${STAGING_EXECPREFIXDIR}/lib64. Symlink directories
> so that the when llvm-config --libdir is called proper libraries are located.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 77f9a5c81d..76247932ec 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -72,6 +72,14 @@ do_configure:prepend () {
>         fi
>  }
>
> +do_configure:prepend:x86-64:class-target () {
> +       # mesa's meson requires the llvm-config --libdir command which in turn
> +       # returns ${STAGING_EXECPREFIXDIR}/lib, but on an x86_64 bit machine
> +       # libs are located at ${STAGING_EXECPREFIXDIR}/lib64. Symlink directories
> +       # so that the when llvm-config --libdir is called proper libraries are located.
> +       ln -fs ${STAGING_LIBDIR} ${STAGING_EXECPREFIXDIR}/lib
> +}
> +
>  # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
>  # by default the upstream mesa sources build a debug release
>  # here we assume the user will want a release build by default
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173120): https://lists.openembedded.org/g/openembedded-core/message/173120
> Mute This Topic: https://lists.openembedded.org/mt/94954642/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

