Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70320C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 17:55:24 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web12.32.1645120523546981957
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 09:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VLtusbD3;
 spf=pass (domain: gmail.com, ip: 209.85.217.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id i27so7145543vsr.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 09:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EQkpxW3Hvj0NxcBBqzVhBGDeLsnYzBy6A3E66jAid7c=;
        b=VLtusbD3ZeMxBSMrvwqswYS8OiVtb0RETJSWPNJTSUUtrGFpCXn58kslQQ3QHCh2bM
         2cFyUcEVHjmTvN/vpH0RKs8SW94fWZNzBLz+Hcg075FRkiAGFoPsQKg9q4ivPCBMUIV/
         oemD61jZjOVES/nRU/qpZ9Y92DL1jppAqdN65NjVkLxel92OHAmQnNQQ1S0j8wu11HjU
         KlHPZa9FgLhYIG8Jl1W796ZBHZvHr0ih+Srl+TbZQqtXwSYWXjvC1pXaI9XsCGt95sDd
         7g6s4thhVWjpH2rLd1wXC8OikTd3Ztae4NtvFIvi6bl1tWScn4Upw3nmx1oAWumuMPQc
         wpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EQkpxW3Hvj0NxcBBqzVhBGDeLsnYzBy6A3E66jAid7c=;
        b=4MCb+EKs3UXY6oHztKDUisSqG101XIsYcXVZ0UrA5m19cep1tYHjOWJGncvFnIXYKK
         NqVgQDbDqXMvUmSDEjSVSTZR7lJTXtEd6TvfjYV0ZsBpozDV4MXVJk5B+VHhwUYDG4EG
         RfFGxFrTYvPePOdSz25utLh9fE/2ONLultBbErtG3fiHYv73Wt9tLoNxnWcSjAn0kNPJ
         5BVDnYrmCnPr5yOVpqncoPoXaQ18KE8ddxymxS9RI3dvfay2oG1X8JI4VaFtfLtQ7R+d
         vxRFjulGXZXJT5zNLRB7LWQ/jZUeLtWk11TyO3Pei4aXaqwa4504apZUqwNRyR5hrBYB
         YfYA==
X-Gm-Message-State: AOAM531Sx2XRgokEDW1lws4a6hueiDiGsyL/c6p2fihDVXlhU2//xgjT
	eA+TxXLJ/hs/Ncm8g1M1SYTWk0BDkZ+UeaivTzg=
X-Google-Smtp-Source: 
 ABdhPJxQI4qRYjFP4TU2qWxwSlShrhtnP/oxU0Ganm57mzvFFEm5Up4IoyJkN4GuLpyl/Ao1mpxtes+fqswMc6UUqeQ=
X-Received: by 2002:a05:6102:20d1:b0:30e:dfe6:de1a with SMTP id
 i17-20020a05610220d100b0030edfe6de1amr1827386vsr.73.1645120522659; Thu, 17
 Feb 2022 09:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-4-alex@linutronix.de>
 <41d3206a0e2d4aa392e80483a503cb86@axis.com>
In-Reply-To: <41d3206a0e2d4aa392e80483a503cb86@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Feb 2022 18:55:11 +0100
Message-ID: 
 <CANNYZj_JdkU=jjvrDs8xQFWeaFHqtb+jSR89qhOKuevnEeUgBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/28] devtool: auto-pick 'main' branch in
 addition to 'master' in upgrades
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 17:55:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161850

On Thu, 17 Feb 2022 at 18:36, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> This seems incorrect since the branch= parameter is always
> required nowadays. I would more expect the code to look something
> like this:
>
>             if len(get_branch) == 1:
>                 # If srcrev is on only ONE branch, then use that branch
>                 srcbranch = get_branch[0]
>             elif 'main' in get_branch:
>                 # If srcrev is on multiple branches, then choose 'main' if it is one of them
>                 srcbranch = 'main'
>             elif 'master' in get_branch:
>                 # Otherwise choose 'master' if it is one of the branches
>                 srcbranch = 'master'
>             else:

It has worked fine where the branch is still master; I admit I don't
fully understand how this works, but it did help with a failed update
where devtool wasn't able to pick 'main' from several branches
containing the same SRCREV. Upgrade functionality isn't easy to test
as it is made of a million corner cases and runs against a 'live',
constantly evolving set of pending updates, so I mostly adjust it from
experience with AUH. If this still isn't good enough (as show by
actual failed updates), I'll adjust further.

Alex

