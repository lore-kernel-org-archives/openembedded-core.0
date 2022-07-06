Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAEFC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 14:05:43 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.6670.1657116342736214681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 07:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LSmZtnMa;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id l12so8377862plk.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e9LdP/PoG9vmOZPQt7BY+mE+n7uCWMqZPDOyrBUcIUQ=;
        b=LSmZtnMaIzsaNwSGcjBccSf+X0mFTSEwZ6efioDPtdCPmb1WMF8DMNq2h/jMh03tz1
         R49HJNoQ6VNRPrWYyI9JGGeVqa62SCOrKmG8Jm0IjecXvvHS40rFGXVFy40+Ti5aEvwJ
         KsehgwPm8lFFZR3BukQjNxqKs7w8U7p8Tal0551OfdWbjBgONDUh5wsP6wDyIsgTg5+V
         WPVms8Uo/tcoc64oWmykM41Wxl09iEqvyIebejxfk+D5B2g1sANt6IdYyPOVecP3z+hO
         E5xz1x1a8Y7RAEi9MquHvyKAqmerz0SvRM7fGP1Eo1doxQuJHWiElARbiq6clMgF5V2m
         Ys6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e9LdP/PoG9vmOZPQt7BY+mE+n7uCWMqZPDOyrBUcIUQ=;
        b=T/K7bBbj/0yt2zaGEceBNOs0eF8uZXYd531loXQp6zP26SaLzpVtSvQx63iuQaSDhK
         JUzOsZNviDQOABPZujEkf2cHaqtKMlY2a024hdEbyQg2iV09Xz+Mv1h69RtZq53NorAw
         6dS5PK/MUNhenq9PHVX+8nKGVTEdHsWeV1h/lWIW/7Prejrsq/U7eULL8rfM8ILs8JlD
         O3/1Qd/eL2eFCWVtdmrYS4OIzwiOUCj/+DeKrtatZDRBSmjWLsWqAj9qFw/gmLjvg6GM
         NrGwVn0vrEScckAiC49+8gRP2JJt0NTjEica56yJru4neq7wbSfivLQV4v8ic/wTPvgG
         dQ3g==
X-Gm-Message-State: AJIora9QYqTfTV5PwNpTgcbh7w4kSGz+TgZ3VOz4Posd6ruXfHvG+oRG
	5kzSRyeoM0Cgc1jwKItsG+9D/j2zEP2nObfm+/s=
X-Google-Smtp-Source: 
 AGRyM1uArViCwYre3fszMWNSZYq7IrldGwiWfp4xTVVtnB1yqoff4mDZcLUSnCFIsocU9sVFu7pUjSHy9ZXsVZWa+IM=
X-Received: by 2002:a17:90b:3e8a:b0:1ef:6a5e:e55a with SMTP id
 rj10-20020a17090b3e8a00b001ef6a5ee55amr31671681pjb.112.1657116342187; Wed, 06
 Jul 2022 07:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <YsWOLwlNxhAq7sKz@mail.local>
 <570c56bce472ec4ba6a68f537dcb1f85f99a05ea.camel@linuxfoundation.org>
In-Reply-To: 
 <570c56bce472ec4ba6a68f537dcb1f85f99a05ea.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Jul 2022 10:05:30 -0400
Message-ID: 
 <CADkTA4N2gGHwG7OWGY32gqLzztsTcOsGXx=-wgpJrJhkfj=OKA@mail.gmail.com>
Subject: Re: linux-yocto 5.15.48 reproducibility failure
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 14:05:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167727

On Wed, Jul 6, 2022 at 9:31 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-07-06 at 15:29 +0200, Alexandre Belloni wrote:
> > Hello Bruce,
> >
> > I got the following reproducible build failures:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1116/steps/12/logs/stdio
> >
> > To me, it looks like the in-kernel config changed, did the compression
> > alg change?
> >
> > Are you able to look at that soon or should I file a bug?
>
> FWIW,
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220705-g8ltxczy/packages/diff-html/
>
> and CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y changed value...

A quick look at the -stable queue to init/Kconfig does indeed show
that option arriving .. from my scan of the change, it looks like
there are different compilers on the hosts, and hence that check is
detecting a buggy gcc (or not) and changing the value.

So one of the build hosts is failing the test, and another isn't.

I'm not sure how to fix that, unless we revert the change. I'll ponder it more.

Bruce

>
> Cheers,
>
> Richard



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

