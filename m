Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F37C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 09:12:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.9817.1638954758614369221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WVwscA59;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id q3so2869359wru.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4fEMeJBYqZI8ld3X7lQu9PzOUoWCJJKz6gicSdVfnfQ=;
        b=WVwscA59n1CdU4EcYHa+K1Q6DFVlzVPq5ODT2stS874fw0H61hKHycoIOZAuVw/9O+
         ZhHTc5QumefgMCWrS3SWcoreIW7T+HbK7PaTwSZi3cczyvv3nv9qi/qtCFCkIF0EZzKw
         nfXh8GHujz/Xijtbj2LxFsbPPiTMb2xinYGig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4fEMeJBYqZI8ld3X7lQu9PzOUoWCJJKz6gicSdVfnfQ=;
        b=7MiBGUvA5CnGxd0JxKlewZF0xR95CMvz9U7C8m6D0URj4mglkm2KAobgrv1igZT9Tg
         FTJTILjvDUaucKIdIOy8G/yHc7e7M1+F2W9omQ7GcBleFbxu2I/MktyNlH5duuh1Ntvf
         6NvRDYXZGSMVa2VkWIMD1XQJnuH0zpnRUFO8JmdFy+YE+i3jcLPqltBEfRtp3kyrV3ro
         ogln/wD499ZbdTTDTNHRVTxbd1PrlZr1aL0KOUP59APXeuslFjjOazH+4JnPfq+zTNig
         3nZX3LO0HP4oA3J8rIx+KqteUD16ZiU8llwuOaMk4XLtICg4buDhh1alzZ14yzP1pyQW
         rrBw==
X-Gm-Message-State: AOAM532UKKzKM4Ni9mNe+YOH2dYiVD1imq7ctqUCSr7k+KPfHec2AxrX
	gvs+dt/JO2IZ9BMwqYsOUYTOzw==
X-Google-Smtp-Source: 
 ABdhPJxVu19C3eSjZQfbyp4QpwHDbr90ihPh+IXjwdrx2QOQ+7WcNgbQawrAGIlgKLkjpqMwDrKBug==
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr14815436wrw.141.1638954756778;
        Wed, 08 Dec 2021 01:12:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e1bd:cff7:4306:4546?
 ([2001:8b0:aba:5f3c:e1bd:cff7:4306:4546])
        by smtp.gmail.com with ESMTPSA id
 az4sm5305843wmb.20.2021.12.08.01.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 01:12:36 -0800 (PST)
Message-ID: 
 <dedd57475517425d6802a71fb4d46b804dd5eca7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] recipetool: Set master branch only as
 fallback
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Wed, 08 Dec 2021 09:12:33 +0000
In-Reply-To: <3cda9bd5-1c75-7269-921c-97c1ac6c4fb5@weidmueller.com>
References: 
	<20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <9dd70fe87463e8d9cfa9cb0c612ecbc7bd150b7d.camel@linuxfoundation.org>
	 <3cda9bd5-1c75-7269-921c-97c1ac6c4fb5@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 09:12:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159349

On Wed, 2021-12-08 at 08:45 +0100, Stefan Herbrechtsmeier wrote:
> Hi Richard,
> 
> Am 07.12.2021 um 16:45 schrieb Richard Purdie:
> > On Mon, 2021-12-06 at 09:04 +0100, Stefan Herbrechtsmeier wrote:
> > > From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > > 
> > > The commit 'meta/scripts: Manual git url branch additions (dc53fe75cc)'
> > > sets the branch= parameter too early to master and thereby breaks the
> > > -B/--srcbranch option.
> > > 
> > > ERROR: branch= parameter and -B/--srcbranch option cannot both be specified - use one or the other
> > > 
> > > Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > > ---
> > > 
> > >   scripts/lib/recipetool/create.py | 15 +++++++--------
> > >   1 file changed, 7 insertions(+), 8 deletions(-)
> > 
> > I think something in this series is causing:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2926/steps/14/logs/stdio
> 
> Sorry I missed the adaption of the test test_devtool_add_fetch_git. It 
> doesn't expect a "branch=master" which is wrong.
> 
> - gitsm://git.yoctoproject.org/mraa;branch=master
> ?                                  --------------
> + gitsm://git.yoctoproject.org/mraa

I suspected something like that, thanks.

> I will update my patch series but need some time to test it locally. The 
> devtool test build a lot of recipe on every run because it use a private 
> sstate cache. How does the autobuilder overcome this problem?

The autobuilder doesn't. We stopped devtool using the public shared cache as it
is shared between autobuilder workers and one worker could delete artefacts
whilst another is using them. This caused all kinds of weird races and there
isn't much extra build time from the autobuilder perspective. The autobuilder
never deletes things from the shared cache outside of the timeout cron job which
removes objects that haven't been accessed in a month or so.

> > 
> > (the other selftest builds also failed)
> What do you mean by this?

I mean that we run oe-selftest on 4 different distros and they all failed the
same way so there were four failures in the build and I just pasted a link to
one of them.

Cheers,

Richard


