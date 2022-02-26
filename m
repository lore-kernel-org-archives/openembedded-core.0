Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EFAC433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 15:11:29 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web09.6378.1645888288245209637
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jagZyA+z;
 spf=pass (domain: gmail.com, ip: 209.85.217.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id e5so8522857vsg.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2TG24dNySOVG+UILJWr99ZFlOKBCgzRXufyDWVN6UuM=;
        b=jagZyA+zCtr/uRbRo6JbVtkaXzH0adZUYMTOxZ7UlXvD0VKItYqh68harL3v2gEEX3
         u5cNpqebpXZHQxPs/cKBzH50P+1sEgyRZwJDGarDRujm2pme9h1zM+TmSUeETqivQXoL
         i3rMedIaFc1wueuvq4RaLKk1fRWsSYfwiswonYktDWfQm8CSFY3Bh1LFTshHMw9BN7Cj
         9KtHMMTFnpPE661WSocWNfg4rncNL1CSnGquK0Ax5I3nZwsQC7rqqCBFPTliG+vEw1/j
         QMBwSwYmR2WgTGunGF1wcfgNHn1ONhpABEG66Fw5ISmYrWmoekSrSA4fVVN+Lhelz19O
         P1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2TG24dNySOVG+UILJWr99ZFlOKBCgzRXufyDWVN6UuM=;
        b=IMOPA1J53oTDW6X8EtRCx5/0P1eG+Oan5K4PH287YOif+ZD2dgIRa4phVWkR5yaQJR
         KMuSFCsZRVqX5NTClML+gHg7C2p8SNCzrWa8SCSEKgb/jGDgK5cemO52ccwcCZ8J9b3g
         Aj+ZWsb5VhCV+mihbIHPe/MgsfSbPmnd3mwmQP/LSAPemJwKCVfDUBwC+FUOzyFtjHKJ
         FHwvlmb/k/TZLznLHbDU7BgeiisMuimsIaKaY9Lxt9hw1xNgxf0tiYZHShJ9pl7/C6Gb
         oYmC5V9e7VvMvkmFwtz7Hr9pombRg2kw3d480ypFfPx3rMe9VeUOy9pFDLNt7s3KefE6
         B3aQ==
X-Gm-Message-State: AOAM5322d2QnY9hNdfhXOMBGHDz2JUosseDOvlwv3AUqsQpA93MmfU94
	J96QKMGghKKcaaPIrZq3XFiHlM0aKko8MSpaPLg=
X-Google-Smtp-Source: 
 ABdhPJxDpKC5MlWdiaN6uQpMfEmDjRGwCCtTQtSxH4Ujf459Kj66yFY84RYsMxImgv4FfH2flOPE1vh/XLcPsZuK/q4=
X-Received: by 2002:a67:e113:0:b0:30e:303d:d1d6 with SMTP id
 d19-20020a67e113000000b0030e303dd1d6mr4844107vsl.38.1645888287337; Sat, 26
 Feb 2022 07:11:27 -0800 (PST)
MIME-Version: 1.0
References: <20220225195251.2433615-1-alex@linutronix.de>
 <20220225195251.2433615-2-alex@linutronix.de>
 <63129c4bef7fbd014cf7563d5cd056ffb757c378.camel@linuxfoundation.org>
 <CANNYZj83jSifmia4Vp2FWPzmSNNADbZo95_ge0Y96riMGE8QGg@mail.gmail.com>
 <7d10d27431a0d07408dee194eda0106dc945e247.camel@linuxfoundation.org>
In-Reply-To: 
 <7d10d27431a0d07408dee194eda0106dc945e247.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 26 Feb 2022 16:11:15 +0100
Message-ID: 
 <CANNYZj8bypnmMQ5kP9JVJKQGxGsaBjv1bExOnT4K49jT6G3xKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] OELAYOUT_ABI: bump, avoid tmp/ breakage by
 removing old cross manifests
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex@linutronix.de>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 15:11:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162427

On Sat, 26 Feb 2022 at 01:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Yes, this needs a tweak. Imagine you have a TMPDIR where you build with two
> different machines, an x86 one and an arm one.
>
> Your patch as it stands removes the current cross toolchain but not the other
> one. The ABI of TMPDIR changes only once so you need to cover all cross recipes
> here, not just the current one.

Thanks, now I get it. There's a patch with the tweak now.

Alex

