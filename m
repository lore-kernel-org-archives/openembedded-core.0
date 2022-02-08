Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5116FC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 14:16:27 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.11685.1644329786313245376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 06:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J/3oRZA/;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id e3so17063424wra.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 06:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7GsWEhcRkhY31kGz+725qbNBPcO2aL5OGX0kZaYSImw=;
        b=J/3oRZA//lVkaYQW4FWYOvOpDJDYCzSAQmk6YCAWI2pW6+qoUzp4l5mBqyG5WZSRcc
         8cCwGZWScNpqJbyVhjBYxOW9cJmv0wu8i50BR0cKdPrn5P2o2i/mbc0g39z1SoEryjct
         Fj0Fw4VALKP5iZ0M68rjqfjfyvw3yXH2SH4uEPaiupRuqD8VojgCxgfgmqbvxFB62BgI
         JTEB/3gz13YKiSASpLoup0tttwKz9ciD+Wj0IlrbYq7MfIP6mlCyv0G43pbX0lBkV5us
         ND4/sCTPjflLS4FnpV0TsBf8ytJWovjU+WLrW1/RfK+0yVt8UIMYJMUKOm54xUtDIiw/
         KUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7GsWEhcRkhY31kGz+725qbNBPcO2aL5OGX0kZaYSImw=;
        b=NU7OCj1S/jNhdBBd2Ad22jtCKhZ1agYRwS+zAhAbrjt59Xz4HZmAlxHUPTwMyeD1TG
         ra2Z7cVCchO5R73HOK6/2C0lHUAz8o3zCd9EIDkVo5ACATLmpK0pio7Tx+LsdjZFbagv
         Y3VnJD/L4yB799W0B81KD0LfgbxEOJWtxRfVyeNp4IcFBUpNp2DPL/z5WwIv1W/GJSh/
         ir5sKupqg2emAbzS2KZeXQA18JHxZ4PWs12kYrxMdW0UBZDzN2JxyH+9xUhSvR4GczDd
         plt0AB3rFu4BQUZpNQVghKa3fPnV1esBRyFlE1OxeKKJE3jvS6SgzllCFdmMKt19zXK/
         HJhA==
X-Gm-Message-State: AOAM532O1FXkUYtyl4lp+wwmDNnUaP2PELqo5DXqder60tF7MmNMfOR2
	AjiBz6AnEq5GhkwpcV2Oo0pZI8PjvaNeN0jedtw=
X-Google-Smtp-Source: 
 ABdhPJwzkPJ+lkfZZ46BPCtVevrLZ2W+GT1iVchuQgbmTXoL5iqhwjkaO5OZ+00xS8PMBKP4MOVHUf5Yl9EJ+JNimNI=
X-Received: by 2002:adf:f2c3:: with SMTP id d3mr3751362wrp.48.1644329784684;
 Tue, 08 Feb 2022 06:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20220207192915.70095-1-saul.wold@windriver.com>
 <2e636f2e-dba9-e336-8060-9e8cce40cedb@gmail.com>
 <dc177cfd-50c2-33e2-bd3c-b33d65ee35@spiteful.org>
 <2518421.NRruQZ00Rg@monster>
In-Reply-To: <2518421.NRruQZ00Rg@monster>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 8 Feb 2022 08:16:13 -0600
Message-ID: 
 <CAJdd5GbUdbP89FCE60P8d=FGphE5GxpFxvfpgLpDBuYPs_R9nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] create-spdx: Get SPDX-License-Identifier
 from source
To: Jan-Simon Moeller <dl9pf@gmx.de>
Cc: "OE Core (openembedded-core@lists.openembedded.org)"
 <openembedded-core@lists.openembedded.org>,
	Scott Murray <scott.murray@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 14:16:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161510

On Tue, Feb 8, 2022 at 7:19 AM Jan-Simon Moeller <dl9pf@gmx.de> wrote:
>
> Hi all
>
> > > Can you given an overview of what meta-spdxscanner does? I'm not quite
> > > clear what extra processing would be required here.
> >
> > Jan-Simon can talk to it better, as he's done some dev work on the layer
> > and done tests with it against AGL (and the subsequent Fossology instance
> > experimentation), but AFAIK for the actual scanning scancode-toolkit
> > does pattern matching based license detection, so in theory it'll catch
> > excerpts of or slightly modified versions of the licenses in its
> > database, as opposed to just searching for SPDX-License-Identifier
> > declarations.  If everyone else is happy with the latter, I'm willing to
> > believe I'm offbase in my concerns, but either way I do think the
> > limitations are going to need to be documented so users (and their
> > lawyers) are aware of them.
>
> TLDR: meta-spdxscanner integrates with scanning tools. Either with fossology
> or scancode-tk. An upload to blackduck is also possible meanwhile.
>
> Let's focus on fossology and scancode-tk.
>
> a) fossology
>
> Here we essentially integrate in the task chain and archive the sources after
> patching to upload them to a fossology instance. All the scanning/processing
> happens then on the server and after some time (a lot ! ;) ) we get a SPDX
> report back that we store alongside the package. This is a result of a scan,
> so it might catch licenses of files deep in the source tree that may not be
> declared in the recipe and so on.
>
> Also, fossology offers then a webinterface for manual inspection and review.
> So this is a thorough but quite manual process. More for release work than
> daily or occasional stuff.
>
>
> b) scancode-tk
> scancode on the contrary will run on your host during the build and gather the
> data.  It will write the spdx file out as well.
>
>
> I think for us the interesting part would be to compare e.g. the scancode-tk
> scan from b) with what we have declared in the recipe.

Excellent. Thanks for the synopsis.

Our perspective on all of the SPDX work we've done hasn't been to
necessarily replace or replicate the behavior of these advanced
licensing tools. Instead, we want to supplement them because there is
a lot of information about recipes and packages that is pretty easy
for us to know since we track it as metadata and are the ones actually
*doing* the build. I don't know if we can claim to have a "complete"
view of the SBoM, but I also don't think any single tool can provide a
complete view. The amount of detail you want is going to be driven by
you're requirements and some tools are simply better at providing
different views than others. Our goal has always been to provide what
we can (and especially what is hard for others to discover), and allow
users to supplement with other tools of their choice.

The license scanning may not fall under the "hard to discover" for
others (depending on how integrated they are to scan the build
source), but it's certainly something we *can* provide and can be
quite useful. I would expect that different scanning tools will
generate different results anyway, so as long as we indicate that our
scanning uses a simplistic method, I don't think including it is
necessarily wrong or a bad idea. If you want a more detailed view,
than some other tool should be used to supplement the SBoM.

I'm hopeful that someday our core SPDX work can make it a little
easier on some of these tools so that they can "build" on our existing
framework instead of replicating parts of it.

>
>
> Best,
> JS
>
>
>
>
>
>

