Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD649C6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 15:30:04 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.12678.1664292597855381645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 08:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b3RIu8AJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id b6so11306226ljr.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=RThROL+hDgr2MT2cFeBxZZul0UVpfHWzcECD1mh97P8=;
        b=b3RIu8AJ9IVnFqg+mhN+b6YiAhBHM9y/GBq2DKV/zbP4r+Epj/kIBDhtI0A4KfHDTw
         H1HvLblNFE0MzzN2pI7Z8ePNt4MoYTer0F9rxfuso0ti6iwUX+w3pGVKJ6q8Y4YJHrij
         SCB22i4lpsT0+wOIevnagx9AKfi2eUevj7k1K3zLvIfqBVE+I0vTjS77GaGg4nJJzHVd
         U6joyESh2wIhP7gKjZPLQej3eZeFgWhmFNBtAMl7Ee+GL2em+Zh0uREMiECThzoHcQDq
         vaO82PgGT8d/ZCGqlYGUF2Lt/U2FoR/oBuImnU/8sFL8BLNkW/k8Vo/xhN+miUw+YPxO
         KbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RThROL+hDgr2MT2cFeBxZZul0UVpfHWzcECD1mh97P8=;
        b=2VDhFCugrvxs4kdbbn+l08vZ9kwX//eDohrndNftzozLxjKoCh5iSx53cTpppWMBZc
         OPGZi9dN+JL6AjvK3PITWwEudsAyAFEuF6cnDG+oqHQP5F+cS+WXxdyc3snds3wQiLFu
         6F6K4uNNenHrQ951+ZVfmVgp+iTUJSbMGCuuwxuIs3eE1f5Gj9Xawg9H0PZwzLGS4WYj
         0XgP8dEwIw1j5Fw0WHZwnv+1Et48DLDCpqKtnp9Glp2ZFQFMUcUiZDX0z0Bc6Hel2haC
         KLnirl8OU1YwNg3XQ47hvRQgkkHXysSHElftPY8b8OCl2X4UGZzU3qPyqcyxvQ950L0k
         3X4w==
X-Gm-Message-State: ACrzQf0y7hxC0kpdq5ggKtV+PU8TsM58TNfwbBb3umoIWpg9pBWi6UFq
	gUD5CHHCJjeQDqnE2b8l8PEq/dJz6cLQF6u5evI=
X-Google-Smtp-Source: 
 AMsMyM7vBR4XZG2RZHOntNN0MePqpId1Hv4roSyNMix0ErueagzlBny4JNLnTUHzuZM5IJVYY8eSU6CTCT4NejeuVqQ=
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id
 g16-20020a2e9e50000000b00261e3fdcdc5mr9800865ljk.56.1664292596043; Tue, 27
 Sep 2022 08:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <6dbf0e264c68433a8aee1a772015c852@axis.com>
In-Reply-To: <6dbf0e264c68433a8aee1a772015c852@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Sep 2022 17:29:44 +0200
Message-ID: 
 <CANNYZj8G_3vKaKG-vA=0+t6zQEb-C3cwj6hswBvVbihCkiWtKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 15:30:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171107

On Tue, 27 Sept 2022 at 16:56, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Since I of course do not want for my developers to face this
> error when they update, I have two options:
>
> 1) I can remove the old templateconf.cfg file in our wrapper.
>    This means I have to duplicate the code in
>    scripts/oe-buildenv-internal that calculates the BUILDDIR
>    variable. It also means I will have to keep and maintain this
>    code for the foreseeable future.
> 2) Change the code in scripts/oe-setup-builddir so that it is
>    not hardcoded to only support OE and Poky, but instead is
>    generic and works the same for anyone.
>
> From my point of view, option 2 should be the natural choice.

Three options. You can also instruct your developers to simply remove
their build directories. Is that such a catastrophe? We do not promise
that build directories stay backwards compatible and never explode on
distro upgrades, we try out best, but sometimes they just don't.

Alex

