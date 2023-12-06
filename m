Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80405C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 12:26:17 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.30337.1701865572970278398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 04:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RY48RAdE;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso64429251fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 04:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701865571; x=1702470371; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/tjQ53Rb3Fl2qhnRx36+rU5NX17wU559BxWeIYwBKok=;
        b=RY48RAdEFCvtOKSr1Cw89w8E0PZCZYjitRO3cj3L1dcDwvSp7jrhxHVZ+ntQMMicj6
         /k6HRu6CbbfQ8yN70iJo4aM+6yeHwEz2V+nNEDSl1/4Pd4jc++IWl76XUO0p1uK1bMRh
         HyejdkmjlB1sXIMFNeLUMlCjAuoZ1M10LplOgp7dUvO9QsKMyvnhLBNPm+9xTl0ypQ2Y
         6upPDEHInysXkjLHoS8+vOYfOE3kqg1FrRSkGRKSNuuWI8XdHTCQmHYzDGnTI5mUhKKp
         2VHekoHEw00/Zl+8ma8POHKrx2blv9z+MfvbpAvn7eZkRDrbTn2zyheYtM7ZVH5g9Efe
         Ji6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865571; x=1702470371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tjQ53Rb3Fl2qhnRx36+rU5NX17wU559BxWeIYwBKok=;
        b=ObKsOtlUAf7oEjBScYArZawboU/VfWlOXIw8j6LpiZfnniGFBUZ8aIjV3ZHlSguF3t
         b/Sg8LfAVdKSZ8cPcjkkYgBdku6hK5/eC4zY6u6gSphgbQ4YQXv2VAFCMADM/z+sg4kE
         VSAzuruQttQ3z03Ty6AgwBmkIsyZVz9MIlIkdFKl1veW8S+NHGRmx6ktJyOaOqgUFG5C
         jNFTfSVsA5JWDtSbiwLzkl2mISO+UXQcO2WSH1non6PS2W0ZIkkdIKWdMomqEBYJBk1y
         WpxzIR/wqyeuTco5NX1jKJ4SxeIM2Kyz3fGhLZ49iUyiU15amJGxxxHy0K7731Bij74q
         JxEQ==
X-Gm-Message-State: AOJu0YwBEzfUET7d6ytcucWtADOufUtWFbkiXBjin9Q5Mxby6ZAK9caU
	Mi6Ud/o49svHR31pguGBJwvIVZlM0D8n/rpS8Po=
X-Google-Smtp-Source: AGHT+IESBB2CeuGJ5yqL31Ted5XJ7ij/QFlyurDvmBph0TN9hr+mdWrkPhda77LATKrnWQyRPmftSSh5MvOjPxK0QT8=
X-Received: by 2002:a2e:a174:0:b0:2c9:f695:9d41 with SMTP id
 u20-20020a2ea174000000b002c9f6959d41mr542055ljl.96.1701865570457; Wed, 06 Dec
 2023 04:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20231206092536.2874022-1-andrey.z@gmail.com> <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
 <CAHtQpK69mRhcq6xMYLSgFQT7aKiXnh323AJP08noyMNX5fJMgQ@mail.gmail.com>
In-Reply-To: <CAHtQpK69mRhcq6xMYLSgFQT7aKiXnh323AJP08noyMNX5fJMgQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Dec 2023 13:25:59 +0100
Message-ID: <CANNYZj8-9PHqeiRuExw+kdPhCNspCERzH1zKA9O7L06F=bx27w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Jermain Horsman <jermain.horsman@nedap.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 12:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191884

On Wed, 6 Dec 2023 at 12:51, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > Unfortunately I have to say no to this. The problem is that this will
> > update to latest revisions on all the layers, which I believe is not
> > what people would want, as everything including poky etc. will be
> > shifting uncontrollably.
>
> Correct, and that is exactly the reason why this mechanism is only
> offered via additional switch. If it is not supplied - then behavior is
> exactly the same, and this is intended. Only those users who would
> really like to exercise the shift would use it.

If you want to add something like this, it can't be an all or nothing
switch. There has to be a way to update only some of the layers, and
have others stay where they are. Also, you might want to update to
latest tag on a branch, rather than latest revision. There are many
scenarios, and there's no way oe-setup-layers can cover them, and it
shouldn't try.

> I've also prepared a patch for documenting this switch, but held it back
> until the functionality is in. There I do explain the case for CI systems
> which would want to capture updated setup of all layers in collection.

I understand and agree with the use case, I just don't think updating
all layers to their latest revisions is what many users want, or that
oe-setup-layers is the right place for this functionality.

> In this regard I think that json prescription is too strict.
>
> While this totally suites the needs and purpose of passing over the layer
> setup to any other client, it really limits the usability of setup-layers only
> to that specific case. If this was originally an intended design, then
> perhaps a note in documentation would be needed.

json schema does not require having precise revisions of the layers.
You can specify tags, branches or anything else that 'git checkout'
understands, and oe-setup-layers would follow that. It's just that we
currently don't have tools to write out anything except precise
revisions. But you can edit the json after the fact to point to
something else, then give it to oe-setup-layers, and it will work.

> Is there any mail thread or patch stack where this has been discussed?
>
> I would like to take a look at what was proposed and perhaps re-use and
> re-establish that part instead.

Look for the patchset '[RFC 0/7] bitbake-layers: Add
update-layers-setup' posted on 7 November, particularly the comments
to the individual patches, where we get to the design that should work
and cover the use cases.

Alex

