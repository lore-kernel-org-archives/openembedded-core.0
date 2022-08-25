Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C83C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 11:53:49 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.22848.1661428418392679568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 04:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FIOC/TwH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id n7so24286924wrv.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=XPZ/RSo9FJivnWKgQBKJMjhvTsDXs5yRjvK28ARBwyY=;
        b=FIOC/TwHifhseN9oPtkNWffYOYCaPi50KM6q4Z275SDckOLAxQYXaSWftAoPfEq9SB
         9LYVkf0DZ1GHN/yMjjzMiRRMXOKOptyfpKN1OxaKVZ1bJlos5zm4L3on0NEUkZdWwFHt
         0mi8Q9u2qGDlqratWuQCYunc28KnlcUG7jDUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=XPZ/RSo9FJivnWKgQBKJMjhvTsDXs5yRjvK28ARBwyY=;
        b=H/JWh+rqfnECekqE5cpm16R0pl8AgVhR5L7VtleYoVMDEy8lCYkC0nHXeuQoxrFHG0
         CqUkCTN8oi68ByCdZ4cLBChLkG1xih+v35Pz4O6mUyz5awrGa6m5tk2JofQS+GxAPFj4
         ObYEghcKM1QxdLmkVxlwIMbF6x1UQjrSv8ORZsLtlJHqIo+kqMWfzrtGxlxtT8j1u8VK
         Hvamcf+SgmNRbjC9t4CNJQZhK9ygzxZ7r0Z3pRLC7HJIgoZyMricstd2WDqOAaiwC7Pt
         PUbsGRiVsiGsDbz1KibDZoitbPJaYABh4aR/DRSV4oFmJOSIPl0lhvZ+kzOJiZeBufph
         Sexw==
X-Gm-Message-State: ACgBeo1Dc9VXJ5TVcRU14MDqxVgHPmridyTWXWcFINHSGrQjRiPsF+Yo
	13oQp1mpUFMV3hr/eTcEYfZ3yg==
X-Google-Smtp-Source: 
 AA6agR5aO5uVeZ/QtgXk5+qRatH2DYKqqJD0V9w+SZyEiRs5QzyT7tK8xQWIksjbnn+5L+AGBYsbtg==
X-Received: by 2002:adf:fa8a:0:b0:225:20ab:642b with SMTP id
 h10-20020adffa8a000000b0022520ab642bmr2191081wrr.615.1661428416581;
        Thu, 25 Aug 2022 04:53:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8059:8737:891c:87d?
 ([2001:8b0:aba:5f3c:8059:8737:891c:87d])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c4e0500b003a331c6bffdsm4911893wmq.47.2022.08.25.04.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 04:53:36 -0700 (PDT)
Message-ID: 
 <0e3c6ff17930e446338e75dc4bf6f6d4bf53c166.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] rust: Fix crossbeam-utils for arches
 without atomics
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2022 12:53:35 +0100
In-Reply-To: 
 <CANNYZj91fDezS+i1tdX7zZ1B6M_roVgn3wh5gHyNzkj=rn-BFw@mail.gmail.com>
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj_7Eroqgrf0bJr9ubDWEogOekWm3gYMUxUEO6ERrzBS4g@mail.gmail.com>
	 <6eac7847f432cc60d66c9afba010308818bbbb46.camel@linuxfoundation.org>
	 <CANNYZj91fDezS+i1tdX7zZ1B6M_roVgn3wh5gHyNzkj=rn-BFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 11:53:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169852

On Thu, 2022-08-25 at 13:04 +0200, Alexander Kanavin wrote:
> On Thu, 25 Aug 2022 at 12:59, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The usptreamable version of the patch would probably be something which
> > splits the target names in no_atomics up into components and matched on
> > subsections of it rather than the whole string. My rust isn't really up
> > to doing that though.
> >=20
> > I didn't really want us to maintain a separate list of targets which
> > have atomics issues given it and the list in no_atomics would get out
> > of sync very easily too.
>=20
> But then the same patch needs to be applied to (and maintained
> separately in) librsvg - and everything else that includes a copy of
> crossbeam. Perhaps it's worth to at least make the above suggestion
> about making it upstreamable in the patch commit message?

Yes, I can improve the patch header. I do understand the patch isn't
ideal.

The alternatives are:

* we take my patch
* we break powerpc, mips, armv5, riscv32 and others
* we drop the rust upgrades (the latent problem still exists)
* we rewrite the patch

For me to rewrite the patch, I'll need to learn more rust. I'm sure I
can do that but it will take time and that time is time I can't use for
other things.

I'm hoping that by explaining the issue and documenting it, *someone*
would step up and work out the upstreamable patch. This hasn't worked
well for the rust recipes so far as I've had to do a lot of work to get
them more into shape. I'm hoping the problem was just the shear scale
and now issues are in easier smaller pieces others can/will help. It
will certainly be time before someone else can schedule that in, we
don't have anyone who can do it now.

I will say that I'm really really tired.

I have a ton of autobuilder failures and in order to resolve them I'm
rewriting patches many times over, first to get them to work, then
taking review feedback and people complaining they're not perfect or
don't fix other issues. I have a pile of other problems like this.

I appreciate the desire not to have patches, particularly when they're
as painful as the rust ones are. I appreciate the patch can be improved
and should go upstream. I was hoping to take some time off tomorrow but
it looks like I have other things to do (in reality probably on the
weekend, I need to rework the llvm patches too and both sets take hours
in rebuild time even to test).

Cheers,

Richard

