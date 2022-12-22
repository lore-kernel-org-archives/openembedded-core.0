Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE8BC4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 16:49:02 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.49926.1671727733450849107
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 08:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bPP4j2Vx;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id q190so1255071iod.10
        for <Openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 08:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4nqiFbZZ8uPM6WyHSYegt6d1hqB946A3WRpixQJ7tFk=;
        b=bPP4j2Vxtr/PmHQwon86EqBdwWdnOOkWbtHNl9rd7VSzPSLdD3nC6Es46Ynr3VQtVn
         ZGlU5uA61fuhMO395LhXMaYq0+ZWqQNTQwDVLdIEDrt/RN+F0ygxrgadNY0tsWb8TQ62
         r5STmTpqUGMFw7hWpNk1AhurfXEAk1RAG60t1QPfhGf03Ncdvh1pbVYPcfX/3bJhtwH0
         HIIdbAnrKhWbKhNyEBdcddQ1V7TIVJ6+/otXT18UmdafnLuUuPqUfbza0PA6MFYJ99mq
         I/qDV2kNBSLWjxPNWMDnBX9oXiCwNmHQe+hJXtDTT7KV9xoJURvcOOAqgsk8dHxmVxgz
         MO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nqiFbZZ8uPM6WyHSYegt6d1hqB946A3WRpixQJ7tFk=;
        b=omfkWPBToiEGnQ5sh583EvnEMcqxwUhFFkkdmdFoQ1ZPyVLqt3MqErhJac3kE5hDw0
         gnNMbWfbNM9JS4R2QQCqnNoTL3HhvFEWk86olDy+UBLzTYfBboFfgj8Jnq8Nx4EmWhga
         FW4NBw09eLe7pcDiQ7IteQmWkXwbP4NgnskItDSKCjPOJadGYC8W+wJf9fob+/KI+NwD
         veKt2HJePKBUOya/qctfMbcYLUN+TNbF+c1OWsXdM/mXlju02JQmksAqtrVAO8d7gLma
         4OZjQfLo2RYK68x/xuY7Aes9521/CpQSdchLZlGecuGe+SJVAlDRpAts7QaKZQZe3oln
         P2Jg==
X-Gm-Message-State: AFqh2kpGxzruAci7EAzXYbTJ0N6sQYJZKRysDNM/mk0fSe8uvZrqqfYt
	4q36pl4r1Qrsc9nA4Ez8NahIh7dFpqcA7rEibZM=
X-Google-Smtp-Source: AMrXdXskcQvrdpNh7Y+GK9NWWBZqh5xVX7W8UoEUOlYgojSERXy0558UwI/6A5ssP+VaCey43LOXmSep0FewSNxX4mQ=
X-Received: by 2002:a02:b70a:0:b0:38a:d000:e872 with SMTP id
 g10-20020a02b70a000000b0038ad000e872mr517480jam.70.1671727732788; Thu, 22 Dec
 2022 08:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20221222150246.91423-1-uvv.mail@gmail.com> <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
In-Reply-To: <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Dec 2022 11:48:41 -0500
Message-ID: <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>, Openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 16:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174969

On Thu, Dec 22, 2022 at 11:20 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-12-22 at 16:02 +0100, Vyacheslav Yurkov wrote:
> > This is a workaround to allow using go-mod until a proper solution is in
> > place. Possible solutions were discussued ealier this year in these
> > threads:
> >
> > https://lists.openembedded.org/g/openembedded-core/topic/89464905
> > https://lists.openembedded.org/g/openembedded-architecture/topic/90782883
> >
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > ---
> >  meta/classes-recipe/go-mod.bbclass | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass
> > index 61571596bc..da9a583288 100644
> > --- a/meta/classes-recipe/go-mod.bbclass
> > +++ b/meta/classes-recipe/go-mod.bbclass
> > @@ -24,3 +24,8 @@ inherit go
> >
> >  GO_WORKDIR ?= "${GO_IMPORT}"
> >  do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
> > +do_compile[network] = "1"
> > +
> > +do_compile:prepend() {
> > +    bbwarn "Using go-mod enables network during compilation to be able to fetch dependencies. This breaks reproducibility of the build!"
> > +}
>
> This patch is not in master and is not a backport therefore not
> eligible for kirkstone/langdale.
>

'nor should it go to master.

If someone wants to allow go to fetch sources during builds, it needs
to be done in their own layers.

Bruce

> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174968): https://lists.openembedded.org/g/openembedded-core/message/174968
> Mute This Topic: https://lists.openembedded.org/mt/95827446/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

