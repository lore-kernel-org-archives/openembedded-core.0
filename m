Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E473D3CC9F
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 08:00:41 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30949.1768464036310692880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 00:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M4iIHfNj;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88888c41a13so8567956d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 00:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768464035; x=1769068835; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LjL8nxf0THDl0w/m8nY/4zXs6+gZqlg7lYl6W+IdJLU=;
        b=M4iIHfNjVl5RtJRH3+CWm1YO9nBVKq8OjU9LcE/CznHPVK02odkDbRxwg6pMBr9cN6
         6cfb3CU4QdPTi0i1cozYuvFOc7dkzR5jyO0De3gn1W1UvUpS+HufkqWcYI2zzWZcjjwI
         BxwFS1VBR2LpLR743kU2DBdxih3Wl8rPPQ8xRO9jbN2qkY7w1dHOy+qJYQCgyHsF1KT1
         lr/hhRFKsa8zbWO9/udPn/ljIqMQNbf80n2GtJ2fUMzmd9aP1YbkLnOPWcX40k/6YTLo
         VLf1y2gya6ijgmV9O+6U2bgbh0ezFWPMLKY6gTZo9/GnZe3cnWByOtcrzXwS/dDtYHnn
         IhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464035; x=1769068835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjL8nxf0THDl0w/m8nY/4zXs6+gZqlg7lYl6W+IdJLU=;
        b=C19MbnzyA45gqcVAx0G0Et56jU84HcPy3qSCNUumW6HF2SGcFA2jSrqvWzPcGLAxIu
         RMGp9xesVoXNE3Z8bbq19aQeThzb4ThVKCQ6R1GYbkg9whxkl/9x3zvgDEmTEl6MJLD1
         +bexVuyaYzqQjFRdu+tPLvRPX8cny89dvi9xVxAllEYcINH4TXLj5W56116CdkQr4nen
         /2ukdh9Xtv5NdCJfRqeLtHsiwLzEa12QC8yWRxppncyBg1hUd21VKFcCjxupJHa2c0Sh
         m3NhIhwFU2jYOM1mJ+VW4YL40Bv4Y1u/ALDsBgjjjKu4JCekQfsa9M568izRPt9kVrFG
         l0rw==
X-Forwarded-Encrypted: i=1; AJvYcCV92BWsyPi8QBcUt0nqnwXmgL+ivqt5MaMhTyr32g6ILWrSOfJjja0zs35+fo46iEVZl6dMQfLw8Lku1oOoyHdmIA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwIgetaXyttLNfCD/J2bZzyMo27NSV11bec37RaLFwgVc6Gc3N/
	gETmExBTMmHgwiOXNd8zBGl+o7KurubBcnHON7RQiuLYDb1QUM1qp6I5rvFWQpR4V++xFo2+P11
	cYTUDv4lLiRiwIYAxJnyTvw2/drtI9kc=
X-Gm-Gg: AY/fxX5HNG4P+4zEI8Mya1fNpfawfKOgIuhpmOhOpOLCNbu16e0Ok1bXAaOlUUZBWct
	ukakGO71XC5NyqBskpdLgdOwdr2/vw6qVVcpRNSUfpow0FXCOG6DrF67Wtc2eVs622gx41JrmjJ
	TWr4Eg6IyQTDnPNmg1wpk75zTTgsKMghNLVAwjryZ+wXONlCc3DAzQySALtaBOG4rVlZpu+QxB6
	BHBPGMEL/vGRvjr9dzO/5EVdMxLPCen4fDRT47fCD6qsdQAIKRVbpK8o3Dfot1fffFm2kRI
X-Received: by 2002:a05:6214:19e6:b0:87c:2360:d404 with SMTP id
 6a1803df08f44-89275ad83b3mr72225756d6.7.1768464035001; Thu, 15 Jan 2026
 00:00:35 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKowQqn-VuqaT1w3cXCWGfBeMtG2rHR9HXBFqxSfttAk4Q@mail.gmail.com>
 <CANNYZj_ERuqEY6w49NRKO5OsBr-HqG8hDSHiAB-e55LVhZq=cQ@mail.gmail.com> <CA+HEL78C8y7fgiw1GVkGovT-rEBObyqF1+eRy62suE-wHHW-og@mail.gmail.com>
