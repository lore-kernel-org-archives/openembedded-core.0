Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5CEC64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:04:36 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.17731.1677661467949618297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 01:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jJEmD2vO;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id s22so16680841lfi.9
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 01:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677661466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OXqD5Mr4yhypJ3kz57bzPH+A389HmHugiSQB+i3owHU=;
        b=jJEmD2vONKvLgN5qe39cgLOlQpNF4zuRvqF788nXnLBsH3F0JX7aqrBf5ncpaUBatJ
         ZVPVLE3h7P6yC2BAzDNgTgowZwOirqjhXkMnT87OE8Lb7KAp7AKrMrxQvGtXI+4tXvLB
         TXgSANWjCh3E7VAwnwglvkJfwIlM7Ki4lBbvZYfsZdlaeqXsHiss+uyKk8Mrc1BlP0H8
         Y3C0fYF5I0ietAGguaER7dUlPKpVpomLh7PgSNqjH1Mu2xDGf7RaIcvNq/Y9oFQCfDDT
         4bo5sMWQkeo9yrlOhoOm0u659AtopRiRFnK8PpcEu0SN1dn0mhbzp/x+SE7RgDjNbFfJ
         WHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677661466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXqD5Mr4yhypJ3kz57bzPH+A389HmHugiSQB+i3owHU=;
        b=s4+S5+BRPdUI+FfRLd+ua7+5UA/gQXjBTRKvhvdZXnrFlclj80pRgZ3j8thUaTkjUl
         U0mEFefx8mNXombhqbs5u08DiPFoOp0EQ+P2SDVqLjY2VQs4uoNEo5B2ZJgsIKGm0Kz0
         nG4po1y2NdHNhFk+ykjjyVLbVNWXE6WafTe/2nFlw7p6LGhGKCIOIsj7opWIF5xYFOLf
         PXAmBuAV2qDfJw/dXDM/mGzKvHqeD6bEkYxU5AkekkybDYLy3GUDGytJ5KkAKvfPqTbC
         a7wuYIril2ybKeo7Ma7z//9wDm7GXcl8zVDLnbGfR7m04/ggZ7uJyCrossgC/mWdRK8u
         H6ug==
X-Gm-Message-State: AO0yUKU70geyjqved6QFxgHGcd5pmsrARPConki/XkMZVl4J1BE00ofZ
	K1oic8hn4ATdbLxca0N24KH9MRzTnpqO/9mO5UA=
X-Google-Smtp-Source: AK7set/1kDjV8ub7yOmtOJT9c7/DQMz4iVtGgkd9bDdxclFfjY6g1Fh1cUznrQkmAZfnHVe/Y9vLNsIRD6mf0VVjsCk=
X-Received: by 2002:ac2:54b2:0:b0:4e0:39f3:5b9a with SMTP id
 w18-20020ac254b2000000b004e039f35b9amr1584471lfk.13.1677661466064; Wed, 01
 Mar 2023 01:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20230301000302.93660-1-yoann.congal@smile.fr> <20230301000302.93660-2-yoann.congal@smile.fr>
 <Y/8SQZ9wDOAtztSX@mail.local> <f6d3523d-bfda-e849-3693-54d4337e71a7@smile.fr>
In-Reply-To: <f6d3523d-bfda-e849-3693-54d4337e71a7@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Mar 2023 10:04:14 +0100
Message-ID: <CANNYZj_1if4ko08d1H_MkFjeYf7DD-wKcf9a2hxdNp0G1y2dew@mail.gmail.com>
Subject: Re: [OE-core] [pseudo][PATCH 1/1] pseudo_util.c: Open file with
 O_CLOEXEC to avoid fd leak
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Mingli Yu <mingli.yu@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177878

I believe we need only the submitter's s-o-b, not the author?

Alex

On Wed, 1 Mar 2023 at 10:01, Yoann Congal <yoann.congal@smile.fr> wrote:
>
> Hi,
>
> On 3/1/23 09:52, Alexandre Belloni wrote:
> > On 01/03/2023 01:03:04+0100, Yoann Congal wrote:
> >> From: Pavel Modilaynen <pavelmn@axis.com>
> >>
> >> Use close-on-exec (O_CLOEXEC) flag when open log file to
> >> make sure its file descriptor is not leaked to parent
> >> process on fork/exec.
> >>
> >> Fixes [YOCTO #13311]
> >>
> >
> > This is missing the author's SoB
>
> That is right. But, as you would have noticed by now, his mail address is not valid anymore...
>
> What is the proper way to handle this?
> * Should I track him to ask him a proper "Signed-off" patch ? (He seems to have changed company)
> * Should I change the author of the patch? (I do not like this but on the other hand, the change is quite trivial)
> * Something I have not thought of?
>
> >
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> >> ---
> >>  pseudo_util.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/pseudo_util.c b/pseudo_util.c
> >> index 64636b7..b58036f 100644
> >> --- a/pseudo_util.c
> >> +++ b/pseudo_util.c
> >> @@ -1611,7 +1611,7 @@ pseudo_logfile(char *filename, char *defname, int prefer_fd) {
> >>              }
> >>              free(filename);
> >>      }
> >> -    fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT, 0644);
> >> +    fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT | O_CLOEXEC, 0644);
> >>      if (fd == -1) {
> >>              pseudo_diag("help: can't open log file %s: %s\n", pseudo_path, strerror(errno));
> >>      } else {
> >> --
> >> 2.30.2
> >>
> >
> >>
> >>
> >>
> >
> >
>
> --
> Yoann Congal
> Smile ECS - Tech Expert
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177877): https://lists.openembedded.org/g/openembedded-core/message/177877
> Mute This Topic: https://lists.openembedded.org/mt/97303652/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

