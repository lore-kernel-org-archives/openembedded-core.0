Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05EFC4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 12:09:10 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.184303.1698754143401912753
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 05:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSD44YZu;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so77441561fa.3;
        Tue, 31 Oct 2023 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698754141; x=1699358941; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AghUadyPPGYVGq83Wbg0rKlnCUSd4KXYU/XAmPR8b7s=;
        b=iSD44YZugHSCpUiJeQ2hxx0AkQyHut07vqdNOiGR2pOM95jUgGzsrCikvn5E5aTfYh
         rJ6DJeoUDmz/UZ5Bb4YxeeqNNEPL1RvarXmcSwhT8QIgrBNnKiEt4qtuf4MtrrXBfY4x
         t9ebJ4lA/EVYSPzWsJ4aPemyyHS0FqYlz4ngg+X34uNSBfHMqCy8YKCO28l+7sCn+mUr
         RPwMZGM6cMG76KFFMoyukkfkyM/vnjPNNsMuQ+BTExqgRCiotGMPLbUH1fUrCcwfWhTp
         eg8Wac72VsVQdDYj2VPNWgH9Oxuo2tFn6OqyKxCpbDKI8SS7GRZRpNn/Ma/ceD+M/pF9
         RBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698754141; x=1699358941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AghUadyPPGYVGq83Wbg0rKlnCUSd4KXYU/XAmPR8b7s=;
        b=uTKIUMTwq/IpnvaiboslEwd1oZ7XcYweQYpY9demHXUdOKn22CzilZAj2r7eofPxjl
         Hs0QwuRaFfHBxxm/tTFRhIakBAS3VM4y89t5OGngtDCnogi5fZG6RvL6T349ZIjUKdA9
         xz173p94MB5VJlPFAyZRxCg0lt/sBu/J2BatS1R3IEAGewgLJiLh+BwgeYBu0Hghmkn8
         SIsskvA+TkVvcYR0X88klO0IrxJzCWPPm/7OWco/vAs0fJW3r1Vk9m7AZf66imKZ5MZQ
         0PZaCwxWqoCCvn5Nf1KSwLptvzqmt63GJ/Aquv0ByjjJM5kXpvKcVQQUvI6mEzWv/tdx
         BiPg==
X-Gm-Message-State: AOJu0YzrlY1ci0rpUmXJwrhiR6L+QSJd8IiW/ofd9YJMVjM0XPQWlBIK
	Pl6UatUCJFGzLA13LfQCLu8bztHtc11sKzfywM8=
X-Google-Smtp-Source: AGHT+IEBC4ye1BADTvk++EPqMgvPsrZMz9fOF7qgL4irIF0aJOHrBtwXQo813pw9j/G0ZgzAyQBPjzgMaT36S115X8w=
X-Received: by 2002:a2e:95cf:0:b0:2bf:e596:36f9 with SMTP id
 y15-20020a2e95cf000000b002bfe59636f9mr9118142ljh.13.1698754140991; Tue, 31
 Oct 2023 05:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj-JhGnGFRxaF0+Q_5Sqq76kAg1pSBBMka_xefuhMv6-vQ@mail.gmail.com>
 <ea84079102bca429a6ae521d218118952a79f111.camel@linuxfoundation.org> <1792EACC19CD8046.7262@lists.openembedded.org>
In-Reply-To: <1792EACC19CD8046.7262@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 31 Oct 2023 13:08:48 +0100
Message-ID: <CANNYZj_mjbH08rHoo0FzFihcax9zQ1zR6QRoEA3C_JOHG7P9kg@mail.gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 12:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189837

On Mon, 30 Oct 2023 at 16:02, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> So here's what could be done:
>
> - esdk tools become symlinks in poky/scripts/esdk-tools/. esdk
> environment script puts that in PATH, rather than some custom
> esdk-specific location (the code to generate that can then be
> dropped).

This is now implemented (needs to be tested on AB).

> - esdk tweaks to local.conf move into a dedicated include file, which
> can be static and under version control, except for perhaps
> METADATA_REVISION:poky = "4a1e0b9625729e422fcf24e632ee2a3c79f986d5" -
> I need to check why is it there and how that is used.

It's actually more complicated. The code to generate esdk-specific
local.conf with all the tweaks has too much dynamic stuff in it which
is subject to what various variables are set to. So I'm thinking of
extracting that to a dedicated function, then attaching a bitbake task
to that function.

Then we can pull all of it together into 'devtool esdk <image>'
command (or similar), which would enter the esdk environment directly
via:
- running 'bitbake <image> meta-ide-support'
- running the above mentioned bitbake local.conf task to generate the
esdk-specific local.conf
- sourcing the environment script produced by meta-ide-support
- rewriting PATH to provide only the curated esdk tools and not
everything plus bitbake.
- writing a custom devtool.conf similar to that of standalone esdk so
that devtool can find bitbake and bitbake can use the esdk-specific
local.conf

And it would be tested in the same way standalone esdks are.

Thoughts? Anything missing from the above list?

Alex