In-Reply-To: <CA+HEL78C8y7fgiw1GVkGovT-rEBObyqF1+eRy62suE-wHHW-og@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Jan 2026 09:00:23 +0100
X-Gm-Features: AZwV_QjjzbQx2oa4QWBYNpWvDrdlFo_WPmHTfGFoxbWpU1yxgmt-leD9LXm895A
Message-ID: <CANNYZj9yJrsWAnjFMSXZbZJGoqMjC9Hc5cHg7MtX9qRiEFGQqw@mail.gmail.com>
Subject: Re: [bitbake-devel] [RFC] bitbake-setup: Documentation terminology
 and tooling suggestions
To: Daiane Angolini <daiane.angolini@foundries.io>
Cc: otavio.salvador@ossystems.com.br, bitbake-devel@lists.openembedded.org, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 08:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229390

On Wed, 14 Jan 2026 at 18:43, Daiane Angolini
<daiane.angolini@foundries.io> wrote:
> Let me frase this in another way. My project has all and every
> configuration needed into a distro conf file. I want to create a
> .conf.json to share. Can I create one file without any
> variant/fragment/bitbake configuration?

You still need to specify in the json what layers need to be included
into a bitbake configuration, and what distro and what machine needs
to be selected, if you want bitbake-setup to produce a functional
build where bitbake can run. If you don't do that, bitbake will
immediately tell that a machine isn't set, or that there are no layers
or some such error.

So you need to define at least one top level variant thusly:

    "bitbake-setup": {
        "configurations": [
        {
            "name": "poky how it used to be"
            "bb-layers":
["openembedded-core/meta","meta-yocto/meta-yocto-bsp","meta-yocto/meta-poky"],
            "oe-fragments": ["machine/qemux86-64", "distro/poky"]
        }
        ]
    }

In another message there's a question of what would be the equivalent of:

git clone <poky> -b LTS
source oe-init-build-env
bitbake <image>

The above is the equivalent. bitbake-setup will not ask any questions
about choosing something, because there is only one choice.

I appreciate the standard configs are quite a bit more complex than
that, and a 'simple' example might've been helpful, but we want to
give users a range of options rather than impose very specific
selections on them as was done previously.

> Or, Why is the variant "poky" empty? [1]

There's a "poky-with-sstate" variant next to it. Both variants are
nested in a higher level variant that sets common configuration for
both of them. One is supposed to use that common configuration without
change, the other adds the sstate enabling fragment. Think of it as a
tree of variants. You can define sub-variants with as much nesting as
you want. For example if you have a range of target machines, they
could all share a common configuration, and then each would add a
specific machine fragment.

> Or, why is there "two pokys" for me to choose?
>
> ```
> Available configurations:
> 1. poky-master  Poky - The Yocto Project testing distribution
> configurations and hardware test platforms
>
> Available bitbake configurations:
> 1. poky Poky - The Yocto Project testing distribution
> ```
> from the iterative `bitbake-setup init` output, from [2]

Please do not trim the output because that gives a misleading
impression that the same question is being asked.

The first question is about whether you want poky (the reference
testing distro) or a basic openembedded build, and which release of
either (master, or whinlatter, or soon there will be the upcoming LTS
option there as well) you prefer:

Available configurations:
1. oe-nodistro-master    OpenEmbedded - 'nodistro' basic configuration
2. oe-nodistro-whinlatter    OpenEmbedded - 'nodistro' basic
configuration, release 5.3 'whinlatter' (supported until 2026-05-31)
3. poky-master    Poky - The Yocto Project testing distribution
configurations and hardware test platforms
4. poky-whinlatter    Poky - The Yocto Project testing distribution
configurations and hardware test platforms, release 5.3 'whinlatter'
(supported until 2026-05-31)

Assuming you chose poky, he second question is about whether you want
to enable pre-build sstate from yocto infrastructure to accelerate
your builds if your machine isn't very powerful:

Available bitbake configurations:
1. poky    Poky - The Yocto Project testing distribution
2. poky-with-sstate    Poky - The Yocto Project testing distribution
with internet sstate acceleration. Use with caution as it requires a
completely robust local network with sufficient bandwidth.

We could probably improve the descriptions and suggestions in these,
but the intents of these choices are hopefully more clear now.

> And when I created the draft `conf.json` for meta-freescale I realized
> I could just choose none of the variants (because the base is the
> DISTRO and I might want only that)

You still need to create one top level variant with that distro name
specified in it, and the list of layers to enable, and perhaps a
target machine.

> I'm not sure it makes sense, please help me understand

Hopefully this is a bit more clear now.

Alex

