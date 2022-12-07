Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B500C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 08:53:40 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.10830.1670403214676188320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 00:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bKFXzmgl;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id p36so23290123lfa.12
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 00:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4UL88HsqY38j/oiilgI5oecORfBB4Uw3xY0w8VfCTxs=;
        b=bKFXzmglxbSjppW1qLJvJawLCOBXClTH66qhCkoICxh5W+krP3XDVj4mi1J+Erq510
         hFgh3WQWfRdHk6kOi/pdwEejAiLqAsNJ+Pz7S1KUbiMK5VnqPakkl/Vs1qASD1Lu8/AN
         mxRf46UVOwRGid3BvVTWgd/j8jg+LNMy6Gsm4O+ZSqG3GnumSXIeFyzOLqI6Tx0ru96u
         jPby3t/8lBzFzyWCXO4Hl9j6cNT9704V9r39XTuzrkjhiT1ViBg/CJT9Yp5quzp5Bl9N
         BBDsYRNsMVGciAwvERLow2szRakwyyjJyILIWozedGf2iUW5VBSXxphl/eZUYR6lw/5Q
         S3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UL88HsqY38j/oiilgI5oecORfBB4Uw3xY0w8VfCTxs=;
        b=sEo+ocqe7cNhvz0bfpcViG4FS7KZn4tvcPVyZdds8Lqjm04UDJSvsSUCp7J9G7iC89
         OAw719TSCNDUTbGYUmWyTXTOiuC6qDroN2sgxFXWwcyVPVJReNkLFKXQqMtjUYMDYOYk
         kUdUXXQghEEcbXGcTVwqlcy9iHGA9QokY+MFxrATMmvfGw+i8Ve6/zxiZcjIOvDpGvMs
         wvyWFVM3bgxsesqMTm4LVnkGmt298zT/V78uAUDgL8RphOIdRTntfiCcvy9dtMXLTKTl
         hW/MXYlCVxPJT1aZmVi8bDifaJjRR0i9wi36J9zuiZKi4xbJ7nKJ7uxUcgPzKDs6VPm+
         pmFg==
X-Gm-Message-State: ANoB5pnwrjTDtYqKA3y2rJb9qpFZ5nxm6ajg4wNzbnBonlFC6lkTkoSE
	wFHb/ksDRd1Iwn61Tw0NbNuJcnVLY+3TYEdEYxk=
X-Google-Smtp-Source: AA0mqf7CXSUhlUdmqSKSgeQuoEwsbwt73zRqc/wnxaC3P5yizDjR0nVSRit36aXKGETnbCkzgBegC1rgQDqWObstfvg=
X-Received: by 2002:a05:6512:3b9b:b0:4a2:4aad:8fff with SMTP id
 g27-20020a0565123b9b00b004a24aad8fffmr28708390lfv.445.1670403211417; Wed, 07
 Dec 2022 00:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20221031114719.2725967-1-alex@linutronix.de> <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
 <20221207002040.GB1080@xn--80adja5bqm.su>
In-Reply-To: <20221207002040.GB1080@xn--80adja5bqm.su>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Dec 2022 09:53:20 +0100
Message-ID: <CANNYZj9_46SdQdVuwFQ-HosVB7X2QpG0PDYNybV+ZL2Xt1FS3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add a
 class to generate SRC_URI crate lists from Cargo.lock
To: Sergey Bostandzhyan <jin@mediatomb.cc>
Cc: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>, Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 08:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174347

On Wed, 7 Dec 2022 at 01:21, Sergey Bostandzhyan <jin@mediatomb.cc> wrote:
> I think this should be documented more prominently, as missing information
> on how to get going was the biggest obstacle, at least for me. The benefit of
> this workflow is, that no additional layer is needed and that everything seems
> to more or less work out of the box within the usual checkout.

Thanks for the report, I totally agree that the rust recipe workflow
should be documented somewhere in the official manuals, I'm just not
sure where. Perhaps the 'common tasks' in
https://docs.yoctoproject.org/dev-manual/index.html ?

Can you write and propose a patch to the documentation repository?

> The downside is a two step approach and I wonder if it would be possible to
> append the SRC_URI crate entries on the fly, but in a way that still works
> with sstate so that regeneration happens only when something has changed.

You can't modify anything in the layers during bitbake tasks, only if
the task is completely standalone and isolated. You also can't modify
SRC_URI internally after fetching as SRC_URI needs to be fully formed
before the fetch task runs. What we can do is provide better hints in
case cargo fails because the list of crates mismatches the lockdown
file in the source, and needs to be updated (or created). Can this be
reliably detected?

Alex

