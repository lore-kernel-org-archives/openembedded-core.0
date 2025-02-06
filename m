Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5CAC02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 15:57:06 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.44670.1738857421553015390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 07:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MiIdqwHE;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6e9317a2aso182316985a.0;
        Thu, 06 Feb 2025 07:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738857420; x=1739462220; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WzEP1fxuynaR4wInkViQnMpnhlEj0y9duxmOsMFPp7o=;
        b=MiIdqwHEIbLAfh6xcGLR7gjvdvWxweQ/tUz938gEiFJ5FgJ0a84zRa1Wk/1ZiiuAY2
         uPTlsjRGRYKny6b6StP5J5jBRMeDbWD+ujPaFBbb0BK2btPB0S61TmEWIOi9lUyrjL3k
         XATLMq0stRBeRutndCZx3hxQFCVL9Ed2qVKfE1C3G3vvW8cK/fQIxRWvJ3rlSrWB7dkw
         ls3uWywx8CP2pGYyYaUzVpuGkE9XlTNOYiSpEFZ/awWhd4ai0Wl5HYOTO3nuAxeySnEt
         AP5pF37SLxjkz8jJmqNf8EMJ0NPquK8j9xUpUIFbmRHQ7X9RTww55vndkNKPq+j5FXRw
         i8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857420; x=1739462220;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WzEP1fxuynaR4wInkViQnMpnhlEj0y9duxmOsMFPp7o=;
        b=RgI6rCEAiwz05ax+irxixXwPGd01Ycc6kgO6yHg8Cym6q4oDT/S2y9b7K24NYj1mFu
         KWL17NY12vEaSsJiuVLiM7payNfqzXN/YrnEAim6AT9TMiC15K/FiaEthbNnovTcX2+4
         uFY6wU9lsPy+VlINuoEvfEWeCqtnfH1Shf3s3cWXw9pLSQ8SqKpceqBniP2NVWoUihw7
         n3ZOqHcK/Bi0GkALJ9zGcav+4QDj7uqBN8/7jZxSsDTt0DaRSF3iKRaOB1XUUlfpWEl5
         Eq0xlrJBI4qaUDrhS8+7LntARWGfxQkym+7rnMTi/tjV0/hgaz7XVhWyA5akd7Agok4J
         MgPA==
X-Forwarded-Encrypted: i=1; AJvYcCVzxAJo9PeJekM3IoxGxoqxpd5pCtmV7sl0so6hMXgW1LwLEWq5qofY2lM0UhvWpzXLfbMAs+2rZfqsG5LTbaqHiQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEK8zy6z5CWLm1GqEa97+btKNyXSZs3dcTXy4hfBY+UOsNb8Gh
	i2670ZTsTL5DEwIfdgZdH7nce/XFF62oaELJvMZ+EEKujxUDptbOcKKSwVtS0vy1x6ic8F+WYoT
	OPls5pPpuTRGQmbZfznJh20kVX8PrSQ==
X-Gm-Gg: ASbGncvkYxTXwHjwJVo3Nt2bgjGx9Yqbhf8AAnyKCiVvhBC+9Jv65zrgekgDwj1208C
	0h73fgkqc1FbH/ET1AIFE3g/BbRFrFsNRd/iVwrxJVfYkHyaziA3Z+hDkzGF8xNwk1WcvLjOl
X-Google-Smtp-Source: AGHT+IHA7bu0zBFcr4bFnOjAgPJacBniVDtaJg1nlDmOTVdbqLyXLwr7grPp1yRxmqVQFYlw6O8fyUobmhVMLu8UyCQ=
X-Received: by 2002:a05:6214:1d2b:b0:6e2:4da9:4e2d with SMTP id
 6a1803df08f44-6e439b0eb2fmr59398236d6.9.1738857420304; Thu, 06 Feb 2025
 07:57:00 -0800 (PST)
