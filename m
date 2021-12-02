Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11B9C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 17:00:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.11143.1638464457108920692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 09:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ezirhqmT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id a18so135010wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 09:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=80CS0qx3Wst4frYA+bz5qv2H84hTaG0BfKcqrBruMHc=;
        b=ezirhqmTSagpMlk/GF8BK5B38sSTKXLbv09+rFdU0jPblmJlT6qI9i9Vk//KtC7SqF
         nMNtKSI2mUXeZ9pneYyDBKUuYNq9ac69bIbniG9B9zj6HNO1SpCUPh7Aabz4MipLwdmV
         MX6lRm62iQLyDWAPEaSjpFKd+krHRmLqta8jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=80CS0qx3Wst4frYA+bz5qv2H84hTaG0BfKcqrBruMHc=;
        b=ZbrhImbIwparySxbfYspmxDYyZD9YuAr1bqlUZxS+I7x8nl+SdC5ub2vuXcv5CIevZ
         me7sV48bTSX2B9JDI0TxSf9XgDv4SUGMzYyizFG/6hAE4TpuRbFlwUKtcx7scYCyz8SW
         YFE3+t4fohnHxIBGcCl3jK2FLbf7dWqVAMqlJPCDtmWtjBHl3BWvXhWc6f9Cwh8pN1wh
         QE8YOb7bZVBMtz2VbxHAS4kWr3zuXJ8jmS9Mua7rL9lStW//VHcgx/a6qbdex+22ubj8
         IUaTjArJDhzIFpB3LGJvusJ/kHPH7mGhiDdrbdl+JdIPFoxtJVbxuQCI/rGhtMJajARb
         2PyA==
X-Gm-Message-State: AOAM532aDn+Pkujj2VSmnNJvyOnh50q3rLJ4Act9CjAg2QopLWMk5Lhp
	o/uneSYTH2XCxqwomOVPTt2MYQ==
X-Google-Smtp-Source: 
 ABdhPJxqr+tf6rEUJ/63/hM+QdemF22Tz/g1OkPxIJY6dvyEWDWKPacXu10TfvPMD56/V9ILBUFAbg==
X-Received: by 2002:a5d:69ca:: with SMTP id
 s10mr15418327wrw.312.1638464455374;
        Thu, 02 Dec 2021 09:00:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51?
 ([2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51])
        by smtp.gmail.com with ESMTPSA id
 j17sm262178wmq.41.2021.12.02.09.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 09:00:54 -0800 (PST)
Message-ID: 
 <41672e9d7423f5c5ef742dd18aa5de0895c5f1ad.camel@linuxfoundation.org>
Subject: Re: [OE-core] Correct way to set DRIDRIVERS and GALLIUMDRIVERS from
 mesa bbappend
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mac@mcrowe.com, Justin Bronder <jsbronder@cold-front.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 02 Dec 2021 17:00:51 +0000
In-Reply-To: <YafZKH9x0nEsSPZL@mcrowe.com>
References: <YaemRcD22hUhkQrq@mcrowe.com>
	 <YafKe4SgTjgGY3IR@ravine.members.linode.com> <YafZKH9x0nEsSPZL@mcrowe.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 17:00:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159095

On Wed, 2021-12-01 at 20:20 +0000, Mike Crowe via lists.openembedded.org wrote:
> On Wednesday 01 December 2021 at 14:18:19 -0500, Justin Bronder wrote:
> > On 01/12/21 16:43 +0000, Mike Crowe via lists.openembedded.org wrote:
> > > I'm building for a specific chip and therefore don't wish to waste time and
> > > electricity building and disk space on the target installing unwanted mesa
> > > drivers. However, mesa.inc contains:
> > > 
> > >  GALLIUMDRIVERS = "swrast"
> > >  GALLIUMDRIVERS:x86-x32 = ""
> > >  GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
> > >  GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
> > > 
> > > and mesa_21.3.0.bb contains:
> > > 
> > >  DRIDRIVERS ??= ""
> > >  DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
> > >  DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"
> > > 
> > > I'm unable to find a way to override these values. Using (for example):
> > 
> > You can use an anonymous python function which runs after parsing.
> > https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#anonymous-python-functions
> > 
> >     python __anonymous () {
> >         d.setVar("DRIDRIVERS", "i965")
> >     }
> 
> Thanks for the suggestion. It solves my problem. However, it seems like
> quite a subversive way to do the sort of external customisation that
> recipes normally support.

I would like to work our how we can improve this situation, I'm just struggling
to see what we should do :/

Cheers,

Richard


