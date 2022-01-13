Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E234C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 22:31:24 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.4333.1642113083119409317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EdcMxIZE;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id s12so4660961qkg.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ch7SgNIlq7ibYpBrXZ8SmMWwlwW2JOwwDAY5apBltPo=;
        b=EdcMxIZE2d+Alhl6fIQwpQPrBI+FC4avXS/eD4emX4wE+rWsq/ub3CbY6ooZ+zW2JS
         3c2rIkG5RsgZBdoVdQ1YR2APFvN3/X4f5AEWZrEJUZdSTuG/ltGDebFhG4stYSQSx3nJ
         oQS6RVMofCfqlFPrU7YcULL0DH3enEPsY3wJOmIlX6oiwGLb2jzPwRcXfphfrD8Eb9w3
         fb1Kln2Am+6NxebJUTs82Yn7K+wJtGIXIK53FvH9AE1HZtfTJO0LatJmjhX/ygHiSzMe
         IyA22uKOcE7PsggQhEIsRG+CdjLa0maQg2CKzn3g7IE9RswPkA2Zhb9zRADPcE9JLvUf
         uDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ch7SgNIlq7ibYpBrXZ8SmMWwlwW2JOwwDAY5apBltPo=;
        b=vMPQFkPFDPTuO1J5EYNFnzpNIjHtkeyuRUUss+dZG78FN1vGXDe2MkEK1B9rBut3dX
         5E31aH5Hw90ntyA1WtLQTg3XK2nZBMJvLcVh1qO7D9GuH5RTZC5NFLib1Q45lS4ugpE2
         J49FrylSnM3HN08Md0z/vb/ULElQJBWzcJvCxSUG5UWFDW301G7PYyz9E3lhnADkn4JI
         KqVRAE0CDdk6m4U2zzoREBLwEs1fXy7I6A3MVi1eg3i6Z8oilDkMC9L3DqY16D3CnZU5
         +BbVUkIjJ1ZSekl419DMYG6Y1J2nz/sR5OzKcceUf8pLXAHe1sqlKIsR9XzveXIsRsKx
         5qmg==
X-Gm-Message-State: AOAM532/mzB79Zdf6VuJFhxMlfYJAOrBi9bZj4FW89jWk5unRjdWNG2F
	gvbBYXEgrhJPgDE17iQrgG18BduwoRRWfgpg6vw=
X-Google-Smtp-Source: 
 ABdhPJweWubIbxPgtLL/2JgaC31n4SeLJcJ5NBur1wF4glAnBIjtaGyIKbm5BO9LWKfvjrJ0SQiffUCeYIWGK42P5iM=
X-Received: by 2002:a37:5541:: with SMTP id j62mr4668343qkb.180.1642113082159;
 Thu, 13 Jan 2022 14:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20220113173555.1925441-1-raj.khem@gmail.com>
 <CANNYZj85JnxcETSQFWqBZWLwjrOnuq6rpS=CZ9Okr66TwtiZWw@mail.gmail.com>
 <AM9PR09MB4642C9029183D8A03387674BA8539@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1srXrw_80NNT6zaQsh8aR7gkw8YqDp=x+OjyHNnduFcO9Q@mail.gmail.com>
 <62e596bd10d0eedec94333f5d854d9022e3d64d3.camel@linuxfoundation.org>
In-Reply-To: 
 <62e596bd10d0eedec94333f5d854d9022e3d64d3.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jan 2022 14:30:56 -0800
Message-ID: 
 <CAMKF1spbwPF=jz9bo+_FCZEQjEdNomWQVUW1t7TkkEaku=fNMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: Enable network for ptest builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 22:31:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160539

On Thu, Jan 13, 2022 at 1:58 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-01-13 at 11:12 -0800, Khem Raj wrote:
> > On Thu, Jan 13, 2022 at 9:46 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
> > >
> > > My understanding is to add
> > >
> > > --nonet
> > >
> > > to XMLLINT_FLAGS = --noblanks --noout --xinclude --postvalid --noent
> > >
> > > in docs/Makefile.in
> > >
> > > and we should be good - haven't tried it yet but it should do the trick
> >
> > right, good suggestion but it did not work originally thats why this patch.
>
> I would rather disable this than allow network access. We need to understand why
> we don't see this on the autobuilder, something isn't adding up here...

I am not sure either since this is not AB runners where I am seeing it
but I get it everywhere

https://errors.yoctoproject.org/Errors/Details/622559/

>
> Cheers,
>
> Richard
>