MIME-Version: 1.0
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Feb 2025 16:56:48 +0100
X-Gm-Features: AWEUYZkZ8-3NuhkADxcUJruMU-KUu1_EQE465HfqgObmmUeO66nOj0FaY5VNK5w
Message-ID: <CANNYZj85xWewvktp1OXPK71CGe4i=p80LYxLuU0cyQUOCH3Zcw@mail.gmail.com>
Subject: proposal/plan for taking bitbake-setup into use - official
 configurations (with guaranteed sstate)
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 15:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210948

Hello all,

the current revision of bitbake-setup
(https://github.com/kanavin/bitbake/commits/akanavin/bitbake-setup/)
is now as good as I can make it (given the currently implemented
features), so here's the plan to take it into use for setting up Yocto
builds. Step by step:

0. Terminology used:

https://lists.openembedded.org/g/openembedded-architecture/topic/terminology_for_bitbake_setup/110775384

1. What are the configurations that Yocto project should offer?

The official configuration registry (in a repository called
yocto-configurations, hosted on git.yoctoproject.org) would contain
configurations for tip of master, and tips of all stable branches from
some future release onward. E.g.

yocto-master.conf
yocto-5.2-walnascar.conf
yocto-5.3-xomething.conf
and so on.

Stable release configurations are never removed from the registry even
when they become archaic. Rather, they contain a field with their
expiry date, and when that date passes bitbake-setup will hide them
from 'list' output, and politely note that the respective release is
no longer supported or maintained upstream when its status is queried.

There will be no configurations with specific point releases; it's too
much ever-growing clutter (especially for LTS) and not what people
really need when they get started. At some point they'll create their
own private configurations, and then they can pin layer revisions as
they please.

Each configuration checks out bitbake/oe-core/meta-yocto/yocto-docs
repos separately. Poky repository will not be used. Note that there's
an issue here described separately in [1].

[1] https://lists.openembedded.org/g/openembedded-architecture/topic/layer_layout_poky_vs/111010762

2. What bitbake configurations should each configuration offer?

This is sort of subject to debate, but here's the starting point:

- qemux86-64 and qemuarm64 as machines. No retro computing, no
unsupportive vendors.
- poky, poky-altcfg, poky-tiny as distros

That makes for six configurations.

Targets for each of them (except tiny) would be the images: minimal,
full-cmdline, weston, sato-sdk.

Each bitbake configuration is defined as 'blank' template (e.g. empty
local.conf) provided in meta-poky (this needs to be added there) plus
fragments that set machine and distro, and sstate mirror or anything
else needed for a good first experience.

Each configuration is guaranteed to come with pre-built sstate. This
is the killer feature of the whole project.

3. Containerized builds?

Not at the moment. This is a future project. I tend to dislike
containers, and think we should rather detect if buildtools-tarball is
needed, and pull that in if so.

4. How is sstate availability guaranteed?

There would be an autobuilder job, part of a-full, that would use
bitbake-setup to set up a build matching the branch being tested, and
use that setup to run builds that populate sstate.

Then, bitbake-setup would be used again to set up the same build, but
instead it would run a selftest inside that setup that checks that
sstate mirror has been properly populated. We already have such a
test, and such a job, but they work directly in the bitbake build set
up by the autobuilder.

Note that master-next (or somerelease-next) doesn't always match what
then gets added to master (or somerelease); for testing exactly master
there are nightly a-full jobs. There could be a short window of not
yet provided sstate until that nightly job runs, but I'm not sure how
to address that, short of asking maintainers to run the sstate
population job from staging branch before they push that staging
branch to master/stable branch.

5. Is cloning poky and using oe-init-build-env deprecated?

Yes... but in the softest, gentlest manner possible. Documentation
should put using bitbake-setup first, and explain why it is better.

6. Should autobuilder use bitbake-setup?

Yes, for credibility and validation reasons, but it's a much higher
hanging fruit. There are a lot of tightly coupled moving pieces there,
and bitbake builds are also distributed between multiple workers,
something bitbake-setup doesn't currently account for. It's a
separate, future project.

Thanks,
Alex

