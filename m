Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0DEC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 16:10:23 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.52063.1670343012812197305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 08:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EB/hcIhd;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id d6so24412679lfs.10
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 08:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mtDT1r8a/evQaC3lDWKPG0TEqFC0uocanKBnyPY6HUU=;
        b=EB/hcIhdaBxIGcrAqIBlmLSNn9fUKotojl5Bf5TuHYW2l7UoSaADqNSkLKHyEuACYL
         4hs4fRIXnSvFr7R8RqAfVa+rEbIz06x+I94umorSRRCeR7/zs/aAVR2N4aUaAxDzKk7h
         wymvHnBv8jHsxIYBEzfJPoVPsCZ6oD59VVrVIfJ1qwE6+1F5CZ6GtqPy/ZWA6Ins5zRL
         qJFbfM2RXjW+XZMkFG1XevdtwF3i9pZ3ukW1Ew/+3vaQKua+ZHJBCsYpcfbrvZptvatj
         RpS9i9UmpatFLyognTv58gBfmzYpi+/kPyP0xs/k5hgBDOo6PIH5EtORRt2qSTXmNW50
         JCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtDT1r8a/evQaC3lDWKPG0TEqFC0uocanKBnyPY6HUU=;
        b=jkUUonX6LGdV7RMFDsrX2TzaGQaRqrQjbWExKeuR2lccSxAXPnqGwaz7NSEihNFqYn
         6pwQPhYzUXl20L4VTS2Wop4nDuM+CoFIwgwPceMpAYO4lgkPxmbSrtVvhUU8mxBsNO3Y
         qMr4rATtDBJCVS+0txWVvhek3/03MtSz9/pswwijZmd8S0mxDf7UkCPh0w+DPNhGGRex
         VoQVY+hQqyo6lwCvc77JVdvEkpNAhUy1g9syf9tgFOEWkWgUogqnQme4lCAhY+QzAW8x
         nfXjSBuYVc6Gudklr5Q3jViNTi1A0GxHJg3AeIbxAUgRKH9C/AHl0LHUjuXowM4x9wn4
         ZPaw==
X-Gm-Message-State: ANoB5pmGTZIZQOdMrSvWCPpc0r3PxLeZNx97OgwsZzUhJMemlzL6qtWJ
	+rR94QgHzqQSmb2S3hsg8DeO9en/w4BsDSsYmOk=
X-Google-Smtp-Source: AA0mqf75pvyzdFCxIEFgeC1lCl+5+OPNlnRd4WZibzih87QuK2OwK4PFOej/2ZKltsN1ZPBF/GSPUzlOziy7d+c6Nqs=
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id
 c6-20020a056512074600b004a24f74f47cmr28295905lfs.367.1670343010696; Tue, 06
 Dec 2022 08:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20221201190248.175753-1-raj.khem@gmail.com> <20221201190248.175753-3-raj.khem@gmail.com>
 <172CC0ECD8B86688.27320@lists.openembedded.org> <CANNYZj9WLFJ7WvKsutsSc702Of2f6j8fyZvJD11g5Bfkyeb+fA@mail.gmail.com>
 <4ed4c85070809d440fcfbbe421a911fe2f3fa524.camel@linuxfoundation.org>
In-Reply-To: <4ed4c85070809d440fcfbbe421a911fe2f3fa524.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Dec 2022 17:09:58 +0100
Message-ID: <CANNYZj8cvEDo+z+3ga27+SKktgLsN84g-qA2PpfqGY4NRBhtWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] btrfs-tools: Do not use 64bit functions for
 largefile support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 16:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174326

On Tue, 6 Dec 2022 at 16:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm worried the mdadm upstream isn't very active so that one, whilst
> submitted, may take a while.

There's a steady amount of new commits here:
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/log/
so I'd send directly to the person committing them (Jes Sorensen
<jsorensen@fb.com>), and cc: maillist.

Alex

