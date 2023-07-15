Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268B5EB64DC
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 13:40:43 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.12253.1689428435174062407
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 06:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jOBeP7xu;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fbbfaacfc1so4772248e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 06:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689428433; x=1692020433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lw9hqQHQ1w6LMhDLsN9k4CbtYIO6egkb3Jm57JoWJpk=;
        b=jOBeP7xuVu5eS5z+VJbNWxcNOiL1pjmR7E0N8maMh6MBo1tbCQFqH+4d61+XHSgLYC
         aWa1PYRa1Tx3mdPirLy7rz41m2i2QOy2Mp2p2We5CUi84QMVr0qP2kVVwA+suuJGtIW3
         qxwE7YqY43PNVtRsO59B7k7uOrsPkBn3ZYL597SFY45FZRZ5LaJJglB/EP8G8cNIwfwx
         m8u6jI5EqIrMUutb4LySJIh9OD5CwImLYA5hNjpbU1nT9S0IcPgnoVhy4qFxP3O2EftX
         Z6js8JaRqwjyJ/jyRiDu+xpuBgJ2keMtZP1lJrUfs5P9yQdIgIPFejDrJAtUEA6SVSGJ
         z+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689428433; x=1692020433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lw9hqQHQ1w6LMhDLsN9k4CbtYIO6egkb3Jm57JoWJpk=;
        b=lfkONb8P2XjcC5ll4Os4ULB11/WBH2VnWXsxpl+tnoe0WmcKal69M4l+wThNCzIZeg
         oTpuTO7ytU/WaY6ao7rgsxP+xQh5a5sGXdbHtZH7l1LYjz/6w2O7BOcFu6lyB3HJyd0n
         xsfHGqleqGJ+8pZLLi674D9EAJh9aXvnxfO4KXCtOFbHBg2HwejmW9Len8aUDTHqVzg4
         HztXu9DPAK5gOEsP3j0hMli6r2okqaaQazBvd6b66iAQNoTgcui1OPMoNyqzCl4q+1vU
         s2NWFBdub7rf62fHoxjWsOuVyrgJN1MZzLyy81PK3WmR+hBrybctVt5NPASCusK28dil
         Qn9g==
X-Gm-Message-State: ABy/qLaVLMRh/FHbMAcax78LbWLKItEDMs4sZ3Pg9acCJsxxTtQc9C6K
	YgSXZJLbbnDzEezcQ+E8yR5cGpHYmhcMZWDhiFw=
X-Google-Smtp-Source: APBJJlEQdHSPbd+zvToUXG2dYysHEvdlTVGws3Ct3gjc6UDUCKCOsJvERoplEqThrRLQ7iqZtmo+S6xUqeic69HNDIY=
X-Received: by 2002:a05:6512:2088:b0:4fb:90c6:c31a with SMTP id
 t8-20020a056512208800b004fb90c6c31amr5358937lfr.14.1689428433198; Sat, 15 Jul
 2023 06:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=6tBRhQaqO8jkM7CCpRfNAyYiByB4V4dFbbbWhu7A6QN6KTQ@mail.gmail.com>
 <CANNYZj8S6_P96ACXF8i=Pdw2ytAqq41ZF8WZOizsDrdZqmi7TA@mail.gmail.com> <CAB=6tBRY_Y8P2ifqkkcLOahhdPyY_w_Ns3dzh6N394NcCMA3pg@mail.gmail.com>
In-Reply-To: <CAB=6tBRY_Y8P2ifqkkcLOahhdPyY_w_Ns3dzh6N394NcCMA3pg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 15 Jul 2023 15:40:29 +0200
Message-ID: <CANNYZj_a45fHLdBYs1iVD0w6k5w+mW8QgjnEhrVTR71CkYqTrg@mail.gmail.com>
Subject: Re: [OE-Core][RFC] update-layers: Update layers managed by setup-layers
To: Chuck Wolber <chuckwolber@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 13:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184312

On Wed, 12 Jul 2023 at 23:53, Chuck Wolber <chuckwolber@gmail.com> wrote:
> But this is why I chose not to. By definition the setup-layers concept allows for a project specific repository to
> manage change, including change in openembedded-core. The same would go for update-layers. If we folded
> update-layers into bitbake-layers, you get a chicken/egg problem so it made more sense (in my mind) to treat
> update-layers like setup-layers - have it dropped in by bitbake-layers when it drops in setup-layers.
>
> But your question exposes a missing feature in update-layers - it should do a final check for an updated setup-layers
> and update-layers script and inform the user that the project distro repository needs to have those scripts updated
> as well.
>
> If my reasoning makes sense, I can put the time and energy into a set of OE-Core patches that reflects the
> above thinking.

I see setup-layers differently. It's a minimal standalone script that
is meant to do only one thing: set up the layers on local disk as
prescribed by content of the json, or bring them in sync with the
json. *Everything* else goes into layers where it is managed using
standard paths and extension mechanisms (which we can hopefully agree
on if they are missing, such as config template locations or
additional plugins to create-layers-setup or to bitbake-layers itself,
such as, possibly, update-layers plugin).

I will resist feature creep in setup-layers or extending
create-layers-setup to bundle more files or scripts next to it
(originally I wanted to fold json content itself into setup-layers,
and only reluctantly agreed to have it as a separate file). If you can
describe the chicken/egg problem in greater detail that would be
appreciated, because I struggle to understand where it is.

The problem can also be approached from a different side: rather than
update layer revisions with a separate tool/bitbake-layers extension,
why not have create-layers-setup write a json that lists the layer
repository and branch, but does not pin it to specific revision, for
one or more of the layers? Then setup-layers itself would just sync
everything to latest revisions on specified branches when it is run
against that json. And if you need to freeze the revisions, then that
goes into a second/third/etc. json. Thoughts?

Alex

