Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3052C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 08:39:16 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web09.82331.1657010353611081633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 01:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AaG1QIUq;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id j13so436290ljo.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BbMouKkovwIDpvEB+26EfrWHR9TWvqS2kM70eU/B/D8=;
        b=AaG1QIUqCPmgnaiSgpwIqreZ2wOGMMxqYNlIivPALtXQsf9ncLIRZHNHNIGTwR/zww
         fhqXPJtYUIG+mLoi/VNz5y5mYAV7Sy9gJ6L+7D/yq7WI8Daly3H8ivssxCvYJE2B2PX4
         3LMjtgm2UR9uuLesHbGGeA0c8SxJBxcwh7iWbDd8OlcxdrGoScjWm/zP7M+59eonE2Yu
         d7+mPvcgPZPrHjg5yTkNHEf1Wx5Raql6MCBHp9YlQAqtp7mUBQoaHYhK0XqC/Ckg8b4H
         TAymliQbTM3vfOpHcBKD1BzV6Cxx4Ja+6b/E4LTAfWx0x7pGOnNePyl5FmAMBbuebtHl
         Hguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BbMouKkovwIDpvEB+26EfrWHR9TWvqS2kM70eU/B/D8=;
        b=Tj/V/RWppGjoxnU4458tmAvows8VD71pFU95CUITldDu8Hw5KkCzYaOLClciHPIJJC
         5xpMWHghY8DKaHJg2e2Hio1T02w4jJMbBtj5H2xMTP7hrypgYn7mOor21xuufrLjQUmn
         KmekTQxUOyJ5c/cUQJuXQsOQEvWzG+Lg12duO80J0sScAjIGAFXsi/r9gc373wkzYqcr
         u7LuD4/VM8W9wRzybH567sO6qUM+VkrEvWr35pej0yQhasy8MpIZ+FB/qf1m5MypQmxR
         ORH6EGWxKg9xLO2W7XA6WvgI77H2pGLnzWuY2sEBq3iE/Tn+DxBY36fHA7BXPGANepBe
         3gnQ==
X-Gm-Message-State: AJIora9RYApgpNs246kpMWmUH1kbSEwIaNtah3awskwUS9V7cTvdXv/v
	6NzTJgUAOF8V1beCRXsD7SVozAqEjnEd5Q/hY2o=
X-Google-Smtp-Source: 
 AGRyM1tU9Ulq6nAgsy58AQmu3a0mVIS2Y4G9qjws0NDy9u/WhtfU4U4tRwfxlY6gQaMlf4+7tiatzJrbUO4Nvwtgt+w=
X-Received: by 2002:a2e:9882:0:b0:25b:eb1e:8d with SMTP id
 b2-20020a2e9882000000b0025beb1e008dmr19067187ljj.41.1657010351748;
 Tue, 05 Jul 2022 01:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
 <16FEE1E2A731461A.2437@lists.openembedded.org>
In-Reply-To: <16FEE1E2A731461A.2437@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Jul 2022 10:39:00 +0200
Message-ID: 
 <CANNYZj93XZ8UxBzUfPBbu093_kY8B7OyGDm_PCNkbdmb+aRpfw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>,
 Adrian Freihofer <adrian.freihofer@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 08:39:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167642

On Tue, 5 Jul 2022 at 10:34, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> At this point, I have to remind everyone about our harsh reality.
> Which is having lots of core pieces without maintainers:
> https://git.yoctoproject.org/poky/tree/MAINTAINERS.md#n45
>
> Let's focus on adding foundational pieces of layer and configuration
> management in a controlled, testable and tested manner for now. Which
> is what I am trying to do. I think discussing grandiose designs for
> things that try to please everybody is just a bit premature, honestly.

And let me just go ahead and say it, and I understand this may be
upsetting. I'd rather try really hard to completely avoid the
standalone setup tool. That tool, and the way it's just been described
sounds like an invitation to compatibility issues between various tool
versions and the metadata and backends (kas alone has more than 12
config format versions and requires to specify the version
explicitly?) coming from all kinds of places, maintainability issues
(we are already pressed to the limit with many pieces getting no
maintenance), leaky abstractions, not quite covering all of the ways
people want to use it with their existing setups, and overall greatly
increased complexity in a project that is already notorious for it.
I'd rather avoid repeating the story with devtool, which is both more
complex and has less use than what we'd hope for - and has no
maintainer.

Alex

